package com.cybershop.models;

import java.util.HashMap;
import java.util.Map;
import com.cybershop.models.Product;


public class CartDTO {
    
    private Map<Integer, CartItem> detail = new HashMap<>();

    public void addItem(Product product, int qty) {
        if (detail.containsKey(product.getProductID())) {
            detail.get(product.getProductID()).qty++;
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
