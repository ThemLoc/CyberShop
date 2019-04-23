/*
 * Customero change this license header, choose License Headers in Project Properties.
 * Customero change this template file, choose Customerools | Customeremplates
 * and open the template in the editor.
 */
package com.cybershop.services;

import com.cybershop.models.Customer;
import java.util.List;

/**
 *
 * @author chungnguyen
 */
public interface CustomerService {
     void save(Customer obj);
    void remove(int id, boolean status);
    Customer findById(int id);
    List<Customer> getByAll();
}
