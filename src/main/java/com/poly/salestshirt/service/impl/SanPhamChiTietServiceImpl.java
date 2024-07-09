package com.poly.salestshirt.service.impl;

import com.poly.salestshirt.entity.KichThuoc;
import com.poly.salestshirt.entity.MauSac;
import com.poly.salestshirt.entity.SanPham;
import com.poly.salestshirt.entity.SanPhamChiTiet;
import com.poly.salestshirt.model.request.SanPhamChiTietRequest;
import com.poly.salestshirt.model.response.common.PageResponse;
import com.poly.salestshirt.model.response.SanPhamChiTietResponse;
import com.poly.salestshirt.repository.KichThuocRepository;
import com.poly.salestshirt.repository.MauSacRepository;
import com.poly.salestshirt.repository.SanPhamChiTietRepository;
import com.poly.salestshirt.repository.SanPhamRepository;
import com.poly.salestshirt.service.SanPhamChiTietService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class SanPhamChiTietServiceImpl implements SanPhamChiTietService {

    private final SanPhamChiTietRepository sanPhamChiTietRepository;
    private final SanPhamRepository sanPhamRepository;
    private final KichThuocRepository kichThuocRepository;
    private final MauSacRepository mauSacRepository;

    @Override
    public PageResponse<?> getSPCTByIdSanPham(int pageNo, int pageSize, int idSanPham) {
        int pageNumber = 0;
        if (pageNo > 0) pageNumber = pageNo - 1;

        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        Page<SanPhamChiTiet> page = sanPhamChiTietRepository.findAllByIdSanPham(pageable, idSanPham);
        return PageResponse.builder()
                .pageNo(pageNo)
                .pageSize(pageSize)
                .totalPages(page.getTotalPages())
                .first(page.isFirst())
                .last(page.isLast())
                .items(page.stream().map(spct -> SanPhamChiTietResponse.builder()
                        .id(spct.getId())
                        .maSPCT(spct.getMaSPCT())
                        .idSanPham(spct.getSanPham().getId())
                        .tenSP(spct.getSanPham().getTen())
                        .idKichThuoc(spct.getKichThuoc() != null ? spct.getKichThuoc().getId() : null)
                        .kichThuoc(spct.getKichThuoc() != null ? spct.getKichThuoc().getTen() : null)
                        .idMauSac(spct.getMauSac() != null ? spct.getMauSac().getId() : null)
                        .mauSac(spct.getMauSac() != null ? spct.getMauSac().getTen() : null)
                        .soLuong(spct.getSoLuong())
                        .donGia(spct.getDonGia())
                        .trangThai(spct.getTrangThai())
                        .build())
                        .collect(Collectors.toList()))
                .build();
    }

    @Override
    public String create(SanPhamChiTietRequest request) {
        SanPhamChiTiet sanPhamChiTiet = new SanPhamChiTiet();

        Optional<SanPham> sanPhamOptional = sanPhamRepository.findById(request.getIdSanPham());
        if(!sanPhamOptional.isPresent()) return "Không tìm thấy sản phẩm.";

        Optional<KichThuoc> kichThuocOptional = Optional.empty();
        if (request.getIdKichThuoc() != null) {
            kichThuocOptional = kichThuocRepository.findById(request.getIdKichThuoc());
            if(!kichThuocOptional.isPresent()) return "Không tìm thấy kích thước.";
        }

        Optional<MauSac> mauSacOptional = Optional.empty();
        if (request.getIdMauSac() != null) {
            mauSacOptional = mauSacRepository.findById(request.getIdMauSac());
            if(!mauSacOptional.isPresent()) return "Không tìm thấy màu sắc.";
        }

        sanPhamChiTiet.setMaSPCT(request.getMaSPCT());
        sanPhamChiTiet.setSanPham(sanPhamOptional.get());
        sanPhamChiTiet.setKichThuoc(kichThuocOptional.orElse(null));
        sanPhamChiTiet.setMauSac(mauSacOptional.orElse(null));
        sanPhamChiTiet.setSoLuong(request.getSoLuong());
        sanPhamChiTiet.setDonGia(request.getDonGia());
        sanPhamChiTiet.setTrangThai(1);
        sanPhamChiTietRepository.save(sanPhamChiTiet);
        return "Thêm sản phẩm chi tiết thành công.";
    }

    @Override
    public String update(int spctId, SanPhamChiTietRequest request) {
        SanPhamChiTiet sanPhamChiTiet = new SanPhamChiTiet();

        Optional<SanPham> sanPhamOptional = sanPhamRepository.findById(request.getIdSanPham());
        if(!sanPhamOptional.isPresent()) return "Không tìm thấy sản phẩm.";

        Optional<KichThuoc> kichThuocOptional = Optional.empty();
        if (request.getIdKichThuoc() != null) {
            kichThuocOptional = kichThuocRepository.findById(request.getIdKichThuoc());
            if(!kichThuocOptional.isPresent()) return "Không tìm thấy kích thước.";
        }

        Optional<MauSac> mauSacOptional = Optional.empty();
        if (request.getIdMauSac() != null) {
            mauSacOptional = mauSacRepository.findById(request.getIdMauSac());
            if(!mauSacOptional.isPresent()) return "Không tìm thấy màu sắc.";
        }

        sanPhamChiTiet.setId(spctId);
        sanPhamChiTiet.setMaSPCT(request.getMaSPCT());
        sanPhamChiTiet.setSanPham(sanPhamOptional.get());
        sanPhamChiTiet.setKichThuoc(kichThuocOptional.orElse(null));
        sanPhamChiTiet.setMauSac(mauSacOptional.orElse(null));
        sanPhamChiTiet.setSoLuong(request.getSoLuong());
        sanPhamChiTiet.setDonGia(request.getDonGia());
        sanPhamChiTiet.setTrangThai(request.getTrangThai());
        sanPhamChiTietRepository.save(sanPhamChiTiet);
        return "Sửa sản phẩm chi tiết thành công.";
    }

    @Override
    public String changeStatus(int spctId, int status) {
        log.info("Product detail change status with id={}, status={}", spctId, status);
        SanPhamChiTiet sanPhamChiTiet = getSanPhamChiTietById(spctId);
        if (sanPhamChiTiet == null) return "Không tìm thấy sản phẩm chi tiết";
        sanPhamChiTiet.setTrangThai(status);
        sanPhamChiTietRepository.save(sanPhamChiTiet);
        log.info("Product detail changed status successfully");
        return null;
    }

    @Override
    public SanPhamChiTietResponse getSanPhamChiTietResponse(int id) {
        SanPhamChiTiet spct = getSanPhamChiTietById(id);
        if (spct == null) return null;
        return SanPhamChiTietResponse.builder()
                .id(spct.getId())
                .maSPCT(spct.getMaSPCT())
                .idSanPham(spct.getSanPham().getId())
                .tenSP(spct.getSanPham().getTen())
                .idKichThuoc(spct.getKichThuoc() != null ? spct.getKichThuoc().getId() : null)
                .kichThuoc(spct.getKichThuoc() != null ? spct.getKichThuoc().getTen() : null)
                .idMauSac(spct.getMauSac() != null ? spct.getMauSac().getId() : null)
                .mauSac(spct.getMauSac() != null ? spct.getMauSac().getTen() : null)
                .soLuong(spct.getSoLuong())
                .donGia(spct.getDonGia())
                .trangThai(spct.getTrangThai())
                .build();
    }

    @Override
    public SanPhamChiTiet getSanPhamChiTietById(int id) {
        return sanPhamChiTietRepository.findById(id).orElse(null);
    }

    @Override
    public List<SanPhamChiTietResponse> getAllByIdSanPhamAndTrangThai(int idSP, int trangThai) {
        return sanPhamChiTietRepository.findAllByIdSanPhamAndTrangThai(idSP, trangThai).stream()
                .map(spct -> SanPhamChiTietResponse.builder()
                        .id(spct.getId())
                        .maSPCT(spct.getMaSPCT())
                        .idSanPham(spct.getSanPham().getId())
                        .tenSP(spct.getSanPham().getTen())
                        .idKichThuoc(spct.getKichThuoc() != null ? spct.getKichThuoc().getId() : null)
                        .kichThuoc(spct.getKichThuoc() != null ? spct.getKichThuoc().getTen() : null)
                        .idMauSac(spct.getMauSac() != null ? spct.getMauSac().getId() : null)
                        .mauSac(spct.getMauSac() != null ? spct.getMauSac().getTen() : null)
                        .soLuong(spct.getSoLuong())
                        .donGia(spct.getDonGia())
                        .trangThai(spct.getTrangThai())
                        .build())
                .collect(Collectors.toList());
    }
}
