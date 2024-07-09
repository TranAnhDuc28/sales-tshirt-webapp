package com.poly.salestshirt.controller.admin;

import com.poly.salestshirt.service.HoaDonChiTietService;
import com.poly.salestshirt.service.QuayBanHangService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/hoa-don/{idHoaDon}/hdct")
public class HoaDonChiTietController {

    private final HoaDonChiTietService hoaDonChiTietService;
    private final QuayBanHangService quayBanHangService;

    @GetMapping("")
    public String getListHDCTByIdHoaDon(@PathVariable int idHoaDon, Model model){
        model.addAttribute("hoaDonChiTietList", hoaDonChiTietService.getAllHDCTByIdHoaDon(idHoaDon));
        model.addAttribute("tongTienHD", quayBanHangService.getTongTienHoaDon(idHoaDon));
        return "admin/hoa_don_chi_tiet/index";
    }

    @ModelAttribute("title")
    public void title(Model model) {
        model.addAttribute("title", "Hóa đơn chi tiết");
    }
}
