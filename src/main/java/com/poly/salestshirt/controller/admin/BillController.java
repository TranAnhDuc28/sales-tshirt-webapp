package com.poly.salestshirt.controller.admin;

import com.poly.salestshirt.dto.request.BillRequest;
import com.poly.salestshirt.dto.response.BillResponse;
import com.poly.salestshirt.service.CustomerService;
import com.poly.salestshirt.service.StaffService;
import com.poly.salestshirt.service.impl.BillServiceImpl;
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
@RequestMapping("/admin/bill")
public class BillController {

    private final BillServiceImpl hoaDonService;
    private final StaffService staffService;
    private final CustomerService customerService;

    @GetMapping
    public String getListHoaDon(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
                                @RequestParam(value = "pageSize", defaultValue = "5") int pageSize,
                                @RequestParam(value = "keyword", required = false) String search,
                                @RequestParam(value = "status", required = false) Integer status,
                                @RequestParam(value = "createAt", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date createAt,
                                Model model) {
        model.addAttribute("pageBill",
                hoaDonService.getAllByStatusAndSearchAndCreate(pageNo, pageSize, search, status, createAt));
        model.addAttribute("keyword", search);
        model.addAttribute("status", status);
        model.addAttribute("createAt", createAt);
        return "admin/bill/index";
    }

    @GetMapping("/update/{billId}")
    public String viewUpdate(Model model, @PathVariable int billId, RedirectAttributes redirectAttributes) {
        BillResponse billResponse = hoaDonService.getBillResponse(billId);
        if (billResponse == null) {
            redirectAttributes.addAttribute("errorMessage", "Không tìm thấy hóa đơn");
            return "redirect:/admin/bill";
        }
        BillRequest request = new BillRequest();
        request.setStaffId(billResponse.getStaffId());
        request.setCustomerId(billResponse.getCustomerId());
        request.setStatus(billResponse.getStatus());

        model.addAttribute("staffList", staffService.getAllByStatus(1));
        model.addAttribute("customerList", customerService.getAllByStatus(1));
        model.addAttribute("billRequest", request);
        return "admin/bill/edit";
    }

    @PostMapping("/update/{billId}")
    public String updateBill(@PathVariable int billId, @Valid @ModelAttribute("hd") BillRequest request,
                             BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "admin/bill/edit";
        }
        String errorMessage = hoaDonService.update(billId, request);
        if (errorMessage != null) {
            redirectAttributes.addFlashAttribute("errorMessage", errorMessage);
            return "redirect:/admin/bill/update/" + billId;
        }
        return "redirect:/admin/bill";
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
