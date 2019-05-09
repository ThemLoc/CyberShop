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
    public String placeOrder(@ModelAttribute("CusomerInfor") final Customer cust,
            HttpSession session, RedirectAttributes ra, HttpServletRequest request) {

        final Customer c = (Customer) session.getAttribute("CUSTOMER_INFO");
        final Order order = new Order();
        if (c != null) {
            Customer customer = customerService.findById(c.getCustomerID());
            String checkOrder = orderService.collectItems(session, order, request, customer);
            if (checkOrder.equalsIgnoreCase("ok")) {
                Order o = orderService.getOrderCurrent();
                System.out.println("or===========der" + o.getOrderID());
                System.out.println("CusOrderID: " + customer.getCustomerID());
                orderService.updateOrderBycus(o.getOrderID(), customer.getCustomerID());
                Thread t = new Thread(new Runnable() {
                    @Override
                    public void run() {
                        orderService.sendEmailOrder("cybershop.nano@gmail.com", c.getEmail(), "Cybershop Order", "Order : " + order.getStatus() + "Order date: " + order.getOrderDate());
                    }
                });
                t.start();
                ra.addFlashAttribute("successOrder", "success");
                ra.addFlashAttribute("errOrder", "");

            } else {
                ra.addFlashAttribute("errOrder", "Sản phẩm không đủ cung cấp!!");
                return "redirect:/website/cart";
            }

        } else {
            cust.setUsername("Guest" + String.valueOf(new Date()));
            cust.setIsGuest(true);
            cust.setStatus(true);
            String checkOrder = orderService.collectItems(session, order, request, cust);
            if (checkOrder.equalsIgnoreCase("ok")) {
                if (cust.getEmail() != null) {
                    Thread t = new Thread(new Runnable() {
                        @Override
                        public void run() {
                            orderService.sendEmailOrder("cybershop.nano@gmail.com", cust.getEmail(), "Cybershop Order", "Order : " + order);
                        }
                    });
                    t.start();
                    ra.addFlashAttribute("errOrder", "");
                    ra.addFlashAttribute("successOrder", "success");
                }
            } else {
                ra.addFlashAttribute("errOrder", "Sản phẩm không đủ cung cấp!");
                return "redirect:/website/cart";
            }

        }
        orderService.emptyCart(session);

        return "redirect:/website/home";

    }

}
