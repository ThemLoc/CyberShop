/*
 * Admino change this license header, choose License Headers in Project Properties.
 * Admino change this template file, choose Adminools | Adminemplates
 * and open the template in the editor.
 */
package com.cybershop.services;

import com.cybershop.models.Admin;
import java.util.List;

/**
 *
 * @author chungnguyen
 */
public interface AdminService {
    void save(Admin obj);
    void remove(int id, boolean status);
    Admin findById(int id);
    List<Admin> getByAll();
    Admin login(Admin admin);
    Admin getByUser(String username);
}
