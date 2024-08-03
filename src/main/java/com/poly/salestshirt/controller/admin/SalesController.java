package com.poly.salestshirt.controller.admin;

import com.poly.salestshirt.dto.request.BillRequest;
import com.poly.salestshirt.dto.response.BillResponse;
import com.poly.salestshirt.dto.response.StaffResponse;
import com.poly.salestshirt.dto.response.ProductDetailResponse;
import com.poly.salestshirt.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class SalesController {

    private final BillService billService;
    private final BillDetailService billDetailService;
    private final ProductDetailService productDetailService;
    private final SalesService salesService;
    private final CustomerService customerService;
    private final ProductService productService;
    private int countHoaDonCho;
    private StaffResponse staff;

    @GetMapping("/sales")
    public String viewBanHangTaiQuay(@ModelAttribute("billRequest") BillRequest request, Model model) {
        List<BillResponse> billPending = billService.getAllByStatus(0);
        staff = salesService.getSalesStaff();
        countHoaDonCho = billPending.size();
        getBillPending(model, billPending);
        return "admin/sales/create-bill";
    }

    @PostMapping("/sales")
    public String createBillPending(@RequestParam(required = false) Integer customerId, Model model) {
        List<BillResponse> billPending = billService.getAllByStatus(0);
        countHoaDonCho = billPending.size();
        if (countHoaDonCho >= 5) {
            model.addAttribute("error", "Hóa đơn chờ chỉ được tạo tối đa 5 hóa đơn.");
            getBillPending(model, billPending);
            return "admin/sales/create-bill";
        }

        BillRequest request = new BillRequest();
        request.setStaffId(staff.getId());
        request.setCustomerId(customerId);

        String error = billService.create(request);
        if (error != null) {
            model.addAttribute("error", error);
            getBillPending(model, billPending);
            return "admin/sales/create-bill";
        }
        return "redirect:/admin/sales";
    }


    @GetMapping("/sales-counter/bill/{billId}")
    public String viewSalesCounter(@PathVariable int billId, Model model) {
        dataSalesCounterByBill(model, billId);
        return "admin/sales/sales-counter";
    }

    @PostMapping("/sales-counter/bill/{billId}/add-product-to-cart/{pdId}")
    public String addProductToCart(@RequestParam(defaultValue = "0") int quantity, @PathVariable int billId,
                                        @PathVariable int pdId, RedirectAttributes redirectAttributes) {
        String error = salesService.addProductToCart(billId, pdId, quantity);
        if (error != null) {
            redirectAttributes.addFlashAttribute("error", error);
        };
        return "redirect:/admin/sales-counter/bill/" + billId;
    }

    @GetMapping("/sales-counter/bill/{billId}/plus-one-product-in-cart/{pdId}")
    public String plusOneProductToCart(@PathVariable int billId, @PathVariable int pdId, RedirectAttributes redirectAttributes) {
        String error = salesService.plusAndMinusProductInCart("+", billId, pdId);
        if (error != null) {
            redirectAttributes.addFlashAttribute("error", error);
        };
        return "redirect:/admin/sales-counter/bill/" + billId;
    }

    @GetMapping("/sales-counter/bill/{billId}/minus-one-product-in-cart/{pdId}")
    public String minusOneProductToCart(@PathVariable int billId, @PathVariable int pdId, RedirectAttributes redirectAttributes) {
        String error = salesService.plusAndMinusProductInCart("-", billId, pdId);
        if (error != null) {
            redirectAttributes.addFlashAttribute("error", error);
        };
        return "redirect:/admin/sales-counter/bill/" + billId;
    }

    @GetMapping("/sales-counter/bill/{billId}/remove-product-from-cart/{pdId}")
    public String removeProductFromCart(@PathVariable int billId, @PathVariable int pdId) {
        salesService.removeProductFromCart(billId, pdId);
        return "redirect:/admin/sales-counter/bill/" + billId;
    }

    @PostMapping("/sales-counter/pay")
    public String payTheBill(@RequestParam("billId") int billId, Model model) {
        String checkPay = salesService.pay(billId);
        if (checkPay != null) {
            dataSalesCounterByBill(model, billId);
            return "admin/sales/sales-counter";
        }
        return "redirect:/admin/sales";
    }

    @ResponseBody
    @GetMapping("/sales-counter/product/{productId}/product-detail")
    public List<ProductDetailResponse> getProductDetailListByproductId(@PathVariable int productId) {
        return productDetailService.getAllByProductIdAndStatus(productId, 1);
    }

    @ModelAttribute("title")
    public void title(Model model) {
        model.addAttribute("title", "Bán hàng tại quầy");
    }

    private void dataSalesCounterByBill(Model model, int billId) {
        BillResponse billResponse = billService.getBillResponse(billId);
        if (billResponse == null) {
            model.addAttribute("error", "Không tìm thấy hóa đơn vui lòng thử lại.");
            return;
        }
        model.addAttribute("bill", billResponse);
        model.addAttribute("productList", productService.getAllByStatus(1));
        model.addAttribute("billDetailList", billDetailService.getAllByOrderId(billId));
        model.addAttribute("totalBill", salesService.getTotalBill(billId));
    }

    private void getBillPending(Model model, List<BillResponse> billPending){
        model.addAttribute("billPending", billPending);
        model.addAttribute("customerListActive", customerService.getAllByStatus(1));
        model.addAttribute("staff", staff);
    }

}
