/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Sorting;

import ProductCategory.Entity.Product;
import java.util.Comparator;

/**
 *
 * @author user
 */
public class SortByNameProduct implements Comparator<Product>{

    @Override
    public int compare(Product o1, Product o2) {
         return o1.getProductName().compareTo(o2.getProductName());
    }
    
}
