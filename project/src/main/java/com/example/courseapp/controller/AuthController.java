package com.example.courseapp.controller;

import com.example.courseapp.dto.UserRegistrationDto;
import com.example.courseapp.entity.User;
import com.example.courseapp.repository.UserRepository;
import com.example.courseapp.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;

@Controller
public class AuthController {

    private final UserService userService;
    private final UserRepository userRepository;

    public AuthController(UserService userService, UserRepository userRepository) {
        this.userService = userService;
        this.userRepository = userRepository;
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

    @GetMapping("/home/edit")
    public String showEditProfileForm(Model model, Principal principal) {
        //User user = userRepository.findByUsername(principal.getName()).get();
        if (principal == null) {
            return "redirect:/login";
        }
        User user = userRepository.findByUsername(principal.getName())
                .orElseThrow(() -> new RuntimeException("User not found: " + principal.getName()));

        model.addAttribute("user", user);
        return "edit-profile";
    }

    @PostMapping("/home/updateProfile")
    public String updateProfile(@ModelAttribute("user") User updatedUser, Principal principal) {
        if (principal == null) return "redirect:/login";

        User existingUser = userRepository.findByUsername(principal.getName())
                .orElseThrow(() -> new RuntimeException("User not found: " + principal.getName()));

        existingUser.setFullName(updatedUser.getFullName());

        existingUser.setEmail(updatedUser.getEmail());
        existingUser.setPhone(updatedUser.getPhone());

        userRepository.save(existingUser);
        return "redirect:/home";
    }

}
