package com.poly.salestshirt.service.impl;

import com.poly.salestshirt.entity.KichThuoc;
import com.poly.salestshirt.model.request.KichThuocRequest;
import com.poly.salestshirt.model.response.KichThuocReponse;
import com.poly.salestshirt.model.response.common.PageResponse;
import com.poly.salestshirt.repository.KichThuocRepository;
import com.poly.salestshirt.service.KichThuocService;
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
public class KichThuocServiceImpl implements KichThuocService {

    private final KichThuocRepository kichThuocRepository;
    private final ModelMapper modelMapper;

    @Override
    public PageResponse<?> getAllByStatusAndSearch(int pageNo, int pageSize, String keyword, Integer trangThai) {
        int pageNumber = 0;
        if (pageNo > 0) pageNumber = pageNo - 1;

        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        Page<KichThuoc> kichThuocs = kichThuocRepository.findAllBySearchAndStatus(keyword, trangThai, pageable);

        List<KichThuocReponse> kichThuocReponses = kichThuocs.stream()
                .map(kt -> modelMapper.map(kt, KichThuocReponse.class)).collect(Collectors.toList());

        return PageResponse.builder()
                .pageNo(pageNo)
                .pageSize(pageSize)
                .totalPages(kichThuocs.getTotalPages())
                .first(kichThuocs.isFirst())
                .last(kichThuocs.isLast())
                .items(kichThuocReponses)
                .build();
    }

    @Override
    public String create(KichThuocRequest request) {
        KichThuoc kichThuoc = modelMapper.map(request, KichThuoc.class);
        kichThuoc.setTrangThai(1);
        log.info("Create size code={}, name={}", kichThuoc.getMa(), kichThuoc.getTen());
        kichThuocRepository.save(kichThuoc);
        log.info("Size add save!");
        return "Them kich thuoc thanh cong";
    }

    @Override
    public String update(int ktId, KichThuocRequest request) {
        KichThuoc kichThuoc = getKichThuocById(ktId);
        if (kichThuoc == null) return "Khong tim thay mau sac";
        kichThuoc = modelMapper.map(request, KichThuoc.class);
        kichThuoc.setId(ktId);
        kichThuocRepository.save(kichThuoc);
        log.info("Size updated successfully");
        return "Sua kich thuoc thanh cong";
    }

    @Override
    public boolean changeStatus(int ktId, int status) {
        log.info("Size change status with id={}, status={}", ktId, status);
        KichThuoc kichThuoc = getKichThuocById(ktId);
        if (kichThuoc == null) return false;
        kichThuoc.setTrangThai(status);
        kichThuocRepository.save(kichThuoc);
        log.info("Size changed status successfully");
        return true;
    }

    @Override
    public KichThuocReponse getKichThuocReponse(int ktId) {
        KichThuoc kichThuoc = getKichThuocById(ktId);
        if (kichThuoc == null) return null;
        return modelMapper.map(kichThuoc, KichThuocReponse.class);
    }

    @Override
    public KichThuoc getKichThuocById(int ktId) {
        return kichThuocRepository.findById(ktId).orElse(null);
    }

    @Override
    public List<KichThuocReponse> getAllByTrangThai(int trangThai) {
        return kichThuocRepository.findAllByTrangThai(trangThai).stream()
                .map(kt -> new KichThuocReponse(
                        kt.getId(),
                        kt.getMa(),
                        kt.getTen(),
                        kt.getTrangThai()
                )).collect(Collectors.toList());
    }
}
