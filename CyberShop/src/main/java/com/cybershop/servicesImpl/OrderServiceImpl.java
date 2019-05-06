package com.cybershop.servicesImpl;

import com.cybershop.controllers.CartController;
import com.cybershop.daos.OrderDAO;
import com.cybershop.models.CartDTO;
import com.cybershop.models.CartItem;
import com.cybershop.models.Customer;
import com.cybershop.models.Order;
import com.cybershop.models.OrderDetail;
import com.cybershop.models.Product;
import com.cybershop.models.Promotion;
import com.cybershop.services.OrderService;
import com.cybershop.services.ProductService;
import com.cybershop.services.PromotionService;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDAO dao;

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    PromotionService promotionService;

    @Autowired
    private ProductService productService;

    private CartController cartController;

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void save(Order obj) {
        dao.create(obj);
    }

    @Transactional
    @Override
    public void remove(int id) {
        dao.delete(id);
    }

    @Transactional(readOnly = true)
    @Override
    public Order findById(int id) {
        return dao.getById(id);
    }

    @Transactional(readOnly = true)
    @Override
    public List<Order> getByAll() {
        return dao.getAll();
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    @Override
    public void sendEmailOrder(final String from, final String to, final String subject, final String content) {
        MimeMessagePreparator preparator = new MimeMessagePreparator() {
            @Override
            public void prepare(MimeMessage mimeMessage) throws Exception {
                MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true, "UTF-8");
                message.setFrom(from);
                message.setTo(to);
                message.setSubject(subject);
                message.setText(content);
            }
        };
        mailSender.send(preparator);
    }

    @Transactional(readOnly = true)
    @Override
    public List<Order> findByCusID(int id) {
        return dao.getByCusID(id);
    }

    @Transactional
    @Override
    public void updateStatus(String status, int id) {
        dao.updateStatus(status, id);
    }

    @Transactional
    @Override
    public String collectItems(HttpSession session, Order order, HttpServletRequest request, Customer cust) {
        CartDTO cart = (CartDTO) session.getAttribute("cart");
        System.out.println("cart" + cart.getDetail().values());
        List<OrderDetail> details = new ArrayList<>();
        Promotion promotion = promotionService.findById(1);
        order.setOrderDate(new Date());
        order.setStatus("Create");
        order.setPromotionID(null);
        order.setShipAddress(cust.getAddress());
        if (cart != null) {
            for (Map.Entry<Integer, CartItem> entry : cart.getDetail().entrySet()) {
                Product p = productService.findById(entry.getValue().getItem().getProductID());
                OrderDetail detail = new OrderDetail();
                detail.setProductID(p);
                detail.setOrderID(order);
                if (p.getDownPrice() != null) {
                    detail.setPrice(p.getDownPrice());
                }else{
                    detail.setPrice(p.getPrice());
                }
//                detail.setQuantity(entry.getValue().getQty());
                detail.setQuantity(120);
                details.add(detail);
            }
        }
        String check = checkOrder(details, session);
        if (check.equals("ok")) {
            double total = 0;
            order.setOrderDetailCollection(details);
            for (OrderDetail detail : details) {
                double a = 0;
                a = detail.getPrice() * detail.getQuantity();
                total += a;
            }
            order.setTotal(total);
            order.setCustomerID(cust);
            order.setDeliveryFee(20.0);
            if (order != null) {
                    save(order);
            }

            for (OrderDetail detail : details) {
                int sell = 0;
                int quantity = 0;
                Product p = productService.findById(detail.getProductID().getProductID());
                sell = p.getSell() + detail.getQuantity();
                quantity = p.getQuantity() - detail.getQuantity();
                productService.UpdateQuantityProduct(p.getProductID(), quantity, sell);
            }
        }
        return check;

    }

    @Override
    public void emptyCart(HttpSession session) {
        CartDTO cart = (CartDTO) session.getAttribute("cart");
        if (cart != null) {
            session.removeAttribute("cart");
        }
    }

    private void updateItem(HttpSession session, Product product, int qty) {
        CartDTO cart = null;
        if (session.getAttribute("cart") != null) {
            cart = (CartDTO) session.getAttribute("cart");
            cart.updateItem(product, qty);
            cart.getTotalOrder();
            session.setAttribute("cart", cart);
        }

    }

    private String checkOrder(List<OrderDetail> details, HttpSession session) {
        boolean check = true;
        for (OrderDetail detail_1 : details) {
            Product tmp_p = productService.findById(detail_1.getProductID().getProductID());
            if (detail_1.getQuantity() > tmp_p.getQuantity()) {
                updateItem(session, tmp_p, tmp_p.getQuantity());
                check = false;
            }
        }
        if (check) {
            return "ok";
        } else {
            return "fail";
        }
    }
}
