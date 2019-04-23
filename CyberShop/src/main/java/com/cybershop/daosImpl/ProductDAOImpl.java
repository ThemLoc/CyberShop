package com.cybershop.daosImpl;

import com.cybershop.models.Product;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import com.cybershop.daos.ProductDAO;
import com.cybershop.models.Image;
import java.util.ArrayList;

@Repository
public class ProductDAOImpl implements ProductDAO {

    @PersistenceContext
    private EntityManager em;

    @Override
    public void create(Product obj) {
        em.persist(obj);
    }

    @Override
    public void update(Product obj) {
        em.merge(obj);
    }

    @Override
    public void delete(int id) {
        em.remove(getById(id));
    }

    @Override
    public List<Product> getAll() {
        return em.createQuery("from Product").getResultList();
    }

    @Override
    public Product getById(int id) {
        Product product = em.find(Product.class, id);
        final Product dto = new Product();
        dto.setProductID(product.getProductID());
        dto.setProductName(product.getProductName());
        dto.setQuantity(product.getQuantity());
        dto.setSell(product.getSell());
        dto.setPrice(product.getPrice());
        dto.setDownPrice(product.getDownPrice());
        dto.setStatus(product.getStatus());
        dto.setBrandID(product.getBrandID());
        dto.setDownPrice(product.getDownPrice());
        dto.setDetail(product.getDetail());
        dto.setCategoryID(product.getCategoryID());
        List<Image> listImages = (List<Image>) product.getImagesCollection();
        List<Image> newList;
        if (!listImages.isEmpty()) {
            Image image;
            newList = new ArrayList<>();
            for (Image item : listImages) {
                image = new Image();
                image.setImageID(item.getImageID());
                image.setUrlImage(item.getUrlImage());
                image.setMainImage(item.getMainImage());
                newList.add(image);
            }
            dto.setImagesCollection(newList);
        }
        return dto;
    }

}
