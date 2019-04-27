package com.cybershop.daos;

import com.cybershop.models.Category;
import java.util.List;

public interface CategoryDAO {

    void create(Category obj);

    void update(Category obj);

    void delete(int id);

    List<Category> getAll();

    Category getById(int id);
    
    List<Category> getAllWithSpec();
}
