
<%@page import="java.util.Date"%>
<%@page import="BuyDA.PaymentDA"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="ProductCategory.Entity.Product"%>
<%@page import="BuyEntity.Payment"%>
<%@page import="BuyEntity.OrderTable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    OrderTable order = (OrderTable) session.getAttribute("OrderList");
    Payment payment = PaymentDA.getPayemntRecord(order.getOrderId());
    Product product = (Product) session.getAttribute("Product");
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
</style>
<html>
    <jsp:include page="../Layout/header.jsp"></jsp:include>
        <body>
        <jsp:include page="../Layout/navbar.jsp"></jsp:include>

            <!-- Content starts  -->
            <!--Product Section-->
            <div class="row">
                <h3 style="text-align: center; font-size: 22px; width: 100%;padding-top:20px"> Product Information</h3>
            </div>
            <section class="product" id="product">
                <div class="box-container">
                    <div class="box">
                        <div class="row">
                            <div class="column">
                                <img src="<%= request.getContextPath()%>/ImageProductUpload/<%= product.getProductImage()%>" alt="">
                        </div>
                        <div class="column text-left">
                            <div>
                                <div class="row">   
                                    <div class="columm" style="text-align: left; width: 50%; text-align: right">
                                        <h3  class="product" style="font-size: 20px">Item Name : </h3>
                                    </div>
                                    <div class="columm" style="text-align: left; width: 100%;">
                                        <h3 style="text-align: left; font-size: 20px; padding-left: 5px" class="product"> <%= product.getProductName()%></h3>
                                    </div>

                                </div>
                                <div>
                                    <!--price-->
                                    <div class="row">   
                                        <div style="text-align: left; width: 50%; text-align: right" class="price product columm">
                                            <h3  class="product" style="font-size: 20px">Item Price (per Qty) : </h3>
                                        </div>
                                        <div style="text-align: left; width: 100%; color: red" class="price product columm">
                                            <h3  class="product" style="font-size: 20px; color: red; padding-left: 5px">RM&nbsp;<%= product.getProductPrice()%></h3>
                                        </div>
                                    </div>
                                    <!--desc-->
                                    <div class="row">   
                                        <h3  class="product" style="font-size: 20px; color: var(--green)">Description</h3>
                                    </div>
                                    <hr>
                                    <div class="row">   
                                        <h3  class="product"  style="font-size: 17px;"><%= product.getProductDesc()%></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section> 

        <!--order Details-->
        <div class="row">
            <h3 style="text-align: center; font-size: 22px; width: 100%;padding-top:20px"> Order Information </h3>
        </div>
        <section class="product" id="product">
            <div class="box-container">
                <div class="box">
                    <!--order uuid-->
                    <div class="row">   
                        <div class="columm" style="text-align: left; width: 100%; text-align: right">
                            <h3  class="product" style="font-size: 20px">Order UUID : </h3>
                        </div>
                        <div class="columm" style="text-align: left; width: 100%;">
                            <h3 style="text-align: left; font-size: 20px; padding-left: 5px" class="order"> <%= order.getOrderUuid()%></h3>
                        </div>
                    </div>
                    <!--Date-->
                    <div class="row">   
                        <div style="text-align: left; width: 100%; text-align: right" class=" columm">
                            <h3  class="product" style="font-size: 20px">Order Date : </h3>
                        </div>
                        <div style="text-align: left; width: 100%" class="columm">
                            <%
                                SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                                String stringDate = formatter.format(order.getOrderDate());
                            %>
                            <h3  class="product" style="font-size: 20px;padding-left: 5px;"><%= stringDate%></h3>
                        </div>
                    </div>    

                    <!--Receiver-->
                    <div class="row">   
                        <div style="text-align: left; width: 100%; text-align: right" class=" columm">
                            <h3  class="product" style="font-size: 20px">Order Receiver : </h3>
                        </div>
                        <div style="text-align: left; width: 100%" class="columm">
                            <h3  class="product" style="font-size: 20px;padding-left: 5px; color: var(--green)"><%= order.getOrderReceiveName()%></h3>
                        </div>
                    </div>

                    <!--Address-->
                    <div class="row">   
                        <div style="text-align: left; width: 100%; text-align: right" class=" columm">
                            <h3  class="product" style="font-size: 20px">Address : </h3>
                        </div>
                        <div style="text-align: left; width: 100%" class="columm">
                            <h3  class="product" style="font-size: 20px;padding-left: 5px"><%= order.getOrderAddress()%></h3>
                        </div>
                    </div>

                    <!--Quantity-->
                    <div class="row">   
                        <div style="text-align: left; width: 100%; text-align: right" class=" columm">
                            <h3  class="product" style="font-size: 20px">Item Quantity : </h3>
                        </div>
                        <div style="text-align: left; width: 100%" class="columm">
                            <h3  class="product" style="font-size: 20px;padding-left: 5px"><%= order.getOrderQty()%></h3>
                        </div>
                    </div>

                    <!--Payment Amount-->
                    <div class="row">   
                        <div style="text-align: left; width: 100%; text-align: right" class=" columm">
                            <h3  class="product" style="font-size: 20px">Payment Amount : </h3>
                        </div>
                        <div style="text-align: left; width: 100%" class="columm">
                            <h3  class="product" style="font-size: 20px;padding-left: 5px; color: var(--green)">RM&nbsp;<%= order.getOrderPaymentAmount()%></h3>
                        </div>
                    </div>

                    <!--Status-->
                    <div class="row">   
                        <div style="text-align: left; width: 100%; text-align: right" class=" columm">
                            <h3  class="product" style="font-size: 20px">Order Status : </h3>
                        </div>
                        <div style="text-align: left; width: 100%" class="columm">
                            <%
                                if (order.getOrderStatus().equals("Payment Fail")) {
                            %>
                            <h3 class="product" style="font-size: 20px;padding-left: 5px; color: orange"><%= order.getOrderStatus()%></h3>
                            <%
                            } else if (order.getOrderStatus().equals("Success")) {
                            %>
                            <h3 class="product" style="font-size: 20px;padding-left: 5px; color: greenyellow"><%= order.getOrderStatus()%></h3>
                            <%
                            } else if (order.getOrderStatus().equals("Cancel")) {
                            %>
                            <h3 class="product" style="font-size: 20px;padding-left: 5px; color: black;"><%= order.getOrderStatus()%></h3>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </section> 
        <!--Paymment information-->
        <div class="row">
            <h3 style="text-align: center; font-size: 22px; width: 100%;padding-top:20px">Payment Information</h3>
        </div>
        <section class="product" id="product">
            <div class="box-container">
                <div class="box">  
                    <!--payment name-->
                    <%
                        if (payment != null) {
                    %>
                    <div class="row">   
                        <div style="text-align: left; width: 100%; text-align: right" class=" columm">
                            <h3  class="product" style="font-size: 20px">Payment Name : </h3>
                        </div>
                        <div style="text-align: left; width: 100%" class="columm">
                            <h3  class="product" style="font-size: 20px;padding-left: 5px"><%= payment.getPaymentName()%></h3>
                        </div>
                    </div>


                    <!--Pay date-->
                    <div class="row">   
                        <div style="text-align: left; width: 100%; text-align: right" class=" columm">
                            <h3  class="product" style="font-size: 20px">Payment Date : </h3>
                        </div>
                        <div style="text-align: left; width: 100%" class="columm">
                            <h3  class="product" style="font-size: 20px;padding-left: 5px"><%
                                DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                                String date = dateFormat.format(payment.getPaymentDate());
                                %> <%= date%></h3>
                        </div>
                    </div>

                </div>
            </div>
        </section> 
        <%
        } else {
        %>
        <div class="row">
            <h3 style="text-align: center; font-size: 22px; width: 100%;padding-top:20px">No Payment Made</h3>
        </div>
        <%
            }
        %>
        <!-- Content ends -->
        <jsp:include page="../Layout/footer.jsp"></jsp:include>  
    </body>
</html>
