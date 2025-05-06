<%@page import="org.example.motor_showroom.Models.Motor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Order Motor</title>
</head>
<body style="font-family: 'Inter', sans-serif; background-color: #f8f9fa; color: #343a40; margin: 0; padding: 20px;">
<%
  if (session.getAttribute("user") == null) {
    response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
    return;
  }

  Motor motor = (Motor) request.getAttribute("motor");
  if (motor == null) {
    response.sendRedirect(request.getContextPath() + "/customer/dashboard");
    return;
  }
%>

<div style="background-color: #343a40; padding: 10px; color: white;">
  <a href="${pageContext.request.contextPath}/customer/dashboard" style="color: white; margin-right: 15px; text-decoration: none;">Home</a>
  <a href="${pageContext.request.contextPath}/customer/orders" style="color: white; margin-right: 15px; text-decoration: none;">My Orders</a>
  <a href="${pageContext.request.contextPath}/about-us.jsp" style="color: white; margin-right: 15px; text-decoration: none;">About Us</a>
  <a href="${pageContext.request.contextPath}/contact-us.jsp" style="color: white; margin-right: 15px; text-decoration: none;">Contact Us</a>
  <a href="${pageContext.request.contextPath}/logout" style="color: white; text-decoration: none;">Logout</a>
</div>

<div style="max-width: 600px; margin: 20px auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
  <% if (request.getParameter("error") != null) { %>
  <div style="background: #f8d7da; color: #721c24; padding: 15px; margin-bottom: 20px; border-radius: 4px;">
    <%= request.getParameter("error") %>
  </div>
  <% } %>

  <div style="margin-bottom: 2rem; padding: 1rem; background: #f8f9fa; border-radius: 8px;">
    <img src="${pageContext.request.contextPath}/<%= motor.getImagePath() %>" alt="<%= motor.getName() %>" style="max-width: 100%; height: auto; border-radius: 8px;">
    <h2 style="margin-top: 10px;"><%= motor.getName() %></h2>
    <p>Type: <%= motor.getType() %></p>
    <p>Power: <%= motor.getPower() %> kW</p>
    <p>Price: $<%= motor.getPrice() %></p>
    <p>Status: <%= motor.isAvailability() ? "Available" : "Out of Stock" %></p>
  </div>

  <form method="POST" action="${pageContext.request.contextPath}/customer/order" style="margin-top: 20px;">
    <input type="hidden" name="motorId" value="<%= motor.getMotorId() %>">

    <div style="margin-bottom: 15px;">
      <label style="display: block; margin-bottom: 5px; font-weight: 500;">Order Type:</label>
      <select name="orderType" id="orderType" required style="width: 100%; padding: 10px; border: 1px solid #ced4da; border-radius: 4px; font-size: 16px;">
        <option value="Buy">Buy</option>
        <option value="Rent">Rent</option>
      </select>
    </div>

    <div id="rentDurationGroup" style="margin-bottom: 15px; display: none;">
      <label style="display: block; margin-bottom: 5px; font-weight: 500;">Rental Duration (days):</label>
      <input type="number" name="rentDuration" min="1" value="1" style="width: 100%; padding: 10px; border: 1px solid #ced4da; border-radius: 4px; font-size: 16px;">
    </div>

    <div style="margin-bottom: 15px;">
      <label style="display: block; margin-bottom: 5px; font-weight: 500;">Delivery Address:</label>
      <textarea name="deliveryAddress" required style="width: 100%; padding: 10px; border: 1px solid #ced4da; border-radius: 4px; font-size: 16px; min-height: 100px;"></textarea>
    </div>

    <div style="margin-bottom: 15px;">
      <label style="display: block; margin-bottom: 5px; font-weight: 500;">Payment Method:</label>
      <select name="paymentMethod" required style="width: 100%; padding: 10px; border: 1px solid #ced4da; border-radius: 4px; font-size: 16px;">
        <option value="Credit Card">Credit Card</option>
        <option value="Debit Card">Debit Card</option>
        <option value="Bank Transfer">Bank Transfer</option>
      </select>
    </div>

    <button type="submit" style="background-color: #007bff; color: white; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; font-size: 16px;">Place Order</button>
  </form>
</div>

<script>
  document.getElementById('orderType').addEventListener('change', function() {
    document.getElementById('rentDurationGroup').style.display =
            this.value === 'Rent' ? 'block' : 'none';
  });
</script>
</body>
</html>