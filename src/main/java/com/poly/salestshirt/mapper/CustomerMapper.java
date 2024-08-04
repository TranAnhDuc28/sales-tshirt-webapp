package com.poly.salestshirt.mapper;

import com.poly.salestshirt.dto.request.CustomerRequest;
import com.poly.salestshirt.dto.response.CustomerResponse;
import com.poly.salestshirt.entity.Customer;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

@Mapper(componentModel = "spring")
public interface CustomerMapper {
    CustomerResponse toCustomerResponse(Customer customer);
    @Mapping(target = "id", ignore = true)
    @Mapping(target = "bills", ignore = true)
    @Mapping(target = "accountId", ignore = true)
    @Mapping(target = "status", source = "status", defaultValue = "1")
    Customer toCreateCustomer(CustomerRequest request);
    @Mapping(target = "id", ignore = true)
    @Mapping(target = "bills", ignore = true)
    @Mapping(target = "accountId", ignore = true)
    void toUpdateCustomer(@MappingTarget Customer customer, CustomerRequest request);
}
