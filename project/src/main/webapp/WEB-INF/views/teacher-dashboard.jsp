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

    <table border="1">
        <thead>
            <tr>
                <th>Course Code</th>
                <th>Course Name</th>
                <th>Credits</th>
                <th>Description</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="course" items="${courses}">
            <tr>
                <td>${course.courseId}</td>
                <td>${course.courseName}</td>
                <td>${course.credits}</td>
                <td>${course.description}</td>
                <td>
                    <a href="/teacher/course/edit/${course.id}" style="color: #667eea; margin-right: 10px;">Edit</a>
                    <a href="/teacher/course/delete/${course.id}" style="color: #e24a4a;"
                       onclick="return confirm('Delete this course?')">Delete</a>
                </td>
            </tr>
        </c:forEach>
        <c:if test="${empty courses}">
            <tr>
                <td colspan="5" style="text-align: center; color: #718096; padding: 20px;">
                    You haven't created any courses yet.
            </tr>
        </c:if>
        </tbody>
    </table>

    <div style="margin-top: 20px;">
        <a href="/home" style="color: #666; text-decoration: none;">← Back to Profile</a>
    </div>
</body>
</html>
