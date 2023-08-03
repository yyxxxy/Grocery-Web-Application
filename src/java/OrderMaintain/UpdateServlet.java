/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OrderMaintain;

import BuyEntity.OrderTable;
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
public class UpdateServlet extends HttpServlet {

    @PersistenceContext
    EntityManager manager;
    @Resource
    UserTransaction transaction;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            transaction.begin();
            OrderTable order = manager.find(OrderTable.class, Integer.valueOf(request.getParameter("orderID")));
            order.setOrderStatus(request.getParameter("orderStatus"));
            manager.merge(order);
            transaction.commit();
            
            String successMsg = "<div class=\"alert success\">\n"
                    + "  <span class=\"closebtn\">&times;</span>  \n"
                    + "  <strong>Success!</strong> Order Status Updated Successful.\n"
                    + "</div>";
            HttpSession session = request.getSession();
            session.setAttribute("successMsg", successMsg);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        response.sendRedirect("Maintain/Order/SalesRecord.jsp");
    }
}
