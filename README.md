# 🍴 Food Treasure

**Food Treasure** is a Java-based online food ordering application where customers can browse restaurants, view menus, add items to carts, and place orders.  
The platform also supports Restaurant Admins, Delivery Partners, and Super Admins with different dashboards and management panels.

---

## 🚀 Features  

### 👤 User Management  
- Secure registration & login system.  
- Role-based dashboards:  
  - Customer → Browse restaurants, order food.  
  - Restaurant Admin → Manage restaurants & menus.  
  - Admin → Admin dashboard for platform monitoring.  
  - Delivery Partner → Delivery orders dashboard.  

### 🍽️ Restaurants & Menus  
- Browse available restaurants with details.  
- View menu items per restaurant.  
- Restaurant Admin: Add/Delete Restaurants, Add/Delete Menu Items.  

### 🛒 Cart & Checkout  
- Add multiple items from a restaurant.  
- Update/remove items in cart.  
- Checkout with COD / UPI / Card payment options.  
- Session-based cart handling (cart resets when switching restaurants).  

### 📦 Orders  
- Place orders with delivery address and payment mode.  
- Automatic generation of order records + order items.  
- Track past orders on customer account.  

---

## 🛠️ Tech Stack  

- Backend: Java, Servlets (Jakarta), JDBC  
- Frontend: JSP, HTML, CSS  
- Database: MySQL (with DAO layer)  
- Architecture: MVC (Servlets → DAOs → Model → JSP)  
- Session Management: HttpSession  

---

## ⚙️ Database Schema

-- Create Database
CREATE DATABASE IF NOT EXISTS foodtreasure;
USE foodtreasure;

-- USERS TABLE
CREATE TABLE Users (
user_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
username VARCHAR(50) UNIQUE NOT NULL,
password VARCHAR(255) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
phone_number VARCHAR(15),
address VARCHAR(255),
role VARCHAR(50) NOT NULL, -- admin, customer, restaurant admin, delivery partner
created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
last_login_date TIMESTAMP NULL
);

-- RESTAURANTS TABLE
CREATE TABLE Restaurants (
restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
address VARCHAR(255) NOT NULL,
phone_number VARCHAR(15),
cuisine_type VARCHAR(50),
delivery_time VARCHAR(50),
admin_user_id INT,
rating FLOAT DEFAULT 0.0,
is_active BOOLEAN DEFAULT TRUE,
image_path VARCHAR(255),
FOREIGN KEY (admin_user_id) REFERENCES Users(user_id)
);

-- MENU TABLE
CREATE TABLE Menu (
menu_id INT PRIMARY KEY AUTO_INCREMENT,
restaurant_id INT NOT NULL,
item_name VARCHAR(100) NOT NULL,
description TEXT,
price DECIMAL(10,2) NOT NULL,
is_available BOOLEAN DEFAULT TRUE,
rating FLOAT DEFAULT 0.0,
image_path VARCHAR(255),
FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

-- CART ITEMS TABLE
CREATE TABLE CartItems (
item_id INT PRIMARY KEY AUTO_INCREMENT,
menu_id INT NOT NULL,
restaurant_id INT NOT NULL,
user_id INT NOT NULL,
name VARCHAR(100) NOT NULL,
quantity INT NOT NULL CHECK (quantity > 0),
description TEXT,
image_path VARCHAR(255),
price DECIMAL(10,2) NOT NULL,
FOREIGN KEY (menu_id) REFERENCES Menu(menu_id)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- ORDERS TABLE
CREATE TABLE Orders (
order_id INT PRIMARY KEY AUTO_INCREMENT,
restaurant_id INT NOT NULL,
user_id INT NOT NULL,
order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
total_amount DECIMAL(10,2) NOT NULL,
status VARCHAR(50) DEFAULT 'PENDING',
payment_mode VARCHAR(20),
address VARCHAR(255),
FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- ORDER ITEMS TABLE
CREATE TABLE OrderItems (
order_item_id INT PRIMARY KEY AUTO_INCREMENT,
order_id INT NOT NULL,
menu_id INT NOT NULL,
quantity INT NOT NULL CHECK (quantity > 0),
price DECIMAL(10,2) NOT NULL,
total_amount DECIMAL(10,2) NOT NULL,
FOREIGN KEY (order_id) REFERENCES Orders(order_id)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (menu_id) REFERENCES Menu(menu_id)
);

---

## 🔑 User Roles  

- Customer – Browse restaurants & menus, add to cart, checkout, track orders.  
- Restaurant Admin – Manage restaurants & menu items.  
- Admin – Oversee platform activities (future enhancements).  
- Delivery Partner – Handle order delivery updates (future enhancements).  

---

## ▶️ Setup Instructions  

1. **Clone Repository**  
git clone https://github.com/yourusername/food-treasure.git
cd food-treasure

2. **Setup Database**  
- Run the SQL schema above in your MySQL server (`foodtreasure` database).  

3. **Configure Database Connection**  
- Update DB credentials in `com.tap.util.DBConnection` with your username, password, and host.

4. **Build & Deploy**    
- Deploy to Apache Tomcat or your servlet container.

5. **Run**  
- Access the application at `http://localhost:8080/food-treasure`  

---

## ✅ Future Enhancements  

- Online payment integration (Debit Card/UPI).  
- Real-time delivery tracking system.  
- Notifications (Email/SMS).  
- Advanced Admin Analytics Dashboard.

---
