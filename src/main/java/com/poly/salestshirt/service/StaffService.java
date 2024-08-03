package com.poly.salestshirt.service;

import com.poly.salestshirt.dto.request.StaffRequest;
import com.poly.salestshirt.dto.response.StaffResponse;
import com.poly.salestshirt.dto.response.common.PageResponse;

import java.util.List;

public interface StaffService {
    PageResponse<?> getAllByStatusAndSearch(int pageNo, int pageSize, String keyword, Integer status);
    String create(StaffRequest request);
    String update(int staffId, StaffRequest request);
    boolean changeStatus(int staffId, int status);
    StaffResponse getStaffResponseById(int staffId);
    StaffResponse getStaffResponseByAccountId(int accountId);
    List<StaffResponse> getAllByStatus(int status);
}
