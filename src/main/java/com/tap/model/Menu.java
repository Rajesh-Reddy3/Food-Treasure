package com.tap.model;

public class Menu {


	private int restaurantId;
	private int menuId;
	private String itemName;
	private String description;
	private int price;
	private String isAvailable;
	private float rating;
	private String imagePath;


	public Menu() {

	}


	public Menu(int restaurantId, int menuId, String itemName, String description, int price, String isAvailable, float rating,
			String imagePath) {
		
		this.restaurantId = restaurantId;
		this.menuId = menuId;
		this.itemName = itemName;
		this.description = description;
		this.price = price;
		this.isAvailable = isAvailable;
		this.rating = rating;
		this.imagePath = imagePath;
	}



	public Menu(int menuId, String itemName, String description, int price, String isAvailable,
		float rating) {
		
		this.menuId = menuId;
		this.itemName = itemName;
		this.description = description;
		this.price = price;
		this.isAvailable = isAvailable;
		this.rating = rating;
	}

	public Menu(int restaurantId, int menuId, String itemName, String description, int price, String isAvailable,
			float rating) {
		
		this.restaurantId = restaurantId;
		this.menuId = menuId;
		this.itemName = itemName;
		this.description = description;
		this.price = price;
		this.isAvailable = isAvailable;
		this.rating = rating;
	}

	public Menu(int menuId, String itemName, String description, int price, String isAvailable, float rating,
			String imagePath) {
		
		this.menuId = menuId;
		this.itemName = itemName;
		this.description = description;
		this.price = price;
		this.isAvailable = isAvailable;
		this.rating = rating;
		this.imagePath = imagePath;
	}

	public Menu(String itemName, String description, int price, String isAvailable, float rating,
			String imagePath) {
		this.itemName = itemName;
		this.description = description;
		this.price = price;
		this.isAvailable = isAvailable;
		this.rating = rating;
		this.imagePath = imagePath;
	}


	public int getMenuId() {
		return menuId;
	}
	
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}

	public int getRestaurantId() {
		return restaurantId;
	}


	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}


	public String getItemName() {
		return itemName;
	}


	public void setItem_name(String itemName) {
		this.itemName = itemName;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public String getIsAvailable() {
		return isAvailable;
	}


	public void setIsAvalible(String isAvailable) {
		this.isAvailable = isAvailable;
	}


	public float getRating() {
		return rating;
	}


	public void setRatings(float rating) {
		this.rating = rating;
	}


	public String getImagePath() {
		return imagePath;
	}


	public void setImagepath(String imagePath) {
		this.imagePath = imagePath;
	}


	@Override
	public String toString() {
		return "Menu [Item Name: " +itemName+" Price : "+price+" isAvailable : "+isAvailable+" ]";
	}




}
