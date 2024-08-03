package com.poly.salestshirt.service;

import com.poly.salestshirt.dto.request.CustomerRequest;
import com.poly.salestshirt.dto.response.CustomerResponse;
import com.poly.salestshirt.dto.response.common.PageResponse;

import java.util.List;

public interface CustomerService {
    PageResponse<?> getAllByStatusAndSearch(int pageNo, int pageSize, String keyword, Integer status);
    String create(CustomerRequest request);
    String update(int customerId, CustomerRequest request);
    boolean changeStatus(int customerId, int status);
    CustomerResponse getCustomerResponse(int customerId);
    List<CustomerResponse> getAllByStatus(int status);
}
