package com.cybershop.services;

import com.cybershop.models.Cart;
import java.util.List;

public interface CartService {
     void save(Cart obj);
    void remove(int id);
    Cart findById(int id);
    List<Cart> getByAll();
}
