<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Login</title>
  <style>
    body {
      background-color: black;
      color: white;
      font-family: 'Segoe UI', sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .form-container {
      background-color: #1c1c1c;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 0 10px deepskyblue;
      width: 300px;
    }
    .form-container h2 {
      color: deepskyblue;
      text-align: center;
      margin-bottom: 20px;
    }
    input {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      background-color: #333;
      color: white;
      border: none;
      border-radius: 5px;
    }
    button {
      width: 100%;
      padding: 10px;
      background-color:deepskyblue;
      color: white;
      border: none;
      border-radius: 5px;
      font-weight: bold;
      cursor: pointer;
    }
    button:hover {
     background-color: deepskyblue;
    }
    p {
      text-align: center;
      margin-top: 10px;
    }
    a {
      color: orangered;
      text-decoration: none;
    }
    /* Added success message styling */
    .success-message {
      color: #45ff8a;
      font-weight: bold;
      margin-bottom: 15px;
      text-align: center;
    }
  </style>
</head>
<body>
  <div class="form-container">
    <h2>Welcome Back</h2>
    <%
    String errorMessage = request.getParameter("error");
    if (errorMessage != null && !errorMessage.isEmpty()) {
    %>
    <div style="color: red; font-weight: bold; margin-bottom: 15px;">
        <%= errorMessage %>
    </div>
    <%
    }

    String successMessage = request.getParameter("message");
    if (successMessage != null && !successMessage.isEmpty()) {
    %>
    <div class="success-message">
        <%= successMessage %>
    </div>
    <%
    }
    %>

    <form action="login">
      <input type="text" name="userName"  placeholder="User Name" required />
      <input type="password" name="password" placeholder="Password" required />
      <button type="submit">Login</button>
    </form>
    <p>Don't have an account? <a href="signup.jsp">Sign Up</a></p>
  </div>
</body>
</html>
