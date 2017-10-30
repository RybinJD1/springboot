package com.services.servicesImpl;

import com.dao.BuyerRepository;
import com.entity.Buyer;
import com.services.BuyerService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class BuyerServiceImpl implements BuyerService {

    private BuyerRepository buyerRepository;

    public BuyerServiceImpl(BuyerRepository buyerRepository) {
        this.buyerRepository = buyerRepository;
    }

    @Override
    public List<Buyer> findAll() {
        List<Buyer> buyers = new ArrayList<>();
        for (Buyer buyer : buyerRepository.findAll()) {
            buyers.add(buyer);
        }
        return buyers;
    }

    @Override
    public void save(Buyer buyer) {
        buyerRepository.save(buyer);
    }

    @Override
    public void delete(long id) {
        buyerRepository.delete(id);
    }

    @Override
    public Buyer getById(long id) {
        return buyerRepository.findOne(id);
    }

    @Override
    public Buyer findByBuyerEmail(String email) {
        return buyerRepository.findByEmail(email);
    }
}
