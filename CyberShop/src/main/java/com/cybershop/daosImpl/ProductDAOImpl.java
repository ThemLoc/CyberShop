package com.cybershop.daosImpl;

import com.cybershop.models.Product;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import com.cybershop.daos.ProductDAO;
import com.cybershop.dto.CountDTO;
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

    @Override
    public void updateStatus(int id, boolean status) {
        this.em.createNamedQuery("Product.updateStatus")
                .setParameter("status", status)
                .setParameter("productID", id)
                .executeUpdate();
    }

    @Override
    public Product getByIdNormal(int id) {
        return em.find(Product.class, id);
    }

    @Override
    public void updateOtherInfo(Product obj) {
        try {
            this.em.createNamedQuery("Product.updateOther")
                    .setParameter("productName", obj.getProductName())
                    .setParameter("brandID", obj.getBrandID().getBrandID())
                    .setParameter("price", obj.getPrice())
                    .setParameter("downPrice", obj.getDownPrice())
                    .setParameter("quantity", obj.getQuantity())
                    .setParameter("productID", obj.getProductID())
                    .executeUpdate();
        } catch (Exception e) {
            System.out.println("ERROR :" + e.getMessage());
        }

    }

    @Override
    public void updateSpecification(int productID, int cateID, String detail) {
        this.em.createNamedQuery("Product.updateSpec")
                .setParameter("detail", detail)
                .setParameter("cateID", cateID)
                .setParameter("productID", productID)
                .executeUpdate();
    }

    @Override
    public int countPdByCateID() {
        return (int) this.em.createQuery("Select COUNT(categoryID) from Product group by categoryID").getSingleResult();
    }

  

}
