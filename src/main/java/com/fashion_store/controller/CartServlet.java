package com.fashion_store.controller;

import com.fashion_store.dao.CartDAO;
import com.fashion_store.dao.CartItemDAO;
import com.fashion_store.dao.ProductDAO;
import com.fashion_store.dao.impl.CartDAOImpl;
import com.fashion_store.dao.impl.CartItemDAOImpl;
import com.fashion_store.dao.impl.ProductDAOImpl;
import com.fashion_store.model.Cart;
import com.fashion_store.model.CartItem;
import com.fashion_store.model.Product;
import com.fashion_store.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private CartDAO     cartDAO     = new CartDAOImpl();
    private CartItemDAO cartItemDAO = new CartItemDAOImpl();
    private ProductDAO  productDAO  = new ProductDAOImpl();

    // GET: Display cart
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            session = request.getSession();
            session.setAttribute("redirectAfterLogin", request.getContextPath() + "/cart");
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("user");
        Cart cart = cartDAO.getCartByUserId(user.getUserId());

        if (cart == null) {
            // No cart yet — show empty cart
            request.setAttribute("cartItems", new ArrayList<>());
            request.setAttribute("cartTotal", 0.0);
            request.getRequestDispatcher("/WEB-INF/views/cart.jsp").forward(request, response);
            return;
        }

        List<CartItem> items = cartItemDAO.getCartItems(cart.getCartId());

        // Build enriched list with product details and line totals
        List<Map<String, Object>> enrichedItems = new ArrayList<>();
        double total = 0.0;

        for (CartItem item : items) {
            Product product = productDAO.getProductById(item.getProductId());
            if (product != null) {
                Map<String, Object> entry = new HashMap<>();
                entry.put("cartItem", item);
                entry.put("product", product);
                double lineTotal = product.getPrice() * item.getQuantity();
                entry.put("lineTotal", lineTotal);
                total += lineTotal;
                enrichedItems.add(entry);
            }
        }

        request.setAttribute("cartItems", enrichedItems);
        request.setAttribute("cartTotal", total);
        request.setAttribute("cart", cart);

        request.getRequestDispatcher("/WEB-INF/views/cart.jsp").forward(request, response);
    }

    // POST: Add / Update / Remove cart item
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");
        User user     = (User) session.getAttribute("user");

        if ("add".equals(action)) {
            handleAddToCart(request, response, user);
        } else if ("update".equals(action)) {
            handleUpdateQuantity(request, response);
        } else if ("remove".equals(action)) {
            handleRemoveItem(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/cart");
        }
    }

    // ── Add item to cart ───────────────────────────────────────────────────────
    private void handleAddToCart(HttpServletRequest request, HttpServletResponse response, User user)
            throws IOException {

        int    productId = Integer.parseInt(request.getParameter("productId"));
        String size      = request.getParameter("size");
        String color     = request.getParameter("color");
        int    quantity  = Integer.parseInt(request.getParameter("quantity"));

        // Get or create cart
        Cart cart = cartDAO.getCartByUserId(user.getUserId());
        if (cart == null) {
            cartDAO.createCart(user.getUserId());
            cart = cartDAO.getCartByUserId(user.getUserId());
        }

        // Check if same item already in cart
        List<CartItem> existing = cartItemDAO.getCartItems(cart.getCartId());
        CartItem found = null;
        for (CartItem ci : existing) {
            if (ci.getProductId() == productId &&
                ci.getSize().equals(size) &&
                ci.getColor().equals(color)) {
                found = ci;
                break;
            }
        }

        if (found != null) {
            // Update quantity
            cartItemDAO.updateCartItemQuantity(found.getCartItemId(), found.getQuantity() + quantity);
        } else {
            // Add new item
            CartItem item = new CartItem();
            item.setCartId(cart.getCartId());
            item.setProductId(productId);
            item.setSize(size);
            item.setColor(color);
            item.setQuantity(quantity);
            cartItemDAO.addItemToCart(item);
        }

        response.sendRedirect(request.getContextPath() + "/cart");
    }

    // ── Update quantity ────────────────────────────────────────────────────────
    private void handleUpdateQuantity(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
        int quantity   = Integer.parseInt(request.getParameter("quantity"));

        if (quantity <= 0) {
            cartItemDAO.removeCartItem(cartItemId);
        } else {
            cartItemDAO.updateCartItemQuantity(cartItemId, quantity);
        }

        response.sendRedirect(request.getContextPath() + "/cart");
    }

    // ── Remove item ────────────────────────────────────────────────────────────
    private void handleRemoveItem(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
        cartItemDAO.removeCartItem(cartItemId);
        response.sendRedirect(request.getContextPath() + "/cart");
    }
}
		