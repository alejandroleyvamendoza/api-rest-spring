package com.alejandroLeyvaa.practice.domain.service;

import com.alejandroLeyvaa.practice.persitence.entity.UserEntity;
import com.alejandroLeyvaa.practice.domain.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public List<UserEntity> getAll() {
        return this.userRepository.findAll();
    }
}
