package com.alejandroLeyvaa.practice.persitence.entity;


import jakarta.persistence.*;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "User")
public class UserEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(length = 80)
    private String name;

    @Column(length = 80)
    private String lastname;

    @Column(unique = true, length = 80)
    private String email;

    @Column(unique = true, length = 16)
    private String waId;

    @ManyToOne
    @JoinColumn(name = "role_id")
    private RoleEntity role;

    @OneToOne
    @JoinColumn(name = "profile_id", unique = true)
    private ProfileEntity profile;

    @ManyToOne
    @JoinColumn(name = "manager_id")
    private UserEntity manager;

    @OneToMany(mappedBy = "manager")
    private List<UserEntity> employees;

    @Enumerated(EnumType.STRING)
    private Status status = Status.ACTIVE;

    private LocalDateTime createdAt = LocalDateTime.now();
    private LocalDateTime updatedAt;
    private Integer createdBy;
    private Integer updatedBy;
}