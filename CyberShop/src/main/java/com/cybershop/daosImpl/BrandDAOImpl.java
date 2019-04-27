package com.cybershop.daosImpl;

import com.cybershop.daos.BrandDAO;
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
    private ProductService service;

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
        Brand brand = em.find(Brand.class, id);
        Brand newBrand = new Brand();
        if (brand != null) {
            newBrand.setBrandID(brand.getBrandID());
            newBrand.setBrandName(brand.getBrandName());
            newBrand.setImageURL(brand.getImageURL());
            List<Product> list = (List<Product>) brand.getProductCollection();
            List<Product> newList = new ArrayList<>();
            for (Product item : list) {
                Product pro = service.findById(item.getProductID());
                newList.add(pro);
            }
            newBrand.setProductCollection(newList);
//            newBrand.setProductCollection(brand.getProductCollection());
        }
        return newBrand;
    }

}
