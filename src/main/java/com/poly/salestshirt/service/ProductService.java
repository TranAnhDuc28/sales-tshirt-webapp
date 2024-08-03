package com.poly.salestshirt.service;

import com.poly.salestshirt.dto.request.ProductRequest;
import com.poly.salestshirt.dto.response.common.PageResponse;
import com.poly.salestshirt.dto.response.ProductResponse;

import java.util.List;

public interface ProductService {
    PageResponse<?> getAllByStatusAndSearch(int pageNo, int pageSize, String keyword, Integer status);
    String create(ProductRequest request);
    String update(int productId, ProductRequest request);
    boolean changeStatus(int productId, int status);
    ProductResponse getProductResponse(int productId);
    List<ProductResponse> getAllByStatus(int status);
}
