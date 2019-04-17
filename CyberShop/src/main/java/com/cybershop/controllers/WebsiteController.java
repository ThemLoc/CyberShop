package com.cybershop.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WebsiteController {

    @RequestMapping(value = {"/website/home"}, method = RequestMethod.GET)
    public String home() {
        return "website/home";
    }

    @RequestMapping(value = {"/website/singleproduct"}, method = RequestMethod.GET)
    public String single_product() {
        return "website/single_product";
    }

    @RequestMapping(value = {"/website/listproduct"}, method = RequestMethod.GET)
    public String list_product() {
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
}
