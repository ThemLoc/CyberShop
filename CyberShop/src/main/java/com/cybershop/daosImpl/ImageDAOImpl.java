package com.cybershop.daosImpl;

import com.cybershop.daos.ImageDAO;
import com.cybershop.models.Image;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository
public class ImageDAOImpl implements ImageDAO {

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

    @Override
    public void updateMainImage(Image image) {
        try {
           int id = image.getProductID().getProductID();
           List<Image> list=  this.em.createNamedQuery("Image.checkMainImage")
                    .setParameter(1, id)
                    .getResultList();
            if (!list.isEmpty()) {
            this.em.createNamedQuery("Image.updateMainImage")
                    .setParameter(1, image.getUrlImage())
                    .setParameter(2, id)
                    .executeUpdate();
            } else {
                 this.em.createNativeQuery("INSERT INTO Image (productID, urlImage, mainImage) VALUES (?,?,?)")
                    .setParameter(1, id)
                    .setParameter(2, image.getUrlImage())
                    .setParameter(3, image.getMainImage())
                    .executeUpdate();
            }
        } catch (Exception e) {
            System.out.println("dao :" + e.getMessage());
        }

    }

    @Override
    public void updateSubImage(List<Image> list) {
        int id = list.get(0).getProductID().getProductID();
        this.em.createNativeQuery("Delete from Image where productID = ? and mainImage = 0")
                    .setParameter(1,id)
                    .executeUpdate();
        for(int i = 0; i < list.size(); i++) {
            this.em.createNativeQuery("INSERT INTO Image (productID, urlImage, mainImage) VALUES (?,?,?)")
                    .setParameter(1,id)
                    .setParameter(2, list.get(i).getUrlImage())
                    .setParameter(3, 0)
                    .executeUpdate();
        }
    }
}
