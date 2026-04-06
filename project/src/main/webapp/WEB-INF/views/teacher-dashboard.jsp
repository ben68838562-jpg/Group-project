<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Dashboard</title>

</head>
<body>
    <div>
        <h2>Teacher Dashboard</h2>
        <p>Welcome back, <sec:authentication property="principal.username"/>
    </div>

    <h2>Manage Courses</h2>
    <a href="/teacher/course/new">Add New Course</a>
</body>
</html>