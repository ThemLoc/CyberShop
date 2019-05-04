package com.cybershop.services;

import com.cybershop.models.SpecificationTitle;
import java.util.List;

public interface SpecificationTitleService {

    void save(SpecificationTitle obj);

    void remove(int id);

    SpecificationTitle findById(int id);

    List<SpecificationTitle> getByAll();

    List<SpecificationTitle> getByCategory(int id);
    
    void removeByCateID(int cateID);
//    void addSpec(String specName,int cateID);
}
