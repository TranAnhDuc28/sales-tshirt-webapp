package com.poly.salestshirt.service.impl;

import com.poly.salestshirt.entity.HoaDonChiTiet;
import com.poly.salestshirt.entity.SanPhamChiTiet;
import com.poly.salestshirt.model.request.HoaDonChiTietRequest;
import com.poly.salestshirt.model.response.HoaDonChiTietResponse;
import com.poly.salestshirt.repository.HoaDonChiTietRepository;
import com.poly.salestshirt.repository.SanPhamChiTietRepository;
import com.poly.salestshirt.service.HoaDonChiTietService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class HoaDonChiTietServiceImpl implements HoaDonChiTietService {

    private final HoaDonChiTietRepository hoaDonChiTietRepository;
    private final SanPhamChiTietRepository sanPhamChiTietRepository;
    private final ModelMapper modelMapper;

    public List<HoaDonChiTietResponse> getAllHDCTByIdHoaDon(int idHoaDon) {
        List<HoaDonChiTiet> hoaDonChiTiets = hoaDonChiTietRepository.findAllByIdHoaDon(idHoaDon);
        return hoaDonChiTiets.stream().map(hdct -> HoaDonChiTietResponse.builder()
                .id(hdct.getId())
                .idHoaDon(hdct.getIdHoaDon())
                .idSPCT(hdct.getSpct().getId())
                .tenSPCT((hdct.getSpct().getSanPham() != null ? hdct.getSpct().getSanPham().getTen() : "") +
                        (hdct.getSpct().getMauSac() != null ? (" - Color: " + hdct.getSpct().getMauSac().getTen()) : "") +
                        (hdct.getSpct().getKichThuoc() != null ? (" - Size: " + hdct.getSpct().getKichThuoc().getTen()) : ""))
                .soLuong(hdct.getSoLuong())
                .donGia(hdct.getDonGia())
                .tongGia(hdct.getSoLuong() * hdct.getDonGia())
                .trangThai(hdct.getTrangThai())
                .build())
                .collect(Collectors.toList());
    }

    @Override
    public String create(HoaDonChiTietRequest request) {
        HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();

        Optional<SanPhamChiTiet> sanPhamChiTietOptional = sanPhamChiTietRepository.findById(request.getIdSPCT());
        if (!sanPhamChiTietOptional.isPresent()) {
            return "Không tìm thấy sản phẩm chi tiết.";
        }

        hoaDonChiTiet.setIdHoaDon(request.getIdHoaDon());
        hoaDonChiTiet.setSpct(sanPhamChiTietOptional.get());
        hoaDonChiTiet.setSoLuong(request.getSoLuong());
        hoaDonChiTiet.setDonGia(request.getDonGia());
        hoaDonChiTiet.setTrangThai(request.getTrangThai());
        hoaDonChiTietRepository.save(hoaDonChiTiet);
        return null;
    }

    @Override
    public String update(int idHDCT, HoaDonChiTietRequest request) {
        HoaDonChiTiet hoaDonChiTiet = getById(idHDCT);
        if (hoaDonChiTiet == null) return "Không tìm thấy hóa đơn chi tiết";

        Optional<SanPhamChiTiet> sanPhamChiTietOptional = sanPhamChiTietRepository.findById(request.getIdSPCT());
        if (!sanPhamChiTietOptional.isPresent()) return "Không tìm thấy sản phẩm chi tiết.";

        hoaDonChiTiet.setId(idHDCT);
        hoaDonChiTiet.setIdHoaDon(request.getIdHoaDon());
        hoaDonChiTiet.setSpct(sanPhamChiTietOptional.get());
        hoaDonChiTiet.setSoLuong(request.getSoLuong());
        hoaDonChiTiet.setDonGia(request.getDonGia());
        hoaDonChiTiet.setTrangThai(request.getTrangThai());
        hoaDonChiTietRepository.save(hoaDonChiTiet);
        log.info("Order detail updated successfully");
        return "Sửa hóa đơn chi tiết thành công.";
    }

    @Override
    public String delete(int idHDCT) {
        log.info("Delete order detail with id={}", idHDCT);

        Optional<HoaDonChiTiet> hoaDonChiTietOptional = hoaDonChiTietRepository.findById(idHDCT);
        if (!hoaDonChiTietOptional.isPresent()) return "Không tìm thấy hóa đơn chi tiết.";

        hoaDonChiTietRepository.deleteById(idHDCT);
        return "Xóa thành công hóa đơn chi tiết.";
    }

    @Override
    public HoaDonChiTietResponse getHoaDonChiTietResponse(int id) {
        return null;
    }

    @Override
    public HoaDonChiTiet getById(int id) {
        return hoaDonChiTietRepository.findById(id).orElse(null);
    }

}
