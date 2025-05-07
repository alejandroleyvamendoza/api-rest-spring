package com.alejandroLeyvaa.practice.persitence.repository;

import com.alejandroLeyvaa.practice.domain.dto.CategoryDto;
import com.alejandroLeyvaa.practice.domain.repository.ICategoryRepository;
import com.alejandroLeyvaa.practice.domain.repository.CategoryCrudRepository;
import com.alejandroLeyvaa.practice.persitence.entity.CategoryEntity;
import com.alejandroLeyvaa.practice.persitence.mapper.CategoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CategoryRepository implements ICategoryRepository {

    @Autowired
    private CategoryCrudRepository categoryCrudRepository;


    @Autowired
    private CategoryMapper mapper;



    @Override
    public List<CategoryDto> getAll() {
        List<CategoryEntity> categories = (List<CategoryEntity>) categoryCrudRepository.findAll();

        return mapper.toCategories(categories);
    }
}
