<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Course System</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .login-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 100%;
            max-width: 450px;
            animation: fadeInUp 0.5s ease-out;
        }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .login-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 40px 30px;
            text-align: center;
        }
        
        .login-header h2 {
            font-size: 28px;
            margin-bottom: 10px;
            font-weight: 600;
        }
        
        .login-header p {
            font-size: 14px;
            opacity: 0.9;
        }
        
        .login-body {
            padding: 40px 30px;
        }
        
        .form-group {
            margin-bottom: 25px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 500;
            font-size: 14px;
        }
        
        .form-group input {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            font-size: 14px;
            transition: all 0.3s ease;
            outline: none;
            font-family: inherit;
        }
        
        .form-group input:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }
        
        .form-group input:hover {
            border-color: #667eea;
        }
        
        .login-btn {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
            margin-top: 10px;
        }
        
        .login-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }
        
        .login-btn:active {
            transform: translateY(0);
        }
        
        .register-link {
            text-align: center;
            margin-top: 25px;
            padding-top: 20px;
            border-top: 1px solid #e0e0e0;
        }
        
        .register-link a {
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }
        
        .register-link a:hover {
            color: #764ba2;
            text-decoration: underline;
        }
        
        .alert {
            padding: 12px 15px;
            border-radius: 10px;
            margin-bottom: 20px;
            font-size: 14px;
            animation: slideIn 0.3s ease-out;
        }
        
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .alert-error {
            background-color: #fee;
            color: #c33;
            border-left: 4px solid #c33;
        }
        
        .alert-success {
            background-color: #efe;
            color: #3c3;
            border-left: 4px solid #3c3;
        }
        
        .alert-info {
            background-color: #e3f2fd;
            color: #1976d2;
            border-left: 4px solid #1976d2;
        }
        
        .icon {
            display: inline-block;
            margin-right: 8px;
        }
        
        @media (max-width: 480px) {
            .login-header {
                padding: 30px 20px;
            }
            
            .login-header h2 {
                font-size: 24px;
            }
            
            .login-body {
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <h2>🎓 Course System</h2>
            <p>Welcome！Please Login</p>
        </div>
        
        <div class="login-body">
            <% if (request.getParameter("error") != null) { %>
                <div class="alert alert-error">
                    <span class="icon">❌</span>
                    User name or password not correct.Please try again.
                </div>
            <% } %>
            
            <% if (request.getParameter("registered") != null) { %>
                <div class="alert alert-success">
                    <span class="icon">✅</span>
                    Register Success！Please login with your account.
                </div>
            <% } %>
            
            <% if (request.getParameter("logout") != null) { %>
                <div class="alert alert-info">
                    <span class="icon">👋</span>
                    Login out success!
                </div>
            <% } %>
            
            <form method="post" action="/login">
                <!-- CSRF token -->
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                
                <div class="form-group">
                    <label>📧 User Name</label>
                    <input type="text" name="username" placeholder="Please enter user name" required autofocus>
                </div>
                
                <div class="form-group">
                    <label>🔒 Password</label>
                    <input type="password" name="password" placeholder="Please enter password" required>
                </div>
                
                <button type="submit" class="login-btn">Login</button>
            </form>
            
            <div class="register-link">
                Don't have account？ <a href="/register">Register now</a>
            </div>
        </div>
    </div>
</body>
</html>