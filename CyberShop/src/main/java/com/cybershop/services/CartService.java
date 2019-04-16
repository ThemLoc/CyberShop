/*
 * Carto change this license header, choose License Headers in Project Properties.
 * Carto change this template file, choose Cartools | Cartemplates
 * and open the template in the editor.
 */
package com.cybershop.services;

import com.cybershop.models.Cart;
import java.util.List;

/**
 *
 * @author chungnguyen
 */
public interface CartService {
     void save(Cart obj);
    void remove(int id);
    Cart findById(int id);
    List<Cart> getByAll();
}
