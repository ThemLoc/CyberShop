package com.cybershop.controllers;

import com.cybershop.services.BrandService;
import com.cybershop.dto.SpecificationShowDTO;
import com.cybershop.models.Brand;
import com.cybershop.services.BannerService;
import com.cybershop.models.Category;
import com.cybershop.models.Customer;
import com.cybershop.models.CustomerDTO;
import com.cybershop.models.Product;
import com.cybershop.models.Promotion;
import com.cybershop.services.CategoryService;
import com.cybershop.services.CustomerService;
import com.cybershop.services.OrderService;
import com.cybershop.services.ProductService;
import com.cybershop.services.PromotionService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
    PromotionService promotionService;

    @Autowired
    BannerService bannerService;

    @Autowired
    OrderService orderService;

    @Autowired
    BrandService brandService;

    @Autowired
    CustomerService customerService;

    @RequestMapping(value = {"/website/home"}, method = RequestMethod.GET)
    public String home(Model model, HttpSession session) {
        loadModel(model);
        List<Product> products = addViewedPro(session);
        if (products.isEmpty()) {
            model.addAttribute("viewedProduct", products);
        } else {
            List<Product> productViewed = new ArrayList<>();
            if (products.size() > 3) {
                for (int i = (products.size() - 1); i > (products.size() - 4); i--) {
                    productViewed.add(products.get(i));
                }
            } else {
                for (int i = (products.size() - 1); i >= 0; i--) {
                    productViewed.add(products.get(i));
                }
            }
            model.addAttribute("viewedProduct", productViewed);
        }
        model.addAttribute("sellProduct", productService.findSellProduct(3));
        model.addAttribute("hotProduct", productService.findHotSaleProduct(10));
        model.addAttribute("newProduct", productService.findNewProduct(10));
        model.addAttribute("hot3Product", productService.findHotSaleProduct(3));
        model.addAttribute("listBanner", bannerService.getByAll());
        return "website/home";
    }

    @RequestMapping(value = {"/website/singleproduct/{id}"}, method = RequestMethod.GET)
    public String single_product(@PathVariable("id") int id, Model model, HttpSession session) {
        if (!listInt.contains(id)) {
            listInt.add(id);
        }
        System.out.println("ListInt: " + listInt);
        session.setAttribute("viewedPro", listInt);
        loadModel(model);
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
        if (listSame.size() > 6) {
            for (int i = 6; i < listSame.size();) {
                listSame.remove(i);
            }
        }
        model.addAttribute("listSame", listSame);
        return "website/single_product";
    }

    @RequestMapping(value = {"/website/listproduct/{cateID}"}, method = RequestMethod.GET)
    public String list_product(@PathVariable("cateID") int cateID, Model model) throws JsonProcessingException {
        loadModel(model);
        Category category = categoryService.findById(cateID);

        List<Product> list = productService.findTop6ProductWithCateID(cateID);

        String json = processListToJSON(list);
        int totalPage = processCaculatorPage(list.size());

        model.addAttribute("cateName", category.getCateName());
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("listProductJson", json);
        return "website/list_product";
    }

    @RequestMapping(value = {"/website/listproduct/brand/{brandID}"}, method = RequestMethod.GET)
    public String list_productbybrand(@PathVariable("brandID") int brandID, Model model) throws JsonProcessingException {
        loadModel(model);
        Brand brand = brandService.findById(brandID);
        List<Product> list = productService.findAllProductWithBrandID(brandID);
        String json = processListToJSON(list);
        int totalPage = processCaculatorPage(list.size());

        model.addAttribute("cateName", brand.getBrandName());
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("listProductJson", json);
        return "website/list_product";
    }

    @RequestMapping(value = {"/website/listproduct/hot"}, method = RequestMethod.GET)
    public String list_hotproduct(Model model) throws JsonProcessingException {
        loadModel(model);
        List<Product> list = productService.findHotSaleProduct(10);
        String json = processListToJSON(list);
        int totalPage = processCaculatorPage(list.size());

        model.addAttribute("cateName", "Khuyến mãi hot");
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("listProductJson", json);
        return "website/list_product";
    }

    @RequestMapping(value = {"/website/listproduct/new"}, method = RequestMethod.GET)
    public String list_newproduct(Model model) throws JsonProcessingException {
        loadModel(model);
        List<Product> list = productService.findNewProduct(10);
        String json = processListToJSON(list);
        int totalPage = processCaculatorPage(list.size());

        model.addAttribute("cateName", "Hàng mới về");
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("listProductJson", json);
        return "website/list_product";
    }

    @RequestMapping(value = {"/website/listproduct/sell"}, method = RequestMethod.GET)
    public String list_sellproduct(Model model) throws JsonProcessingException {
        loadModel(model);
        List<Product> list = productService.findSellProduct(10);
        String json = processListToJSON(list);
        int totalPage = processCaculatorPage(list.size());

        model.addAttribute("cateName", "Bán chạy");
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("listProductJson", json);
        return "website/list_product";
    }

    @RequestMapping(value = {"/website/listproduct/viewed"}, method = RequestMethod.GET)
    public String list_viewedproduct(Model model, HttpSession session) throws JsonProcessingException {
        loadModel(model);
        List<Product> list = addViewedPro(session);
        String json = processListToJSON(list);
        int totalPage = processCaculatorPage(list.size());

        model.addAttribute("cateName", "Vừa xem");
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

    public int processCaculatorPage(int size) {
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
    public String cart(Model model) {
        loadModel(model);
        return "website/cart";
    }

    @RequestMapping(value = {"/website/checkout"}, method = RequestMethod.GET)
    public String check_out(Model model) {
        loadModel(model);
        model.addAttribute("CusomerInfor", new Customer());
        return "website/checkout";
    }

    @RequestMapping(value = {"/website/profile"}, method = RequestMethod.GET)
    public String profile(Model model, HttpSession session) {
        loadModel(model);
        if (session.getAttribute("CUSTOMER_INFO") != null) {
            Customer cus = (Customer) session.getAttribute("CUSTOMER_INFO");
            Customer customer = customerService.getByUser(cus.getUsername());
            CustomerDTO newCus = new CustomerDTO();
            newCus.setCustomerID(customer.getCustomerID());
            newCus.setAddress(customer.getAddress());
            newCus.setDob(new SimpleDateFormat("yyyy-MM-dd").format(customer.getDob()));
            newCus.setEmail(customer.getEmail());
            newCus.setFullname(customer.getFullname());
            newCus.setPhone(customer.getPhone());
            newCus.setPassword(customer.getPassword());
            newCus.setSex(customer.getSex());
            newCus.setUsername(customer.getUsername());
            model.addAttribute("customerForm", newCus);
        }
        return "website/profile";
    }

    @RequestMapping(value = {"/website/customer/save"}, method = RequestMethod.POST)
    private String saveCus(@ModelAttribute CustomerDTO cus) {
        try {
            Customer newCus = customerService.getByUser(cus.getUsername());
            newCus.setAddress(cus.getAddress());
            newCus.setDob(new SimpleDateFormat("yyyy-MM-dd").parse(cus.getDob()));
            newCus.setEmail(cus.getEmail());
            newCus.setFullname(cus.getFullname());
            newCus.setPhone(cus.getPhone());
            newCus.setPassword(cus.getPassword());
            newCus.setSex(cus.getSex());
            newCus.setUsername(cus.getUsername());
            newCus.setOrder1Collection(null);
            customerService.save(newCus);
        } catch (Exception e) {
        }
        return "redirect:/website/profile";
    }

    @RequestMapping(value = {"/website/orderhistory"}, method = RequestMethod.GET)
    public String orderhistory(Model model, HttpSession session) {
        Customer cus = (Customer) session.getAttribute("CUSTOMER_INFO");
        System.out.println("Customer in history: " + cus.getCustomerID());
        model.addAttribute("listOrder", orderService.findByCusID(cus.getCustomerID()));
        loadModel(model);
        return "website/orderhistory";
    }

    public void loadModel(Model model) {
        Map<String, List<Category>> mapCategory = listMap();
        model.addAttribute("listPKCate", mapCategory.get("listPKCate"));
        model.addAttribute("listLKCate", mapCategory.get("listLKCate"));
        model.addAttribute("listBrand", service.getByAll());
        model.addAttribute("selectCate", categoryService.getByAll());
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

    @RequestMapping(value = {"/website/contact"}, method = RequestMethod.GET)
    public String contact(Model model) {
        loadModel(model);
        return "website/contact";
    }

    @RequestMapping(value = "website/search/{cateID}&{search}", method = RequestMethod.GET)
    private String search(@PathVariable("cateID") int cateID, @PathVariable("search") String search, Model model) throws JsonProcessingException {
        loadModel(model);
        List<Product> list = productService.searchProduct(cateID, search);
        String json = processListToJSON(list);
        int totalPage = processCaculatorPage(list.size());

        model.addAttribute("cateName", "Vừa xem");
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("listProductJson", json);
        return "website/list_product";
    }

    public List<Product> addViewedPro(HttpSession session) {
        Product product;
        List<Product> listPro = new ArrayList<>();
        if (session.getAttribute("viewedPro") == null) {
            return listPro;
        }
        List<Integer> listId = (List<Integer>) session.getAttribute("viewedPro");
        if (!listId.isEmpty()) {
            for (int id : listId) {
                product = productService.findById(id);
                listPro.add(product);
            }
        }
        return listPro;
    }

}
