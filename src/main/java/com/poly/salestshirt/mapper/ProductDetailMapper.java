package com.poly.salestshirt.mapper;

import com.poly.salestshirt.dto.request.ProductDetailRequest;
import com.poly.salestshirt.dto.response.ProductDetailResponse;
import com.poly.salestshirt.entity.ProductDetail;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

@Mapper(componentModel = "spring")
public interface ProductDetailMapper {

    @Mapping(target = "sizeName", source = "size.name")
    @Mapping(target = "sizeId", source = "size.id")
    @Mapping(target = "productName", source = "product.name")
    @Mapping(target = "productId", source = "product.id")
    @Mapping(target = "colorName", source = "color.name")
    @Mapping(target = "colorId", source = "color.id")
    ProductDetailResponse toProductDetailResponse(ProductDetail productDetail);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "color", ignore = true)
    @Mapping(target = "size", ignore = true)
    @Mapping(target = "product", ignore = true)
    @Mapping(target = "status", source = "status", defaultValue = "1")
    ProductDetail toCreateProductDetail(ProductDetailRequest request);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "color", ignore = true)
    @Mapping(target = "size", ignore = true)
    @Mapping(target = "product", ignore = true)
    void toUpdateProductDetail(@MappingTarget ProductDetail productDetail, ProductDetailRequest request);

}
