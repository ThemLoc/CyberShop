package com.cybershop.services;

import com.cybershop.models.Customer;
import java.util.List;

public interface CustomerService {

    void save(Customer obj);

    void updateStatus(int id, boolean status);

    Customer findById(int id);

    List<Customer> getByAll();

    Customer getByUser(String username);

    Customer checkLogin(String user, String pass);
}
