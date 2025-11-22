<!-- Menu JSP -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List,com.tap.model.Restaurant,com.tap.model.Menu,com.tap.daoimpl.RestaurantDAOImpl" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Menu</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI', sans-serif;
      background-color: #000;
      color: white;
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

    .restaurant-name {
        color: orangered;
        font-weight: bold;
        font-size: 1.2rem;
    }

    .menu-container {
      padding: 2rem;
    }

    .menu-header {
      text-align: center;
      font-size: 2rem;
      color: orangered;
      margin-bottom: 1rem;
    }

	.menu-section {
	  display: flex;
	  flex-direction: row;
	  align-items: flex-start;
	  gap: 20px;
	  padding: 15px;
	  border-bottom: 1px solid #ccc;
	  margin: 20px;
	  background-color: #111;
	  border-radius: 12px;
	  box-shadow: 0 2px 8px rgba(255, 69, 0, 0.2);
	  transition: transform 0.3s ease, box-shadow 0.3s ease;
	}
	
	.menu-section:hover {
	  transform: scale(1.02);
	  box-shadow: 0 4px 12px rgba(255, 69, 0, 0.4);
	}
	
	.section-title {
	  font-size: 1.8rem;
	  color: orangered;
	  margin: 2rem 0 1rem;
	  border-bottom: 2px solid orangered;
	  padding-bottom: 5px;
	}

    .menu-details {
      display: flex;
      justify-content: flex-end;
      gap: 20px;
    }

    .menu-discription {
      background-color: #1c1c1c;
      border-radius: 10px;
      width: 250px;
      padding: 1rem;
      /* box-shadow: 0 0 8px orangered; */
    }
    
    .menu-image-wrapper {
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
	
	.menu-image {
	  width: 100%;
	  height: 100%;
	  object-fit: cover;
	  border-radius: 10px;
	  border: 2px solid orangered;
  	  box-shadow: 0 0 10px rgba(255, 69, 0, 0.3);
	}

	.menu-description h3 {
	  font-size: 1.4rem;
	  margin-bottom: 8px;
	  font-weight: bold;
	  color: orangered;
	}
	
	.menu-description p {
	  font-size: 0.95rem;
	  line-height: 1.5;
	  margin-bottom: 10px;
	  color: #ccc;
	}
	
	.menu-description p:last-child {
	  font-size: 0.9rem;
	  color: gold;
	  font-weight: bold;
	}
	
	@media (max-width: 768px) {
	  .menu-section {
	    padding: 10px;
	    margin: 10px 0;
	  }
	
	  .menu-description {
	    width: 100%;
	    text-align: center;
	  }
	
	  .menu-image-wrapper {
	    margin-bottom: 10px;
	  }
	}

    .price {
      color: orangered;
      font-weight: bold;
      margin-top: 5px;
    }
    .cart-btn {
  		display: inline-block;
        align-items: center;
        user-select: none;
        line-height: 25px;
        cursor: pointer;
	  	background-color: orangered;
	  	color: white;
		border: none;
		border-radius: 8px;
		padding: 10px 16px;
		font-size: 0.95rem;
		transition: background-color 0.3s ease, color 0.3s ease;
	}
		
	.cart-btn:hover {
		background-color: white;
		color: orangered;
	}

    .cart-btn {
        
    }
    
    .cart-btn: hover {
    	background-color: black;
    	color: rgb(255, 89, 0);
    }

    footer {
      background-color: #1a1a1a;
      padding: 2rem;
      color: #999;
      margin-top: 2rem;
    }

    footer .footer-content {
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 10px;
    }

    footer .footer-links {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 15px;
    }

    footer .footer-links a {
      color: white;
      text-decoration: none;
      font-weight: 500;
    }

    footer .footer-links a:hover {
      color: orangered;
    }

    footer .social-icons i {
      margin: 0 10px;
      font-size: 20px;
      cursor: pointer;
      color: white;
    }

    footer .social-icons i:hover {
      color: orangered;
    }

    @media (max-width: 768px) {
      .menu-items {
        justify-content: center;
      }

      .menu-item {
        width: 90%;
      }
    }
  </style>
</head>
<body>

  <%
	int rId = Integer.parseInt(request.getParameter("restaurantId"));
	RestaurantDAOImpl impl = new RestaurantDAOImpl();
	Restaurant restaurant = impl.getRestaurant(rId);
  %>

  <!-- Navbar -->
  <nav>    
    <div class="nav-left">
      <div class="logo">FoodTreasure</div>
      <div class="restaurant-name">| <%= restaurant.getName() %> </div>
    </div>
    <div class="nav-links">
      <a href="home">Home</a>
      <a href="order">Orders</a>
      <a href="cart.jsp"><i class="fas fa-shopping-cart"></i>Cart</a>
      <a href="login.jsp" class="user-link">User</a>
    </div>
  </nav> 
  
   

  <!-- Menu Content -->
  <div class="menu-container">
    <div class="menu-header">Explore Our Menu</div>
    <%
    	List<Menu> menus = (List<Menu>)request.getAttribute("allMenusOfRestaurant");
    	for(Menu menu : menus) {
    %>
    <div class="menu-section">
    <div class="menu-image-wrapper">
  		<img src="<%= menu.getImagePath() %>" alt="menu image" class="menu-image" />
	</div>
      <div class="menu-details">
        <div class="menu-description">
          <h3><%= menu.getItemName() %></h3>
          <p><%= menu.getDescription() %></p>
          <div class="price">₹<%= menu.getPrice() %>.00</div>
          <p>⭐ <%= menu.getRating() %></p>
          <form action="cart" method="post">
          	<input type="hidden" name="menuId" value="<%= menu.getMenuId() %>">
          	<input type="hidden" name="restaurantId" value="<%= restaurant.getRestaurantId() %>">
          	<input type="hidden" name="quantity" value="1">
          	<input type="hidden" name="action" value="add">
          	<input type="submit" name="submit" value="Add to Cart" class="cart-btn">
          </form>
        </div>
      </div>
    </div>
    <%
    	}
    %>
  </div>

  <!-- Footer -->
  <footer>
    <div class="footer-content">
      <div class="footer-links">
        <a href="#">About</a><span> | </span>
        <a href="#">Careers</a><span> | </span>
        <a href="#">Help & Support</a><span> | </span>
        <a href="#">Terms & Conditions</a><span> | </span>
        <a href="#">Privacy Policy</a><span> | </span>
      </div>
      <div class="social-icons">
        <i class="fab fa-instagram"></i>
        <i class="fab fa-facebook"></i>
        <i class="fab fa-x-twitter"></i>
      </div>
      <p>&copy;All rights reserved.</p>
    </div>
  </footer>
</body>
</html>