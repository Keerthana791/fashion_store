package com.fashion_store.dao;

import java.util.List;
import com.fashion_store.model.OrderItem;

public interface OrderItemDAO {

    boolean addOrderItem(OrderItem item);

    List<OrderItem> getItemsByOrderId(int orderId);
}