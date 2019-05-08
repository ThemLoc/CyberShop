package com.cybershop.dto;

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
