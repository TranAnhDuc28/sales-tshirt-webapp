package com.poly.salestshirt.controller.admin;

import com.poly.salestshirt.model.request.NhanVienRequest;
import com.poly.salestshirt.model.response.NhanVienReponse;
import com.poly.salestshirt.service.NhanVienService;
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
@RequestMapping("/admin/nhan-vien")
public class NhanVienController {

    private final NhanVienService nhanVienService;

    @GetMapping("")
    public String getAllCustomersByStatusAndSearch(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
                                                   @RequestParam(value = "pageSize", defaultValue = "5") int pageSize,
                                                   @RequestParam(value = "keyword", required = false) String search,
                                                   @RequestParam(value = "trangThai", required = false) Integer trangThai,
                                                   Model model) {
        model.addAttribute("pageNhanVien", nhanVienService.getAllByStatusAndSearch(pageNo, pageSize, search, trangThai));
        model.addAttribute("trangThai", trangThai);
        model.addAttribute("keyword", search);
        log.info("Request get all of Custormers");
        return "admin/nhan_vien/index";
    }

    @GetMapping("/create")
    public String viewCreate(@ModelAttribute("nv") NhanVienRequest request) {
        return "admin/nhan_vien/create";
    }

    @PostMapping("/create")
    public String create(@Valid @ModelAttribute("nv") NhanVienRequest request, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/nhan_vien/create";
        }
        nhanVienService.create(request);
        return "redirect:/admin/nhan-vien";
    }

    @GetMapping("/update/{idNV}")
    public String viewUpdate(Model model, @PathVariable int idNV, RedirectAttributes redirectAttributes) {
        NhanVienReponse nhanVienReponse = nhanVienService.getNhanVienReponseById(idNV);
        if (nhanVienReponse == null) {
            redirectAttributes.addFlashAttribute("messageError", "Không tìm thấy nhân viên.");
            return "redirect:/admin/nhan-vien";
        }
        model.addAttribute("nv", nhanVienReponse);
        return "admin/nhan_vien/edit";
    }

    @PostMapping("/update/{idNV}")
    public String update(@Valid @ModelAttribute("nv") NhanVienRequest request,
                         BindingResult result, @PathVariable int idNV) {
        if (result.hasErrors()) {
            return "admin/nhan_vien/edit";
        }
        nhanVienService.update(idNV, request);
        return "redirect:/admin/nhan-vien";
    }

    @GetMapping("/changeStatus/{idKH}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> changeStatus(@PathVariable int idKH, @RequestParam int trangThai,
                                                            RedirectAttributes redirectAttributes) {
        boolean check = nhanVienService.changeStatus(idKH, trangThai);
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
        model.addAttribute("title", "Nhân viên");
        model.addAttribute("titleCreate", "Thêm Nhân viên");
        model.addAttribute("titleEdit", "Sửa Nhân viên");
    }

    @ModelAttribute("pageSizeList")
    public Integer[] valuePageSize() {
        return new Integer[]{5, 10, 15, 20, 25};
    }
}
