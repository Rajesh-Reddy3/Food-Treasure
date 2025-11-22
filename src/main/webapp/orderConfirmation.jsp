<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.tap.model.User,com.tap.daoimpl.UserDAOImpl" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation</title>
    <link rel="stylesheet" href="css/order-confirmation.css">
    <style>
		body {
		    background-color: black;
		}
		.confirmation-container {
		    max-width: 640px;
		    margin: 50px auto;
		    background-color: #1d1c1c; /* consistent with card backgrounds on other JSPs */
		    border-radius: 12px;
		    border: 2px solid orangered;
		    box-shadow: 0 6px 18px rgba(251, 77, 2, 0.08);
		    padding: 35px;
		    text-align: center;
		    font-family: 'Poppins', sans-serif;
		    animation: fadeIn 0.5s ease-out;
		}
		
		.confirmation-title {
		    font-size: 26px;
		    color: orangered; /* same green accent used in buttons or highlights */
		    margin-bottom: 22px;
		    font-weight: 600;
		    letter-spacing: 0.5px;
		}
		
		.order-details {
		    font-size: 17px;
		    color: #ffffff; /* readable neutral tone */
		    line-height: 1.7;
		    margin: 10px 0;
		    padding: 0 12px;
		}
		
		.btn-home {
		    background-color: #fc5000;
		    color: #fff;
		    border: none;
		    padding: 13px 30px;
		    font-size: 15px;
		    font-weight: 500;
		    border-radius: 40px;
		    cursor: pointer;
		    margin-top: 25px;
		    transition: background-color 0.3s ease;
		}
		
		.btn-home:hover {
		    background-color: #000000;
		    border : 2px solid orangered;
		    box-shadow: 0px 5px 8px orangered;
		}
		
		@keyframes fadeIn {
		    from { opacity: 0; transform: translateY(15px); }
		    to { opacity: 1; transform: translateY(0); }
		}
	</style>
</head>
<body>
    <div class="confirmation-container">
        <h2 class="confirmation-title">🎉 Order Confirmed!</h2>
        
        <% 
        	int userId = (int) session.getAttribute("userId");
        	int orderId =(int) session.getAttribute("orderId");
        	UserDAOImpl impl = new UserDAOImpl();
        	User user =impl.getUser(userId);
           
        %>
        
        <p class="order-details">Hi <strong><%= user.getName() %></strong>, your order from <strong>Food Trasure</strong> is on its way!</p>
        <p class="order-details">Estimated delivery: <strong>30 minutes</strong></p>
        <p class="order-details">Order ID: <strong><%= orderId %></strong></p>
        <form action="home"><button class="btn-home">Back to Home</button></form>
    </div>
</body>
</html>