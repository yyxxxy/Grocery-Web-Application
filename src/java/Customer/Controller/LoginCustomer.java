/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Customer.Controller;

import Customer.Entity.Customer;
import Customer.da.CustomerDA;
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
public class LoginCustomer extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = request.getParameter("customerUsername");
        String password = request.getParameter("customerPassword");
        HttpSession session = request.getSession();

        try {
            Customer loginVerify = CustomerDA.getCustomerRecord(userName);
            if (loginVerify.getCustomerUsername() != null) {
                if (loginVerify.getCustomerUsername().equals(userName) && loginVerify.getCustomerPassword().equals(password)) {
                    session.setAttribute("CustomerDetails", loginVerify);
                    response.sendRedirect("Shop/Main/index.jsp");

                } else {
                    //redirect to login page and show error message
                    String message = "Invalid Password. Please try it again.";
                    session.setAttribute("errorMessagePsw", message);
                    response.sendRedirect("Shop/AccessPage/Login.jsp");

                }
            } else {
                String message = "Invalid Username. Please try it again.";
                session.setAttribute("errorMessageUsername", message);
                response.sendRedirect("Shop/AccessPage/Login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
