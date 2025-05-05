package com.alejandroLeyvaa.practice.persitence.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Table(name = "compras_productos")
@Getter
@Setter
public class PurchaseProductsEntity implements Serializable {

    @EmbeddedId
    private PurchaseProductsPKEntity id;

    @Column(name = "cantidad")
    private Integer count;

    private Double total;

    @Column(name = "estado")
    private Boolean status;

    @ManyToOne
    @JoinColumn(name = "id_compra", insertable = false, updatable = false)
    private PurchaseEntity purchase;

    @ManyToOne
    @JoinColumn(name = "id_producto", insertable = false, updatable = false)
    private ProductEntity product;

}

