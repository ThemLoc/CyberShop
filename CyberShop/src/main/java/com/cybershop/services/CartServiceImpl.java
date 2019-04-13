/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cybershop.services;

import com.cybershop.interfacedao.ServiceBasic;
import com.cybershop.daos.CartDAO;
import com.cybershop.models.Cart;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ngthe
 */
@Service
public class CartServiceImpl implements ServiceBasic<Cart>{
    
    @Autowired
    private CartDAO dao;

    @Transactional
    @Override
    public void save(Cart obj) {
        dao.create(obj);
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
