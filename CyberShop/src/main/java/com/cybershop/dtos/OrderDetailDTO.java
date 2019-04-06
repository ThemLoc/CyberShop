/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cybershop.dtos;

/**
 *
 * @author chungnguyen
 */
public class OrderDetailDTO {
    private int orderDtailID;
    private int orderID;
    private int productID;
    private int quantity;
    private float price;

    public OrderDetailDTO() {
    }

    public int getOrderDtailID() {
        return orderDtailID;
    }

    public void setOrderDtailID(int orderDtailID) {
        this.orderDtailID = orderDtailID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
    
    
}
