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
public class CountProductByCateDTO {
    private int count;
    private int cateID;

    public CountProductByCateDTO() {
    }

    
    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    @Override
    public String toString() {
        return "CountProductByCateDTO{" + "count=" + count + ", cateID=" + cateID + '}';
    }

    
}
