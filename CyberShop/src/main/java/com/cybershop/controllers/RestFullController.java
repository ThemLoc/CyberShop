package com.cybershop.controllers;

import com.cybershop.models.Brand;
import com.cybershop.models.Category;
import com.cybershop.models.Customer;
import com.cybershop.models.Image;
import com.cybershop.services.BrandService;
import com.cybershop.services.ImageService;
import java.io.File;
import java.io.IOException;
import com.cybershop.models.OrderDetail;
import com.cybershop.models.Product;
import com.cybershop.models.SpecificationTitle;
import com.cybershop.services.CategoryService;
import com.cybershop.services.CustomerService;
import com.cybershop.services.OrderDetailService;
import com.cybershop.services.OrderService;
import com.cybershop.services.ProductService;
import com.cybershop.services.SpecificationTitleService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/api")
public class RestFullController {

    final String saveDirectory = "E:/FNano/ProjectNANO/newCyberShop/";
    Logger log = Logger.getLogger(RestFullController.class.getName());

    @Autowired
    private SpecificationTitleService specificationTitleService;

    @Autowired
    private OrderDetailService orderDetailService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private ProductService productService;

    @Autowired
    private BrandService brandService;

    @Autowired
    private ImageService imageService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    CustomerService customerService;

    @RequestMapping(value = "/findSpec/{id}", method = RequestMethod.GET,
            produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity<List<SpecificationTitle>> getSpecByCateID(@PathVariable("id") int id) {
        List<SpecificationTitle> listSpec = specificationTitleService.getByCategory(id);
        if (listSpec.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(listSpec, HttpStatus.OK);
    }

    @RequestMapping(value = "/findProduct/{id}", method = RequestMethod.GET,
            produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity<Product> getProductDetail(@PathVariable("id") int id) {
        Product product = productService.findById(id);
        if (product == null) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity(product, HttpStatus.OK);
    }

    @RequestMapping(value = "/changeStatus/{id}/{status}", method = RequestMethod.POST,
            produces = {MediaType.ALL_VALUE})
    @ResponseBody
    public ResponseEntity<Product> changeStatusProduct(@PathVariable("id") int id, @PathVariable("status") boolean status) {
        try {
            productService.changeStatus(id, status);
        } catch (Exception e) {
            return new ResponseEntity("fail", HttpStatus.OK);
        }

        return new ResponseEntity("success", HttpStatus.OK);
    }

    @RequestMapping(value = "/getBrand", method = RequestMethod.GET,
            produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity<List<Brand>> getBrand() {
        List<Brand> listBrand = brandService.getByAll();
        if (listBrand.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(listBrand, HttpStatus.OK);
    }

    @RequestMapping(value = "/updateOther", method = RequestMethod.POST,
            produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity updateOther(
            @RequestParam("productID") String productID,
            @RequestParam("productName") String productName,
            @RequestParam("price") String price,
            @RequestParam("downPrice") String downPrice,
            @RequestParam("quantity") String quantity,
            @RequestParam("brandID") String brandID) {
        try {
            Product product = new Product();
            int id = Integer.parseInt(productID);
            System.out.println(id);
            product.setProductID(id);
            int brandIDpare = Integer.parseInt(brandID);
            Brand brand = new Brand();
            brand.setBrandID(brandIDpare);
            product.setProductName(productName);
            product.setQuantity(Integer.parseInt(quantity));
            product.setPrice(Double.parseDouble(price));
            if (!downPrice.isEmpty()) {
                product.setDownPrice(Double.parseDouble(downPrice));
            }
            product.setBrandID(brand);
            productService.updateOtherInfo(product);
        } catch (Exception e) {
            return new ResponseEntity("fail", HttpStatus.OK);

        }

        return new ResponseEntity("success", HttpStatus.OK);
    }

    @RequestMapping(value = "/updateImageProduct", method = RequestMethod.POST,
            produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity updateImageProduct(
            @RequestParam("productID") String productID,
            @RequestParam("mainImg") MultipartFile mainImage,
            @RequestParam("subImg") ArrayList<MultipartFile> subImage) throws IOException {
        List<Image> listImg = new ArrayList<>();
        File file;
        Image img;
        String fileName;

        int id = Integer.parseInt(productID);
        Product product = new Product();
        product.setProductID(id);
        try {
            if (!mainImage.isEmpty()) {
                fileName = mainImage.getOriginalFilename();
                file = new File(saveDirectory + "CyberShop/src/main/webapp/resources/image/img_product", fileName);
                mainImage.transferTo(file);
                img = new Image();
                img.setUrlImage(fileName);
                img.setMainImage(Boolean.TRUE);
                img.setProductID(product);
                imageService.updateMainImage(img);
            }

            for (MultipartFile subImg : subImage) {
                if (!subImage.isEmpty()) {
                    fileName = subImg.getOriginalFilename();
                    file = new File(saveDirectory + "CyberShop/src/main/webapp/resources/image/img_product", fileName);
                    subImg.transferTo(file);
                    img = new Image();
                    img.setUrlImage(fileName);
                    img.setProductID(product);
                    img.setMainImage(Boolean.FALSE);
                    listImg.add(img);
                }
                imageService.updateSubImage(listImg);
            }
        } catch (Exception e) {
            return new ResponseEntity("fail", HttpStatus.OK);
        }

        return new ResponseEntity("success", HttpStatus.OK);
    }

    @RequestMapping(value = "/updateSpec", method = RequestMethod.POST,
            produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity updateSpecification(
            @RequestParam("productID") String productID,
            @RequestParam("detail") String detail,
            @RequestParam("cateID") String cateID) {
        if (productID.equals("") || detail.equals("") || cateID.equals("")) {
            return new ResponseEntity("fail", HttpStatus.OK);
        }
        productService.updateSpecification(Integer.parseInt(productID), Integer.parseInt(cateID), detail);

        return new ResponseEntity("success", HttpStatus.OK);
    }

    @RequestMapping(value = "/findOrderDetail/{id}", method = RequestMethod.GET,
            produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity<List<OrderDetail>> findByOrderID(@PathVariable("id") int id) {
        log.info("find member " + id);

        List<OrderDetail> list = orderDetailService.findByOrderID(id);
        if (list == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        final List<OrderDetail> dtos = new ArrayList<>();
        for (OrderDetail order : list) {
            OrderDetail orderdetail = new OrderDetail();
            orderdetail.setPrice(order.getPrice());
            orderdetail.setQuantity(order.getQuantity());
            orderdetail.setProductID(order.getProductID());
            dtos.add(orderdetail);
        }
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @RequestMapping(value = "/addCategory", method = RequestMethod.POST,
            produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity addCategory(
            @RequestParam("listSpec[]") List<String> listSpec,
            @RequestParam("cateName") String cateName,
            @RequestParam("selectType") int type) {
        try {
            Category category = new Category();
            category.setCateName(cateName);
            if (type == 1) {
                category.setType(Boolean.TRUE);
            } else {
                category.setType(Boolean.FALSE);
            }
            List<SpecificationTitle> newlistSpec = new ArrayList<>();
            SpecificationTitle specTitle = new SpecificationTitle();
            for (String spec : listSpec) {
                specTitle = new SpecificationTitle();
                specTitle.setSpecName(spec);
                specTitle.setCateID(category);
                newlistSpec.add(specTitle);
            }
            category.setSpecificationTitleCollection(newlistSpec);
            categoryService.save(category);
        } catch (Exception e) {
            System.out.println("ERROR in addCategory :" + e.getMessage());
            return new ResponseEntity("fail", HttpStatus.OK);
        }

        return new ResponseEntity("success", HttpStatus.OK);
    }

    @RequestMapping(value = "/deleteCategory/{id}", method = RequestMethod.POST,
            produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity deleteCategory(@PathVariable("id") int id) {
        try {
            int check = productService.countByCateID(id);
            if (check == 0) {
                categoryService.remove(id);
            } else {
                return new ResponseEntity("reload", HttpStatus.OK);
            }
        } catch (Exception e) {
            System.out.println("ERROR in deleteCategory :" + e.getMessage());
            return new ResponseEntity("fail", HttpStatus.OK);
        }

        return new ResponseEntity("success", HttpStatus.OK);
    }

    @RequestMapping(value = "/getCategoryByIDWithSpec/{id}", method = RequestMethod.GET,
            produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity getCategoryByIDWithSpec(@PathVariable("id") int id) {
        Category category = new Category();
        try {
            category = categoryService.findById(id);
            List<SpecificationTitle> listSpec = specificationTitleService.getByCategory(id);
            category.setSpecificationTitleCollection(listSpec);
        } catch (Exception e) {
            System.out.println("ERROR in deleteCategory :" + e.getMessage());
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity(category, HttpStatus.OK);
    }

    @RequestMapping(value = "/updateCategory", method = RequestMethod.POST,
            produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity updateCategory(
            @RequestParam("listSpec[]") List<String> listSpec,
            @RequestParam("cateName") String cateName,
            @RequestParam("selectType") int type,
            @RequestParam("cateID") int cateID) {
        try {
            Category category = new Category();
            category.setCateName(cateName);
            category.setCateID(cateID);
            if (type == 1) {
                category.setType(Boolean.TRUE);
            } else {
                category.setType(Boolean.FALSE);
            }
            List<SpecificationTitle> newlistSpec = new ArrayList<>();
            SpecificationTitle specTitle = new SpecificationTitle();
            for (String spec : listSpec) {
                specTitle = new SpecificationTitle();
                specTitle.setSpecName(spec);
                specTitle.setCateID(category);
                newlistSpec.add(specTitle);
            }
            System.out.println(newlistSpec);
            category.setSpecificationTitleCollection(newlistSpec);
            specificationTitleService.removeByCateID(cateID);
            categoryService.save(category);
        } catch (Exception e) {
            System.out.println("===========> ERROR in UpdateCategory :" + e.getMessage());
            return new ResponseEntity("fail", HttpStatus.OK);
        }

        return new ResponseEntity("success", HttpStatus.OK);
    }

    @RequestMapping(value = "/userLogin", method = RequestMethod.POST,
            produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity<String> checkLogin(@RequestParam("user") String username, @RequestParam("pass") String password, HttpSession session) {
        System.out.println("User: " + username + "Pass: " + password);
        final Customer cus = customerService.checkLogin(username, password);
        System.out.println("Customer: " + cus);
        if (cus != null) {
            if (cus.getStatus()) {
                session.setAttribute("CUSTOMER_INFO", cus);
                return new ResponseEntity("success", HttpStatus.OK);
            } else {
                Thread t = new Thread(new Runnable() {
                    @Override
                    public void run() {
                        orderService.sendEmailOrder("cybershop.nano@gmail.com", cus.getEmail(), "Mã xác thực ", "Mã xác thực tài khoản của bạn là: " + cus.getToken());
                    }
                });
                t.start();
                return new ResponseEntity("notyetconfirm", HttpStatus.OK);
            }
        } else {
            return new ResponseEntity("fail", HttpStatus.OK);
        }
    }
    
    @RequestMapping(value = "/logout", method = RequestMethod.POST,
            produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity<String> logout(HttpSession session) {
        session.removeAttribute("CUSTOMER_INFO");
        session.invalidate();
        return new ResponseEntity("success", HttpStatus.OK);
    }

    @RequestMapping(value = "/forgotPass", method = RequestMethod.POST,
            produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity<String> refreshPassword(@RequestParam("userForgot") String username) {
        Customer cus = customerService.getByUser(username);
        System.out.println("Customer: " + cus);
        if (cus != null) {
            cus.setPassword(randomPassword(10));
            customerService.save(cus);
            orderService.sendEmailOrder("cybershop.nano@gmail.com", cus.getEmail(), "Your Password is: ", cus.getPassword());
            return new ResponseEntity("success", HttpStatus.OK);
        } else {
            return new ResponseEntity("fail", HttpStatus.OK);
        }
    }

    String randomPassword(int len) {
        String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        Random rnd = new Random();
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i <= len; i++) {
            sb.append(AB.charAt(rnd.nextInt(AB.length())));
        }
        return sb.toString();
    }

    @RequestMapping(value = "/createCus", method = RequestMethod.POST,
            produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity createCustomer(
            @RequestParam("usernamecreate") String username,
            @RequestParam("passwordcreate") String password,
            @RequestParam("emailcreate") String email,
            @RequestParam("fullnamecreate") String fullname,
            @RequestParam("addresscreate") String address,
            @RequestParam("phonecreate") String phone,
            @RequestParam("dobcreate") String dob,
            @RequestParam("sexCheck") String sex) throws IOException {
        try {
            if (customerService.getByUser(username) != null) {
                return new ResponseEntity("usernameExist", HttpStatus.OK);
            }
            final Customer cus = new Customer();
            cus.setUsername(username);
            cus.setPassword(password);
            cus.setFullname(fullname);
            if (sex.equals("1")) {
                cus.setSex(true);
            } else {
                cus.setSex(false);
            }
            cus.setAddress(address);
            cus.setPhone(phone);
            cus.setIsGuest(false);
            cus.setStatus(false);
            cus.setEmail(email);
            cus.setDateRegistration(new Date());
            cus.setToken(randomPassword(10));
            cus.setDob(new SimpleDateFormat("yyyy-MM-dd").parse(dob));
            System.out.println("Customer: " + cus);
            customerService.save(cus);
            Thread t = new Thread(new Runnable() {
                @Override
                public void run() {
                    orderService.sendEmailOrder("cybershop.nano@gmail.com", cus.getEmail(), "Mã xác thực ", "Mã xác thực tài khoản của bạn là: " + cus.getToken());
                }
            });
            t.start();
        } catch (ParseException ex) {
            System.out.println("ERROR: " + ex.getMessage());
        }
        return new ResponseEntity("success", HttpStatus.OK);
    }
    
    @RequestMapping(value = "/confirmEmail", method = RequestMethod.POST,
            produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity<String> confirmEmail(@RequestParam("confirmCode") String confirmCode,
            @RequestParam("userCus") String userCus, HttpSession session) {
        Customer cus = customerService.getByUser(userCus);
        System.out.println("Customer: " + cus);
        if (cus != null) {
            String token = cus.getToken();
            if (confirmCode.equals(token)) {
                cus.setStatus(true);
                customerService.save(cus);
                session.setAttribute("CUSTOMER_INFO", cus);
                return new ResponseEntity("success", HttpStatus.OK);
            } else {
                return new ResponseEntity("failConfirm", HttpStatus.OK);
            }
        } else {
            return new ResponseEntity("fail", HttpStatus.OK);
        }
    }

}
