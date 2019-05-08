package com.cybershop.services;

import com.cybershop.models.OrderDetail;
import java.util.List;

public interface OrderDetailService {
    void save(OrderDetail obj);
    void remove(int id);
    OrderDetail findById(int id);
    List<OrderDetail> getByAll();
    List<OrderDetail> findByOrderID(int id);
}
