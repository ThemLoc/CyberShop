package com.cybershop.daos;

import com.cybershop.models.Customer;
import java.util.List;

public interface CustomerDAO {

    void create(Customer obj);

    void update(Customer obj);

    void delete(int id);

    List<Customer> getAll();

    Customer getById(int id);
}