package com.fashion_store.controller;

import com.fashion_store.dao.CategoryDAO;
import com.fashion_store.dao.ProductDAO;
import com.fashion_store.dao.impl.CategoryDAOImpl;
import com.fashion_store.dao.impl.ProductDAOImpl;
import com.fashion_store.model.Category;
import com.fashion_store.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

    private ProductDAO  productDAO  = new ProductDAOImpl();
    private CategoryDAO categoryDAO = new CategoryDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String categoryParam = request.getParameter("category");
        String keyword       = request.getParameter("q");
        String maxPriceParam = request.getParameter("maxPrice");
        String sort          = request.getParameter("sort");

        // DEBUG — check Tomcat console
        System.out.println("=== ProductServlet ===");
        System.out.println("category : " + categoryParam);
        System.out.println("keyword  : " + keyword);
        System.out.println("maxPrice : " + maxPriceParam);
        System.out.println("sort     : " + sort);

        List<Category> categories = categoryDAO.getAllCategories();

        // Always use a fresh mutable ArrayList
        List<Product> products = new ArrayList<>();

        // ── 1. Fetch base list ────────────────────────────────────────────────
        if (keyword != null && !keyword.trim().isEmpty()) {
            List<Product> r = productDAO.searchProducts(keyword.trim());
            if (r != null) products = new ArrayList<>(r);
            request.setAttribute("keyword", keyword.trim());

        } else if (categoryParam != null && !categoryParam.trim().isEmpty()) {
            try {
                int categoryId = Integer.parseInt(categoryParam.trim());
                if (categoryId <= 0) {
                    List<Product> r = productDAO.getAllProducts();
                    if (r != null) products = new ArrayList<>(r);
                } else {
                    List<Product> r = productDAO.getProductsByCategory(categoryId);
                    if (r != null) products = new ArrayList<>(r);
                    request.setAttribute("selectedCategoryId", categoryId);
                    Category selected = categoryDAO.getCategoryById(categoryId);
                    if (selected != null)
                        request.setAttribute("selectedCategoryName", selected.getName());
                }
            } catch (NumberFormatException e) {
                List<Product> r = productDAO.getAllProducts();
                if (r != null) products = new ArrayList<>(r);
            }
        } else {
            List<Product> r = productDAO.getAllProducts();
            if (r != null) products = new ArrayList<>(r);
        }

        System.out.println("Products loaded: " + products.size());

        // ── 2. Price filter ───────────────────────────────────────────────────
        if (maxPriceParam != null && !maxPriceParam.trim().isEmpty()) {
            try {
                final double maxPrice = Double.parseDouble(maxPriceParam.trim());
                System.out.println("Applying price filter <= " + maxPrice);

                List<Product> filtered = new ArrayList<>();
                for (Product p : products) {
                    System.out.println("  " + p.getName() + " | price=" + p.getPrice() + " | pass=" + (p.getPrice() <= maxPrice));
                    if (p.getPrice() <= maxPrice) {
                        filtered.add(p);
                    }
                }
                products = filtered;
                System.out.println("After price filter: " + products.size() + " products");
                request.setAttribute("maxPrice", maxPriceParam);

            } catch (NumberFormatException e) {
                System.out.println("Price parse error: " + e.getMessage());
            }
        }

        // ── 3. Sort ───────────────────────────────────────────────────────────
        if (sort != null && !sort.trim().isEmpty()) {
            System.out.println("Sorting by: " + sort);
            switch (sort) {
                case "price_asc":
                    products.sort(Comparator.comparingDouble(Product::getPrice));
                    break;
                case "price_desc":
                    products.sort(Comparator.comparingDouble(Product::getPrice).reversed());
                    break;
                case "name_asc":
                    products.sort(Comparator.comparing(p -> p.getName().toLowerCase()));
                    break;
            }
            request.setAttribute("sort", sort);
        }

        System.out.println("Final count to JSP: " + products.size());

        request.setAttribute("products",   products);
        request.setAttribute("categories", categories);

        request.getRequestDispatcher("/WEB-INF/views/products.jsp").forward(request, response);
    }
}