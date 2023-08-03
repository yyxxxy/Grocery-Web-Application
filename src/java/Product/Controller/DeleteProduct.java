/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Product.Controller;

import ProductCategory.Entity.Product;
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
public class DeleteProduct extends HttpServlet {

    @PersistenceContext
    EntityManager manager;
    @Resource
    UserTransaction transaction;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            transaction.begin();
            Query deleteQuery = manager.createQuery("DELETE FROM Product WHERE PRODUCT_ID =:prodID ");
            deleteQuery.setParameter("prodID", Integer.valueOf(request.getParameter("prodID")));
            deleteQuery.executeUpdate();
            transaction.commit();

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        String successMsg = "<div class=\"alert success\">\n"
                + "  <span class=\"closebtn\">&times;</span>  \n"
                + "  Product Deleted Successful.\n"
                + "</div>";
        HttpSession session = request.getSession();
        session.setAttribute("successMsg", successMsg);

        response.sendRedirect("Maintain/Product/ProductList.jsp");

    }

}
