package com.cybershop.servicesImpl;

import com.cybershop.daos.ProductDAO;
import com.cybershop.services.ProductService;
import com.cybershop.models.Product;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDAO dao;

    @Transactional
    @Override
    public void save(Product obj) {
        dao.create(obj);
    }

    @Transactional
    @Override
    public void remove(int id) {
        dao.delete(id);
    }

    @Transactional(readOnly = true)
    @Override
    public Product findById(int id) {
        return dao.getById(id);
    }

    @Transactional(readOnly = true)
    @Override
    public List<Product> getByAll() {
        return dao.getAll();
    }

    @Transactional
    @Override
    public void changeStatus(int id, boolean status) {
        dao.updateStatus(id, status);
    }

    @Transactional
    @Override
    public void updateOtherInfo(Product obj) {
        dao.updateOtherInfo(obj);
    }

    @Transactional
    @Override
    public void updateSpecification(int productID, int cateID, String detail) {
        dao.updateSpecification(productID, cateID, detail);
    }

    @Transactional
    @Override
    public List<Product> findProductNotInBanner() {
        return dao.getProductNotInBanner();
    }

    @Transactional
    @Override
    public int countByCateID(int cateID) {
        return dao.countPdByCateID(cateID);
    }

    @Transactional
    @Override
    public List<Product> findTop6ProductWithCateID(int cateID) {
        return dao.findTop6ProductWithCateID(cateID);
    }
    
    @Transactional
    @Override
    public int countPdByBrandID(int brandID) {
        return dao.countPdByBrandID(brandID);
    }

    @Transactional
    @Override
    public Product findByIdSimple(int id) {
        return dao.getByIDSimple(id);
    }

}
