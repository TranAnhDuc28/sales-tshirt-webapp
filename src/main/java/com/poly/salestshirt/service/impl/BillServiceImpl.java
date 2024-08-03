package com.poly.salestshirt.service.impl;

import com.poly.salestshirt.entity.Bill;
import com.poly.salestshirt.entity.Customer;
import com.poly.salestshirt.entity.Staff;
import com.poly.salestshirt.dto.request.BillRequest;
import com.poly.salestshirt.dto.response.BillResponse;
import com.poly.salestshirt.dto.response.common.PageResponse;
import com.poly.salestshirt.repository.BillRepository;
import com.poly.salestshirt.repository.CustomerRepository;
import com.poly.salestshirt.repository.StaffRepository;
import com.poly.salestshirt.service.BillService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class BillServiceImpl implements BillService {

    private final BillRepository billRepository;
    private final StaffRepository staffRepository;
    private final CustomerRepository customerRepository;

    @Override
    public PageResponse<?> getAllByStatusAndSearchAndCreate(int pageNo, int pageSize, String keyword, Integer status, Date createAt) {
        int pageNumber = 0;
        if (pageNo > 0) pageNumber = pageNo - 1;

        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        Page<Bill> billPage = billRepository.findAllByStatusAndSearchAndDateOfPurchase(pageable, keyword, status, createAt);

        List<BillResponse> billResponseList = billPage.stream().map(hd -> BillResponse.builder()
                .id(hd.getId())
                .staffId(hd.getStaff() != null ? hd.getStaff().getId() : null)
                .staffName(hd.getStaff() != null ? hd.getStaff().getName() : null)
                .customerId(hd.getCustomer() != null ? hd.getCustomer().getId() : null)
                .customerName(hd.getCustomer() != null ? hd.getCustomer().getName() : null)
                .phoneNumber(hd.getCustomer() != null ? hd.getCustomer().getPhoneNumber() : null)
                .dateOfPurchase(hd.getDateOfPurchase())
                .status(hd.getStatus())
                .build())
                .toList();

        return PageResponse.builder()
                .pageNo(pageNo)
                .pageSize(pageSize)
                .totalPages(billPage.getTotalPages())
                .first(billPage.isFirst())
                .last(billPage.isLast())
                .items(billResponseList)
                .build();
    }

    @Override
    public String create(BillRequest request) {
        Bill bill = new Bill();

        Optional<Staff> staffOptional = staffRepository.findById(request.getStaffId());
        if (staffOptional.isEmpty()) {
            return "Không tìm thấy nhân viên.";
        }
        if (request.getCustomerId() == null) {
            bill.setCustomer(null);
        } else {
            Optional<Customer> customerOptional = customerRepository.findById(request.getCustomerId());
            if (customerOptional.isEmpty()) {
                return "Khách hàng không tồn tại.";
            }
            bill.setCustomer(customerOptional.get());
        }

        bill.setStaff(staffOptional.get());
        bill.setStatus(0);
        billRepository.save(bill);
        log.info("Order add save!");
        return null;
    }

    @Override
    public String update(int hdId, BillRequest request) {

        Optional<Staff> staffOptional = staffRepository.findById(request.getStaffId());
        if (staffOptional.isEmpty()) return "Không tìm thấy nhân viên";

        Optional<Customer> customerOptional = Optional.empty();
        if (request.getCustomerId() != null) {
            customerOptional = customerRepository.findById(request.getCustomerId());
            if (customerOptional.isEmpty()) return "Không tìm thấy khách hàng";
        }

        Bill bill = new Bill();
        bill.setId(hdId);
        bill.setStaff(staffOptional.get());
        bill.setCustomer(customerOptional.orElse(null));
        bill.setDateOfPurchase(new Date());
        bill.setStatus(0);
        billRepository.save(bill);
        log.info("Order updated successfully");
        return null;
    }

    @Override
    public String changeStatus(int hdId, int status) {
        log.info("Order change status with id={}, status={}", hdId, status);
        Bill bill = getHoaDonById(hdId);
        if (bill == null) return "Không tìm thấy hóa đơn cần thanh toán.";
        bill.setStatus(status);
        billRepository.save(bill);
        log.info("Order changed status successfully");
        return null;
    }

    @Override
    public BillResponse getBillResponse(int hdId) {
        Bill bill = getHoaDonById(hdId);
        if (bill == null) return null;
        return BillResponse.builder()
                .id(bill.getId())
                .staffId(bill.getStaff().getId())
                .staffName(bill.getStaff().getName())
                .customerId(bill.getCustomer() != null ? bill.getCustomer().getId() : null)
                .customerName(bill.getCustomer() != null ? bill.getCustomer().getName() : null)
                .phoneNumber(bill.getCustomer() != null ? bill.getCustomer().getPhoneNumber() : null)
                .dateOfPurchase(bill.getDateOfPurchase())
                .status(bill.getStatus())
                .build();
    }

    @Override
    public List<BillResponse> getAllByStatus(int status) {
        return billRepository.findAllByStatus(status)
                .stream().map(bill -> BillResponse.builder()
                        .id(bill.getId())
                        .staffId(bill.getStaff().getId())
                        .staffName(bill.getStaff().getName())
                        .customerId(bill.getCustomer() != null ? bill.getCustomer().getId() : null)
                        .customerName(bill.getCustomer() != null ? bill.getCustomer().getName() : null)
                        .phoneNumber(bill.getCustomer() != null ? bill.getCustomer().getPhoneNumber() : null)
                        .dateOfPurchase(bill.getDateOfPurchase())
                        .status(bill.getStatus())
                        .build())
                .collect(Collectors.toList());
    }

    public Bill getHoaDonById(int hdId) {
        return billRepository.findById(hdId).orElse(null);
    }

}
