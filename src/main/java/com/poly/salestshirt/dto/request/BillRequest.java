package com.poly.salestshirt.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class BillRequest {

    private Integer staffId;
    private Integer customerId;
    private Date dateOfPurchase;
    private Integer status;
}
