package cyber.shop.cybershop.entities;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import java.io.Serializable;

public class ImagesCollection implements Serializable {
    @SerializedName("imageID")
    @Expose
    private Integer imageID;
    @SerializedName("urlImage")
    @Expose
    private String urlImage;
    @SerializedName("mainImage")
    @Expose
    private Boolean mainImage;
    @SerializedName("productID")
    @Expose
    private Object productID;

    public Integer getImageID() {
        return imageID;
    }

    public void setImageID(Integer imageID) {
        this.imageID = imageID;
    }

    public String getUrlImage() {
        return urlImage;
    }

    public void setUrlImage(String urlImage) {
        this.urlImage = urlImage;
    }

    public Boolean getMainImage() {
        return mainImage;
    }

    public void setMainImage(Boolean mainImage) {
        this.mainImage = mainImage;
    }

    public Object getProductID() {
        return productID;
    }

    public void setProductID(Object productID) {
        this.productID = productID;
    }
}
