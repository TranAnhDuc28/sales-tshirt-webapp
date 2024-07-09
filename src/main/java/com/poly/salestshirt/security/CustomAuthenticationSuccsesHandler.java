package com.poly.salestshirt.security;

import com.poly.salestshirt.entity.CustomUserDetails;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import java.io.IOException;

public class CustomAuthenticationSuccsesHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {
        // Chuyển hướng người dùng đến URL phù hợp với vai trò
        if (authentication.getAuthorities().stream().anyMatch(role -> role.getAuthority().equals("ADMIN")
                        || role.getAuthority().equals("MANAGER"))) {
            request.getSession().removeAttribute("errorMessage");
            response.sendRedirect("/admin/home");
        } else {
            response.sendRedirect("/home");
        }
    }
}
