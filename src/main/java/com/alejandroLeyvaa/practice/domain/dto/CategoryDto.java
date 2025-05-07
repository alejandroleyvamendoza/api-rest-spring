package com.alejandroLeyvaa.practice.domain.dto;

import com.alejandroLeyvaa.practice.persitence.entity.CategoryEntity;
import com.alejandroLeyvaa.practice.persitence.entity.ProductEntity;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Repository;

import java.util.List;

@Getter
@Setter
public class CategoryDto {

    private Integer categoryId;

    private String categoryDescription;

    private Boolean status;

}
