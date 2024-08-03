package com.poly.salestshirt.service;

import com.poly.salestshirt.dto.request.SizeRequest;
import com.poly.salestshirt.dto.response.SizeResponse;
import com.poly.salestshirt.dto.response.common.PageResponse;

import java.util.List;

public interface SizeService {
    PageResponse<?> getAllByStatusAndSearch(int pageNo, int pageSize, String keyword, Integer status);
    String create(SizeRequest request);
    String update(int sizeId, SizeRequest request);
    boolean changeStatus(int sizeId, int status);
    SizeResponse getSizeResponse(int sizeId);
    List<SizeResponse> getAllByStatus(int status);
}
