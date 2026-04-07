<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
<h1>Login</h1>

<!-- Error message if login fails -->
<c:if test="${param.error != null}">
    <p style="color:red;">Invalid username or password.</p>
</c:if>

<!-- Logout message -->
<c:if test="${param.logout != null}">
    <p style="color:green;">You have been logged out successfully.</p>
</c:if>

<!-- Login form -->
<form action="<c:url value='/login'/>" method="POST">
    <p>
        User: <input type="text" name="username" />
    </p>
    <p>
        Password: <input type="password" name="password" />
    </p>
    <p>
        <em>Remember Me:</em> <input type="checkbox" name="remember-me" />
    </p>

    <!-- CSRF token -->
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

    <p>
        <input type="submit" value="Log In" />
    </p>
</form>
</body>
</html>
