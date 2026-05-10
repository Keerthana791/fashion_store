package com.fashion_store.util;

import java.util.List;

import com.fashion_store.dao.ProductDAO;
import com.fashion_store.dao.impl.ProductDAOImpl;
import com.fashion_store.model.Product;

public class TestDAO {

    public static void main(String[] args) {

        ProductDAO productDAO = new ProductDAOImpl();

        // 🔹 Test: Get all products
        List<Product> products = productDAO.getAllProducts();

        System.out.println("---- Product List ----");

        for (Product p : products) {
            System.out.println(p.getProductId() + " | " + p.getName() + " | ₹" + p.getPrice());
        }

        // 🔹 Test: Get product by ID
        Product product = productDAO.getProductById(1);

        if (product != null) {
            System.out.println("\nSingle Product:");
            System.out.println(product.getName());
        } else {
            System.out.println("Product not found");
        }
    }
}