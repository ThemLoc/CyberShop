package cyber.shop.cybershop.entities;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import java.io.Serializable;
import java.util.List;

public class Product implements Serializable {

    @SerializedName("productID")
    @Expose
    private Integer productID;
    @SerializedName("productName")
    @Expose
    private String productName;
    @SerializedName("detail")
    @Expose
    private String detail;
    @SerializedName("price")
    @Expose
    private Double price;
    @SerializedName("quantity")
    @Expose
    private Integer quantity;
    @SerializedName("sell")
    @Expose
    private Integer sell;
    @SerializedName("downPrice")
    @Expose
    private Double downPrice;
    @SerializedName("status")
    @Expose
    private Boolean status;
    @SerializedName("imagesCollection")
    @Expose
    private List<ImagesCollection> imagesCollection = null;
    @SerializedName("brandID")
    @Expose
    private Brand brandID;
    @SerializedName("categoryID")
    @Expose
    private Category categoryID;

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

    public List<ImagesCollection> getImagesCollection() {
        return imagesCollection;
    }

    public void setImagesCollection(List<ImagesCollection> imagesCollection) {
        this.imagesCollection = imagesCollection;
    }

    public Brand getBrandID() {
        return brandID;
    }

    public void setBrandID(Brand brandID) {
        this.brandID = brandID;
    }

    public Category getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(Category categoryID) {
        this.categoryID = categoryID;
    }

}
