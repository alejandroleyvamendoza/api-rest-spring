package com.alejandroLeyvaa.practice.persitence;

import com.alejandroLeyvaa.practice.persitence.entity.ProductEntity;
import com.alejandroLeyvaa.practice.domain.repository.ProductCrudRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductRepository {
    @Autowired
    private ProductCrudRepository productCrudRepository;

    public List<ProductEntity> getAll() {
        return (List<ProductEntity>) productCrudRepository.findAll();
    }

    public List<ProductEntity> findByIdCategory(int idCategory) {
        return (List<ProductEntity>) productCrudRepository.findByIdCategory(idCategory);
    }
}
