package com.cybershop.servicesImpl;

import com.cybershop.daos.CustomerDAO;
import com.cybershop.models.Customer;
import com.cybershop.services.CustomerService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CustomerServiceImpl implements CustomerService{
    
    @Autowired
    private CustomerDAO dao;

    @Transactional
    @Override
    public void save(Customer obj) {
        if(obj.getCustomerID() == null){
            dao.create(obj);
        }else{
            dao.update(obj);
        }
       
    }

    @Transactional
    @Override
    public void updateStatus(int id, boolean status) {
        dao.updateStatus(id, status);
    }

    @Transactional(readOnly = true)
    @Override
    public Customer findById(int id) {
        return dao.getById(id);
    }

    @Transactional(readOnly = true)
    @Override
    public List<Customer> getByAll() {
        return dao.getAll();
    }

    @Transactional(readOnly = true)
    @Override
    public Customer getByUser(String username) {
        return dao.getByUsername(username);
    }

    @Transactional
    @Override
    public Customer checkLogin(String user, String pass) {
        return dao.checkLogin(user, pass);
    }
}
