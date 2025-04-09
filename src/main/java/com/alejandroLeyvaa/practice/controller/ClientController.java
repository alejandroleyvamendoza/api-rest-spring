package com.alejandroLeyvaa.practice.controller;

import com.alejandroLeyvaa.practice.persitence.entity.ClientEntity;
import com.alejandroLeyvaa.practice.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/client")
public class ClientController {

    @Autowired
    private ClientService clientService;

    @GetMapping("/all")
    public ResponseEntity<List<ClientEntity>> getAllClients() {

        List<ClientEntity> clientEntityList = this.clientService.getAll();
        return ResponseEntity.ok(clientEntityList);
    }
}
