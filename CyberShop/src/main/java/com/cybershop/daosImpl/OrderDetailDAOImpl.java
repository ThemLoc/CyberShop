package com.cybershop.daosImpl;

import com.cybershop.daos.OrderDetailDAO;
import com.cybershop.daos.ProductDAO;
import com.cybershop.models.Image;
import com.cybershop.models.Order;
import com.cybershop.models.OrderDetail;
import com.cybershop.models.Product;
import com.cybershop.services.CustomerService;
import com.cybershop.services.ProductService;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDetailDAOImpl implements OrderDetailDAO {

    @PersistenceContext
    private EntityManager em;
     
    @Autowired
    private ProductService productService;
    @Override
    public void create(OrderDetail obj) {
        em.persist(obj);
    }

    @Override
    public void update(OrderDetail obj) {
        em.merge(obj);
    }

    @Override
    public void delete(int id) {
        em.remove(getById(id));
    }

    @Override
    public List<OrderDetail> getAll() {
        return em.createQuery("from OrderDetail").getResultList();
    }

    @Override
    public OrderDetail getById(int id) {
        return em.find(OrderDetail.class, id);
    }

    @Override
    public List<OrderDetail> getByOrderID(int id) {
        List<OrderDetail> list = em.createQuery("Select o from OrderDetail o Where o.orderID.orderID = :orderID").setParameter("orderID", id).getResultList();
        System.out.println("LIST: " + list.size());
        List<OrderDetail> newOrderList = new ArrayList<>();
        OrderDetail od;
        if (!list.isEmpty()) {
            for (OrderDetail o : list) {
                od = new OrderDetail();
                od.setQuantity(o.getQuantity());
//                od.setOrderID(o.getOrderID());
                od.setPrice(o.getPrice());
                od.setOrderDetailID(o.getOrderDetailID());
                Product pro = o.getProductID();
                Product newProduct =  productService.findById(pro.getProductID());
                od.setProductID(newProduct);
                newOrderList.add(od);
            }

        }
        return newOrderList;
    }

}
