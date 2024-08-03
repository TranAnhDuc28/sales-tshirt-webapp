package com.poly.salestshirt.repository;

import com.poly.salestshirt.entity.BillDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BillDetailRepository extends JpaRepository<BillDetail, Integer> {
    List<BillDetail> findAllByBillId(int idHoaDon);
}
