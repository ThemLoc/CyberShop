/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cybershop.models;

import java.util.List;

/**
 *
 * @author ngthe
 */
public class RequestWrapperCustomer {
    
    Customer_2 cust;
    List<CartRest> cart;

    public Customer_2 getCust() {
        return cust;
    }

    public void setCust(Customer_2 cust) {
        this.cust = cust;
    }

    public List<CartRest> getCart() {
        return cart;
    }

    public void setCart(List<CartRest> cart) {
        this.cart = cart;
    }
    
    
}
