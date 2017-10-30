package com.controller;

import com.entity.Orders;
import com.services.servicesImpl.OrdersServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
public class OrdersController {

    public static final String ORDERS = "index";

    @Autowired
    private OrdersServiceImpl ordersServiceImpl;

    @GetMapping("/all-orders")
    public String allOrders(HttpServletRequest request) {
        request.setAttribute("orders", ordersServiceImpl.findAll());
        request.setAttribute("mode", "MODE_ORDERS");
        return ORDERS;
    }

    @GetMapping("/new-order")
    public String newOrder(HttpServletRequest request) {
        request.setAttribute("mode", "MODE_NEW_ORDER");
        return ORDERS;
    }

    @PostMapping("/save-order")
    public String saveOrder(@ModelAttribute Orders orders, BindingResult bindingResult, HttpServletRequest request) {
        orders.setRegistrationDate(new Date());
        ordersServiceImpl.save(orders);
        request.setAttribute("orders", ordersServiceImpl.findAll());
        request.setAttribute("mode", "MODE_ORDERS");
        return ORDERS;
    }

    @GetMapping("/update-order")
    public String updateOrder(@RequestParam long id, HttpServletRequest request) {
        request.setAttribute("order", ordersServiceImpl.getById(id));
        request.setAttribute("mode", "MODE_UPDATE_ORDER");
        return ORDERS;
    }

    @GetMapping("/delete-order")
    public String deleteOrder(@RequestParam long id, HttpServletRequest request) {
        ordersServiceImpl.delete(id);
        request.setAttribute("orders", ordersServiceImpl.findAll());
        request.setAttribute("mode", "MODE_ORDERS");
        return ORDERS;
    }
}
