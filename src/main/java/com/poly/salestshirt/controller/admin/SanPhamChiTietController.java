package com.poly.salestshirt.controller.admin;

import com.poly.salestshirt.model.request.SanPhamChiTietRequest;
import com.poly.salestshirt.model.response.SanPhamChiTietResponse;
import com.poly.salestshirt.model.response.SanPhamResponse;
import com.poly.salestshirt.service.*;
import com.poly.salestshirt.service.impl.SanPhamChiTietServiceImpl;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/san-pham/{idSanPham}/spct")
public class SanPhamChiTietController {

    private final SanPhamChiTietServiceImpl sanPhamChiTietService;
    private final MauSacService mauSacService;
    private final KichThuocService kichThuocService;
    private final SanPhamService sanPhamService;
    private SanPhamResponse sp;
    private SanPhamChiTietResponse spct;


    @GetMapping("")
    public String getListSPCTByIdSanPham(@RequestParam(defaultValue = "1") int pageNo,
                                         @RequestParam(defaultValue = "5") int pageSize,
                                         @PathVariable int idSanPham, Model model) {
        model.addAttribute("pageSanPhamChiTiet", sanPhamChiTietService.getSPCTByIdSanPham(pageNo, pageSize, idSanPham));
        return "admin/san_pham_chi_tiet/index";
    }

    @GetMapping("/create")
    public String viewCreateSPCT(@ModelAttribute("spct") SanPhamChiTietRequest request, @PathVariable int idSanPham,
                                 Model model) {
        try {
            sp = sanPhamService.getSanPhamResponse(idSanPham);
            if (sp == null) {
                model.addAttribute("errorMessage", "Không tìm thấy sản phẩm");
                return "admin/san_pham_chi_tiet/index";
            }
            model.addAttribute("tenSP", sp.getTen());
            loadDataViewCreateAndUpdate(model);
        } catch (Exception e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "admin/san_pham_chi_tiet/index";
        }
        return "admin/san_pham_chi_tiet/create";
    }

    @PostMapping("/create")
    public String createSPCT(@Valid @ModelAttribute("spct") SanPhamChiTietRequest request, BindingResult result,
                             @PathVariable int idSanPham, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("tenSP", sp.getTen());
            loadDataViewCreateAndUpdate(model);
            return "admin/san_pham_chi_tiet/create";
        }
        try {
            sanPhamChiTietService.create(request);
        } catch (Exception e) {
            model.addAttribute("errorMessage", e.getMessage());
            model.addAttribute("tenSP", sp.getTen());
            loadDataViewCreateAndUpdate(model);
            return "admin/san_pham_chi_tiet/create";
        }
        return "redirect:/admin/san-pham/" + idSanPham + "/spct";
    }

    @GetMapping("/update/{idSPCT}")
    public String viewEditSPCT(@PathVariable int idSanPham, @PathVariable int idSPCT, Model model) {
        try {
            spct = sanPhamChiTietService.getSanPhamChiTietResponse(idSPCT);
            if (spct == null) {
                model.addAttribute("errorMessage", "Không tìm thấy sản phẩm chi tiết");
                return "admin/san_pham_chi_tiet/index";
            }
            model.addAttribute("tenSP", spct.getTenSP());
            model.addAttribute("spct", spct);
            loadDataViewCreateAndUpdate(model);
        } catch (Exception e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "admin/san_pham_chi_tiet/index";
        }
        return "admin/san_pham_chi_tiet/edit";
    }

    @PostMapping("/update/{idSPCT}")
    public String editSPCT(@Valid @ModelAttribute("spct") SanPhamChiTietRequest request,
                           BindingResult result, @PathVariable int idSanPham,
                           @PathVariable int idSPCT, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("tenSP", spct.getTenSP());
            loadDataViewCreateAndUpdate(model);
            return "admin/san_pham_chi_tiet/edit";
        }
        try {
            sanPhamChiTietService.update(idSPCT, request);
        } catch (Exception e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "admin/san_pham_chi_tiet/index";
        }
        return "redirect:/admin/san-pham/" + idSanPham + "/spct";
    }

    @PostMapping("/changeStatus/{idSPCT}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> changeStatus(@RequestParam int trangThai,
                                                            @PathVariable int idSPCT, Model model) {
        String errorMessage = sanPhamChiTietService.changeStatus(idSPCT, trangThai);
        Map<String, Object> response = new HashMap<>();
        response.put("message", errorMessage);
        response.put("newStatus", trangThai);
        if (errorMessage != null) {
            model.addAttribute("errorMessage", "Thay đổi trạng thái thất bại");
        }
        return ResponseEntity.ok(response);
    }

    @ModelAttribute("title")
    public void title(Model model) {
        model.addAttribute("title", "Quản lý sản phẩm");
        model.addAttribute("titleCreate", "Thêm Sản phẩm chi tiết");
        model.addAttribute("titleEdit", "Sửa Sản phẩm chi tiết");
    }

    @ModelAttribute("pageSizeList")
    public Integer[] valuePageSize() {
        return new Integer[]{5, 10, 15, 20, 25};
    }

    private void loadDataViewCreateAndUpdate(Model model) {
        model.addAttribute("listKT", kichThuocService.getAllByTrangThai(1));
        model.addAttribute("listMS", mauSacService.getAllByTrangThai(1));
    }
}
