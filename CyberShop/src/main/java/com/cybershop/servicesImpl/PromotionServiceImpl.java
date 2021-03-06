package com.cybershop.servicesImpl;

import com.cybershop.daos.PromotionDAO;
import com.cybershop.models.Promotion;
import com.cybershop.services.PromotionService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PromotionServiceImpl implements PromotionService {

    @Autowired
    private PromotionDAO dao;

    @Transactional
    @Override
    public void save(Promotion obj) {
        if (obj.getPromoID() != null) {
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
    public Promotion findById(int id) {
        return dao.getById(id);
    }

    @Transactional(readOnly = true)
    @Override
    public List<Promotion> getByAll() {
        return dao.getAll();
    }

    @Transactional(readOnly = true)
    @Override
    public Promotion getByPromoCode(String promoCode) {
        return dao.getByPromoCode(promoCode);
    }

}
