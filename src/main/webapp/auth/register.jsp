<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Motor Showroom - Register</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            height: 100vh;
        }

        .form-side {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(to bottom right, #1e3c72, #2a5298);
            color: #fff;
        }

        .image-side {
            flex: 1;
            background: url('https://images.unsplash.com/photo-1616615281268-d9f51f83f2a4?auto=format&fit=crop&w=1050&q=80') no-repeat center center;
            background-size: cover;
        }

        .auth-card {
            background: rgba(255, 255, 255, 0.08);
            padding: 2rem 3rem;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0,0,0,0.4);
            backdrop-filter: blur(8px);
            width: 100%;
            max-width: 450px;
        }

        h1, h2 {
            text-align: center;
            margin-bottom: 1rem;
            color: #fff;
        }

        .form-group {
            margin-bottom: 1.2rem;
        }

        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            color: #ddd;
        }

        .form-control, textarea {
            width: 100%;
            padding: 0.6rem;
            border: none;
            border-radius: 8px;
            background: #f3f3f3;
            font-size: 1rem;
        }

        .role-options {
            display: flex;
            gap: 1rem;
            margin-top: 0.5rem;
        }

        .role-options label {
            color: #ddd;
        }

        .btn {
            background-color: #ff6f00;
            color: white;
            border: none;
            width: 100%;
            padding: 0.8rem;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: bold;
            transition: background 0.3s ease;
        }

        .btn:hover {
            background-color: #e65c00;
        }

        .alert.error {
            background: #ff4d4d;
            color: white;
            padding: 0.6rem;
            margin-bottom: 1rem;
            border-radius: 6px;
            text-align: center;
        }

        a {
            color: #ffd700;
            text-decoration: none;
        }

        p {
            text-align: center;
        }

        @media (max-width: 768px) {
            body {
                flex-direction: column;
            }
            .image-side {
                height: 40vh;
            }
        }
    </style>
</head>
<body>
<div class="form-side">
    <div class="auth-card">
        <h1>Motor Showroom</h1>
        <h2>Register</h2>

        <% if (request.getAttribute("error") != null) { %>
        <div class="alert error"><%= request.getAttribute("error") %></div>
        <% } %>

        <form action="${pageContext.request.contextPath}/register" method="POST">
            <div class="form-group">
                <label class="form-label" for="username">Username:</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>

            <div class="form-group">
                <label class="form-label" for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label class="form-label" for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>

            <div class="form-group">
                <label class="form-label" for="confirmPassword">Confirm Password:</label>
                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
            </div>

            <div class="form-group">
                <label class="form-label" for="address">Address:</label>
                <textarea class="form-control" id="address" name="address" rows="3"></textarea>
            </div>

            <div class="form-group">
                <label class="form-label">Role:</label>
                <div class="role-options">
                    <label><input type="radio" name="role" value="Customer" checked> Customer</label>
                    <label><input type="radio" name="role" value="Admin"> Admin</label>
                </div>
            </div>

            <button type="submit" class="btn">Register</button>
        </form>

        <p>Already have an account? <a href="${pageContext.request.contextPath}/auth/login.jsp">Login here</a></p>
    </div>
</div>
<div class="image-side"></div>
</body>
</html>