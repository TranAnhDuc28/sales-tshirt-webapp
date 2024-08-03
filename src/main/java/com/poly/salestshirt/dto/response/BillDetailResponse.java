package com.poly.salestshirt.dto.response;

import lombok.*;

@Getter
@Builder
@AllArgsConstructor
public class BillDetailResponse {
    private Integer id;
    private Integer billId;
    private Integer productDetailId;
    private String detailProductName;
    private Integer quantity;
    private Double price;
    private Double totalPrice;
    private Integer status;

}
