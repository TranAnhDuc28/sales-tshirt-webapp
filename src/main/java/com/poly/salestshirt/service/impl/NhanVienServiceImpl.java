package com.poly.salestshirt.service.impl;

import com.poly.salestshirt.entity.NhanVien;

import com.poly.salestshirt.model.request.NhanVienRequest;
import com.poly.salestshirt.model.response.NhanVienReponse;
import com.poly.salestshirt.model.response.common.PageResponse;
import com.poly.salestshirt.repository.NhanVienRepository;
import com.poly.salestshirt.service.NhanVienService;
import lombok.NoArgsConstructor;
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
public class NhanVienServiceImpl implements NhanVienService {

    private final NhanVienRepository nhanVienRepository;

    @Override
    public PageResponse<?> getAllByStatusAndSearch(int pageNo, int pageSize, String keyword, Integer trangThai) {
        int pageNumber = 0;
        if (pageNo > 0) pageNumber = pageNo - 1;

        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        Page<NhanVien> nhanViens = nhanVienRepository.findAllBySearchAndStatus(keyword, trangThai, pageable);

        List<NhanVienReponse> nhanVienReponses = nhanViens.stream()
                .map(this::convertToNhanVienReponse)
                .collect(Collectors.toList());

        return PageResponse.builder()
                .pageNo(pageNo)
                .pageSize(pageSize)
                .totalPages(nhanViens.getTotalPages())
                .first(nhanViens.isFirst())
                .last(nhanViens.isLast())
                .items(nhanVienReponses)
                .build();
    }

    @Override
    public String create(NhanVienRequest request) {
        request.setTrangThai(1);
        NhanVien nhanVien = this.convertToNhanVien(request);
        log.info("Create Customer ten={}, email={}", nhanVien.getTen(), nhanVien.getEmail());
        nhanVienRepository.save(nhanVien);
        log.info("Staff add save!");
        return "Them nhan vien thanh cong";
    }

    @Override
    public String update(int nvId, NhanVienRequest request) {
        NhanVien nhanVien = getNhanVienById(nvId);
        if (nhanVien == null) return "Khong tim thay nhan vien";
        nhanVien = this.convertToNhanVien(request);
        nhanVien.setAccountId(nhanVien.getAccountId());
        nhanVienRepository.save(nhanVien);
        log.info("Staff updated successfully");
        return "Sua nhan vien thanh cong";
    }

    @Override
    public boolean changeStatus(int nvId, int status) {
        log.info("Staff change status with id={}, status={}", nvId, status);
        NhanVien nhanVien = getNhanVienById(nvId);
        if (nhanVien == null) return false;
        nhanVien.setTrangThai(status);
        nhanVienRepository.save(nhanVien);
        log.info("Staff changed status successfully");
        return true;
    }

    @Override
    public NhanVienReponse getNhanVienReponseById(int nvId) {
        NhanVien nhanVien = getNhanVienById(nvId);
        if(nhanVien == null) return null;
        return convertToNhanVienReponse(nhanVien);
    }

    @Override
    public NhanVienReponse getNhanVienReponseByAccountId(int accountId) {
        NhanVien nhanVien = nhanVienRepository.findByAccountId(accountId);
        if(nhanVien == null) return null;
        return convertToNhanVienReponse(nhanVien);
    }

    @Override
    public NhanVien getNhanVienById(int nvId) {
        return nhanVienRepository.findById(nvId).orElse(null);
    }

    @Override
    public List<NhanVienReponse> getAllByTrangThai(int trangThai) {
        return nhanVienRepository.findAllByTrangThai(trangThai).stream()
                .map(this::convertToNhanVienReponse)
                .collect(Collectors.toList());
    }


    private NhanVienReponse convertToNhanVienReponse(NhanVien nv) {
        return NhanVienReponse.builder()
                .id(nv.getId())
                .ma(nv.getMa())
                .ten(nv.getTen())
                .email(nv.getEmail())
                .trangThai(nv.getTrangThai())
                .build();
    }

    private NhanVien convertToNhanVien(NhanVienRequest request) {
        NhanVien nv = new NhanVien();
        nv.setMa(request.getMa());
        nv.setTen(request.getTen());
        nv.setEmail(request.getEmail());
        nv.setTrangThai(request.getTrangThai());
        return nv;
    }
}

