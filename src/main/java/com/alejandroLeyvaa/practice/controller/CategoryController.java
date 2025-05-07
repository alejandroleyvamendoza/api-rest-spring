package com.alejandroLeyvaa.practice.controller;

import com.alejandroLeyvaa.practice.domain.dto.CategoryDto;
import com.alejandroLeyvaa.practice.domain.service.CategoryService;
import com.alejandroLeyvaa.practice.persitence.entity.CategoryEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @GetMapping("/all")
    public ResponseEntity<List<CategoryDto>> getAllCategories() {

        List<CategoryDto> categories = this.categoryService.getAll();
        return ResponseEntity.ok(categories);
    }
}
