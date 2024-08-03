package com.poly.salestshirt.dto.request;

import com.poly.salestshirt.validator.annotation.PhoneNumber;
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
public class CustomerRequest {

    @NotBlank(message = "Vui lòng nhập mã khách hàng.")
    @Size(min = 3, max = 10, message = "Mã phải có 3 đến 10 ký tự.")
    private String code;

    @NotBlank(message = "Vui lòng nhập tên khách hàng.")
    @Size(min = 1, max = 50, message = "Tên phải có 1 đến 50 ký tự.")
    private String name;

    @PhoneNumber(message = "Số điện thoại không hợp lệ.")
    private String phoneNumber;

    private Integer status;
}
