package com.poly.salestshirt.security;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.*;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

import java.io.IOException;

public class CustomAuthenticationFailure extends SimpleUrlAuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        super.onAuthenticationFailure(request, response, exception);
        String errorMessage = "";

        if (exception instanceof BadCredentialsException) {
            errorMessage = "Tên đăng nhập hoặc mật khẩu không đúng.";
        } else if (exception instanceof LockedException) {
            errorMessage = "Tài khoản của bạn đã bị khóa.";
        } else if (exception instanceof DisabledException) {
            errorMessage = "Tài khoản của bạn đã bị vô hiệu hóa.";
        } else if (exception instanceof AccountExpiredException) {
            errorMessage = "Tài khoản của bạn đã hết hạn.";
        } else if (exception instanceof CredentialsExpiredException) {
            errorMessage = "Mật khẩu của bạn đã hết hạn.";
        }

        request.getSession().setAttribute("errorMessage", errorMessage);
    }
}
