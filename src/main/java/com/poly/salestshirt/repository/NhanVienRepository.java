package com.poly.salestshirt.repository;

import com.poly.salestshirt.entity.NhanVien;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NhanVienRepository extends JpaRepository<NhanVien, Integer> {

    @Query("""
            select nv from NhanVien nv
            where (:keyword is null or lower(nv.ma) like lower(concat('%', :keyword, '%'))
            or lower(nv.ten) like lower(concat('%', :keyword, '%'))
            or lower(nv.email) like lower(concat('%', :keyword, '%')))
            and (:trangThai is null or nv.trangThai = :trangThai)
            order by nv.id desc
            """)
    Page<NhanVien> findAllBySearchAndStatus(@Param("keyword") String keyword,
                                            @Param("trangThai") Integer trangThai,
                                            Pageable pageable);

    NhanVien findByAccountId(Integer accountId);

    List<NhanVien> findAllByTrangThai(int trangThai);
}
