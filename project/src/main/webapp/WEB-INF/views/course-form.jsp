<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Form</title>

</head>
<body>
<div>
    <h2>Course Form</h2>
    <p>Welcome back,
        <sec:authentication property="principal.username"/>
</div>
<div class="container"
     style="max-width: 600px; margin: 50px auto; background: white; padding: 30px; border-radius: 10px;">
    <h2>${course.id == null ? 'Add new course' : 'Edit Course'}</h2>

    <form:form action="/teacher/course/save" method="post" modelAttribute="course">
        <form:hidden path="id"/>
        <div style="margin-bottom: 15px;">
            <label>Course Code (e.g., CS101):</label><br/>
            <form:input path="courseId" required="true" style="width: 100%; padding: 8px;"/>
        </div>

        <div style="margin-bottom: 15px;">
            <label>Course Name:</label><br/>
            <form:input path="courseName" required="true" style="width: 100%; padding: 8px;"/>
        </div>

        <div style="margin-bottom: 15px;">
            <label>Credits:</label><br/>
            <form:input type="number" path="credits" required="true" style="width: 100%; padding: 8px;"/>
        </div>

        <div style="margin-bottom: 15px;">
            <label>Description:</label><br/>
            <form:textarea path="description" required="true" rows="4" style="width: 100%; padding: 8px;"/>
        </div>

        <button type="submit">
            ${course.id == null ? 'Create Course' : 'Save Changes'}
        </button>
        <a href="/teacher/dashboard" style="margin-left: 10px; color: #666;">Cancel</a>
    </form:form>
</div>
</body>
</html>
