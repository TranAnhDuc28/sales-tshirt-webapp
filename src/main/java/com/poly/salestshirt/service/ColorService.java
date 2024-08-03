package com.poly.salestshirt.service;

import com.poly.salestshirt.dto.request.ColorRequest;
import com.poly.salestshirt.dto.response.ColorResponse;
import com.poly.salestshirt.dto.response.common.PageResponse;

import java.util.List;

public interface ColorService {
    PageResponse<?> getAllByStatusAndSearch(int pageNo, int pageSize, String keyword, Integer status);
    String create(ColorRequest request);
    String update(int colorId, ColorRequest request);
    boolean changeStatus(int colorId, int status);
    ColorResponse getColorResponse(int colorId);
    List<ColorResponse> getAllByStatus(int status);
}
