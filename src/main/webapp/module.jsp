<%@ page import="com.example.course.ModuleRepo" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.course.entity.Modules" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Module Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #f4f4f9;
            font-family: 'Arial', sans-serif;
        }

        .container {
            margin-top: 50px;
        }

        .table-container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        table {
            border-radius: 15px;
            overflow: hidden;
            border-collapse: collapse;
        }

        th {
            background-color: #0056b3;
            color: #ffffff;
            text-align: center;
        }

        tr:hover {
            background-color: #e9ecef;
        }

        tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        .btn {
            transition: all 0.3s ease;
        }

        .btn-dark {
            background-color: #0056b3;
            color: #ffffff;
            border: none;
        }

        .btn-dark:hover {
            background-color: #003f88;
        }

        .btn-danger {
            background-color: #dc3545;
            color: #ffffff;
            border: none;
        }

        .btn-danger:hover {
            background-color: #b21f2d;
        }

        .btn-secondary {
            background-color: #6c757d;
            color: #ffffff;
            border: none;
        }

        .btn-secondary:hover {
            background-color: #5a6368;
        }
    </style>
</head>
<body>
<%
    // courseId parametrini olish va uni int ga o'zgartirish
    String id = request.getParameter("courseId");
    Integer courseId = Integer.parseInt(id);

    // Modules ro'yxatini olish
    ModuleRepo moduleRepo = new ModuleRepo();
    List<Modules> modules = moduleRepo.findAll();
%>
<div class="container">

    <!-- Button to add module -->
    <div class="row justify-content-center mt-4">
        <div class="col-md-6 text-center">
            <a class="btn btn-warning btn-lg" href="AddGroup.jsp">Add Group</a>
        </div>
    </div>


    <div class="row justify-content-center mt-5">
        <div class="col-md-8">
            <!-- Back button -->
            <div class="mb-3">
                <a href="javascript:history.back()" class="btn btn-secondary btn-sm">Back</a>
            </div>
            <div class="table-container">
                <table class="table table-hover text-center">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Course Name</th>
                        <th>Go to Group</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        // Modules mavjudligini tekshirish
                        if (modules != null && !modules.isEmpty()) {
                            for (Modules module : modules) {
                                // Kurs id bilan taqqoslash
                                if (module.getCourse().getId().equals(courseId)) {
                    %>
                    <tr>
                        <td><%= module.getId() %>
                        </td>
                        <td><%= module.getName() %>
                        </td>
                        <td><%= module.getCourse().getName() %>
                        </td>
                        <td>
                            <a href="/group.jsp?moduleId=<%= module.getId() %>" class="btn btn-dark btn-sm">Go</a>
                        </td>
                        <td>
                            <form action="/module/delete" method="post" class="d-inline">
                                <input type="hidden" name="moduleId" value="<%= module.getId() %>">
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="5" class="text-muted">No modules available</td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+qtm1D9Lv0PDxOe0chY+aX1b12lK9"
        crossorigin="anonymous"></script>
</body>
</html>
