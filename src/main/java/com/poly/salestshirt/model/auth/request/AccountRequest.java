package com.poly.salestshirt.model.auth.request;

import com.poly.salestshirt.enums.Role;
import com.poly.salestshirt.validator.annotation.EnumValue;
import jakarta.validation.constraints.NotBlank;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class AccountRequest {

    @NotBlank(message = "Tài khoản không được để trống")
    private String username;

    @NotBlank(message = "Mật khẩu không được để trống")
    private String password;

    @EnumValue(name = "role", enumClass = Role.class)
    private String role;

    private String comfirmPassword;
}
