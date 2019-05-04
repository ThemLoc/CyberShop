package com.cybershop.controllers;

import com.cybershop.dto.SpecificationShowDTO;
import com.cybershop.models.Category;
import com.cybershop.models.Product;
import com.cybershop.services.CategoryService;
import com.cybershop.services.ProductService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
    ProductService productService;
    @Autowired
    CategoryService categoryService;

    @RequestMapping(value = {"/website/home"}, method = RequestMethod.GET)
    public String home() {
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
        List<Product> listSame = productService.findTop6ProductWithCateID(product.getCategoryID().getCateID());
//        System.out.println(listSame.size());
        if (listSame.size() > 6) {
            for (int i = 6; i < listSame.size();) {
                listSame.remove(i);
            }
        }
//        System.out.println(listSame.size());
        model.addAttribute("listSame", listSame);
        return "website/single_product";
    }

    @RequestMapping(value = {"/website/listproduct/{cateID}"}, method = RequestMethod.GET)
    public String list_product(@PathVariable("cateID") int cateID, Model model) throws JsonProcessingException {
        Category category = categoryService.findById(cateID);
        
        List<Product> list = productService.getByAll();
        String json = processListToJSON(list);
        int totalPage = processCaculatorPage(list.size());
        
        model.addAttribute("cateName", category.getCateName());
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("listProductJson", json);
        return "website/list_product";
    }

    public String processListToJSON(List<Product> list) throws JsonProcessingException {
        List<Product> newList = new ArrayList<>();
        Product newProduct;
        for (Product product : list) {
            newProduct = new Product();
            newProduct = productService.findByIdSimple(product.getProductID());
            String str = newProduct.getProductName();
            String strNew = str.replace("\"", "");
            newProduct.setProductName(strNew);
            newList.add(newProduct);
        }
        ObjectMapper mapper = new ObjectMapper();
        String json = null;
        json = mapper.writeValueAsString(newList);
        return json;
    }
    
    public int processCaculatorPage(int size){
        int totalPage = 1;
        if (size > 12) {
            float page = (float) size / (float) 12;
            totalPage = size / 12;
            if (page > totalPage) {
                totalPage++;
            }
        }
        return totalPage;
    }

    @RequestMapping(value = {"/website/cart"}, method = RequestMethod.GET)
    public String cart() {
        return "website/cart";
    }

    @RequestMapping(value = {"/website/checkout"}, method = RequestMethod.GET)
    public String check_out() {
        return "website/checkout";
    }

    @RequestMapping(value = {"/website/test"}, method = RequestMethod.GET)
    public String test() {
        return "website/test";
    }
}
