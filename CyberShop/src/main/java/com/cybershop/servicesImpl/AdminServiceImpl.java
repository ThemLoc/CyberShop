/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cybershop.servicesImpl;

import com.cybershop.daos.AdminDAO;
import com.cybershop.models.Admin;
import com.cybershop.services.AdminService;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AdminServiceImpl implements AdminService{
    
    @Autowired
    private AdminDAO dao;

    @Transactional
    @Override
    public void save(Admin obj) {
        if(obj.getAdminID() == null){
            dao.create(obj);
        }else{
            dao.update(obj);
        }
        
    }

    @Transactional
    @Override
    public void remove(int id) {
        dao.delete(id);
    }

    @Transactional(readOnly = true)
    @Override
    public Admin findById(int id) {
        return dao.getById(id);
    }

    @Transactional(readOnly = true)
    @Override
    public List<Admin> getByAll() {
        return dao.getAll();
    }

    @Transactional(readOnly = true)
    @Override
    public Admin login(Admin admin) {
       
        return dao.checkLogin(admin);
    }

    
}
