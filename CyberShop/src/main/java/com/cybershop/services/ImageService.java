/*
 * Imageo change this license header, choose License Headers in Project Properties.
 * Imageo change this template file, choose Imageools | Imageemplates
 * and open the template in the editor.
 */
package com.cybershop.services;

import com.cybershop.models.Image;
import java.util.List;

/**
 *
 * @author chungnguyen
 */
public interface ImageService {
     void save(Image obj);
    void remove(int id);
    Image findById(int id);
    List<Image> getByAll();
}
