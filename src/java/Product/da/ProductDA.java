/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Product.da;

import ProductCategory.Entity.Product;
import ProductCategory.Entity.ProductCategory;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author user
 */
public class ProductDA {

    @PersistenceContext
    EntityManager manager;

    private static String host = "jdbc:derby://localhost:1527/MyGrocery";
    private static String user = "nbuser";
    private static String password = "nbuser";
    private static String tableName = "Product";
    private Connection conn;
    private PreparedStatement stmt;
    private Product prodDA;

    public ProductDA() {
        createConnection();
        prodDA = new Product();
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

    public static List<Product> getAllRecords() {
        List<Product> list = new ArrayList<>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from " + tableName);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product prod = new Product();
                prod.setProductId(Integer.valueOf(rs.getString("PRODUCT_ID")));
                prod.setProductName(rs.getString("PRODUCT_NAME"));
                prod.setProductPrice(Double.valueOf(rs.getString("PRODUCT_PRICE")));
                prod.setProductQty(Integer.valueOf(rs.getString("PRODUCT_QTY")));
                prod.setProductImage(rs.getString("PRODUCT_IMAGE"));
                ProductCategory prodCat = ProductDA.getProductCategoryRecord(Integer.valueOf(rs.getString("FK_PROD_CAT_ID")));
                prod.setFkProdCatId(prodCat);
                list.add(prod);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public static ProductCategory getProductCategoryRecord(int id) {
        String queryStr = "SELECT * FROM PRODUCT_CATEGORY WHERE PRODUCT_CAT_ID = ?";
        ProductCategory prodCat = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(queryStr);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                prodCat = new ProductCategory(Integer.valueOf(rs.getString("PRODUCT_CAT_ID")), rs.getString("PRODUCT_CAT_NAME"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return prodCat;
    }

    public static List<Product> serachByName(String name) {
        List<Product> productList = new ArrayList<>();
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM PRODUCT WHERE PRODUCT_NAME LIKE '%" + name +"%'");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product prod = new Product();
                prod.setProductId(Integer.valueOf(rs.getString("PRODUCT_ID")));
                prod.setProductName(rs.getString("PRODUCT_NAME"));
                prod.setProductPrice(Double.valueOf(rs.getString("PRODUCT_PRICE")));
                prod.setProductQty(Integer.valueOf(rs.getString("PRODUCT_QTY")));
                prod.setProductImage(rs.getString("PRODUCT_IMAGE"));
                ProductCategory prodCat = ProductDA.getProductCategoryRecord(Integer.valueOf(rs.getString("FK_PROD_CAT_ID")));
                prod.setFkProdCatId(prodCat);
                productList.add(prod);
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return productList;
    }

    public static Product serachByID(int id) {
        Product prod = new Product();
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM PRODUCT WHERE PRODUCT_ID = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                prod.setProductId(Integer.valueOf(rs.getString("PRODUCT_ID")));
                prod.setProductName(rs.getString("PRODUCT_NAME"));
                prod.setProductPrice(Double.valueOf(rs.getString("PRODUCT_PRICE")));
                prod.setProductQty(Integer.valueOf(rs.getString("PRODUCT_QTY")));
                prod.setProductImage(rs.getString("PRODUCT_IMAGE"));
                ProductCategory prodCat = ProductDA.getProductCategoryRecord(Integer.valueOf(rs.getString("FK_PROD_CAT_ID")));
                prod.setFkProdCatId(prodCat);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return prod;
    }
    
    public static void main(String[] args) {
        List<Product> list = ProductDA.serachByName("Chicken");
        System.out.println(list.size());
    }
}
