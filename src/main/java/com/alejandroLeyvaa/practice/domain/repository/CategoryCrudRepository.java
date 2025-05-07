package com.alejandroLeyvaa.practice.domain.repository;

import com.alejandroLeyvaa.practice.persitence.entity.CategoryEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CategoryCrudRepository extends CrudRepository<CategoryEntity, Integer> {

    List<CategoryEntity> findByIdCategory(int idCategory);

}