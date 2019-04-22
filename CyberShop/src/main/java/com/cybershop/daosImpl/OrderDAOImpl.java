package com.cybershop.daosImpl;

import com.cybershop.daos.OrderDAO;
import com.cybershop.models.Order;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAOImpl implements OrderDAO {

    @PersistenceContext
    private EntityManager em;

    @Override
    public void create(Order obj) {
        em.persist(obj);
    }

    @Override
    public void update(Order obj) {
        em.merge(obj);
    }

    @Override
    public void delete(int id) {
        em.remove(getById(id));
    }

    @Override
    public List<Order> getAll() {
        List<Order> list = em.createQuery("from Order").getResultList();
        List<Order> newList = new ArrayList<>();
        Order order;
        if (!list.isEmpty()) {
            for (Order item : list) {
                order = new Order();
                order.setOrderID(item.getOrderID());
                order.setCustomerID(item.getCustomerID());
                order.setShipAddress(item.getShipAddress());
                order.setPromotionID(item.getPromotionID());
                order.setOrderDate(item.getOrderDate());
                order.setDeliveryFee(item.getDeliveryFee());
                order.setStatus(item.getStatus());
                order.setTotal(item.getTotal());
                order.setOrderDetailCollection(item.getOrderDetailCollection());
                newList.add(order);
            }
        }
        return newList;
    }

    @Override
    public Order getById(int id) {
        return em.find(Order.class, id);
    }

}
