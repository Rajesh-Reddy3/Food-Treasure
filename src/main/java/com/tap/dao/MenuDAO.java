package com.tap.dao;

import java.util.List;

import com.tap.model.Menu;

public interface MenuDAO {
	List<Menu> getAllMenus();
	List<Menu> getAllMenusOfRestaurant(int restaurantId);
	int addMenu(Menu menu);
	int updateMenu(Menu menu);
	int deleteMenu(int menuId);
	Menu getMenu(int menuId);
	
}


