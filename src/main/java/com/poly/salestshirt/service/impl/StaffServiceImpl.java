package com.poly.salestshirt.service.impl;

import com.poly.salestshirt.entity.Staff;

import com.poly.salestshirt.dto.request.StaffRequest;
import com.poly.salestshirt.dto.response.StaffResponse;
import com.poly.salestshirt.dto.response.common.PageResponse;
import com.poly.salestshirt.mapper.StaffMapper;
import com.poly.salestshirt.repository.StaffRepository;
import com.poly.salestshirt.service.StaffService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class StaffServiceImpl implements StaffService {

    private final StaffRepository staffRepository;
    private final StaffMapper staffMapper;

    @Override
    public PageResponse<?> getAllByStatusAndSearch(int pageNo, int pageSize, String keyword, Integer status) {
        int pageNumber = 0;
        if (pageNo > 0) pageNumber = pageNo - 1;

        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        Page<Staff> staffPage = staffRepository.findAllBySearchAndStatus(keyword, status, pageable);

        List<StaffResponse> staffResponses = staffPage.stream().map(staffMapper::toStaffResponse).toList();

        return PageResponse.builder()
                .pageNo(pageNo)
                .pageSize(pageSize)
                .totalPages(staffPage.getTotalPages())
                .first(staffPage.isFirst())
                .last(staffPage.isLast())
                .items(staffResponses)
                .build();
    }

    @Override
    public String create(StaffRequest request) {
        Staff staff = staffMapper.toCreateStaff(request);
        log.info("Create Customer ten={}, email={}", staff.getName(), staff.getEmail());
        staffRepository.save(staff);
        log.info("Staff add save!");
        return "Them nhan vien thanh cong";
    }

    @Override
    public String update(int staffId, StaffRequest request) {
        Staff staff = getStaffById(staffId);
        if (staff == null) return "Khong tim thay nhan vien";
        staffMapper.toUpdateStaff(staff, request);
        staff.setAccountId(staff.getAccountId());
        staffRepository.save(staff);
        log.info("Staff updated successfully");
        return "Sua nhan vien thanh cong";
    }

    @Override
    public boolean changeStatus(int staffId, int status) {
        log.info("Staff change status with id={}, status={}", staffId, status);
        Staff staff = getStaffById(staffId);
        if (staff == null) return false;
        staff.setStatus(status);
        staffRepository.save(staff);
        log.info("Staff changed status successfully");
        return true;
    }

    @Override
    public StaffResponse getStaffResponseById(int staffId) {
        Staff staff = getStaffById(staffId);
        if(staff == null) return null;
        return staffMapper.toStaffResponse(staff);
    }

    @Override
    public StaffResponse getStaffResponseByAccountId(int accountId) {
        Staff staff = staffRepository.findByAccountId(accountId);
        if(staff == null) return null;
        return staffMapper.toStaffResponse(staff);
    }

    @Override
    public List<StaffResponse> getAllByStatus(int status) {
        return staffRepository.findAllByStatus(status).stream().map(staffMapper::toStaffResponse).toList();
    }

    public Staff getStaffById(int nvId) {
        return staffRepository.findById(nvId).orElse(null);
    }
}

