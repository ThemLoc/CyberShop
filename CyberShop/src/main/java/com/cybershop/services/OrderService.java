package com.cybershop.services;

import com.cybershop.models.Order;
import java.util.List;

public interface OrderService {
    void save(Order obj);
    void remove(int id);
    Order findById(int id);
    List<Order> getByAll();
    void sendEmailOrder(String from, String to, String subject, String content);
    List<Order> findByCusID(int id);
    void updateStatus(String status, int id);
}
