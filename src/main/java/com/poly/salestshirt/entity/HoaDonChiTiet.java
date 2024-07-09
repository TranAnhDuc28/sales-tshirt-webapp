package com.poly.salestshirt.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "HoaDonChiTiet")
public class HoaDonChiTiet extends AbstractEntity {

    @Column(name = "IdHoaDon")
    private Integer idHoaDon;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdSPCT", referencedColumnName = "id")
    private SanPhamChiTiet spct;

    @Column(name = "SoLuong")
    private int soLuong;

    @Column(name = "DonGia")
    private double donGia;

    @Column(name = "TrangThai")
    private int trangThai;
}
