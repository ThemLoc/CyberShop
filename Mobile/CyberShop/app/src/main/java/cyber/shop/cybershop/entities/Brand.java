package cyber.shop.cybershop.entities;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import java.io.Serializable;

public class Brand implements Serializable {

    @SerializedName("brandID")
    @Expose
    private Integer brandID;
    @SerializedName("imageURL")
    @Expose
    private String imageURL;
    @SerializedName("brandName")
    @Expose
    private String brandName;

    public Integer getBrandID() {
        return brandID;
    }

    public void setBrandID(Integer brandID) {
        this.brandID = brandID;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

}
