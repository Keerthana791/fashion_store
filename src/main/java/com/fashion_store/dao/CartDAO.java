package com.fashion_store.dao;

import com.fashion_store.model.Cart;

public interface CartDAO {

    Cart getCartByUserId(int userId);

    boolean createCart(int userId);

    boolean deleteCart(int cartId);
}