/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Staff.da;

import Staff.entity.Staff;
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
public class StaffDA {

    @PersistenceContext
    EntityManager manager;

    private static String host = "jdbc:derby://localhost:1527/MyGrocery";
    private static String user = "nbuser";
    private static String password = "nbuser";
    private static String tableName = "STAFF";
    private Connection conn;
    private PreparedStatement stmt;

    public StaffDA() {
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
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    public static List<Staff> getAllRecords() {
        List<Staff> list = new ArrayList<>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from " + tableName);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Staff staff = new Staff();
                staff.setStaffId(Integer.valueOf(rs.getString("STAFF_ID")));
                staff.setStaffUsername(rs.getString("STAFF_USERNAME"));
                staff.setStaffEmail(rs.getString("STAFF_EMAIL"));
                staff.setStaffFullname(rs.getString("STAFF_FULLNAME"));
                staff.setStaffGender(rs.getString("STAFF_GENDER"));
                list.add(staff);

            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return list;
    }

    public static Staff getStaffRecord(String username) {
        Staff staff = new Staff();
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM STAFF WHERE STAFF_USERNAME = ?");
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                staff.setStaffId(Integer.valueOf(rs.getString("STAFF_ID")));
                staff.setStaffUsername(rs.getString("STAFF_USERNAME"));
                staff.setStaffPassword(rs.getString("STAFF_PASSWORD"));

            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return staff;
    }
    
    public static void main(String[] args) {
        Staff list = StaffDA.getStaffRecord("IgnasiusStaff");
        System.out.print(list.getStaffPassword());
    }
}
