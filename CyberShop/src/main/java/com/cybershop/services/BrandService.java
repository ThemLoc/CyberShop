package com.cybershop.services;

import com.cybershop.dto.CountProductByBrandDTO;
import com.cybershop.models.Brand;
import java.util.List;

public interface BrandService {

    void save(Brand obj);

    void remove(int id);

    Brand findById(int id);

    List<Brand> getByAll();

    List<CountProductByBrandDTO> getCountproduct();
}
