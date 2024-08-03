package com.poly.salestshirt.service;

import com.poly.salestshirt.dto.request.BillDetailRequest;
import com.poly.salestshirt.dto.response.BillDetailResponse;

import java.util.List;

public interface BillDetailService {
    List<BillDetailResponse> getAllByOrderId(int orderId);
    String create(BillDetailRequest request);
    String update(int orderId, BillDetailRequest request);
    String delete(int orderId);
    BillDetailResponse getBillDetailResponse(int id);
}
