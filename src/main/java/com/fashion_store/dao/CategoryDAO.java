package com.fashion_store.dao;

import java.util.List;
import com.fashion_store.model.Category;

public interface CategoryDAO {

    List<Category> getAllCategories();

    Category getCategoryById(int categoryId);
}