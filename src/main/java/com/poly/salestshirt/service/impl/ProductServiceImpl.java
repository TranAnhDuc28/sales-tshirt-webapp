package com.poly.salestshirt.service.impl;

import com.poly.salestshirt.dto.request.ProductRequest;
import com.poly.salestshirt.dto.response.ProductResponse;
import com.poly.salestshirt.dto.response.common.PageResponse;
import com.poly.salestshirt.entity.Product;
import com.poly.salestshirt.mapper.ProductMapper;
import com.poly.salestshirt.repository.ProductRepository;
import com.poly.salestshirt.service.ProductService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {

    private final ProductRepository productRepository;
    private final ProductMapper productMapper;

    @Override
    public PageResponse<?> getAllByStatusAndSearch(int pageNo, int pageSize, String keyword, Integer status) {
        int pageNumber = 0;
        if (pageNo > 0) pageNumber = pageNo - 1;

        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        Page<Product> productPage = productRepository.findAllBySearchAndStatus(keyword, status, pageable);

        List<ProductResponse> productResponseList = productPage.stream().map(productMapper::toProductResponse).toList();

        return PageResponse.builder()
                .pageNo(pageNo)
                .pageSize(pageSize)
                .totalPages(productPage.getTotalPages())
                .first(productPage.isFirst())
                .last(productPage.isLast())
                .items(productResponseList)
                .build();
    }

    @Override
    public String create(ProductRequest request) {
        Product product = productMapper.toCreateProduct(request);
        log.info("Create product coder={}, name={}", product.getCode(), product.getName());
        productRepository.save(product);
        log.info("Product add save!");
        return "Them san pham thanh cong";
    }

    @Override
    public String update(int productId, ProductRequest request) {
        Product product = this.getProductById(productId);
        if (product == null) return "Khong tim thay san pham";
        productMapper.toUpdateProduct(product, request);
        productRepository.save(product);
        log.info("Product updated successfully");
        return "Sua san pham thanh cong";
    }

    @Override
    public boolean changeStatus(int productId, int status) {
        log.info("Product change status with id={}, status={}", productId, status);
        Product product = this.getProductById(productId);
        if (product == null) return false;
        product.setStatus(status);
        productRepository.save(product);
        log.info("product changed status successfully");
        return true;
    }

    @Override
    public ProductResponse getProductResponse(int productId) {
        Product product = this.getProductById(productId);
        if(product == null) return null;
        return productMapper.toProductResponse(product);
    }

    @Override
    public List<ProductResponse> getAllByStatus(int status) {
        return productRepository.findAllByStatus(status).stream().map(productMapper::toProductResponse).toList();
    }

    public Product getProductById(int productId) {
        return productRepository.findById(productId).orElse(null);
    }

}
