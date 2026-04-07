package com.example.courseapp.controller;

import com.example.courseapp.entity.User;
import com.example.courseapp.entity.course;
import com.example.courseapp.repository.CourseRepository;
import com.example.courseapp.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;
import java.util.List;

@Controller
public class PageController {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CourseRepository courseRepository;

    @GetMapping("/")
    public String root() {
        return "redirect:/index";
    }
    
    @GetMapping("/index")
    public String index() {
        return "index";
    }
    
    @GetMapping("/home")
    public String home(Model model, Principal principal) {
        String username = principal.getName();
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("User not found"));

        List<course> userCourses;
        if(user.getRole().contains("TEACHER")) {
            userCourses = courseRepository.findByTeacher(user);
        }else {
            userCourses = courseRepository.findAll();
        }

        model.addAttribute("user", user);
        model.addAttribute("course", userCourses);

        return "home";
    }
}
