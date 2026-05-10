package com.fashion_store.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.fashion_store.dao.ProductVariantDAO;
import com.fashion_store.model.ProductVariant;
import com.fashion_store.util.DBConnection;

public class ProductVariantDAOImpl implements ProductVariantDAO {

    @Override
    public List<ProductVariant> getVariantsByProductId(int productId) {

        List<ProductVariant> variants = new ArrayList<>();

        String query = "SELECT * FROM product_variants WHERE product_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, productId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    ProductVariant variant = new ProductVariant();

                    variant.setVariantId(rs.getInt("variant_id"));
                    variant.setProductId(rs.getInt("product_id"));
                    variant.setSize(rs.getString("size"));
                    variant.setColor(rs.getString("color"));
                    variant.setStockQuantity(rs.getInt("stock_quantity"));

                    variants.add(variant);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return variants;
    }

    @Override
    public ProductVariant getVariantById(int variantId) {

        ProductVariant variant = null;

        String query = "SELECT * FROM product_variants WHERE variant_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, variantId);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    variant = new ProductVariant();

                    variant.setVariantId(rs.getInt("variant_id"));
                    variant.setProductId(rs.getInt("product_id"));
                    variant.setSize(rs.getString("size"));
                    variant.setColor(rs.getString("color"));
                    variant.setStockQuantity(rs.getInt("stock_quantity"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return variant;
    }

    @Override
    public ProductVariant getVariantByAttributes(int productId, String size, String color) {

        ProductVariant variant = null;

        String query = "SELECT * FROM product_variants WHERE product_id = ? AND size = ? AND color = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, productId);
            ps.setString(2, size);
            ps.setString(3, color);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    variant = new ProductVariant();

                    variant.setVariantId(rs.getInt("variant_id"));
                    variant.setProductId(rs.getInt("product_id"));
                    variant.setSize(rs.getString("size"));
                    variant.setColor(rs.getString("color"));
                    variant.setStockQuantity(rs.getInt("stock_quantity"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return variant;
    }

    @Override
    public boolean updateStock(int variantId, int quantity) {

        String query = "UPDATE product_variants SET stock_quantity = ? WHERE variant_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, quantity);
            ps.setInt(2, variantId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}