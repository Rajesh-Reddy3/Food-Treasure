package com.tap.dao;

import java.util.List;

import com.tap.model.Restaurant;

public interface RestaurantDAO {
	List<Restaurant> getAllRestaurant();
	Restaurant getRestaurant(int restaurantId);
	int addRestaurant(Restaurant res);
	int updateRestaurant(Restaurant res);
	int deleteRestaurant(int restaurantId);
	List<Restaurant> getRestaurantsByAdminUserId(int adminUserId);
	
}
