package com.example.course.servlets;

import com.example.course.GroupRepo;
import com.example.course.entity.Groups;
import com.example.course.entity.Modules;
import jakarta.persistence.EntityManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.example.course.MyListener.emf;

@WebServlet("/group/add")
public class AddGroupServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (EntityManager em = emf.createEntityManager()) {
            String name = req.getParameter("name");
            String id = req.getParameter("moduleId");
            Integer moduleId = Integer.parseInt(id);
            em.getTransaction().begin();
            Modules modules = em.find(Modules.class, moduleId);
            Groups groups = new Groups(name, modules);
            GroupRepo groupRepo = new GroupRepo();
            groupRepo.save(groups);
            em.getTransaction().commit();
            resp.sendRedirect("/module.jsp");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
