/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ProductCategory.Controller;

import ProductCategory.Entity.ProductCategory;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
public class RetrieveProductCategory extends HttpServlet {

    @PersistenceContext EntityManager manager;
            
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        ProductCategory prodCat = manager.find(ProductCategory.class,Integer.valueOf(req.getParameter("prodcatid")));
        
        HttpSession session = req.getSession();
        
        session.setAttribute("prodCat", prodCat);
        
        resp.sendRedirect("Maintain/ProductCategory/ProductCategoryDetail.jsp");
        
    }

}
