package com.cybershop.models;

import com.cybershop.models.Product;
public class CartItem {
    
    Product item;
    int qty;

    CartItem(Product product, int qty) {
        this.item = product;
        this.qty = qty;
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
    
    
}
