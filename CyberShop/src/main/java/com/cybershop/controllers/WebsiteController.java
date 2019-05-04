package com.cybershop.controllers;

import com.cybershop.services.BrandService;
import com.cybershop.dto.SpecificationShowDTO;
import com.cybershop.models.Brand;
import com.cybershop.models.Category;
import com.cybershop.models.Product;
import com.cybershop.services.BannerService;
import com.cybershop.services.CategoryService;
import com.cybershop.services.ProductService;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WebsiteController {
    
    private List<Integer> listInt = new ArrayList<>();
    
    @Autowired
    BrandService service;

    @Autowired
    ProductService productService;
    
    @Autowired
    CategoryService categoryService;
    
    @Autowired
    BannerService bannerService;

    @RequestMapping(value = {"/website/home"}, method = RequestMethod.GET)
    public String home(Model model) {
        Map<String, List<Category>> mapCategory = listMap();
        model.addAttribute("listPKCate", mapCategory.get("listPKCate"));
        model.addAttribute("listLKCate", mapCategory.get("listLKCate"));
        model.addAttribute("hotProduct", productService.findHotSaleProduct(10));
        model.addAttribute("newProduct", productService.findNewProduct(10));
        model.addAttribute("listBrand", service.getByAll());
        model.addAttribute("listBanner", bannerService.getByAll());
//        model.addAttribute("listCategory", categoryService.getByAll());
        return "website/home";
    }

    @RequestMapping(value = {"/website/singleproduct/{id}"}, method = RequestMethod.GET)
    public String single_product(@PathVariable("id") int id, Model model) {
//        listInt.clear();
        if (listInt.size() == 3) {
            System.out.println("Before ListViewed: " + listInt.toString());
            listInt.remove(0);
            System.out.println("After ListViewed: " + listInt.toString());
        }
        for (int i = 0; i < listInt.size(); i++) {
            if (listInt.get(i) != id) {
                listInt.add(id);
            }
        }
        System.out.println("ListView ID: " + listInt.toString());
        Map<String, List<Integer>> listProViewed = new HashMap<>();
        model.addAttribute("listBrand", service.getByAll());
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
        System.out.println(listSame.size());
        if (listSame.size() > 6) {
            for (int i = 6; i < listSame.size();) {
                listSame.remove(i);
            }
        }
        System.out.println(listSame.size());
        model.addAttribute("listSame", listSame);
        return "website/single_product";
    }

    @RequestMapping(value = {"/website/listproduct"}, method = RequestMethod.GET)
    public String list_product(Model model) {
//        model.addAttribute("listBrand", service.getByAll());
//        Map<String, List<Category>> mapCategory = listMap();
//        model.addAttribute("listPKCate", mapCategory.get("listPKCate"));
//        model.addAttribute("listLKCate", mapCategory.get("listLKCate"));
        List<Product> list = productService.getByAll();
        List<Product> newList = new ArrayList<>();
        Product newProduct;
        for (Product product : list) {
            newProduct = new Product();
            newProduct = productService.findById(product.getProductID());
            newList.add(newProduct);
        }
        ObjectMapper mapper = new ObjectMapper();
        String json = null;
        try {
            json = mapper.writeValueAsString(newList);
            System.out.println(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
        int totalPage = newList.size()/12;
//        if (newList.size() > 12) {
//            for (int i = 12; i < newList.size();) {
//                newList.remove(i);
//            }
//        }
//        model.addAttribute("listProduct", newList);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("listProductJson", json);

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

    public Map<String, List<Category>> listMap() {
        List<Category> listCate = categoryService.getByAll();
        List<Category> listPKCate = new ArrayList<>();
        List<Category> listLKCate = new ArrayList<>();
        for (Category cate : listCate) {
            if (cate.getType() == true) {
                listLKCate.add(cate);
            } else {
                listPKCate.add(cate);
            }
        }
        Map<String, List<Category>> mapCate = new HashMap<>();
        mapCate.put("listLKCate", listLKCate);
        mapCate.put("listPKCate", listPKCate);
        return mapCate;
    }
    
    @RequestMapping(value = {"/website/test"}, method = RequestMethod.GET)
    public String test() {
        return "website/test";
    }
    
    @RequestMapping(value = {"/website/login"}, method = RequestMethod.GET)
    public String checkLogin(HttpServletRequest request) {
        String username = request.getParameter("usernameLogin");
        String password = request.getParameter("passwordLogin");
        System.out.println("User: " + username+ "Pass: " + password);
        return "website/test";
    }
    
    @RequestMapping(value = "website/logout", method = RequestMethod.GET)
    private String logout(HttpSession session) {
        session.removeAttribute("CUSTOMER_INFO");
        session.invalidate();
        return "redirect:/website/home";
    }
}
