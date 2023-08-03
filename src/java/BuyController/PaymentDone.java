/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BuyController;

import BuyEntity.OrderTable;
import ProductCategory.Entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
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
public class PaymentDone extends HttpServlet {

    @PersistenceContext
    EntityManager manager;
    @Resource
    UserTransaction transaction;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        validate the credit card number
        Boolean validVisaCard = isValidVisaCardNo(request.getParameter("cardNo"));
        Boolean validCCV = isValidCCVNo(request.getParameter("ccv"));
        Boolean validMonth = isValidMonth(request.getParameter("expMonth"));
        Boolean validYear = isValidYear(request.getParameter("expYear"));

        SimpleDateFormat sdfYear = new SimpleDateFormat("yy");
        Calendar calYear = Calendar.getInstance();
        Date YearSave = calYear.getTime();
        String YearStr = sdfYear.format(YearSave);

        boolean error = false;

        HttpSession session = request.getSession();
        if (validVisaCard.equals(false)) {
            error = true;
            String errorCreditCard = "<div class=\"alert\">\n"
                    + "  <span class=\"closebtn\">&times;</span>  \n"
                    + "  <strong>Error!</strong> Invalid Format: (eg)1234-1234-1234-1234\n"
                    + "</div>";
            session.setAttribute("errorCreditCard", errorCreditCard);
            response.sendRedirect("Shop/Main/Payment.jsp");
        } //ccv
        else if (validCCV.equals(false)) {
            error = true;
            String errorCCV = "<div class=\"alert\">\n"
                    + "  <span class=\"closebtn\">&times;</span>  \n"
                    + "  <strong>Error!</strong> 3 Digits Only\n"
                    + "</div>";
            session.setAttribute("errorCCV", errorCCV);
            response.sendRedirect("Shop/Main/Payment.jsp");
        } //month
        else if (validMonth.equals(false)) {
            error = true;
            String errorMonth = "<div class=\"alert\">\n"
                    + "  <span class=\"closebtn\">&times;</span>  \n"
                    + "  <strong>Error!</strong> Invalid Month.\n"
                    + "</div>";
            session.setAttribute("errorMonth", errorMonth);
            response.sendRedirect("Shop/Main/Payment.jsp");
        } //year
        else if (validYear.equals(false)) {
            error = true;
            String errorYear = "<div class=\"alert\">\n"
                    + "  <span class=\"closebtn\">&times;</span>  \n"
                    + "  <strong>Error!</strong> Invalid Year\n"
                    + "</div>";
            session.setAttribute("errorYear", errorYear);
            response.sendRedirect("Shop/Main/Payment.jsp");
        } else if (Integer.parseInt(request.getParameter("expYear")) < Integer.parseInt(YearStr)) {
            error = true;
            String errorYear = "<div class=\"alert\">\n"
                    + "  <span class=\"closebtn\">&times;</span>  \n"
                    + "  <strong>Error!</strong> Invalid Year\n"
                    + "</div>";
            session.setAttribute("errorYear", errorYear);
            response.sendRedirect("Shop/Main/Payment.jsp");
        }

        try {
//            track the uuid to get the orderid
            if (error == false) {
                String sql = "SELECT * FROM ORDER_TABLE WHERE ORDER_UUID = ?";

                Query query = manager.createNativeQuery(sql, OrderTable.class);
                query.setParameter(1, request.getParameter("uuid"));
                OrderTable orderDetails = (OrderTable) query.getSingleResult();

                transaction.begin();

                String paymentName = request.getParameter("cardName");
                String creditCardNumber = request.getParameter("cardNo");
                String expMonth = request.getParameter("expMonth");
                String ccv = request.getParameter("ccv");
                String expYear = request.getParameter("expYear");
                LocalDateTime now = LocalDateTime.now();
                int orderID = orderDetails.getOrderId();

                Query insertQuery;
                insertQuery = manager.createNativeQuery("INSERT INTO PAYMENT (PAYMENT_NAME, CERDIT_CARD_NUMBER, EXP_MONTH, CCV, EXP_YEAR, PAYMENT_DATE, FK_ORDER_ID) VALUES (?,?,?,?,?,?,?)")
                        .setParameter(1, paymentName)
                        .setParameter(2, creditCardNumber)
                        .setParameter(3, expMonth)
                        .setParameter(4, ccv)
                        .setParameter(5, expYear)
                        .setParameter(6, now)
                        .setParameter(7, orderID);

                insertQuery.executeUpdate();

                //            update status
                orderDetails.setOrderStatus("Success");

                manager.merge(orderDetails);

                //             minus qty
                Product prod = manager.find(Product.class, Integer.valueOf(request.getParameter("prodID")));

                int productQty = prod.getProductQty() - Integer.parseInt(request.getParameter("productQuantity"));

                prod.setProductQty(productQty);

                manager.merge(prod);

                transaction.commit();

                //            show message
                String showMessage = "alert('Item will be delivered soon.');";

                session.setAttribute("showMessage", showMessage);

                response.sendRedirect("Shop/Main/index.jsp");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public static boolean
            isValidVisaCardNo(String str) {
        // Regex to check valid.
        // Visa Card number
        String regex = "[0-9]{4}[-]{1}[0-9]{4}[-]{1}[0-9]{4}(?:[-]{1}[0-9]{4})?$";

        // Compile the ReGex
        Pattern p = Pattern.compile(regex);

        // If the string is empty
        // return false
        if (str == null) {
            return false;
        }

        // Find match between given string
        // and regular expression
        // using Pattern.matcher()
        Matcher m = p.matcher(str);

        // Return if the string
        // matched the ReGex
        return m.matches();
    }

    public static boolean
            isValidCCVNo(String str) {
        // Regex to check valid.
        // Visa Card number
        String regex = "[0-9]{3}?$";

        // Compile the ReGex
        Pattern p = Pattern.compile(regex);

        // If the string is empty
        // return false
        if (str == null) {
            return false;
        }

        // Find match between given string
        // and regular expression
        // using Pattern.matcher()
        Matcher m = p.matcher(str);

        // Return if the string
        // matched the ReGex
        return m.matches();
    }

    public static boolean
            isValidYear(String str) {
        // Regex to check valid.
        // Visa Card number
        String regex = "[0-9]{2}?$";

        // Compile the ReGex
        Pattern p = Pattern.compile(regex);

        // If the string is empty
        // return false
        if (str == null) {
            return false;
        }

        // Find match between given string
        // and regular expression
        // using Pattern.matcher()
        Matcher m = p.matcher(str);

        // Return if the string
        // matched the ReGex
        return m.matches();
    }

    public static boolean
            isValidMonth(String str) {
        // Regex to check valid.
        // Visa Card number
        String regex = "1[0-2]|0[1-9]";

        // Compile the ReGex
        Pattern p = Pattern.compile(regex);

        // If the string is empty
        // return false
        if (str == null) {
            return false;
        }

        // Find match between given string
        // and regular expression
        // using Pattern.matcher()
        Matcher m = p.matcher(str);

        // Return if the string
        // matched the ReGex
        return m.matches();
    }

}
