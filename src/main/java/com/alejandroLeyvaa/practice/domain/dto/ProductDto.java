package com.alejandroLeyvaa.practice.domain.dto;

import com.alejandroLeyvaa.practice.persitence.entity.CategoryEntity;
import jakarta.persistence.*;

public class ProductDto {

    private Integer idProduct;

    private String name;

    private Integer idCategory;


    private CategoryEntity category;


    private String barCode;

    private Double price;

    private Integer stock;

    private Boolean status;
}
