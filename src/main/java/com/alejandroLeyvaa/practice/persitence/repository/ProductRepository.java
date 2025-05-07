package com.alejandroLeyvaa.practice.persitence.repository;

import com.alejandroLeyvaa.practice.domain.dto.ProductDto;
import com.alejandroLeyvaa.practice.domain.repository.ProductCrudRepository;
import com.alejandroLeyvaa.practice.persitence.entity.ProductEntity;
import com.alejandroLeyvaa.practice.persitence.mapper.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import com.alejandroLeyvaa.practice.domain.repository.IProductRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductRepository implements IProductRepository {

    private ProductMapper mapper;
    private final ProductCrudRepository productCrudRepository;

    public ProductRepository(ProductCrudRepository productCrudRepository) {
        this.productCrudRepository = productCrudRepository;
    }

    @Override
    public List<ProductDto> getAll() {
        List<ProductEntity> products = (List<ProductEntity>) productCrudRepository.findAll();

        return mapper.toProducts(products);
    }
}
