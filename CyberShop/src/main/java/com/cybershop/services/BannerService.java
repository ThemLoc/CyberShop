package com.cybershop.services;

import com.cybershop.models.Banner;
import java.util.List;

public interface BannerService {

    void save(Banner obj);

    void remove(int id);

    Banner findById(int id);

    List<Banner> getByAll();
}
