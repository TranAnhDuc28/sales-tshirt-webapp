package com.poly.salestshirt.mapper;

import com.poly.salestshirt.dto.request.SizeRequest;
import com.poly.salestshirt.dto.response.SizeResponse;
import com.poly.salestshirt.entity.Size;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

@Mapper(componentModel = "spring")
public interface SizeMapper {
    SizeResponse toSizeResponse(Size size);
    @Mapping(target = "id", ignore = true)
    @Mapping(target = "status", source = "status", defaultValue = "1")
    Size toCreateSize(SizeRequest request);
    @Mapping(target = "id", ignore = true)
    void toUpdateSize(@MappingTarget Size size, SizeRequest request);
}
