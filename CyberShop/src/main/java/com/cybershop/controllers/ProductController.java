package com.cybershop.controllers;

import com.cybershop.dto.CreateProductDTO;
import com.cybershop.models.Brand;
import com.cybershop.models.Category;
import com.cybershop.models.Image;
import com.cybershop.models.Product;
import com.cybershop.other.MyFile;
import com.cybershop.services.BrandService;
import com.cybershop.services.CategoryService;
import com.cybershop.services.ProductService;
import com.cybershop.services.SpecificationTitleService;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("manager/product")
public class ProductController {

    final String saveDirectory = "/Users/chungnguyen/Google Drive/NANO/CyberShop/";

    @Autowired
    private ProductService productService;

    @Autowired
    private SpecificationTitleService specificationTitleService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private BrandService brandService;

    @RequestMapping(value = {""}, method = RequestMethod.GET)
    private String list(Model model) {
        model.addAttribute("categoryWithSpec", categoryService.getByAll());
        model.addAttribute("listBrand", brandService.getByAll());
        model.addAttribute("listProduct", productService.getByAll());
        model.addAttribute("product", new CreateProductDTO());
        model.addAttribute("myFile", new MyFile());
        return "manager/product/productList";
    }

    @RequestMapping(value = {"/add"}, method = RequestMethod.POST)
    private String add(@ModelAttribute("product") CreateProductDTO product, Model model, RedirectAttributes rd) {
        try {
            Image img;
            List<Image> listImg = new ArrayList<>();

            System.out.println(listImg);
            Product dbProduct = new Product();
            Brand brand = new Brand();
            brand.setBrandID(product.getBrandID());

            Category category = new Category();
            category.setCateID(product.getCategoryID());
            dbProduct.setProductName(product.getProductName());
            dbProduct.setDetail(product.getDetail());
            dbProduct.setPrice(product.getPrice());
            dbProduct.setQuantity(product.getQuantity());
            dbProduct.setSell(0);
            dbProduct.setStatus(product.getStatus());
            dbProduct.setBrandID(brand);
            dbProduct.setCategoryID(category);
            String fileName;
            File file;
            List<MultipartFile> listSubImg = product.getSubImg();
            MultipartFile mainImg = product.getMainImg();
            if (!mainImg.isEmpty()) {
                fileName = mainImg.getOriginalFilename();
                file = new File(saveDirectory + "CyberShop/src/main/webapp/resources/image/img_product", fileName);
                mainImg.transferTo(file);
                img = new Image();
                img.setUrlImage(fileName);
                img.setMainImage(Boolean.TRUE);
                img.setProductID(dbProduct);
                listImg.add(img);
            }
            for (MultipartFile subImg : listSubImg) {
                if (!subImg.isEmpty()) {
                    fileName = subImg.getOriginalFilename();
                    file = new File(saveDirectory + "CyberShop/src/main/webapp/resources/image/img_product", fileName);
                    subImg.transferTo(file);
                    img = new Image();
                    img.setUrlImage(fileName);
                    img.setProductID(dbProduct);
                    img.setMainImage(Boolean.FALSE);
                    listImg.add(img);
                }
            }
            dbProduct.setImagesCollection(listImg);
            productService.save(dbProduct);
        } catch (Exception e) {
            rd.addFlashAttribute("msgFail", "ADD fail!");
        }
        rd.addFlashAttribute("msgSuccess", "ADD success!");
        return "redirect:/manager/product/";
    }
}
