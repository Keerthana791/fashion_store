package com.fashion_store.dao;

import java.util.List;
import com.fashion_store.model.CartItem;

public interface CartItemDAO {

    List<CartItem> getCartItems(int cartId);

    boolean addItemToCart(CartItem item);

    boolean updateCartItemQuantity(int cartItemId, int quantity);

    boolean removeCartItem(int cartItemId);

    boolean clearCart(int cartId);
}