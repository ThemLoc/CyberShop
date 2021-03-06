package com.cybershop.daos;

import com.cybershop.models.Product;
import java.util.List;

public interface ProductDAO {

    void create(Product obj);

    void update(Product obj);

    void delete(int id);

    List<Product> getAll();

    Product getById(int id);

    Product getByIdNormal(int id);

    void updateStatus(int id, boolean status);

    void updateOtherInfo(Product obj);

    void updateSpecification(int productID, int cateID, String detail);

    int countPdByCateID(int cateID);

    int countPdByBrandID(int brandID);

    List<Product> getProductNotInBanner();

    List<Product> findTop6ProductWithCateID(int cateID);
    
    List<Product> findAllProductWithBrandID(int brandID);

    List<Product> getNewProduct(int number);

    List<Product> getHotSaleProduct(int number);

    List<Product> getSellProduct(int number);
    
    List<Product> searchProduct(int cateID, String search);
    
    Product getByIDSimple(int id);
    
    void updateProductQuantity(int idProduct, int quantity, int sell);
}
