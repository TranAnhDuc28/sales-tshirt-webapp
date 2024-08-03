package com.poly.salestshirt.controller.admin;

import com.poly.salestshirt.dto.request.ProductDetailRequest;
import com.poly.salestshirt.dto.response.ProductDetailResponse;
import com.poly.salestshirt.dto.response.ProductResponse;
import com.poly.salestshirt.service.*;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/product/{productId}/product-detail")
public class ProductDetailController {

    private final ProductDetailService productDetailService;
    private final ColorService colorService;
    private final SizeService sizeService;
    private final ProductService productService;
    private ProductResponse product;
    private ProductDetailResponse productDetail;


    @GetMapping
    public String getAllByproductId(@RequestParam(defaultValue = "1") int pageNo,
                                    @RequestParam(defaultValue = "100") int pageSize,
                                    @PathVariable int productId, Model model) {
        model.addAttribute("pageProductDetail",
                productDetailService.getAllByProductId(pageNo, pageSize, productId));
        return "admin/product_detail/index";
    }

    @GetMapping("/create")
    public String viewCreate(@ModelAttribute("pdRequest") ProductDetailRequest request, @PathVariable int productId,
                                 Model model) {
        try {
            product = productService.getProductResponse(productId);
            if (product == null) {
                model.addAttribute("errorMessage", "Không tìm thấy sản phẩm");
                return "admin/product_detail/index";
            }
            model.addAttribute("productName", product.getName());
            loadDataViewCreateAndUpdate(model);
        } catch (Exception e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "admin/product_detail/index";
        }
        return "admin/product_detail/create";
    }

    @PostMapping("/create")
    public String createSPCT(@Valid @ModelAttribute("pdRequest") ProductDetailRequest request, BindingResult result,
                             @PathVariable int productId, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("productName", product.getName());
            loadDataViewCreateAndUpdate(model);
            return "admin/product_detail/create";
        }
        try {
            productDetailService.create(request);
        } catch (Exception e) {
            model.addAttribute("errorMessage", e.getMessage());
            model.addAttribute("productName", product.getName());
            loadDataViewCreateAndUpdate(model);
            return "admin/product_detail/create";
        }
        return "redirect:/admin/product/" + productId + "/product-detail";
    }

    @GetMapping("/update/{productDetailId}")
    public String viewEditSPCT(@PathVariable int productId, @PathVariable int productDetailId, Model model) {
        try {
            productDetail = productDetailService.getProductDetailResponse(productDetailId);
            if (productDetail == null) {
                model.addAttribute("errorMessage", "Không tìm thấy sản phẩm chi tiết");
                return "admin/product_detail/index";
            }
            model.addAttribute("productDetailName", productDetail.getProductName());
            model.addAttribute("productDetail", productDetail);
            loadDataViewCreateAndUpdate(model);
        } catch (Exception e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "admin/product_detail/index";
        }
        return "admin/product_detail/edit";
    }

    @PostMapping("/update/{productDetailId}")
    public String editSPCT(@Valid @ModelAttribute("pdRequest") ProductDetailRequest request,
                           BindingResult result, @PathVariable int productId,
                           @PathVariable int productDetailId, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("productDetailName", productDetail.getProductName());
            loadDataViewCreateAndUpdate(model);
            return "admin/product_detail/edit";
        }
        try {
            productDetailService.update(productDetailId, request);
        } catch (Exception e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "admin/product_detail/index";
        }
        return "redirect:/admin/product/" + productId + "/product-detail";
    }

    @PostMapping("/changeStatus/{productDetailId}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> changeStatus(@RequestParam int status, @PathVariable int productDetailId,
                                                            Model model, @PathVariable String productId) {
        String errorMessage = productDetailService.changeStatus(productDetailId, status);
        Map<String, Object> response = new HashMap<>();
        response.put("message", errorMessage);
        response.put("newStatus", status);
        if (errorMessage != null) {
            model.addAttribute("errorMessage", "Thay đổi trạng thái thất bại");
        }
        return ResponseEntity.ok(response);
    }

    @ModelAttribute("title")
    public void title(Model model) {
        model.addAttribute("title", "Quản lý sản phẩm");
        model.addAttribute("titleCreate", "Thêm Sản phẩm chi tiết");
        model.addAttribute("titleEdit", "Sửa Sản phẩm chi tiết");
    }

    @ModelAttribute("pageSizeList")
    public Integer[] valuePageSize() {
        return new Integer[]{5, 10, 15, 20, 25};
    }

    private void loadDataViewCreateAndUpdate(Model model) {
        model.addAttribute("sizeListActive", sizeService.getAllByStatus(1));
        model.addAttribute("colorListActive", colorService.getAllByStatus(1));
    }
}
