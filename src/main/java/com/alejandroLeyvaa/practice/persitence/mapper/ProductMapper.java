package com.alejandroLeyvaa.practice.persitence.mapper;

import com.alejandroLeyvaa.practice.domain.dto.CategoryDto;
import com.alejandroLeyvaa.practice.domain.dto.ProductDto;
import com.alejandroLeyvaa.practice.persitence.entity.CategoryEntity;
import com.alejandroLeyvaa.practice.persitence.entity.ProductEntity;
import jakarta.persistence.*;
import org.mapstruct.InheritInverseConfiguration;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;

import java.util.List;

@Mapper(componentModel = "spring", uses = { CategoryMapper.class })
public interface ProductMapper {

    @Mappings({
            @Mapping(source = "idProduct", target = "productId"),
            @Mapping(source = "name", target = "productName"),
            @Mapping(source = "idCategory", target = "categoryId"),
            @Mapping(source = "category", target = "category"),
            @Mapping(source = "barCode", target = "barCode"),
            @Mapping(source = "price", target = "price"),
            @Mapping(source = "stock", target = "stock"),
            @Mapping(source = "status", target = "status")
    })
    ProductDto toProductDto(ProductEntity productEntity);

    List<ProductDto> toProducts(List<ProductEntity> products);

    @InheritInverseConfiguration
    ProductEntity toProductEntity(ProductDto productDto);

}