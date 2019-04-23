package com.cybershop.daosImpl;

import com.cybershop.daos.CustomerDAO;
import com.cybershop.models.Customer;
import com.cybershop.models.Order;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

    @PersistenceContext
    private EntityManager em;

    @Override
    public void create(Customer obj) {
        em.persist(obj);
    }

    @Override
    public void update(Customer obj) {
        em.merge(obj);
    }

    @Override
    public void delete(int id) {
        em.remove(getById(id));
    }

    @Override
    public List<Customer> getAll() {
        return em.createQuery("from Customer").getResultList();
    }

    @Override
    public Customer getById(int id) {
        Customer cus = em.find(Customer.class, id);
        Customer newCus = new Customer();
        newCus.setCustomerID(cus.getCustomerID());
        newCus.setEmail(cus.getEmail());
        newCus.setFullname(cus.getFullname());
        newCus.setPhone(cus.getPhone());
        newCus.setAddress(cus.getAddress());
        newCus.setDob(cus.getDob());
        List<Order> listOrder = (List<Order>) cus.getOrder1Collection();
        List<Order> newList;
        if (!listOrder.isEmpty()) {
            Order order;
            newList = new ArrayList<>();
            for (Order item : listOrder) {
                order = new Order();
                order.setCustomerID(item.getCustomerID());
                newList.add(order);
            }
            newCus.setOrder1Collection(newList);
        }
        return newCus;
    }

}
