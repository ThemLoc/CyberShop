package com.cybershop.daosImpl;

import com.cybershop.daos.PromotionDAO;
import com.cybershop.models.Promotion;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository
public class PromotionDAOImpl implements PromotionDAO {

    @PersistenceContext
    private EntityManager em;

    @Override
    public void create(Promotion obj) {
        em.persist(obj);
    }

    @Override
    public void update(Promotion obj) {
        em.merge(obj);
    }

    @Override
    public void delete(int id) {
        em.remove(getById(id));
    }

    @Override
    public List<Promotion> getAll() {
        return em.createQuery("from Promotion").getResultList();
    }

    @Override
    public Promotion getById(int id) {
        return em.find(Promotion.class, id);
    }

    @Override
    public Promotion getByPromoCode(String promoCode) {
        try {
            return (Promotion) em.createNamedQuery("Promotion.findByPromoCode").setParameter("promoCode", promoCode).getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

}
