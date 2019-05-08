package com.cybershop.services;

import com.cybershop.models.StoreInformation;
import java.util.List;

public interface StoreInformationService {
     void save(StoreInformation obj);
    void remove(int id);
    StoreInformation findById(int id);
    List<StoreInformation> getByAll();
}
