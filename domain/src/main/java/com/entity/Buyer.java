package com.entity;

import com.entity.enums.Role;
import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(exclude = "ordersList")
@EqualsAndHashCode(exclude = "ordersList")
@Table(name = "buyers")
public class Buyer implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    @Enumerated(EnumType.STRING)
    private Role role;

    @Column
    private String name;

    @Column
    private String surname;

    @Column
    private String email;

    @Column
    private String password;

    @Column
    private String phone;

    @Column
    private String address;

    @OneToMany(mappedBy = "buyer",orphanRemoval=true, cascade = CascadeType.ALL) //
    private List<Orders> ordersList = new ArrayList<>();

    public Buyer(long id, String name, String surname, String email, String password, String phone, String address) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.address = address;
    }

    public Buyer(long id, Role role, String name, String surname, String email, String password, String phone, String address) {
        this.id = id;
        this.role = role;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.address = address;
    }

    public Buyer(Role role, String name, String surname, String email, String password, String phone, String address) {
        this.role = role;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.address = address;
    }


}
