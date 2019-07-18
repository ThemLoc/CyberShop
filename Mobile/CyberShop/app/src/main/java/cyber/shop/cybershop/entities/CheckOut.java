package cyber.shop.cybershop.entities;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import java.util.List;

public class CheckOut {

    @SerializedName("cust")
    @Expose
    private Cust cust;
    @SerializedName("cart")
    @Expose
    private List<Cart> cart = null;

    public CheckOut(Cust cust, List<Cart> cart) {
        this.cust = cust;
        this.cart = cart;
    }

    public Cust getCust() {
        return cust;
    }

    public void setCust(Cust cust) {
        this.cust = cust;
    }

    public List<Cart> getCart() {
        return cart;
    }

    public void setCart(List<Cart> cart) {
        this.cart = cart;
    }
}
