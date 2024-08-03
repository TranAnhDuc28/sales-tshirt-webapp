package com.poly.salestshirt.dto.response;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class ProductDetailResponse {
    private Integer id;
    private String code;
    private Integer productId;
    private String productName;
    private Integer sizeId;
    private String sizeName;
    private Integer colorId;
    private String colorName;
    private Integer quantity;
    private Double price;
    private Integer status;
}
