/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BuyController;

import Product.da.ProductDA;
import ProductCategory.Entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class SearchProduct extends HttpServlet {

    @PersistenceContext
    EntityManager manager;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String txtSearch = request.getParameter("searchName");
        List<Product> product = ProductDA.serachByName(txtSearch);
        
        HttpSession session = request.getSession();
        session.setAttribute("productSearch", product);

        response.sendRedirect("Shop/Main/productSearch.jsp");


    }

}
