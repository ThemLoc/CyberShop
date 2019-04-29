package com.cybershop.servicesImpl;

import com.cybershop.daos.CategoryDAO;
import com.cybershop.dto.CountProductByCateDTO;
import com.cybershop.models.Category;
import com.cybershop.services.CategoryService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryDAO dao;

    @Transactional
    @Override
    public void save(Category obj) {
        dao.create(obj);
    }

    @Transactional
    @Override
    public void remove(int id) {
        dao.delete(id);
    }

    @Transactional(readOnly = true)
    @Override
    public Category findById(int id) {
        return dao.getById(id);
    }

    @Transactional(readOnly = true)
    @Override
    public List<Category> getByAll() {
        return dao.getAll();
    }

    @Transactional(readOnly = true)
    @Override
    public List<Category> getAllCateWithSpec() {
        return dao.getAllWithSpec();
    }

    @Override
    public List<CountProductByCateDTO> getCountproduct() {
        return  dao.getCountproduct();
    }

//    @Override
//    public int addCategory(String cateName, int type) {
//        return dao.addCategory(cateName, type);
//    }

 
}
