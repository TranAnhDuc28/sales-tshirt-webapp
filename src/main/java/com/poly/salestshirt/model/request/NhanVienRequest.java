package com.poly.salestshirt.model.request;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class NhanVienRequest {

    @NotBlank(message = "Vui lòng nhập mã nhân viên.")
    @Size(min = 3, max = 10, message = "Mã nhân viên phải có 3 đến 10 ký tự.")
    private String ma;

    @NotBlank(message = "Vui lòng nhập tên nhân viên.")
    @Size(min = 2, max = 100, message = "Tên phải có 2 đến 100 ký tự.")
    private String ten;

    @NotBlank(message = "Vui lòng nhập email.")
    @Email(message = "Email không hợp lệ.")
    private String email;

    private Integer trangThai;

}
