package com.controller;

import com.entity.Product;
import com.services.servicesImpl.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ProductController {

    public static final String PRODUCTS = "index";

    @Autowired
    private ProductServiceImpl productServiceImpl;

    @GetMapping("/all-products")
    public String allProducts(HttpServletRequest request) {
        request.setAttribute("products", productServiceImpl.findAll());
        request.setAttribute("mode", "MODE_PRODUCTS");
        return PRODUCTS;
    }

    @GetMapping("/new-product")
    public String newProduct(HttpServletRequest request) {
        request.setAttribute("mode", "MODE_NEW_PRODUCT");
        return PRODUCTS;
    }

    @PostMapping("/save-product")
    public String saveProduct(@ModelAttribute Product product, BindingResult bindingResult, HttpServletRequest request) {
        productServiceImpl.save(product);
        request.setAttribute("products", productServiceImpl.findAll());
        request.setAttribute("mode", "MODE_PRODUCTS");
        return PRODUCTS;
    }

    @GetMapping("/update-product")
    public String updateProduct(@RequestParam long id, HttpServletRequest request) {
        request.setAttribute("product", productServiceImpl.getById(id));
        request.setAttribute("mode", "MODE_UPDATE_PRODUCT");
        return PRODUCTS;
    }

    @GetMapping("/delete-product")
    public String deleteProduct(@RequestParam long id, HttpServletRequest request) {
        productServiceImpl.delete(id);
        request.setAttribute("products", productServiceImpl.findAll());
        request.setAttribute("mode", "MODE_PRODUCTS");
        return PRODUCTS;
    }
}
