/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BuyDA;

import BuyEntity.OrderTable;
import BuyEntity.Payment;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author user
 */
public class PaymentDA {

    @PersistenceContext
    EntityManager manager;

    private static String host = "jdbc:derby://localhost:1527/MyGrocery";
    private static String user = "nbuser";
    private static String password = "nbuser";
    private static String tableName = "PAYMENT";
    private Connection conn;
    private PreparedStatement stmt;

    public PaymentDA() {
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

    public static Payment getPayemntRecord(int id) {
        String queryStr = "SELECT * FROM PAYMENT WHERE FK_ORDER_ID = ?";
        Payment payment = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(queryStr);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                payment = new Payment();
                payment.setPaymentId(Integer.valueOf(rs.getString("PAYMENT_ID")));
                payment.setPaymentName(rs.getString("PAYMENT_NAME"));
                payment.setCerditCardNumber(rs.getString("CERDIT_CARD_NUMBER"));
                payment.setExpMonth(rs.getString("EXP_MONTH"));
                payment.setCcv(rs.getString("CCV"));
                payment.setExpYear(rs.getString("EXP_YEAR"));
                payment.setPaymentDate(Date.valueOf(rs.getString("PAYMENT_DATE")));
                OrderTable order = new OrderTable();
                order.setOrderId(Integer.valueOf(rs.getString("FK_ORDER_ID")));
                payment.setFkOrderId(order);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return payment;
    }

    public static void main(String[] args) {


    }
}
