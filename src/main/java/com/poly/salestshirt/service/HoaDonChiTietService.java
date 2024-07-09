package com.poly.salestshirt.service;

import com.poly.salestshirt.entity.HoaDonChiTiet;
import com.poly.salestshirt.model.request.HoaDonChiTietRequest;
import com.poly.salestshirt.model.response.HoaDonChiTietResponse;

import java.util.List;

public interface HoaDonChiTietService {

    List<HoaDonChiTietResponse> getAllHDCTByIdHoaDon(int idHoaDon);

    String create(HoaDonChiTietRequest request);

    String update(int idHDCT, HoaDonChiTietRequest request);

    String delete(int idHDCT);

    HoaDonChiTietResponse getHoaDonChiTietResponse(int id);

    HoaDonChiTiet getById(int id);
}
