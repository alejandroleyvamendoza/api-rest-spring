package com.alejandroLeyvaa.practice.persitence.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "Profile")
public class ProfileEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(length = 80)
    private String username;

    @Column(length = 80)
    private String password;

    //@OneToOne(mappedBy = "profile")
    //private UserEntity user;
}