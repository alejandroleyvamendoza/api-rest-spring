package com.alejandroLeyvaa.practice.domain.service;

import com.alejandroLeyvaa.practice.persitence.entity.ClientEntity;
import com.alejandroLeyvaa.practice.domain.repository.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClientService {

    @Autowired
    private ClientRepository clientRepository;

    public List<ClientEntity> getAll() {
        return this.clientRepository.findAll();
    }
}
