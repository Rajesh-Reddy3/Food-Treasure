package com.tap.dao;

import java.util.List;

import com.tap.model.User;

public interface UserDAO {

	List<User> getAllUsers();

	User getUser(int id);

	int addUser(User user);

	int updateUser(User user);

	int deleteUser(int id);

	User getUserByUserName(String userName);

}
