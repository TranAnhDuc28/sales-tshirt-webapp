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
@Table(name = "SanPhamChiTiet")
public class SanPhamChiTiet extends AbstractEntity{

    @Column(name = "MaSPCT")
    private String maSPCT;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdSanPham", referencedColumnName = "id")
    private SanPham sanPham;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdKichThuoc", referencedColumnName = "id")
    private KichThuoc kichThuoc;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdMauSac", referencedColumnName = "id")
    private MauSac mauSac;

    @Column(name = "SoLuong")
    private int soLuong;

    @Column(name = "DonGia")
    private double donGia;

    @Column(name = "TrangThai")
    private int trangThai;
}
