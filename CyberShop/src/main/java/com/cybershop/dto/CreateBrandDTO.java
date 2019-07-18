package com.cybershop.dto;

import org.springframework.web.multipart.MultipartFile;

public class CreateBrandDTO {
    private Integer brandID;
    private String brandName;
    private MultipartFile urlImg;

    public CreateBrandDTO(Integer brandID, String brandName, MultipartFile urlImg) {
        this.brandID = brandID;
        this.brandName = brandName;
        this.urlImg = urlImg;
    }

    public CreateBrandDTO() {
    }

    public Integer getBrandID() {
        return brandID;
    }

    public void setBrandID(Integer brandID) {
        this.brandID = brandID;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public MultipartFile getUrlImg() {
        return urlImg;
    }

    public void setUrlImg(MultipartFile urlImg) {
        this.urlImg = urlImg;
    }

    @Override
    public String toString() {
        return "CreateBrandDTO{" + "brandID=" + brandID + ", brandName=" + brandName + ", urlImg=" + urlImg + '}';
    }
    
}
