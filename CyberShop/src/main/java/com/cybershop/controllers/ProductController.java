/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cybershop.controllers;

import com.cybershop.models.Product;
import com.cybershop.services.ProductServiceImpl;
import java.util.Arrays;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author chungnguyen
 */
@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductServiceImpl productServiceImpl;

    @RequestMapping(method = RequestMethod.GET)
    private String list(Model model) {
        model.addAttribute("listProduct", productServiceImpl.getByAll());
        return "/product/productList";
    }

    @RequestMapping(value = "/product/create", method = RequestMethod.GET)
    private String create(Model model) {
        model.addAttribute("listProduct", new Product());
        return "/product/productForm";
    }

    @RequestMapping(value = "/product/save", method = RequestMethod.POST)
    private String save(@ModelAttribute("productForm") Product obj, RedirectAttributes ratts) {
        productServiceImpl.save(obj);
        ratts.addFlashAttribute("msg", "saved");
        return "/product/productList";
    }

    @RequestMapping(value = "/product/edit/{id}", method = RequestMethod.GET)
    private String edit(@PathVariable("id") int id, Model model) {
        model.addAttribute("productForm", productServiceImpl.findById(id));
        return "/product/productForm";
    }

    @RequestMapping(value = "/product/delete/{id}", method = RequestMethod.GET)
    private String delete(@PathVariable("id") int id, RedirectAttributes ratts) {
        productServiceImpl.remove(id);
        ratts.addFlashAttribute("msg", "deleted");
        return "/product/productList";
    }
}
