<%@ page import="com.example.course.ModuleRepo" %>
<%@ page import="com.example.course.entity.Modules" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Add Module</title>
</head>
<body>
<%
    ModuleRepo moduleRepo = new ModuleRepo();
    List<Modules> modules = moduleRepo.findAll();

%>
<div class="row">
    <div class="col-6 offset-3">
        <div class="card">
            <div class="card-header">
                Add Group
            </div>
            <div class="card-body">
                <form action="/group/add" method="post">
                    <div class="form-group">
                        <input class="form-control" type="text" name="name" placeholder="Group Name" required>
                    </div>

                    <div class="form-group">
                        <select name="moduleId" class="form-control" required>
                            <option selected disabled value="">Select Module</option>
                            <% if (modules != null && !modules.isEmpty()) { %>
                            <% for (Modules module : modules) { %>
                            <option value="<%=module.getId()%>"><%=module.getName()%>
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
