<%@page import="java.util.List,org.example.motor_showroom.Models.Motor,org.example.motor_showroom.Models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Motors</title>
</head>
<body style="font-family: 'Inter', sans-serif; background-color: #f8f9fa; color: #343a40; margin: 0; padding: 20px;">
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !user.getRole().equals("Admin")) {
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }
%>

<div style="background-color: #343a40; padding: 10px; color: white;">
    <a href="${pageContext.request.contextPath}/admin/dashboard" style="color: white; margin-right: 15px; text-decoration: none;">Dashboard</a>
    <a href="${pageContext.request.contextPath}/admin/motors" style="color: white; margin-right: 15px; text-decoration: none;">Manage Motors</a>
    <a href="${pageContext.request.contextPath}/admin/orders" style="color: white; margin-right: 15px; text-decoration: none;">Manage Orders</a>
    <a href="${pageContext.request.contextPath}/admin/users" style="color: white; margin-right: 15px; text-decoration: none;">Manage Users</a>
    <a href="${pageContext.request.contextPath}/logout" style="color: white; text-decoration: none;">Logout</a>
</div>

<div style="max-width: 1200px; margin: 20px auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
    <h1 style="margin-bottom: 20px;">Manage Motors</h1>

    <% if (request.getParameter("success") != null) { %>
    <div style="background: #d4edda; color: #155724; padding: 15px; margin-bottom: 20px; border-radius: 4px;">
        <%= request.getParameter("success") %>
    </div>
    <% } %>

    <% if (request.getParameter("error") != null) { %>
    <div style="background: #f8d7da; color: #721c24; padding: 15px; margin-bottom: 20px; border-radius: 4px;">
        <%= request.getParameter("error") %>
    </div>
    <% } %>

    <div style="margin-bottom: 30px;">
        <h2 style="font-size: 1.5rem; margin-bottom: 20px;">Add New Motor</h2>
        <form method="POST" action="${pageContext.request.contextPath}/admin/motors" enctype="multipart/form-data" style="margin-bottom: 30px;">
            <input type="hidden" name="action" value="add">
            <div style="margin-bottom: 15px;">
                <label style="display: block; margin-bottom: 5px; font-weight: 500;">Name:</label>
                <input type="text" name="name" required style="width: 100%; padding: 10px; border: 1px solid #ced4da; border-radius: 4px; font-size: 16px;">
            </div>
            <div style="margin-bottom: 15px;">
                <label style="display: block; margin-bottom: 5px; font-weight: 500;">Type:</label>
                <select name="type" required style="width: 100%; padding: 10px; border: 1px solid #ced4da; border-radius: 4px; font-size: 16px;">
                    <option value="Electric">Electric</option>
                    <option value="Petrol">Petrol</option>
                    <option value="Diesel">Diesel</option>
                </select>
            </div>
            <div style="margin-bottom: 15px;">
                <label style="display: block; margin-bottom: 5px; font-weight: 500;">Power (kW):</label>
                <input type="number" step="0.01" name="power" required style="width: 100%; padding: 10px; border: 1px solid #ced4da; border-radius: 4px; font-size: 16px;">
            </div>
            <div style="margin-bottom: 15px;">
                <label style="display: block; margin-bottom: 5px; font-weight: 500;">Price:</label>
                <input type="number" step="0.01" name="price" required style="width: 100%; padding: 10px; border: 1px solid #ced4da; border-radius: 4px; font-size: 16px;">
            </div>
            <div style="margin-bottom: 15px;">
                <label style="display: block; margin-bottom: 5px; font-weight: 500;">Description:</label>
                <textarea name="description" style="width: 100%; padding: 10px; border: 1px solid #ced4da; border-radius: 4px; font-size: 16px; min-height: 100px;"></textarea>
            </div>
            <div style="margin-bottom: 15px;">
                <label style="display: block; margin-bottom: 5px; font-weight: 500;">Image:</label>
                <input type="file" name="image" accept="image/*" required style="width: 100%; padding: 10px; border: 1px solid #ced4da; border-radius: 4px; font-size: 16px;">
            </div>
            <button type="submit" style="background-color: #007bff; color: white; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; font-size: 16px;">Add Motor</button>
        </form>
    </div>

    <div>
        <h2 style="font-size: 1.5rem; margin-bottom: 20px;">All Motors</h2>
        <div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)); gap: 20px; margin-top: 20px;">
            <%
                List<Motor> motors = (List<Motor>) request.getAttribute("allMotors");
                if (motors != null && !motors.isEmpty()) {
                    for (Motor motor : motors) {
            %>
            <div style="background: white; border-radius: 8px; padding: 15px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);">
                <img src="${pageContext.request.contextPath}/<%= motor.getImagePath() %>" alt="<%= motor.getName() %>" style="width: 100%; height: auto; border-radius: 4px; margin-bottom: 10px;">
                <h3 style="margin: 0;"><%= motor.getName() %></h3>
                <p>Type: <%= motor.getType() %></p>
                <p>Power: <%= motor.getPower() %> kW</p>
                <p>Price: $<%= motor.getPrice() %></p>
                <p>Status: <%= motor.isAvailability() ? "Available" : "Out of Stock" %></p>
                <div style="display: flex; gap: 0.5rem; margin-top: 1rem;">
                    <a href="motors?action=edit&id=<%= motor.getMotorId() %>" style="background-color: #007bff; color: white; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; text-decoration: none;">Edit</a>
                    <a href="motors?action=toggle&id=<%= motor.getMotorId() %>" style="background-color: #007bff; color: white; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; text-decoration: none;">
                        <%= motor.isAvailability() ? "Mark Unavailable" : "Mark Available" %>
                    </a>
                    <!-- In your delete form, make sure it sends motorId -->
                    <a action="${pageContext.request.contextPath}/admin/motors" method="post"
                          onsubmit="return confirm('Are you sure you want to delete this motor?');">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="motorId" value="<%= motor.getMotorId() %>">
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </a>
                </div>
            </div>
            <%
                }
            } else {
            %>
            <div style="text-align: center; color: #dc3545;">No motors found</div>
            <% } %>
        </div>
    </div>
</div>
</body>
</html>