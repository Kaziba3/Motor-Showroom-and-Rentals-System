<%--
  Created by IntelliJ IDEA.
  User: ARYAN
  Date: 4/21/2025
  Time: 8:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>About Us - Admin Dashboard</title>
</head>
<body>
<!-- Sidebar -->
<div class="sidebar">
    <div class="logo">Admin Panel</div>
    <nav>
        <a href="dashboard.jsp" class="nav-item">
            <i class="fas fa-home"></i>
            Dashboard
        </a>
        <a href="#" class="nav-item">
            <i class="fas fa-motorcycle"></i>
            Manage Motors
        </a>
        <a href="#" class="nav-item">
            <i class="fas fa-users"></i>
            Users
        </a>
        <a href="#" class="nav-item">
            <i class="fas fa-chart-bar"></i>
            Reports
        </a>
        <a href="About_Us.jsp" class="nav-item active">
            <i class="fas fa-info-circle"></i>
            About Us
        </a>
        <a href="contact.jsp" class="nav-item">
            <i class="fas fa-envelope"></i>
            Contact Us
        </a>
    </nav>
</div>

<!-- Main Content -->
<div class="main-content">
    <!-- Header -->
    <div class="header">
        <h1>About Us</h1>
        <div class="user-menu">
            <div class="user-avatar">A</div>
        </div>
    </div>

    <!-- About Section -->
    <div class="about-section">
        <h2 class="section-title">Our Story</h2>
        <div class="about-content">
            <p class="about-text">
                Welcome to Motor Management System, your trusted partner in motor rental and sales services.
                Founded in 2020, we have been providing high-quality motors and exceptional service to our customers.
            </p>
            <p class="about-text">
                Our mission is to make motor rental and purchase accessible, affordable, and convenient for everyone.
                We take pride in our extensive collection of motors and our commitment to customer satisfaction.
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
                <div class="stat-item">
                    <div class="stat-value">24/7</div>
                    <div class="stat-label">Customer Support</div>
                </div>
                <div class="stat-item">
                    <div class="stat-value">98%</div>
                    <div class="stat-label">Satisfaction Rate</div>
                </div>
            </div>

            <div class="team-section">
                <h2 class="section-title">Our Team</h2>
                <div class="team-grid">
                    <div class="team-member">
                        <div class="member-avatar">JD</div>
                        <h3 class="member-name">John Doe</h3>
                        <div class="member-role">CEO & Founder</div>
                        <p class="member-bio">
                            With over 15 years of experience in the motor industry, John leads our team with vision and expertise.
                        </p>
                    </div>
                    <div class="team-member">
                        <div class="member-avatar">AS</div>
                        <h3 class="member-name">Alice Smith</h3>
                        <div class="member-role">Operations Manager</div>
                        <p class="member-bio">
                            Alice ensures smooth operations and excellent customer service across all our locations.
                        </p>
                    </div>
                    <div class="team-member">
                        <div class="member-avatar">MJ</div>
                        <h3 class="member-name">Mike Johnson</h3>
                        <div class="member-role">Technical Director</div>
                        <p class="member-bio">
                            Mike oversees our motor maintenance and technical operations, ensuring top performance.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>