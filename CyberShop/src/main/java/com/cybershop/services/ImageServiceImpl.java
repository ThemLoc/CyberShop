/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cybershop.services;

import com.cybershop.interfacedao.ServiceBasic;
import com.cybershop.daos.ImageDAO;
import com.cybershop.models.Image;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ngthe
 */
@Service
public class ImageServiceImpl implements ServiceBasic<Image>{
    
    @Autowired
    private ImageDAO dao;

    @Transactional
    @Override
    public void save(Image obj) {
        dao.create(obj);
    }

    @Transactional
    @Override
    public void remove(int id) {
        dao.delete(id);
    }

    @Transactional(readOnly = true)
    @Override
    public Image findById(int id) {
        return dao.getById(id);
    }

    @Transactional(readOnly = true)
    @Override
    public List<Image> getByAll() {
        return dao.getAll();
    }
    
}
