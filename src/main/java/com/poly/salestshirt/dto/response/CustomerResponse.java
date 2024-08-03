package com.poly.salestshirt.dto.response;

import lombok.*;

@Getter
@Builder
public class CustomerResponse {
    private Integer id;
    private String code;
    private String name;
    private String phoneNumber;
    private Integer status;
}
