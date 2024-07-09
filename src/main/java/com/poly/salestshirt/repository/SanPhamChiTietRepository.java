package com.poly.salestshirt.repository;

import com.poly.salestshirt.entity.SanPhamChiTiet;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SanPhamChiTietRepository extends JpaRepository<SanPhamChiTiet, Integer> {

    @Query("""
            select spct from SanPhamChiTiet spct where spct.sanPham.id = :idSanPham
            """)
    Page<SanPhamChiTiet> findAllByIdSanPham(Pageable pageable, @Param("idSanPham") int idSanPham);

    @Query("""
            select spct from SanPhamChiTiet spct where spct.sanPham.id = :idSanPham and spct.trangThai = :trangThai
            """)
    List<SanPhamChiTiet> findAllByIdSanPhamAndTrangThai(@Param("idSanPham") int idSanPham,
                                                        @Param("trangThai") int trangThai);
}
