package com.cybershop.controllers;

import com.cybershop.models.Cart;
import com.cybershop.models.CartDTO;
import javax.servlet.http.HttpSession;
import com.cybershop.models.Product;
import com.cybershop.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/cart")
public class CartController {
    
    @Autowired
    ProductService productService;
    
    @RequestMapping
    public String showCart() {
        return "cart";
    }
    
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addToCart(@RequestParam("productId") int productId,
            @RequestParam("qty") int qty,
            HttpSession session, RedirectAttributes ra) {
        
        Product product = productService.findById(productId);
        addItem(session, product, qty);
        
        ra.addFlashAttribute("msg", "Added item successfully!");
        
        return "redirect:/home";
        
    }
    
     @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String updateToCart(@RequestParam("productId") int productId,
            @RequestParam("qty") int qty,
           
            HttpSession session, RedirectAttributes ra) {
        
        Product product = productService.findById(productId);
        if (qty <= 0) {
            removeItem(session, productId);
        } else {
            updateItem(session, product, qty);
        }
        
        ra.addFlashAttribute("msg", "Updated cart successfully!");
        
        return "redirect:/home";
        
    }
    
     @RequestMapping(value = "/remove", method = RequestMethod.GET)
    public String removeCart(@RequestParam("productId") int productId,
            
            HttpSession session, RedirectAttributes ra) {
        
        
        removeItem(session, productId);
        
        ra.addFlashAttribute("msg", "Removed item successfully!");
        
        return "redirect:/cart";
        
    }

    private void addItem(HttpSession session, Product product, int qty) {
        CartDTO cart = null;
        if (session.getAttribute("cart") == null) {
            cart = new CartDTO();
        } else {
            cart = (CartDTO) session.getAttribute("cart");
        }
        cart.addItem(product, qty);  
        session.setAttribute("cart", cart);
    }

    private void removeItem(HttpSession session, int productId) {
        CartDTO cart = null;
        if (session.getAttribute("cart") != null) {
            cart = (CartDTO) session.getAttribute("cart");
             cart.removeItem(productId);  
             session.setAttribute("cart", cart);
        }
    }

    private void updateItem(HttpSession session, Product product, int qty) {
        CartDTO cart = null;
        if (session.getAttribute("cart") != null) {
            cart = (CartDTO) session.getAttribute("cart");
             cart.updateItem(product, qty);
             session.setAttribute("cart", cart);
        }
    }
}
