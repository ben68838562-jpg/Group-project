package com.example.courseapp.controller;

import com.example.courseapp.dto.UserRegistrationDto;
import com.example.courseapp.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AuthController {

    private final UserService userService;

    public AuthController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/login")
    public String login() {
        System.out.println("login");
        return "login";
    }

    @GetMapping("/register")
    public String showRegisterForm(@ModelAttribute("user") UserRegistrationDto dto) {
        System.out.println("Register");
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute("user") UserRegistrationDto dto) {
        System.out.println("Register: " + dto.getUsername());
        userService.registerNewUser(dto);
        return "redirect:/login?register=true";
    }
}
