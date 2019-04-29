package com.cybershop.servicesImpl;

import com.cybershop.daos.BannerDAO;
import com.cybershop.models.Banner;
import com.cybershop.services.BannerService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BannerServiceImpl implements BannerService{
    
    @Autowired
    private BannerDAO dao;

    @Transactional
    @Override
    public void save(Banner obj) {
        dao.create(obj);
    }

    @Transactional
    @Override
    public void remove(int id) {
        dao.delete(id);
    }

    @Transactional(readOnly = true)
    @Override
    public Banner findById(int id) {
        return dao.getById(id);
    }

    @Transactional(readOnly = true)
    @Override
    public List<Banner> getByAll() {
        return dao.getAll();
    }
}
