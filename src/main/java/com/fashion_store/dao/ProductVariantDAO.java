package com.fashion_store.dao;

import java.util.List;
import com.fashion_store.model.ProductVariant;

public interface ProductVariantDAO {

    List<ProductVariant> getVariantsByProductId(int productId);

    ProductVariant getVariantById(int variantId);

    ProductVariant getVariantByAttributes(int productId, String size, String color);

    boolean updateStock(int variantId, int quantity);
}