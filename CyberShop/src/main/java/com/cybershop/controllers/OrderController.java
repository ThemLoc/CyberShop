/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cybershop.controllers;

import com.cybershop.models.Admin;

import com.cybershop.models.DeniedForm;
import com.cybershop.models.Order;
import com.cybershop.services.AdminService;
import com.cybershop.services.CustomerService;
import com.cybershop.services.OrderService;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.hibernate.annotations.Parameter;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author ngthe
 */
@Controller
@RequestMapping("/manager/order")
public class OrderController {

    @Autowired
    private OrderService orderService;
    private CustomerService customerService;
    
    @Autowired
    private AdminService adminService;

    private ExecutorService service = Executors.newFixedThreadPool(2);


    @RequestMapping(value = "/order/member/save", method = RequestMethod.POST)
    private String checkout(@ModelAttribute("cart") Order obj, RedirectAttributes ratts) {
        orderService.sendEmailOrder("cybershop.nano@gmail.com", "chungnguyen2602@gmail.com", "Đơn đặt hàng", "Đặt hàng thành công");
        orderService.save(obj);
        ratts.addFlashAttribute("msg", "saved");
        return "website/order/orderList";
//    @RequestMapping(value = "/order/member/save", method = RequestMethod.POST)
//    private String checkout(@ModelAttribute("cart") Order obj, RedirectAttributes ratts) {
//        orderService.sendEmailOrder("cybershop@gmail.com", "a@gmail.com", "Đơn đặt hàng", "Đặt hàng thành công");
//        orderService.save(obj);
//        ratts.addFlashAttribute("msg", "saved");
//        return "website/order/orderList";

    }

    @RequestMapping(method = RequestMethod.GET)
    private String list(Model model, HttpSession session) {
        model.addAttribute("listOrder", orderService.getByAll());
        model.addAttribute("deniedForm", new DeniedForm());
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        Admin a = adminService.getByUser(username);
        if(a != null){
            session.setAttribute("USER", a);
        }else{
            
        }
        
        return "manager/order/orderList";
    }

    @RequestMapping(value = "getbyCus/{id}", method = RequestMethod.GET)
    private String getListByCus(@PathVariable("id") int id, Model model) {
        model.addAttribute("listOrder", orderService.findByCusID(id));
        return "manager/order/orderList";
    }

    @RequestMapping(value = "update/{status}&{id}", method = RequestMethod.GET)
    private String updateStatus(@PathVariable("status") String status, @PathVariable("id") int id) {
        final Order o = orderService.findById(id);
        if (status.equals("Confirm")) {
            Runnable r1 = new Runnable() {
                @Override
                public void run() {
                    try {
                        orderService.sendEmailOrder("cybershop.nano@gmail.com", o.getCustomerID().getEmail(), "Đơn đặt hàng #" + o.getOrderID(),
                                "Đặt hàng thành công.\nThông tin của đơn hàng: Đơn hàng mã #" + o.getOrderID() + "\nNgày đặt hàng: " + o.getOrderDate()
                                + "\nĐịa chỉ giao hàng: " + o.getShipAddress() + "\nTổng cộng: " + o.getTotal() + " VNĐ");
                    } catch (Exception e) {
                        System.out.println("Send mail fail " + e.getMessage());
                    }
                }
            };
            service.submit(r1);
            service.shutdown();
        }
        orderService.updateStatus(status, id);

        return "redirect:/manager/order";
    }

    @RequestMapping(value = "/deniedform", method = RequestMethod.GET)
    private String updateDeniedStatus(@ModelAttribute("deniedForm") final DeniedForm deniedForm) {
        final Order o = orderService.findById(deniedForm.getId());
        Runnable r1 = new Runnable() {
            @Override
            public void run() {
                try {
                    orderService.sendEmailOrder("cybershop.nano@gmail.com", o.getCustomerID().getEmail(), "Đã hủy đơn đặt hàng #" + o.getOrderID(),
                            "Đơn hàng đã bị hủy.\nThông tin của đơn hàng: Đơn hàng mã #" + o.getOrderID() + "\nNgày đặt hàng: " + o.getOrderDate()
                            + "\nĐịa chỉ giao hàng: " + o.getShipAddress() + "\nTổng cộng: " + o.getTotal() + " VNĐ" + "\n\n Lý do hủy đơn hàng: " + deniedForm.getReason());
                } catch (Exception e) {
                    System.out.println("Send mail fail " + e.getMessage());
                }
            }
        };
        orderService.updateStatus("Denied", deniedForm.getId());
        service.submit(r1);
        service.shutdown();
        return "redirect:/manager/order";
    }

}
