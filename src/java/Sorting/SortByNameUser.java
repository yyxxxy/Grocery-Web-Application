/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Sorting;

import Customer.Entity.Customer;
import java.util.Comparator;

/**
 *
 * @author user
 */
public class SortByNameUser implements Comparator<Customer>{

    @Override
    public int compare(Customer o1, Customer o2) {
        return o1.getCustomerFullname().compareTo(o2.getCustomerFullname());
    }
    
}
