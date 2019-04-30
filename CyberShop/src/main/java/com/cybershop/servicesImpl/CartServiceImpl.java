package com.cybershop.servicesImpl;

import com.cybershop.daos.CartDAO;
import com.cybershop.models.Cart;
import com.cybershop.services.CartService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CartServiceImpl implements CartService{
    
    @Autowired
    private CartDAO dao;

    @Transactional
    @Override
    public void save(Cart obj) {
        if(obj.getCustomerID().getCustomerID() != null){
            dao.update(obj);
        }else{
             dao.create(obj);
        }
       
    }

    @Transactional
    @Override
    public void remove(int id) {
        dao.delete(id);
    }

    @Transactional(readOnly = true)
    @Override
    public Cart findById(int id) {
        return dao.getById(id);
    }

    @Transactional(readOnly = true)
    @Override
    public List<Cart> getByAll() {
        return dao.getAll();
    }
    
}
