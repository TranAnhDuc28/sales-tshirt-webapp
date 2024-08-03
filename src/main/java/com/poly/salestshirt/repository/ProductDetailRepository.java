package com.poly.salestshirt.repository;

import com.poly.salestshirt.entity.ProductDetail;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductDetailRepository extends JpaRepository<ProductDetail, Integer> {

    @Query("""
            select pd from ProductDetail pd where pd.product.id = :productId
            """)
    Page<ProductDetail> findAllByProductId(Pageable pageable, @Param("productId") int productId);

    @Query("""
            select pd from ProductDetail pd where pd.product.id = :productId and pd.status = :status
            """)
    List<ProductDetail> findAllByProductIdAndStatus(@Param("productId") int productId,
                                                    @Param("status") int status);
}
