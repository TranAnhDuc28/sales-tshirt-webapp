package com.poly.salestshirt.model.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class HoaDonChiTietRequest {

    private Integer idHoaDon;
    private Integer idSPCT;
    private Integer soLuong;
    private Double donGia;
    private Integer trangThai;
}
