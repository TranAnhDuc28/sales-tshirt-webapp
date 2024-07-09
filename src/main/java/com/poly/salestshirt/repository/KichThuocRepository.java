package com.poly.salestshirt.repository;

import com.poly.salestshirt.entity.KichThuoc;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface KichThuocRepository extends JpaRepository<KichThuoc, Integer> {

    @Query("""
            select kt from KichThuoc kt
            where (:keyword is null or lower(kt.ten) like lower(concat('%', :keyword, '%')))
            and (:trangThai is null or kt.trangThai = :trangThai)
            order by kt.id desc
            """)
    Page<KichThuoc> findAllBySearchAndStatus(@Param("keyword") String keyword,
                                             @Param("trangThai") Integer trangThai,
                                             Pageable pageable);

    List<KichThuoc> findAllByTrangThai(int trangThai);
}
