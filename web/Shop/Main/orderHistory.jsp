<%-- 
    Document   : trackcart
    Created on : Mar 23, 2022, 1:49:23 PM
    Author     : user
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Collections"%>
<%@page import="Sorting.SortByDate"%>
<%@page import="Product.da.ProductDA"%>
<%@page import="ProductCategory.Entity.Product"%>
<%@page import="BuyDA.OrderListDA"%>
<%@page import="java.util.List"%>
<%@page import="BuyEntity.OrderTable"%>
<%@page import="Customer.Entity.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<%
    List<OrderTable> list = OrderListDA.getAllRecords();
    Collections.sort(list, new SortByDate());
    Customer cust = (Customer) session.getAttribute("CustomerDetails");
%>
<style>
    .row {
        display: flex;
    }

    .column{
        flex: 50%;

    }
    hr {
        margin-top: 5px;
        margin-bottom: 5px;
        border-top: 1px solid grey;
    }
    .inputPayment{
        border: 1px solid #C5C6D0;
        border-radius: 3px;
        font-size: 15px;
        width: 80%;
    }
    .inputLabel{
        text-align: right;
    }
    .tableHead{
        font-size: 20px;
    }
    .tableBody{
        font-size: 20px;
    }
    .inputRow{
        padding-bottom: 3px;
    }
    .tableDesign{
        font-size: 20px;
        width: 100%;
    }
    .btnCancel:hover{
        color: red;
    }
    table {
        border-collapse: collapse;
    }

    tr {
        border-bottom: 1pt solid black;
        padding-bottom: 3px;
    }

</style>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../Layout/header.jsp"></jsp:include> 
        </head>
        <body>
        <jsp:include page="../Layout/navbar.jsp"></jsp:include>

            <!-- Content starts  -->
            <section class="product" id="product" style="width: 100%">

                <div class="box-container">
                    <div class="box">
                        <h3>Order History</h3>
                        <hr>
                        <table class="tableDesign">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Receiver Name</th>
                                    <th>Order Item</th>
                                    <th>Item Quantity</th>
                                    <th>Total Payment</th>
                                    <th>Date</th>
                                    <th>Order Status</th>
                                    <th>Actions</th>
                                </tr> 
                            </thead>

                            <tbody>
                                <!--   for (Todo todo: todos) {  -->
                            <%
                                int count = 0;
                                for (int i = 0; i < list.size(); i++) {
                                    if (list.get(i).getCkCustomerId().getCustomerId().equals(cust.getCustomerId())) {
                                        Product prod = ProductDA.serachByID(list.get(i).getCkProductId().getProductId());
                                        count++;
                            %>
                            <tr>
                                <td><%= count%></td>
                                <td><%= list.get(i).getOrderReceiveName()%></td>
                                <td><%= prod.getProductName()%></td>
                                <td><%= list.get(i).getOrderQty()%></td>
                                <td>RM <%= list.get(i).getOrderPaymentAmount()%></td>
                                <%
                                    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                                    String date = sdf.format(list.get(i).getOrderDate());
                                %>
                                <td><%= date%></td>
                                <%
                                    if (list.get(i).getOrderStatus().equals("Payment Fail")) {
                                %>
                                <td><p  style="color: white; background-color: orange; border-radius: 3px"><%= list.get(i).getOrderStatus()%></p></td>
                                    <%
                                    } else if (list.get(i).getOrderStatus().equals("Success")) {
                                    %>
                                <td><p style="color: white; background-color: greenyellow; border-radius: 3px"><%= list.get(i).getOrderStatus()%></p></td>
                                    <%
                                    } else if (list.get(i).getOrderStatus().equals("Cancel")) {
                                    %>
                                <td><p style="color: white; background-color: gainsboro; border-radius: 3px"><%= list.get(i).getOrderStatus()%></p></td>
                                    <%
                                    } else if (list.get(i).getOrderStatus().equals("Packaging")) {
                                    %>
                                <td style="text-align: center"><span  style="background-color:#FA8128 ; color: white; padding: 5px; border-radius: 5px"><%=  list.get(i).getOrderStatus()%></span></td>
                                    <%
                                    } else if (list.get(i).getOrderStatus().equals("Shipping")) {
                                    %>
                                <td style="text-align: center"><span  style="background-color:#FA8128 ; color: white; padding: 5px; border-radius: 5px"><%=  list.get(i).getOrderStatus()%></span></td>
                                    <%
                                    } else if (list.get(i).getOrderStatus().equals("Delivered")) {
                                    %>
                                <td style="text-align: center"><span  style="background-color: greenyellow; color: white; padding: 5px; border-radius: 5px"><%=  list.get(i).getOrderStatus()%></span></td>
                                    <%
                                        }
                                    %>
                                <td align="center" style="padding-bottom: 10px">
                                    <%
                                        if (list.get(i).getOrderStatus().equals("Payment Fail")) {
                                        } else {
                                    %>
                                    <a href="<%= request.getContextPath()%>/OrderDetail?orderID=<c:out value="<%= list.get(i).getOrderId()%>" />">
                                        <button type="button" class="btn btn-primary" style="width: 100px">
                                            View
                                        </button>
                                    </a>
                                    <%
                                        }
                                        if (list.get(i).getOrderStatus().equals("Cancel") || list.get(i).getOrderStatus().equals("Payment Fail") == false) {
                                        } else {
                                    %>
                                    <a href="<%= request.getContextPath()%>/OrderCancel?orderID=<c:out value="<%= list.get(i).getOrderId()%>" />">
                                        <button type="button" class="btn btn-danger btnCancel" style="width: 100px; padding-left: 25px;">
                                            Cancel
                                        </button>
                                    </a>
                                    <%
                                        }
                                    %>

                                </td>
                            </tr>
                            <%
                                }
                            %>
                            <%
                                }
                            %>
                            <!-- } -->
                        </tbody>

                    </table>
                </div>
            </div>
        </section> 



        <!-- Content ends -->
        <jsp:include page="../Layout/footer.jsp"></jsp:include>  
    </body>
</html>
