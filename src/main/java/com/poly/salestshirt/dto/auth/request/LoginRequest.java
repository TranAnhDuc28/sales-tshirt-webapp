package com.poly.salestshirt.dto.auth.request;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class LoginRequest {

    @NotBlank(message = "Vui lòng nhập email.")
    @Email(message = "email không hợp lệ.")
    private String username;

    @NotBlank(message = "Vui lòng nhập mật khẩu.")
    private String password;
}
