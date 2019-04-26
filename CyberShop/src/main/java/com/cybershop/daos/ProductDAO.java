package com.cybershop.daos;

import com.cybershop.models.Product;
import java.util.List;

public interface ProductDAO {

    void create(Product obj);

    void update(Product obj);

    void delete(int id);

    List<Product> getAll();

    Product getById(int id);
    
    List<Product> getProductNotInBanner();
}
