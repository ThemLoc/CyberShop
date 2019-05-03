package com.cybershop.models;

import java.util.HashMap;
import java.util.Map;
import com.cybershop.models.Product;


public class CartDTO {
    
    private Map<Integer, CartItem> detail = new HashMap<>();
    private double totalOrder;

    public double getTotalOrder() {
        double tmp = 0;
        for (Map.Entry<Integer, CartItem> entry : detail.entrySet()) {
            tmp += entry.getValue().total;
        }
        return totalOrder = tmp;
    }
    
    

    public void addItem(Product product, int qty) {
        if (detail.containsKey(product.getProductID())) {
            detail.get(product.getProductID()).qty++;
            detail.get(product.getProductID()).getTotal();
        } else {
            detail.put(product.getProductID(), new CartItem(product, qty));
            
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
