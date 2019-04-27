package com.cybershop.controllers;

import com.cybershop.models.Admin;
import com.cybershop.services.AdminService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("manager/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping(method = RequestMethod.GET)
    private String list(Model model) {
        model.addAttribute("listAdmin", adminService.getByAll());
        model.addAttribute("adminForm", new Admin());
        return "manager/admin/adminList";
    }

//    @RequestMapping(value = "/admin/member/create", method = RequestMethod.GET)
//    private String create(Model model) {
//        model.addAttribute("adminForm", new Admin());
//        return "manager/admin/adminList";
//    }
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    private String save(@ModelAttribute("adminForm") Admin obj, RedirectAttributes ratts, HttpServletRequest request) {
        try {
            String yob = request.getParameter("dayYob");
            System.out.println("yob" + yob);
            if (yob != null) {
                try {
                    Date dob = new SimpleDateFormat("yyyy-MM-dd").parse(yob);
                    if (dob != null) {
                        obj.setDob(dob);
                        obj.setStatus(true);
                        adminService.save(obj);
                        ratts.addFlashAttribute("msg", "saved");
                    }
                } catch (ParseException ex) {
                    Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                obj.setStatus(true);
                adminService.save(obj);
                ratts.addFlashAttribute("msg", "saved");
            }
        } catch (Exception e) {
            ratts.addFlashAttribute("err", "Update Fail");
        }

        return "redirect:/manager/admin";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    private String edit(@PathVariable("id") int id, Model model) {
        System.out.println("acount: " + adminService.findById(id));
        model.addAttribute("adminForm", adminService.findById(id));
        return "manager/admin/adminForm";
    }

    @RequestMapping(value = "/delete/{id}/{status}", method = RequestMethod.GET)
    private String delete(@PathVariable("id") int id, @PathVariable("status") boolean status, RedirectAttributes ratts) {
        adminService.remove(id, status);
        ratts.addFlashAttribute("msg", "deleted success");
        return "redirect:/manager/admin";
    }

    @ModelAttribute("listRole")
    public List<String> listRole(Model model) {
        return Arrays.asList("ADMIN", "EMPLOYEE");
    }

}
