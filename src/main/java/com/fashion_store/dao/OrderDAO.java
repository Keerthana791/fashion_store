package com.fashion_store.dao;

import java.util.List;
import com.fashion_store.model.Order;

public interface OrderDAO {
    int createOrder(Order order);  // returns generated orderId, -1 on failure
    Order getOrderById(int orderId);
    List<Order> getOrdersByUserId(int userId);
    boolean updateOrderStatus(int orderId, String status);
}