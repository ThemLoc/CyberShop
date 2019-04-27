package com.cybershop.daos;

import com.cybershop.models.Image;
import java.util.List;

public interface ImageDAO {

    void create(Image obj);

    void update(Image obj);

    void delete(int id);

    List<Image> getAll();

    Image getById(int id);
    
    void updateMainImage(Image image);
    
    void updateSubImage(List<Image> list);
}
