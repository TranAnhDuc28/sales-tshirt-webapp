package com.poly.salestshirt.service.impl;

import com.poly.salestshirt.entity.CustomUserDetails;
import com.poly.salestshirt.model.request.HoaDonChiTietRequest;
import com.poly.salestshirt.model.request.SanPhamChiTietRequest;
import com.poly.salestshirt.model.response.HoaDonChiTietResponse;
import com.poly.salestshirt.model.response.NhanVienReponse;
import com.poly.salestshirt.model.response.SanPhamChiTietResponse;
import com.poly.salestshirt.service.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@Slf4j
@RequiredArgsConstructor
public class QuayBanHangServiceImpl implements QuayBanHangService {

    private final HoaDonChiTietService hoaDonChiTietService;
    private final SanPhamChiTietService sanPhamChiTietService;
    private final HoaDonService hoaDonService;
    private final NhanVienService nhanVienService;

    public String addProductToCart(Integer idHoaDon, Integer idSPCT, int soLuong) {
        log.info("Add product to cart with IdHoaDon={}, IdSPCT={}, quantity={}", idHoaDon, idSPCT, soLuong);
        if (soLuong <= 0) return "Số lượng phải lớn hơn 0";
        if (idHoaDon == null || idSPCT == null) return "Không nhận được id hóa đơn hoặc id sản phẩm.";

        // tìm kiếm product để thêm vào giỏ hàng
        SanPhamChiTietResponse sanPhamChiTietResponse = sanPhamChiTietService.getSanPhamChiTietResponse(idSPCT);
        if (sanPhamChiTietResponse == null) return "Không tìm thấy sản phẩm chi tiết.";
        if (sanPhamChiTietResponse.getSoLuong() == 0) return "Sản phẩm hết hàng.";

        // lấy list product đang có trong giỏ hàng
        List<HoaDonChiTietResponse> gioHang = hoaDonChiTietService.getAllHDCTByIdHoaDon(idHoaDon);

        Optional<HoaDonChiTietResponse> existingHDCT = Optional.empty();
        if (!gioHang.isEmpty()) {
            existingHDCT = gioHang.stream()
                    .filter(hdct -> hdct.getIdSPCT().equals(idSPCT) && hdct.getTrangThai() == 1)
                    .findFirst();
        }

        // kiểm tra product đã có trong giỏ hàng chưa
        // nếu có thì thay đổi số lượng
        HoaDonChiTietRequest requestHDCT = new HoaDonChiTietRequest();
        if (existingHDCT.isPresent()) {
            requestHDCT.setIdHoaDon(existingHDCT.get().getIdHoaDon());
            requestHDCT.setIdSPCT(existingHDCT.get().getIdSPCT());
            requestHDCT.setSoLuong(existingHDCT.get().getSoLuong() + soLuong);
            requestHDCT.setDonGia(existingHDCT.get().getDonGia());
            requestHDCT.setTrangThai(existingHDCT.get().getTrangThai());
            hoaDonChiTietService.update(existingHDCT.get().getId(), requestHDCT);
        } else { // nếu không tồn tại thêm mới product to cart
            requestHDCT.setIdHoaDon(idHoaDon);
            requestHDCT.setIdSPCT(idSPCT);
            if (soLuong > sanPhamChiTietResponse.getSoLuong()) {
                requestHDCT.setSoLuong(sanPhamChiTietResponse.getSoLuong());
            } else {
                requestHDCT.setSoLuong(soLuong);
            }
            requestHDCT.setDonGia(sanPhamChiTietResponse.getDonGia());
            requestHDCT.setTrangThai(1);
            hoaDonChiTietService.create(requestHDCT);
        }

        // update giảm số lượng sản phẩm đã mua thêm
        int soLuongTrongKho = sanPhamChiTietResponse.getSoLuong();
        if (soLuong > sanPhamChiTietResponse.getSoLuong()) {
            soLuongTrongKho = 0;
        } else {
            soLuongTrongKho = sanPhamChiTietResponse.getSoLuong() - soLuong;
        }
        SanPhamChiTietRequest requestSPCT = SanPhamChiTietRequest.builder()
                .maSPCT(sanPhamChiTietResponse.getMaSPCT())
                .idSanPham(sanPhamChiTietResponse.getIdSanPham())
                .idKichThuoc(sanPhamChiTietResponse.getIdKichThuoc())
                .idMauSac(sanPhamChiTietResponse.getIdMauSac())
                .soLuong(soLuongTrongKho)
                .donGia(sanPhamChiTietResponse.getDonGia())
                .trangThai(sanPhamChiTietResponse.getTrangThai())
                .build();
        sanPhamChiTietService.update(sanPhamChiTietResponse.getId(), requestSPCT);
        return null;
    }

    @Override
    public String plusAndMinusProductInCart(String action, Integer idHoaDon, Integer idSPCT) {
        log.info("Plus and minus to cart with IdHoaDon={}, IdSPCT={}, quantity={}", idHoaDon, idSPCT, 1);
        if (idHoaDon == null || idSPCT == null) return "Không nhận được id hóa đơn hoặc id sản phẩm.";

        // tìm kiếm product để thêm vào giỏ hàng
        SanPhamChiTietResponse sanPhamChiTietResponse = sanPhamChiTietService.getSanPhamChiTietResponse(idSPCT);
        if (sanPhamChiTietResponse == null) return "Không tìm thấy sản phẩm chi tiết.";
        if (action.equals("+") && sanPhamChiTietResponse.getSoLuong() == 0) return "Sản phẩm hết hàng.";

        // lấy list product đang có trong giỏ hàng
        List<HoaDonChiTietResponse> gioHang = hoaDonChiTietService.getAllHDCTByIdHoaDon(idHoaDon);

        Optional<HoaDonChiTietResponse> existingHDCT = Optional.empty();
        if (!gioHang.isEmpty()) {
            existingHDCT = gioHang.stream()
                    .filter(hdct -> hdct.getIdSPCT().equals(idSPCT) && hdct.getTrangThai() == 1)
                    .findFirst();
        }

        // + and - 1 spct trong giỏ hàng
        HoaDonChiTietRequest requestHDCT = new HoaDonChiTietRequest();
        if (action.equals("+")) {
            requestHDCT.setSoLuong(existingHDCT.get().getSoLuong() + 1);
        } else if (action.equals("-")) {
            if(existingHDCT.get().getSoLuong() == 1) {
                removeProductFromCart(idHoaDon, idSPCT);
            } else {
                requestHDCT.setSoLuong(existingHDCT.get().getSoLuong() - 1);
            }
        }
        requestHDCT.setIdHoaDon(existingHDCT.get().getIdHoaDon());
        requestHDCT.setIdSPCT(existingHDCT.get().getIdSPCT());
        requestHDCT.setDonGia(existingHDCT.get().getDonGia());
        requestHDCT.setTrangThai(existingHDCT.get().getTrangThai());
        hoaDonChiTietService.update(existingHDCT.get().getId(), requestHDCT);

        // update giảm số lượng sản phẩm trong kho
        int soLuongTrongKho = sanPhamChiTietResponse.getSoLuong();
        if (action.equals("+")) {
            soLuongTrongKho = sanPhamChiTietResponse.getSoLuong() - 1;
        } else if (action.equals("-")) {
            soLuongTrongKho = sanPhamChiTietResponse.getSoLuong() + 1;
        }
        SanPhamChiTietRequest requestSPCT = SanPhamChiTietRequest.builder()
                .maSPCT(sanPhamChiTietResponse.getMaSPCT())
                .idSanPham(sanPhamChiTietResponse.getIdSanPham())
                .idKichThuoc(sanPhamChiTietResponse.getIdKichThuoc())
                .idMauSac(sanPhamChiTietResponse.getIdMauSac())
                .soLuong(soLuongTrongKho)
                .donGia(sanPhamChiTietResponse.getDonGia())
                .trangThai(sanPhamChiTietResponse.getTrangThai())
                .build();
        sanPhamChiTietService.update(sanPhamChiTietResponse.getId(), requestSPCT);
        return null;
    }

    @Override
    public double getTongTienHoaDon(Integer idHoaDon) {
        double tongGiaTriHoaDon = 0;
        if (idHoaDon == null) return tongGiaTriHoaDon;
        List<HoaDonChiTietResponse> gioHang = hoaDonChiTietService.getAllHDCTByIdHoaDon(idHoaDon);

        for (HoaDonChiTietResponse hdct : gioHang) {
            tongGiaTriHoaDon += hdct.getTongGia();
        }
        return tongGiaTriHoaDon;
    }

    @Override
    public String removeProductFromCart(Integer idHoaDon, Integer idSPCT) {
        if (idHoaDon == null || idSPCT == null) return "Không tìm nhận được id hóa đơn hoặc id sản phẩm.";

        List<HoaDonChiTietResponse> gioHang = hoaDonChiTietService.getAllHDCTByIdHoaDon(idHoaDon);

        HoaDonChiTietResponse productRemove = gioHang.stream()
                .filter(hdct -> hdct.getIdHoaDon().equals(idHoaDon) && hdct.getIdSPCT().equals(idSPCT))
                .findFirst()
                .orElse(null);

        if (productRemove != null) {
            hoaDonChiTietService.delete(productRemove.getId());

            // hồi lại số lượng sản phẩm trong kho
            SanPhamChiTietResponse sanPhamChiTietResponse = sanPhamChiTietService.getSanPhamChiTietResponse(productRemove.getIdSPCT());
            if (sanPhamChiTietResponse == null) return "Không tìm nhận được sản phẩm để hồi lại số lượng.";
            SanPhamChiTietRequest request = SanPhamChiTietRequest.builder()
                    .maSPCT(sanPhamChiTietResponse.getMaSPCT())
                    .idSanPham(sanPhamChiTietResponse.getIdSanPham())
                    .idKichThuoc(sanPhamChiTietResponse.getIdKichThuoc())
                    .idMauSac(sanPhamChiTietResponse.getIdMauSac())
                    .soLuong(sanPhamChiTietResponse.getSoLuong() + productRemove.getSoLuong())
                    .donGia(sanPhamChiTietResponse.getDonGia())
                    .trangThai(sanPhamChiTietResponse.getTrangThai())
                    .build();
            sanPhamChiTietService.update(sanPhamChiTietResponse.getId(), request);
        }
        return null;
    }

    @Override
    public String thanhToan(Integer idHoaDon) {
        return hoaDonService.changeStatus(idHoaDon, 1);
    }

    @Override
    public NhanVienReponse getNhanVienBanHang() {
        NhanVienReponse nv = null;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication != null && authentication.isAuthenticated()) {
            Object principal = authentication.getPrincipal();

            if (principal instanceof CustomUserDetails) {
                CustomUserDetails userDetails = (CustomUserDetails) principal;
                if (userDetails == null) {
                    return null;
                }
                nv = nhanVienService.getNhanVienReponseByAccountId(userDetails.getAccount().getId());
            } else {
                return null;
            }
        } else {
            return null;
        }
        return nv;
    }


}
