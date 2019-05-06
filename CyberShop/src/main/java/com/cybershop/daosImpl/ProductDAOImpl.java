package com.cybershop.daosImpl;

import com.cybershop.models.Product;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import com.cybershop.daos.ProductDAO;
import com.cybershop.models.Banner;
import com.cybershop.models.Category;
import com.cybershop.models.Image;
import com.cybershop.services.BannerService;
import com.cybershop.services.ProductService;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;

@Repository
public class ProductDAOImpl implements ProductDAO {

    @PersistenceContext
    private EntityManager em;

    @Autowired
    private ProductService proService;

    @Autowired
    private BannerService banService;

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
        Category category = product.getCategoryID();
        Category category1 = new Category();
        category1.setCateID(category.getCateID());
        category1.setCateName(category.getCateName());
        category1.setType(category.getType());
        dto.setCategoryID(category1);

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
    public int countPdByCateID(int cateID) {
        long resultL = (long) this.em.createQuery("Select COUNT(categoryID) from Product where CategoryID = ?")
                .setParameter(1, cateID)
                .getSingleResult();
        int resultInt = (int) resultL;
        return resultInt;
    }

    public List<Product> getProductNotInBanner() {
        List<Product> list = em.createQuery("from Product").getResultList();
        List<Product> newList = new ArrayList<>();
        Product product;
        List<Banner> listBanner = banService.getByAll();
        if (!list.isEmpty()) {
            for (Product item : list) {
                product = new Product();
                product = proService.findById(item.getProductID());
                newList.add(product);
                for (Banner banItem : listBanner) {
                    if (product.getProductID() == banItem.getProductID().getProductID()) {
                        newList.remove(product);
                    }
                }
            }
        }
        return newList;
    }

    @Override
    public List<Product> findTop6ProductWithCateID(int cateID) {
        List<Product> listPro = this.em.createQuery("from Product where CategoryID = ? and Status = 1 order by ProductID DESC")
                .setParameter(1, cateID).getResultList();
        List<Product> newListPro = new ArrayList<>();
        Product newpProduct;
        for (Product product : listPro) {
//            newpProduct = new Product();
            newpProduct = proService.findById(product.getProductID());
            newListPro.add(newpProduct);
        }
        return newListPro;
    }

    @Override
    public int countPdByBrandID(int brandID) {
        long resultL = (long) this.em.createQuery("Select COUNT(BrandID) from Product where BrandID = ?")
                .setParameter(1, brandID)
                .getSingleResult();
        int resultInt = (int) resultL;
        return resultInt;
    }

    @Override
    public Product getByIDSimple(int id) {
        Product product = em.find(Product.class, id);
        final Product dto = new Product();
        dto.setProductID(product.getProductID());
        dto.setProductName(product.getProductName());
        dto.setSell(product.getSell());
        dto.setPrice(product.getPrice());
        dto.setQuantity(product.getQuantity());
        dto.setDownPrice(product.getDownPrice());
        dto.setBrandID(product.getBrandID());

        List<Image> listImages = (List<Image>) product.getImagesCollection();
        List<Image> newList;
        if (!listImages.isEmpty()) {
            Image image;
            newList = new ArrayList<>();
            for (Image item : listImages) {
                if (item.getMainImage() == true) {
                    image = new Image();
                    image.setImageID(item.getImageID());
                    image.setUrlImage(item.getUrlImage());
                    image.setMainImage(item.getMainImage());
                    newList.add(image);
                }
            }
            dto.setImagesCollection(newList);
        }
        return dto;
    }

    @Override
    public void updateProductQuantity(int idProduct, int quantity, int sell) {
        this.em.createQuery("update Product set Sell = ?, Quantity = ? where ProductID = ?")
                .setParameter(1, sell).setParameter(2, quantity).setParameter(3, idProduct).executeUpdate();
    }
    

}
