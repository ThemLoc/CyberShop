package com.cybershop.servicesImpl;

import com.cybershop.daos.SpecificationTitleDAO;
import com.cybershop.models.SpecificationTitle;
import com.cybershop.services.SpecificationTitleService;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class SpecificationTitleServiceImpl implements SpecificationTitleService {

    @Autowired
    private SpecificationTitleDAO dao;

    @Transactional
    @Override
    public void save(SpecificationTitle obj) {
        dao.create(obj);
    }

    @Transactional
    @Override
    public void remove(int id) {
        dao.delete(id);
    }

    @Transactional(readOnly = true)
    @Override
    public SpecificationTitle findById(int id) {
        return dao.getById(id);
    }

    @Transactional(readOnly = true)
    @Override
    public List<SpecificationTitle> getByAll() {
        return dao.getAll();
    }

    @Transactional(readOnly = true)
    @Override
    public List<SpecificationTitle> getByCategory(int id) {
        return dao.getByCateID(id);
    }

//    @Override
//    public void addSpec(String specName, int cateID) {
//        dao.addSpec(specName, cateID);
//    }

    @Transactional
    @Override
    public void removeByCateID(int cateID) {
        dao.deleteByCateID(cateID);
    }

   
    
}
