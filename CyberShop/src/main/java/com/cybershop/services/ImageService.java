package com.cybershop.services;

import com.cybershop.models.Image;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;

public interface ImageService {
     void save(Image obj);
    void remove(int id);
    Image findById(int id);
    List<Image> getByAll();
    
    void updateMainImage(Image image);
    
    void updateSubImage(List<Image> list);
    String uploadFile(MultipartFile aFile);
}
