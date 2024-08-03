package com.poly.salestshirt.service.impl;

import com.poly.salestshirt.entity.CustomUserDetails;
import com.poly.salestshirt.dto.request.BillDetailRequest;
import com.poly.salestshirt.dto.request.ProductDetailRequest;
import com.poly.salestshirt.dto.response.BillDetailResponse;
import com.poly.salestshirt.dto.response.StaffResponse;
import com.poly.salestshirt.dto.response.ProductDetailResponse;
import com.poly.salestshirt.service.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@Slf4j
@RequiredArgsConstructor
public class SalesServiceImpl implements SalesService {

    private final BillDetailService billDetailService;
    private final ProductDetailService productDetailService;
    private final BillService billService;
    private final StaffService staffService;

    public String addProductToCart(Integer orderId, Integer pdId, int quantity) {
        log.info("Add product to cart with order_id={}, product_detail_id={}, quantity={}", orderId, pdId, quantity);
        if (quantity <= 0) return "Số lượng phải lớn hơn 0";
        if (orderId == null || pdId == null) return "Không nhận được id hóa đơn hoặc id sản phẩm.";

        // tìm kiếm product để thêm vào giỏ hàng
        ProductDetailResponse productDetailResponse = productDetailService.getProductDetailResponse(pdId);
        if (productDetailResponse == null) return "Không tìm thấy sản phẩm chi tiết.";
        if (productDetailResponse.getQuantity() == 0) return "Sản phẩm hết hàng.";

        // lấy list product đang có trong giỏ hàng
        List<BillDetailResponse> gioHang = billDetailService.getAllByOrderId(orderId);

        Optional<BillDetailResponse> existingHDCT = Optional.empty();
        if (!gioHang.isEmpty()) {
            existingHDCT = gioHang.stream()
                    .filter(hdct -> hdct.getProductDetailId().equals(pdId) && hdct.getStatus() == 1)
                    .findFirst();
        }

        // kiểm tra product đã có trong giỏ hàng chưa
        // nếu có thì thay đổi số lượng
        BillDetailRequest billDetailRequest = new BillDetailRequest();
        if (existingHDCT.isPresent()) {
            billDetailRequest.setBillId(existingHDCT.get().getBillId());
            billDetailRequest.setProductDetailId(existingHDCT.get().getProductDetailId());
            billDetailRequest.setQuantity(existingHDCT.get().getQuantity() + quantity);
            billDetailRequest.setPrice(existingHDCT.get().getPrice());
            billDetailRequest.setStatus(existingHDCT.get().getStatus());
            billDetailService.update(existingHDCT.get().getId(), billDetailRequest);
        } else { // nếu không tồn tại thêm mới product to cart
            billDetailRequest.setBillId(orderId);
            billDetailRequest.setProductDetailId(pdId);
            if (quantity > productDetailResponse.getQuantity()) {
                billDetailRequest.setQuantity(productDetailResponse.getQuantity());
            } else {
                billDetailRequest.setQuantity(quantity);
            }
            billDetailRequest.setPrice(productDetailResponse.getPrice());
            billDetailRequest.setStatus(1);
            billDetailService.create(billDetailRequest);
        }

        // update giảm số lượng sản phẩm đã mua thêm
        int quantityInStock;
        if (quantity > productDetailResponse.getQuantity()) {
            quantityInStock = 0;
        } else {
            quantityInStock = productDetailResponse.getQuantity() - quantity;
        }
        ProductDetailRequest productDetailRequest = ProductDetailRequest.builder()
                .code(productDetailResponse.getCode())
                .productId(productDetailResponse.getProductId())
                .sizeId(productDetailResponse.getSizeId())
                .colorId(productDetailResponse.getColorId())
                .quantity(quantityInStock)
                .price(productDetailResponse.getPrice())
                .status(productDetailResponse.getStatus())
                .build();
        productDetailService.update(productDetailResponse.getId(), productDetailRequest);
        return null;
    }

    @Override
    public String plusAndMinusProductInCart(String action, Integer billId, Integer productDetailId) {
        log.info("Plus and minus to cart with order_id={}, product_detail_id={}, quantity={}", billId, productDetailId, 1);
        if (billId == null || productDetailId == null) return "Không nhận được id hóa đơn hoặc id sản phẩm.";

        // tìm kiếm product để thêm vào giỏ hàng
        ProductDetailResponse productDetailResponse = productDetailService.getProductDetailResponse(productDetailId);
        if (productDetailResponse == null) return "Không tìm thấy sản phẩm chi tiết.";
        if (action.equals("+") && productDetailResponse.getQuantity() == 0) return "Sản phẩm hết hàng.";

        // lấy list product đang có trong giỏ hàng
        List<BillDetailResponse> cart = billDetailService.getAllByOrderId(billId);

        Optional<BillDetailResponse> existingBillDetail = Optional.empty();
        if (!cart.isEmpty()) {
            existingBillDetail = cart.stream()
                    .filter(billDetailResponse -> billDetailResponse.getProductDetailId().equals(productDetailId) &&
                            billDetailResponse.getStatus() == 1)
                    .findFirst();
        }

        // + và - 1 spct trong giỏ hàng
        BillDetailRequest billDetailRequest = new BillDetailRequest();
        if (action.equals("+")) {
            billDetailRequest.setQuantity(existingBillDetail.get().getQuantity() + 1);
        } else if (action.equals("-")) {
            if (existingBillDetail.get().getQuantity() == 1) {
                removeProductFromCart(billId, productDetailId);
            } else {
                billDetailRequest.setQuantity(existingBillDetail.get().getQuantity() - 1);
            }
        }
        billDetailRequest.setBillId(existingBillDetail.get().getBillId());
        billDetailRequest.setProductDetailId(existingBillDetail.get().getProductDetailId());
        billDetailRequest.setPrice(existingBillDetail.get().getPrice());
        billDetailRequest.setStatus(existingBillDetail.get().getStatus());
        billDetailService.update(existingBillDetail.get().getId(), billDetailRequest);

        // update giảm số lượng sản phẩm trong kho
        int quantityInStock = productDetailResponse.getQuantity();
        if (action.equals("+")) {
            quantityInStock = productDetailResponse.getQuantity() - 1;
        } else if (action.equals("-")) {
            quantityInStock = productDetailResponse.getQuantity() + 1;
        }
        ProductDetailRequest productDetailRequest = ProductDetailRequest.builder()
                .code(productDetailResponse.getCode())
                .productId(productDetailResponse.getProductId())
                .sizeId(productDetailResponse.getSizeId())
                .colorId(productDetailResponse.getColorId())
                .quantity(quantityInStock)
                .price(productDetailResponse.getPrice())
                .status(productDetailResponse.getStatus())
                .build();
        productDetailService.update(productDetailResponse.getId(), productDetailRequest);
        return null;
    }

    @Override
    public double getTotalBill(Integer billId) {
        double totalBill = 0;
        if (billId == null) return totalBill;
        List<BillDetailResponse> billDetailResponseList = billDetailService.getAllByOrderId(billId);

        for (BillDetailResponse response : billDetailResponseList) {
            totalBill += response.getTotalPrice();
        }
        return totalBill;
    }

    @Override
    public void removeProductFromCart(Integer billId, Integer detailProductId) {
        if (billId == null || detailProductId == null) return;

        List<BillDetailResponse> cart = billDetailService.getAllByOrderId(billId);

        BillDetailResponse productRemove = cart.stream()
                .filter(billDetailResponse -> billDetailResponse.getBillId().equals(billId) &&
                        billDetailResponse.getProductDetailId().equals(detailProductId))
                .findFirst()
                .orElse(null);

        if (productRemove != null) {
            billDetailService.delete(productRemove.getId());

            // hồi lại số lượng sản phẩm trong kho
            ProductDetailResponse productDetailResponse = productDetailService.getProductDetailResponse(productRemove.getProductDetailId());
            if (productDetailResponse == null) return;
            ProductDetailRequest request = ProductDetailRequest.builder()
                    .code(productDetailResponse.getCode())
                    .productId(productDetailResponse.getProductId())
                    .sizeId(productDetailResponse.getSizeId())
                    .colorId(productDetailResponse.getColorId())
                    .quantity(productDetailResponse.getQuantity() + productRemove.getQuantity())
                    .price(productDetailResponse.getPrice())
                    .status(productDetailResponse.getStatus())
                    .build();
            productDetailService.update(productDetailResponse.getId(), request);
        }
    }

    @Override
    public String pay(Integer orderId) {
        return billService.changeStatus(orderId, 1);
    }

    @Override
    public StaffResponse getSalesStaff() {
        StaffResponse nv = null;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()) {
            Object principal = authentication.getPrincipal();
            if (principal instanceof CustomUserDetails) {
                CustomUserDetails userDetails = (CustomUserDetails) principal;
                if (userDetails == null) {
                    return null;
                }
                nv = staffService.getStaffResponseByAccountId(userDetails.getAccount().getId());
            } else {
                return null;
            }
        } else {
            return null;
        }
        return nv;
    }
}
