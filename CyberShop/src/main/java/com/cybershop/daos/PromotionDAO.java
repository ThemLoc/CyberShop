package com.cybershop.daos;

import com.cybershop.models.Promotion;
import java.util.List;

public interface PromotionDAO {

    void create(Promotion obj);

    void update(Promotion obj);

    void delete(int id);

    List<Promotion> getAll();

    Promotion getById(int id);
}
