package hkmu.wadd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    @GetMapping("/")
    public String index() {
        return "redirect:/guestbook/";
    }

    @GetMapping("/login")
    public String loginPage() {
        return "login"; // resolves to /WEB-INF/jsp/login.jsp
    }
}
