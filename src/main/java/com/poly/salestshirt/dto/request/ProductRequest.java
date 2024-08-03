package com.poly.salestshirt.dto.request;

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
public class ProductRequest {

    @NotBlank(message = "Vui lòng nhập mã sản phẩm.")
    @Size(min = 3, max = 10, message = "Mã phải có 3 đến 10 ký tự.")
    private String code;

    @NotBlank(message = "Vui lòng nhập tên sản phẩm.")
    @Size(min = 1, max = 50, message = "Tên phải có 2 đến 255 ký tự.")
    private String name;

    private Integer status;


}
