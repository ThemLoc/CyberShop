package com.cybershop.controllers;

import com.cybershop.models.Admin;
import com.cybershop.services.AdminService;
import com.cybershop.services.OrderService;
import java.security.Principal;
import java.util.Random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class HomeController {

    @Autowired
    private AdminService adminService;
    @Autowired
    private OrderService orderService;

//    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
//    public String home(Model model) {
//        return "home";
//    }


    @RequestMapping(value = {"/login", "/"})
    public String login(@RequestParam(value = "error", required = false) final String error, final Model model) {
        if (error != null) {
            model.addAttribute("message", "Login Failed!");
        }
       
        return "/manager/loginManager/login";
    }
    @RequestMapping("/logout")
	public String logout(final Model model) {
//		model.addAttribute("message", "Logged out!");
		return "/manager/loginManager/login";
	}

    @RequestMapping(value = "/forgot/{username}", method = RequestMethod.GET)
    public String forgotPassword(@PathVariable("username") String username, RedirectAttributes ratts) {
        Admin a = adminService.getByUser(username);

        if (a != null) {
            a.setPassword(randomPassword(5));
            adminService.save(a);
            Admin b = adminService.findById(a.getAdminID());
            orderService.sendEmailOrder("cybershop.nano@gmail.com", b.getEmail(), "Your Password", b.getPassword());
            ratts.addFlashAttribute("msgForgot", "Password have to reset in your email");
        } else {
            ratts.addFlashAttribute("err", "Not Corect username");
        }
        return "redirect:/login";
    }

    String randomPassword(int len) {
        String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        Random rnd = new Random();
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i <= len; i++) {
            sb.append(AB.charAt(rnd.nextInt(AB.length())));
        }
        return sb.toString();
    }
    
    @RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied(Principal user) {

		ModelAndView model = new ModelAndView();

		if (user != null) {
			model.addObject("msg", "Hi " + user.getName() 
			+ ", you do not have permission to access this page!");
		} else {
			model.addObject("msg", 
			"You do not have permission to access this page!");
		}

		model.setViewName("403");
		return model;

	}

}
