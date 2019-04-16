package com.cybershop.daos;

import com.cybershop.models.Banner;
import java.util.List;

public interface BannerDAO {

    void create(Banner obj);

    void update(Banner obj);

    void delete(int id);

    List<Banner> getAll();

    Banner getById(int id);
}
