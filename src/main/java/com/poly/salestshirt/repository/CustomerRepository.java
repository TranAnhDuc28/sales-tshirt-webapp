package com.poly.salestshirt.repository;

import com.poly.salestshirt.entity.Customer;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Integer> {

    @Query("""
            select c from Customer c
            where (:keyword is null or lower(c.name) like lower(concat('%', :keyword, '%'))
                or lower(c.phoneNumber) like lower(concat('%', :keyword, '%')))
                and (:status is null or c.status = :status)
            order by c.id desc
            """)
    Page<Customer> findAllBySearchAndStatus(@Param("keyword") String keyword,
                                                    @Param("status") Integer status,
                                                    Pageable pageable);
    List<Customer> findAllByStatus(int status);
    Customer findByAccountId(Integer accountId);


}
