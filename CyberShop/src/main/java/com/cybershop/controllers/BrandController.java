package com.cybershop.controllers;

import com.cybershop.dto.CreateBrandDTO;
import com.cybershop.models.Brand;
import com.cybershop.services.BrandService;
import com.cybershop.services.ImageService;
import com.cybershop.services.ProductService;
import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/manager/brand")
public class BrandController {

    @Autowired
    private BrandService service;

    @Autowired
    private ProductService productService;
    
    @Autowired
    private ImageService imageService;
    
    @RequestMapping(method = RequestMethod.GET)
    private String list(Model model) {
        model.addAttribute("newBrand", new Brand());
        model.addAttribute("listBrand", service.getByAll());
        model.addAttribute("count", service.getCountproduct());
        return "manager/brand/brandList";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    private String add(@ModelAttribute("newBrand") CreateBrandDTO newBrand, HttpServletRequest request) {
        try {
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            MultipartFile imageURL = newBrand.getUrlImg();
            String fileName = imageService.uploadFile(imageURL);
//            File file = new File("E:/FNano/ProjectNANO/newCyberShop/CyberShop/src/main/webapp/resources/image/img_brand", fileName);
//            imageURL.transferTo(file);
            Brand brand = new Brand();
            brand.setBrandName(newBrand.getBrandName());
            brand.setImageURL(fileName);
            System.out.println("FILE: " + fileName);
            service.save(brand);
        } catch (IllegalStateException ex) {
            Logger.getLogger(BrandController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "redirect:/manager/brand";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    private String delete(@PathVariable("id") int id, RedirectAttributes ra) {
        int check = productService.countPdByBrandID(id);
        if (check == 0) {
            service.remove(id);
            ra.addFlashAttribute("msg", "Delete Successful!");
        } else {
            ra.addFlashAttribute("msg", "Delete Fail!");
        }
        return "redirect:/manager/brand";
    }
}
