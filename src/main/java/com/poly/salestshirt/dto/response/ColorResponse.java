package com.poly.salestshirt.dto.response;


import lombok.*;

@Getter
@Builder
public class ColorResponse {
    private Integer id;
    private String code;
    private String name;
    private Integer status;

}
