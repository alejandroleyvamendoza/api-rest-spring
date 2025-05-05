package com.alejandroLeyvaa.practice.domain.repository;

import com.alejandroLeyvaa.practice.persitence.entity.UserEntity;
import org.springframework.data.repository.ListCrudRepository;

public interface UserRepository extends ListCrudRepository<UserEntity, Integer> {





}
