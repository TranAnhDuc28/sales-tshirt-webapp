package com.poly.salestshirt.controller.auth;

import com.poly.salestshirt.dto.auth.request.LoginRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/auth")
public class LoginController {

    @GetMapping("/login")
    public String getFormLogin(@ModelAttribute("login") LoginRequest request) {
        return "authentication/login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute("login") LoginRequest request) {
        return "redirect:/admin/home";
    }
}
