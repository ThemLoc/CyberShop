package com.cybershop.daos;

import com.cybershop.models.Admin;
import java.util.List;

public interface AdminDAO {

    void create(Admin obj);

    void update(Admin obj);

    void delete(int id);

    List<Admin> getAll();

    Admin getById(int id);
    
    Admin checkLogin(Admin admin);
    
    Admin getByUsername(String username);
}
