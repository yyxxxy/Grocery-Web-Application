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
public class DeleteProductCategory extends HttpServlet {

    @PersistenceContext
    EntityManager manager;
    @Resource
    UserTransaction transaction;

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductCategory prodCat = manager.find(ProductCategory.class, Integer.valueOf(request.getParameter("prodcatid")));

        try {
            transaction.begin();
            if (!manager.contains(prodCat)) {
                prodCat = manager.merge(prodCat);
            }

            manager.remove(prodCat);
            transaction.commit();
            
            String successMsg = "<div class=\"alert success\">\n"
                    + "  <span class=\"closebtn\">&times;</span>  \n"
                    + "  Product Category Deleted Successful.\n"
                    + "</div>";
            HttpSession session = request.getSession();
            session.setAttribute("successMsg", successMsg);
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        response.sendRedirect("Maintain/ProductCategory/ProductCategoryList.jsp");

    }

}
