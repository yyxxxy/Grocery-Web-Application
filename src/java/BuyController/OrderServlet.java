/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BuyController;

import BuyEntity.Cart;
import ProductCategory.Entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class OrderServlet extends HttpServlet {

    @PersistenceContext
    EntityManager manager;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<Cart> cartList = new ArrayList<>();

        int id = Integer.parseInt(request.getParameter("prodID"));
        Product product = manager.find(Product.class, id);

        Cart cm = new Cart();
        cm.setProductId(id);
        cm.setProductName(product.getProductName());
        cm.setQuantity(Integer.parseInt(request.getParameter("productQTY")));
        cm.setProductPrice(product.getProductPrice());
        
        //product details
        cm.setFkProdCatId(product.getFkProdCatId());
        cm.setProductDesc(product.getProductDesc());
        cm.setProductImage(product.getProductImage());
        cartList.add(cm);

        HttpSession session = request.getSession();
        session.setAttribute("cart-list", cartList);

        response.sendRedirect("Shop/Main/Order.jsp");
    }

}
