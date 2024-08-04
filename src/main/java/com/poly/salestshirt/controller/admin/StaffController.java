package com.poly.salestshirt.controller.admin;

import com.poly.salestshirt.dto.request.StaffRequest;
import com.poly.salestshirt.dto.response.StaffResponse;
import com.poly.salestshirt.service.StaffService;
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
@RequestMapping("/admin/staff")
public class StaffController {

    private final StaffService staffService;

    @GetMapping
    public String getAllCustomersByStatusAndSearch(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
                                                   @RequestParam(value = "pageSize", defaultValue = "5") int pageSize,
                                                   @RequestParam(value = "keyword", required = false) String search,
                                                   @RequestParam(value = "status", required = false) Integer status,
                                                   Model model) {
        model.addAttribute("pageStaff", staffService.getAllByStatusAndSearch(pageNo, pageSize, search, status));
        model.addAttribute("status", status);
        model.addAttribute("keyword", search);
        log.info("Request get all of Customers");
        return "admin/staff/index";
    }

    @GetMapping("/create")
    public String viewCreate(@ModelAttribute("staffRequest") StaffRequest request) {
        return "admin/staff/create";
    }

    @PostMapping("/create")
    public String create(@Valid @ModelAttribute("staffRequest") StaffRequest request, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/staff/create";
        }
        staffService.create(request);
        return "redirect:/admin/staff";
    }

    @GetMapping("/update/{staffId}")
    public String viewUpdate(Model model, @PathVariable int staffId, RedirectAttributes redirectAttributes) {
        StaffResponse staffResponse = staffService.getStaffResponseById(staffId);
        if (staffResponse == null) {
            redirectAttributes.addFlashAttribute("messageError", "Không tìm thấy nhân viên.");
            return "redirect:/admin/staff";
        }
        model.addAttribute("staff", staffResponse);
        return "admin/staff/edit";
    }

    @PostMapping("/update/{staffId}")
    public String update(@Valid @ModelAttribute("staff") StaffRequest request, BindingResult result,
                         @PathVariable int staffId) {
        if (result.hasErrors()) {
            return "admin/staff/edit";
        }
        staffService.update(staffId, request);
        return "redirect:/admin/staff";
    }

    @GetMapping("/changeStatus/{staffId}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> changeStatus(@PathVariable int staffId, @RequestParam int status,
                                                            RedirectAttributes redirectAttributes) {
        boolean check = staffService.changeStatus(staffId, status);
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
        model.addAttribute("title", "Nhân viên");
        model.addAttribute("titleCreate", "Thêm Nhân viên");
        model.addAttribute("titleEdit", "Sửa Nhân viên");
    }

    @ModelAttribute("pageSizeList")
    public Integer[] valuePageSize() {
        return new Integer[]{5, 10, 15, 20, 25};
    }
}
