package com.poly.salestshirt.service.impl;

import com.poly.salestshirt.entity.Color;
import com.poly.salestshirt.entity.Product;
import com.poly.salestshirt.entity.Size;
import com.poly.salestshirt.entity.ProductDetail;
import com.poly.salestshirt.dto.request.ProductDetailRequest;
import com.poly.salestshirt.dto.response.common.PageResponse;
import com.poly.salestshirt.dto.response.ProductDetailResponse;
import com.poly.salestshirt.repository.SizeRepository;
import com.poly.salestshirt.repository.ColorRepository;
import com.poly.salestshirt.repository.ProductDetailRepository;
import com.poly.salestshirt.repository.ProductRepository;
import com.poly.salestshirt.service.ProductDetailService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class ProductDetailServiceImpl implements ProductDetailService {

    private final ProductDetailRepository productDetailRepository;
    private final ProductRepository productRepository;
    private final SizeRepository sizeRepository;
    private final ColorRepository colorRepository;

    @Override
    public PageResponse<?> getAllByProductId(int pageNo, int pageSize, int productId) {
        int pageNumber = 0;
        if (pageNo > 0) pageNumber = pageNo - 1;

        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        Page<ProductDetail> productDetailPage = productDetailRepository.findAllByProductId(pageable, productId);

        List<ProductDetailResponse> productDetailList = productDetailPage.stream()
                .map(productDetail -> ProductDetailResponse.builder()
                        .id(productDetail.getId())
                        .code(productDetail.getCode())
                        .productId(productDetail.getProduct().getId())
                        .productName(productDetail.getProduct().getName())
                        .sizeId(productDetail.getSize() != null ? productDetail.getSize().getId() : null)
                        .sizeName(productDetail.getSize() != null ? productDetail.getSize().getName() : null)
                        .colorId(productDetail.getColor() != null ? productDetail.getColor().getId() : null)
                        .colorName(productDetail.getColor() != null ? productDetail.getColor().getName() : null)
                        .quantity(productDetail.getQuantity())
                        .price(productDetail.getPrice())
                        .status(productDetail.getStatus())
                        .build())
                .toList();

        return PageResponse.builder()
                .pageNo(pageNo)
                .pageSize(pageSize)
                .totalPages(productDetailPage.getTotalPages())
                .first(productDetailPage.isFirst())
                .last(productDetailPage.isLast())
                .items(productDetailList)
                .build();
    }

    @Override
    public String create(ProductDetailRequest request) {
        ProductDetail productDetail = new ProductDetail();

        Optional<Product> productOptional = productRepository.findById(request.getProductId());
        if (productOptional.isEmpty()) return "Không tìm thấy sản phẩm.";

        Optional<Size> sizeOptional = Optional.empty();
        if (request.getSizeId() != null) {
            sizeOptional = sizeRepository.findById(request.getSizeId());
            if (sizeOptional.isEmpty()) return "Không tìm thấy kích thước.";
        }

        Optional<Color> colorOptional = Optional.empty();
        if (request.getColorId() != null) {
            colorOptional = colorRepository.findById(request.getColorId());
            if (colorOptional.isEmpty()) return "Không tìm thấy màu sắc.";
        }

        productDetail.setCode(request.getCode());
        productDetail.setProduct(productOptional.get());
        productDetail.setSize(sizeOptional.orElse(null));
        productDetail.setColor(colorOptional.orElse(null));
        productDetail.setQuantity(request.getQuantity());
        productDetail.setPrice(request.getPrice());
        productDetail.setStatus(1);
        productDetailRepository.save(productDetail);
        return "Thêm sản phẩm chi tiết thành công.";
    }

    @Override
    public String update(int productDetailId, ProductDetailRequest request) {
        ProductDetail productDetail = new ProductDetail();

        Optional<Product> productOptional = productRepository.findById(request.getProductId());
        if (productOptional.isEmpty()) return "Không tìm thấy sản phẩm.";

        Optional<Size> sizeOptional = Optional.empty();
        if (request.getSizeId() != null) {
            sizeOptional = sizeRepository.findById(request.getSizeId());
            if (sizeOptional.isEmpty()) return "Không tìm thấy kích thước.";
        }

        Optional<Color> colorOptional = Optional.empty();
        if (request.getColorId() != null) {
            colorOptional = colorRepository.findById(request.getColorId());
            if (colorOptional.isEmpty()) return "Không tìm thấy màu sắc.";
        }

        productDetail.setId(productDetailId);
        productDetail.setCode(request.getCode());
        productDetail.setProduct(productOptional.get());
        productDetail.setSize(sizeOptional.orElse(null));
        productDetail.setColor(colorOptional.orElse(null));
        productDetail.setQuantity(request.getQuantity());
        productDetail.setPrice(request.getPrice());
        productDetail.setStatus(request.getStatus());
        productDetailRepository.save(productDetail);
        return "Sửa sản phẩm chi tiết thành công.";
    }

    @Override
    public String changeStatus(int productDetailId, int status) {
        log.info("Product detail change status with id={}, status={}", productDetailId, status);
        ProductDetail productDetail = getProductDetailById(productDetailId);
        if (productDetail == null) return "Không tìm thấy sản phẩm chi tiết";
        productDetail.setStatus(status);
        productDetailRepository.save(productDetail);
        log.info("Product detail changed status successfully");
        return null;
    }

    @Override
    public ProductDetailResponse getProductDetailResponse(int id) {
        ProductDetail productDetail = getProductDetailById(id);
        if (productDetail == null) return null;
        return ProductDetailResponse.builder()
                .id(productDetail.getId())
                .code(productDetail.getCode())
                .productId(productDetail.getProduct().getId())
                .productName(productDetail.getProduct().getName())
                .sizeId(productDetail.getSize() != null ? productDetail.getSize().getId() : null)
                .sizeName(productDetail.getSize() != null ? productDetail.getSize().getName() : null)
                .colorId(productDetail.getColor() != null ? productDetail.getColor().getId() : null)
                .colorName(productDetail.getColor() != null ? productDetail.getColor().getName() : null)
                .quantity(productDetail.getQuantity())
                .price(productDetail.getPrice())
                .status(productDetail.getStatus())
                .build();
    }

    @Override
    public List<ProductDetailResponse> getAllByProductIdAndStatus(int productId, int status) {
        return productDetailRepository.findAllByProductIdAndStatus(productId, status).stream()
                .map(productDetail -> ProductDetailResponse.builder()
                        .id(productDetail.getId())
                        .code(productDetail.getCode())
                        .productId(productDetail.getProduct().getId())
                        .productName(productDetail.getProduct().getName())
                        .sizeId(productDetail.getSize() != null ? productDetail.getSize().getId() : null)
                        .sizeName(productDetail.getSize() != null ? productDetail.getSize().getName() : null)
                        .colorId(productDetail.getColor() != null ? productDetail.getColor().getId() : null)
                        .colorName(productDetail.getColor() != null ? productDetail.getColor().getName() : null)
                        .quantity(productDetail.getQuantity())
                        .price(productDetail.getPrice())
                        .status(productDetail.getStatus())
                        .build())
                .collect(Collectors.toList());
    }

    public ProductDetail getProductDetailById(int id) {
        return productDetailRepository.findById(id).orElse(null);
    }
}
