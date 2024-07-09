package com.poly.salestshirt.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "khachhang")
public class KhachHang extends AbstractEntity{

    @Column(name = "Ma")
    private String ma;

    @Column(name = "Ten")
    private String ten;

    @Column(name = "SDT")
    private String SDT;

    @Column(name = "account_id")
    private Integer accountId;

    @Column(name = "TrangThai")
    private int trangThai;

    @OneToMany(mappedBy = "khachHang",fetch = FetchType.LAZY)
    List<HoaDon> hoaDons = new ArrayList<>();
}
