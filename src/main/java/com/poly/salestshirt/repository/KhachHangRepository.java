package com.poly.salestshirt.repository;

import com.poly.salestshirt.entity.KhachHang;
import com.poly.salestshirt.model.response.KhachHangResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface KhachHangRepository extends JpaRepository<KhachHang, Integer> {

    @Query("select new com.poly.salestshirt.model.response.KhachHangResponse(kh.id, kh.ma, kh.ten, kh.SDT, kh.trangThai) " +
            "from KhachHang kh " +
            "where (:keyword is null or lower(kh.ten) like lower(concat('%', :keyword, '%')) or lower(kh.SDT) like lower(concat('%', :keyword, '%'))) " +
            "and (:trangThai is null or kh.trangThai = :trangThai) " +
            "order by kh.id desc")
    Page<KhachHangResponse> findAllBySearchAndStatus(@Param("keyword") String keyword,
                                                     @Param("trangThai") Integer trangThai,
                                                     Pageable pageable);

    List<KhachHang> findAllByTrangThai(int trangThai);

    KhachHang findByAccountId(Integer accountId);


}
