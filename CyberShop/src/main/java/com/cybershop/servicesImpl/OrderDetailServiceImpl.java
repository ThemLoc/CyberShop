package com.cybershop.servicesImpl;

import com.cybershop.daos.OrderDetailDAO;
import com.cybershop.models.OrderDetail;
import com.cybershop.services.OrderDetailService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class OrderDetailServiceImpl implements OrderDetailService{
    
    @Autowired
    private OrderDetailDAO dao;

    @Transactional
    @Override
    public void save(OrderDetail obj) {
        dao.create(obj);
    }

    @Transactional
    @Override
    public void remove(int id) {
        dao.delete(id);
    }

    @Transactional(readOnly = true)
    @Override
    public OrderDetail findById(int id) {
        return dao.getById(id);
    }

    @Transactional(readOnly = true)
    @Override
    public List<OrderDetail> getByAll() {
        return dao.getAll();
    }

    @Transactional(readOnly = true)
    @Override
    public List<OrderDetail> findByOrderID(int id) {
        return dao.getByOrderID(id);
    }
    
}
