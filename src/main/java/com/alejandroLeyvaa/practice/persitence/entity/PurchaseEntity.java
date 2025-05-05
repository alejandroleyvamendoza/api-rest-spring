package com.alejandroLeyvaa.practice.persitence.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "compras")
@Getter
@Setter
public class PurchaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_purchase")
    private Integer idPurchase;

    @Column(name = "nombre")
    private String name;

    @Column(name = "id_cliente")
    private Integer idClient;

    @Column(name = "fecha")
    private LocalDateTime date;

    @Column(name = "medio_pago")
    private String paymentType;

    @Column(name = "comentario")
    private String comment;

    @Column(name = "cantidad")
    private Integer count;

    private Double total;

    @Column(name = "estado")
    private Boolean status;

    @ManyToOne
    @JoinColumn(name = "id_cliente", insertable = false, updatable = false)
    private CustomerEntity customer;

    @OneToMany(mappedBy = "purchase")
    private List<PurchaseProductsEntity> products;

}

