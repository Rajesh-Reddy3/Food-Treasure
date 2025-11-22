package com.tap.servlet;

import java.io.IOException;

import com.tap.daoimpl.UserDAOImpl;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userName = req.getParameter("userName");
		String password = req.getParameter("password");

		UserDAOImpl userDao = new UserDAOImpl();
		User user = userDao.getUserByUserName(userName);

		HttpSession session = req.getSession();

		if (user != null && password.equals(user.getPassword())) {
			int userId = user.getUserId();
			session.setAttribute("userId", userId);
			if (user.getRole().equals("customer")) {
				resp.sendRedirect("home");
				return;
			} else if (user.getRole().equals("restaurant admin")) {
				resp.sendRedirect("restaurantAdmin");
				return;
			} else if (user.getRole().equals("admin")) {
				resp.sendRedirect("adminDashboard");
				return;
			} else if (user.getRole().equals("delivery partner")) {
				resp.sendRedirect("deliverypartner.jsp");
				return;
			}

		}

		resp.sendRedirect("login.jsp?error=Invalid+credentials");

	}
}
