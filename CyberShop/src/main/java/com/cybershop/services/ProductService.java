/*
 * Producto change this license header, choose License Headers in Project Properties.
 * Producto change this template file, choose Productools | Productemplates
 * and open the template in the editor.
 */
package com.cybershop.services;

import com.cybershop.models.Product;
import java.util.List;

/**
 *
 * @author chungnguyen
 */
public interface ProductService {
     void save(Product obj);
    void remove(int id);
    Product findById(int id);
    List<Product> getByAll();
    List<Product> findProductNotInBanner();
}
