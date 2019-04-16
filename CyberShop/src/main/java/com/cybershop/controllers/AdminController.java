/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cybershop.controllers;

import com.cybershop.models.Admin;
import com.cybershop.services.AdminServiceImpl;
import java.util.Arrays;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author ngthe
 */
@Controller
@RequestMapping("/admin/member")
public class AdminController {

    @Autowired
    private AdminServiceImpl adminServiceImpl;

    @RequestMapping(method = RequestMethod.GET)
    private String list(Model model) {
        model.addAttribute("listAdmin", adminServiceImpl.getByAll());
        return "/admin/adminList";
    }

    @RequestMapping(value = "/admin/member/create", method = RequestMethod.GET)
    private String create(Model model) {
        model.addAttribute("listAdmin", new Admin());
        return "/admin/adminForm";
    }

     @RequestMapping(value = "/admin/member/save", method = RequestMethod.POST)
    private String save( @ModelAttribute("adminForm") Admin obj, RedirectAttributes ratts) {
        adminServiceImpl.save(obj);
        ratts.addFlashAttribute("msg", "saved");
        return "/admin/adminList";
    }
    @RequestMapping(value = "/admin/member/edit/{id}", method = RequestMethod.GET)
    private String edit(@PathVariable("id") int id,Model model) {
        model.addAttribute("adminForm", adminServiceImpl.findById(id));
        return "/admin/adminForm";
    }

    @RequestMapping(value = "/admin/member/delete/{id}", method = RequestMethod.GET)
    private String delete(@PathVariable("id") int id, RedirectAttributes ratts) {
        adminServiceImpl.remove(id);
        ratts.addFlashAttribute("msg", "deleted");
        return "/admin/AdminList";
    }

    @ModelAttribute("listRole")
    public List<String> listRole(Model model) {
        return Arrays.asList("Admin", "Employee");
    }
}
