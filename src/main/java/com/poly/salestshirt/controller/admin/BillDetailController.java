package com.poly.salestshirt.controller.admin;

import com.poly.salestshirt.service.BillDetailService;
import com.poly.salestshirt.service.SalesService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/bill/{billId}/product-detail")
public class BillDetailController {

    private final BillDetailService billDetailService;
    private final SalesService salesService;

    @GetMapping
    public String getAllByBillId(@PathVariable int billId, Model model){
        model.addAttribute("billDetailList", billDetailService.getAllByOrderId(billId));
        model.addAttribute("totalBill", salesService.getTotalBill(billId));
        return "admin/bill_detail/index";
    }

    @ModelAttribute("title")
    public void title(Model model) {
        model.addAttribute("title", "Hóa đơn chi tiết");
    }
}
