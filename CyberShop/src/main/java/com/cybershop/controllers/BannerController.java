package com.cybershop.controllers;

import com.cybershop.models.Banner;
import com.cybershop.models.Product;
import com.cybershop.services.BannerService;
import com.cybershop.services.ProductService;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/manager/banner")
public class BannerController {
    
    @Autowired
    private BannerService service;
    
    @Autowired
    private ProductService productService;
    
    @RequestMapping(method = RequestMethod.GET)
    private String list(Model model) {
        model.addAttribute("listProduct", productService.findProductNotInBanner());
        model.addAttribute("listBanner", service.getByAll());
        return "manager/banner/bannerList";
    }
    
    @RequestMapping(value = "/add/{id}", method = RequestMethod.GET)
    private String add(@PathVariable("id") int id) {
        Product pro = productService.findById(id);
        Banner banner = new Banner();
        banner.setProductID(pro);
        service.save(banner);
        return "redirect:/manager/banner";
    }
    
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    private String delete(@PathVariable("id") int id) {
        service.remove(id);
        return "redirect:/manager/banner";
    }
}
