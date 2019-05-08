package com.cybershop.daos;

import com.cybershop.models.Order;
import java.util.List;

public interface OrderDAO {

    void create(Order obj);

    void update(Order obj);

    void delete(int id);

    List<Order> getAll();

    Order getById(int id);
    List<Order> getByCusID(int id);
    void updateStatus(String status, int id);
    Order OrderCurrent();
    void updateOrderByCustomer(int idOrder, int idCustomer);
}
