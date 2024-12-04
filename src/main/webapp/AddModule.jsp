<%@ page import="java.util.List" %>
<%@ page import="com.example.course.entity.Courses" %>
<%@ page import="com.example.course.CourseRepo" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Add Module</title>
</head>
<body>
<%
    CourseRepo courseRepo = new CourseRepo();
    List<Courses> courses = courseRepo.findAll();
%>
<div class="row">
    <div class="col-6 offset-3">
        <div class="card">
            <div class="card-header">
                Add Module
            </div>
            <div class="card-body">
                <form action="/module/add" method="post">
                    <div class="form-group">
                        <input class="form-control" type="text" name="name" placeholder="Module Name" required>
                    </div>

                    <div class="form-group">
                        <select name="courseId" class="form-control" required>
                            <option selected disabled value="">Select Course</option>
                            <% if (courses != null && !courses.isEmpty()) { %>
                            <% for (Courses cours : courses) { %>
                            <option value="<%=cours.getId()%>"><%=cours.getName()%>
                            </option>
                            <% } %>
                            <% } else { %>
                            <option value="" disabled>No courses available</option>
                            <% } %>
                        </select>
                    </div>

                    <button class="btn btn-success mt-3" type="submit">Save</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
