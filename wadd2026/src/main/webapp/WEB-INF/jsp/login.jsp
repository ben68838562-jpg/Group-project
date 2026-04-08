<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - Course System</title>
    <style>
        /* Keep your existing CSS styles here */
    </style>
</head>
<body>
<div class="login-container">
    <div class="login-header">
        <h2>🎓 Course System</h2>
        <p>Welcome! Please Login</p>
    </div>

    <div class="login-body">
        <!-- Error message -->
        <c:if test="${param.error != null}">
            <div class="alert alert-error">
                <span class="icon">❌</span>
                Username or password incorrect. Please try again.
            </div>
        </c:if>

        <!-- Registration success -->
        <c:if test="${param.registered != null}">
            <div class="alert alert-success">
                <span class="icon">✅</span>
                Registration successful! Please login with your account.
            </div>
        </c:if>

        <!-- Logout success -->
        <c:if test="${param.logout != null}">
            <div class="alert alert-info">
                <span class="icon">👋</span>
                You have been logged out successfully.
            </div>
        </c:if>

        <!-- Login form -->
        <form method="post" action="<c:url value='/login'/>">
            <!-- CSRF token -->
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <div class="form-group">
                <label>📧 Username</label>
                <input type="text" name="username" placeholder="Enter username" required autofocus>
            </div>

            <div class="form-group">
                <label>🔒 Password</label>
                <input type="password" name="password" placeholder="Enter password" required>
            </div>

            <div class="form-group">
                <em>Remember Me:</em>
                <input type="checkbox" name="remember-me" />
            </div>

            <button type="submit" class="login-btn">Login</button>
        </form>

        <div class="register-link">
            Don’t have an account? <a href="<c:url value='/register'/>">Register now</a>
        </div>
    </div>
</div>
</body>
</html>
