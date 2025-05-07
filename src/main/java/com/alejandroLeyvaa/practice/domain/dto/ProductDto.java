package com.alejandroLeyvaa.practice.domain.dto;

import com.alejandroLeyvaa.practice.persitence.entity.CategoryEntity;
import jakarta.persistence.*;

public class ProductDto {

    private Integer productId;

    private String productName;

    private Integer categoryId;


    private CategoryEntity category;


    private String barCode;

    private Double price;

    private Integer stock;

    private Boolean status;
}
