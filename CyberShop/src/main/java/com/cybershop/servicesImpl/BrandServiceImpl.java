package com.cybershop.servicesImpl;

import com.cybershop.daos.BrandDAO;
import com.cybershop.dto.CountProductByBrandDTO;
import com.cybershop.models.Brand;
import com.cybershop.services.BrandService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BrandServiceImpl implements BrandService{
    
    @Autowired
    private BrandDAO dao;

    @Transactional
    @Override
    public void save(Brand obj) {
        dao.create(obj);
    }

    @Transactional
    @Override
    public void remove(int id) {
        dao.delete(id);
    }

    @Transactional(readOnly = true)
    @Override
    public Brand findById(int id) {
        return dao.getById(id);
    }

    @Transactional(readOnly = true)
    @Override
    public List<Brand> getByAll() {
        return dao.getAll();
    }

    @Transactional
    @Override
    public List<CountProductByBrandDTO> getCountproduct() {
        return dao.getCountproduct();
    }
    
}
