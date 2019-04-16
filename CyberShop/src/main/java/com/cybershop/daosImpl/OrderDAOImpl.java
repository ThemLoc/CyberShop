package com.cybershop.daosImpl;

import com.cybershop.daos.OrderDAO;
import com.cybershop.models.Order;
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
        return em.createQuery("from Order").getResultList();
    }

    @Override
    public Order getById(int id) {
        return em.find(Order.class, id);
    }

}
