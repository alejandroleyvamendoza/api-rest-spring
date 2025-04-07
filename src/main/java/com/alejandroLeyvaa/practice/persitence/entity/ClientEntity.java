package com.alejandroLeyvaa.practice.persitence.entity;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "Client")
public class ClientEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String name;
    private String lastname;

    @Column(unique = true, length = 255)
    private String email;

    @Column(unique = true, length = 16)
    private String waId;

    @ManyToOne
    @JoinColumn(name = "manager_id")
    private UserEntity manager;

    @Enumerated(EnumType.STRING)
    private Status status = Status.ACTIVE;

    private LocalDateTime createdAt = LocalDateTime.now();
    private LocalDateTime updatedAt;
    private Integer createdBy;
    private Integer updatedBy;
}
