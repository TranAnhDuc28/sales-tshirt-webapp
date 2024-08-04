package com.poly.salestshirt.service.impl;

import com.poly.salestshirt.entity.Bill;
import com.poly.salestshirt.entity.Customer;
import com.poly.salestshirt.entity.Staff;
import com.poly.salestshirt.dto.request.BillRequest;
import com.poly.salestshirt.dto.response.BillResponse;
import com.poly.salestshirt.dto.response.common.PageResponse;
import com.poly.salestshirt.mapper.BillMapper;
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
    private final BillMapper billMapper;

    @Override
    public PageResponse<?> getAllByStatusAndSearchAndCreate(int pageNo, int pageSize, String keyword, Integer status, Date createAt) {
        int pageNumber = 0;
        if (pageNo > 0) pageNumber = pageNo - 1;

        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        Page<Bill> billPage = billRepository.findAllByStatusAndSearchAndDateOfPurchase(pageable, keyword, status, createAt);

        List<BillResponse> billResponseList = billPage.stream().map(billMapper::toBillResponse).toList();

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
        Bill bill = billMapper.toCreateBill(request);

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
        billRepository.save(bill);
        log.info("Order add save!");
        return null;
    }

    @Override
    public String update(int billId, BillRequest request) {
        Bill bill = getHoaDonById(billId);
        if (bill == null) return "Không tìm thấy hóa đơn.";
        billMapper.toUpdateBill(bill, request);

        Optional<Staff> staffOptional = staffRepository.findById(request.getStaffId());
        if (staffOptional.isEmpty()) return "Không tìm thấy nhân viên";

        Optional<Customer> customerOptional = Optional.empty();
        if (request.getCustomerId() != null) {
            customerOptional = customerRepository.findById(request.getCustomerId());
            if (customerOptional.isEmpty()) return "Không tìm thấy khách hàng";
        }

        bill.setStaff(staffOptional.get());
        bill.setCustomer(customerOptional.orElse(null));
        billRepository.save(bill);
        log.info("Order updated successfully");
        return null;
    }

    @Override
    public String changeStatus(int billId, int status) {
        log.info("Order change status with id={}, status={}", billId, status);
        Bill bill = getHoaDonById(billId);
        if (bill == null) return "Không tìm thấy hóa đơn cần thanh toán.";
        bill.setStatus(status);
        bill.setDateOfPurchase(new Date());
        billRepository.save(bill);
        log.info("Order changed status successfully");
        return null;
    }

    @Override
    public BillResponse getBillResponse(int billId) {
        Bill bill = getHoaDonById(billId);
        if (bill == null) return null;
        return billMapper.toBillResponse(bill);
    }

    @Override
    public List<BillResponse> getAllByStatus(int status) {
        return billRepository.findAllByStatus(status).stream().map(billMapper::toBillResponse).toList();
    }

    public Bill getHoaDonById(int hdId) {
        return billRepository.findById(hdId).orElse(null);
    }

}
