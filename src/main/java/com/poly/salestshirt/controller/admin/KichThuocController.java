package com.poly.salestshirt.controller.admin;

import com.poly.salestshirt.model.request.KichThuocRequest;
import com.poly.salestshirt.model.response.KichThuocReponse;
import com.poly.salestshirt.service.impl.KichThuocServiceImpl;
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
@RequestMapping("/admin/kich-thuoc")
public class KichThuocController {

    private final KichThuocServiceImpl kichThuocService;

    @GetMapping(value = "")
    public String getAllByStatusAndSearch(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
                                   @RequestParam(value = "pageSize", defaultValue = "5") int pageSize,
                                   @RequestParam(value = "keyword", required = false) String search,
                                   @RequestParam(value = "trangThai", required = false) Integer trangThai,
                                   Model model) {
        model.addAttribute("pageKichThuoc", kichThuocService.getAllByStatusAndSearch(pageNo, pageSize, search, trangThai));
        model.addAttribute("trangThai", trangThai);
        model.addAttribute("keyword", search);
        log.info("Request get all of Colors");
        return "admin/kich_thuoc/index";
    }

    @GetMapping("/create")
    public String viewCreate(@ModelAttribute("kt") KichThuocRequest request) {
        return "admin/kich_thuoc/create";
    }

    @PostMapping("/create")
    public String create(@Valid @ModelAttribute("kt") KichThuocRequest request, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/kich_thuoc/create";
        }
        kichThuocService.create(request);
        return "redirect:/admin/kich-thuoc";
    }

    @GetMapping("/update/{idKichThuoc}")
    public String viewUpdate(Model model, @PathVariable int idKichThuoc, RedirectAttributes redirectAttributes) {
        KichThuocReponse kichThuocReponse = kichThuocService.getKichThuocReponse(idKichThuoc);
        if (kichThuocReponse == null) {
            redirectAttributes.addFlashAttribute("messageError", "Không tìm thấy kích thước.");
            return "redirect:/admin/kich-thuoc";
        }
        model.addAttribute("kt", kichThuocReponse);
        return "admin/kich_thuoc/edit";
    }

    @PostMapping("/update/{idKichThuoc}")
    public String update(@Valid @ModelAttribute("kt") KichThuocRequest request, BindingResult result,
                         @PathVariable int idKichThuoc) {
        if (result.hasErrors()) {
            return "admin/kich_thuoc/edit";
        }
        kichThuocService.update(idKichThuoc, request);
        return "redirect:/admin/kich-thuoc";
    }

    @GetMapping("/changeStatus/{idMauSac}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> changeStatus(@PathVariable int idMauSac, @RequestParam int trangThai,
                                                            RedirectAttributes redirectAttributes) {
        boolean check = kichThuocService.changeStatus(idMauSac, trangThai);
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
        model.addAttribute("titleCreate", "Thêm Kích thước");
        model.addAttribute("titleEdit", "Sửa Kích thước");
    }

    @ModelAttribute("pageSizeList")
    public Integer[] valuePageSize() {
        return new Integer[]{5, 10, 15, 20, 25};
    }
}
