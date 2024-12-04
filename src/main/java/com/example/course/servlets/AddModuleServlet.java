package com.example.course.servlets;

import com.example.course.CourseRepo;
import com.example.course.ModuleRepo;
import com.example.course.entity.Courses;
import com.example.course.entity.Modules;
import jakarta.persistence.EntityManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.example.course.MyListener.emf;

@WebServlet("/module/add")
public class AddModuleServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (EntityManager em = emf.createEntityManager()) {
            String name = req.getParameter("name");
            String id = req.getParameter("courseId");
            Integer courseId = Integer.parseInt(id);
            em.getTransaction().begin();
            Courses courses = em.find(Courses.class, courseId);
            Modules module = new Modules(name, courses);
            ModuleRepo moduleRepo = new ModuleRepo();
            moduleRepo.save(module);
            em.getTransaction().commit();
            resp.sendRedirect("/course.jsp");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
