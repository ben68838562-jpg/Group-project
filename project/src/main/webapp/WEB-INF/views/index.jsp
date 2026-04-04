<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course system</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }
        .container { max-width: 1200px; margin: 0 auto; padding: 20px; }
        .navbar {
            background: white;
            border-radius: 15px;
            padding: 20px 30px;
            margin-bottom: 30px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }
        .logo h1 { color: #667eea; font-size: 24px; }
        .nav-links a, .nav-links button {
            color: #666;
            text-decoration: none;
            margin-left: 20px;
            padding: 8px 20px;
            border-radius: 25px;
            transition: all 0.3s;
            background: none;
            border: none;
            cursor: pointer;
            font-size: 14px;
        }
        .nav-links a:hover, .nav-links button:hover {
            background: #667eea;
            color: white;
        }
        .hero {
            background: white;
            border-radius: 20px;
            padding: 50px;
            margin-bottom: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            text-align: center;
        }
        .hero h1 { font-size: 48px; color: #333; margin-bottom: 20px; }
        .hero p { font-size: 18px; color: #666; line-height: 1.6; }
        .section {
            background: white;
            border-radius: 20px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .section h2 {
            color: #667eea;
            margin-bottom: 20px;
            font-size: 28px;
            border-left: 4px solid #667eea;
            padding-left: 15px;
        }
        .lecture-item, .poll-item {
            padding: 15px;
            margin-bottom: 15px;
            border: 1px solid #e0e0e0;
            border-radius: 10px;
            transition: all 0.3s;
        }
        .lecture-item:hover, .poll-item:hover {
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transform: translateY(-2px);
        }
        .lecture-title, .poll-question {
            font-size: 18px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }
        .lecture-title a, .poll-question a {
            color: #667eea;
            text-decoration: none;
        }
        .lecture-title a:hover, .poll-question a:hover {
            text-decoration: underline;
        }
        .lecture-summary {
            color: #666;
            font-size: 14px;
            margin-bottom: 10px;
        }
        .badge {
            display: inline-block;
            padding: 4px 12px;
            background: #e0e0e0;
            border-radius: 20px;
            font-size: 12px;
            color: #666;
        }
        .admin-buttons {
            margin-top: 10px;
        }
        .btn-sm {
            padding: 5px 10px;
            font-size: 12px;
            margin-right: 10px;
            background: #667eea;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }
        .btn-danger {
            background: #e74c3c;
        }
        @media (max-width: 768px) {
            .navbar { flex-direction: column; text-align: center; }
            .nav-links { margin-top: 15px; }
            .hero h1 { font-size: 32px; }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="navbar">
            <div class="logo"><h1>Course system</h1></div>
            <div class="nav-links">
                <sec:authorize access="isAuthenticated()">
                    <a href="/home">Personal Homepage</a>
                    <a href="/profile">Profile</a>
                    <sec:authorize access="hasRole('TEACHER')">
                        <a href="/admin/users">Manage User</a>
                        <a href="/lecture/add">Add Lecture</a>
                        <a href="/poll/add">Vote</a>
                    </sec:authorize>
                    <form method="post" action="/logout" style="display: inline;">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <button type="submit">登出</button>
                    </form>
                </sec:authorize>
                <sec:authorize access="isAnonymous()">
                    <a href="/login">Login</a>
                    <a href="/register">Register</a>
                </sec:authorize>
            </div>
        </div>
        
        <div class="hero">
            <h1>🎓 Welcome to the course system</h1>
            <p>Learning Spring Boot、Spring MVC、Spring Security to build web application</p>
        </div>
        
        <div class="section">
            <h2>Lecture List</h2>
            <c:forEach items="${lectures}" var="lecture">
                <div class="lecture-item">
                    <div class="lecture-title">
                        <a href="/lecture/${lecture.id}">${lecture.title}</a>
                    </div>
                    <div class="lecture-summary">${lecture.summary}</div>
                    <span class="badge">💬 ${lecture.comments.size()} comment</span>
                    <sec:authorize access="hasRole('TEACHER')">
                        <div class="admin-buttons">
                            <a href="/lecture/delete/${lecture.id}" class="btn-sm btn-danger" onclick="return confirm('Are you sure to delete？')">Delete</a>
                        </div>
                    </sec:authorize>
                </div>
            </c:forEach>
        </div>
        
        <div class="section">
            <h2>🗳️ Vote List</h2>
            <c:forEach items="${polls}" var="poll">
                <div class="poll-item">
                    <div class="poll-question">
                        <a href="/poll/${poll.id}">${poll.question}</a>
                    </div>
                    <span class="badge">🗳️ ${poll.options.size()} Options | 💬 ${poll.comments.size()} Comment</span>
                    <sec:authorize access="hasRole('TEACHER')">
                        <div class="admin-buttons">
                            <a href="/poll/delete/${poll.id}" class="btn-sm btn-danger" onclick="return confirm('Are you sure to delete？')">Delete</a>
                        </div>
                    </sec:authorize>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>