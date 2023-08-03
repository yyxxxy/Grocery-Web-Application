/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Product.Controller;

import ProductCategory.Entity.Product;
import ProductCategory.Entity.ProductCategory;
import java.io.IOException;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author user
 */
@MultipartConfig
public class UpdateProduct extends HttpServlet {

    @PersistenceContext
    EntityManager manager;
    @Resource
    UserTransaction transaction;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            transaction.begin();
            ProductCategory prodCat = manager.find(ProductCategory.class, Integer.valueOf(request.getParameter("prodcatid")));
            Product prod = manager.find(Product.class, Integer.valueOf(request.getParameter("prodID")));
            prod.setProductName(request.getParameter("prodName"));
            prod.setFkProdCatId(prodCat);
            prod.setProductPrice(Double.parseDouble(request.getParameter("prodPrice")));
            prod.setProductQty(Integer.parseInt(request.getParameter("prodQuantity")));
            prod.setProductDesc(request.getParameter("prodDesc"));

            manager.merge(prod);
            transaction.commit();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        String successMsg = "<div class=\"alert success\">\n"
                + "  <span class=\"closebtn\">&times;</span>  \n"
                + "  Product Updated Successful.\n"
                + "</div>";
        HttpSession session = request.getSession();
        session.setAttribute("successMsg", successMsg);

        response.sendRedirect("Maintain/Product/ProductList.jsp");
    }

}
