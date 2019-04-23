package com.cybershop.controllers;

import com.cybershop.models.Admin;
import com.cybershop.services.AdminService;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class HomeController {

    @Autowired
    private AdminService adminService;

    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String home(Model model) {
        return "home";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, HttpSession session, HttpServletRequest request) {
        Admin admin = checkCookies(request);
//        System.out.println(admin);
        if (admin == null) {
            model.addAttribute("formLogin", new Admin());
            return "/manager/loginManager/login";
        } else {
            Admin checkAdmin = adminService.login(admin);
            if (checkAdmin != null) {
                session.setAttribute("USER", checkAdmin);
                return "redirect:/manager/admin";
            } else {
                return "/manager/loginManager/login";
            }
        }

    }

    @RequestMapping(value = "/login/check", method = RequestMethod.POST)
    public String checklogin(@ModelAttribute("formLogin") Admin admin, RedirectAttributes ratts,
            HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        Admin a = adminService.login(admin);

        if (a != null) {
            session.setAttribute("USER", a);
            if (request.getParameter("remember") != null) {
                Cookie ckUsername = new Cookie("username", a.getUsername());
                ckUsername.setMaxAge(3600000);
                response.addCookie(ckUsername);
                Cookie ckPassword = new Cookie("password", a.getPassword());
                ckPassword.setMaxAge(36000000);
                response.addCookie(ckPassword);
            }
            return "redirect:/manager/admin";
        } else {
            ratts.addFlashAttribute("err", "not corect password or username");
            return "redirect:/login";

        }

    }

    public Admin checkCookies(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        Admin admin = null;
        String username = "", password = "";
        for (Cookie ck : cookies) {
             System.out.println("ck " + ck.getName());
            if (ck.getName().equalsIgnoreCase("username")) {
                username = ck.getValue();
                
            }
            if (ck.getName().equalsIgnoreCase("password")) {
                password = ck.getValue();
                
            }

        }
        if(username != "" && password != "") {
            admin = new Admin();
            admin.setUsername(username);
            admin.setPassword(password);
        }
      
        return admin;

    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        session.removeAttribute("USER");
        session.invalidate();
         Cookie[] cookies = request.getCookies();
         System.out.println(request.getCookies().toString());
        for (Cookie ck : cookies) {
            System.out.println("ck logout: " + ck.getName());
            if (ck.getName().equalsIgnoreCase("username")) {
                ck.setValue("");
                ck.setMaxAge(0);
                response.addCookie(ck);
            }
            if (ck.getName().equalsIgnoreCase("password")) {
                ck.setValue("");
                ck.setMaxAge(0);
                response.addCookie(ck);
            }
        }
        return "redirect:/login";
    }

}
