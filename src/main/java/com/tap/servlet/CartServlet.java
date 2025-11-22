package com.tap.servlet;

import java.io.IOException;

import com.tap.daoimpl.MenuDAOImpl;
import com.tap.model.Cart;
import com.tap.model.CartItems;
import com.tap.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		Cart cart = (Cart) session.getAttribute("cart");

		String restaurantIdParam = req.getParameter("restaurantId");

		Integer currentRestaurantId = (Integer) session.getAttribute("restaurantId");

		if (restaurantIdParam != null) {
			int newRestaurantId = Integer.parseInt(restaurantIdParam);
			if (currentRestaurantId == null || !currentRestaurantId.equals(newRestaurantId)) {
				cart = new Cart();
				session.setAttribute("cart", cart);
				session.setAttribute("restaurantId", newRestaurantId);
			}
		}

		// If no cart in session, initialize new cart
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		String action = req.getParameter("action");
		if (action == null) {
			action = "";
		}

		if (action.equalsIgnoreCase("add")) {
			addItemToCart(req, cart);
		} else if (action.equalsIgnoreCase("update")) {
			updateItemInCart(req, cart);
		} else if (action.equalsIgnoreCase("remove")) {
			removeCartItem(req, cart);
		}

		resp.sendRedirect("cart.jsp");
	}

	private void addItemToCart(HttpServletRequest req, Cart cart) {
		int menuId = Integer.parseInt(req.getParameter("menuId"));
		int quantity = 1; // default quantity = 1
		String qtyParam = req.getParameter("quantity");
		if (qtyParam != null) {
			try {
				quantity = Integer.parseInt(qtyParam);
			} catch (NumberFormatException e) {
				quantity = 1; // fallback
			}
		}

		MenuDAOImpl menuDao = new MenuDAOImpl();
		Menu menu = menuDao.getMenu(menuId);

		if (menu != null) {
			CartItems cartItem = new CartItems(menuId, menu.getRestaurantId(), menu.getItemName(), quantity,
					menu.getDescription(), menu.getImagePath(), menu.getPrice());

			cart.addItem(cartItem);

			System.out.println("Added to cart: " + cartItem);
		}
	}

	private void updateItemInCart(HttpServletRequest req, Cart cart) {
		int menuId = Integer.parseInt(req.getParameter("menuId"));
		int quantity = Integer.parseInt(req.getParameter("quantity"));

		cart.updateItem(menuId, quantity);

	}

	private void removeCartItem(HttpServletRequest req, Cart cart) {
		int menuId = Integer.parseInt(req.getParameter("menuId"));
		cart.deleteItem(menuId);

	}
}
