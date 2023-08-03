/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BuyController;

import Customer.Entity.Customer;
import java.io.IOException;
import java.io.PrintWriter;
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
public class UpdateProfile extends HttpServlet {

    @PersistenceContext
    EntityManager manager;
    @Resource
    UserTransaction transaction;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            transaction.begin();
            Customer cust = manager.find(Customer.class, Integer.valueOf(request.getParameter("custID")));
            cust.setCustomerFullname(request.getParameter("fullname"));
            cust.setCustomerGender(request.getParameter("gender"));
            cust.setCustomerUsername(request.getParameter("username"));
            cust.setCustomerIcNo(request.getParameter("icNo"));
            cust.setCustomerPhNo(request.getParameter("phno"));
            cust.setCustomerAddress(request.getParameter("address"));
            manager.merge(cust);
            transaction.commit();
            HttpSession session = request.getSession();
            session.setAttribute("CustomerDetails", cust);
            session.setAttribute("successfulMsg", "Profile update successfully.");
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        response.sendRedirect("Shop/Main/customerProfile.jsp");
    }
}
