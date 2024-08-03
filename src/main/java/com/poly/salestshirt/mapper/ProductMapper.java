package com.poly.salestshirt.mapper;

import com.poly.salestshirt.dto.request.ProductRequest;
import com.poly.salestshirt.dto.response.ProductResponse;
import com.poly.salestshirt.entity.Product;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

@Mapper(componentModel = "spring")
public interface ProductMapper {
    ProductResponse toProductResponse(Product product);
    @Mapping(target = "id", ignore = true)
    @Mapping(target = "status", source = "status", defaultValue = "1")
    @Mapping(target = "productDetails", ignore = true)
    Product toCreateProduct(ProductRequest request);
    @Mapping(target = "id", ignore = true)
    @Mapping(target = "productDetails", ignore = true)
    void toUpdateProduct(@MappingTarget Product product, ProductRequest request);
}
