/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cybershop.controllers;


import com.cybershop.models.Order;
import com.cybershop.services.CustomerService;
import com.cybershop.services.OrderService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author ngthe
 */
@Controller
@RequestMapping("manager/order")
public class OrderController {
    @Autowired
    private OrderService orderService;
    private CustomerService customerService;
    
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
    private String list(Model model) {
        model.addAttribute("listOrder", orderService.getByAll());
        return "manager/order/orderList";
    }
}
