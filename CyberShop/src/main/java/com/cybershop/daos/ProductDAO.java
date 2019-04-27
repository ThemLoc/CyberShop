package com.cybershop.daos;

import com.cybershop.models.Image;
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

    
    List<Product> getProductNotInBanner();
}
