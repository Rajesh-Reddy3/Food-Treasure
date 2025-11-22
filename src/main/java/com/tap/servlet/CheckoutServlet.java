package com.tap.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import com.tap.dao.OrderDAO;
import com.tap.dao.OrderItemDAO;
import com.tap.daoimpl.OrderDAOImpl;
import com.tap.daoimpl.OrderItemDAOImpl;
import com.tap.model.Cart;
import com.tap.model.CartItems;
import com.tap.model.Order;
import com.tap.model.OrderItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

	private OrderDAO orderDAO;
	private OrderItemDAO orderItemDAO;
	private OrderItem orderItem;

	@Override
	public void init() throws ServletException {
		orderDAO = new OrderDAOImpl();
		orderItemDAO = new OrderItemDAOImpl();
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		Cart cart = (Cart) session.getAttribute("cart");
		int userId = (int) session.getAttribute("userId");
		int restaurantId = (int) session.getAttribute("restaurantId");

		if (cart != null && userId != 0 && !cart.getItems().isEmpty()) {
			String paymentMode = req.getParameter("paymentMode");
			String address = req.getParameter("address");
			session.setAttribute("address", address);
			String status = "Pending";
			double totalAmount = cart.getTotalPrice();

			Order order = new Order(restaurantId, userId, totalAmount, status, paymentMode, address);

			orderDAO = new OrderDAOImpl();
			int orderId = orderDAO.addOrder(order);

			List<OrderItem> list = new ArrayList<>();

			for (CartItems item : cart.getItems().values()) {
				int menuId = item.getMenuId();
				double price = item.getPrice();
				int quantity = item.getQuantity();
				double totalPrice = price * quantity;

				orderItem = new OrderItem(orderId, menuId, quantity, price, totalPrice);

				orderItemDAO = new OrderItemDAOImpl();
				orderItemDAO.addOrderItem(orderItem);

				list.add(orderItem);

			}

			session.setAttribute("orderItem", list);
			session.setAttribute("orderId", orderId);

			session.removeAttribute("cart");
			resp.sendRedirect("orderConfirmation.jsp");
		}

		else {
			resp.sendRedirect("cart.jsp");
		}
	}
}
