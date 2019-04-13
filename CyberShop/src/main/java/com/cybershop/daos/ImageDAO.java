
package com.cybershop.daos;

import com.cybershop.models.Image;
import com.cybershop.interfacedao.InterfaceBasicDAO;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository
public class ImageDAO implements InterfaceBasicDAO<Image>{

    @PersistenceContext
    private EntityManager em;
    @Override
    public void create(Image obj) {
        em.persist(obj);
    }

    @Override
    public void update(Image obj) {
        em.merge(obj);
    }

    @Override
    public void delete(int id) {
        em.remove(getById(id));
    }

    @Override
    public List<Image> getAll() {
        return em.createQuery("from Image").getResultList();
    }

    @Override
    public Image getById(int id) {
        return em.find(Image.class, id);
    }
    
    
    
    
}
