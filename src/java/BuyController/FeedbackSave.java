/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BuyController;

import BuyEntity.Feedback;
import Customer.Entity.Customer;
import ProductCategory.Entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;

/**
 *
 * @author user
 */
public class FeedbackSave extends HttpServlet {

    @PersistenceContext
    EntityManager manager;
    @Resource
    UserTransaction transaction;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int rate = Integer.valueOf(request.getParameter("rating"));
        String comment = request.getParameter("comment");
        int prodID = Integer.valueOf(request.getParameter("prodID"));
        int custID = Integer.valueOf(request.getParameter("custID"));

        Feedback feedback = new Feedback();
        feedback.setRating(rate);
        feedback.setCommentFeedback(comment);

        Product prod = new Product();
        prod.setProductId(prodID);
        System.out.print(prod);
        Customer cust = new Customer();
        cust.setCustomerId(custID);

        feedback.setFkProductId(prod);
        feedback.setFkCustomerId(cust);

        LocalDateTime now = LocalDateTime.now();
        Date in = new Date();
        LocalDateTime ldt = LocalDateTime.ofInstant(in.toInstant(), ZoneId.systemDefault());
        Date out = (Date) Date.from(ldt.atZone(ZoneId.systemDefault()).toInstant());

        feedback.setFeedbackDate(out);
        try {
            transaction.begin();
            manager.persist(feedback);
            transaction.commit();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        response.sendRedirect("Shop/Main/ProductDetail.jsp");
    }

}
