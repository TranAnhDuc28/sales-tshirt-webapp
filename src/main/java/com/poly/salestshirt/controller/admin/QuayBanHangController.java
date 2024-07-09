package com.poly.salestshirt.controller.admin;

import com.poly.salestshirt.model.request.HoaDonRequest;
import com.poly.salestshirt.model.response.HoaDonResponse;
import com.poly.salestshirt.model.response.NhanVienReponse;
import com.poly.salestshirt.model.response.SanPhamChiTietResponse;
import com.poly.salestshirt.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class QuayBanHangController {

    private final HoaDonService hoaDonService;
    private final HoaDonChiTietService hoaDonChiTietService;
    private final SanPhamChiTietService sanPhamChiTietService;
    private final QuayBanHangService quayBanHangService;
    private final KhachHangService khachHangService;
    private final SanPhamService sanPhamService;
    private int countHoaDonCho;
    private NhanVienReponse nv;

    @GetMapping("/ban-hang")
    public String viewBanHangTaiQuay(@ModelAttribute("hd") HoaDonRequest hoaDonDTO, Model model) {
        List<HoaDonResponse> hoaDonChos = hoaDonService.getAllByTrangThai(0);
        nv = quayBanHangService.getNhanVienBanHang();
        countHoaDonCho = hoaDonChos.size();
        model.addAttribute("hoaDonChoList", hoaDonChos);
        model.addAttribute("listKHHoatDong", khachHangService.getAllByTrangThai(1));
        model.addAttribute("nv", nv);
        return "admin/ban_hang/create-hoa-don";
    }

    @PostMapping("/ban-hang")
    public String createHoaDonCho(@RequestParam(required = false) Integer idKhachHang,
                                  Model model) {
        List<HoaDonResponse> hoaDonChos = hoaDonService.getAllByTrangThai(0);
        countHoaDonCho = hoaDonChos.size();
        if (countHoaDonCho >= 5) {
            model.addAttribute("error", "Hóa đơn chờ chỉ được tạo tối đa 5 hóa đơn.");
            model.addAttribute("hoaDonChoList", hoaDonChos);
            model.addAttribute("listKHHoatDong", khachHangService.getAllByTrangThai(1));
            model.addAttribute("nv", nv);
            return "admin/ban_hang/create-hoa-don";
        }

        HoaDonRequest request = new HoaDonRequest();
        request.setIdNhanVien(nv.getId());
        request.setIdKhachHang(idKhachHang);

        String error = hoaDonService.create(request);
        if (error != null) {
            model.addAttribute("error", error);
            model.addAttribute("hoaDonChoList", hoaDonChos);
            model.addAttribute("listKHHoatDong", khachHangService.getAllByTrangThai(1));
            model.addAttribute("nv", nv);
            return "admin/ban_hang/create-hoa-don";
        }
        return "redirect:/admin/ban-hang";
    }


    @GetMapping("/quay-ban-hang/hoa-don/{idHoaDon}")
    public String viewQuayBanHang(@PathVariable int idHoaDon, Model model) {
        dataQuayBanHangByHoaDon(model, idHoaDon);
        return "admin/ban_hang/quay-ban-hang";
    }

    @PostMapping("/quay-ban-hang/hoa-don/{idHoaDon}/add-product-to-cart/{idSPCT}")
    public String themSanPhamVaoGioHang(@RequestParam(defaultValue = "0") int soLuong, @PathVariable int idHoaDon,
                                        @PathVariable int idSPCT, RedirectAttributes redirectAttributes) {
        String error = quayBanHangService.addProductToCart(idHoaDon, idSPCT, soLuong);
        if (error != null) {
            redirectAttributes.addFlashAttribute("error", error);
        };
        return "redirect:/admin/quay-ban-hang/hoa-don/" + idHoaDon;
    }

    @GetMapping("/quay-ban-hang/hoa-don/{idHoaDon}/plus-one-product-in-cart/{idSPCT}")
    public String plusOneSanPhamTrongGioHang(@PathVariable int idHoaDon, @PathVariable int idSPCT, RedirectAttributes redirectAttributes) {
        String error = quayBanHangService.plusAndMinusProductInCart("+", idHoaDon, idSPCT);
        if (error != null) {
            redirectAttributes.addFlashAttribute("error", error);
        };
        return "redirect:/admin/quay-ban-hang/hoa-don/" + idHoaDon;
    }

    @GetMapping("/quay-ban-hang/hoa-don/{idHoaDon}/minus-one-product-in-cart/{idSPCT}")
    public String minusOneSanPhamTrongGioHang(@PathVariable int idHoaDon, @PathVariable int idSPCT, RedirectAttributes redirectAttributes) {
        String error = quayBanHangService.plusAndMinusProductInCart("-", idHoaDon, idSPCT);
        if (error != null) {
            redirectAttributes.addFlashAttribute("error", error);
        };
        return "redirect:/admin/quay-ban-hang/hoa-don/" + idHoaDon;
    }

    @GetMapping("/quay-ban-hang/hoa-don/{idHoaDon}/remove-product-from-cart/{idSPCT}")
    public String xoaSanPhamKhoiGioHang(@PathVariable int idHoaDon, @PathVariable int idSPCT) {
        quayBanHangService.removeProductFromCart(idHoaDon, idSPCT);
        return "redirect:/admin/quay-ban-hang/hoa-don/" + idHoaDon;
    }

    @PostMapping("/quay-ban-hang/thanh-toan")
    public String thanhToanHoaDon(@RequestParam("idHoaDon") int idHoaDon, Model model) {
        String thanhToan = quayBanHangService.thanhToan(idHoaDon);
        if (thanhToan != null) {
            dataQuayBanHangByHoaDon(model, idHoaDon);
            return "admin/ban_hang/quay-ban-hang";
        }
        return "redirect:/admin/ban-hang";
    }

    @ResponseBody
    @GetMapping("/quay-ban-hang/san-pham/{idSanPham}/spct")
    public List<SanPhamChiTietResponse> getListSPCTByIdSanPham(@PathVariable int idSanPham) {
        return sanPhamChiTietService.getAllByIdSanPhamAndTrangThai(idSanPham, 1);
    }

    @ModelAttribute("title")
    public void title(Model model) {
        model.addAttribute("title", "Bán hàng tại quầy");
    }

    private void dataQuayBanHangByHoaDon(Model model, int idHoaDon) {
        HoaDonResponse hoaDonResponse = hoaDonService.getHoaDonResponse(idHoaDon);
        if (hoaDonResponse == null) {
            model.addAttribute("error", "Không tìm thấy hóa đơn vui lòng thử lại.");
            return;
        }
        model.addAttribute("hd", hoaDonResponse);
        model.addAttribute("sanPhamList", sanPhamService.getAllByTrangThai(1));
        model.addAttribute("hoaDonChiTietList", hoaDonChiTietService.getAllHDCTByIdHoaDon(idHoaDon));
        model.addAttribute("tongGiaTriHoaDon", quayBanHangService.getTongTienHoaDon(idHoaDon));
    }


}
