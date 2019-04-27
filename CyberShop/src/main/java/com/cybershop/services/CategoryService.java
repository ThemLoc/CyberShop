/*
 * Categoryo change this license header, choose License Headers in Project Properties.
 * Categoryo change this template file, choose Categoryools | Categoryemplates
 * and open the template in the editor.
 */
package com.cybershop.services;

import com.cybershop.models.Category;
import java.util.List;

/**
 *
 * @author chungnguyen
 */
public interface CategoryService {
     void save(Category obj);
    void remove(int id);
    Category findById(int id);
    List<Category> getByAll();
     List<Category> getAllCateWithSpec();
}
