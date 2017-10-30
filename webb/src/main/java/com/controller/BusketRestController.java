package com.controller;

import com.entity.Orders;
import com.entity.Product;
import com.services.ProductService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@Slf4j
@Scope("prototype")
public class BusketRestController {


    private List<Product> productList = new ArrayList<>();
    private Orders orders;

    @Autowired
    private ProductService productService;


    @RequestMapping(name = "/addToBucketOrder")
    public void getOrder(@ModelAttribute Long id){
        Product product = productService.getById(id);
        productList.add(product);
        orders.setProductList(productList);

        System.out.println(orders.toString());
    }

    public String getOrdersToUI(){
        return "";
    }
}
