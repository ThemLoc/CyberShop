/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cybershop.models;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

/**
 *
 * @author ngthe
 */
public class CartRest {
    
    private int idProduct;
    private int quanlity;

    @JsonCreator
    public CartRest(@JsonProperty("idProduct") int idProduct, @JsonProperty("quanlity") int quanlity) {
        this.idProduct = idProduct;
        this.quanlity = quanlity;
    }
    

    public CartRest() {
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public int getQuanlity() {
        return quanlity;
    }

    public void setQuanlity(int quanlity) {
        this.quanlity = quanlity;
    }  
}
