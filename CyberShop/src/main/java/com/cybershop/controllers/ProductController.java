
package com.cybershop.controllers;

import com.cybershop.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/product")
public class ProductController {


    @Autowired
    private ProductService productService;
    
    @RequestMapping(value = {""}, method = RequestMethod.GET)
    private String list(Model model) {
        model.addAttribute("listProduct", productService.getByAll());
        return "product/productList";
    }

    
//
//    @RequestMapping(method = RequestMethod.GET)
//    private String list(Model model) {
//        model.addAttribute("listProduct", productService.getByAll());
//        return "product/productList";
//    }
//
//    @RequestMapping(value = "/create", method = RequestMethod.GET)
//    private String create(Model model) {
//        model.addAttribute("listProduct", new Product());
//        return "product/productForm";
//    }
//
//    @RequestMapping(value = "product/save", method = RequestMethod.POST)
//    private String save(@ModelAttribute("productForm") Product obj, RedirectAttributes ratts) {
//        productService.save(obj);
//        ratts.addFlashAttribute("msg", "saved");
//        return "product/productList";

//    }
//
//    @RequestMapping(value = "/product/edit/{id}", method = RequestMethod.GET)
//    private String edit(@PathVariable("id") int id, Model model) {

//        model.addAttribute("productForm", productServiceImpl.findById(id));
//        return "/product/productForm";

//    }
//
//    @RequestMapping(value = "/product/delete/{id}", method = RequestMethod.GET)
//    private String delete(@PathVariable("id") int id, RedirectAttributes ratts) {

//        productServiceImpl.remove(id);
//        ratts.addFlashAttribute("msg", "deleted");
//        return "/product/productList";


}
