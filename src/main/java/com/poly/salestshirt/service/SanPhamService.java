package com.poly.salestshirt.service;

import com.poly.salestshirt.entity.SanPham;
import com.poly.salestshirt.model.request.SanPhamRequest;
import com.poly.salestshirt.model.response.common.PageResponse;
import com.poly.salestshirt.model.response.SanPhamResponse;

import java.util.List;

public interface SanPhamService {

    PageResponse<?> getAllByStatusAndSearch(int pageNo, int pageSize, String keyword, Integer trangThai);

    String create(SanPhamRequest request);

    String update(int spId, SanPhamRequest request);

    boolean changeStatus(int spId, int status);

    SanPhamResponse getSanPhamResponse(int spId);

    SanPham getSanPhamById(int spId);

    List<SanPhamResponse> getAllByTrangThai(int trangThai);
}
