/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BuyController;

import BuyEntity.OrderTable;
import Customer.Entity.Customer;
import java.io.IOException;
import ProductCategory.Entity.Product;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.UUID;
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
public class PaymentServlet extends HttpServlet {

    @PersistenceContext
    EntityManager manager;
    @Resource
    UserTransaction transaction;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            transaction.begin();
            UUID uuid = UUID.randomUUID();
            String orderName = request.getParameter("orderName");
            String orderAddress = request.getParameter("orderAddress");
            double totalAmount = Double.parseDouble(request.getParameter("orderTotalAmount"));
            //order date
            Date date = new Date();  
            //round the amount
            String roundedAmount = String.format("%.2f", totalAmount);

            String orderStatus = request.getParameter("orderStatus");
            int orderQty = Integer.parseInt(request.getParameter("productQuantity"));
            int custID = Integer.parseInt(request.getParameter("custID"));
            int prodID = Integer.parseInt(request.getParameter("prodID"));
            Query insertQuery;
            insertQuery = manager.createNativeQuery("INSERT INTO ORDER_TABLE (ORDER_UUID,ORDER_RECEIVE_NAME, ORDER_ADDRESS, ORDER_PAYMENT_AMOUNT, ORDER_STATUS, ORDER_QTY, CK_CUSTOMER_ID, CK_PRODUCT_ID, ORDER_DATE) VALUES (?,?,?,?,?,?,?,?,?)")
                    .setParameter(1, uuid.toString())
                    .setParameter(2, orderName)
                    .setParameter(3, orderAddress)
                    .setParameter(4, Double.valueOf(roundedAmount))
                    .setParameter(5, orderStatus)
                    .setParameter(6, orderQty)
                    .setParameter(7, custID)
                    .setParameter(8, prodID)
                    .setParameter(9, date);

            insertQuery.executeUpdate();

            Product prod = manager.find(Product.class, Integer.valueOf(request.getParameter("prodID")));
            transaction.commit();

            OrderTable order = new OrderTable();
            order.setOrderUuid(uuid.toString());
            order.setOrderReceiveName(orderName);
            order.setOrderAddress(orderAddress);
            order.setOrderPaymentAmount(totalAmount);
            order.setOrderStatus(orderStatus);
            order.setOrderQty(orderQty);
//            date
            order.setOrderDate(date);

//          set name to let the page can get the name
            Product orderProduct = new Product();
            orderProduct.setProductId(prodID);
            orderProduct.setProductName(prod.getProductName());
            orderProduct.setProductPrice(prod.getProductPrice());
            order.setCkProductId(orderProduct);

            order.setCkCustomerId(new Customer(custID));

            HttpSession session = request.getSession();
            session.setAttribute("OrderItems", order);
            response.sendRedirect("Shop/Main/Payment.jsp");

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

}
