package com.cybershop.daos;

import com.cybershop.models.OrderDetail;
import java.util.List;

public interface OrderDetailDAO {

    void create(OrderDetail obj);

    void update(OrderDetail obj);

    void delete(int id);

    List<OrderDetail> getAll();

    OrderDetail getById(int id);
    
    List<OrderDetail> getByOrderID(int id);
}
