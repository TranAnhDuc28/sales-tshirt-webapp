package com.poly.salestshirt.controller.admin;

import com.poly.salestshirt.dto.request.ProductRequest;
import com.poly.salestshirt.dto.response.ProductResponse;
import com.poly.salestshirt.service.impl.ProductServiceImpl;
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
@RequestMapping("admin/product")
public class ProductController {

    private final ProductServiceImpl productService;


    @GetMapping
    public String getListMauSac(@RequestParam(value = "pageNo", defaultValue = "0") int pageNo,
                                @RequestParam(value = "pageSize", defaultValue = "5") int pageSize,
                                @RequestParam(value = "keyword", required = false) String search,
                                @RequestParam(value = "status", required = false) Integer status,
                                Model model) {
        model.addAttribute("pageProduct", productService.getAllByStatusAndSearch(pageNo, pageSize, search, status));
        model.addAttribute("status", status);
        model.addAttribute("keyword", search);
        log.info("Request get all of Products");
        return "admin/product/index";
    }

    @GetMapping("/create")
    public String viewCreate(@ModelAttribute("productRequest") ProductRequest request) {
        return "admin/product/create";
    }

    @PostMapping("/create")
    public String create(@Valid @ModelAttribute("productRequest") ProductRequest request, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/product/create";
        }
        productService.create(request);
        return "redirect:/admin/product";
    }

    @GetMapping("/update/{productId}")
    public String viewUpdate(Model model, @PathVariable int productId, RedirectAttributes redirectAttributes) {
        ProductResponse product = productService.getProductResponse(productId);
        if (product == null) {
            redirectAttributes.addFlashAttribute("messageError", "Không tìm thấy sản phẩm.");
            return "redirect:/admin/product";
        }
        model.addAttribute("product", product);
        return "admin/product/edit";
    }

    @PostMapping("/update/{productId}")
    public String update(@Valid @ModelAttribute("sp") ProductRequest request, BindingResult result, 
                         @PathVariable int productId) {
        if (result.hasErrors()) {
            return "admin/product/edit";
        }
        productService.update(productId, request);
        return "redirect:/admin/product";
    }

    @GetMapping("/changeStatus/{productId}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> changeStatus(@PathVariable int productId, @RequestParam int status,
                                                            RedirectAttributes redirectAttributes) {
        boolean check = productService.changeStatus(productId, status);
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
        model.addAttribute("titleCreate", "Thêm Sản phẩm");
        model.addAttribute("titleEdit", "Sửa Sản phẩm");
    }

    @ModelAttribute("pageSizeList")
    public Integer[] valuePageSize() {
        return new Integer[]{5, 10, 15, 20, 25};
    }
}
