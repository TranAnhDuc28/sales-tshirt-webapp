package com.poly.salestshirt.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping({ "/", "/home"})
    public String homeManager(Model model) {
        return "web/home";
    }
}
