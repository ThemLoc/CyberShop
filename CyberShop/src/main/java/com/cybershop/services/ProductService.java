package com.cybershop.services;

import com.cybershop.models.Product;
import java.util.List;

public interface ProductService {

    void save(Product obj);

    void remove(int id);

    Product findById(int id);

    List<Product> getByAll();

    void changeStatus(int id, boolean status);

    void updateOtherInfo(Product obj);

    void updateSpecification(int productID, int cateID, String detail);

    int countByCateID(int cateID);

    int countPdByBrandID(int brandID);

    List<Product> findProductNotInBanner();

    List<Product> findTop6ProductWithCateID(int cateID);
    
    List<Product> findAllProductWithBrandID(int brandID);

    List<Product> findNewProduct(int number);

    List<Product> findHotSaleProduct(int number);
    
    List<Product> findSellProduct(int number);
    
    List<Product> searchProduct(int cateID, String search);

    Product findByIdSimple(int id);
    
    void UpdateQuantityProduct(int idProduct, int quantity, int sell);
}
