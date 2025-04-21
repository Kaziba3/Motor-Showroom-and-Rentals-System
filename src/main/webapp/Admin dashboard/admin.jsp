<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - Motor Management System</title>
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
            min-height: 100vh;
            display: flex;
        }

        /* Sidebar */
        .sidebar {
            width: 280px;
            background: var(--secondary);
            color: white;
            padding: 2rem;
            position: fixed;
            height: 100vh;
            overflow-y: auto;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .nav-item {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 0.75rem 1rem;
            color: var(--text-light);
            text-decoration: none;
            border-radius: var(--radius);
            margin-bottom: 0.5rem;
            transition: all 0.3s ease;
        }

        .nav-item:hover,
        .nav-item.active {
            background: var(--primary);
            color: white;
        }

        .nav-item i {
            width: 20px;
            text-align: center;
        }

        /* Main Content */
        .main-content {
            flex: 1;
            margin-left: 280px;
            padding: 2rem;
            min-height: 100vh;
        }

        /* Header */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            background: var(--bg-white);
            padding: 1rem;
            border-radius: var(--radius);
            box-shadow: var(--shadow-sm);
        }

        .search-bar {
            display: flex;
            align-items: center;
            background: var(--bg-light);
            padding: 0.5rem 1rem;
            border-radius: var(--radius);
            width: 300px;
        }

        .search-bar input {
            border: none;
            background: transparent;
            outline: none;
            padding: 0.5rem;
            width: 100%;
        }

        .user-menu {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .notification-bell {
            position: relative;
            cursor: pointer;
        }

        .notification-badge {
            position: absolute;
            top: -5px;
            right: -5px;
            background: var(--danger);
            color: white;
            font-size: 0.75rem;
            padding: 0.25rem 0.5rem;
            border-radius: 50%;
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: var(--primary);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            cursor: pointer;
        }

        /* Stats Grid */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: var(--bg-white);
            padding: 1.5rem;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
        }

        .stat-title {
            color: var(--text-secondary);
            font-size: 0.875rem;
            margin-bottom: 0.5rem;
        }

        .stat-value {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--text-primary);
        }

        .stat-trend {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-top: 0.5rem;
            font-size: 0.875rem;
        }

        .trend-up {
            color: var(--success);
        }

        .trend-down {
            color: var(--danger);
        }

        /* Motor Management */
        .section-title {
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            color: var(--text-primary);
        }

        .motor-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .motor-card {
            background: var(--bg-white);
            border-radius: var(--radius);
            overflow: hidden;
            box-shadow: var(--shadow);
            transition: all 0.3s ease;
        }

        .motor-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-lg);
        }

        .motor-image {
            height: 200px;
            position: relative;
            overflow: hidden;
        }

        .motor-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .motor-card:hover .motor-image img {
            transform: scale(1.1);
        }

        .motor-details {
            padding: 1.5rem;
        }

        .motor-title {
            font-size: 1.125rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .motor-specs {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 0.5rem;
            margin-bottom: 1rem;
        }

        .spec-item {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--text-secondary);
            font-size: 0.875rem;
        }

        .motor-actions {
            display: flex;
            gap: 0.5rem;
        }

        .btn {
            padding: 0.5rem 1rem;
            border-radius: var(--radius);
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            border: none;
        }

        .btn-primary {
            background: var(--primary);
            color: white;
        }

        .btn-danger {
            background: var(--danger);
            color: white;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow);
        }

        /* Add Motor Form */
        .add-motor-form {
            background: var(--bg-white);
            padding: 2rem;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            margin-bottom: 2rem;
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

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 2px solid var(--border);
            border-radius: var(--radius);
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
            outline: none;
        }

        @media (max-width: 1024px) {
            .sidebar {
                width: 250px;
            }

            .main-content {
                margin-left: 250px;
            }
        }

        @media (max-width: 768px) {
            body {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
                padding: 1rem;
            }

            .main-content {
                margin-left: 0;
                padding: 1rem;
            }

            .header {
                flex-direction: column;
                gap: 1rem;
            }

            .search-bar {
                width: 100%;
            }

            .motor-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
<!-- Sidebar -->
<div class="sidebar">
    <div class="logo">Admin Panel</div>
    <nav>
        <a href="dashboard.jsp" class="nav-item active">
            <i class="fas fa-home"></i>
            Dashboard
        </a>
        <a href="manage-motors.jsp" class="nav-item">
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
        <a href="about.jsp" class="nav-item">
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
        <div class="search-bar">
            <i class="fas fa-search"></i>
            <input type="text" placeholder="Search...">
        </div>
        <div class="user-menu">
            <div class="notification-bell">
                <i class="fas fa-bell"></i>
                <span class="notification-badge">3</span>
            </div>
            <div class="user-avatar">A</div>
        </div>
    </div>

    <!-- Stats Overview -->
    <div class="stats-grid">
        <div class="stat-card">
            <div class="stat-title">Total Motors</div>
            <div class="stat-value">24</div>
            <div class="stat-trend trend-up">
                <i class="fas fa-arrow-up"></i>
                <span>12% from last month</span>
            </div>
        </div>
        <div class="stat-card">
            <div class="stat-title">Active Orders</div>
            <div class="stat-value">15</div>
            <div class="stat-trend trend-up">
                <i class="fas fa-arrow-up"></i>
                <span>8% from last month</span>
            </div>
        </div>
        <div class="stat-card">
            <div class="stat-title">Total Revenue</div>
            <div class="stat-value">$12,450</div>
            <div class="stat-trend trend-up">
                <i class="fas fa-arrow-up"></i>
                <span>15% from last month</span>
            </div>
        </div>
        <div class="stat-card">
            <div class="stat-title">Available Motors</div>
            <div class="stat-value">18</div>
            <div class="stat-trend trend-down">
                <i class="fas fa-arrow-down"></i>
                <span>3% from last month</span>
            </div>
        </div>
    </div>

    <!-- Add New Motor -->
    <div class="add-motor-form">
        <h2 class="section-title">Add New Motor</h2>
        <form id="addMotorForm" onsubmit="return handleAddMotor(event)">
            <div class="form-group">
                <label for="motorName">Motor Name</label>
                <input type="text" id="motorName" name="motorName" required>
            </div>
            <div class="form-group">
                <label for="motorType">Motor Type</label>
                <select id="motorType" name="motorType" required>
                    <option value="">Select Type</option>
                    <option value="electric">Electric</option>
                    <option value="petrol">Petrol</option>
                    <option value="diesel">Diesel</option>
                </select>
            </div>
            <div class="form-group">
                <label for="power">Power (kW)</label>
                <input type="number" id="power" name="power" step="0.1" required>
            </div>
            <div class="form-group">
                <label for="price">Price</label>
                <input type="number" id="price" name="price" step="0.01" required>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" rows="4" required></textarea>
            </div>
            <div class="form-group">
                <label for="motorImage">Motor Image</label>
                <input type="file" id="motorImage" name="motorImage" accept="image/*" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Motor</button>
        </form>
    </div>

    <!-- Motor List -->
    <h2 class="section-title">Available Motors</h2>
    <div class="motor-grid">
        <!-- Motor Card Example -->
        <div class="motor-card">
            <div class="motor-image">
                <img src="https://images.unsplash.com/photo-1620285327296-f71539349262?auto=format&fit=crop&w=600&q=80" alt="Electric Motor X1">
            </div>
            <div class="motor-details">
                <h3 class="motor-title">Electric Motor X1</h3>
                <div class="motor-specs">
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
                        <i class="fas fa-dollar-sign"></i>
                        <span>$1,299.99</span>
                    </div>
                </div>
                <div class="motor-actions">
                    <button class="btn btn-primary" onclick="editMotor(1)">Edit</button>
                    <button class="btn btn-danger" onclick="deleteMotor(1)">Delete</button>
                </div>
            </div>
        </div>
        <!-- More motor cards -->
    </div>
</div>

<script>
    // Handle Add Motor Form Submission
    function handleAddMotor(event) {
        event.preventDefault();
        // Add your form submission logic here
        alert('Motor added successfully!');
        return false;
    }

    // Edit Motor
    function editMotor(motorId) {
        // Add your edit logic here
        alert('Edit motor ' + motorId);
    }

    // Delete Motor
    function deleteMotor(motorId) {
        if (confirm('Are you sure you want to delete this motor?')) {
            // Add your delete logic here
            alert('Motor deleted successfully!');
        }
    }
</script>
</body>
</html>