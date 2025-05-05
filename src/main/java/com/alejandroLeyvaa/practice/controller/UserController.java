package com.alejandroLeyvaa.practice.controller;

import com.alejandroLeyvaa.practice.persitence.entity.UserEntity;
import com.alejandroLeyvaa.practice.domain.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/all")
    public ResponseEntity<List<UserEntity>> getAllUsers() {

        List<UserEntity> userEntityList = this.userService.getAll();
        return ResponseEntity.ok(userEntityList);
    }
}
