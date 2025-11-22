<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #000000;
            margin: 0;
            padding: 0;
        }
        .checkout-container {
            max-width: 600px;
            margin: 50px auto;
            background: #1d1c1c;
            padding: 30px;
            border-radius: 8px;
            border: 1px solid orangered;
            box-shadow: 0 4px 10px rgba(255, 255, 255, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #ff4400;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #ffffff;
        }
        input[type="text"], textarea, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        button {
            background-color: #ff5722;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #000000;
            border: 1px solid orangered;
        }
    </style>
</head>
<body>

<div class="checkout-container">
    <h2>Confirm Your Order</h2>
    <form action="checkout" method="post">
        <label for="address">Delivery Address</label>
        <textarea name="address" id="address" rows="4" required placeholder="Enter your full address..."></textarea>

        <label for="paymentMode">Payment Method</label>
        <select name="paymentMode" id="paymentMode" required>
            <option value="">-- Select Payment Mode --</option>
            <option value="Cash on Delivery">Cash on Delivery</option>
            <option value="UPI">UPI</option>
            <option value="Credit/Debit Card">Credit/Debit Card</option>
        </select>

        <button type="submit">Place Order</button>
    </form>
</div>

</body>
</html>
  