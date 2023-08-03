/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Sorting;

import BuyEntity.OrderTable;
import java.util.Comparator;

/**
 *
 * @author user
 */
public class SortByDate implements Comparator<OrderTable>{

    @Override
    public int compare(OrderTable o1, OrderTable o2) {
        return o1.getOrderDate().compareTo(o2.getOrderDate());
    }
    
}
