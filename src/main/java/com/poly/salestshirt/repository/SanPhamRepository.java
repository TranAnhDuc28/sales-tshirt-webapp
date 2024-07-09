package com.poly.salestshirt.repository;

import com.poly.salestshirt.entity.SanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SanPhamRepository extends JpaRepository<SanPham, Integer> {

    @Query("""
            select sp from SanPham sp
            where (:keyword is null or lower(sp.ten) like lower(concat('%', :keyword, '%')))
            and (:trangThai is null or sp.trangThai = :trangThai)
            order by sp.id desc
            """)
    Page<SanPham> findAllBySearchAndStatus(@Param("keyword") String keyword,
                                                   @Param("trangThai") Integer trangThai,
                                                   Pageable pageable);

    List<SanPham> findAllByTrangThai(int trangThai);
}
