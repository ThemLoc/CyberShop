package com.cybershop.servicesImpl;

import com.cybershop.daos.StoreInformationDAO;
import com.cybershop.models.StoreInformation;
import com.cybershop.services.StoreInformationService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class StoreInformationServiceImpl implements StoreInformationService{
    
    @Autowired
    private StoreInformationDAO dao;

    @Transactional
    @Override
    public void save(StoreInformation obj) {
        if (obj.getStoreID() != null) {
            dao.update(obj);
        } else {
            dao.create(obj);
        }
    }

    @Transactional
    @Override
    public void remove(int id) {
        dao.delete(id);
    }

    @Transactional(readOnly = true)
    @Override
    public StoreInformation findById(int id) {
        return dao.getById(id);
    }

    @Transactional(readOnly = true)
    @Override
    public List<StoreInformation> getByAll() {
        return dao.getAll();
    }
    
}
