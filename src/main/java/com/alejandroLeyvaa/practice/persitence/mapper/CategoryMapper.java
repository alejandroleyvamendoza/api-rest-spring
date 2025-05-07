package com.alejandroLeyvaa.practice.persitence.mapper;

import com.alejandroLeyvaa.practice.domain.dto.CategoryDto;
import com.alejandroLeyvaa.practice.persitence.entity.CategoryEntity;
import org.mapstruct.InheritInverseConfiguration;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper(componentModel = "spring")
@Component
public interface CategoryMapper {

    @Mappings({
            @Mapping(source = "idCategory", target = "categoryId"),
            @Mapping(source = "description", target = "categoryDescription"),
            @Mapping(source = "status", target = "status"),
    })
    CategoryDto toCategoryDto(CategoryEntity categoryEntity);

    @InheritInverseConfiguration
    @Mapping(target = "products", ignore = true)
    CategoryEntity toCategoryEntity(CategoryDto categoryDto);


    List<CategoryDto> toCategories(List<CategoryEntity> categories);
}
