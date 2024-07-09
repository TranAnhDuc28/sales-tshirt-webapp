package com.poly.salestshirt.repository;

import com.poly.salestshirt.entity.MauSac;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface MauSacRepository extends JpaRepository<MauSac, Integer> {

    @Query("""
            select ms from MauSac ms
            where (:keyword is null or lower(ms.ten) like lower(concat('%', :keyword, '%'))) 
            and (:trangThai is null or ms.trangThai = :trangThai)
            order by ms.id desc
            """)
    Page<MauSac> findAllBySearchAndStatus(@Param("keyword") String keyword,
                                                 @Param("trangThai") Integer trangThai,
                                                 Pageable pageable);

    List<MauSac> findAllByTrangThai(int trangThai);

}
