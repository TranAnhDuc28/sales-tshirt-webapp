package com.poly.salestshirt.mapper;

import com.poly.salestshirt.dto.request.SizeRequest;
import com.poly.salestshirt.dto.response.SizeResponse;
import com.poly.salestshirt.entity.Size;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface SizeMapper {
    @Mapping(target = "id", ignore = true)
    @Mapping(target = "status", source = "status", defaultValue = "1")
    Size toCreateSize(SizeRequest request);
    SizeResponse toSizeResponse(Size size);
}
