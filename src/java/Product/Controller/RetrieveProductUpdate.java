/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Product.Controller;

import ProductCategory.Entity.Product;
import ProductCategory.Entity.ProductCategory;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class RetrieveProductUpdate extends HttpServlet {

    @PersistenceContext
    EntityManager manager;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Product prod = manager.find(Product.class, Integer.valueOf(request.getParameter("prodID")));
        List<ProductCategory> prodCatList = manager.createNamedQuery("ProductCategory.findAll").getResultList();
        HttpSession session = request.getSession();
        
        session.setAttribute("prod", prod);
        session.setAttribute("prodCatList", prodCatList);

        response.sendRedirect("Maintain/Product/UpdateProduct.jsp");

    }

}
