package com.tap.dao;

import java.util.List;

import com.tap.model.OrderItem;

public interface OrderItemDAO {

	
	List<OrderItem> getOrderItemByOrderId(int orderId);
	int addOrderItem(OrderItem orderItem);
	int deleteOrderItem(int orderItemId);
	List<OrderItem> getAllOrderItems();
	OrderItem getOrderItemById(int orderItemId);
}
