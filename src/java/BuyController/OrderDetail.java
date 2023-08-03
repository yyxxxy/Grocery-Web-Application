/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BuyController;

import BuyEntity.OrderTable;
import BuyEntity.Payment;
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
public class OrderDetail extends HttpServlet {

    @PersistenceContext
    EntityManager manager;
    @Resource
    UserTransaction transaction;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //order details grt id
        OrderTable order = manager.find(OrderTable.class, Integer.valueOf(request.getParameter("orderID")));
        Product product = manager.find(Product.class, order.getCkProductId().getProductId());

        String sql = "SELECT * FROM PAYMENT WHERE FK_ORDER_ID = ?";
        Query query = manager.createNativeQuery(sql, Payment.class);
        query.setParameter(1, order.getOrderId());

        HttpSession session = request.getSession();

        session.setAttribute("OrderList", order);
        session.setAttribute("Product", product);

        response.sendRedirect("Shop/Main/OrderDetails.jsp");
    }

}
