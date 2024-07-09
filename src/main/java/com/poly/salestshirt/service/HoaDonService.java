package com.poly.salestshirt.service;

import com.poly.salestshirt.entity.HoaDon;
import com.poly.salestshirt.model.request.HoaDonRequest;
import com.poly.salestshirt.model.response.HoaDonResponse;
import com.poly.salestshirt.model.response.common.PageResponse;

import java.util.Date;
import java.util.List;

public interface HoaDonService {

    PageResponse<?> getAllByStatusAndSeachAndNgayTao(int pageNo, int pageSize, String keyword, Integer trangThai, Date ngayTao);

    String create(HoaDonRequest request);

    String update(int hdId, HoaDonRequest request);

    String changeStatus(int hdId, int status);

    HoaDonResponse getHoaDonResponse(int hdId);

    HoaDon getHoaDonById(int msId);

    List<HoaDonResponse> getAllByTrangThai(int status);
}
