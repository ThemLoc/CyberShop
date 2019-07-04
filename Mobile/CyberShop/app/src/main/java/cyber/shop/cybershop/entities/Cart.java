package cyber.shop.cybershop.entities;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Cart {

    @SerializedName("idProduct")
    @Expose
    private Integer idProduct;
    @SerializedName("quanlity")
    @Expose
    private Integer quanlity;

    public Cart(Integer idProduct, Integer quanlity) {
        this.idProduct = idProduct;
        this.quanlity = quanlity;
    }

    public Integer getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(Integer idProduct) {
        this.idProduct = idProduct;
    }

    public Integer getQuanlity() {
        return quanlity;
    }

    public void setQuanlity(Integer quanlity) {
        this.quanlity = quanlity;
    }
}
