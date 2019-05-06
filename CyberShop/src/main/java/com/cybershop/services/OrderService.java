/*
 * Ordero change this license header, choose License Headers in Project Properties.
 * Ordero change this template file, choose Orderools | Orderemplates
 * and open the template in the editor.
 */
package com.cybershop.services;

import com.cybershop.models.Customer;
import com.cybershop.models.Order;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author chungnguyen
 */
public interface OrderService {

    void save(Order obj);

    void remove(int id);

    Order findById(int id);

    List<Order> getByAll();

    void sendEmailOrder(String from, String to, String subject, String content);

    List<Order> findByCusID(int id);

    void updateStatus(String status, int id);

    String collectItems(HttpSession session, Order order, HttpServletRequest request, Customer cust);

    void emptyCart(HttpSession session);
}
