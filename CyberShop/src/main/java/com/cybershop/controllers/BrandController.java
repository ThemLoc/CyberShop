package com.cybershop.controllers;

import com.cybershop.models.Banner;
import com.cybershop.models.Brand;
import com.cybershop.models.Product;
import com.cybershop.services.BrandService;
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

    @RequestMapping(method = RequestMethod.GET)
    private String list(Model model) {
        model.addAttribute("newBrand", new Brand());
        model.addAttribute("listBrand", service.getByAll());
        return "manager/brand/brandList";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    private String add(@ModelAttribute("newBrand") Brand newBrand, HttpServletRequest request) {
        try {
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            MultipartFile imageURL = multipartRequest.getFile("urlImage");
            String fileName = imageURL.getOriginalFilename();
            File file = new File("E:/FNano/ProjectNANO/newCyberShop/CyberShop/src/main/webapp/resources/image/img_brand", fileName);
            imageURL.transferTo(file);
            newBrand.setImageURL(fileName);
            System.out.println("FILE: " + fileName);
            service.save(newBrand);
        } catch (IOException ex) {
            Logger.getLogger(BrandController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalStateException ex) {
            Logger.getLogger(BrandController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "redirect:/manager/brand";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    private String delete(@PathVariable("id") int id, RedirectAttributes ra) {
        Brand abrand = service.findById(id);
        System.out.println("abrand: " + abrand.getProductCollection());
        if (abrand.getProductCollection().isEmpty()) {
            service.remove(abrand.getBrandID());
        } else {
            ra.addFlashAttribute("msg", "Can't delete this brand, because !");
        }
//        service.remove(abrand.getBrandID());
        ra.addFlashAttribute("msg", "Deleted!");
        return "redirect:/manager/brand";
    }
}
