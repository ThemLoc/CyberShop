package com.cybershop.dto;

import java.util.List;
import org.springframework.web.multipart.MultipartFile;

public class CreateProductDTO {
    private Integer productID;
    private String productName;
    private String detail;
    private Double price;
    private Integer quantity;
    private Integer sell;
    private Double downPrice;
    private Boolean status;
    private List<MultipartFile>subImg;
    private MultipartFile mainImg;
    private int brandID;
    private int categoryID;

    public CreateProductDTO() {
    }

    public Integer getProductID() {
        return productID;
    }

    public void setProductID(Integer productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getSell() {
        return sell;
    }

    public void setSell(Integer sell) {
        this.sell = sell;
    }

    public Double getDownPrice() {
        return downPrice;
    }

    public void setDownPrice(Double downPrice) {
        this.downPrice = downPrice;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public List<MultipartFile> getSubImg() {
        return subImg;
    }

    public void setSubImg(List<MultipartFile> subImg) {
        this.subImg = subImg;
    }

    public MultipartFile getMainImg() {
        return mainImg;
    }

    public void setMainImg(MultipartFile mainImg) {
        this.mainImg = mainImg;
    }

    public int getBrandID() {
        return brandID;
    }

    public void setBrandID(int brandID) {
        this.brandID = brandID;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    @Override
    public String toString() {
        return "CreateProductDTO{" + "productID=" + productID + ", productName=" + productName + ", detail=" + detail + ", price=" + price + ", quantity=" + quantity + ", sell=" + sell + ", downPrice=" + downPrice + ", status=" + status + ", subImg=" + subImg + ", mainImg=" + mainImg + ", brandID=" + brandID + ", categoryID=" + categoryID + '}';
    }

}
