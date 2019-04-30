package com.cybershop.controllers;

import com.cybershop.services.BrandService;
import com.cybershop.dto.SpecificationShowDTO;
import com.cybershop.models.Product;
import com.cybershop.services.ProductService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WebsiteController {
    
    @Autowired
    private BrandService service;

    @Autowired
    ProductService productService;

    @RequestMapping(value = {"/website/home"}, method = RequestMethod.GET)
    public String home(Model model) {
        model.addAttribute("listBrand", service.getByAll());
        return "website/home";
    }

    @RequestMapping(value = {"/website/singleproduct/{id}"}, method = RequestMethod.GET)
    public String single_product(@PathVariable("id") int id, Model model) {
        Product product = productService.findById(id);
        model.addAttribute("product", product);
        String detail = product.getDetail();
        List<SpecificationShowDTO> list = new ArrayList<>();
        SpecificationShowDTO dto;
        String str[] = detail.split("#");
        for (int i = 0; i < str.length - 1; i++) {

            dto = new SpecificationShowDTO();
            String arr[] = str[i].split("\\*");
            if (arr.length == 2) {
                dto.setTitle(arr[0]);
                dto.setValue(arr[1]);
            } else {
                dto.setTitle(arr[0]);
                dto.setValue("");
            }
            list.add(dto);
        }
        model.addAttribute("listSpec", list);
        List<Product> listSame = productService.findTop6ProductWithCateID(3);
         System.out.println(listSame.size());
        if(listSame.size() > 6){
            for (int i = 6; i < listSame.size(); ) {
                listSame.remove(i);
            }
        }
        System.out.println(listSame.size());
        model.addAttribute("listSame", listSame);
        return "website/single_product";
    }

    @RequestMapping(value = {"/website/listproduct"}, method = RequestMethod.GET)
    public String list_product(Model model) {
        List<Product> list = productService.getByAll();
        List<Product> newList = new ArrayList<>();
        Product newProduct;
        for (Product product : list) {
            newProduct = new Product();
            newProduct = productService.findById(product.getProductID());
            newList.add(newProduct);
        }
        model.addAttribute("listProduct", newList);
        return "website/list_product";
    }

    @RequestMapping(value = {"/website/cart"}, method = RequestMethod.GET)
    public String cart() {
        return "website/cart";
    }

    @RequestMapping(value = {"/website/checkout"}, method = RequestMethod.GET)
    public String check_out() {
        return "website/checkout";
    }
    
}
