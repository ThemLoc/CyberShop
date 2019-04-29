package com.cybershop.daosImpl;

import com.cybershop.daos.BrandDAO;
import com.cybershop.dto.CountProductByBrandDTO;
import com.cybershop.models.Brand;
import com.cybershop.models.Product;
import com.cybershop.services.ProductService;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BrandDAOImpl implements BrandDAO {

    @PersistenceContext
    private EntityManager em;

    @Autowired
    ProductService service;

    @Override
    public void create(Brand obj) {
        em.persist(obj);
    }

    @Override
    public void update(Brand obj) {
        em.merge(obj);
    }

    @Override
    public void delete(int id) {
        em.remove(getById(id));
    }

    @Override
    public List<Brand> getAll() {
        return em.createQuery("from Brand").getResultList();
    }

    @Override
    public Brand getById(int id) {
        return em.find(Brand.class, id);
    }

    @Override
    public List<CountProductByBrandDTO> getCountproduct() {
        List<Brand> list = em.createQuery("from Brand").getResultList();
        List<CountProductByBrandDTO> listCount = new ArrayList<>();
        CountProductByBrandDTO dto;
        for (Brand item : list) {
            dto = new CountProductByBrandDTO();
            dto.setBrandID(item.getBrandID());
            dto.setCount(service.countPdByBrandID(item.getBrandID()));
            listCount.add(dto);
        }
        return listCount;
    }

}
