<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Motor Showroom</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;600;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Montserrat', sans-serif;
        }

        body {
            background-color: #f8f8f8;
            color: #333;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .logo {
            font-size: 2.5rem;
            font-weight: 700;
            letter-spacing: 5px;
            margin-bottom: 60px;
            color: #222;
        }

        .tagline {
            font-size: 3.5rem;
            font-weight: 300;
            margin-bottom: 80px;
            line-height: 1.2;
            max-width: 600px;
        }

        .auth-buttons {
            display: flex;
            gap: 30px;
        }

        .auth-button {
            background: none;
            border: none;
            font-size: 1.2rem;
            font-weight: 600;
            cursor: pointer;
            padding: 10px 0;
            position: relative;
            color: #333;
            text-decoration: none;
        }

        .auth-button::after {
            content: '→';
            margin-left: 8px;
            transition: transform 0.3s;
        }

        .auth-button:hover::after {
            transform: translateX(5px);
        }

        .auth-button:hover {
            color: #000;
        }
    </style>
</head>
<body>
<div class="logo">Motor <br>Showroom</div>
<div class="tagline">LET'S GET YOU<br>ON THE ROAD</div>
<div class="auth-buttons">
    <a href="${pageContext.request.contextPath}/auth/login.jsp" class="auth-button">LOGIN</a>
    <a href="${pageContext.request.contextPath}/auth/register.jsp" class="auth-button">SIGNUP</a>
</div>
</body>
</html>