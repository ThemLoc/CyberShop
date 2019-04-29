/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cybershop.dto;

/**
 *
 * @author chungnguyen
 */
public class CountProductByBrandDTO {
    private int count;
    private int brandID;

    public CountProductByBrandDTO() {
    }

    
    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getBrandID() {
        return brandID;
    }

    public void setBrandID(int brandID) {
        this.brandID = brandID;
    }

    @Override
    public String toString() {
        return "CountProductByCateDTO{" + "count=" + count + ", brandID=" + brandID + '}';
    }

    
}
