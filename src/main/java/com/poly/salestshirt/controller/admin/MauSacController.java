package com.poly.salestshirt.controller.admin;

import com.poly.salestshirt.model.request.MauSacRequest;
import com.poly.salestshirt.model.response.MauSacReponse;
import com.poly.salestshirt.service.MauSacService;
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
@RequestMapping("/admin/mau-sac")
public class MauSacController {

    private final MauSacService mauSacService;

    @GetMapping("")
    public String getAllColorsByStatusAndSearch(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
                                                @RequestParam(value = "pageSize", defaultValue = "5") int pageSize,
                                                @RequestParam(value = "keyword", required = false) String search,
                                                @RequestParam(value = "trangThai", required = false) Integer trangThai,
                                                Model model) {
        model.addAttribute("pageMauSac", mauSacService.getAllByStatusAndSearch(pageNo, pageSize, search, trangThai));
        model.addAttribute("trangThai", trangThai);
        model.addAttribute("keyword", search);
        log.info("Request get all of Colors");
        return "admin/mau_sac/index";
    }

    @GetMapping("/create")
    public String viewCreate(@ModelAttribute("ms") MauSacRequest msDTO) {
        return "admin/mau_sac/create";
    }

    @PostMapping("/create")
    public String create(@Valid @ModelAttribute("ms") MauSacRequest request, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/mau_sac/create";
        }
        mauSacService.create(request);
        return "redirect:/admin/mau-sac";
    }

    @GetMapping("/update/{idMauSac}")
    public String viewUpdate(Model model, @PathVariable int idMauSac, RedirectAttributes redirectAttributes) {
        MauSacReponse mauSacReponse = mauSacService.getMauSacResponse(idMauSac);
        if (mauSacReponse == null) {
            redirectAttributes.addFlashAttribute("messageError", "Không tìm thấy màu sắc.");
            return "redirect:/admin/mau-sac";
        }
        model.addAttribute("ms", mauSacReponse);
        return "admin/mau_sac/edit";
    }

    @PostMapping("/update/{idMauSac}")
    public String update(@Valid @ModelAttribute("ms") MauSacRequest request,
                         BindingResult result,
                         @PathVariable int idMauSac) {
        if (result.hasErrors()) {
            return "admin/mau_sac/edit";
        }
        mauSacService.update(idMauSac, request);
        return "redirect:/admin/mau-sac";
    }

    @GetMapping("/changeStatus/{idMauSac}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> changeStatus(@PathVariable int idMauSac, @RequestParam int trangThai,
                                                            RedirectAttributes redirectAttributes) {
        boolean check = mauSacService.changeStatus(idMauSac, trangThai);
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
        model.addAttribute("titleCreate", "Thêm Màu sắc");
        model.addAttribute("titleEdit", "Sửa Màu sắc");
    }

    @ModelAttribute("pageSizeList")
    public Integer[] valuePageSize() {
        return new Integer[]{5, 10, 15, 20, 25};
    }

}
