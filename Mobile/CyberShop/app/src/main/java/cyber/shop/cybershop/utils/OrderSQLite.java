package cyber.shop.cybershop.utils;

public class OrderSQLite {
    private String id, productID, quantity, productName, imageUrl;
    private double price;

    public OrderSQLite() {
    }

    public OrderSQLite(String productID, String quantity, String productName, String imageUrl, double price) {
        this.productID = productID;
        this.quantity = quantity;
        this.productName = productName;
        this.imageUrl = imageUrl;
        this.price = price;
    }

    public OrderSQLite(String id, String productID, String quantity, String productName, String imageUrl, double price) {
        this.id = id;
        this.productID = productID;
        this.quantity = quantity;
        this.productName = productName;
        this.imageUrl = imageUrl;
        this.price = price;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }
}
