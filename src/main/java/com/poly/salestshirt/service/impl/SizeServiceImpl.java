package com.poly.salestshirt.service.impl;

import com.poly.salestshirt.entity.Size;
import com.poly.salestshirt.dto.request.SizeRequest;
import com.poly.salestshirt.dto.response.SizeResponse;
import com.poly.salestshirt.dto.response.common.PageResponse;
import com.poly.salestshirt.mapper.SizeMapper;
import com.poly.salestshirt.repository.SizeRepository;
import com.poly.salestshirt.service.SizeService;
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
public class SizeServiceImpl implements SizeService {

    private final SizeRepository sizeRepository;
    private final SizeMapper sizeMapper;

    @Override
    public PageResponse<?> getAllByStatusAndSearch(int pageNo, int pageSize, String keyword, Integer status) {
        int pageNumber = 0;
        if (pageNo > 0) pageNumber = pageNo - 1;

        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        Page<Size> sizePage = sizeRepository.findAllBySearchAndStatus(keyword, status, pageable);

        List<SizeResponse> sizeResponseList = sizePage.stream().map(sizeMapper::toSizeResponse).toList();

        return PageResponse.builder()
                .pageNo(pageNo)
                .pageSize(pageSize)
                .totalPages(sizePage.getTotalPages())
                .first(sizePage.isFirst())
                .last(sizePage.isLast())
                .items(sizeResponseList)
                .build();
    }

    @Override
    public String create(SizeRequest request) {
        Size size = modelMapper.map(request, Size.class);
        size.setStatus(1);
        log.info("Create size code={}, name={}", size.getCode(), size.getName());
        sizeRepository.save(size);
        log.info("Size add save!");
        return "Them kich thuoc thanh cong";
    }

    @Override
    public String update(int sizeId, SizeRequest request) {
        Size size = getSizeById(sizeId);
        if (size == null) return "Khong tim thay mau sac";
        size = modelMapper.map(request, Size.class);
        size.setId(sizeId);
        sizeRepository.save(size);
        log.info("Size updated successfully");
        return "Sua kich thuoc thanh cong";
    }

    @Override
    public boolean changeStatus(int sizeId, int status) {
        log.info("Size change status with id={}, status={}", sizeId, status);
        Size size = getSizeById(sizeId);
        if (size == null) return false;
        size.setStatus(status);
        sizeRepository.save(size);
        log.info("Size changed status successfully");
        return true;
    }

    @Override
    public SizeResponse getSizeResponse(int sizeId) {
        Size size = getSizeById(sizeId);
        if (size == null) return null;
        return modelMapper.map(size, SizeResponse.class);
    }

    public Size getSizeById(int ktId) {
        return sizeRepository.findById(ktId).orElse(null);
    }

    @Override
    public List<SizeResponse> getAllByStatus(int status) {
        return sizeRepository.findAllByStatus(status).stream()
                .map(size -> new SizeResponse(
                        size.getId(),
                        size.getCode(),
                        size.getName(),
                        size.getStatus()
                )).collect(Collectors.toList());
    }
}
