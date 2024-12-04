package com.example.course.servlets;

import com.example.course.CourseRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/course/delete")
public class DeleteCourseServlet extends HttpServlet {
    private final CourseRepo courseRepo = new CourseRepo();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get the courseId from the request
            String courseIdParam = request.getParameter("courseId");
            if (courseIdParam != null && !courseIdParam.isEmpty()) {
                int courseId = Integer.parseInt(courseIdParam);
                // Pass the courseId to the delete method
                courseRepo.delete(courseId);
                response.sendRedirect("/course.jsp"); // Redirect after deletion
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid course ID");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid course ID format");
        } catch (Exception e) {
            throw new ServletException("Error deleting course", e);
        }
    }
}