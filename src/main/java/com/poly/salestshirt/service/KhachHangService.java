package com.poly.salestshirt.service;

import com.poly.salestshirt.entity.KhachHang;
import com.poly.salestshirt.model.request.KhachHangRequest;
import com.poly.salestshirt.model.response.KhachHangResponse;
import com.poly.salestshirt.model.response.common.PageResponse;

import java.util.List;

public interface KhachHangService {

    PageResponse<?> getAllByStatusAndSearch(int pageNo, int pageSize, String keyword, Integer trangThai);

    String create(KhachHangRequest request);

    String update(int khId, KhachHangRequest request);

    boolean changeStatus(int khId, int status);

    KhachHangResponse getKhachHangResponse(int khId);

    KhachHang getKhachHangById(int khId);

    List<KhachHangResponse> getAllByTrangThai(int trangThai);
}
