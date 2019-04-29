/*
 * Brando change this license header, choose License Headers in Project Properties.
 * Brando change this template file, choose Brandools | Brandemplates
 * and open the template in the editor.
 */
package com.cybershop.services;

import com.cybershop.dto.CountProductByBrandDTO;
import com.cybershop.models.Brand;
import java.util.List;

/**
 *
 * @author chungnguyen
 */
public interface BrandService {

    void save(Brand obj);

    void remove(int id);

    Brand findById(int id);

    List<Brand> getByAll();

    List<CountProductByBrandDTO> getCountproduct();
}
