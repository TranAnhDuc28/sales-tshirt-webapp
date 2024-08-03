package com.poly.salestshirt.dto.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ColorRequest {

    @NotBlank(message = "Vui lòng nhập mã màu sắc.")
    @Size(min = 3, max = 10, message = "Mã phải có 3 đến 10 ký tự.")
    private String code;

    @NotBlank(message = "Vui lòng nhập tên màu sắc.")
    @Size(min = 2, max = 50, message = "Tên màu phải có 2 đến 50 ký tự.")
    private String name;

    private Integer status;
}
