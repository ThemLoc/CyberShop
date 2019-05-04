package com.cybershop.dto;

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
