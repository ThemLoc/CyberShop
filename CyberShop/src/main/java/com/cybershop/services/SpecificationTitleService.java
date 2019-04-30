/*
 * SpecificationTitleo change this license header, choose License Headers in Project Properties.
 * SpecificationTitleo change this template file, choose SpecificationTitleools | SpecificationTitleemplates
 * and open the template in the editor.
 */
package com.cybershop.services;

import com.cybershop.models.SpecificationTitle;
import java.util.List;

/**
 *
 * @author chungnguyen
 */
public interface SpecificationTitleService {

    void save(SpecificationTitle obj);

    void remove(int id);

    SpecificationTitle findById(int id);

    List<SpecificationTitle> getByAll();

    List<SpecificationTitle> getByCategory(int id);
    
    void removeByCateID(int cateID);
//    void addSpec(String specName,int cateID);
}
