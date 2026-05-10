package com.fashion_store.controller;

import com.fashion_store.dao.ProductDAO;
import com.fashion_store.dao.ProductVariantDAO;
import com.fashion_store.dao.impl.ProductDAOImpl;
import com.fashion_store.dao.impl.ProductVariantDAOImpl;
import com.fashion_store.model.Product;
import com.fashion_store.model.ProductVariant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/product-details")
public class ProductDetailsServlet extends HttpServlet {

    private ProductDAO        productDAO        = new ProductDAOImpl();
    private ProductVariantDAO productVariantDAO = new ProductVariantDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");

        if (idParam == null || idParam.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/products");
            return;
        }

        try {
            int productId = Integer.parseInt(idParam);
            Product product = productDAO.getProductById(productId);

            if (product == null) {
                response.sendRedirect(request.getContextPath() + "/products");
                return;
            }

            List<ProductVariant> variants = productVariantDAO.getVariantsByProductId(productId);

            request.setAttribute("product", product);
            request.setAttribute("variants", variants);

            request.getRequestDispatcher("/WEB-INF/views/product-details.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/products");
        }
    }
}
