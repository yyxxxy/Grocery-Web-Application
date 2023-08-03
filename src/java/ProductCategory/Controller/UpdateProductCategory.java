/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ProductCategory.Controller;

import ProductCategory.Entity.ProductCategory;
import java.io.IOException;
import java.io.PrintWriter;
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
public class UpdateProductCategory extends HttpServlet {

    @PersistenceContext
    EntityManager manager;
    @Resource
    UserTransaction transaction;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        try {

            transaction.begin();

            ProductCategory prodCat = manager.find(ProductCategory.class, Integer.valueOf(request.getParameter("productcatid")));
            prodCat.setProductCatName(request.getParameter("productcatname"));
            
            manager.merge(prodCat);
            transaction.commit();
            
            String successMsg = "<div class=\"alert success\">\n"
                    + "  <span class=\"closebtn\">&times;</span>  \n"
                    + "  Product Category Updated Successful.\n"
                    + "</div>";
            session.setAttribute("successMsg", successMsg);
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        response.sendRedirect("Maintain/ProductCategory/ProductCategoryList.jsp");
    }

}
