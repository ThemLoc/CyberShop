package com.cybershop.daosImpl;

import com.cybershop.daos.AdminDAO;
import com.cybershop.models.Admin;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO {

    @PersistenceContext
    private EntityManager em;

    @Override
    public void create(Admin obj) {
        em.persist(obj);
    }

    @Override
    public void update(Admin obj) {
        em.merge(obj);
    }

    @Override
    public void delete(int id) {
        em.remove(getById(id));
    }

    @Override
    public List<Admin> getAll() {
        return em.createQuery("from Admin").getResultList();
    }

    @Override
    public Admin getById(int id) {
        return em.find(Admin.class, id);
    }

}
