package com.cybershop.daosImpl;

import com.cybershop.daos.CartDAO;
import com.cybershop.models.Cart;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAOImpl implements CartDAO {

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
