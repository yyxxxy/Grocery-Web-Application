/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package report;

/**
 *
 * @author user
 */
public class TopCustomer {
    private int customerID;
    private double price;

    public TopCustomer() {
    }

    
    public TopCustomer(int customerID, double price) {
        this.customerID = customerID;
        this.price = price;
    }

    public int getCustomerID() {
        return customerID;
    }

    public double getPrice() {
        return price;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    
}
