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
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author user
 */
public class RegisterCustomer extends HttpServlet {

    @PersistenceContext
    EntityManager manager;
    @Resource
    UserTransaction transaction;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Customer customer = new Customer();
        HttpSession session = request.getSession();
        List<Customer> checkCustomer = CustomerDA.getAllRecords();
        boolean exist = false;

        //check exist username
        for (int i = 0; i < checkCustomer.size(); i++) {
            if (checkCustomer.get(i).getCustomerUsername().equals(request.getParameter("customerUsername"))) {
                exist = true;
            }
        }

        if (exist == true) {
            String errorMsgUserName = "<div class=\"alert\">\n"
                    + "  <span class=\"closebtn\">&times;</span>  \n"
                    + "  <strong>Error!</strong> Username exist.\n"
                    + "</div>";
            session.setAttribute("errorMsgUserName", errorMsgUserName);
            response.sendRedirect("Shop/AccessPage/Register.jsp");

        } else if (request.getParameter("customerUsername").length() < 8) {
            String errorMsgUserName = "<div class=\"alert\">\n"
                    + "  <span class=\"closebtn\">&times;</span>  \n"
                    + "  <strong>Error!</strong> Username must more than 8 character.\n"
                    + "</div>";
            session.setAttribute("errorMsgUserName", errorMsgUserName);
            response.sendRedirect("Shop/AccessPage/Register.jsp");
        } else {

            if (request.getParameter("customerPassword").equals(request.getParameter("repeatPassword"))) {

                customer.setCustomerUsername(request.getParameter("customerUsername"));
                customer.setCustomerEmail(request.getParameter("customerEmail"));
                customer.setCustomerPassword(request.getParameter("customerPassword"));
                customer.setCustomerFullname(request.getParameter("customerFullname"));
                customer.setCustomerIcNo(request.getParameter("customerICNo"));
                customer.setCustomerPhNo(request.getParameter("customerPHNo"));
                customer.setCustomerAddress(request.getParameter("customerAddress"));
                customer.setCustomerGender(request.getParameter("customerGender"));

                try {
                    transaction.begin();
                    manager.persist(customer);
                    transaction.commit();

                } catch (Exception ex) {
                    ex.printStackTrace();
                }

                response.sendRedirect("Shop/AccessPage/Login.jsp");
            } else {
                String errorMsgUserPassword = "<div class=\"alert\">\n"
                        + "  <span class=\"closebtn\">&times;</span>  \n"
                        + "  <strong>Error!</strong> Password must be same.\n"
                        + "</div>";
                session.setAttribute("errorMsgUserPassword", errorMsgUserPassword);

                response.sendRedirect("Shop/AccessPage/Register.jsp");
            }
        }

    }

}
