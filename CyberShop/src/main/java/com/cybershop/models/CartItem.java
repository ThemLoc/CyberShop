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
        if (item.getDownPrice() == null) {
            this.total = item.getPrice() * this.qty;
        } else {
            this.total = item.getDownPrice() * this.qty;

        }
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
        if (item.getDownPrice() == null) {
            this.total = item.getPrice() * this.qty;
        } else {
            this.total = item.getDownPrice() * this.qty;

        }
        return this.total;
    }

}
