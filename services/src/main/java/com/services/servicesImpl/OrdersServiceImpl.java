package com.services.servicesImpl;

import com.entity.Orders;
import com.services.OrdersService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class OrdersServiceImpl implements OrdersService {

    @Override
    public List<Orders> findAll() {
        return null;
    }

    @Override
    public void save(Orders orders) {

    }

    @Override
    public void delete(long id) {

    }

    @Override
    public Orders getById(long id) {
        return null;
    }
}
