package com.poly.salestshirt.mapper;

import com.poly.salestshirt.dto.request.ColorRequest;
import com.poly.salestshirt.dto.response.ColorResponse;
import com.poly.salestshirt.entity.Color;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

@Mapper(componentModel = "spring")
public interface ColorMapper {
    ColorResponse toColorResponse(Color color);
    @Mapping(target = "id", ignore = true)
    @Mapping(target = "status", source = "status", defaultValue = "1")
    Color toCreateColor(ColorRequest request);
    @Mapping(target = "id", ignore = true)
    void toUpdateColor(@MappingTarget Color color, ColorRequest request);
}
