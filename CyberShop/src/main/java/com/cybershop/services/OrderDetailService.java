/*
 * OrderDetailo change this license header, choose License Headers in Project Properties.
 * OrderDetailo change this template file, choose OrderDetailools | OrderDetailemplates
 * and open the template in the editor.
 */
package com.cybershop.services;

import com.cybershop.models.OrderDetail;
import java.util.List;

/**
 *
 * @author chungnguyen
 */
public interface OrderDetailService {
    void save(OrderDetail obj);
    void remove(int id);
    OrderDetail findById(int id);
    List<OrderDetail> getByAll();
    List<OrderDetail> findByOrderID(int id);
}
