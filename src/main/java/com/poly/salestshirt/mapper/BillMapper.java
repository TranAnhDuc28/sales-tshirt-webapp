package com.poly.salestshirt.mapper;

import com.poly.salestshirt.dto.request.BillRequest;
import com.poly.salestshirt.dto.response.BillResponse;
import com.poly.salestshirt.entity.Bill;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

@Mapper(componentModel = "spring")
public interface BillMapper {
    @Mapping(target = "staffName", source = "staff.name")
    @Mapping(target = "staffId", source = "staff.id")
    @Mapping(target = "phoneNumber", source = "customer.phoneNumber")
    @Mapping(target = "customerName", source = "customer.name")
    @Mapping(target = "customerId", source = "customer.id")
    BillResponse toBillResponse(Bill bill);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "staff", ignore = true)
    @Mapping(target = "customer", ignore = true)
    @Mapping(target = "status", source = "status", defaultValue = "0")
    Bill toCreateBill(BillRequest request);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "staff", ignore = true)
    @Mapping(target = "customer", ignore = true)
    @Mapping(target = "dateOfPurchase", source = "dateOfPurchase", defaultExpression = "java(new java.util.Date())")
    void toUpdateBill(@MappingTarget Bill bill, BillRequest request);
}
