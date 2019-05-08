package com.cybershop.services;

import com.cybershop.dto.CountProductByCateDTO;
import com.cybershop.models.Category;
import java.util.List;

public interface CategoryService {

    void save(Category obj);

    void remove(int id);

    Category findById(int id);

    List<Category> getByAll();

    List<Category> getAllCateWithSpec();

    List<CountProductByCateDTO> getCountproduct();
    
//     int addCategory(String cateName,int type);
}
