<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>About Us</title>
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f8f9fa;
            color: #343a40;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .section-title {
            font-size: 1.5rem;
            margin-bottom: 20px;
        }
        .about-text {
            margin-bottom: 20px;
        }
        .stats-grid {
            display: flex;
            justify-content: space-between;
        }
        .stat-item {
            flex: 1;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="section-title">About Our Motor Showroom</h1>
    <div class="about-content">
        <p class="about-text">
            Welcome to Motor Showroom, your premier destination for high-quality motors since 2020.
            We specialize in providing the best selection of electric, petrol, and diesel motors
            for both personal and industrial use.
        </p>

        <div class="stats-grid">
            <div class="stat-item">
                <div class="stat-value">500+</div>
                <div class="stat-label">Happy Customers</div>
            </div>
            <div class="stat-item">
                <div class="stat-value">100+</div>
                <div class="stat-label">Motors Available</div>
            </div>
        </div>
    </div>
</div>
</body>
</html>