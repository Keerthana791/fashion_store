package com.fashion_store.controller;

import com.fashion_store.dao.CartDAO;
import com.fashion_store.dao.CartItemDAO;
import com.fashion_store.dao.OrderDAO;
import com.fashion_store.dao.ProductDAO;
import com.fashion_store.dao.impl.CartDAOImpl;
import com.fashion_store.dao.impl.CartItemDAOImpl;
import com.fashion_store.dao.impl.OrderDAOImpl;
import com.fashion_store.dao.impl.ProductDAOImpl;
import com.fashion_store.dao.impl.OrderItemDAOImpl;
import com.fashion_store.dao.OrderItemDAO;
import com.fashion_store.model.*;

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

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    private CartDAO      cartDAO      = new CartDAOImpl();
    private CartItemDAO  cartItemDAO  = new CartItemDAOImpl();
    private OrderDAO     orderDAO     = new OrderDAOImpl();
    private OrderItemDAO orderItemDAO = new OrderItemDAOImpl();
    private ProductDAO   productDAO   = new ProductDAOImpl();

    // GET: Show checkout form
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ── SUCCESS PAGE — skip all cart checks ──────────────────────────
        if ("true".equals(request.getParameter("success"))) {
            request.getRequestDispatcher("/WEB-INF/views/checkout.jsp")
                   .forward(request, response);
            return;
        }
        // ─────────────────────────────────────────────────────────────────

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            session = request.getSession();
            session.setAttribute("redirectAfterLogin",
                    request.getContextPath() + "/checkout");
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("user");
        Cart cart = cartDAO.getCartByUserId(user.getUserId());

        if (cart == null) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        List<CartItem> items = cartItemDAO.getCartItems(cart.getCartId());
        if (items.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        // Enrich items for summary
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
        request.setAttribute("user", user);

        request.getRequestDispatcher("/WEB-INF/views/checkout.jsp")
               .forward(request, response);
    }

    // POST: Place order
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("user");
        Cart cart = cartDAO.getCartByUserId(user.getUserId());

        if (cart == null) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        List<CartItem> cartItems = cartItemDAO.getCartItems(cart.getCartId());
        if (cartItems.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        // Collect form fields
        String receiverName  = request.getParameter("receiverName");
        String receiverPhone = request.getParameter("receiverPhone");
        String addressLine   = request.getParameter("addressLine");
        String city          = request.getParameter("city");
        String state         = request.getParameter("state");
        String country       = request.getParameter("country");
        String pincode       = request.getParameter("pincode");
        String paymentMethod = request.getParameter("paymentMethod");

        // Calculate total
        double total = 0.0;
        for (CartItem ci : cartItems) {
            Product p = productDAO.getProductById(ci.getProductId());
            if (p != null) total += p.getPrice() * ci.getQuantity();
        }

        // Build Order
        Order order = new Order();
        order.setUserId(user.getUserId());
        order.setTotalAmount(total);
        order.setStatus("PENDING");
        order.setPaymentMethod(paymentMethod);
        order.setReceiverName(receiverName);
        order.setReceiverPhone(receiverPhone);
        order.setAddressLine(addressLine);
        order.setCity(city);
        order.setState(state);
        order.setCountry(country);
        order.setPincode(pincode);

        // Create order — get generated ID directly
        int newOrderId = orderDAO.createOrder(order);

        if (newOrderId > 0) {
            // Save order items
            for (CartItem ci : cartItems) {
                Product p = productDAO.getProductById(ci.getProductId());
                if (p != null) {
                    OrderItem oi = new OrderItem();
                    oi.setOrderId(newOrderId);
                    oi.setProductId(ci.getProductId());
                    oi.setSize(ci.getSize());
                    oi.setColor(ci.getColor());
                    oi.setQuantity(ci.getQuantity());
                    oi.setPrice(p.getPrice());
                    orderItemDAO.addOrderItem(oi);
                }
            }

            // Clear cart
            cartItemDAO.clearCart(cart.getCartId());

            // Redirect to success page
            response.sendRedirect(request.getContextPath() +
                    "/checkout?success=true&orderId=" + newOrderId);
        } else {
            // Order creation failed
            request.setAttribute("error", "Order placement failed. Please try again.");
            request.getRequestDispatcher("/WEB-INF/views/checkout.jsp")
                   .forward(request, response);
        }
    }
        
}
