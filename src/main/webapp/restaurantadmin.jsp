<%@ page import="java.util.List" %>
<%@ page import="com.tap.model.Restaurant" %>
<%@ page import="com.tap.model.Menu" %>

<!DOCTYPE html>
<html>
<head>
    <title>Restaurant Admin Panel</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 20px;
            color: #333;
        }
        h2 {
            color: #2F4F4F;
            margin-bottom: 25px;
        }
        form {
            background: #fff;
            padding: 20px 30px;
            margin-bottom: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            max-width: 500px;
        }
        h3 {
            margin-bottom: 15px;
            color: #4A90E2;
            border-bottom: 2px solid #4A90E2;
            padding-bottom: 5px;
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: 600;
        }
        input[type=text],
        input[type=number],
        select,
        textarea {
            width: 100%;
            padding: 8px 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }
        input[type=text]:focus,
        input[type=number]:focus,
        select:focus,
        textarea:focus {
            border-color: #4A90E2;
            outline: none;
            background-color: #f0f8ff;
        }
        textarea {
            resize: vertical;
        }
        input[type=submit] {
            margin-top: 20px;
            background-color: #4A90E2;
            border: none;
            padding: 10px 25px;
            border-radius: 4px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        input[type=submit]:hover {
            background-color: #357ABD;
        }
        .message {
            color: green;
            font-weight: 600;
            margin-bottom: 20px;
            max-width: 500px;
        }
        .error {
            color: #D9534F;
            font-weight: 600;
            margin-bottom: 20px;
            max-width: 500px;
        }
    </style>
</head>
<body>

<h2>Restaurant Admin Panel</h2>

<%
    String msg = request.getParameter("msg");
    String error = request.getParameter("error");
    if (msg != null && !msg.isEmpty()) {
%>
    <p class="message"><%= msg %></p>
<%
    }
    if (error != null && !error.isEmpty()) {
%>
    <p class="error"><%= error %></p>
<%
    }
%>

<!-- Add Restaurant -->
<form action="restaurantAdmin" method="post">
    <h3>Add New Restaurant</h3>
    <input type="hidden" name="action" value="addRestaurant"/>
    <label for="name">Name:</label>
    <input id="name" type="text" name="name" required/>

    <label for="address">Address:</label>
    <input id="address" type="text" name="address" required/>

    <label for="phoneNumber">Phone Number:</label>
    <input id="phoneNumber" type="text" name="phoneNumber" required/>

    <label for="cusineType">Cuisine Type:</label>
    <input id="cusineType" type="text" name="cusineType" required/>

    <label for="deliveryTime">Delivery Time:</label>
    <input id="deliveryTime" type="text" name="deliveryTime" required/>

    <label for="rating">Rating (0-5):</label>
    <input id="rating" type="number" name="rating" min="0" max="5" step="0.1" required/>

    <label for="isActive">Is Active:</label>
    <select id="isActive" name="isActive">
        <option value="yes">Yes</option>
        <option value="no">No</option>
    </select>

    <input type="submit" value="Add Restaurant"/>
</form>

<!-- Delete Restaurant -->
<form action="restaurantAdmin" method="post">
    <h3>Delete Existing Restaurant</h3>
    <input type="hidden" name="action" value="deleteRestaurant"/>
    <label for="restaurantIdDel">Select Restaurant to Delete:</label>
    <select id="restaurantIdDel" name="restaurantId" required>
<%
    List<Restaurant> restaurants = (List<Restaurant>) request.getAttribute("restaurants");
    if (restaurants != null) {
        for (Restaurant res : restaurants) {
%>
        <option value="<%= res.getRestaurantId() %>"><%= res.getName() %></option>
<%
        }
    }
%>
    </select>
    <input type="submit" value="Delete Restaurant"/>
</form>

<!-- Add Menu Item -->
<form action="restaurantAdmin" method="post">
    <h3>Add Menu Item to Restaurant</h3>
    <input type="hidden" name="action" value="addMenuItem"/>
    <label for="restaurantIdMenu">Select Restaurant:</label>
    <select id="restaurantIdMenu" name="restaurantId" required>
<%
    if (restaurants != null) {
        for (Restaurant res : restaurants) {
%>
        <option value="<%= res.getRestaurantId() %>"><%= res.getName() %></option>
<%
        }
    }
%>
    </select>

    <label for="itemName">Item Name:</label>
    <input id="itemName" type="text" name="itemName" required/>

    <label for="description">Description:</label>
    <textarea id="description" name="description" rows="3"></textarea>

    <label for="price">Price:</label>
    <input id="price" type="number" name="price" min="0" step="1" required/>

    <label for="isAvailable">Is Available:</label>
    <select id="isAvailable" name="isAvailable">
        <option value="yes">Yes</option>
        <option value="no">No</option>
    </select>

    <input type="submit" value="Add Menu Item"/>
</form>

<!-- Delete Menu Item -->
<form action="restaurantAdmin" method="post">
    <h3>Delete Menu Item</h3>
    <input type="hidden" name="action" value="deleteMenuItem"/>
    <label for="menuIdDel">Select Menu Item to Delete:</label>
    <select id="menuIdDel" name="menuId" required>
<%
    List<Menu> allMenus = (List<Menu>) request.getAttribute("allMenus");
    if (allMenus != null) {
        for (Menu menu : allMenus) {
%>
        <option value="<%= menu.getMenuId() %>"><%= menu.getItemName() %> (Restaurant ID: <%= menu.getRestaurantId() %>)</option>
<%
        }
    }
%>
    </select>
    <input type="submit" value="Delete Menu Item"/>
</form>

</body>
</html>
