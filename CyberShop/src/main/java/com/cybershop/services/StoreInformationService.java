/*
 * StoreInformationo change this license header, choose License Headers in Project Properties.
 * StoreInformationo change this template file, choose StoreInformationools | StoreInformationemplates
 * and open the template in the editor.
 */
package com.cybershop.services;

import com.cybershop.models.StoreInformation;
import java.util.List;

/**
 *
 * @author chungnguyen
 */
public interface StoreInformationService {
     void save(StoreInformation obj);
    void remove(int id);
    StoreInformation findById(int id);
    List<StoreInformation> getByAll();
}
