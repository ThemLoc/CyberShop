package com.cybershop.models;

import java.util.HashMap;
import java.util.Map;

public class CartDTO {

    private Map<Integer, CartItem> detail = new HashMap<>();
    private double totalOrder;
    private double totalAfterDiscount;
    private Promotion promotion = null;

    public double getTotalOrder() {
        double tmp = 0;
        for (Map.Entry<Integer, CartItem> entry : detail.entrySet()) {
            tmp += entry.getValue().total;
        }
        return totalOrder = tmp;
    }

    public double getTotalAfterDiscount() {
        if (promotion == null) {
            return totalAfterDiscount = this.totalOrder;
        } else {
            return this.totalAfterDiscount;
        }
    }

    public void setTotalAfterDiscount(double totalAfterDiscount) {
        this.totalAfterDiscount = totalAfterDiscount;
    }

    public void setTotalOrder(double totalOrder) {
        this.totalOrder = totalOrder;
    }

    public Promotion getPromotion() {
        return promotion;
    }

    public void setPromotion(Promotion promotion) {
        this.promotion = promotion;
    }

    public String addItem(Product product, int qty) {
        if (detail.containsKey(product.getProductID())) {
            detail.get(product.getProductID()).qty++;
            detail.get(product.getProductID()).getTotal();
            return "duplicate";
        } else {
            detail.put(product.getProductID(), new CartItem(product, qty));
            return "addSuccess";
        }

    }

    public void removeItem(int productId) {
        detail.remove(productId);
    }

    public void updateItem(Product product, int nQty) {
        detail.replace(product.getProductID(), new CartItem(product, nQty));
    }

    public Map<Integer, CartItem> getDetail() {
        return detail;
    }

    public void setDetail(Map<Integer, CartItem> detail) {
        this.detail = detail;
    }

}
