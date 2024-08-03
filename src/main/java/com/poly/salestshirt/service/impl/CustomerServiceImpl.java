package com.poly.salestshirt.service.impl;

import com.poly.salestshirt.entity.Customer;
import com.poly.salestshirt.dto.request.CustomerRequest;
import com.poly.salestshirt.dto.response.CustomerResponse;
import com.poly.salestshirt.dto.response.common.PageResponse;
import com.poly.salestshirt.repository.CustomerRepository;
import com.poly.salestshirt.service.CustomerService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class CustomerServiceImpl implements CustomerService {

    private final CustomerRepository customerRepository;
    private final ModelMapper modelMapper;
    @Override
    public PageResponse<?> getAllByStatusAndSearch(int pageNo, int pageSize, String keyword, Integer status) {
        int pageNumber = 0;
        if (pageNo > 0) pageNumber = pageNo - 1;

        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        Page<Customer> customerPage = customerRepository.findAllBySearchAndStatus(keyword, status, pageable);

        List<CustomerResponse> customers = customerPage.getContent().stream()
                .map(customer -> CustomerResponse.builder()
                        .id(customer.getId())
                        .code(customer.getCode())
                        .name(customer.getName())
                        .phoneNumber(customer.getPhoneNumber())
                        .status(customer.getStatus())
                        .build())
                .toList();

        return PageResponse.builder()
                .pageNo(pageNo)
                .pageSize(pageSize)
                .totalPages(customerPage.getTotalPages())
                .first(customerPage.isFirst())
                .last(customerPage.isLast())
                .items(customers)
                .build();
    }

    @Override
    public String create(CustomerRequest request) {
        Customer customer = modelMapper.map(request, Customer.class);
        customer.setStatus(1);
        log.info("Create Customer code={}, phone={}", customer.getName(), customer.getPhoneNumber());
        customerRepository.save(customer);
        log.info("Customer add save!");
        return "Them khach hang thanh cong";
    }

    @Override
    public String update(int customerId, CustomerRequest request) {
        Customer customer = getCustomerById(customerId);
        if (customer == null) return "Khong tim thay khach hang";
        customer = modelMapper.map(request, Customer.class);
        customer.setId(customerId);
        customerRepository.save(customer);
        log.info("Customer updated successfully");
        return "Sua khach hang thanh cong";
    }

    @Override
    public boolean changeStatus(int customerId, int status) {
        log.info("Customer change status with id={}, status={}", customerId, status);
        Customer customer = getCustomerById(customerId);
        if (customer == null) return false;
        customer.setStatus(status);
        customerRepository.save(customer);
        log.info("Customer changed status successfully");
        return true;
    }

    @Override
    public CustomerResponse getCustomerResponse(int customerId) {
        Customer customer = getCustomerById(customerId);
        if(customer == null) return null;
        return modelMapper.map(customer, CustomerResponse.class);
    }

    @Override
    public List<CustomerResponse> getAllByStatus(int status) {
        return customerRepository.findAllByStatus(status).stream()
                .map(customer -> CustomerResponse.builder()
                        .id(customer.getId())
                        .code(customer.getCode())
                        .name(customer.getName())
                        .phoneNumber(customer.getPhoneNumber())
                        .status(customer.getStatus())
                        .build())
                .toList();
    }

    public Customer getCustomerById(int customerId) {
        return customerRepository.findById(customerId).orElse(null);
    }

}
