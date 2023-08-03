/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OrderMaintain;

import BuyEntity.OrderTable;
import java.io.IOException;
import java.io.PrintWriter;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class OrderMaintainDetailsUpdate extends HttpServlet {

    @PersistenceContext
    EntityManager manager;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrderTable order = manager.find(OrderTable.class, Integer.valueOf(request.getParameter("orderID")));

        HttpSession session = request.getSession();

        session.setAttribute("order", order);

        response.sendRedirect("Maintain/Order/OrderUpdate.jsp");
    }

}
