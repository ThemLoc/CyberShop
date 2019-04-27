package com.cybershop.controllers;

import com.cybershop.models.Promotion;
import com.cybershop.services.PromotionService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/manager/promotion")
public class PromotionController {

    @Autowired
    private PromotionService service;

    @RequestMapping(method = RequestMethod.GET)
    private String list(Model model) {
        model.addAttribute("listPromotion", service.getByAll());
        model.addAttribute("promotionAttr", new Promotion());
        return "manager/promotion/promotionList";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    private String add(HttpServletRequest request) throws ParseException {
        Promotion promotion = new Promotion();
        promotion.setPromoCode(request.getParameter("promoCode"));
        promotion.setDiscount(request.getParameter("discount") + "%");
        promotion.setStartTime(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("startTime")));
        promotion.setEndTime(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("endTime")));
        promotion.setUsedTurn(Integer.parseInt(request.getParameter("usedTurn")));
        service.save(promotion);
        return "redirect:/manager/promotion";
    }
    
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    private String delete(@PathVariable("id") int id) {
        service.remove(id);
        return "redirect:/manager/promotion";
    }
    
    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    private String update(@PathVariable("id") int id, HttpServletRequest request) throws ParseException {
        Promotion promotion = new Promotion();
        promotion.setPromoID(id);
        promotion.setPromoCode(request.getParameter("promoCodeUpdate"));
        promotion.setDiscount(request.getParameter("discountUpdate") + "%");
        promotion.setStartTime(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("startTimeUpdate")));
        promotion.setEndTime(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("endTimeUpdate")));
        promotion.setUsedTurn(Integer.parseInt(request.getParameter("usedTurnUpdate")));
        service.save(promotion);
        return "redirect:/manager/promotion";
    }
}
