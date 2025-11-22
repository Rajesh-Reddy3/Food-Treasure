<!-- Cart JSP -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.tap.model.Cart,com.tap.model.CartItems,com.tap.model.Restaurant,com.tap.daoimpl.RestaurantDAOImpl" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Cart</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI', sans-serif;
      background-color: #000000;
      color: #ffffff;
    }

	nav {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 1rem 2rem;
      background-color: orangered;
    }

    .logo {
      font-size: 1.5rem;
      color: white;
      font-weight: bold;
    }

    .nav-links a {
      margin-left: 20px;
      text-decoration: none;
      color: black;
      font-weight: bold;
      transition: color 0.3s;
    }

    .nav-links a:hover {
      color: white;
      border: 0px 0px 3px black;
    }

    .nav-links a.user-link::before {
      content: "\f007";
      font-family: 'Font Awesome 6 Free';
      font-weight: 900;
      margin-right: 8px;
    }

    .nav-left {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .cart-container {
      max-width: 1000px;
      margin: 2rem auto;
      background-color: rgb(39, 37, 36);
      padding: 1.5rem;
      border-radius: 10px;
      box-shadow: 0 0 10px rgb(255, 34, 0);
    }
    
    .item-image-wrapper {
  	  flex-shrink: 0;
	  width: 150px;
	  height: 120px;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  overflow: hidden;
	  border-radius: 10px;
	  margin-right: 20px;
	}
	
	.cart-item {
      display: flex;
	  justify-content: space-between;
	  align-items: center;
	  background-color: #1c1c1c;
	  border-radius: 10px;
	  padding: 1.2rem;
	  border-bottom: 1px solid #ddd;
	  margin-bottom: 1rem;
	  box-shadow: 0 2px 8px rgba(255, 69, 0, 0.3);
	  transition: transform 0.3s;
	}
	
	.cart-item:hover {
	  transform: scale(1.02);
	}
	.item-image {
	  width: 100%;
	  height: 100%;
	  object-fit: cover;
	  border-radius: 10px;
	}

    .cart-title {
      font-size: 1.5rem;
      margin-bottom: 1rem;
      color: orangered;
    }

    .item-details {
      flex: 1;
    }

    .item-name {
      font-weight: bold;
      font-size: 1.2rem;
      margin-bottom: 5px;
    }

    .item-description {
      font-size: 0.9rem;
      color: #666;
      margin-bottom: 5px;
    }

    .item-qty-price {
      display: flex;
      align-items: center;
      gap: 20px;
    }

    .item-price {
      color: green;
      font-weight: bold;
    }
    
    .delete-icon-btn {
	  background: none;
	  border: none;
	  color: red;
	  cursor: pointer;
	  font-size: 1.1rem;
	  transition: color 0.3s ease;
	}
	
	.delete-icon-btn:hover {
	  color: orangered;
	}
    
    @media (max-width: 768px) {
  	.cart-item {
	    flex-direction: column;
	    align-items: center;
	  }
	
	  .item-details {
	    text-align: center;
	  }
	
	  .item-image-wrapper {
	    margin-bottom: 1rem;
	  }
	}
	   
    .quantity-selector {
      display: flex;
      align-items: center;
      gap: 10px;
    }
    
    .quantity-btn {
	  background-color: #222;
	  color: orangered;
	  border: 1px solid orangered;
	  padding: 5px 10px;
	  border-radius: 4px;
	  font-weight: bold;
	  transition: all 0.3s ease;
	}
	
	.quantity-btn:hover {
	  background-color: orangered;
	  color: white;
	}

    .cart-summary {
      text-align: right;
      margin-top: 2rem;
      margin-left: 20px;
  	  margin-bottom: 30px;
    }
    
    @media (max-width: 600px) {
	  .btn {
	    width: 100%;
	    margin: 10px 0;
	  }
	}
    
    .total-price {
      font-size: 1.4rem;
      font-weight: bold;
      color: orangered;
      
    }
    
    .add-more-items {
	  margin-top: 2rem;
	  text-align: center;
	}
	
	.add-items-btn {
	  display: inline-block;
	  background-color: orangered;
	  color: white;
	  padding: 10px 20px;
	  font-weight: 600;
	  text-decoration: none;
	  border-radius: 5px;
	  transition: background-color 0.3s ease, transform 0.2s ease;
	  box-shadow: 0 0 8px rgba(255, 69, 0, 0.4);
	}
	
	.add-items-btn i {
	  margin-right: 8px;
	}
	
	.add-items-btn:hover {
	  background-color: black;
	  color: orangered;
	  transform: scale(1.05);
	  border: 1px solid orangered;
	}
	
    .checkout-btn {
      padding: 10px 20px;
      background-color: orangered;
      color: white;
      border: none;
      cursor: pointer;
      font-size: 1rem;
      border-radius: 5px;
      margin-top: 1rem;
      margin-left: 2rem;
    }

    .checkout-btn:hover {
      background-color: black;
      color: orangered;
      border: 1px solid orangered;
    }
  </style>
</head>
<body>
  <nav>  
    <div class="nav-left">
      <div class="logo">FoodTreasure</div>
    </div>
    <div class="nav-links">
      <a href="home">Home</a>
      <a href="order">Orders</a>
      <a href="cart"><i class="fas fa-shopping-cart"></i> Cart</a>
      <a href="login.jsp" class="user-link">Logout</a>
    </div>
  </nav>

  <div class="cart-container">
    <div class="cart-title">Your Order</div>

    <!-- Cart Item -->
    <%
      Cart cart = (Cart) session.getAttribute("cart");	
      Integer restaurantId = (Integer) session.getAttribute("restaurantId");
      if (cart != null && !cart.getItems().isEmpty()) {
          for (CartItems item : cart.getItems().values()) {
    %>
    <div class="cart-item">
      <div class="item-details">
      	<div class="item-image-wrapper">
      		<img src="<%= item.getImagePath() %>" alt="<%= item.getName() %>" class="item-image" />
      	</div>
        <div class="item-name"><%= item.getName() %></div>
        <div class="item-description"><%= item.getDescription() %></div>
        
        <form action="cart" method="post" style="display: inline;">
          <input type="hidden" name="menuId" value="<%= item.getMenuId() %>" />
          <input type="hidden" name="restaurantId" value="<%= restaurantId %>" />
		  <input type="hidden" name="action" value="remove" />
		  <button type="submit" class="delete-icon-btn">
		    <i class="fas fa-trash"></i>
		  </button>
		</form>
        
        <div class="item-price"><%= item.getPrice() * item.getQuantity() %></div>
      </div>
      <div class="item-qty-price">
        <div class="quantity-selector">
        	<!-- INCREMENT -->
	        <form action="cart" method="post" style="display: inline;">
			  <input type="hidden" name="menuId" value="<%= item.getMenuId() %>" />
			  <input type="hidden" name="action" value="update" />
			  <input type="hidden" name="quantity" value="<%= item.getQuantity() + 1 %>" />
			  <button type="submit" class="quantity-btn">+</button>
			</form>
			
			<span><%= item.getQuantity() %></span>
		
			<!-- DECREMENT -->
			<form action="cart" method="post" style="display: inline;">
			  <input type="hidden" name="menuId" value="<%= item.getMenuId() %>" />
			  <input type="hidden" name="action" value="update" />
			  <input type="hidden" name="quantity" value="<%= item.getQuantity() - 1 %>" />
			  <button type="submit" class="quantity-btn">−</button>
			</form>
	  	</div>
      </div>
    </div>  
    <%
          }
      } else {
    %>
    <div>Your cart is empty.</div>
    <%
      }
    %>
  	
  </div>
  <div class="cart-summary">
   <div class="add-more-items">
  <a href="menu?restaurantId=<%= session.getAttribute("restaurantId") %>" class="add-items-btn">
    <i class="fas fa-plus-circle"></i> Add More
  </a>
</div>
    <div class="total-price">Grand Total: 
      <%= (cart != null) ? cart.getTotalPrice() : 0 %>
    </div>
   
    
    <%
      if (cart != null && !cart.getItems().isEmpty()) {
    %>
    <form action="checkout.jsp" method="get">
      <button type="submit" class="checkout-btn">Proceed to checkout</button>
    </form>
    <%
      }
    %>
  </div>
  
  
  	
</body>
</html>
