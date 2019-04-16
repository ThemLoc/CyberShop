package com.cybershop.daos;

import com.cybershop.models.StoreInformation;
import java.util.List;

public interface StoreInformationDAO {

    void create(StoreInformation obj);

    void update(StoreInformation obj);

    void delete(int id);

    List<StoreInformation> getAll();

    StoreInformation getById(int id);
}
