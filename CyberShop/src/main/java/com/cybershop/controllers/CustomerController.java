package com.cybershop.controllers;

import com.cybershop.models.Admin;
import com.cybershop.services.AdminService;
import com.cybershop.services.CustomerService;
import java.util.Arrays;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/manager/customer")
public class CustomerController {


   
    @Autowired
    private CustomerService customerService;

    @RequestMapping(method = RequestMethod.GET)
    private String list(Model model) {
        model.addAttribute("listCustomer", customerService.getByAll());
        return "manager/customer/customerList";
    }
    @RequestMapping(value = "/status/{id}/{status}",method = RequestMethod.GET)
    private String changeStatus(@PathVariable("id") int id, @PathVariable("status") boolean sta) {
        customerService.remove(id, sta);
        return "redirect:/manager/customer";
    }
    
//    @RequestMapping(value = "/order/{id}",method = RequestMethod.GET)
//    private String viewOrderCustomer(@PathVariable("id") int id) {
//        customerService.remove(id);
//        return "redirect:/manager/customer";
//    }


    

//    @RequestMapping(value = "/save", method = RequestMethod.POST)
//    private String save(@ModelAttribute("adminForm") Admin obj, RedirectAttributes ratts) {
//        System.out.println("Admin" + obj);
//        adminService.save(obj);
//        ratts.addFlashAttribute("msg", "saved");
//        return "redirect:/manager/admin";
//    }
//
//    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
//    private String edit(@PathVariable("id") int id, Model model) {
//        model.addAttribute("adminForm", adminService.findById(id));
//        return "manager/admin/adminForm";
//    }
//
//    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
//    private String delete(@PathVariable("id") int id, RedirectAttributes ratts) {
//        adminService.remove(id);
//        ratts.addFlashAttribute("msg", "deleted success");
//        return "redirect:/manager/admin";
//    }
//
//    @ModelAttribute("listRole")
//    public List<String> listRole(Model model) {
//        return Arrays.asList("ADMIN", "EMPLOYEE");
//    }
    
    

}
