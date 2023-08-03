/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BuyEntity;

import ProductCategory.Entity.Product;

/**
 *
 * @author user
 */
//to get the quantity user wish to purchase
public class Cart extends Product{
        private int quantity;

    public Cart() {
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
        
}
