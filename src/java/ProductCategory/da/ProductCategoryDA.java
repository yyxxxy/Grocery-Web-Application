/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ProductCategory.da;

import java.sql.*;
import javax.swing.*;
import ProductCategory.Entity.ProductCategory;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class ProductCategoryDA {

    private static String host = "jdbc:derby://localhost:1527/MyGrocery";
    private static String user = "nbuser";
    private static String password = "nbuser";
    private static String tableName = "Product_Category";
    private Connection conn;
    private PreparedStatement stmt;
    private ProductCategory prodCatDA;

    public ProductCategoryDA() {
        createConnection();
        prodCatDA = new ProductCategory();
    }

    private void createConnection() {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(host, user, password);
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
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
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
            }
        }
    }

    public static List<ProductCategory> getAllRecords() {
        List<ProductCategory> list = new ArrayList<>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from " + tableName);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductCategory prodCat = new ProductCategory();
                prodCat.setProductCatId(Integer.valueOf(rs.getString("PRODUCT_CAT_ID")));
                prodCat.setProductCatName(rs.getString("PRODUCT_CAT_NAME"));
                prodCat.setProductCatImage(rs.getString("PRODUCT_CAT_IMAGE"));
                list.add(prodCat);
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return list;
    }

    public static void main(String[] args) {
        
    }
}
