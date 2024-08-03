package com.poly.salestshirt.dto.response;

import lombok.*;

@Getter
@Builder
public class StaffResponse {
    private Integer id;
    private String code;
    private String name;
    private String email;
    private Integer status;
}
