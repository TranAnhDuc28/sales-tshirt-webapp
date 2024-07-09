package com.poly.salestshirt.repository;

import com.poly.salestshirt.entity.HoaDon;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface HoaDonRepository extends JpaRepository<HoaDon, Integer> {

    @Query("""
            select hd from HoaDon hd left join hd.khachHang kh 
            where (:keyword is null or :keyword = ''
            or (kh is not null and (lower(kh.ten) like lower(concat('%', :keyword, '%'))
                                or lower(kh.SDT) like lower(concat('%', :keyword, '%')))))
            and (:ngayTao is null or hd.ngayMuaHang >= :ngayTao)
            and (:trangThai is null or hd.trangThai = :trangThai)
            order by hd.id desc
            """)
    Page<HoaDon> findAllByStatusAndSeachAndNgayTao(Pageable pageable,
                                                   @Param("keyword") String keyword,
                                                   @Param("trangThai") Integer trangThai,
                                                   @Param("ngayTao") Date ngayTao);

    List<HoaDon> findAllByTrangThai(int status);
}
