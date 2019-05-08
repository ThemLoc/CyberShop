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
    @RequestMapping(value = "/status/{id}/{status}", method = RequestMethod.GET)
    private String changeStatus(@PathVariable("id") int id, @PathVariable("status") boolean sta) {
        customerService.remove(id, sta);
        return "redirect:/manager/customer";
    }

}
