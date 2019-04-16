package com.cybershop.daosImpl;

import com.cybershop.daos.BannerDAO;
import com.cybershop.models.Banner;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository
public class BannerDAOImpl implements BannerDAO {

    @PersistenceContext
    private EntityManager em;

    @Override
    public void create(Banner obj) {
        em.persist(obj);
    }

    @Override
    public void update(Banner obj) {
        em.merge(obj);
    }

    @Override
    public void delete(int id) {
        em.remove(getById(id));
    }

    @Override
    public List<Banner> getAll() {
        return em.createQuery("from Banner").getResultList();
    }

    @Override
    public Banner getById(int id) {
        return em.find(Banner.class, id);
    }

}
