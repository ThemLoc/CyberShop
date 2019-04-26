package com.cybershop.daosImpl;

import com.cybershop.daos.BannerDAO;
import com.cybershop.models.Banner;
import com.cybershop.models.Product;
import com.cybershop.services.ProductService;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BannerDAOImpl implements BannerDAO {

    @PersistenceContext
    private EntityManager em;
    
    @Autowired
    private ProductService productService;

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
        List<Banner> listBanner = em.createQuery("from Banner").getResultList();
        List<Banner> newList = new ArrayList<>();
        Banner banner;
        if (!listBanner.isEmpty()) {
            for (Banner item : listBanner) {
                banner = new Banner();
                banner.setBanerID(item.getBanerID());
                Product pro = item.getProductID();
                Product newProduct =  productService.findById(pro.getProductID());
                banner.setProductID(newProduct);
                newList.add(banner);
            }
        }
        return newList;
    }

    @Override
    public Banner getById(int id) {
        return em.find(Banner.class, id);
    }

}
