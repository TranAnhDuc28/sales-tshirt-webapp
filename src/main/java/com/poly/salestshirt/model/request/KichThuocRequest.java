package com.poly.salestshirt.model.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class KichThuocRequest {

    @NotBlank(message = "Vui lòng nhập mã kích thước.")
    @Size(min = 3, max = 10, message = "Mã phải có 3 đến 10 ký tự.")
    private String ma;

    @NotBlank(message = "Vui lòng nhập tên kích thước.")
    @Size(min = 1, max = 50, message = "Tên phải có 1 đến 50 ký tự.")
    private String ten;

    private Integer trangThai;
}
