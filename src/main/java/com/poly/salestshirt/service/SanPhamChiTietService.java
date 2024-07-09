package com.poly.salestshirt.service;

import com.poly.salestshirt.entity.SanPhamChiTiet;
import com.poly.salestshirt.model.request.SanPhamChiTietRequest;
import com.poly.salestshirt.model.response.common.PageResponse;
import com.poly.salestshirt.model.response.SanPhamChiTietResponse;

import java.util.List;

public interface SanPhamChiTietService {

    PageResponse<?> getSPCTByIdSanPham(int pageNo, int pageSize, int idSanPham);

    String create(SanPhamChiTietRequest request);

    String update(int spctId, SanPhamChiTietRequest request);

    String changeStatus(int spctId, int status);

    SanPhamChiTietResponse getSanPhamChiTietResponse(int id);

    SanPhamChiTiet getSanPhamChiTietById(int id);

    List<SanPhamChiTietResponse> getAllByIdSanPhamAndTrangThai(int idSP, int trangThai);
}
