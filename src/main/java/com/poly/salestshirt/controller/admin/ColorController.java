package com.poly.salestshirt.controller.admin;

import com.poly.salestshirt.dto.request.ColorRequest;
import com.poly.salestshirt.dto.response.ColorResponse;
import com.poly.salestshirt.service.ColorService;
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
@RequestMapping("/admin/color")
public class ColorController {

    private final ColorService colorService;

    @GetMapping
    public String getAllColorsByStatusAndSearch(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
                                                @RequestParam(value = "pageSize", defaultValue = "5") int pageSize,
                                                @RequestParam(value = "keyword", required = false) String search,
                                                @RequestParam(value = "status", required = false) Integer status,
                                                Model model) {
        model.addAttribute("pageColor", colorService.getAllByStatusAndSearch(pageNo, pageSize, search, status));
        model.addAttribute("status", status);
        model.addAttribute("keyword", search);
        log.info("Request get all of Colors");
        return "admin/color/index";
    }

    @GetMapping("/create")
    public String viewCreate(@ModelAttribute("colorRequest") ColorRequest request) {
        return "admin/color/create";
    }

    @PostMapping("/create")
    public String create(@Valid @ModelAttribute("colorRequest") ColorRequest request, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/color/create";
        }
        colorService.create(request);
        return "redirect:/admin/color";
    }

    @GetMapping("/update/{colorId}")
    public String viewUpdate(Model model, @PathVariable int colorId, RedirectAttributes redirectAttributes) {
        ColorResponse colorResponse = colorService.getColorResponse(colorId);
        if (colorResponse == null) {
            redirectAttributes.addFlashAttribute("messageError", "Không tìm thấy màu sắc.");
            return "redirect:/admin/color";
        }
        model.addAttribute("color", colorResponse);
        return "admin/color/edit";
    }

    @PostMapping("/update/{colorId}")
    public String update(@Valid @ModelAttribute("color") ColorRequest request, BindingResult result,
                         @PathVariable int colorId) {
        if (result.hasErrors()) {
            return "admin/color/edit";
        }
        colorService.update(colorId, request);
        return "redirect:/admin/color";
    }

    @GetMapping("/changeStatus/{colorId}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> changeStatus(@PathVariable int colorId, @RequestParam int status,
                                                            RedirectAttributes redirectAttributes) {
        boolean check = colorService.changeStatus(colorId, status);
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
        model.addAttribute("titleCreate", "Thêm Màu sắc");
        model.addAttribute("titleEdit", "Sửa Màu sắc");
    }

    @ModelAttribute("pageSizeList")
    public Integer[] valuePageSize() {
        return new Integer[]{5, 10, 15, 20, 25};
    }

}
