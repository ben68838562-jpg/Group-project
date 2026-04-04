<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Personal Homepage</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .navbar {
            background: white;
            border-radius: 15px;
            padding: 20px 30px;
            margin-bottom: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }
        
        .logo h1 {
            color: #667eea;
            font-size: 24px;
        }
        
        .user-info {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        
        .welcome-text {
            color: #666;
            font-weight: 500;
        }
        
        .username {
            color: #667eea;
            font-weight: bold;
        }
        
        .logout-btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            padding: 8px 20px;
            border-radius: 25px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 500;
            transition: transform 0.2s;
        }
        
        .logout-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }
        
        .hero {
            background: white;
            border-radius: 20px;
            padding: 50px;
            margin-bottom: 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        
        .hero h2 {
            font-size: 36px;
            color: #333;
            margin-bottom: 20px;
        }
        
        .hero p {
            font-size: 18px;
            color: #666;
            margin-bottom: 30px;
        }
        
        .info-card {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }
        
        .info-card h3 {
            color: #667eea;
            margin-bottom: 20px;
            font-size: 24px;
        }
        
        .info-item {
            padding: 15px;
            background: #f8f9fa;
            border-radius: 10px;
            margin-bottom: 15px;
        }
        
        .info-label {
            font-weight: 600;
            color: #333;
            margin-bottom: 5px;
        }
        
        .info-value {
            color: #667eea;
            font-size: 18px;
            font-weight: 500;
        }
        
        .back-link {
            display: inline-block;
            color: #667eea;
            text-decoration: none;
            margin-top: 20px;
            font-weight: 500;
            transition: color 0.3s;
        }
        
        .back-link:hover {
            color: #764ba2;
            text-decoration: underline;
        }
        
        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                text-align: center;
            }
            
            .user-info {
                margin-top: 15px;
                flex-direction: column;
            }
            
            .hero h2 {
                font-size: 28px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="navbar">
            <div class="logo">
                <h1>🎓 Course system</h1>
            </div>
            <div class="user-info">
                <div class="welcome-text">
                    Welcome, <span class="username"><sec:authentication property="name"/></span>
                </div>
                <form method="post" action="/logout" style="display: inline;">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit" class="logout-btn">Logout</button>
                </form>
            </div>
        </div>
        
        <div class="hero">
            <h2>🎉 Login Success！</h2>
            <p>Welcome to your personal page</p>
        </div>
        
        <div class="info-card">
            <h3>📊 Personal Information</h3>
            <div class="info-item">
                <div class="info-label">User name</div>
                <div class="info-value"><sec:authentication property="name"/></div>
            </div>
            <div class="info-item">
                <div class="info-label">User Right</div>
                <div class="info-value"><sec:authentication property="authorities"/></div>
            </div>
        </div>
        
        <div class="info-card">
            <h3>📚 My Course</h3>
            <div class="info-item">
                <div class="info-label">Processing</div>
                <div class="info-value">Spring Boot </div>
            </div>
            <div class="info-item">
                <div class="info-label">Finished course</div>
                <div class="info-value">Java Fundamental</div>
            </div>
        </div>
        
        <a href="/index" class="back-link">← Back to Home Page</a>
    </div>
</body>
</html>
