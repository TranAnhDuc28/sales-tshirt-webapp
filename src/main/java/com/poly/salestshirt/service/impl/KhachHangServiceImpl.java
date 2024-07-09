package com.poly.salestshirt.service.impl;

import com.poly.salestshirt.entity.KhachHang;
import com.poly.salestshirt.model.request.KhachHangRequest;
import com.poly.salestshirt.model.response.KhachHangResponse;
import com.poly.salestshirt.model.response.common.PageResponse;
import com.poly.salestshirt.repository.KhachHangRepository;
import com.poly.salestshirt.service.KhachHangService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class KhachHangServiceImpl implements  KhachHangService{

    private final KhachHangRepository khachHangRepository;
    private final ModelMapper modelMapper;

    @Override
    public PageResponse<?> getAllByStatusAndSearch(int pageNo, int pageSize, String keyword, Integer trangThai) {
        int pageNumber = 0;
        if (pageNo > 0) pageNumber = pageNo - 1;

        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        Page<KhachHangResponse> page = khachHangRepository.findAllBySearchAndStatus(keyword, trangThai, pageable);
        return PageResponse.builder()
                .pageNo(pageNo)
                .pageSize(pageSize)
                .totalPages(page.getTotalPages())
                .first(page.isFirst())
                .last(page.isLast())
                .items(page.getContent())
                .build();
    }

    @Override
    public String create(KhachHangRequest request) {
        KhachHang khachHang = modelMapper.map(request, KhachHang.class);
        khachHang.setTrangThai(1);
        log.info("Create Customer code={}, phone={}", khachHang.getTen(), khachHang.getSDT());
        khachHangRepository.save(khachHang);
        log.info("Customer add save!");
        return "Them khach hang thanh cong";
    }

    @Override
    public String update(int khId, KhachHangRequest request) {
        KhachHang khachHang = getKhachHangById(khId);
        if (khachHang == null) return "Khong tim thay khach hang";
        khachHang = modelMapper.map(request, KhachHang.class);
        khachHang.setId(khId);
        khachHangRepository.save(khachHang);
        log.info("Customer updated successfully");
        return "Sua khach hang thanh cong";
    }

    @Override
    public boolean changeStatus(int khId, int status) {
        log.info("Customer change status with id={}, status={}", khId, status);
        KhachHang khachHang = getKhachHangById(khId);
        if (khachHang == null) return false;
        khachHang.setTrangThai(status);
        khachHangRepository.save(khachHang);
        log.info("Customer changed status successfully");
        return true;
    }

    @Override
    public KhachHangResponse getKhachHangResponse(int khId) {
        KhachHang khachHang = getKhachHangById(khId);
        if(khachHang == null) return null;
        return modelMapper.map(khachHang, KhachHangResponse.class);
    }

    @Override
    public KhachHang getKhachHangById(int khId) {
        return khachHangRepository.findById(khId).orElse(null);
    }

    @Override
    public List<KhachHangResponse> getAllByTrangThai(int trangThai) {
        return khachHangRepository.findAllByTrangThai(trangThai).stream()
                .map(kh -> modelMapper.map(kh, KhachHangResponse.class)).collect(Collectors.toList());
    }
}
