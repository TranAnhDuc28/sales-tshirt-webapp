package com.poly.salestshirt.model.response;

import lombok.*;

@Getter
@Builder
@AllArgsConstructor
public class HoaDonChiTietResponse {

    private Integer id;
    private Integer idHoaDon;
    private Integer idSPCT;
    private String tenSPCT;
    private Integer soLuong;
    private Double donGia;
    private Double tongGia;
    private Integer trangThai;

}
