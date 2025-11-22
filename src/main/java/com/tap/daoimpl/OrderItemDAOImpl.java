package com.tap.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.OrderItemDAO;
import com.tap.model.OrderItem;
import com.tap.util.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO {
	
	private static final String INSERT = "INSERT INTO `orderItem` (`orderId`, `menuId`, `quantity`, `price`, `totalAmount`) VALUES (?, ?, ?, ?, ?)";
	private static final String SELECT_ALL = "SELECT * FROM `orderItem`";
	private static final String SELECT_BY_ORDER_ID = "SELECT * FROM `orderItem` WHERE `orderId`=?";
	private static final String DELETE_BY_ORDER_ITEM_ID = "DELETE FROM `orderItem` WHERE `orderItemId`=?"; // if needed

	@Override
	public List<OrderItem> getAllOrderItems() {
		List<OrderItem> list = new ArrayList<>();
		try (Connection con = DBConnection.getConnection();
			 PreparedStatement pstmt = con.prepareStatement(SELECT_ALL);
			 ResultSet result = pstmt.executeQuery()) {
			
			while (result.next()) {
				int orderItemId = result.getInt("orderItemId");
				int orderId = result.getInt("orderId");
				int menuId = result.getInt("menuId");
				int quantity = result.getInt("quantity");
				double price = result.getDouble("price");
				double totalAmount = result.getDouble("totalAmount");

				OrderItem orderItem = new OrderItem(orderItemId, orderId, menuId, quantity, price, totalAmount);
				list.add(orderItem);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public OrderItem getOrderItemById(int orderItemId) {
		OrderItem orderItem = null;
		String query = "SELECT * FROM `orderItem` WHERE `orderItemId` = ?";
		try (Connection con = DBConnection.getConnection();
			 PreparedStatement pstmt = con.prepareStatement(query)) {
			pstmt.setInt(1, orderItemId);
			try (ResultSet result = pstmt.executeQuery()) {
				if (result.next()) {
					int orderId = result.getInt("orderId");
					int menuId = result.getInt("menuId");
					int quantity = result.getInt("quantity");
					double price = result.getDouble("price");
					double totalAmount = result.getDouble("totalAmount");

					orderItem = new OrderItem(orderItemId, orderId, menuId, quantity, price, totalAmount);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderItem;
	}

	@Override
	public List<OrderItem> getOrderItemByOrderId(int orderId) {
		List<OrderItem> list = new ArrayList<>();
		try (Connection con = DBConnection.getConnection();
			 PreparedStatement pstmt = con.prepareStatement(SELECT_BY_ORDER_ID)) {
			
			pstmt.setInt(1, orderId);
			try (ResultSet result = pstmt.executeQuery()) {
				while(result.next()) {
					int orderItemId = result.getInt("orderItemId");
					int menuId = result.getInt("menuId");
					int quantity = result.getInt("quantity");
					double price = result.getDouble("price");
					double totalAmount = result.getDouble("totalAmount");

					OrderItem orderItem = new OrderItem(orderItemId, orderId, menuId, quantity, price, totalAmount);
					list.add(orderItem);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public int addOrderItem(OrderItem orderItem) {
		int res = 0;
		try (Connection con = DBConnection.getConnection();
			 PreparedStatement pstmt = con.prepareStatement(INSERT)) {
			
			pstmt.setInt(1, orderItem.getOrderId());
			pstmt.setInt(2, orderItem.getMenuId());
			pstmt.setInt(3, orderItem.getQuantity());
			pstmt.setDouble(4, orderItem.getPrice());
			pstmt.setDouble(5, orderItem.getTotalAmount());
			
			res = pstmt.executeUpdate();
			System.out.println("Order item added successfully, rows affected: " + res);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}

	// Optional: method to delete an order item by orderItemId
	@Override
	public int deleteOrderItem(int orderItemId) {
		int res = 0;
		try (Connection con = DBConnection.getConnection();
			 PreparedStatement pstmt = con.prepareStatement(DELETE_BY_ORDER_ITEM_ID)) {
			
			pstmt.setInt(1, orderItemId);
			res = pstmt.executeUpdate();
			System.out.println("Order item deleted successfully, rows affected: " + res);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}

	
}
