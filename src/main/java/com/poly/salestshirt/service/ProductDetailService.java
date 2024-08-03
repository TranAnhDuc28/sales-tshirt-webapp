package com.poly.salestshirt.service;

import com.poly.salestshirt.dto.request.ProductDetailRequest;
import com.poly.salestshirt.dto.response.common.PageResponse;
import com.poly.salestshirt.dto.response.ProductDetailResponse;

import java.util.List;

public interface ProductDetailService {
    PageResponse<?> getAllByProductId(int pageNo, int pageSize, int productId);
    String create(ProductDetailRequest request);
    String update(int productDetailId, ProductDetailRequest request);
    String changeStatus(int productDetailId, int status);
    ProductDetailResponse getProductDetailResponse(int id);
    List<ProductDetailResponse> getAllByProductIdAndStatus(int productId, int status);
}
