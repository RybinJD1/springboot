package com.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;


@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "products")
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private String name;

    @Column
    private String description;

    @Column
    private int cost;

    @Column
    private int remainder;

//    private int orderedQuantity;

    public Product(String name, String description, int cost, int remainder) {
        this.name = name;
        this.description = description;
        this.cost = cost;
        this.remainder = remainder;
    }

    public Product(long id, String name, int cost) {
        this.id = id;
        this.name = name;
        this.cost = cost;
    }

    public Product(long id, String name) {
        this.id = id;
        this.name = name;
    }

    public Product(int remainder, int cost, String description, String name) { //int orderedQuantity,
//        this.orderedQuantity = orderedQuantity;
        this.remainder = remainder;
        this.cost = cost;
        this.description = description;
        this.name = name;
    }
}
