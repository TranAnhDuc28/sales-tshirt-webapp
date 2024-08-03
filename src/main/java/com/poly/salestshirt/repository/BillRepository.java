package com.poly.salestshirt.repository;

import com.poly.salestshirt.entity.Bill;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface BillRepository extends JpaRepository<Bill, Integer> {

    @Query("""
            select bill from Bill bill left join Customer c on bill.customer.id = c.id
            where (:keyword is null or :keyword = ''
                or (c is not null and (lower(c.name) like lower(concat('%', :keyword, '%'))
                                or lower(c.phoneNumber) like lower(concat('%', :keyword, '%')))))
                and (:dateOfPurchase is null or bill.dateOfPurchase >= :dateOfPurchase)
                and (:status is null or bill.status = :status)
            order by bill.id desc
            """)
    Page<Bill> findAllByStatusAndSearchAndDateOfPurchase(Pageable pageable,
                                                         @Param("keyword") String keyword,
                                                         @Param("status") Integer status,
                                                         @Param("dateOfPurchase") Date dateOfPurchase);

    List<Bill> findAllByStatus(int status);
}
