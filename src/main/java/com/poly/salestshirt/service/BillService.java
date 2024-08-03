package com.poly.salestshirt.service;

import com.poly.salestshirt.dto.request.BillRequest;
import com.poly.salestshirt.dto.response.BillResponse;
import com.poly.salestshirt.dto.response.common.PageResponse;

import java.util.Date;
import java.util.List;

public interface BillService {
    PageResponse<?> getAllByStatusAndSearchAndCreate(int pageNo, int pageSize, String keyword, Integer status, Date createAt);
    String create(BillRequest request);
    String update(int hdId, BillRequest request);
    String changeStatus(int hdId, int status);
    BillResponse getBillResponse(int hdId);
    List<BillResponse> getAllByStatus(int status);
}
