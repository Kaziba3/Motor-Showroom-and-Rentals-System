<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Motor Showroom - Login</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            height: 100vh;
        }

        .image-side {
            flex: 1;
            background: url('https://images.unsplash.com/photo-1549921296-3a45f7cdd63b?auto=format&fit=crop&w=1050&q=80') no-repeat center center;
            background-size: cover;
        }

        .form-side {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(to bottom right, #1e3c72, #2a5298);
            color: #fff;
        }

        .auth-card {
            background: rgba(255, 255, 255, 0.08);
            padding: 2rem 3rem;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0,0,0,0.4);
            backdrop-filter: blur(8px);
            width: 100%;
            max-width: 400px;
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

        .form-control {
            width: 100%;
            padding: 0.6rem;
            border: none;
            border-radius: 8px;
            background: #f3f3f3;
            font-size: 1rem;
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
<div class="image-side"></div>
<div class="form-side">
    <div class="auth-card">
        <h1>Motor Showroom</h1>
        <h2>Login</h2>

        <% if (request.getAttribute("error") != null) { %>
        <div class="alert error"><%= request.getAttribute("error") %></div>
        <% } %>

        <form action="${pageContext.request.contextPath}/login" method="POST">
            <div class="form-group">
                <label class="form-label" for="username">Username:</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>

            <div class="form-group">
                <label class="form-label" for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>

            <button type="submit" class="btn">Login</button>
        </form>

        <p>Don't have an account? <a href="${pageContext.request.contextPath}/auth/register.jsp">Register here</a></p>
    </div>
</div>
</body>
</html>
