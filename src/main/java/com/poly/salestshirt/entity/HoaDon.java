package com.poly.salestshirt.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "HoaDon")
public class HoaDon extends AbstractEntity{

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdNV", referencedColumnName = "id")
    private NhanVien nhanVien;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdKH", referencedColumnName = "id")
    private KhachHang khachHang;

    @Column(name = "NgayMuaHang")
    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayMuaHang;

    @Column(name = "TrangThai")
    private int trangThai;
}
