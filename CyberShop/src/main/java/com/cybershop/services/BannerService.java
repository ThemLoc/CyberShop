/*
 * Bannero change this license header, choose License Headers in Project Properties.
 * Bannero change this template file, choose Bannerools | Banneremplates
 * and open the template in the editor.
 */
package com.cybershop.services;

import com.cybershop.models.Banner;
import java.util.List;

/**
 *
 * @author chungnguyen
 */
public interface BannerService {

    void save(Banner obj);

    void remove(int id);

    Banner findById(int id);

    List<Banner> getByAll();
}
