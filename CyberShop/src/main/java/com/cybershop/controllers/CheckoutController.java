package com.cybershop.controllers;

import com.cybershop.models.CartDTO;
import com.cybershop.models.CartItem;
import com.cybershop.models.Customer;
import com.cybershop.models.Order;
import com.cybershop.models.OrderDetail;
import com.cybershop.models.Product;
import com.cybershop.models.Promotion;
import com.cybershop.services.CustomerService;
import com.cybershop.services.OrderService;
import com.cybershop.services.ProductService;
import com.cybershop.services.PromotionService;
import com.cybershop.servicesImpl.OrderServiceImpl;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/website")
public class CheckoutController {

    
    @Autowired
    private OrderService orderService;
    
    @Autowired
    private ProductService productService;
    
    @Autowired
    private CustomerService customerService;
    
    @Autowired PromotionService promotionService;

//    @RequestMapping(method = RequestMethod.GET)
//    public String checkout(Model model) {
//        model.addAttribute("checkoutForm", new Customer());
//        return "website/checkout";
//
//    }

    @RequestMapping(value = "/checkout/add")
    public String placeOrder(@ModelAttribute("CusomerInfor") Customer cust,
            HttpSession session, RedirectAttributes ra, HttpServletRequest request) {
        //System.out.println("customer" + cust);
        Customer c = (Customer)session.getAttribute("customer");
        Order order = new Order();        
        if(c != null){
            Customer customer = customerService.findById(c.getCustomerID());
            collectItems(session, order, request, c);
            orderService.sendEmailOrder("cybershop.nano@gmail.com", c.getEmail(), "Cybershop Order", "Order : " + order);
        }else{
            cust.setIsGuest(true);
            collectItems(session, order, request, cust);
            if(cust.getEmail() != null){
               orderService.sendEmailOrder("cybershop.nano@gmail.com", cust.getEmail(), "Cybershop Order", "Order : " + order); 
            }
            
        }      
      //String orderNo = checkoutService.placeOrder(order);
        emptyCart(session);
//        ra.addFlashAttribute("orderNo", "Your order is #" + orderNo);
        //emailServiceImpl.sendMessage(order.getCustomer().getEmail(), "Order Information", "Order successful");
        
        return "redirect:/website/list_product";

    }

//    @RequestMapping(value = "/thankyou", method = RequestMethod.POST)
//    public String thankyou(Model model) {
//        //model.addAttribute("listOrder", checkoutService.getAllOrder());
//        return "/website/checkout";
//
//    }

    private void collectItems(HttpSession session, Order order, HttpServletRequest request, Customer cust) {
        CartDTO cart = (CartDTO) session.getAttribute("cart");
//        CartDTO cart = new CartDTO();
//        Product  p1 = productService.findById(1);
//        cart.addItem(p1, 2);
        List<OrderDetail> details = new ArrayList<>();
        Promotion promotion = promotionService.findById(1);
        order.setOrderDate(new Date());
        Random random = new Random();
        //order.setOrderNo(String.valueOf(random.nextInt(1000)));
        order.setStatus("Create");
        order.setPromotionID(null);
        order.setShipAddress(cust.getAddress());
        if (cart != null) {
            for (Map.Entry<Integer, CartItem> entry : cart.getDetail().entrySet()) {
                Product p = productService.findById(entry.getValue().getItem().getProductID());
                OrderDetail detail = new OrderDetail();
                detail.setProductID(p);
                detail.setOrderID(order);
                detail.setPrice(p.getPrice());
                detail.setQuantity(entry.getValue().getQty());
                details.add(detail);
            }
        }
        double total = 0;
        order.setOrderDetailCollection(details);
        for (OrderDetail detail: details) {
            double a = 0;
            a = detail.getPrice() * detail.getQuantity();
            total += a;
        }
        order.setTotal(total);
        order.setCustomerID(cust);
        order.setDeliveryFee(20.0);
//        cust.setOrder(order);
//
        if(order !=  null){
            orderService.save(order);
        }
        
        System.out.println("order" +  order);
        System.out.println("orderDetail" + order.getOrderDetailCollection());
//        if (details != null) {
//            for (int i = 0; i < details.size(); i++) {
//                checkoutService.saveOrderDetail(details.get(i));
//            }
//        }
    }

    private void emptyCart(HttpSession session) {
        CartDTO cart = (CartDTO) session.getAttribute("cart");
        if (cart != null) {
            session.removeAttribute("cart");
        }
    }
}
