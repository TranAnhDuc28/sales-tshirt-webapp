package com.poly.salestshirt.service.impl;

import com.poly.salestshirt.entity.HoaDon;
import com.poly.salestshirt.entity.KhachHang;
import com.poly.salestshirt.entity.NhanVien;
import com.poly.salestshirt.model.request.HoaDonRequest;
import com.poly.salestshirt.model.response.HoaDonResponse;
import com.poly.salestshirt.model.response.common.PageResponse;
import com.poly.salestshirt.repository.HoaDonRepository;
import com.poly.salestshirt.repository.KhachHangRepository;
import com.poly.salestshirt.repository.NhanVienRepository;
import com.poly.salestshirt.service.HoaDonService;
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
public class HoaDonServiceImpl implements HoaDonService {

    private final HoaDonRepository hoaDonRepository;
    private final NhanVienRepository nhanVienRepository;
    private final KhachHangRepository khachHangRepository;

    @Override
    public PageResponse<?> getAllByStatusAndSeachAndNgayTao(int pageNo, int pageSize, String keyword, Integer trangThai, Date ngayTao) {
        int pageNumber = 0;
        if (pageNo > 0) pageNumber = pageNo - 1;

        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        Page<HoaDon> hoaDons = hoaDonRepository.findAllByStatusAndSeachAndNgayTao(pageable, keyword, trangThai, ngayTao);

        List<HoaDonResponse> hoaDonResponses = hoaDons.stream().map(hd -> HoaDonResponse.builder()
                .id(hd.getId())
                .idNV(hd.getNhanVien() != null ? hd.getNhanVien().getId() : null)
                .nhanVien(hd.getNhanVien() != null ? hd.getNhanVien().getTen() : null)
                .idKH(hd.getKhachHang() != null ? hd.getKhachHang().getId() : null)
                .tenKhachHang(hd.getKhachHang() != null ? hd.getKhachHang().getTen() : null)
                .sodienThoai(hd.getKhachHang() != null ? hd.getKhachHang().getSDT() : null)
                .ngayMuaHang(hd.getNgayMuaHang())
                .trangThai(hd.getTrangThai())
                .build())
                .collect(Collectors.toList());

        return PageResponse.builder()
                .pageNo(pageNo)
                .pageSize(pageSize)
                .totalPages(hoaDons.getTotalPages())
                .first(hoaDons.isFirst())
                .last(hoaDons.isLast())
                .items(hoaDonResponses)
                .build();
    }

    @Override
    public String create(HoaDonRequest request) {
        HoaDon hoaDon = new HoaDon();

        Optional<NhanVien> nhanVienOptional = nhanVienRepository.findById(request.getIdNhanVien());
        if (!nhanVienOptional.isPresent()) {
            return "Không tìm thấy nhân viên.";
        }
        if (request.getIdKhachHang() == null) {
            hoaDon.setKhachHang(null);
        } else {
            Optional<KhachHang> khachHangOptional = khachHangRepository.findById(request.getIdKhachHang());
            if (!khachHangOptional.isPresent()) {
                return "Khách hàng không tồn tại.";
            }
            hoaDon.setKhachHang(khachHangOptional.get());
        }

        hoaDon.setNhanVien(nhanVienOptional.get());
        hoaDon.setTrangThai(0);
        hoaDonRepository.save(hoaDon);
        log.info("Order add save!");
        return null;
    }

    @Override
    public String update(int hdId, HoaDonRequest request) {

        Optional<NhanVien> nhanVienOptional = nhanVienRepository.findById(request.getIdNhanVien());
        if (!nhanVienOptional.isPresent()) return "Không tìm thấy nhân viên";

        Optional<KhachHang> khachHangOptional = Optional.empty();
        if (request.getIdKhachHang() != null) {
            khachHangOptional = khachHangRepository.findById(request.getIdKhachHang());
            if (!khachHangOptional.isPresent()) return "Không tìm thấy khách hàng";
        }

        HoaDon hoaDon = new HoaDon();
        hoaDon.setId(hdId);
        hoaDon.setNhanVien(nhanVienOptional.get());
        hoaDon.setKhachHang(khachHangOptional.orElse(null));
        hoaDon.setNgayMuaHang(new Date());
        hoaDon.setTrangThai(0);
        hoaDonRepository.save(hoaDon);
        log.info("Order updated successfully");
        return null;
    }

    @Override
    public String changeStatus(int hdId, int status) {
        log.info("Order change status with id={}, status={}", hdId, status);
        HoaDon hoaDon = getHoaDonById(hdId);
        if (hoaDon == null) return "Không tìm thấy hóa đơn cần thanh toán.";
        hoaDon.setTrangThai(status);
        hoaDonRepository.save(hoaDon);
        log.info("Order changed status successfully");
        return null;
    }

    @Override
    public HoaDonResponse getHoaDonResponse(int hdId) {
        HoaDon hd = getHoaDonById(hdId);
        if (hd == null) return null;
        return HoaDonResponse.builder()
                .id(hd.getId())
                .idNV(hd.getNhanVien().getId())
                .nhanVien(hd.getNhanVien().getTen())
                .idKH(hd.getKhachHang() != null ? hd.getKhachHang().getId() : null)
                .tenKhachHang(hd.getKhachHang() != null ? hd.getKhachHang().getTen() : null)
                .sodienThoai(hd.getKhachHang() != null ? hd.getKhachHang().getSDT() : null)
                .ngayMuaHang(hd.getNgayMuaHang())
                .trangThai(hd.getTrangThai())
                .build();
    }

    @Override
    public HoaDon getHoaDonById(int hdId) {
        return hoaDonRepository.findById(hdId).orElse(null);
    }

    @Override
    public List<HoaDonResponse> getAllByTrangThai(int status) {
        return hoaDonRepository.findAllByTrangThai(status)
                .stream().map(hd -> HoaDonResponse.builder()
                        .id(hd.getId())
                        .idNV(hd.getNhanVien().getId())
                        .nhanVien(hd.getNhanVien().getTen())
                        .idKH(hd.getKhachHang() != null ? hd.getKhachHang().getId() : null)
                        .tenKhachHang(hd.getKhachHang() != null ? hd.getKhachHang().getTen() : null)
                        .sodienThoai(hd.getKhachHang() != null ? hd.getKhachHang().getSDT() : null)
                        .ngayMuaHang(hd.getNgayMuaHang())
                        .trangThai(hd.getTrangThai())
                        .build())
                .collect(Collectors.toList());
    }
}
