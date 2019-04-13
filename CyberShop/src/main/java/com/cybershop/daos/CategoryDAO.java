
package com.cybershop.daos;

import com.cybershop.models.Category;
import com.cybershop.interfacedao.InterfaceBasicDAO;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDAO implements InterfaceBasicDAO<Category>{

    @PersistenceContext
    private EntityManager em;
    @Override
    public void create(Category obj) {
        em.persist(obj);
    }

    @Override
    public void update(Category obj) {
        em.merge(obj);
    }

    @Override
    public void delete(int id) {
        em.remove(getById(id));
    }

    @Override
    public List<Category> getAll() {
        return em.createQuery("from Category").getResultList();
    }

    @Override
    public Category getById(int id) {
        return em.find(Category.class, id);
    }
    
    
    
    
}
