package com.poly.salestshirt.repository;

import com.poly.salestshirt.entity.HoaDonChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HoaDonChiTietRepository extends JpaRepository<HoaDonChiTiet, Integer> {

    List<HoaDonChiTiet> findAllByIdHoaDon(int idHoaDon);
}
