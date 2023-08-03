/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Login.Controller;

import Staff.da.StaffDA;
import Staff.entity.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String password = request.getParameter("userPassword");
        HttpSession session = request.getSession();
        Staff loginVerify = StaffDA.getStaffRecord(userName);
        if (loginVerify.getStaffUsername() != null) {
            try {
                if (loginVerify.getStaffUsername().equals(userName) && loginVerify.getStaffPassword().equals(password)) {
                    //to let the user can access the page they can access
                    session.setAttribute("UserRole", loginVerify);
                    response.sendRedirect("Maintain/Main/index.jsp");
                } else {
                    //redirect to login page and show error message
                    String message = "Invalid Password. Please try it again.";
                    session.setAttribute("errorMessage", message);
                    response.sendRedirect("Maintain/Main/Login.jsp");

                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            String message = "Invalid Username. Please try it again.";
            session.setAttribute("errorMessage", message);
            response.sendRedirect("Maintain/Main/Login.jsp");
        }
    }
}
