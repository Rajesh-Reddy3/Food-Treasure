package com.tap.model;

public class Restaurant {

	private int restaurantId;
	private String name;
	private String address;
	private String phoneNumber;
	private String cusineType;
	private String deliveryTime;
	private int adminUserId;
	private float rating;
	private String isActive;
	private String imagePath;
	
	public Restaurant() {
		
	}
	public Restaurant(String name, String address, String phoneNumber, String cusineType, String deliveryTime,
			int adminUserId, float rating, String isActive) {
		super();
		this.name = name;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.cusineType = cusineType;
		this.deliveryTime = deliveryTime;
		this.adminUserId =adminUserId;
		this.rating = rating;
		this.isActive = isActive;
	}
	public Restaurant(int restaurantId, String name, String address, String phoneNumber, String cusineType,
			String deliveryTime, int adminUserId, float rating, String isActive) {
		super();
		this.restaurantId = restaurantId;
		this.name = name;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.cusineType = cusineType;
		this.deliveryTime = deliveryTime;
		this.adminUserId = adminUserId;
		this.rating = rating;
		this.isActive = isActive;
	}
	public Restaurant(int restaurantId, String name, String address, String phoneNumber, String cusineType,
			String deliveryTime, int adminUserId, float rating, String isActive, String imagePath) {
		this.restaurantId = restaurantId;
		this.name = name;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.cusineType = cusineType;
		this.deliveryTime = deliveryTime;
		this.adminUserId = adminUserId;
		this.rating = rating;
		this.isActive = isActive;
		this.imagePath = imagePath;
		
	}
	public int getRestaurantId() {
		return restaurantId;
	}
	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getCusineType() {
		return cusineType;
	}
	public void setCusineType(String cusineType) {
		this.cusineType = cusineType;
	}
	public String getDeliveryTime() {
		return deliveryTime;
	}
	public void setDeliveryTime(String deliveryTime) {
		this.deliveryTime = deliveryTime;
	}
	public int getAdminUserId() {
		return adminUserId;
	}
	public void setAdminUserId(int adminUserId) {
		this.adminUserId = adminUserId;
	}
	public float getRating() {
		return rating;
	}
	public void setRating(float rating) {
		this.rating = rating;
	}
	public String getIsActive() {
		return isActive;
	}
	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagepath) {
		this.imagePath = imagepath;
	}
	@Override
	public String toString() {
		return "Restaurant [restaurantId=" + restaurantId + ", name=" + name + ", address=" + address + ", phoneNumber="
				+ phoneNumber + ", cusineType=" + cusineType + ", rating=" + rating + "]";
	}
	
	
}
