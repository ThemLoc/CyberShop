package com.cybershop.controllers;

import com.cybershop.services.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
    @RequestMapping(value = "/status/{id}/{status}", method = RequestMethod.GET)
    private String changeStatus(@PathVariable("id") int id, @PathVariable("status") boolean sta) {
        customerService.updateStatus(id, sta);
        return "redirect:/manager/customer";
    }

}
