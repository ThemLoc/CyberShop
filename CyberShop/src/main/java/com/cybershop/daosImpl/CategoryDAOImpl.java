package com.cybershop.daosImpl;

import com.cybershop.daos.CategoryDAO;
import com.cybershop.dto.CountProductByCateDTO;
import com.cybershop.models.Category;
import com.cybershop.models.SpecificationTitle;
import com.cybershop.services.ProductService;
import com.cybershop.services.SpecificationTitleService;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDAOImpl implements CategoryDAO {

    @PersistenceContext
    private EntityManager em;
    @Autowired
    SpecificationTitleService specificationTitleService;

    @Autowired
    ProductService productService;

    @Override
    public void create(Category obj) {
        em.persist(obj);
    }

    @Override
    public void update(Category obj) {
        em.merge(obj);
    }

    @Override
    public void delete(int id) {
        em.remove(getById(id));
    }

    @Override
    public List<Category> getAll() {
        List<Category> list = em.createQuery("from Category").getResultList();
        List<Category> newList = new ArrayList<>();
        Category category;
        if (!list.isEmpty()) {
            for (Category item : list) {
                category = new Category();
                category.setCateID(item.getCateID());
                category.setCateName(item.getCateName());
                newList.add(category);
            }
        }
        return newList;
    }

    @Override
    public Category getById(int id) {
        return em.find(Category.class, id);
    }

    @Override
    public List<Category> getAllWithSpec() {
        List<Category> list = em.createQuery("from Category").getResultList();
        List<Category> newList = new ArrayList<>();
        Category category;
        if (!list.isEmpty()) {
            for (Category item : list) {
                category = new Category();
                category.setCateID(item.getCateID());
                category.setCateName(item.getCateName());
                category.setType(item.getType());
                List<SpecificationTitle> listSPec = (List<SpecificationTitle>) specificationTitleService.getByCategory(item.getCateID());
                if (listSPec != null) {
                    List<SpecificationTitle> newListSPec = new ArrayList<>();
                    SpecificationTitle st;
                    for (SpecificationTitle specificationTitle : listSPec) {
                        st = new SpecificationTitle();
                        st.setSpecID(specificationTitle.getSpecID());
                        st.setSpecName(specificationTitle.getSpecName());
                        newListSPec.add(st);
                    }
                    category.setSpecificationTitleCollection(newListSPec);
                }
                newList.add(category);

            }
        }
        return newList;
    }

    @Override
    public List<CountProductByCateDTO> getCountproduct() {
        List<Category> list = em.createQuery("from Category").getResultList();
        List<CountProductByCateDTO> listCount = new ArrayList<>();
        CountProductByCateDTO cpbcdto;
        for (Category item : list) {
            cpbcdto = new CountProductByCateDTO();
            cpbcdto.setCateID(item.getCateID());
            cpbcdto.setCount(productService.countByCateID(item.getCateID()));
            listCount.add(cpbcdto);
        }
        return listCount;
    }

//    @Override
//    public int addCategory(String cateName,int type) {
//       this.em.createQuery("INSERT INTO Category (CateName,Type) values (?,?)")
//               .setParameter(1, cateName)
//               .setParameter(2, type)
//               .executeUpdate();
//       return (int) this.em.createQuery("SELECT SCOPE_IDENTITY();]").getSingleResult();
//    }

}
