/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BuyDA;

import BuyEntity.OrderTable;
import Customer.Entity.Customer;
import ProductCategory.Entity.Product;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import report.TopCustomer;
import report.TopProduct;

/**
 *
 * @author user
 */
public class OrderListDA {

    @PersistenceContext
    EntityManager manager;

    private static String host = "jdbc:derby://localhost:1527/MyGrocery";
    private static String user = "nbuser";
    private static String password = "nbuser";
    private static String tableName = "ORDER_TABLE";
    private Connection conn;
    private PreparedStatement stmt;

    public OrderListDA() {
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
            System.out.println(e);
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

    public static List<OrderTable> getAllRecords() {
        List<OrderTable> list = new ArrayList<>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from " + tableName);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderTable order = new OrderTable();
                order.setOrderId(Integer.valueOf(rs.getString("ORDER_ID")));
                order.setOrderUuid(rs.getString("ORDER_UUID"));
                order.setOrderReceiveName(rs.getString("ORDER_RECEIVE_NAME"));
                order.setOrderAddress(rs.getString("ORDER_ADDRESS"));
                order.setOrderPaymentAmount(Double.valueOf(rs.getString("ORDER_PAYMENT_AMOUNT")));
                order.setOrderStatus(rs.getString("ORDER_STATUS"));
                order.setOrderQty(Integer.valueOf(rs.getString("ORDER_QTY")));
                order.setOrderDate(Date.valueOf(rs.getString("ORDER_DATE")));
                order.setCkProductId(new Product(Integer.valueOf(rs.getString("CK_PRODUCT_ID"))));
                order.setCkCustomerId(new Customer(Integer.valueOf(rs.getString("CK_CUSTOMER_ID"))));
                list.add(order);
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return list;
    }

    public static List<TopCustomer> getTopFiveCustomer() {
        List<TopCustomer> topCustomer = new ArrayList<>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT CK_CUSTOMER_ID, SUM(ORDER_PAYMENT_AMOUNT) \n"
                    + "FROM ORDER_TABLE \n"
                    + "WHERE ORDER_STATUS = 'Success' \n"
                    + "OR  ORDER_STATUS = 'Packaging' \n"
                    + "OR  ORDER_STATUS = 'Shipping' \n"
                    + "OR  ORDER_STATUS = 'Delivered' \n"
                    + "GROUP BY CK_CUSTOMER_ID \n"
                    + "ORDER BY SUM(ORDER_PAYMENT_AMOUNT) desc \n"
                    + "FETCH FIRST 5 ROWS ONLY");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                TopCustomer topCustomerObject = new TopCustomer();
                topCustomerObject.setCustomerID(Integer.parseInt(rs.getString("CK_CUSTOMER_ID")));
                topCustomerObject.setPrice(Double.parseDouble(rs.getString("2")));
                topCustomer.add(topCustomerObject);
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return topCustomer;
    }

    public static List<TopProduct> getTopTenProduct() {
        List<TopProduct> topProductList = new ArrayList<>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT CK_PRODUCT_ID, SUM(ORDER_PAYMENT_AMOUNT)\n"
                    + "FROM ORDER_TABLE\n"
                    + "WHERE ORDER_STATUS = 'Success'\n"
                    + "OR  ORDER_STATUS = 'Packaging' \n"
                    + "OR  ORDER_STATUS = 'Shipping' \n"
                    + "OR  ORDER_STATUS = 'Delivered' \n"
                    + "GROUP BY CK_PRODUCT_ID\n"
                    + "ORDER BY SUM(ORDER_PAYMENT_AMOUNT) desc\n"
                    + "FETCH FIRST 10 ROWS ONLY");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                TopProduct topProduct = new TopProduct();
                topProduct.setProductID(Integer.parseInt(rs.getString("CK_PRODUCT_ID")));
                topProduct.setPrice(Double.parseDouble(rs.getString("2")));
                topProductList.add(topProduct);
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return topProductList;
    }

    public static void main(String[] args) {
    }
    
    

}
