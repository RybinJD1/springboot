package com.controller;

import com.entity.Buyer;
import com.services.servicesImpl.BuyerServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
//@RequestMapping("/buyers")
public class BuyerController {

    public static final String BUYERS = "index";

    @Autowired
    private BuyerServiceImpl buyerServiceImpl;

    @GetMapping("/all-buyers")
    public String allBuyers(HttpServletRequest request) {
        request.setAttribute("buyers", buyerServiceImpl.findAll());
        request.setAttribute("mode", "MODE_BUYERS");
        return BUYERS;
    }

    @GetMapping("/new-buyer")
    public String newBuyer(HttpServletRequest request) {
        request.setAttribute("mode", "MODE_NEW_BUYER");
        return BUYERS;
    }

    @PostMapping("/save-buyer")
    public String saveBuyer(@ModelAttribute Buyer buyer, BindingResult bindingResult, HttpServletRequest request) {
        buyerServiceImpl.save(buyer);
        request.setAttribute("buyers", buyerServiceImpl.findAll());
        request.setAttribute("mode", "MODE_BUYERS");
        return BUYERS;
    }

    @GetMapping("/update-buyer")
    public String updateBuyer(@RequestParam long id, HttpServletRequest request) {
        request.setAttribute("buyer", buyerServiceImpl.getById(id));
        request.setAttribute("mode", "MODE_UPDATE_BUYER");
        return BUYERS;
    }

    @GetMapping("/delete-buyer")
    public String deleteBuyer(@RequestParam long id, HttpServletRequest request) {
        buyerServiceImpl.delete(id);
        request.setAttribute("buyers", buyerServiceImpl.findAll());
        request.setAttribute("mode", "MODE_BUYERS");
        return BUYERS;
    }

}
