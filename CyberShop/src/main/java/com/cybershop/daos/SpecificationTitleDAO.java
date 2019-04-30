package com.cybershop.daos;

import com.cybershop.models.SpecificationTitle;
import java.util.List;

public interface SpecificationTitleDAO {

    void create(SpecificationTitle obj);

    void update(SpecificationTitle obj);

    void delete(int id);

    List<SpecificationTitle> getAll();

    SpecificationTitle getById(int id);

    List<SpecificationTitle> getByCateID(int id);

    void deleteByCateID(int cateID);
//    void addSpec(String specName,int cateID);
}
