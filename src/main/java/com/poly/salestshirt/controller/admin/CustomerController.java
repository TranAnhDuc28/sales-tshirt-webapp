package com.poly.salestshirt.controller.admin;

import com.poly.salestshirt.dto.request.CustomerRequest;
import com.poly.salestshirt.dto.response.CustomerResponse;
import com.poly.salestshirt.service.CustomerService;
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
@RequestMapping("/admin/customer")
public class CustomerController {

    private final CustomerService customerService;

    @GetMapping
    public String getAllCustomersByStatusAndSearch(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
                                                   @RequestParam(value = "pageSize", defaultValue = "5") int pageSize,
                                                   @RequestParam(value = "keyword", required = false) String search,
                                                   @RequestParam(value = "status", required = false) Integer status,
                                                   Model model) {
        model.addAttribute("pageCustomer", customerService.getAllByStatusAndSearch(pageNo, pageSize, search, status));
        model.addAttribute("status", status);
        model.addAttribute("keyword", search);
        log.info("Request get all of Customers");
        return "admin/customer/index";
    }

    @GetMapping("/create")
    public String viewCreate(@ModelAttribute("customerRequest") CustomerRequest request) {
        return "admin/customer/create";
    }

    @PostMapping("/create")
    public String create(@Valid @ModelAttribute("customerRequest") CustomerRequest request, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/customer/create";
        }
        customerService.create(request);
        return "redirect:/admin/customer";
    }

    @GetMapping("/update/{customerId}")
    public String viewUpdate(Model model, @PathVariable int customerId, RedirectAttributes redirectAttributes) {
        CustomerResponse customerResponse = customerService.getCustomerResponse(customerId);
        if (customerResponse == null) {
            redirectAttributes.addFlashAttribute("messageError", "Không tìm thấy khách hàng.");
            return "redirect:/admin/customer";
        }
        model.addAttribute("customer", customerResponse);
        return "admin/customer/edit";
    }

    @PostMapping("/update/{customerId}")
    public String update(@Valid @ModelAttribute("customer") CustomerRequest request,
                         BindingResult result, @PathVariable int customerId) {
        if (result.hasErrors()) {
            return "admin/customer/edit";
        }
        customerService.update(customerId, request);
        return "redirect:/admin/customer";
    }

    @GetMapping("/changeStatus/{customerId}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> changeStatus(@PathVariable int customerId, @RequestParam int status,
                                                            RedirectAttributes redirectAttributes) {
        boolean check = customerService.changeStatus(customerId, status);
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
        model.addAttribute("title", "Khách hàng");
        model.addAttribute("titleCreate", "Thêm Khách hàng");
        model.addAttribute("titleEdit", "Sửa Khách hàng");
    }

    @ModelAttribute("pageSizeList")
    public Integer[] valuePageSize() {
        return new Integer[]{5, 10, 15, 20, 25};
    }

}
