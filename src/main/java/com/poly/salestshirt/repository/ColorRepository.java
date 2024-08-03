package com.poly.salestshirt.repository;

import com.poly.salestshirt.entity.Color;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface ColorRepository extends JpaRepository<Color, Integer> {

    @Query("""
            select c from Color c
            where (:keyword is null or lower(c.name) like lower(concat('%', :keyword, '%')))
                and (:status is null or c.status = :status)
            order by c.id desc
            """)
    Page<Color> findAllBySearchAndStatus(@Param("keyword") String keyword,
                                         @Param("status") Integer status,
                                         Pageable pageable);
    List<Color> findAllByStatus(int status);

}
