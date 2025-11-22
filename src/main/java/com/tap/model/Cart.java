package com.tap.model;

import java.util.HashMap;

public class Cart {

    private HashMap<Integer, CartItems> map = new HashMap<>();

    public void addItem(CartItems cartItem) {
        int menuId = cartItem.getMenuId();
        if (map.containsKey(menuId)) {
            CartItems existingCartItem = map.get(menuId);
            existingCartItem.setQuantity(existingCartItem.getQuantity() + cartItem.getQuantity());
        } else {
            map.put(menuId, cartItem);
        }
        System.out.println("Added menuId to cart: " + menuId + " , CartItem: " + cartItem);
    }

    public void updateItem(int menuId, int quantity) {
        if (map.containsKey(menuId)) {
            if (quantity <= 0) {
                map.remove(menuId);
            } else {
                map.get(menuId).setQuantity(quantity);
            }
        }
    }

    public void deleteItem(int menuId) {
        map.remove(menuId);
        System.out.println("Deleted menuId from cart: " + menuId);
    }

    public HashMap<Integer, CartItems> getItems() {
        return map;
    }

    public double getTotalPrice() {
        double total = 0;
        for (CartItems item : map.values()) {
            total += item.getPrice() * item.getQuantity();
        }
        return total;
    }

    public void clear() {
        map.clear();
    }
}
