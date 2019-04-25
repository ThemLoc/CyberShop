package com.cybershop.daosImpl;

import com.cybershop.daos.OrderDAO;
import com.cybershop.models.Order;
import com.cybershop.models.OrderDetail;
import com.cybershop.services.OrderDetailService;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAOImpl implements OrderDAO {

    @PersistenceContext
    private EntityManager em;

    @Autowired
    private OrderDetailService ods;

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
        Order order = em.find(Order.class, id);
        Order newOrder = new Order();
        if (order != null) {
            newOrder.setOrderID(order.getOrderID());
            newOrder.setDeliveryFee(order.getDeliveryFee());
            newOrder.setOrderDate(order.getOrderDate());
            newOrder.setPromotionID(order.getPromotionID());
            newOrder.setShipAddress(order.getShipAddress());
            newOrder.setStatus(order.getStatus());
            newOrder.setTotal(order.getTotal());
            newOrder.setCustomerID(order.getCustomerID());
//            List<OrderDetail> listOD = (List<OrderDetail>) order.getOrderDetailCollection();
            List<OrderDetail> newListOD = ods.findByOrderID(order.getOrderID());
            newOrder.setOrderDetailCollection(newListOD);
        }
        return newOrder;
    }

    @Override
    public List<Order> getByCusID(int id) {
        List<Order> list = em.createNamedQuery("Order.findByCustomerID").setParameter("customerID", id).getResultList();
        System.out.println("GetByCusID " + list.size());
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
    public void updateStatus(String status, int id) {
        em.createNamedQuery("Order.updateStatus").setParameter(1, status).setParameter(2, id).executeUpdate();
    }

}
