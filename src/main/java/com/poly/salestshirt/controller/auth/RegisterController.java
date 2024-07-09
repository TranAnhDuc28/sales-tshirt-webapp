package com.poly.salestshirt.controller.auth;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/auth")
public class RegisterController {

    @GetMapping("/register")
    public String getFormRegister() {
        return "authentication/register";
    }
}
