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
import java.util.List;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    private ProductDAO  productDAO  = new ProductDAOImpl();
    private CategoryDAO categoryDAO = new CategoryDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Load all categories for nav / filter bar
        List<Category> categories = categoryDAO.getAllCategories();

        // Load all products (limit featured to first 8 in JSP)
        List<Product> products = productDAO.getAllProducts();

        request.setAttribute("categories", categories);
        request.setAttribute("products", products);

        request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
    }
}
