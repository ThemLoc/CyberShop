package com.cybershop.daosImpl;

import com.cybershop.daos.CustomerDAO;
import com.cybershop.models.Customer;
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
        return em.find(Customer.class, id);
    }

}
