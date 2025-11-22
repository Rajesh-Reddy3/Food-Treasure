package com.tap.servlet;

import java.io.IOException;

import com.tap.daoimpl.UserDAOImpl;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String userName = req.getParameter("userName");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		String phoneNumber =req.getParameter("phoneNumber");
		String address = req.getParameter("address");
		String role = req.getParameter("role");
		
		User user = new User(name, userName, password, email, phoneNumber, address, role);
		
		UserDAOImpl impl = new UserDAOImpl();
		impl.addUser(user);
		
		
		resp.sendRedirect("login.jsp?message=Registration%20successful");

		
	}
}
