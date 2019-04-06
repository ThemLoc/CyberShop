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
public class ImageDTO {
    private int imageDTO;
    private String urlImage;
    private int productID;
    public ImageDTO() {
    }

    public int getImageDTO() {
        return imageDTO;
    }

    public void setImageDTO(int imageDTO) {
        this.imageDTO = imageDTO;
    }

    public String getUrlImage() {
        return urlImage;
    }

    public void setUrlImage(String urlImage) {
        this.urlImage = urlImage;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }
    
    
}
