package com.poly.salestshirt.controller.admin;

import com.poly.salestshirt.model.request.HoaDonRequest;
import com.poly.salestshirt.model.response.HoaDonResponse;
import com.poly.salestshirt.service.KhachHangService;
import com.poly.salestshirt.service.NhanVienService;
import com.poly.salestshirt.service.impl.HoaDonServiceImpl;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/hoa-don")
public class HoaDonController {

    private final HoaDonServiceImpl hoaDonService;
    private final NhanVienService nhanVienService;
    private final KhachHangService khachHangService;

    @GetMapping("")
    public String getListHoaDon(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
                                @RequestParam(value = "pageSize", defaultValue = "5") int pageSize,
                                @RequestParam(value = "keyword", required = false) String search,
                                @RequestParam(value = "trangThai", required = false) Integer trangThai,
                                @RequestParam(value = "ngayTao", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date ngayTao,
                                Model model) {
        model.addAttribute("pageHoaDon",
                hoaDonService.getAllByStatusAndSeachAndNgayTao(pageNo, pageSize, search, trangThai, ngayTao));
        model.addAttribute("keyword", search);
        model.addAttribute("trangThai", trangThai);
        model.addAttribute("ngayTao", ngayTao);
        return "admin/hoa_don/index";
    }

    @GetMapping("/update/{idHoaDon}")
    public String viewUpdate(Model model, @PathVariable int idHoaDon, RedirectAttributes redirectAttributes) {
        HoaDonResponse hoaDonResponse = hoaDonService.getHoaDonResponse(idHoaDon);
        if (hoaDonResponse == null) {
            redirectAttributes.addAttribute("errorMessage", "Không tìm thấy hóa đơn");
            return "redirect:/admin/hoa-don";
        }
        HoaDonRequest request = new HoaDonRequest();
        request.setIdNhanVien(hoaDonResponse.getIdNV());
        request.setIdKhachHang(hoaDonResponse.getIdKH());
        request.setTrangThai(hoaDonResponse.getTrangThai());

        model.addAttribute("dsNV", nhanVienService.getAllByTrangThai(1));
        model.addAttribute("dsKH", khachHangService.getAllByTrangThai(1));
        model.addAttribute("hd", request);
        return "admin/hoa_don/edit";
    }

    @PostMapping("/update/{idHoaDon}")
    public String viewUpdate(@PathVariable int idHoaDon, @Valid @ModelAttribute("hd") HoaDonRequest request,
                             BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "admin/hoa_don/edit";
        }
        String errorMessage = hoaDonService.update(idHoaDon, request);
        if (errorMessage != null) {
            redirectAttributes.addFlashAttribute("errorMessage", errorMessage);
            return "redirect:/admin/hoa-don/update/" + idHoaDon;
        }
        return "redirect:/admin/hoa-don";
    }

    @ModelAttribute("title")
    public void title(Model model) {
        model.addAttribute("title", "Quản lý Hóa đơn");
        model.addAttribute("titleEdit", "Sửa hóa đơn");
    }

    @ModelAttribute("pageSizeList")
    public Integer[] valuePageSize() {
        return new Integer[]{5, 10, 15, 20, 25};
    }
}
