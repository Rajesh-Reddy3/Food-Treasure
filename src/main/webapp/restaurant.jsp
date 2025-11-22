<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List,com.tap.model.Restaurant" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Delivery</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
        	margin: 0;
    		padding-top: 90px; /* Prevent overlap with fixed navbar */
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #000;
            color: white;
        }

        /* Nav Bar */
        nav {
		    top: 0;
		    left: 0;
		    width: 100%;
		    padding: 1rem 2rem;
		    z-index: 999;
        	position: fixed;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 1rem;
            background-color: orangered;
        }

        .logo {
            font-size: 1.8rem;
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
            border-radius: 0px 0px 3px black;
        }

        .nav-links a.user-link::before {
            content: "\f007";
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            margin-right: 8px;
        }

        /* Marquee Section */
        
        .marquee-heading h2 {
		    color: orangered;
		    text-align: center;
		    margin-bottom: 1rem;
		    font-weight: 600;
		    font-size: 1.8rem;
		}
		
        .marquee {
        	position: relative;
    		margin-top: 1rem;
            overflow: hidden;
            background-color: #111;
            padding: 1rem 0;
           
        }

        .fixed-images {
            display: flex;
            justify-content: center;
            gap: 20px;
            animation: scroll 20s linear infinite;
            white-space: nowrap;
        }

        .fixed-images img {
            height: 130px;
            border-radius: 10px;
            transition: transform 0.5s, box-shadow 0.3s;
        }

        .fixed-images img:hover {
            transform: scale(1.1);
            box-shadow: 0 0 15px rgb(255, 89, 0);
        }
        
        @keyframes scroll {
            0% { transform: translateX(100%); }
            100% { transform: translateX(-100%); }
        }
        
        /* Search box centered */
		.search-box {
		    position: relative;
		    flex: 1;
		    max-width: 500px;
		    margin: 0 2rem;
		}
		
		.search-box input {
		    width: 100%;
		    padding: 10px 40px 10px 20px;
		    border-radius: 25px;
		    border: none;
		    outline: none;
		    font-size: 16px;
		}
		
		.search-box .fa-search {
		    position: absolute;
		    right: 5px;
		    top: 50%;
		    transform: translateY(-50%);
		    color: #333;
		}

        .search-box input:hover{
            border:2px solid orangered;
        }
        
        /* Restaurant Cards */
        .cards {
		    display: flex;
		    flex-wrap: wrap;
		    gap: 30px;
		    padding: 2rem;
		    justify-content: center;
		    align-items: stretch;
		}
		
		.card {
		    flex: 1 1 280px;
		    max-width: 300px;
		    background-color: #1c1c1c;
		    border: 2px solid orangered;
		    border-radius: 15px;
		    overflow: hidden;
		    display: flex;
		    flex-direction: column;
		    transition: transform 0.3s ease;
		}
		
		.card:hover {
		    transform: translateY(-5px);
		    box-shadow: 0 0 15px rgb(255, 89, 0);
		}
		
		@media (max-width: 600px) {
		  .card {
		    flex: 1 1 90%;
		    max-width: none;
		  }
		}

		.restaurant-img {
		    width: 100%;
		    height: 180px;
		    object-fit: cover;
		}

        .card-content {
            padding: 15px;
            text-align: left;
        }
        
        .favorite-icon {
		  text-align: right;
		  margin-top: 5px;
		  cursor: pointer;
		  color: #999;
		  font-size: 1.2rem;
		}

		.favorite-icon:hover {
		  color: rgb(255, 89, 0);
		}

        .card-content h3,
        .card-content p {
            margin: 5px 0;
        }

        .cart-btn {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px;
            background-color: rgb(255, 89, 0);
            color: black;
            font-weight: bold;
        }

        .cart-btn span {
            display: inline-block;
            width: 25px;
            height: 25px;
            line-height: 25px;
            text-align: center;
            color: rgb(255, 89, 0);
            cursor: pointer;
            user-select: none;
        }
        
        .cart-btn:hover {
		    background-color: #fff;
		    color: orangered;
		    cursor: pointer;
		}
		        
        .card a:link,
		.card a:visited,
		.card a:active {
    		color: inherit;
    		text-decoration: none;
		}
        
        /* Footer */
        footer {
            background-color: #1a1a1a;
            padding: 2rem;
            color: #999;
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
            color: rgb(255, 89, 0);
        }

        footer .social-icons i {
            margin: 0 10px;
            font-size: 20px;
            cursor: pointer;
            color: white;
        }

        footer .social-icons i:hover {
            color: rgb(255, 89, 0);
        }

       @media (max-width: 768px) {
            .nav-links a {
                margin-left: 10px;
                font-size: 14px;
            }

            .search-section .search-box {
                width: 90%;
            }

            .card {
                flex: 1 1 100%;
        	max-width: none;
            }

            .fixed-images {
                flex-direction: row;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav>
        <div class="logo">Food Treasure</div>
        <div class="search-box">
        	<i class="fas fa-search"></i>
            <input type="text" placeholder="Search for restaurants or foods...">  
        </div>
        <div class="nav-links">
            <a href="#">Home</a>
            <a href="order">Orders</a>
            <a href="cart"><i class="fas fa-shopping-cart"></i>Cart</a>
            <a href="login.jsp" class="user-link">Logout</a>
        </div>
    </nav>
    
    <div class="marquee-heading">
	   <h2>Popular Dishes Across India</h2>
	</div>

    <!-- Marquee Images -->
    <div class="marquee">
        <div class="fixed-images">
            <img src="images/fixed1.jpg" alt="Food">
            <img src="images/fixed2.jpg" alt="Food">
            <img src="images/fixed3.jpg" alt="Food">
            <img src="images/fixed4.jpg" alt="Food">
            <img src="images/fixed5.jpg" alt="Food">
            <img src="images/fixed6.jpg" alt="Food">
            <img src="images/fixed7.jpg" alt="Food">
            <img src="images/fixed8.jpg" alt="Food">
            <img src="images/fixed9.jpg" alt="Food">
            <img src="images/fixed10.jpg" alt="Food">
            
            
        </div>
    </div>


    <!-- Restaurant Cards -->
    <div class="cards">    
    <%
		List<Restaurant> restaurant = (List<Restaurant>) request.getAttribute("allRestaurants");
		for(Restaurant res : restaurant){
	%>

	
        <div class="card">
        	<a href="menu?restaurantId=<%= res.getRestaurantId() %>">
            <img src="<%= res.getImagePath() %>" alt="Restaurant" class="restaurant-img">
            <div class="card-content">
            	<div class="favorite-icon">
				  <i class="fas fa-heart"></i>
				</div>
                <h3><%= res.getName() %></h3>
                <p>📍 <%= res.getAddress() %></p>
                <p>⭐ <%= res.getRating() %> | Cusine: <%= res.getCusineType() %></p>
                <p><%= res.getDeliveryTime() %></p>
            </div>
            </a>
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
                <a href="#">Privacy Policy</a>
            </div>
            <div class="social-icons">
                <i class="fab fa-instagram"></i>
                <i class="fab fa-facebook"></i>
                <i class="fab fa-x-twitter"></i>
            </div>
            <p>&copy;All rights reserved.</p>
        </div>
    </footer>
    
    <script>
	  const switcher = document.getElementById("theme-switch");
	  switcher.addEventListener("change", () => {
	    document.body.classList.toggle("light-theme");
	  });
	</script>
	
</body>
</html>