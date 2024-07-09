package com.poly.salestshirt.service.impl;

import com.poly.salestshirt.entity.MauSac;
import com.poly.salestshirt.model.request.MauSacRequest;
import com.poly.salestshirt.model.response.MauSacReponse;
import com.poly.salestshirt.model.response.common.PageResponse;
import com.poly.salestshirt.repository.MauSacRepository;
import com.poly.salestshirt.service.MauSacService;
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
public class MauSacServiceImpl implements MauSacService {

    private final MauSacRepository mauSacRepository;
    private final ModelMapper modelMapper;

    @Override
    public PageResponse<?> getAllByStatusAndSearch(int pageNo, int pageSize, String keyword, Integer trangThai) {
        int pageNumber = 0;
        if (pageNo > 0) pageNumber = pageNo - 1;

        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        Page<MauSac> mauSacs = mauSacRepository.findAllBySearchAndStatus(keyword, trangThai, pageable);

        List<MauSacReponse> mauSacReponses = mauSacs.stream()
                .map(ms -> modelMapper.map(ms, MauSacReponse.class)).collect(Collectors.toList());

        return PageResponse.builder()
                .pageNo(pageNo)
                .pageSize(pageSize)
                .totalPages(mauSacs.getTotalPages())
                .first(mauSacs.isFirst())
                .last(mauSacs.isLast())
                .items(mauSacReponses)
                .build();
    }

    @Override
    public String create(MauSacRequest request) {
        MauSac mauSac = modelMapper.map(request, MauSac.class);
        mauSac.setTrangThai(1);
        log.info("Create Color code={}, name={}", mauSac.getMa(), mauSac.getTen());
        mauSacRepository.save(mauSac);
        log.info("Color add save!");
        return "Them mau sac thanh cong";
    }

    @Override
    public String update(int msId, MauSacRequest request) {
        MauSac ms = getMauSacById(msId);
        if (ms == null) return "Khong tim thay mau sac";
        ms = modelMapper.map(request, MauSac.class);
        ms.setId(msId);
        mauSacRepository.save(ms);
        log.info("Color updated successfully");
        return "Sua mau sac thanh cong";
    }

    @Override
    public boolean changeStatus(int msId, int status) {
        log.info("Color change status with id={}, status={}", msId, status);
        MauSac ms = getMauSacById(msId);
        if (ms == null) return false;
        ms.setTrangThai(status);
        mauSacRepository.save(ms);
        log.info("Color changed status successfully");
        return true;
    }

    @Override
    public MauSacReponse getMauSacResponse(int msId) {
        MauSac ms = getMauSacById(msId);
        if (ms == null) return null;
        return modelMapper.map(ms, MauSacReponse.class);
    }

    @Override
    public MauSac getMauSacById(int msId) {
        return mauSacRepository.findById(msId).orElse(null);
    }

    @Override
    public List<MauSacReponse> getAllByTrangThai(int trangThai) {
        return mauSacRepository.findAllByTrangThai(trangThai).stream()
                .map(ms -> new MauSacReponse(
                        ms.getId(),
                        ms.getMa(),
                        ms.getTen(),
                        ms.getTrangThai()
                )).collect(Collectors.toList());
    }
}