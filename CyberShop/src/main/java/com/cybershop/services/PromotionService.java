package com.cybershop.services;

import com.cybershop.models.Promotion;
import java.util.List;

public interface PromotionService {
    void save(Promotion obj);
    void remove(int id);
    Promotion findById(int id);
    List<Promotion> getByAll();
}
