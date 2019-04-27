package com.cybershop.controllers;

import com.cybershop.models.StoreInformation;
import com.cybershop.services.StoreInformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/manager/storeinfo")
public class StoreInfoController {
    
    @Autowired
    private StoreInformationService service;
    
    @RequestMapping(method = RequestMethod.GET)
    private String list(Model model) {
        model.addAttribute("listStore", service.getByAll());
        model.addAttribute("StoreInfo", new StoreInformation());
        return "manager/storeinfo/storeList";
    }
    
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    private String updateStoreInfo(@ModelAttribute("StoreInfo") StoreInformation storeInformation) {
        service.save(storeInformation);
        return "redirect:/manager/storeinfo";
    }
    
}
