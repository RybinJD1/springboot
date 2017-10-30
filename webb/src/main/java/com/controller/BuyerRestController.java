package com.controller;

import com.services.servicesImpl.BuyerServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BuyerRestController {

    @Autowired
    private BuyerServiceImpl buyerServiceImpl;

//    @GetMapping("/all-buyers")
//    public String allBuyers() {
//        return buyerService.findAll().toString();
//    }
//
//    @GetMapping("/save-buyer")
//    public String saveBuyer(@RequestParam String role,String name, String surname, String email, String password, String phone, String address) {
//        Buyer buyer = new Buyer(UserRole.valueOf(role),name,surname, email, password, phone, address);
//        buyerService.save(buyer);
//        return "Buyer saved!";
//    }
//    @GetMapping("/delete-buyer")
//    public String deleteBuyer(@RequestParam long id) {
//        buyerService.delete(id);
//        return "Buyer deleted!";
//    }

}
