/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FeedbackMaintain;

import BuyEntity.Feedback;
import java.io.IOException;
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
public class FeedbackDetail extends HttpServlet {

    @PersistenceContext
    EntityManager manager;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Feedback feedback = manager.find(Feedback.class, Integer.valueOf(request.getParameter("feedbackID")));

        HttpSession session = request.getSession();

        session.setAttribute("Feedback", feedback);

        response.sendRedirect("Maintain/Feedback/FeedbackDetails.jsp");
    }

}
