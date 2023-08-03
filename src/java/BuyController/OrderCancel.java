/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BuyController;

import BuyEntity.OrderTable;
import ProductCategory.Entity.Product;
import java.io.IOException;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;

/**
 *
 * @author user
 */
public class OrderCancel extends HttpServlet {

    @PersistenceContext
    EntityManager manager;
    @Resource
    UserTransaction transaction;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //        Set the status to cancel
            transaction.begin();
            OrderTable order = manager.find(OrderTable.class, Integer.valueOf(request.getParameter("orderID")));

            order.setOrderStatus("Cancel");
            
            Product product = manager.find(Product.class, order.getCkProductId().getProductId());
            
            int refundQty = product.getProductQty();
            //add back the qty 
            product.setProductQty(refundQty + order.getOrderQty());
            
            manager.merge(product);
            manager.merge(order);
            
            transaction.commit();
            
            response.sendRedirect("Shop/Main/orderHistory.jsp");
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }
}
