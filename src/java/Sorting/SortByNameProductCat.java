/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Sorting;

import ProductCategory.Entity.ProductCategory;
import java.util.Comparator;

/**
 *
 * @author user
 */
public class SortByNameProductCat implements Comparator<ProductCategory>{

    @Override
    public int compare(ProductCategory o1, ProductCategory o2) {
        return o1.getProductCatName().compareTo(o2.getProductCatName());
    }
    
}
