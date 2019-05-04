package com.cybershop.controllers;

import com.cybershop.models.Cart;
import com.cybershop.models.CartDTO;
import javax.servlet.http.HttpSession;
import com.cybershop.models.Product;
import com.cybershop.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("api/cart")
public class CartController {

    @Autowired
    ProductService productService;

    @RequestMapping
    public String showCart() {
        return "cart";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST,
            produces = {MediaType.ALL_VALUE})
    @ResponseBody
    public ResponseEntity<Product> addToCart(@RequestParam("productId") int productId,
            @RequestParam("qty") int qty,
            HttpSession session, RedirectAttributes ra) {
        String result = "";
        try {
            Product product = productService.findById(productId);
            result = addItem(session, product, qty);
        } catch (Exception e) {
            return new ResponseEntity("fail", HttpStatus.OK);
        }

        return new ResponseEntity(result, HttpStatus.OK);
    }

    @RequestMapping(value = "/remove/{id}", method = RequestMethod.POST,
            produces = {MediaType.ALL_VALUE})
    @ResponseBody
    public ResponseEntity<Product> removeCart(@PathVariable("id") int productId,
            HttpSession session, RedirectAttributes ra) {
        try {
            removeItem(session, productId);
        } catch (Exception e) {
            return new ResponseEntity("fail", HttpStatus.OK);
        }

        return new ResponseEntity("success", HttpStatus.OK);
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST,
            produces = {MediaType.ALL_VALUE})
    @ResponseBody
    public ResponseEntity<Product> updateCart(@RequestParam("productId") int productId,
            @RequestParam("qty") int qty,
            HttpSession session, RedirectAttributes ra) {
        System.out.println("ID:"+productId + "|Quantity : " + qty);
        try {
            Product product = productService.findById(productId);
            if (qty <= 0) {
                removeItem(session, productId);
            } else {
                updateItem(session, product, qty);
            }
        } catch (Exception e) {
            System.out.println("ERROR :" +e.getMessage());
            return new ResponseEntity("fail", HttpStatus.OK);
        }
        return new ResponseEntity("success", HttpStatus.OK);
    }

//    @RequestMapping(value = "/update", method = RequestMethod.GET)
//    public String updateToCart(@RequestParam("productId") int productId,
//            @RequestParam("qty") int qty,
//            HttpSession session, RedirectAttributes ra) {
//
//        Product product = productService.findById(productId);
//        if (qty <= 0) {
//            removeItem(session, productId);
//        } else {
//            updateItem(session, product, qty);
//        }
//
//        ra.addFlashAttribute("msg", "Updated cart successfully!");
//
//        return "redirect:/home";
//
//    }
//    @RequestMapping(value = "/remove", method = RequestMethod.GET)
//    public String removeCart(@RequestParam("productId") int productId,
//            HttpSession session, RedirectAttributes ra) {
//
//        removeItem(session, productId);
//
//        ra.addFlashAttribute("msg", "Removed item successfully!");
//
//        return "redirect:/cart";
//
//    }
    private String addItem(HttpSession session, Product product, int qty) {
        CartDTO cart = null;
        if (session.getAttribute("cart") == null) {
            cart = new CartDTO();
        } else {
            cart = (CartDTO) session.getAttribute("cart");
        }
        String result = cart.addItem(product, qty);
        cart.getTotalOrder();
        session.setAttribute("cart", cart);
        return result;
    }

    private void removeItem(HttpSession session, int productId) {
        CartDTO cart = null;
        if (session.getAttribute("cart") != null) {
            cart = (CartDTO) session.getAttribute("cart");
            cart.removeItem(productId);
            cart.getTotalOrder();
            session.setAttribute("cart", cart);
        }
    }

    private void updateItem(HttpSession session, Product product, int qty) {
        CartDTO cart = null;
        if (session.getAttribute("cart") != null) {
            cart = (CartDTO) session.getAttribute("cart");
            cart.updateItem(product, qty);
            cart.getTotalOrder();
            session.setAttribute("cart", cart);
        }
    }
}
