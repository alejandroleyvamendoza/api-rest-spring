package com.alejandroLeyvaa.practice.domain.service;

import com.alejandroLeyvaa.practice.domain.dto.CategoryDto;
import com.alejandroLeyvaa.practice.domain.repository.CategoryCrudRepository;
import com.alejandroLeyvaa.practice.domain.repository.ICategoryRepository;
import com.alejandroLeyvaa.practice.persitence.entity.CategoryEntity;
import com.alejandroLeyvaa.practice.persitence.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService {

    @Autowired
    private ICategoryRepository categoryRepository;

    public List<CategoryDto> getAll() {

        return categoryRepository.getAll();
    }
}
