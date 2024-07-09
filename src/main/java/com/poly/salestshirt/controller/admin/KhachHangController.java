package com.poly.salestshirt.controller.admin;

import com.poly.salestshirt.model.request.KhachHangRequest;
import com.poly.salestshirt.model.response.KhachHangResponse;
import com.poly.salestshirt.service.KhachHangService;
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
@RequestMapping("/admin/khach-hang")
public class KhachHangController {

    private final KhachHangService khachHangService;

    @GetMapping("")
    public String getAllCustomersByStatusAndSearch(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
                                                   @RequestParam(value = "pageSize", defaultValue = "5") int pageSize,
                                                   @RequestParam(value = "keyword", required = false) String search,
                                                   @RequestParam(value = "trangThai", required = false) Integer trangThai,
                                                   Model model) {
        model.addAttribute("pageKhachHang", khachHangService.getAllByStatusAndSearch(pageNo, pageSize, search, trangThai));
        model.addAttribute("trangThai", trangThai);
        model.addAttribute("keyword", search);
        log.info("Request get all of Custormers");
        return "admin/khach_hang/index";
    }

    @GetMapping("/create")
    public String viewCreate(@ModelAttribute("kh") KhachHangRequest khDTO) {
        return "admin/khach_hang/create";
    }

    @PostMapping("/create")
    public String create(@Valid @ModelAttribute("kh") KhachHangRequest request, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/khach_hang/create";
        }
        khachHangService.create(request);
        return "redirect:/admin/khach-hang";
    }

    @GetMapping("/update/{idKH}")
    public String viewUpdate(Model model, @PathVariable int idKH, RedirectAttributes redirectAttributes) {
        KhachHangResponse khachHangResponse = khachHangService.getKhachHangResponse(idKH);
        if (khachHangResponse == null) {
            redirectAttributes.addFlashAttribute("messageError", "Không tìm thấy khách hàng.");
            return "redirect:/admin/khach-hang";
        }
        model.addAttribute("kh", khachHangResponse);
        return "admin/khach_hang/edit";
    }

    @PostMapping("/update/{idKH}")
    public String update(@Valid @ModelAttribute("kh") KhachHangRequest request,
                         BindingResult result, @PathVariable int idKH) {
        if (result.hasErrors()) {
            return "admin/khach_hang/edit";
        }
        khachHangService.update(idKH, request);
        return "redirect:/admin/khach-hang";
    }

    @GetMapping("/changeStatus/{idKH}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> changeStatus(@PathVariable int idKH, @RequestParam int trangThai,
                                                            RedirectAttributes redirectAttributes) {
        boolean check = khachHangService.changeStatus(idKH, trangThai);
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
        model.addAttribute("title", "Khách hàng");
        model.addAttribute("titleCreate", "Thêm Khách hàng");
        model.addAttribute("titleEdit", "Sửa Khách hàng");
    }

    @ModelAttribute("pageSizeList")
    public Integer[] valuePageSize() {
        return new Integer[]{5, 10, 15, 20, 25};
    }

}
