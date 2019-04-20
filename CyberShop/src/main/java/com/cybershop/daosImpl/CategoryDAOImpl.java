package com.cybershop.daosImpl;

import com.cybershop.daos.CategoryDAO;
import com.cybershop.models.Category;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDAOImpl implements CategoryDAO {

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
        List<Category> list = em.createQuery("from Category").getResultList();
        List<Category> newList = new ArrayList<>();
        Category category;
        if (!list.isEmpty()) {
            for (Category item : list) {
                category = new Category();
                category.setCateID(item.getCateID());
                category.setCateName(item.getCateName());
                newList.add(category);
            }
        }
        return newList;
    }

    @Override
    public Category getById(int id) {
        return em.find(Category.class, id);
    }

}
