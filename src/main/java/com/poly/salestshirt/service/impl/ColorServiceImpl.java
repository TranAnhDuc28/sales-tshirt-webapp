package com.poly.salestshirt.service.impl;

import com.poly.salestshirt.entity.Color;
import com.poly.salestshirt.dto.request.ColorRequest;
import com.poly.salestshirt.dto.response.ColorResponse;
import com.poly.salestshirt.dto.response.common.PageResponse;
import com.poly.salestshirt.repository.ColorRepository;
import com.poly.salestshirt.service.ColorService;
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
public class ColorServiceImpl implements ColorService {

    private final ColorRepository colorRepository;
    private final ModelMapper modelMapper;

    @Override
    public PageResponse<?> getAllByStatusAndSearch(int pageNo, int pageSize, String keyword, Integer status) {
        int pageNumber = 0;
        if (pageNo > 0) pageNumber = pageNo - 1;

        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        Page<Color> page = colorRepository.findAllBySearchAndStatus(keyword, status, pageable);

        List<ColorResponse> colorResponseList = page.stream().map(ms -> modelMapper.map(ms, ColorResponse.class)).toList();

        return PageResponse.builder()
                .pageNo(pageNo)
                .pageSize(pageSize)
                .totalPages(page.getTotalPages())
                .first(page.isFirst())
                .last(page.isLast())
                .items(colorResponseList)
                .build();
    }

    @Override
    public String create(ColorRequest request) {
        Color color = modelMapper.map(request, Color.class);
        color.setStatus(1);
        log.info("Create Color code={}, name={}", color.getCode(), color.getName());
        colorRepository.save(color);
        log.info("Color add save!");
        return "Them mau sac thanh cong";
    }

    @Override
    public String update(int colorId, ColorRequest request) {
        Color color = getColorById(colorId);
        if (color == null) return "Khong tim thay mau sac";
        color = modelMapper.map(request, Color.class);
        color.setId(colorId);
        colorRepository.save(color);
        log.info("Color updated successfully");
        return "Sua mau sac thanh cong";
    }

    @Override
    public boolean changeStatus(int colorId, int status) {
        log.info("Color change status with id={}, status={}", colorId, status);
        Color color = getColorById(colorId);
        if (color == null) return false;
        color.setStatus(status);
        colorRepository.save(color);
        log.info("Color changed status successfully");
        return true;
    }

    @Override
    public ColorResponse getColorResponse(int colorId) {
        Color color = getColorById(colorId);
        if (color == null) return null;
        return modelMapper.map(color, ColorResponse.class);
    }

    @Override
    public List<ColorResponse> getAllByStatus(int status) {
        return colorRepository.findAllByStatus(status).stream()
                .map(color -> new ColorResponse(
                        color.getId(),
                        color.getCode(),
                        color.getName(),
                        color.getStatus()
                )).toList();
    }

    public Color getColorById(int colorId) {
        return colorRepository.findById(colorId).orElse(null);
    }

}