<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Contact Us - Customer Dashboard</title>
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

    .nav-links a.active {
      color: var(--primary);
    }

    .nav-links a.active::after {
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

    /* Contact Content */
    .contact-section {
      max-width: 1400px;
      margin: 4rem auto;
      padding: 0 2rem;
      position: relative;
    }

    .back-to-dashboard {
      position: absolute;
      top: -3rem;
      left: 2rem;
      display: flex;
      align-items: center;
      gap: 0.5rem;
      padding: 0.75rem 1.5rem;
      background: var(--bg-white);
      border: 2px solid var(--primary);
      border-radius: var(--radius);
      color: var(--primary);
      text-decoration: none;
      font-weight: 500;
      transition: all 0.3s ease;
      box-shadow: var(--shadow-sm);
    }

    .back-to-dashboard:hover {
      background: var(--primary);
      color: white;
      transform: translateY(-2px);
      box-shadow: var(--shadow);
    }

    .section-title {
      font-size: 2.5rem;
      font-weight: 700;
      margin-bottom: 2rem;
      color: var(--text-primary);
      position: relative;
      padding-bottom: 1rem;
    }

    .section-title::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 0;
      width: 100px;
      height: 4px;
      background: linear-gradient(to right, var(--primary), var(--accent));
      border-radius: var(--radius);
    }

    .contact-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: 4rem;
      margin-top: 2rem;
    }

    .contact-info-section {
      display: grid;
      gap: 2rem;
    }

    .info-item {
      display: flex;
      align-items: center;
      gap: 1.5rem;
      padding: 1.5rem;
      background: var(--bg-white);
      border-radius: var(--radius);
      box-shadow: var(--shadow);
      transition: transform 0.3s ease;
    }

    .info-item:hover {
      transform: translateY(-5px);
    }

    .info-icon {
      width: 50px;
      height: 50px;
      border-radius: 50%;
      background: linear-gradient(45deg, var(--primary), var(--accent));
      color: white;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1.5rem;
    }

    .info-content h3 {
      font-size: 1.25rem;
      font-weight: 600;
      margin-bottom: 0.5rem;
      color: var(--text-primary);
    }

    .info-content p {
      color: var(--text-secondary);
      font-size: 1rem;
    }

    .contact-form {
      background: var(--bg-white);
      padding: 2rem;
      border-radius: var(--radius);
      box-shadow: var(--shadow);
    }

    .form-group {
      margin-bottom: 1.5rem;
    }

    .form-group label {
      display: block;
      margin-bottom: 0.5rem;
      font-weight: 500;
      color: var(--text-primary);
    }

    .form-group input,
    .form-group textarea {
      width: 100%;
      padding: 0.75rem 1rem;
      border: 2px solid var(--border);
      border-radius: var(--radius);
      font-size: 1rem;
      transition: all 0.3s ease;
    }

    .form-group input:focus,
    .form-group textarea:focus {
      border-color: var(--primary);
      box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
      outline: none;
    }

    .form-group textarea {
      min-height: 150px;
      resize: vertical;
    }

    .submit-btn {
      background: linear-gradient(45deg, var(--primary), var(--accent));
      color: white;
      padding: 0.75rem 1.5rem;
      border: none;
      border-radius: var(--radius);
      font-weight: 500;
      cursor: pointer;
      transition: all 0.3s ease;
    }

    .submit-btn:hover {
      transform: translateY(-2px);
      box-shadow: var(--shadow);
    }

    .map-container {
      margin-top: 4rem;
      border-radius: var(--radius);
      overflow: hidden;
      box-shadow: var(--shadow);
    }

    .map-container iframe {
      width: 100%;
      height: 400px;
      border: none;
    }

    @media (max-width: 768px) {
      .header-content {
        flex-direction: column;
        gap: 1rem;
      }

      .nav-links {
        flex-direction: column;
        align-items: center;
        gap: 1rem;
      }

      .user-actions {
        margin-top: 1rem;
      }

      .contact-grid {
        grid-template-columns: 1fr;
      }

      .map-container iframe {
        height: 300px;
      }
    }
  </style>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
<!-- Header Top -->
<div class="header-top">
  <div class="contact-info">
    <a href="tel:+1234567890">
      <i class="fas fa-phone"></i>
      +1 (234) 567-890
    </a>
    <a href="mailto:info@motormanagement.com">
      <i class="fas fa-envelope"></i>
      info@motormanagement.com
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
    <a href="dashboard.jsp" class="logo">
      <i class="fas fa-motorcycle"></i>
      <span>Motor Management</span>
    </a>
    <nav class="main-nav">
      <ul class="nav-links">
        <li><a href="dashboard.jsp">Home</a></li>
        <li><a href="order-motor.jsp">Order Motor</a></li>
        <li><a href="my-orders.jsp">My Orders</a></li>
        <li><a href="about.jsp">About Us</a></li>
        <li><a href="contact.jsp" class="active">Contact Us</a></li>
      </ul>
      <div class="user-actions">
        <button class="login-btn" onclick="openLoginModal()">Login</button>
        <button class="register-btn" onclick="openSignupModal()">Register</button>
      </div>
    </nav>
  </div>
</header>

<!-- Contact Section -->
<section class="contact-section">
  <a href="dashboard.jsp" class="back-to-dashboard">
    <i class="fas fa-arrow-left"></i>
    Back to Dashboard
  </a>
  <h1 class="section-title">Contact Us</h1>
  <div class="contact-grid">
    <div class="contact-info-section">
      <div class="info-item">
        <div class="info-icon">
          <i class="fas fa-map-marker-alt"></i>
        </div>
        <div class="info-content">
          <h3>Our Location</h3>
          <p>123 Motor Street, City, Country</p>
        </div>
      </div>
      <div class="info-item">
        <div class="info-icon">
          <i class="fas fa-phone"></i>
        </div>
        <div class="info-content">
          <h3>Phone Number</h3>
          <p>+1 (234) 567-890</p>
        </div>
      </div>
      <div class="info-item">
        <div class="info-icon">
          <i class="fas fa-envelope"></i>
        </div>
        <div class="info-content">
          <h3>Email Address</h3>
          <p>info@motormanagement.com</p>
        </div>
      </div>
      <div class="info-item">
        <div class="info-icon">
          <i class="fas fa-clock"></i>
        </div>
        <div class="info-content">
          <h3>Working Hours</h3>
          <p>Monday - Friday: 9:00 AM - 6:00 PM</p>
        </div>
      </div>
    </div>

    <form class="contact-form" onsubmit="return handleContactForm(event)">
      <div class="form-group">
        <label for="name">Full Name</label>
        <input type="text" id="name" name="name" required>
      </div>
      <div class="form-group">
        <label for="email">Email Address</label>
        <input type="email" id="email" name="email" required>
      </div>
      <div class="form-group">
        <label for="subject">Subject</label>
        <input type="text" id="subject" name="subject" required>
      </div>
      <div class="form-group">
        <label for="message">Message</label>
        <textarea id="message" name="message" required></textarea>
      </div>
      <button type="submit" class="submit-btn">Send Message</button>
    </form>
  </div>

  <div class="map-container">
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3151.8354345096036!2d144.95373631531978!3d-37.817327679751734!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6ad65d4c2b349649%3A0xb6899234e561db11!2sMelbourne%20VIC%2C%20Australia!5e0!3m2!1sen!2sus!4v1635167261304!5m2!1sen!2sus" allowfullscreen="" loading="lazy"></iframe>
  </div>
</section>

<script>
  function openLoginModal() {
    // Add your login modal logic here
  }

  function openSignupModal() {
    // Add your signup modal logic here
  }

  function handleContactForm(event) {
    event.preventDefault();
    // Add your form submission logic here
    alert('Message sent successfully!');
    return false;
  }
</script>
</body>
</html>