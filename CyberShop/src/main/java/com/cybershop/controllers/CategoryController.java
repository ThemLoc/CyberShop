package com.cybershop.controllers;

import com.cybershop.dto.CreateProductDTO;
import com.cybershop.other.MyFile;
import com.cybershop.services.CategoryService;
import com.cybershop.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("manager/category")
public class CategoryController {

    @Autowired
    CategoryService categoryService;
    @Autowired
    ProductService productService;
    @RequestMapping(value = {""},method = RequestMethod.GET)
    private String categoryPage(Model model) {
        model.addAttribute("categoryWithSpec", categoryService.getAllCateWithSpec());
        model.addAttribute("count", categoryService.getCountproduct());
        return "manager/category/category_page";
    }
}
