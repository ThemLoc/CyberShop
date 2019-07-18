package com.cybershop.services;

import com.cybershop.models.CartItem;
import com.cybershop.models.Customer;
import com.cybershop.models.Customer_2;
import com.cybershop.models.Order;
import com.cybershop.models.RequestWrapperCustomer;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface OrderService {

    void save(Order obj);

    void remove(int id);

    Order findById(int id);

    List<Order> getByAll();

    void sendEmailOrder(String from, String to, String subject, String content);

    List<Order> findByCusID(int id);

    void updateStatus(String status, int id);

    String collectItems(HttpSession session, Order order, HttpServletRequest request, Customer cust);
    String collectItems2(Order order, RequestWrapperCustomer custCart);

    void emptyCart(HttpSession session);
    void updateOrderBycus(int idOrder, int idCustomer);
    Order getOrderCurrent();
}
