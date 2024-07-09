package com.poly.salestshirt.model.response;

import lombok.*;

@Getter
@Builder
public class NhanVienReponse {

    private Integer id;

    private String ma;

    private String ten;

    private String email;

    private Integer trangThai;
}
