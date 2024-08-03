package com.poly.salestshirt.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BillDetailRequest {

    private Integer billId;
    private Integer productDetailId;
    private Integer quantity;
    private Double price;
    private Integer status;
}
