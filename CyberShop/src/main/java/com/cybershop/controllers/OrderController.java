package com.cybershop.controllers;

import com.cybershop.models.Admin;

import com.cybershop.models.DeniedForm;
import com.cybershop.models.Order;
import com.cybershop.models.OrderDetail;
import com.cybershop.other.CurrencyManager;
import com.cybershop.services.AdminService;
import com.cybershop.services.OrderService;
import com.cybershop.services.ProductService;
import java.util.Date;

import java.util.List;
import javax.servlet.http.HttpSession;

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

@Controller
@RequestMapping("/manager/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private AdminService adminService;
    
    @Autowired
    ProductService productService;

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
        if (a != null) {
            session.setAttribute("USER", a);
        } else {

        }

        return "manager/order/orderList";
    }

    @RequestMapping(value = "getbyCus/{id}", method = RequestMethod.GET)
    private String getListByCus(@PathVariable("id") int id, Model model) {
        model.addAttribute("listOrder", orderService.findByCusID(id));
        return "manager/order/orderList";
    }

    @RequestMapping(value = "update/{status}&{id}", method = RequestMethod.GET)
    private String updateStatus(@PathVariable("status") String status, @PathVariable("id") int id, RedirectAttributes ratts) {
        final Order o = orderService.findById(id);
        if (status.equals("Confirm") || status.equals("Ready To Delivery") || status.equals("Delivery") || status.equals("Completed")) {
            if (status.equals("Confirm")) {
                Thread t = new Thread(new Runnable() {
                    @Override
                    public void run() {
                        String total = CurrencyManager.getPrice(o.getTotal(), " ₫");
                        orderService.sendEmailOrder("cybershop.nano@gmail.com", o.getCustomerID().getEmail(), "Đơn đặt hàng #" + o.getOrderID(),
                                "Đặt hàng thành công.\nThông tin của đơn hàng: Đơn hàng mã #" + o.getOrderID() + "\nGiờ đặt hàng: " + new Date() + "\nNgày đặt hàng: " + o.getOrderDate()
                                + "\nĐịa chỉ giao hàng: " + o.getShipAddress() + "\nTổng cộng: " + total);
                    }
                });
                t.start();
            }
            orderService.updateStatus(status, id);
        } else {
            ratts.addFlashAttribute("errorUpdate", "Wrong Status!");
        }
        return "redirect:/manager/order";
    }

    @RequestMapping(value = "/deniedform", method = RequestMethod.GET)
    private String updateDeniedStatus(@ModelAttribute("deniedForm") final DeniedForm deniedForm) {
        final Order o = orderService.findById(deniedForm.getId());
        Thread t = new Thread(new Runnable() {
            @Override
            public void run() {
                String total = CurrencyManager.getPrice(o.getTotal(), " ₫");
                orderService.sendEmailOrder("cybershop.nano@gmail.com", o.getCustomerID().getEmail(), "Đã hủy đơn đặt hàng #" + o.getOrderID(),
                        "Đơn hàng đã bị hủy.\nThông tin của đơn hàng: Đơn hàng mã #" + o.getOrderID() + "\nGiờ đặt hàng: " + new Date() + "\nNgày đặt hàng: " + o.getOrderDate()
                        + "\nĐịa chỉ giao hàng: " + o.getShipAddress() + "\nTổng cộng: " + total + "\n\n Lý do hủy đơn hàng: " + deniedForm.getReason());
            }
        });
        t.start();
        List<OrderDetail> orderDetails = (List<OrderDetail>) o.getOrderDetailCollection();
        for (OrderDetail detail : orderDetails) {
            int newQuantity = detail.getProductID().getQuantity() + detail.getQuantity();
            int newSell = detail.getProductID().getSell() - detail.getQuantity();
            productService.UpdateQuantityProduct(detail.getProductID().getProductID(), newQuantity, newSell);
        }
        System.out.println("Order in denied: " + o.getOrderDetailCollection());
        orderService.updateStatus("Denied", deniedForm.getId());
        return "redirect:/manager/order";
    }

}
