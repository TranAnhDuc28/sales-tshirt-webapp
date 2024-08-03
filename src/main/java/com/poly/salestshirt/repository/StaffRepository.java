package com.poly.salestshirt.repository;

import com.poly.salestshirt.entity.Staff;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StaffRepository extends JpaRepository<Staff, Integer> {

    @Query("""
            select staff from Staff staff
            where (:keyword is null or lower(staff.code) like lower(concat('%', :keyword, '%'))
                or lower(staff.name) like lower(concat('%', :keyword, '%'))
                or lower(staff.email) like lower(concat('%', :keyword, '%')))
                and (:status is null or staff.status = :status)
            order by staff.id desc
            """)
    Page<Staff> findAllBySearchAndStatus(@Param("keyword") String keyword,
                                         @Param("status") Integer status,
                                         Pageable pageable);
    Staff findByAccountId(Integer accountId);
    List<Staff> findAllByStatus(int status);
}
