package com.alejandroLeyvaa.practice.domain.repository;

import com.alejandroLeyvaa.practice.domain.dto.ProductDto;

import java.util.List;

public interface IProductRepository {
    List<ProductDto> getAll();
}