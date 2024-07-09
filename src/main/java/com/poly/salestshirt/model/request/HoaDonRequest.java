package com.poly.salestshirt.model.request;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class HoaDonRequest {

    @NotNull
    private Integer idNhanVien;

    private Integer idKhachHang;

    private Date ngayMuaHang;

    private Integer trangThai;
}
