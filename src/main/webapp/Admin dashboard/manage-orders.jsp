<%@page import="java.util.List"%>
<%@page import="org.example.motor_showroom.Models.User"%>
<%@page import="org.example.motor_showroom.Models.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Orders</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        :root {
            --sidebar-bg: #343a40;
            --sidebar-text: #ffffff;
            --primary-bg: #f1f3f5;
            --card-bg: #ffffff;
            --accent: #007bff;
            --danger: #dc3545;
            --pending: #ffc107;
            --completed: #28a745;
            --cancelled: #dc3545;
        }

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--primary-bg);
            color: #333;
        }

        .sidebar {
            width: 220px;
            background-color: var(--sidebar-bg);
            color: var(--sidebar-text);
            height: 100vh;
            padding: 20px;
            position: fixed;
            left: 0;
            top: 0;
            bottom: 0;
        }

        .sidebar .logo {
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 30px;
        }

        .sidebar nav a {
            display: block;
            color: var(--sidebar-text);
            text-decoration: none;
            padding: 12px 16px;
            border-radius: 4px;
            margin-bottom: 8px;
            transition: background 0.2s;
        }

        .sidebar nav a:hover,
        .sidebar nav a.active {
            background-color: #495057;
        }

        .main {
            margin-left: 220px;
            padding: 30px;
            width: calc(100% - 220px);
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .header h1 {
            margin: 0;
            font-size: 1.8rem;
        }

        .logout-btn {
            background-color: var(--danger);
            color: #fff;
            border: none;
            padding: 10px 18px;
            border-radius: 5px;
            cursor: pointer;
        }

        .logout-btn:hover {
            opacity: 0.9;
        }

        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 4px;
        }

        .alert-success {
            background-color: #d4edda;
            color: #155724;
        }

        .alert-error {
            background-color: #f8d7da;
            color: #721c24;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: var(--card-bg);
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0,0,0,0.05);
        }

        th, td {
            padding: 14px 16px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }

        th {
            background-color: #f8f9fa;
            font-weight: 600;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .btn {
            padding: 8px 12px;
            border-radius: 4px;
            cursor: pointer;
            border: none;
            font-size: 0.9rem;
            transition: opacity 0.2s;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .btn-primary {
            background-color: var(--accent);
            color: white;
        }

        .btn-danger {
            background-color: var(--danger);
            color: white;
        }

        .status {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 500;
            color: white;
        }

        .status-pending {
            background-color: var(--pending);
        }

        .status-completed {
            background-color: var(--completed);
        }

        .status-cancelled {
            background-color: var(--cancelled);
        }

        select {
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ced4da;
        }

        @media (max-width: 768px) {
            .sidebar {
                position: relative;
                width: 100%;
                height: auto;
            }

            .main {
                margin-left: 0;
                width: 100%;
            }
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
        <a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
        <a href="${pageContext.request.contextPath}/admin/motors">Manage Motors</a>
        <a href="${pageContext.request.contextPath}/admin/orders" class="active">Manage Orders</a>
        <a href="${pageContext.request.contextPath}/admin/users">Manage Users</a>
    </nav>
</div>

<div class="main">
    <div class="header">
        <h1>Manage Orders</h1>
        <button class="logout-btn" onclick="window.location.href='${pageContext.request.contextPath}/logout'">LOGOUT</button>
    </div>

    <% if (request.getParameter("success") != null) { %>
    <div class="alert alert-success">
        <%= request.getParameter("success") %>
    </div>
    <% } %>

    <% if (request.getParameter("error") != null) { %>
    <div class="alert alert-error">
        <%= request.getParameter("error") %>
    </div>
    <% } %>

    <table>
        <thead>
        <tr>
            <th>Order ID</th>
            <th>Customer</th>
            <th>Motor</th>
            <th>Type</th>
            <th>Total</th>
            <th>Status</th>
            <th>Date</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Order> orders = (List<Order>) request.getAttribute("orders");
            if (orders != null && !orders.isEmpty()) {
                for (Order order : orders) {
        %>
        <tr>
            <td><%= order.getOrderId() %></td>
            <td><%= order.getCustomerName() != null ? order.getCustomerName() : "N/A" %></td>
            <td><%= order.getMotorName() %></td>
            <td><%= order.getOrderType() %></td>
            <td>$<%= String.format("%.2f", order.getTotalAmount()) %></td>
            <td>
                <form method="POST" action="${pageContext.request.contextPath}/admin/orders" style="display: inline;">
                    <input type="hidden" name="action" value="updateStatus">
                    <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">
                    <select name="status" onchange="this.form.submit()"
                            style="background-color: <%= getStatusColor(order.getStatus()) %>; color: white; border: none;">
                        <option value="Pending" <%= "Pending".equals(order.getStatus()) ? "selected" : "" %>>Pending</option>
                        <option value="Completed" <%= "Completed".equals(order.getStatus()) ? "selected" : "" %>>Completed</option>
                        <option value="Cancelled" <%= "Cancelled".equals(order.getStatus()) ? "selected" : "" %>>Cancelled</option>
                    </select>
                </form>
            </td>
            <td><%= order.getOrderDate() %></td>
            <td>
                <form method="POST" action="${pageContext.request.contextPath}/admin/orders" style="display: inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">
                    <button type="submit" class="btn btn-danger"
                            onclick="return confirm('Are you sure you want to delete this order?')">
                        Delete
                    </button>
                </form>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="8" style="text-align: center;">No orders found</td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
<%!
    private String getStatusColor(String status) {
        switch (status) {
            case "Pending": return "#ffc107";
            case "Completed": return "#28a745";
            case "Cancelled": return "#dc3545";
            default: return "#6c757d";
        }
    }
%>