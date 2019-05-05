package com.cybershop.models;

import com.cybershop.models.Product;
public class CartItem {
    
    Product item;
    int qty;
    double total;

    public CartItem() {
    }
    

    CartItem(Product product, int qty) {
        this.item = product;
        this.qty = qty;
        this.total = item.getPrice() * this.qty;
    }

    public Product getItem() {
        return item;
    }

    public void setItem(Product item) {
        this.item = item;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public double getTotal() {
        return total = qty * item.getPrice();
    }

    
    
    
}
