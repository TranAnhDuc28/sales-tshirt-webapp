package com.poly.salestshirt.model.response;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class SanPhamChiTietResponse {

    private Integer id;

    private String maSPCT;

    private Integer idSanPham;

    private String tenSP;

    private Integer idKichThuoc;

    private String kichThuoc;

    private Integer idMauSac;

    private String mauSac;

    private Integer soLuong;

    private Double donGia;

    private Integer trangThai;

}
