package com.cybershop.controllers;

import com.cybershop.models.CartDTO;
import com.cybershop.models.Customer;
import com.cybershop.models.Order;
import com.cybershop.services.CustomerService;
import com.cybershop.services.OrderService;
import com.cybershop.services.ProductService;
import com.cybershop.services.PromotionService;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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

    @Autowired
    PromotionService promotionService;

    @RequestMapping(value = "/checkout/add")
    public String placeOrder(@ModelAttribute("CusomerInfor") Customer cust,
            HttpSession session, RedirectAttributes ra, HttpServletRequest request) {

        // Customer c = (Customer)session.getAttribute("CUSTOMER_INFO");
        Customer c = new Customer();
        c = null;
        Order order = new Order();
        if (c != null) {
            Customer customer = customerService.findById(c.getCustomerID());
            orderService.collectItems(session, order, request, c);
            if (order != null) {
                orderService.sendEmailOrder("cybershop.nano@gmail.com", c.getEmail(), "Cybershop Order", "Order : " + order.getStatus() + "Order date: " + order.getOrderDate());
                 ra.addFlashAttribute("errOrder", "");
            }else{
                ra.addFlashAttribute("errOrder", "Products do not enough to provide!");
                return "redirect:/website/cart";
            }

        } else {
            cust.setUsername("Guest" + String.valueOf(new Date()));
            cust.setIsGuest(true);
            cust.setStatus(true);
            String checkOrder = orderService.collectItems(session, order, request, cust);
            if (checkOrder.equalsIgnoreCase("ok")) {
                if (cust.getEmail() != null) {
                    orderService.sendEmailOrder("cybershop.nano@gmail.com", cust.getEmail(), "Cybershop Order", "Order : " + order);
                    ra.addFlashAttribute("errOrder", "");
                }
            }else{
                ra.addFlashAttribute("errOrder", "Products do not enough to provide!");
                return "redirect:/website/cart";
            }

        }
        orderService.emptyCart(session);
//          System.out.println("cust" + cust);

        return "redirect:/website/home";

    }

}
