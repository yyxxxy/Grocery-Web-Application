/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BuyController;

import ProductCategory.Entity.ProductCategory;
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
public class CategorySelected extends HttpServlet {

    @PersistenceContext
    EntityManager manager;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductCategory prodCat = manager.find(ProductCategory.class, Integer.valueOf(request.getParameter("prodcatid")));

        HttpSession session = request.getSession();

        session.setAttribute("prodCat", prodCat);

        response.sendRedirect("Shop/Main/CategoryPage.jsp");
    }

}
