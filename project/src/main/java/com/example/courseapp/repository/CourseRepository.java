package com.example.courseapp.repository;

import com.example.courseapp.entity.course;
import com.example.courseapp.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CourseRepository extends JpaRepository<course, Long> {
    List<course> findByTeacher(User teacher);
}
