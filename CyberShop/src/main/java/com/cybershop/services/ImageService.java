package com.cybershop.services;

import com.cybershop.models.Image;
import java.util.List;

public interface ImageService {
     void save(Image obj);
    void remove(int id);
    Image findById(int id);
    List<Image> getByAll();
    
    void updateMainImage(Image image);
    
    void updateSubImage(List<Image> list);
}
