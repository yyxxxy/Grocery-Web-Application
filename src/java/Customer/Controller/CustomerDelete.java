/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Customer.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
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
public class CustomerDelete extends HttpServlet {

    @PersistenceContext
    EntityManager manager;
    @Resource
    UserTransaction transaction;

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            transaction.begin();
            Query deleteQuery = manager.createQuery("DELETE FROM Customer WHERE CUSTOMER_ID =:custID ");
            deleteQuery.setParameter("custID", Integer.valueOf(request.getParameter("custID")));
            deleteQuery.executeUpdate();
            transaction.commit();

            String successMsg = "<div class=\"alert success\">\n"
                    + "  <span class=\"closebtn\">&times;</span>  \n"
                    + "  Customer Deleted Successful.\n"
                    + "</div>";
            HttpSession session = request.getSession();
            session.setAttribute("successMsg", successMsg);
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        response.sendRedirect("Maintain/Customer/CustomerList.jsp");

    }

}
