
//Menu Servlet

package com.tap.servlet;

import java.io.IOException;
import java.util.List;

import com.tap.daoimpl.MenuDAOImpl;
import com.tap.daoimpl.RestaurantDAOImpl;
import com.tap.model.Menu;
import com.tap.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int rId = Integer.parseInt(req.getParameter("restaurantId"));
		RestaurantDAOImpl rdao = new RestaurantDAOImpl();
		Restaurant restaurant = rdao.getRestaurant(rId);

		MenuDAOImpl mdao = new MenuDAOImpl();
		List<Menu> allMenusOfRestaurant = mdao.getAllMenusOfRestaurant(rId);

		for (Menu menu : allMenusOfRestaurant) {
			System.out.println(menu);
		}

		req.setAttribute("restaurant", restaurant);
		req.setAttribute("allMenusOfRestaurant", allMenusOfRestaurant);
		RequestDispatcher rd = req.getRequestDispatcher("menu.jsp");
		rd.forward(req, resp);
	}
}
