/*
 * Promotiono change this license header, choose License Headers in Project Properties.
 * Promotiono change this template file, choose Promotionools | Promotionemplates
 * and open the template in the editor.
 */
package com.cybershop.services;

import com.cybershop.models.Promotion;
import java.util.List;

/**
 *
 * @author chungnguyen
 */
public interface PromotionService {
    void save(Promotion obj);
    void remove(int id);
    Promotion findById(int id);
    List<Promotion> getByAll();
    
    Promotion getByPromoCode(String promoCode);
}
