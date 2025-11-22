package com.tap.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.MenuDAO;
import com.tap.model.Menu;
import com.tap.util.DBConnection;

public class MenuDAOImpl implements MenuDAO {

		public Connection con;
		public PreparedStatement pstmt;
		public Statement stmt;
		public ResultSet result;
		public int res;
		public String insert = "INSERT INTO `menu` (`restaurantId`, `menuId`, `itemName`, `description`, `price`, `isAvailable`, `rating`) values (?, ? , ? , ? , ? , ? , ?) ";
		public String delete = "DELETE FROM `menu` WHERE `menuId`=?";
		public String selectAll = "SELECT * FROM `menu`";
		public String select = "SELECT * FROM `menu` WHERE `restaurantId`=?";
		public String selectMenu = "SELECT * FROM `menu` WHERE `menuId`=?";
		public String update = "UPDATE `menu` SET `itemName`=?, `price`=?, `isAvailable`=?, `rating`=? WHERE `menuId`=?";
	

		public List<Menu> getAllMenus(){
			List<Menu> list=new ArrayList<>();
			
			try{
				
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				result = stmt.executeQuery(select);
				while(result.next()) {
					int restaurantId = result.getInt("restaurantId");
					int menuId = result.getInt("menuId");
					String itemName = result.getString("itemName");
					String description = result.getString("description");
					int price = result.getInt("price");
					String isAvailable = result.getString("isAvailable");
					float rating = result.getFloat("rating");
					String imagePath =result.getString("imagePath");
					
					Menu menu = new Menu(restaurantId, menuId, itemName, description, price, isAvailable, rating, imagePath);
					
					list.add(menu);
				}	
			}
			
			catch (SQLException e) {
				e.printStackTrace();
			}

			return list;
		}



		public List<Menu> getAllMenusOfRestaurant(int restaurantId) {
			List<Menu> list = new ArrayList<>();
			try{
				
				con = DBConnection.getConnection();
				pstmt = con.prepareStatement(select);
				pstmt.setInt(1, restaurantId);
				result = pstmt.executeQuery();
				while(result.next()) {
					int menuId  = result.getInt("menuId");
					String itemName = result.getString("itemName");
					String description = result.getString("description");
					int price = result.getInt("price");
					String isAvailable = result.getString("isAvailable");
					float rating = result.getFloat("rating");
					String imagePath = result.getString("imagePath");
					Menu menu = new Menu(menuId, itemName, description, price, isAvailable, rating, imagePath);
					list.add(menu);

				}	
			}
			catch (SQLException e) {
				e.printStackTrace();
			}

			return list;

		}
		
		
		public int addMenu(Menu menu) {
			try{
				
				con=DBConnection.getConnection();
				pstmt = con.prepareStatement(insert);
				pstmt.setInt(1, menu.getRestaurantId());
				pstmt.setInt(2, menu.getMenuId());
				pstmt.setString(3, menu.getItemName());
				pstmt.setString(4, menu.getDescription());
				pstmt.setInt(5, menu.getPrice());
				pstmt.setString(6, menu.getIsAvailable());
				pstmt.setFloat(7, menu.getRating());
				
				res = pstmt.executeUpdate();
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
			
			return res;
		}
		
		public int updateMenu(Menu menu) {
			try{
				con=DBConnection.getConnection();
				pstmt = con.prepareStatement(insert);
				pstmt.setString(1, menu.getItemName());
				pstmt.setInt(2, menu.getPrice());
				pstmt.setString(3, menu.getIsAvailable());
				pstmt.setFloat(4, menu.getRating());
				pstmt.setInt(5, menu.getRestaurantId());
				
				res = pstmt.executeUpdate();
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
			
			return res;
		}
		
		public int deleteMenu(int menuId) {
			
			try{
				con = DBConnection.getConnection();
				pstmt=con.prepareStatement(delete);
				pstmt.setInt(1, menuId);
				res = pstmt.executeUpdate();	
			}
			
			
			catch (SQLException e) {
				e.printStackTrace();
			}
			
			return res;
		}



		public Menu getMenu(int menuId) {
			Menu menu = null;
			try{
				
				con = DBConnection.getConnection();
				pstmt = con.prepareStatement(selectMenu);
				pstmt.setInt(1, menuId);
				result = pstmt.executeQuery();
				
				while(result.next()) {
					String itemName = result.getString("itemName");
					String description = result.getString("description");
					int price = result.getInt("price");
					String isAvailable = result.getString("isAvailable");
					float rating = result.getFloat("rating");
					String imagePath =result.getString("imagePath");
					menu = new Menu(itemName, description, price, isAvailable, rating, imagePath);
			
				}	
			}
		
			catch (SQLException e) {
				e.printStackTrace();
			}
			
			return menu;
		}



		


	}

