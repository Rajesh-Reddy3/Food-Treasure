<%@ page import="java.util.List" %>
<%@ page import="com.tap.model.User" %>
<%@ page import="com.tap.model.Restaurant" %>
<%@ page import="com.tap.model.Order" %> <%-- Assuming you have an Order model --%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        button {
            background-color: #4A90E2;
            color: white;
            border: none;
            padding: 15px 30px;
            margin: 10px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 6px;
        }
        button:hover {
            background-color: #357ABD;
        }
        h2 {
            margin-bottom: 20px;
            color: #2F4F4F;
        }
        table {
            width: 90%;
            border-collapse: collapse;
            margin-top: 30px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px 12px;
        }
        th {
            background-color: #4A90E2;
            color: white;
        }
    </style>
</head>
<body>

<h2>Admin Dashboard</h2>

<form method="get" action="adminDashboard">
    <button type="submit" name="view" value="users">View Users</button>
    <button type="submit" name="view" value="restaurants">View Restaurants</button>
    <button type="submit" name="view" value="orders">View Orders</button>
    <button type="submit" name="view" value="others">More</button>
</form>

<%
    String view = request.getParameter("view");
    if ("users".equals(view)) {
        List<User> users = (List<User>) request.getAttribute("userList");
        if(users != null) {
%>
        <h3>User List</h3>
        <table>
            <tr><th>User ID</th><th>Username</th><th>Email</th><th>Role</th><th>Phone</th></tr>
            <%
                for(User u : users) {
            %>
            <tr>
                <td><%= u.getUserId() %></td>
                <td><%= u.getUserName() %></td>
                <td><%= u.getEmail() %></td>
                <td><%= u.getRole() %></td>
                <td><%= u.getPhoneNumber() %></td>
            </tr>
            <%
                }
            %>
        </table>
<%
        }
    } else if ("restaurants".equals(view)) {
        List<Restaurant> restaurants = (List<Restaurant>) request.getAttribute("restaurantList");
        if(restaurants != null) {
%>
        <h3>Restaurants List</h3>
        <table>
            <tr><th>ID</th><th>Name</th><th>Address</th><th>Admin User</th><th>Status</th></tr>
            <%
                for(Restaurant r : restaurants) {
            %>
            <tr>
                <td><%= r.getRestaurantId() %></td>
                <td><%= r.getName() %></td>
                <td><%= r.getAddress() %></td>
                <td><%= r.getAdminUserId() %></td>
                <td><%= "yes".equalsIgnoreCase(r.getIsActive()) ? "Active" : "Inactive" %></td>
            </tr>
            <%
                }
            %>
        </table>
<%
        }
    } else if ("orders".equals(view)) {
        // Similarly, display orders if provided in request attribute
        // List<Order> orders = (List<Order>) request.getAttribute("orderList");
        // Build orders table here...
%>
        <h3>Orders Section - Coming Soon</h3>
<%
    } else if ("others".equals(view)) {
%>
        <h3>More Management Features Coming Soon</h3>
<%
    }
%>

</body>
</html>
