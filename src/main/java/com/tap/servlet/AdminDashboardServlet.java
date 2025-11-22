package com.tap.servlet;

import com.tap.daoimpl.UserDAOImpl;
import com.tap.daoimpl.RestaurantDAOImpl;
// import your OrderDAOImpl if exists

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String view = req.getParameter("view");

        UserDAOImpl userDao = new UserDAOImpl();
        RestaurantDAOImpl restaurantDao = new RestaurantDAOImpl();
        
        if ("users".equals(view)) {
            List users = userDao.getAllUsers();
            req.setAttribute("userList", users);
        } else if ("restaurants".equals(view)) {
            List restaurants = restaurantDao.getAllRestaurant();
            req.setAttribute("restaurantList", restaurants);
        } 
        req.getRequestDispatcher("admindashboard.jsp").forward(req, resp);
    }
}
