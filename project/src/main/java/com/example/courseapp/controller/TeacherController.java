package com.example.courseapp.controller;

import com.example.courseapp.entity.User;
import com.example.courseapp.entity.course;
import com.example.courseapp.repository.CourseRepository;
import com.example.courseapp.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
@RequestMapping("/teacher")
public class TeacherController {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CourseRepository courseRepository;

    @GetMapping("/dashboard")
    public String dashboard(Model model, Principal principal) {
        User teacher = userRepository.findByUsername(principal.getName())
                .orElseThrow(() -> new RuntimeException("User not found"));

        // Pass the teacher's courses to the dashboard
        model.addAttribute("courses", courseRepository.findByTeacher(teacher));
        return "teacher-dashboard";
    }

    @GetMapping("/course/new")
    public String newCourse(Model model) {
        model.addAttribute("course", new course());
        return "course-form";
    }

    @PostMapping("/course/new")
    public String saveCourse(@ModelAttribute("course") course course, Principal principal) {
        User teacher = userRepository.findByUsername(principal.getName())
                .orElseThrow(() -> new RuntimeException("User not found"));

        course.setTeacher(teacher);
        courseRepository.save(course);
        return "redirect:/teacher/dashboard";
    }
}
