package com.alejandroLeyvaa.practice.domain.repository;

import com.alejandroLeyvaa.practice.domain.dto.CategoryDto;

import java.util.List;

public interface ICategoryRepository {
    List<CategoryDto> getAll();
}