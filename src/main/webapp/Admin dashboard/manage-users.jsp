<%@page import="java.util.List"%>
<%@page import="org.example.motor_showroom.Models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Users</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        :root {
            --sidebar-bg: #343a40;
            --sidebar-text: #ffffff;
            --primary-bg: #f1f3f5;
            --card-bg: #ffffff;
            --accent: #007bff;
            --danger: #dc3545;
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
        <a href="${pageContext.request.contextPath}/admin/orders">Manage Orders</a>
        <a href="${pageContext.request.contextPath}/admin/users" class="active">Manage Users</a>
    </nav>
</div>

<div class="main">
    <div class="header">
        <h1>Manage Users</h1>
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
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Role</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<User> users = (List<User>) request.getAttribute("users");
            if (users != null && !users.isEmpty()) {
                for (User u : users) {
        %>
        <tr>
            <td><%= u.getUserId() %></td>
            <td><%= u.getUsername() %></td>
            <td><%= u.getEmail() %></td>
            <td>
                <form method="POST" action="${pageContext.request.contextPath}/admin/users" style="display: inline;">
                    <input type="hidden" name="action" value="updateRole">
                    <input type="hidden" name="userId" value="<%= u.getUserId() %>">
                    <select name="role" onchange="this.form.submit()">
                        <option value="Admin" <%= "Admin".equals(u.getRole()) ? "selected" : "" %>>Admin</option>
                        <option value="Customer" <%= "Customer".equals(u.getRole()) ? "selected" : "" %>>Customer</option>
                    </select>
                </form>
            </td>
            <td>
                <form method="POST" action="${pageContext.request.contextPath}/admin/users" style="display: inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="userId" value="<%= u.getUserId() %>">
                    <button type="submit" class="btn btn-danger"
                            onclick="return confirm('Are you sure you want to delete this user?')">
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
            <td colspan="5" style="text-align: center;">No users found</td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>