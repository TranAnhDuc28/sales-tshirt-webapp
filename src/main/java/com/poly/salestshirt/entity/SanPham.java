package com.poly.salestshirt.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "SanPham")
public class SanPham extends AbstractEntity{

    @Column(name = "Ma")
    private String ma;

    @Column(name = "Ten")
    private String ten;

    @Column(name = "TrangThai")
    private int trangThai;

    @OneToMany(mappedBy = "sanPham", fetch = FetchType.LAZY)
    private List<SanPhamChiTiet> sanPhamChiTiets;
}
