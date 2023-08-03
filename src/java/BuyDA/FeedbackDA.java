/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BuyDA;

import BuyEntity.Feedback;
import Customer.Entity.Customer;
import ProductCategory.Entity.Product;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author user
 */
public class FeedbackDA {

    @PersistenceContext
    EntityManager manager;

    private static String host = "jdbc:derby://localhost:1527/MyGrocery";
    private static String user = "nbuser";
    private static String password = "nbuser";
    private static String tableName = "FEEDBACK";
    private Connection conn;
    private PreparedStatement stmt;

    public FeedbackDA() {
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
        } catch (Exception ex) {
            ex.printStackTrace();
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

    public static List<Feedback> getAllRecords() {
        List<Feedback> list = new ArrayList<>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from " + tableName);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setFeedbackId(Integer.valueOf(rs.getString("FEEDBACK_ID")));
                feedback.setRating(Integer.valueOf(rs.getString("RATING")));
                feedback.setCommentFeedback(rs.getString("COMMENT_FEEDBACK"));
                feedback.setFeedbackDate(rs.getDate("FEEDBACK_DATE"));
                Product product = new Product();
                product.setProductId(Integer.valueOf(rs.getString("FK_PRODUCT_ID")));
                feedback.setFkProductId(product);

                Customer customer = new Customer();
                customer.setCustomerId(Integer.valueOf(rs.getString("FK_CUSTOMER_ID")));
                feedback.setFkCustomerId(customer);
                
                feedback.setStaffComment(rs.getString("STAFF_COMMENT"));
                list.add(feedback);
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return list;
    }

    public static void main(String[] args) {
   }
}
