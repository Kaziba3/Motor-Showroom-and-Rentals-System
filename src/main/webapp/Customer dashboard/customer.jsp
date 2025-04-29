<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Customer Dashboard - Motor Management System</title>
  <style>
    :root {
      --primary: #2563eb;
      --primary-dark: #1d4ed8;
      --secondary: #0f172a;
      --accent: #3b82f6;
      --success: #10b981;
      --warning: #f59e0b;
      --danger: #ef4444;
      --text-primary: #1e293b;
      --text-secondary: #64748b;
      --text-light: #94a3b8;
      --bg-light: #f8fafc;
      --bg-white: #ffffff;
      --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
      --shadow: 0 4px 6px -1px rgb(0 0 0 / 0.1);
      --shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1);
      --border: #e2e8f0;
      --radius-sm: 0.375rem;
      --radius: 0.5rem;
      --radius-lg: 0.75rem;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
    }

    body {
      background-color: var(--bg-light);
      color: var(--text-primary);
      line-height: 1.5;
    }

    /* Header Navigation */
    .header-top {
      background: linear-gradient(to right, var(--secondary), var(--primary-dark));
      padding: 0.75rem 2rem;
      color: white;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .contact-info {
      display: flex;
      gap: 2rem;
      font-size: 0.875rem;
    }

    .contact-info a {
      color: white;
      text-decoration: none;
      display: flex;
      align-items: center;
      gap: 0.5rem;
      transition: opacity 0.3s ease;
    }

    .contact-info a:hover {
      opacity: 0.8;
    }

    .social-links {
      display: flex;
      gap: 1.5rem;
    }

    .social-links a {
      color: white;
      text-decoration: none;
      font-size: 1.125rem;
      transition: transform 0.3s ease;
    }

    .social-links a:hover {
      transform: translateY(-2px);
    }

    .main-header {
      background: var(--bg-white);
      padding: 1rem 2rem;
      box-shadow: var(--shadow);
      position: sticky;
      top: 0;
      z-index: 100;
      transition: transform 0.3s ease;
    }

    .header-content {
      max-width: 1400px;
      margin: 0 auto;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .logo {
      display: flex;
      align-items: center;
      gap: 1rem;
      text-decoration: none;
      color: var(--secondary);
    }

    .logo i {
      font-size: 2rem;
      background: linear-gradient(45deg, var(--primary), var(--accent));
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }

    .logo span {
      font-size: 1.5rem;
      font-weight: 700;
      background: linear-gradient(45deg, var(--secondary), var(--primary));
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }

    .main-nav {
      display: flex;
      gap: 3rem;
      align-items: center;
    }

    .nav-links {
      display: flex;
      gap: 2.5rem;
      list-style: none;
    }

    .nav-links a {
      text-decoration: none;
      color: var(--text-primary);
      font-weight: 500;
      padding: 0.5rem 0;
      position: relative;
      transition: color 0.3s ease;
    }

    .nav-links a::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 0;
      width: 0;
      height: 2px;
      background: linear-gradient(to right, var(--primary), var(--accent));
      transition: width 0.3s ease;
    }

    .nav-links a:hover {
      color: var(--primary);
    }

    .nav-links a:hover::after {
      width: 100%;
    }

    .user-actions {
      display: flex;
      gap: 1rem;
      align-items: center;
    }

    .user-actions button {
      padding: 0.625rem 1.5rem;
      border-radius: var(--radius);
      font-weight: 500;
      cursor: pointer;
      transition: all 0.3s ease;
    }

    .login-btn {
      background: transparent;
      border: 2px solid var(--primary);
      color: var(--primary);
    }

    .login-btn:hover {
      background: var(--primary);
      color: white;
      transform: translateY(-2px);
    }

    .register-btn {
      background: linear-gradient(45deg, var(--primary), var(--accent));
      border: none;
      color: white;
      box-shadow: var(--shadow-sm);
    }

    .register-btn:hover {
      transform: translateY(-2px);
      box-shadow: var(--shadow);
    }

    /* Hero Section */
    .hero {
      position: relative;
      height: 600px;
      background: linear-gradient(rgba(15, 23, 42, 0.7), rgba(15, 23, 42, 0.7)),
      url('https://images.unsplash.com/photo-1503376780353-7e6692767b70?auto=format&fit=crop&w=1920&q=80');
      background-size: cover;
      background-position: center;
      display: flex;
      align-items: center;
      padding: 0 5%;
    }

    .hero::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      height: 100%;
      background: linear-gradient(to bottom, rgba(15, 23, 42, 0.8), rgba(15, 23, 42, 0.4));
    }

    .hero-content {
      position: relative;
      max-width: 800px;
      color: white;
      animation: fadeInUp 1s ease;
    }

    .hero h1 {
      font-size: 4rem;
      font-weight: 700;
      margin-bottom: 1.5rem;
      line-height: 1.2;
      background: linear-gradient(45deg, #ffffff, #e2e8f0);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }

    .hero p {
      font-size: 1.25rem;
      margin-bottom: 2rem;
      opacity: 0.9;
    }

    /* Search Form */
    .search-form {
      background: white;
      padding: 2rem;
      border-radius: var(--radius-lg);
      box-shadow: var(--shadow-lg);
      margin-top: -50px;
      position: relative;
      z-index: 10;
      max-width: 1200px;
      margin-left: auto;
      margin-right: auto;
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
      gap: 1.5rem;
      animation: slideUp 0.5s ease;
    }

    .search-form .form-group {
      position: relative;
    }

    .search-form label {
      display: block;
      margin-bottom: 0.5rem;
      color: var(--text-primary);
      font-weight: 500;
    }

    .search-form select,
    .search-form input {
      width: 100%;
      padding: 0.75rem 1rem;
      border: 1px solid var(--border);
      border-radius: var(--radius);
      font-size: 1rem;
      background: var(--bg-light);
      color: var(--text-primary);
      transition: all 0.3s ease;
    }

    .search-form select:focus,
    .search-form input:focus {
      border-color: var(--primary);
      box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
      outline: none;
    }

    .search-btn {
      background: linear-gradient(45deg, var(--primary), var(--accent));
      color: white;
      border: none;
      padding: 0.75rem 1.5rem;
      border-radius: var(--radius);
      font-weight: 500;
      cursor: pointer;
      transition: all 0.3s ease;
      align-self: flex-end;
      box-shadow: var(--shadow-sm);
    }

    .search-btn:hover {
      transform: translateY(-2px);
      box-shadow: var(--shadow);
    }

    /* Categories Section */
    .container {
      max-width: 1400px;
      margin: 4rem auto;
      padding: 0 2rem;
    }

    .section-title {
      font-size: 2.5rem;
      font-weight: 700;
      margin-bottom: 2rem;
      color: var(--text-primary);
      text-align: center;
      position: relative;
    }

    .section-title::after {
      content: '';
      display: block;
      width: 80px;
      height: 4px;
      background: linear-gradient(to right, var(--primary), var(--accent));
      margin: 1rem auto 0;
      border-radius: 2px;
    }

    .categories {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: 2rem;
      margin-bottom: 4rem;
    }

    .category-card {
      position: relative;
      height: 250px;
      border-radius: var(--radius-lg);
      overflow: hidden;
      cursor: pointer;
      transition: all 0.3s ease;
    }

    .category-card::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: linear-gradient(to bottom, rgba(15, 23, 42, 0.2), rgba(15, 23, 42, 0.8));
      z-index: 1;
      transition: all 0.3s ease;
    }

    .category-card:hover::before {
      background: linear-gradient(to bottom, rgba(15, 23, 42, 0.4), rgba(15, 23, 42, 0.9));
    }

    .category-card img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      transition: transform 0.3s ease;
    }

    .category-card:hover img {
      transform: scale(1.1);
    }

    .category-content {
      position: absolute;
      bottom: 0;
      left: 0;
      right: 0;
      padding: 2rem;
      z-index: 2;
      color: white;
    }

    .category-content h3 {
      font-size: 1.5rem;
      font-weight: 600;
      margin-bottom: 0.5rem;
    }

    .category-content p {
      font-size: 1rem;
      opacity: 0.9;
    }

    /* Featured Motors */
    .vehicles-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
      gap: 2rem;
    }

    .vehicle-card {
      background: var(--bg-white);
      border-radius: var(--radius-lg);
      overflow: hidden;
      box-shadow: var(--shadow);
      transition: all 0.3s ease;
      position: relative;
    }

    .vehicle-card:hover {
      transform: translateY(-5px);
      box-shadow: var(--shadow-lg);
    }

    .vehicle-image {
      height: 220px;
      overflow: hidden;
      position: relative;
    }

    .vehicle-image::after {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: linear-gradient(to bottom, transparent, rgba(0, 0, 0, 0.1));
    }

    .vehicle-image img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      transition: transform 0.3s ease;
    }

    .vehicle-card:hover .vehicle-image img {
      transform: scale(1.1);
    }

    .vehicle-details {
      padding: 1.5rem;
    }

    .vehicle-title {
      font-size: 1.25rem;
      font-weight: 600;
      margin-bottom: 0.5rem;
      color: var(--text-primary);
    }

    .vehicle-price {
      font-size: 1.5rem;
      font-weight: 700;
      color: var(--primary);
      margin-bottom: 1rem;
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }

    .vehicle-price::before {
      content: '$';
      font-size: 1rem;
      color: var(--text-secondary);
    }

    .vehicle-specs {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      gap: 1rem;
      margin-bottom: 1.5rem;
      padding: 1rem;
      background: var(--bg-light);
      border-radius: var(--radius);
    }

    .spec-item {
      display: flex;
      align-items: center;
      gap: 0.75rem;
      color: var(--text-secondary);
    }

    .spec-item i {
      color: var(--primary);
      font-size: 1.25rem;
    }

    .vehicle-actions {
      display: flex;
      gap: 1rem;
    }

    .btn {
      flex: 1;
      padding: 0.75rem 1.5rem;
      border-radius: var(--radius);
      font-weight: 500;
      text-align: center;
      cursor: pointer;
      transition: all 0.3s ease;
    }

    .btn-primary {
      background: linear-gradient(45deg, var(--primary), var(--accent));
      color: white;
      border: none;
      box-shadow: var(--shadow-sm);
    }

    .btn-primary:hover {
      transform: translateY(-2px);
      box-shadow: var(--shadow);
    }

    .btn-outline {
      border: 2px solid var(--primary);
      color: var(--primary);
      background: transparent;
    }

    .btn-outline:hover {
      background: var(--primary);
      color: white;
    }

    /* Animations */
    @keyframes fadeInUp {
      from {
        opacity: 0;
        transform: translateY(20px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    @keyframes slideUp {
      from {
        opacity: 0;
        transform: translateY(100px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    /* Modal Styles */
    .modal {
      display: none;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(15, 23, 42, 0.8);
      backdrop-filter: blur(8px);
      z-index: 1000;
      opacity: 0;
      transition: opacity 0.3s ease;
    }

    .modal.active {
      display: flex;
      opacity: 1;
    }

    .modal-content {
      background: var(--bg-white);
      width: 90%;
      max-width: 450px;
      margin: auto;
      border-radius: var(--radius-lg);
      padding: 2.5rem;
      position: relative;
      transform: translateY(-50px);
      transition: transform 0.3s ease;
      box-shadow: var(--shadow-lg);
    }

    .modal.active .modal-content {
      transform: translateY(0);
    }

    .modal-header {
      text-align: center;
      margin-bottom: 2rem;
      position: relative;
    }

    .modal-title {
      font-size: 1.75rem;
      font-weight: 700;
      color: var(--text-primary);
      margin-bottom: 0.5rem;
    }

    .close-modal {
      position: absolute;
      top: -1rem;
      right: -1rem;
      background: var(--bg-light);
      border: none;
      width: 2.5rem;
      height: 2.5rem;
      border-radius: 50%;
      font-size: 1.25rem;
      color: var(--text-secondary);
      cursor: pointer;
      transition: all 0.3s ease;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .close-modal:hover {
      background: var(--text-primary);
      color: white;
      transform: rotate(90deg);
    }

    .form-group {
      margin-bottom: 1.5rem;
    }

    .form-group label {
      display: block;
      margin-bottom: 0.5rem;
      color: var(--text-primary);
      font-weight: 500;
    }

    .form-group input {
      width: 100%;
      padding: 0.75rem 1rem;
      border: 2px solid var(--border);
      border-radius: var(--radius);
      font-size: 1rem;
      transition: all 0.3s ease;
      background: var(--bg-light);
    }

    .form-group input:focus {
      border-color: var(--primary);
      box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
      outline: none;
    }

    .password-toggle {
      position: relative;
    }

    .password-toggle i {
      position: absolute;
      right: 1rem;
      top: 50%;
      transform: translateY(-50%);
      color: var(--text-secondary);
      cursor: pointer;
      transition: color 0.3s ease;
    }

    .password-toggle i:hover {
      color: var(--text-primary);
    }

    .remember-forgot {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 1.5rem;
    }

    .remember-me {
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }

    .remember-me input[type="checkbox"] {
      width: 1rem;
      height: 1rem;
      border-radius: var(--radius-sm);
      border: 2px solid var(--border);
      cursor: pointer;
    }

    .forgot-password {
      color: var(--primary);
      text-decoration: none;
      font-size: 0.875rem;
      font-weight: 500;
      transition: color 0.3s ease;
    }

    .forgot-password:hover {
      color: var(--primary-dark);
      text-decoration: underline;
    }

    .submit-btn {
      width: 100%;
      padding: 0.875rem 1.5rem;
      background: linear-gradient(45deg, var(--primary), var(--accent));
      color: white;
      border: none;
      border-radius: var(--radius);
      font-size: 1rem;
      font-weight: 500;
      cursor: pointer;
      transition: all 0.3s ease;
      box-shadow: var(--shadow-sm);
    }

    .submit-btn:hover {
      transform: translateY(-2px);
      box-shadow: var(--shadow);
    }

    .form-footer {
      margin-top: 2rem;
      text-align: center;
    }

    .form-footer p {
      color: var(--text-secondary);
    }

    .form-footer a {
      color: var(--primary);
      text-decoration: none;
      font-weight: 500;
      margin-left: 0.5rem;
      transition: color 0.3s ease;
    }

    .form-footer a:hover {
      color: var(--primary-dark);
      text-decoration: underline;
    }

    @media (max-width: 1024px) {
      .contact-info {
        display: none;
      }

      .nav-links {
        gap: 1.5rem;
      }

      .hero h1 {
        font-size: 3rem;
      }
    }

    @media (max-width: 768px) {
      .header-top {
        display: none;
      }

      .main-header {
        padding: 1rem;
      }

      .header-content {
        flex-direction: column;
        gap: 1rem;
      }

      .main-nav {
        flex-direction: column;
        width: 100%;
      }

      .nav-links {
        flex-direction: column;
        width: 100%;
        text-align: center;
        gap: 1rem;
      }

      .user-actions {
        width: 100%;
        justify-content: center;
      }

      .hero {
        height: 400px;
        text-align: center;
      }

      .hero h1 {
        font-size: 2.5rem;
      }

      .search-form {
        margin: 1rem;
        padding: 1.5rem;
      }

      .section-title {
        font-size: 2rem;
      }

      .category-card {
        height: 200px;
      }
    }
  </style>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
<!-- Top Header -->
<div class="header-top">
  <div class="contact-info">
    <a href="tel:+1234567890">
      <i class="fas fa-phone"></i>
      <span>+1 (234) 567-890</span>
    </a>
    <a href="mailto:info@motormanagement.com">
      <i class="fas fa-envelope"></i>
      <span>info@motormanagement.com</span>
    </a>
  </div>
  <div class="social-links">
    <a href="#"><i class="fab fa-facebook"></i></a>
    <a href="#"><i class="fab fa-twitter"></i></a>
    <a href="#"><i class="fab fa-instagram"></i></a>
    <a href="#"><i class="fab fa-linkedin"></i></a>
  </div>
</div>

<!-- Main Header -->
<header class="main-header">
  <div class="header-content">
    <a href="/" class="logo">
      <i class="fas fa-car"></i>
      <span>Motor Management</span>
    </a>
    <nav class="main-nav">
      <ul class="nav-links">
        <li><a href="dashboard.jsp" class="nav-link active">Home</a></li>
        <li><a href="order-motor.jsp" class="nav-link">Order Motor</a></li>
        <li><a href="my-orders.jsp" class="nav-link">My Orders</a></li>
        <li><a href="About_Us.jsp" class="nav-link">About Us</a></li>
        <li><a href="Contact_Us.jsp" class="nav-link">Contact Us</a></li>
      </ul>
      <div class="user-actions">
        <button class="login-btn">Login</button>
        <button class="register-btn">Register</button>
      </div>
    </nav>
  </div>
</header>

<!-- Hero Section -->
<section class="hero">
  <div class="hero-content">
    <h1>Find Your Perfect Motor</h1>
    <p>Rent or buy quality motors for your needs with our extensive collection</p>
  </div>
</section>

<!-- Search Form -->
<form class="search-form">
  <div class="form-group">
    <label for="motor-type">Motor Type</label>
    <select id="motor-type">
      <option value="">All Types</option>
      <option value="electric">Electric</option>
      <option value="petrol">Petrol</option>
      <option value="diesel">Diesel</option>
    </select>
  </div>
  <div class="form-group">
    <label for="power">Power Range</label>
    <select id="power">
      <option value="">Any Power</option>
      <option value="1-3">1-3 kW</option>
      <option value="3-5">3-5 kW</option>
      <option value="5+">5+ kW</option>
    </select>
  </div>
  <div class="form-group">
    <label for="availability">Availability</label>
    <select id="availability">
      <option value="">All</option>
      <option value="available">Available Now</option>
      <option value="upcoming">Coming Soon</option>
    </select>
  </div>
  <button type="submit" class="search-btn">Search Motors</button>
</form>

<div class="container">
  <!-- Categories Section -->
  <h2 class="section-title">Browse by Category</h2>
  <div class="categories">
    <div class="category-card">
      <img src="https://images.unsplash.com/photo-1620285327296-f71539349262?auto=format&fit=crop&w=600&q=80" alt="Electric Motors">
      <div class="category-content">
        <h3>Electric Motors</h3>
        <p>Efficient & Eco-friendly</p>
      </div>
    </div>
    <div class="category-card">
      <img src="https://images.unsplash.com/photo-1565043589221-1a6fd9ae45c7?auto=format&fit=crop&w=600&q=80" alt="Petrol Motors">
      <div class="category-content">
        <h3>Petrol Motors</h3>
        <p>Power & Performance</p>
      </div>
    </div>
    <div class="category-card">
      <img src="https://images.unsplash.com/photo-1619468129361-605ebea04b44?auto=format&fit=crop&w=600&q=80" alt="Industrial Motors">
      <div class="category-content">
        <h3>Industrial Motors</h3>
        <p>Heavy Duty Solutions</p>
      </div>
    </div>
  </div>

  <!-- Featured Motors -->
  <h2 class="section-title">Featured Motors</h2>
  <div class="vehicles-grid">
    <!-- Motor Card 1 -->
    <div class="vehicle-card">
      <div class="vehicle-image">
        <img src="https://images.unsplash.com/photo-1620285327296-f71539349262?auto=format&fit=crop&w=600&q=80" alt="Electric Motor X1">
      </div>
      <div class="vehicle-details">
        <h3 class="vehicle-title">Electric Motor X1</h3>
        <div class="vehicle-price">$1,299.99</div>
        <div class="vehicle-specs">
          <div class="spec-item">
            <i class="fas fa-bolt"></i>
            <span>2.5 kW</span>
          </div>
          <div class="spec-item">
            <i class="fas fa-tachometer-alt"></i>
            <span>1500 RPM</span>
          </div>
          <div class="spec-item">
            <i class="fas fa-check-circle"></i>
            <span>Available</span>
          </div>
          <div class="spec-item">
            <i class="fas fa-star"></i>
            <span>4.8/5</span>
          </div>
        </div>
        <div class="vehicle-actions">
          <a href="#" class="btn btn-primary">Buy Now</a>
          <a href="#" class="btn btn-outline">Rent</a>
        </div>
      </div>
    </div>

    <!-- Motor Card 2 -->
    <div class="vehicle-card">
      <div class="vehicle-image">
        <img src="https://images.unsplash.com/photo-1565043589221-1a6fd9ae45c7?auto=format&fit=crop&w=600&q=80" alt="Petrol Motor P2">
      </div>
      <div class="vehicle-details">
        <h3 class="vehicle-title">Petrol Motor P2</h3>
        <div class="vehicle-price">$2,499.99</div>
        <div class="vehicle-specs">
          <div class="spec-item">
            <i class="fas fa-gas-pump"></i>
            <span>5.0 kW</span>
          </div>
          <div class="spec-item">
            <i class="fas fa-tachometer-alt"></i>
            <span>3000 RPM</span>
          </div>
          <div class="spec-item">
            <i class="fas fa-check-circle"></i>
            <span>Available</span>
          </div>
          <div class="spec-item">
            <i class="fas fa-star"></i>
            <span>4.9/5</span>
          </div>
        </div>
        <div class="vehicle-actions">
          <a href="#" class="btn btn-primary">Buy Now</a>
          <a href="#" class="btn btn-outline">Rent</a>
        </div>
      </div>
    </div>

    <!-- Motor Card 3 -->
    <div class="vehicle-card">
      <div class="vehicle-image">
        <img src="https://images.unsplash.com/photo-1619468129361-605ebea04b44?auto=format&fit=crop&w=600&q=80" alt="Diesel Motor D3">
      </div>
      <div class="vehicle-details">
        <h3 class="vehicle-title">Diesel Motor D3</h3>
        <div class="vehicle-price">$3,999.99</div>
        <div class="vehicle-specs">
          <div class="spec-item">
            <i class="fas fa-oil-can"></i>
            <span>7.5 kW</span>
          </div>
          <div class="spec-item">
            <i class="fas fa-tachometer-alt"></i>
            <span>1800 RPM</span>
          </div>
          <div class="spec-item">
            <i class="fas fa-times-circle"></i>
            <span>Unavailable</span>
          </div>
          <div class="spec-item">
            <i class="fas fa-star"></i>
            <span>4.7/5</span>
          </div>
        </div>
        <div class="vehicle-actions">
          <button class="btn btn-primary" disabled>Buy Now</button>
          <button class="btn btn-outline" disabled>Rent</button>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Login Modal -->
<div class="modal" id="loginModal">
  <div class="modal-content">
    <div class="modal-header">
      <h2 class="modal-title">Login</h2>
      <button class="close-modal">&times;</button>
    </div>
    <form action="login" method="POST" id="loginForm">
      <div class="form-group">
        <label for="loginEmail">Email</label>
        <input type="email" id="loginEmail" name="email" required placeholder="Enter your email">
      </div>
      <div class="form-group">
        <div class="password-toggle">
          <label for="loginPassword">Password</label>
          <input type="password" id="loginPassword" name="password" required placeholder="Enter your password">
          <i class="far fa-eye" id="toggleLoginPassword"></i>
        </div>
      </div>
      <div class="remember-forgot">
        <label class="remember-me">
          <input type="checkbox" name="remember">
          <span>Remember me</span>
        </label>
        <a href="#" class="forgot-password">Forgot Password?</a>
      </div>
      <button type="submit" class="submit-btn">Login</button>
      <div class="form-footer">
        <p>Don't have an account? <a href="#" id="showSignup">Sign up</a></p>
      </div>
    </form>
  </div>
</div>

<!-- Signup Modal -->
<div class="modal" id="signupModal">
  <div class="modal-content">
    <div class="modal-header">
      <h2 class="modal-title">Create Account</h2>
      <button class="close-modal">&times;</button>
    </div>
    <form action="register" method="POST" id="signupForm">
      <div class="form-group">
        <label for="signupName">Full Name</label>
        <input type="text" id="signupName" name="name" required placeholder="Enter your full name">
      </div>
      <div class="form-group">
        <label for="signupEmail">Email</label>
        <input type="email" id="signupEmail" name="email" required placeholder="Enter your email">
      </div>
      <div class="form-group">
        <div class="password-toggle">
          <label for="signupPassword">Password</label>
          <input type="password" id="signupPassword" name="password" required placeholder="Create a password">
          <i class="far fa-eye" id="toggleSignupPassword"></i>
        </div>
      </div>
      <div class="form-group">
        <div class="password-toggle">
          <label for="confirmPassword">Confirm Password</label>
          <input type="password" id="confirmPassword" name="confirmPassword" required placeholder="Confirm your password">
          <i class="far fa-eye" id="toggleConfirmPassword"></i>
        </div>
      </div>
      <button type="submit" class="submit-btn">Create Account</button>
      <div class="form-footer">
        <p>Already have an account? <a href="#" id="showLogin">Login</a></p>
      </div>
    </form>
  </div>
</div>

<!-- Order Modal -->
<div id="orderModal" class="modal">
  <div class="modal-content">
    <button class="close-modal" onclick="closeOrderModal()">&times;</button>
    <div class="modal-header">
      <h2 class="modal-title">Place Order</h2>
    </div>
    <form id="orderForm" onsubmit="return handleOrder(event)">
      <div class="form-group">
        <label for="orderType">Order Type</label>
        <select id="orderType" name="orderType" required onchange="updateOrderSummary()">
          <option value="buy">Buy</option>
          <option value="rent">Rent</option>
        </select>
      </div>
      <div class="form-group" id="rentDurationGroup" style="display: none;">
        <label for="rentDuration">Rental Duration (days)</label>
        <input type="number" id="rentDuration" name="rentDuration" min="1" value="1" onchange="updateOrderSummary()">
      </div>
      <div class="form-group">
        <label for="deliveryAddress">Delivery Address</label>
        <input type="text" id="deliveryAddress" name="deliveryAddress" required>
      </div>
      <div class="form-group">
        <label for="paymentMethod">Payment Method</label>
        <select id="paymentMethod" name="paymentMethod" required>
          <option value="credit">Credit Card</option>
          <option value="debit">Debit Card</option>
          <option value="bank">Bank Transfer</option>
        </select>
      </div>

      <div class="order-summary">
        <h3>Order Summary</h3>
        <div class="summary-item">
          <span>Motor Price</span>
          <span id="motorPrice">$1,299.99</span>
        </div>
        <div class="summary-item" id="rentalFee" style="display: none;">
          <span>Rental Fee</span>
          <span id="rentalAmount">$0.00</span>
        </div>
        <div class="summary-item">
          <span>Delivery Fee</span>
          <span>$49.99</span>
        </div>
        <div class="summary-total">
          <span>Total Amount</span>
          <span id="totalAmount">$1,349.98</span>
        </div>
      </div>

      <button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 1rem;">
        Confirm Order
      </button>
    </form>
  </div>
</div>

<script>
  // Modal functionality
  const loginModal = document.getElementById('loginModal');
  const signupModal = document.getElementById('signupModal');
  const loginBtn = document.querySelector('.login-btn');
  const registerBtn = document.querySelector('.register-btn');
  const closeBtns = document.querySelectorAll('.close-modal');
  const showSignupLink = document.getElementById('showSignup');
  const showLoginLink = document.getElementById('showLogin');

  // Show modals
  loginBtn.addEventListener('click', () => {
    loginModal.classList.add('active');
  });

  registerBtn.addEventListener('click', () => {
    signupModal.classList.add('active');
  });

  // Close modals
  closeBtns.forEach(btn => {
    btn.addEventListener('click', () => {
      loginModal.classList.remove('active');
      signupModal.classList.remove('active');
    });
  });

  // Switch between modals
  showSignupLink.addEventListener('click', (e) => {
    e.preventDefault();
    loginModal.classList.remove('active');
    signupModal.classList.add('active');
  });

  showLoginLink.addEventListener('click', (e) => {
    e.preventDefault();
    signupModal.classList.remove('active');
    loginModal.classList.add('active');
  });

  // Close modal when clicking outside
  window.addEventListener('click', (e) => {
    if (e.target === loginModal || e.target === signupModal) {
      loginModal.classList.remove('active');
      signupModal.classList.remove('active');
    }
  });

  // Toggle password visibility
  const togglePassword = (inputId, toggleId) => {
    const input = document.getElementById(inputId);
    const toggle = document.getElementById(toggleId);

    toggle.addEventListener('click', () => {
      const type = input.getAttribute('type') === 'password' ? 'text' : 'password';
      input.setAttribute('type', type);
      toggle.classList.toggle('fa-eye');
      toggle.classList.toggle('fa-eye-slash');
    });
  };

  togglePassword('loginPassword', 'toggleLoginPassword');
  togglePassword('signupPassword', 'toggleSignupPassword');
  togglePassword('confirmPassword', 'toggleConfirmPassword');

  // Form validation
  document.getElementById('signupForm').addEventListener('submit', function(e) {
    const password = document.getElementById('signupPassword').value;
    const confirmPassword = document.getElementById('confirmPassword').value;

    if (password !== confirmPassword) {
      e.preventDefault();
      alert('Passwords do not match!');
    }
  });

  // Order Modal
  function openOrderModal(type, motorId) {
    const modal = document.getElementById('orderModal');
    const orderType = document.getElementById('orderType');
    const rentDurationGroup = document.getElementById('rentDurationGroup');

    modal.style.display = 'block';
    orderType.value = type;
    rentDurationGroup.style.display = type === 'rent' ? 'block' : 'none';
    updateOrderSummary();
  }

  function closeOrderModal() {
    const modal = document.getElementById('orderModal');
    modal.style.display = 'none';
  }

  // Update Order Summary
  function updateOrderSummary() {
    const orderType = document.getElementById('orderType').value;
    const rentDuration = document.getElementById('rentDuration').value;
    const motorPrice = 1299.99; // This would typically come from the motor data
    const deliveryFee = 49.99;
    const rentalFeePerDay = 49.99;

    const rentalFeeElement = document.getElementById('rentalFee');
    const rentalAmountElement = document.getElementById('rentalAmount');
    const totalAmountElement = document.getElementById('totalAmount');

    let total = deliveryFee;

    if (orderType === 'buy') {
      rentalFeeElement.style.display = 'none';
      total += motorPrice;
    } else {
      rentalFeeElement.style.display = 'flex';
      const rentalFee = rentalFeePerDay * rentDuration;
      rentalAmountElement.textContent = `$${rentalFee.toFixed(2)}`;
      total += rentalFee;
    }

    totalAmountElement.textContent = `$${total.toFixed(2)}`;
  }

  // Handle Order Submission
  function handleOrder(event) {
    event.preventDefault();
    // Add your order submission logic here
    alert('Order placed successfully!');
    closeOrderModal();
    return false;
  }

  // Close modal when clicking outside
  window.onclick = function(event) {
    const modal = document.getElementById('orderModal');
    if (event.target === modal) {
      modal.style.display = 'none';
    }
  }
</script>
</body>
</html>