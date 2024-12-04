package com.example.course.servlets;

import com.example.course.CourseRepo;
import com.example.course.entity.Courses;
import jakarta.persistence.EntityManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.example.course.MyListener.emf;

@WebServlet("/course/add")
public class AddCourseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (EntityManager em = emf.createEntityManager()) {
            String name = req.getParameter("name");
            em.getTransaction().begin();
            Courses courses = new Courses(name);
            CourseRepo courseRepo = new CourseRepo();
            courseRepo.save(courses);
            em.getTransaction().commit();
            resp.sendRedirect("/course.jsp");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
