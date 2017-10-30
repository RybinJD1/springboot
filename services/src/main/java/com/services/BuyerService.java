package com.services;

import com.entity.Buyer;

public interface BuyerService extends BaseService<Buyer> {

    Buyer findByBuyerEmail(String email);

}
