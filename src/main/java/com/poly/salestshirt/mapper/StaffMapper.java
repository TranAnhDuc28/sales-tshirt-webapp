package com.poly.salestshirt.mapper;

import com.poly.salestshirt.dto.request.StaffRequest;
import com.poly.salestshirt.dto.response.StaffResponse;
import com.poly.salestshirt.entity.Staff;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

@Mapper(componentModel = "spring")
public interface StaffMapper {
    StaffResponse toStaffResponse(Staff staff);
    @Mapping(target = "id", ignore = true)
    @Mapping(target = "accountId", ignore = true)
    @Mapping(target = "status", source = "status", defaultValue = "1")
    Staff toCreateStaff(StaffRequest request);
    @Mapping(target = "accountId", ignore = true)
    @Mapping(target = "id", ignore = true)
    void toUpdateStaff(@MappingTarget Staff staff, StaffRequest request);
}
