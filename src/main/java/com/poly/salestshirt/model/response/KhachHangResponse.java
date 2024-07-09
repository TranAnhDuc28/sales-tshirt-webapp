package com.poly.salestshirt.model.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class KhachHangResponse {

    private Integer id;

    private String ma;

    private String ten;

    private String SDT;

    private Integer trangThai;
}
