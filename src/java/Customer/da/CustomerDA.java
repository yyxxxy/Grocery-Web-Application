/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Customer.da;

import Customer.Entity.Customer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.swing.JOptionPane;

/**
 *
 * @author user
 */
public class CustomerDA {

    @PersistenceContext
    EntityManager manager;

    private static String host = "jdbc:derby://localhost:1527/MyGrocery";
    private static String user = "nbuser";
    private static String password = "nbuser";
    private static String tableName = "CUSTOMER";
    private Connection conn;
    private PreparedStatement stmt;

    public CustomerDA() {
        createConnection();
    }

    private void createConnection() {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(host, user, password);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            con = DriverManager.getConnection(host, user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

    private void shutDown() {
        if (conn != null) {
            try {
                conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    public static List<Customer> getAllRecords() {
        List<Customer> list = new ArrayList<>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from " + tableName);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Customer cust = new Customer();
                cust.setCustomerId(Integer.valueOf(rs.getString("CUSTOMER_ID")));
                cust.setCustomerUsername(rs.getString("CUSTOMER_USERNAME"));
                cust.setCustomerEmail(rs.getString("CUSTOMER_EMAIL"));
                cust.setCustomerFullname(rs.getString("CUSTOMER_FULLNAME"));
                cust.setCustomerGender(rs.getString("CUSTOMER_GENDER"));
                list.add(cust);

            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return list;
    }

    public static Customer getCustomerRecord(String username) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE CUSTOMER_USERNAME = ?";
        Customer customer = new Customer();
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(queryStr);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                customer.setCustomerId(Integer.valueOf(rs.getString("CUSTOMER_ID")));
                customer.setCustomerUsername(rs.getString("CUSTOMER_USERNAME"));
                customer.setCustomerPassword(rs.getString("CUSTOMER_PASSWORD"));
                customer.setCustomerEmail(rs.getString("CUSTOMER_EMAIL"));
                customer.setCustomerFullname(rs.getString("CUSTOMER_FULLNAME"));
                customer.setCustomerIcNo(rs.getString("CUSTOMER_IC_NO"));
                customer.setCustomerPhNo(rs.getString("CUSTOMER_PH_NO"));
                customer.setCustomerAddress(rs.getString("CUSTOMER_ADDRESS"));
                customer.setCustomerGender(rs.getString("CUSTOMER_GENDER"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return customer;
    }

    public static Customer getCustomerRecordById(int id) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE CUSTOMER_ID = ?";
        Customer customer = new Customer();
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(queryStr);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                customer.setCustomerId(Integer.valueOf(rs.getString("CUSTOMER_ID")));
                customer.setCustomerUsername(rs.getString("CUSTOMER_USERNAME"));
                customer.setCustomerPassword(rs.getString("CUSTOMER_PASSWORD"));
                customer.setCustomerEmail(rs.getString("CUSTOMER_EMAIL"));
                customer.setCustomerFullname(rs.getString("CUSTOMER_FULLNAME"));
                customer.setCustomerIcNo(rs.getString("CUSTOMER_IC_NO"));
                customer.setCustomerPhNo(rs.getString("CUSTOMER_PH_NO"));
                customer.setCustomerAddress(rs.getString("CUSTOMER_ADDRESS"));
                customer.setCustomerGender(rs.getString("CUSTOMER_GENDER"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return customer;
    }

    public static void main(String[] args) {
    }

}
