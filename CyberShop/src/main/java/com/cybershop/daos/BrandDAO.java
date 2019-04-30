package com.cybershop.daos;

import com.cybershop.dto.CountProductByBrandDTO;
import com.cybershop.models.Brand;
import java.util.List;

public interface BrandDAO {

    void create(Brand obj);

    void update(Brand obj);

    void delete(int id);

    List<Brand> getAll();

    Brand getById(int id);
    
    List<CountProductByBrandDTO> getCountproduct();
}
