package com.poly.salestshirt.service.impl;

import com.poly.salestshirt.entity.BillDetail;
import com.poly.salestshirt.entity.ProductDetail;
import com.poly.salestshirt.dto.request.BillDetailRequest;
import com.poly.salestshirt.dto.response.BillDetailResponse;
import com.poly.salestshirt.repository.BillDetailRepository;
import com.poly.salestshirt.repository.ProductDetailRepository;
import com.poly.salestshirt.service.BillDetailService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class BillDetailServiceImpl implements BillDetailService {

    private final BillDetailRepository billDetailRepository;
    private final ProductDetailRepository productDetailRepository;

    public List<BillDetailResponse> getAllByOrderId(int orderId) {
        List<BillDetail> billDetails = billDetailRepository.findAllByBillId(orderId);
        return billDetails.stream().map(hdct -> BillDetailResponse.builder()
                .id(hdct.getId())
                .billId(hdct.getBillId())
                .productDetailId(hdct.getProductDetail().getId())
                .detailProductName((hdct.getProductDetail().getProduct() != null ? hdct.getProductDetail().getProduct().getName() : "") +
                        (hdct.getProductDetail().getColor() != null ? (" - Color: " + hdct.getProductDetail().getColor().getName()) : "") +
                        (hdct.getProductDetail().getSize() != null ? (" - Size: " + hdct.getProductDetail().getSize().getName()) : ""))
                .quantity(hdct.getQuantity())
                .price(hdct.getPrice())
                .totalPrice(hdct.getQuantity() * hdct.getPrice())
                .status(hdct.getStatus())
                .build())
                .collect(Collectors.toList());
    }

    @Override
    public String create(BillDetailRequest request) {
        BillDetail billDetail = new BillDetail();

        Optional<ProductDetail> productDetailOptional = productDetailRepository.findById(request.getProductDetailId());
        if (!productDetailOptional.isPresent()) return "Không tìm thấy sản phẩm chi tiết.";

        billDetail.setBillId(request.getBillId());
        billDetail.setProductDetail(productDetailOptional.get());
        billDetail.setQuantity(request.getQuantity());
        billDetail.setPrice(request.getPrice());
        billDetail.setStatus(request.getStatus());
        billDetailRepository.save(billDetail);
        return null;
    }

    @Override
    public String update(int orderId, BillDetailRequest request) {
        BillDetail billDetail = getById(orderId);
        if (billDetail == null) return "Không tìm thấy hóa đơn chi tiết";

        Optional<ProductDetail> productDetailOptional = productDetailRepository.findById(request.getProductDetailId());
        if (!productDetailOptional.isPresent()) return "Không tìm thấy sản phẩm chi tiết.";

        billDetail.setId(orderId);
        billDetail.setBillId(request.getBillId());
        billDetail.setProductDetail(productDetailOptional.get());
        billDetail.setQuantity(request.getQuantity());
        billDetail.setPrice(request.getPrice());
        billDetail.setStatus(request.getStatus());
        billDetailRepository.save(billDetail);
        log.info("Order detail updated successfully");
        return "Sửa hóa đơn chi tiết thành công.";
    }

    @Override
    public String delete(int orderId) {
        log.info("Delete order detail with id={}", orderId);

        Optional<BillDetail> billDetailOptional = billDetailRepository.findById(orderId);
        if (!billDetailOptional.isPresent()) return "Không tìm thấy hóa đơn chi tiết.";

        billDetailRepository.deleteById(orderId);
        return "Xóa thành công hóa đơn chi tiết.";
    }

    @Override
    public BillDetailResponse getBillDetailResponse(int id) {
        return null;
    }

    public BillDetail getById(int id) {
        return billDetailRepository.findById(id).orElse(null);
    }

}
