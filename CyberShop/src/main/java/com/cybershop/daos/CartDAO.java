package com.cybershop.daos;

import com.cybershop.models.Cart;
import java.util.List;

public interface CartDAO {

    void create(Cart obj);

    void update(Cart obj);

    void delete(int id);

    List<Cart> getAll();

    Cart getById(int id);
}
