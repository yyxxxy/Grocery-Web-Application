/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FeedbackMaintain;

import java.io.IOException;
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
public class FeedbackDelete extends HttpServlet {

    @PersistenceContext
    EntityManager manager;
    @Resource
    UserTransaction transaction;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            transaction.begin();
            Query deleteQuery = manager.createQuery("DELETE FROM Feedback WHERE FEEDBACK_ID =:feedbackID ");
            deleteQuery.setParameter("feedbackID", Integer.valueOf(request.getParameter("feedbackID")));
            deleteQuery.executeUpdate();
            transaction.commit();
            
             String successMsg = "<div class=\"alert success\">\n"
                    + "  <span class=\"closebtn\">&times;</span>  \n"
                    + "  Feedback Deleted Successful.\n"
                    + "</div>";
            HttpSession session = request.getSession();
            session.setAttribute("successMsg", successMsg);

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        response.sendRedirect("Maintain/Feedback/FeedbackList.jsp");

    }
}
