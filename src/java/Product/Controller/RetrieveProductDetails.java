/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Product.Controller;

import ProductCategory.Entity.Product;
import java.io.FileInputStream;
import java.io.FileOutputStream;
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
public class RetrieveProductDetails extends HttpServlet {

     @PersistenceContext EntityManager manager;
            
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        Product prod = manager.find(Product.class,Integer.valueOf(req.getParameter("prodID")));
        
        HttpSession session = req.getSession();
        
        session.setAttribute("prod", prod);
        
        resp.sendRedirect("Maintain/Product/ProductDetail.jsp");
        
    }

}
