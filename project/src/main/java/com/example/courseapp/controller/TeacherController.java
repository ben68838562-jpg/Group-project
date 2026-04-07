package com.example.courseapp.controller;

import com.example.courseapp.entity.User;
import com.example.courseapp.entity.course;
import com.example.courseapp.repository.CourseRepository;
import com.example.courseapp.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

    @PostMapping("/course/save")
    public String saveCourse(@ModelAttribute("course") course course, Principal principal) {
        User teacher = userRepository.findByUsername(principal.getName())
                .orElseThrow(() -> new RuntimeException("User not found"));

        course.setTeacher(teacher);
        courseRepository.save(course);
        return "redirect:/teacher/dashboard";
    }

    @GetMapping("/course/edit/{id}")
    public String editCourse(@PathVariable Long id, Model model) {
        // Find the course by its database ID
        course existingCourse = courseRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Course not found with id: " + id));

        // Add it to the model so the form is pre-filled
        model.addAttribute("course", existingCourse);
        return "course-form";
    }

    @GetMapping("/course/delete/{id}")
    public String deleteCourse(@PathVariable Long id) {
        courseRepository.deleteById(id); // Delete from DB
        return "redirect:/teacher/dashboard";
    }

}
