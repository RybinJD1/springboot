package com.entity;


import com.entity.enums.Status;
import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
//@Proxy(proxyClass = Buyer.class)
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(exclude = "productList")
@ToString(exclude = "buyer")
@Table(name = "orders")
public class Orders implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Temporal(TemporalType.DATE)
    @Column(name = "date_registration")
    private Date registrationDate;

    @Column
    @Enumerated(EnumType.STRING)
    private Status status;

    @ManyToOne
    @JoinColumn(name = "buyers_id")
    private Buyer buyer;

    @OneToMany(cascade ={CascadeType.PERSIST, CascadeType.REFRESH})
    private List<Product> productList = new ArrayList<>();

    public Orders(Status status, Date registrationDate) {
        this.status = status;
        this.registrationDate = registrationDate;
    }

    public Orders(Status status) {
        this.status = status;
    }
}
