package com.alejandroLeyvaa.practice.domain.repository;

import com.alejandroLeyvaa.practice.persitence.entity.ProductEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ProductCrudRepository extends CrudRepository<ProductEntity, Integer> {

    //@Query(value = "Select * from productos WHERE id_categorua = ?", nativeQuery = true)
    List<ProductEntity> findByIdCategory(int idCategory);

}