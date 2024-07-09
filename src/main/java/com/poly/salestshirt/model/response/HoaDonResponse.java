package com.poly.salestshirt.model.response;

import lombok.*;

import java.util.Date;

@Getter
@Builder
public class HoaDonResponse {

    private Integer id;

    private Integer idNV;

    private String nhanVien;

    private Integer idKH;

    private String tenKhachHang;

    private String sodienThoai;

    private Date ngayMuaHang;

    private Integer trangThai;
}
