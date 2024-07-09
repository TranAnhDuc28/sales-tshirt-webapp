package com.poly.salestshirt.service.impl;

import com.poly.salestshirt.entity.SanPham;
import com.poly.salestshirt.model.request.SanPhamRequest;
import com.poly.salestshirt.model.response.common.PageResponse;
import com.poly.salestshirt.model.response.SanPhamResponse;
import com.poly.salestshirt.repository.SanPhamRepository;
import com.poly.salestshirt.service.SanPhamService;
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
public class SanPhamServiceImpl implements SanPhamService {

    private final SanPhamRepository sanPhamRepository;
    private final ModelMapper modelMapper;

    @Override
    public PageResponse<?> getAllByStatusAndSearch(int pageNo, int pageSize, String keyword, Integer trangThai) {
        int pageNumber = 0;
        if (pageNo > 0) pageNumber = pageNo - 1;

        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        Page<SanPham> sanPhams = sanPhamRepository.findAllBySearchAndStatus(keyword, trangThai, pageable);

        List<SanPhamResponse> sanPhamResponses = sanPhams.stream()
                .map(sp -> modelMapper.map(sp, SanPhamResponse.class)).collect(Collectors.toList());

        return PageResponse.builder()
                .pageNo(pageNo)
                .pageSize(pageSize)
                .totalPages(sanPhams.getTotalPages())
                .first(sanPhams.isFirst())
                .last(sanPhams.isLast())
                .items(sanPhamResponses)
                .build();
    }

    @Override
    public String create(SanPhamRequest request) {
        SanPham sanPham = modelMapper.map(request, SanPham.class);
        sanPham.setTrangThai(1);
        log.info("Create product code={}, name={}", sanPham.getMa(), sanPham.getTen());
        sanPhamRepository.save(sanPham);
        log.info("Product add save!");
        return "Them san pham thanh cong";
    }

    @Override
    public String update(int spId, SanPhamRequest request) {
        SanPham sanPham = this.getSanPhamById(spId);
        if (sanPham == null) return "Khong tim thay mau sac";
        sanPham = modelMapper.map(request, SanPham.class);
        sanPham.setId(spId);
        sanPhamRepository.save(sanPham);
        log.info("Product updated successfully");
        return "Sua san pham thanh cong";
    }

    @Override
    public boolean changeStatus(int spId, int status) {
        log.info("Product change status with id={}, status={}", spId, status);
        SanPham sanPham = this.getSanPhamById(spId);
        if (sanPham == null) return false;
        sanPham.setTrangThai(status);
        sanPhamRepository.save(sanPham);
        log.info("product changed status successfully");
        return true;
    }

    @Override
    public SanPhamResponse getSanPhamResponse(int spId) {
        SanPham sanPham = this.getSanPhamById(spId);
        if(sanPham == null) return null;
        return modelMapper.map(sanPham, SanPhamResponse.class);
    }

    @Override
    public SanPham getSanPhamById(int spId) {
        return sanPhamRepository.findById(spId).orElse(null);
    }

    @Override
    public List<SanPhamResponse> getAllByTrangThai(int trangThai) {
        return sanPhamRepository.findAllByTrangThai(trangThai).stream()
                .map(sp -> modelMapper.map(sp, SanPhamResponse.class)).collect(Collectors.toList());
    }
}
