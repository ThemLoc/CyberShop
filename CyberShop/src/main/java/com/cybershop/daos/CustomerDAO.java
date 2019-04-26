package com.cybershop.daos;

import com.cybershop.models.Customer;
import java.util.List;

public interface CustomerDAO {

    void create(Customer obj);

    void update(Customer obj);

    void delete(int id, boolean status);

    List<Customer> getAll();

    Customer getById(int id);
    
   Customer getByUsername(String username);
}
