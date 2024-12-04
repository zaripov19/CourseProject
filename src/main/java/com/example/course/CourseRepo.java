package com.example.course;

import com.example.course.entity.Courses;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;

import java.util.List;

import static com.example.course.MyListener.emf;

public class CourseRepo extends BaseRepo<Courses> {
}
