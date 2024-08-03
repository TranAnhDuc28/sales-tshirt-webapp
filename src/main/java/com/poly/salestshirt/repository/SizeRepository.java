package com.poly.salestshirt.repository;

import com.poly.salestshirt.entity.Size;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SizeRepository extends JpaRepository<Size, Integer> {

    @Query("""
            select s from Size s
            where (:keyword is null or lower(s.name) like lower(concat('%', :keyword, '%')))
                and (:status is null or s.status = :status)
            order by s.id desc
            """)
    Page<Size> findAllBySearchAndStatus(@Param("keyword") String keyword,
                                        @Param("status") Integer status,
                                        Pageable pageable);
    List<Size> findAllByStatus(int status);
}
