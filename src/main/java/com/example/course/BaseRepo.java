package com.example.course;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import static com.example.course.MyListener.emf;


public class BaseRepo<T> {

    private final Class<T> persistentClass;

    public BaseRepo() {
        Class<T> clazz = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
        this.persistentClass = clazz;
    }

    public void save(T entity) {

        try (EntityManager em = emf.createEntityManager()) {
            em.getTransaction().begin();
            em.persist(entity);
            em.getTransaction().commit();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public List<T> findAll() {
        try (EntityManager em = emf.createEntityManager()) {
            return em.createQuery("from %s".formatted(persistentClass.getSimpleName()), persistentClass).getResultList();
        }
    }

    public void delete(Object id) {
        try (EntityManager em = emf.createEntityManager()) {
            em.getTransaction().begin();
            T entity = em.find(persistentClass, id);
            if (entity != null) {
                em.remove(entity);
            } else {
                throw new RuntimeException("Entity not found for ID: " + id);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}