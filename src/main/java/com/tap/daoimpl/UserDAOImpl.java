package com.tap.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.UserDAO;
import com.tap.model.User;
import com.tap.util.DBConnection;

	public class UserDAOImpl implements UserDAO {
		private String insert="INSERT INTO `user` (`name`, `userName`, `password`, `email`, `phoneNumber`, `address`, `role`, `createdDate`, `lastLoginDate`) VALUES (?,?,?,?,?,?,?,?,?)";
		private String update="INSERT INTO `user` SET  `name` = ? , `userName`=?, `password`=?, `email`=?, `phoneNumber`=?, `address`=? WHERE `userId`=? ";
		private String select="SELECT * FROM `user` WHERE `userId`=?";
		private String selectAll = "SELECT * FROM `user`";
		private String delete="DELETE FROM `user` WHERE `userId`=?";
		private String selectUsername = "SELECT * FROM `user` WHERE `username` = ?";
		
		public Connection con;
		public PreparedStatement pstmt;
		public Statement stmt;
		public ResultSet result;
		public int res;
		

		@Override
		public List<User> getAllUsers() {
			List<User> list = new ArrayList<>();
			
			try {
				
				con=DBConnection.getConnection();
				pstmt = con.prepareStatement(selectAll);
				result = pstmt.executeQuery();
				while(result.next()) {
					int userId = result.getInt("userId");
					String name = result.getString("name");
					String username = result.getString("userName");
					String pass = result.getString("password");
					String email = result.getString("email");
					String phone = result.getString("phoneNumber");
					String address = result.getString("address");
					String role = result.getString("role");
					Timestamp createdDate = result.getTimestamp("createdDate");
					Timestamp lastLoginDate = result.getTimestamp("lastLoginDate");
					
				User u = new User(userId, name, username, pass, email, phone, address, role, createdDate, lastLoginDate);
				list.add(u);
				
				}
			}
			
			catch(SQLException e) {
				e.printStackTrace();
			} 
			
			
			
			return list;
		}

		@Override
		public User getUser(int id) {
			User u = null;
			
			try {
				con=DBConnection.getConnection();
				pstmt = con.prepareStatement(select);
				pstmt.setInt(1,id);
				result = pstmt.executeQuery();
				while(result.next()) {
					String name = result.getString("name");
					String username = result.getString("userName");
					String pass = result.getString("password");
					String email = result.getString("email");
					String phone = result.getString("phoneNumber");
					String address = result.getString("address");
					String role = result.getString("role");
					Timestamp createdDate = result.getTimestamp("createdDate");
					Timestamp lastLoginDate = result.getTimestamp("lastLoginDate");
					
				u = new User(name, username, pass, email, phone, address, role, createdDate, lastLoginDate);
				}
			}
			
			catch(SQLException e) {
				e.printStackTrace();
			} 
			
			
			
			return u;
		}

		@Override
		public int addUser(User user) {

			try {
				con=DBConnection.getConnection();
				PreparedStatement pstmt = con.prepareStatement(insert);
//				pstmt.setInt(1,user.getUserID());
				pstmt.setString(1, user.getName());
				pstmt.setString(2, user.getUserName());
				pstmt.setString(3, user.getPassword());
				pstmt.setString(4, user.getEmail());
				pstmt.setString(5, user.getPhoneNumber());
				pstmt.setString(6, user.getAddress());
				pstmt.setString(7, user.getRole());
				pstmt.setTimestamp(8, new Timestamp(System.currentTimeMillis()));
				pstmt.setTimestamp(9, new Timestamp(System.currentTimeMillis()));


				res = pstmt.executeUpdate();
			

			} 
			
			catch (SQLException e) {
				e.printStackTrace();
			} 
			

			return res;

		}

		@Override
		public int updateUser(User user) {
			try {
					con=DBConnection.getConnection();
					PreparedStatement pstmt = con.prepareStatement(update);
					pstmt.setString(1, user.getName());
					pstmt.setString(2, user.getUserName());
					pstmt.setString(3, user.getPassword());
					pstmt.setString(4, user.getEmail());
					pstmt.setString(5, user.getPhoneNumber());
					pstmt.setString(6, user.getAddress());
					pstmt.setInt(7,user.getUserId());

					res = pstmt.executeUpdate();
					
				}
			
				catch (SQLException e) {
					e.printStackTrace();
				}
			
			   
			return res;

		}

		@Override
		public int deleteUser(int id) {
			
			try {
				con=DBConnection.getConnection();
				PreparedStatement pstmt = con.prepareStatement(delete);
//				System.out.println("execute");
				pstmt.setInt(1, id);
				
				res = pstmt.executeUpdate();
			}
			
			catch (SQLException e) {
				e.printStackTrace();
			} 
			
			
		return res;

		}
		
		@Override
		public User getUserByUserName(String userName) {
		    User user = null;
		    try {
		        con = DBConnection.getConnection();
		        pstmt = con.prepareStatement(selectUsername);
		        pstmt.setString(1, userName);
		        result = pstmt.executeQuery();
		        if (result.next()) {
		            int userId = result.getInt("userId");
		            String name = result.getString("name");
		            String username = result.getString("userName");
		            String pass = result.getString("password");
		            String email = result.getString("email");
		            String phone = result.getString("phoneNumber");
		            String address = result.getString("address");
		            String role = result.getString("role");
		            Timestamp createdDate = result.getTimestamp("createdDate");
		            Timestamp lastLoginDate = result.getTimestamp("lastLoginDate");

		            user = new User(userId, name, username, pass, email, phone, address, role, createdDate, lastLoginDate);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return user;
		}

		

	}

