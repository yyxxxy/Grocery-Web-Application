<%-- 
    Document   : test
    Created on : Mar 27, 2022, 12:54:12 AM
    Author     : user
--%>

<%@page import="BuyEntity.OrderTable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    OrderTable prod = (OrderTable) session.getAttribute("Order");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%= prod.getOrderReceiveName() %>
        <%= prod.getOrderStatus()%>
    </body>
</html>
