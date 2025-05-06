<%@page import="org.example.motor_showroom.Models.User"%>
<%@page import="java.util.List"%>
<%@page import="org.example.motor_showroom.Models.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f8f9fa;
            color: #343a40;
            margin: 0;
            padding: 20px;
        }
        .sidebar {
            width: 280px;
            background-color: #343a40;
            color: white;
            height: 100vh;
            position: fixed;
            padding: 20px;
        }
        .sidebar nav {
            display: flex;
            flex-direction: column;
        }
        .nav-item {
            padding: 15px 0;
            color: white;
            text-decoration: none;
        }
        .nav-item:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }
        .main-content {
            margin-left: 280px;
            padding: 20px;
            max-width: 1200px;
            margin: auto;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .section-title {
            font-size: 1.5rem;
            margin-bottom: 20px;
        }
        .stats-grid {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .stat-card {
            flex: 1;
            text-align: center;
            background: #e9ecef;
            padding: 20px;
            border-radius: 8px;
            margin-right: 20px;
        }
        .stat-card:last-child {
            margin-right: 0;
        }
        .data-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .data-table th, .data-table td {
            border: 1px solid #dee2e6;
            padding: 10px;
            text-align: left;
        }
        .status-badge {
            padding: 5px 10px;
            border-radius: 4px;
            color: white;
        }
        .pending {
            background-color: #ffc107;
        }
        .completed {
            background-color: #28a745;
        }
        .cancelled {
            background-color: #dc3545;
        }
        .logout-btn {
            background-color: #dc3545;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .logout-btn:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !user.getRole().equals("Admin")) {
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }
%>

<div class="sidebar">
    <div class="logo">Admin Panel</div>
    <nav>
        <a href="${pageContext.request.contextPath}/admin/dashboard" class="nav-item active">Dashboard</a>
        <a href="${pageContext.request.contextPath}/Admin dashboard/manage-motors.jsp" class="nav-item">Manage Motors</a>
        <a href="${pageContext.request.contextPath}/admin/orders" class="nav-item">Manage Orders</a>
        <a href="${pageContext.request.contextPath}/admin/users" class="nav-item">Manage Users</a>
    </nav>
</div>

<div class="main-content">
    <div class="header">
        <h1>Admin Dashboard</h1>
        <button onclick="window.location.href='${pageContext.request.contextPath}/logout'" class="logout-btn">LOGOUT</button>
    </div>

    <div class="stats-grid">
        <div class="stat-card">
            <div class="stat-title">Total Motors</div>
            <div class="stat-value"><%= request.getAttribute("totalMotors") %></div>
        </div>
        <div class="stat-card">
            <div class="stat-title">Total Orders</div>
            <div class="stat-value"><%= request.getAttribute("totalOrders") %></div>
        </div>
        <div class="stat-card">
            <div class="stat-title">Total Users</div>
            <div class="stat-value"><%= request.getAttribute("totalUsers") %></div>
        </div>
    </div>

    <div class="recent-orders">
        <h2 class="section-title">Recent Orders</h2>
        <table class="data-table">
            <thead>
            <tr>
                <th>Order ID</th>
                <th>Motor</th>
                <th>Type</th>
                <th>Total</th>
                <th>Status</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Order> orders = (List<Order>) request.getAttribute("recentOrders");
                if (orders != null) {
                    for (Order order : orders) {
            %>
            <tr>
                <td><%= order.getOrderId() %></td>
                <td><%= order.getMotorName() %></td>
                <td><%= order.getOrderType() %></td>
                <td>$<%= String.format("%.2f", order.getTotalAmount()) %></td>
                <td><span class="status-badge <%= order.getStatus().toLowerCase() %>"><%= order.getStatus() %></span></td>
            </tr>
            <% }} %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>