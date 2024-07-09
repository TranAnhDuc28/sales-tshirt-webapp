package com.poly.salestshirt.controller.admin;

import com.poly.salestshirt.model.request.SanPhamRequest;
import com.poly.salestshirt.model.response.SanPhamResponse;
import com.poly.salestshirt.service.impl.SanPhamServiceImpl;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("admin/san-pham")
public class SanPhamController {

    private final SanPhamServiceImpl sanPhamService;


    @GetMapping("")
    public String getListMauSac(@RequestParam(value = "pageNo", defaultValue = "0") int pageNo,
                                @RequestParam(value = "pageSize", defaultValue = "5") int pageSize,
                                @RequestParam(value = "keyword", required = false) String search,
                                @RequestParam(value = "trangThai", required = false) Integer trangThai,
                                Model model) {
        model.addAttribute("pageSanPham", sanPhamService.getAllByStatusAndSearch(pageNo, pageSize, search, trangThai));
        model.addAttribute("trangThai", trangThai);
        model.addAttribute("keyword", search);
        log.info("Request get all of Products");
        return "admin/san_pham/index";
    }

    @GetMapping("/create")
    public String viewCreate(@ModelAttribute("sp") SanPhamRequest spDTO) {
        return "admin/san_pham/create";
    }

    @PostMapping("/create")
    public String create(@Valid @ModelAttribute("sp") SanPhamRequest request,
                         BindingResult result) {
        if (result.hasErrors()) {
            return "admin/san_pham/create";
        }
        sanPhamService.create(request);
        return "redirect:/admin/san-pham";
    }

    @GetMapping("/update/{idSanPham}")
    public String viewUpdate(Model model, @PathVariable int idSanPham, RedirectAttributes redirectAttributes) {
        SanPhamResponse sanPhamResponse = sanPhamService.getSanPhamResponse(idSanPham);
        if (sanPhamResponse == null) {
            redirectAttributes.addFlashAttribute("messageError", "Không tìm thấy sản phẩm.");
            return "redirect:/admin/san-pham";
        }
        model.addAttribute("sp", sanPhamResponse);
        return "admin/san_pham/edit";
    }

    @PostMapping("/update/{idSanPham}")
    public String update(@Valid @ModelAttribute("sp") SanPhamRequest request,
                         BindingResult result,
                         @PathVariable int idSanPham) {
        if (result.hasErrors()) {
            return "admin/san_pham/edit";
        }
        sanPhamService.update(idSanPham, request);
        return "redirect:/admin/san-pham";
    }

    @GetMapping("/changeStatus/{idSanPham}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> changeStatus(@PathVariable int idSanPham, @RequestParam int trangThai,
                                                            RedirectAttributes redirectAttributes) {
        boolean check = sanPhamService.changeStatus(idSanPham, trangThai);
        Map<String, Object> response = new HashMap<>();
        response.put("success", check);
        response.put("newStatus", trangThai);
        if (!check) {
            redirectAttributes.addFlashAttribute("messageError", "Thay đổi trạng thái thất bại");
        }
        return ResponseEntity.ok(response);
    }

    @ModelAttribute("title")
    public void title(Model model) {
        model.addAttribute("title", "Quản lý sản phẩm");
        model.addAttribute("titleCreate", "Thêm Sản phẩm");
        model.addAttribute("titleEdit", "Sửa Sản phẩm");
    }

    @ModelAttribute("pageSizeList")
    public Integer[] valuePageSize() {
        return new Integer[]{5, 10, 15, 20, 25};
    }
}
