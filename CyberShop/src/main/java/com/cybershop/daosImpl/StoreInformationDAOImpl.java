package com.cybershop.daosImpl;

import com.cybershop.daos.StoreInformationDAO;
import com.cybershop.models.StoreInformation;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository
public class StoreInformationDAOImpl implements StoreInformationDAO {

    @PersistenceContext
    private EntityManager em;

    @Override
    public void create(StoreInformation obj) {
        em.persist(obj);
    }

    @Override
    public void update(StoreInformation obj) {
        em.merge(obj);
    }

    @Override
    public void delete(int id) {
        em.remove(getById(id));
    }

    @Override
    public List<StoreInformation> getAll() {
        return em.createQuery("from StoreInformation").getResultList();
    }

    @Override
    public StoreInformation getById(int id) {
        return em.find(StoreInformation.class, id);
    }

}
