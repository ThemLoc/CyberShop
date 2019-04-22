/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cybershop.controllers;

import com.cybershop.models.Order;
import com.cybershop.models.OrderDetail;
import com.cybershop.models.Product;
import com.cybershop.models.SpecificationTitle;
import com.cybershop.services.OrderDetailService;
import com.cybershop.services.ProductService;
import com.cybershop.services.SpecificationTitleService;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author chungnguyen
 */
@Controller
@RequestMapping("/api")
public class RestFullController {

    Logger log = Logger.getLogger(RestFullController.class.getName());

    @Autowired
    private SpecificationTitleService specificationTitleService;
    
    @Autowired
    private OrderDetailService orderDetailService;  

    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/findSpec/{id}", method = RequestMethod.GET,
            produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity<List<SpecificationTitle>> getSpecByCateID(@PathVariable("id") int id) {
        List<SpecificationTitle> listSpec = specificationTitleService.getByCategory(id);
        if (listSpec.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(listSpec, HttpStatus.OK);
    }

    @RequestMapping(value = "/findProduct/{id}", method = RequestMethod.GET,
            produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity<Product> getProductDetail(@PathVariable("id") int id) {
        Product product = productService.findById(id);
        if (product == null) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity(product, HttpStatus.OK);
    }

    @RequestMapping(value = "/findOrderDetail/{id}", method = RequestMethod.GET,
            produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity<List<OrderDetail>> findOne(@PathVariable("id") int id) {
        log.info("find member " + id);

        List<OrderDetail> list = orderDetailService.findByOrderID(id);
        if (list == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        final List<OrderDetail> dtos = new ArrayList<>();
        for (OrderDetail order : list) {
            OrderDetail orderdetail = new OrderDetail();
            orderdetail.setPrice(order.getPrice());
            orderdetail.setQuantity(order.getQuantity());
            orderdetail.setProductID(order.getProductID());
            dtos.add(orderdetail);
        }
        return new ResponseEntity<>(dtos, HttpStatus.OK);
    }

}
