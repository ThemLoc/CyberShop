package com.cybershop.controllers;

import com.cybershop.dto.CreateProductDTO;
import com.cybershop.models.Brand;
import com.cybershop.models.Category;
import com.cybershop.models.Image;
import com.cybershop.models.Product;
import com.cybershop.models.SpecificationTitle;
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

@Controller
@RequestMapping("manager/product")
public class ProductController {

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
    private String add(@ModelAttribute("product") CreateProductDTO product, Model model) {
        Image img;
        List<Image> listImg = new ArrayList<>();

        System.out.println(listImg);
        Product dbProduct = new Product();
        Brand brand = new Brand();
        brand.setBrandID(product.getBrandID());

        Category category = new Category();
        category.setCateID(product.getCategoryID());
        System.out.println("___________Detail :" + product.getDetail());
        dbProduct.setProductName(product.getProductName());
        dbProduct.setDetail(product.getDetail());
        dbProduct.setPrice(product.getPrice());
        dbProduct.setQuantity(product.getQuantity());
        dbProduct.setStatus(product.getStatus());
        dbProduct.setBrandID(brand);
        dbProduct.setCategoryID(category);
        try {
            String fileName;
            File file;
            List<MultipartFile> listSubImg = product.getSubImg();
            MultipartFile mainImg = product.getMainImg();

            if (!mainImg.isEmpty()) {
                fileName = mainImg.getOriginalFilename();
                file = new File("/Users/chungnguyen/Google Drive/NANO/CyberShop/CyberShop/src/main/webapp/resources/image/img_product", fileName);
                mainImg.transferTo(file);
                img = new Image();
                img.setUrlImage(fileName);
                img.setMainImage(Boolean.TRUE);
                img.setProductID(dbProduct);
                listImg.add(img);
            }
            if (!listSubImg.isEmpty()) {
                for (MultipartFile subImg : listSubImg) {
                    fileName = subImg.getOriginalFilename();
                    file = new File("/Users/chungnguyen/Google Drive/NANO/CyberShop/CyberShop/src/main/webapp/resources/image/img_product", fileName);
                    subImg.transferTo(file);
                    img = new Image();
                    img.setUrlImage(fileName);
                    img.setProductID(dbProduct);
                    img.setMainImage(Boolean.FALSE);
                    listImg.add(img);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("message", "upload failed");
        }
        dbProduct.setImagesCollection(listImg);
//        model.addAttribute("product", dbProduct);
        productService.save(dbProduct);
        return "redirect:/manager/product/";
//        return "manager/product/productForm";
    }

//    @RequestMapping(value = {"/uploadfile"}, method = RequestMethod.POST)
//    private String uploadFile(@ModelAttribute("myFile") MyFile myFile, Model model) {
//        model.addAttribute("message", "upload success");
//        model.addAttribute("description", myFile.getDescription());
//
//        try {
//            List<MultipartFile> list = myFile.getMultipartFile();
//            for (MultipartFile subImg : list) {
//                System.out.println("######Path :" + subImg);
//                String fileName = subImg.getOriginalFilename();
//                File file = new File("/Users/chungnguyen/Google Drive/NANO/CyberShop/CyberShop/src/main/webapp/resources/image/img_product", fileName);
//                subImg.transferTo(file);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            model.addAttribute("message", "upload failed");
//        }
//        return "manager/product/resultest";
//    }
//
//    @RequestMapping(value = "/create", method = RequestMethod.GET)
//    private String create(Model model) {
//        model.addAttribute("listProduct", new Product());
//        return "manager/product/productForm";
//    }
//
//    @RequestMapping(value = "manager/product/save", method = RequestMethod.POST)
//    private String save(@ModelAttribute("productForm") Product obj, RedirectAttributes ratts) {
//        productService.save(obj);
//        ratts.addFlashAttribute("msg", "saved");
//        return "manager/product/productList";
//    }
//
//    @RequestMapping(value = "/manager/product/edit/{id}", method = RequestMethod.GET)
//    private String edit(@PathVariable("id") int id, Model model) {
//        model.addAttribute("productForm", productService.findById(id));
//        return "manager/product/productForm";
//    }
//
//    @RequestMapping(value = "/manager/product/delete/{id}", method = RequestMethod.GET)
//    private String delete(@PathVariable("id") int id, RedirectAttributes ratts) {
//        productServiceImpl.remove(id);
//        ratts.addFlashAttribute("msg", "deleted");
//        return "manager/product/productList";
//    }
}
