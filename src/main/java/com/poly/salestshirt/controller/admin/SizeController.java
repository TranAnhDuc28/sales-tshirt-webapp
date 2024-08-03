package com.poly.salestshirt.controller.admin;

import com.poly.salestshirt.dto.request.SizeRequest;
import com.poly.salestshirt.dto.response.SizeResponse;
import com.poly.salestshirt.service.SizeService;
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
@RequestMapping("/admin/size")
public class SizeController {

    private final SizeService sizeService;

    @GetMapping
    public String getAllByStatusAndSearch(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
                                   @RequestParam(value = "pageSize", defaultValue = "5") int pageSize,
                                   @RequestParam(value = "keyword", required = false) String search,
                                   @RequestParam(value = "status", required = false) Integer status,
                                   Model model) {
        model.addAttribute("pageSizes", sizeService.getAllByStatusAndSearch(pageNo, pageSize, search, status));
        model.addAttribute("status", status);
        model.addAttribute("keyword", search);
        log.info("Request get all of Colors");
        return "admin/size/index";
    }

    @GetMapping("/create")
    public String viewCreate(@ModelAttribute("sizeRequest") SizeRequest request) {
        return "admin/size/create";
    }

    @PostMapping("/create")
    public String create(@Valid @ModelAttribute("sizeRequest") SizeRequest request, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/size/create";
        }
        sizeService.create(request);
        return "redirect:/admin/size";
    }

    @GetMapping("/update/{sizeId}")
    public String viewUpdate(Model model, @PathVariable int sizeId, RedirectAttributes redirectAttributes) {
        SizeResponse sizeResponse = sizeService.getSizeResponse(sizeId);
        if (sizeResponse == null) {
            redirectAttributes.addFlashAttribute("messageError", "Không tìm thấy kích thước.");
            return "redirect:/admin/size";
        }
        model.addAttribute("size", sizeResponse);
        return "admin/size/edit";
    }

    @PostMapping("/update/{sizeId}")
    public String update(@Valid @ModelAttribute("size") SizeRequest request, BindingResult result,
                         @PathVariable int sizeId) {
        if (result.hasErrors()) {
            return "admin/size/edit";
        }
        sizeService.update(sizeId, request);
        return "redirect:/admin/size";
    }

    @GetMapping("/changeStatus/{sizeId}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> changeStatus(@PathVariable int sizeId, @RequestParam int status,
                                                            RedirectAttributes redirectAttributes) {
        boolean check = sizeService.changeStatus(sizeId, status);
        Map<String, Object> response = new HashMap<>();
        response.put("success", check);
        response.put("newStatus", status);
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
