package com.example.courseapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {

    @GetMapping("/")
    public String root() {
        return "redirect:/index";  // 根路径重定向到index
    }
    
    @GetMapping("/index")
    public String index() {
        return "index";  // 显示index.jsp
    }
    
    @GetMapping("/home")
    public String home() {
        return "home";  // 显示home.jsp（需要登录）
    }
}