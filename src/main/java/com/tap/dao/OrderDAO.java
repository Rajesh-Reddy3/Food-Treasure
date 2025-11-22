package com.tap.dao;

import java.util.List;

import com.tap.model.Order;

public interface OrderDAO {

	List<Order> getOrderByUserId(int userId);
	int addOrder(Order order);
}
