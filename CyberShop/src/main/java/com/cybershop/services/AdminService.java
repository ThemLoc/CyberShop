package com.cybershop.services;

import com.cybershop.models.Admin;
import java.util.List;

public interface AdminService {
    void save(Admin obj);
    void remove(int id, boolean status);
    Admin findById(int id);
    List<Admin> getByAll();
    Admin login(Admin admin);
    Admin getByUser(String username);
}
