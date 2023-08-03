/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FeedbackMaintain;

import BuyEntity.Feedback;
import java.io.IOException;
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
public class UpdateFeedback extends HttpServlet {

    @PersistenceContext
    EntityManager manager;
    @Resource
    UserTransaction transaction;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            transaction.begin();
            Feedback feedback = manager.find(Feedback.class, Integer.valueOf(request.getParameter("feedbackID")));
            feedback.setStaffComment(request.getParameter("staffComment"));
            manager.merge(feedback);
            transaction.commit();
            
            String successMsg = "<div class=\"alert success\">\n"
                    + "  <span class=\"closebtn\">&times;</span>  \n"
                    + "  Feedback Updated Successful.\n"
                    + "</div>";
            HttpSession session = request.getSession();
            session.setAttribute("successMsg", successMsg);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        response.sendRedirect("Maintain/Feedback/FeedbackList.jsp");
    }
}
