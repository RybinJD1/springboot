package com.services;

import java.util.List;

public interface BaseService<T> {

    List<T> findAll();

    void save(T t);

    void delete(long id);

    T getById(long id);

}
