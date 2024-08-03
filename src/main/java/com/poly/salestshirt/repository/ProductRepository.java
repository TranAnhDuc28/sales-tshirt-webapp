package com.poly.salestshirt.repository;

import com.poly.salestshirt.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {

    @Query("""
            select p from Product p
            where (:keyword is null or lower(p.name) like lower(concat('%', :keyword, '%')))
                and (:status is null or p.status = :status)
            order by p.id desc
            """)
    Page<Product> findAllBySearchAndStatus(@Param("keyword") String keyword,
                                           @Param("status") Integer status,
                                           Pageable pageable);
    List<Product> findAllByStatus(int status);
}
