package com.cybershop.daosImpl;

import com.cybershop.daos.SpecificationTitleDAO;
import com.cybershop.models.SpecificationTitle;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TemporalType;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

@Repository
public class SpecificationTitleDAOImpl implements SpecificationTitleDAO {

    @PersistenceContext
    private EntityManager em;

    @Override
    public void create(SpecificationTitle obj) {
        em.persist(obj);
    }

    @Override
    public void update(SpecificationTitle obj) {
        em.merge(obj);
    }

    @Override
    public void delete(int id) {
        em.remove(getById(id));
    }

    @Override
    public List<SpecificationTitle> getAll() {
        return em.createQuery("from SpecificationTitle").getResultList();
    }

    @Override
    public SpecificationTitle getById(int id) {
        return em.find(SpecificationTitle.class, id);
    }

    @Override
    public List<SpecificationTitle> getByCateID(int id) {
        return this.em.createNamedQuery("SpecificationTitle.getByCateID", SpecificationTitle.class).setParameter("cateID", id).getResultList();
    }

//    @Override
//    public void addSpec(String specName, int cateID) {
//        this.em.createQuery("Insert into SpecificationTitle (SpecName,CateID) values (?,?)")
//                .setParameter(1, specName)
//                .setParameter(2, cateID)
//                .executeUpdate();
//
//    }

    @Override
    public void deleteByCateID(int cateID) {
        this.em.createQuery("Delete from SpecificationTitle where CateID = ?").setParameter(1, cateID).executeUpdate();
    }

}
