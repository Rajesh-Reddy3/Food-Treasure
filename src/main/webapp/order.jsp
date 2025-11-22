<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.tap.model.Order,com.tap.daoimpl.OrderDAOImpl,com.tap.model.User,com.tap.model.OrderItem,com.tap.daoimpl.OrderItemDAOImpl,com.tap.daoimpl.UserDAOImpl,java.util.List,com.tap.model.Menu,com.tap.daoimpl.MenuDAOImpl" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Summary</title>
    <style>
        /* Base Layout */
		body {
		    margin: 0;
		    padding: 0;
		    background-color: #000000;
		    font-family: 'Poppins', sans-serif;
		    color: #333;
		}
		
		/* Container Styling */
		.container.order-page {
		    max-width: 700px;
		    margin: 60px auto;
		    padding: 30px;
		    background-color: #222222;
		    border: 2px solid orangered;
		    border-radius: 12px;
		    box-shadow: 0 8px 24px rgba(0, 0, 0, 0.08);
		}
		
		/* Section Title */
		.section-title {
		    font-size: 26px;
		    color: #ff4602;
		    font-weight: 600;
		    margin-bottom: 25px;
		    text-align: center;
		}
		
		/* Order Card Styling */
		.order-card {
		    background-color: #343333;
		    color: white;
		    border-radius: 10px;
		    padding: 20px 25px;
		    margin-bottom: 25px;
		    box-shadow: 10px 4px 16px rgba(255, 255, 255, 0.06);
		}
		
		.order-item {
		    display: flex;
		    justify-content: space-between;
		    font-size: 17px;
		    margin-bottom: 12px;
		}
		
		.item-name {
		    flex: 2;
		}
		
		.item-qty {
		    flex: 1;
		    text-align: center;
		}
		
		.item-price {
		    flex: 1;
		    text-align: right;
		}
		
		/* Divider */
		.divider {
		    border: none;
		    border-top: 1px solid #ddd;
		    margin: 15px 0;
		}
		
		/* Total Section */
		.order-total {
		    font-weight: 600;
		    font-size: 18px;
		    color: #ffffff;
		    display: flex;
		    justify-content: space-between;
		    margin-top: 10px;
		}
		
		/* Delivery Info */
		.customer-info {
		    font-size: 16px;
		    color: #c34b27;
		    margin-bottom: 30px;
		    line-height: 1.6;
		    text-align: center;
		}
		
		/* Button Styling */
		.primary-btn {
		    display: inline-block;
		    background-color: #ff4c05;
		    color: white;
		    border: none;
		    padding: 12px 28px;
		    font-size: 16px;
		    font-weight: 500;
		    border-radius: 30px;
		    cursor: pointer;
		    transition: background-color 0.3s ease;
		    text-align: center;
		}
		
		.primary-btn:hover {
		    background-color: #000000;
		    border: 1px solid orangered;
		}
    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

    <div class="container order-page">
        <h2 class="section-title">Order Summary</h2>

	<%
		Integer orderId = (Integer) session.getAttribute("orderId");
	    List<Order> orders = (List<Order>) session.getAttribute("orders");
		System.out.println("Orders printed in order.jsp"+orders);
	    OrderItemDAOImpl orderItemDAO = new OrderItemDAOImpl();
	    for (Order order : orders) {
	    	System.out.println("The order id in order.jsp is "+ order.getOrderId());
	        List<OrderItem> items = orderItemDAO.getOrderItemByOrderId(order.getOrderId());
	        System.out.println("in order.jsp "+order.getOrderId()+" : "+items.size());
	%>
    <div class="order-card">
        <h3 style="color:#ff4602;">Order #<%= order.getOrderId() %></h3>
        <%
        	for (OrderItem item : items) {
	        	System.out.println("Order items printed in order.jsp "+item);
	            MenuDAOImpl menuDAO = new MenuDAOImpl();
	            Menu menu = menuDAO.getMenu(item.getMenuId());
	            System.out.println("Menu details printed in order.jsp "+menu);
	            
        %>
        <div class="order-item">
            <span class="item-name"><%= menu.getItemName() %></span>
            <span class="item-qty">x<%= item.getQuantity() %></span>
            <span class="item-price">₹<%= item.getPrice() %></span>
        </div>
        	<% } %>
        <hr class="divider">
        <div class="order-total">
            <span>Total:</span>
            <span class="total-amount">₹<%= order.getTotalAmount() %></span>
        </div>
        <div class="customer-info">
            <p>Delivering to: <strong><%= order.getAddress() %></strong></p>
            <p>Payment: <strong><%= order.getPaymentMode() %></strong> | Status: <strong><%= order.getStatus() %></strong></p>
        </div>
    </div>
	<% } %>      
        <form action="home"><button class="primary-btn">Back to Home</button></form>
    </div>
</body>
</html>