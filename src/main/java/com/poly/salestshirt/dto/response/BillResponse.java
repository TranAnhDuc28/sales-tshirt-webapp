package com.poly.salestshirt.dto.response;

import lombok.*;

import java.util.Date;

@Getter
@Builder
public class BillResponse {

    private Integer id;
    private Integer staffId;
    private String staffName;
    private Integer customerId;
    private String customerName;
    private String phoneNumber;
    private Date dateOfPurchase;
    private Integer status;
}
