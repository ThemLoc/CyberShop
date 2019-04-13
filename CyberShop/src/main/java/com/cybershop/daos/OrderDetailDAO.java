
package com.cybershop.daos;

import com.cybershop.models.OrderDetail;
import com.cybershop.interfacedao.InterfaceBasicDAO;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDetailDAO implements InterfaceBasicDAO<OrderDetail>{

    @PersistenceContext
    private EntityManager em;
    @Override
    public void create(OrderDetail obj) {
        em.persist(obj);
    }

    @Override
    public void update(OrderDetail obj) {
        em.merge(obj);
    }

    @Override
    public void delete(int id) {
        em.remove(getById(id));
    }

    @Override
    public List<OrderDetail> getAll() {
        return em.createQuery("from OrderDetail").getResultList();
    }

    @Override
    public OrderDetail getById(int id) {
        return em.find(OrderDetail.class, id);
    }
    
    
    
    
}
