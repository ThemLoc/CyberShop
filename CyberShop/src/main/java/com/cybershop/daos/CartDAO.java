
package com.cybershop.daos;

import com.cybershop.models.Cart;
import com.cybershop.interfacedao.InterfaceBasicDAO;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO implements InterfaceBasicDAO<Cart>{

    @PersistenceContext
    private EntityManager em;
    @Override
    public void create(Cart obj) {
        em.persist(obj);
    }

    @Override
    public void update(Cart obj) {
        em.merge(obj);
    }

    @Override
    public void delete(int id) {
        em.remove(getById(id));
    }

    @Override
    public List<Cart> getAll() {
        return em.createQuery("from Cart").getResultList();
    }

    @Override
    public Cart getById(int id) {
        return em.find(Cart.class, id);
    }
    
    
    
    
}
