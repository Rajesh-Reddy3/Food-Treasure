<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Sign Up</title>
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
    input, select {
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
      background-color: deepskyblue;
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
  </style>
</head>

<body>

  <div class="form-container">
    <h2>Create Account</h2>
    <form action="register" method="post">
      <input type="text" name="name" placeholder="Name" required />
      <input type="text" name="userName" placeholder="User Name" required/>
      <input type="password" name="password" placeholder="Password" required/>
      <input type="email" name="email" placeholder="Email" required />
      <input type="text" name="phoneNumber" placeholder="Phone Number" required/>
      <input type="text" name="address" placeholder="Address" required/>

      <!-- Drop-down menu for selecting role -->
      <select name="role" required>
        <option value="customer">Customer</option>
        <option value="delivery partner">Delivery Partner</option>
        <option value="restaurant admin">Restaurant Admin</option>
      </select>

      <button type="submit">Sign Up</button>
    </form>
    <p>Already have an account? <a href="login.jsp">Login</a></p>
  </div>

</body>
</html>
