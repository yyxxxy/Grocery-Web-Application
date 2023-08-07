<%-- 
    Document   : trackcart
    Created on : Mar 23, 2022, 1:49:23 PM
    Author     : user
--%>

<%@page import="BuyEntity.OrderTable"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Customer.Entity.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    OrderTable order = (OrderTable) session.getAttribute("OrderItems");
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
    .alert {
        padding: 20px;
        background-color: #f44336;
        font-size: 20px;
        color: white;
        opacity: 1;
        transition: opacity 0.6s;
        margin-bottom: 15px;
    }

    .alert.success {background-color: #04AA6D;}
    .alert.info {background-color: #2196F3;}
    .alert.warning {background-color: #ff9800;}

    .closebtn {
        margin-left: 15px;
        color: white;
        font-weight: bold;
        float: right;
        font-size: 22px;
        line-height: 20px;
        cursor: pointer;
        transition: 0.3s;
    }

    .closebtn:hover {
        color: black;
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
            <section class="product" id="product">


                <div class="box-container">
                    <div class="box">
                        <h3>Payment</h3>
                        <hr>
                        <div class="row">
                            <div class="column tableHead">
                                Item Name
                            </div>
                            <div class="column tableHead">
                                Qty
                            </div>
                            <div class="column tableHead">
                                Item Price
                            </div>
                            <div class="column tableHead">
                                Total Price
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="column tableBody">
                            <%= order.getCkProductId().getProductName()%>
                        </div>
                        <div class="column tableBody">
                            <%= order.getOrderQty()%>
                        </div>
                        <div class="column tableBody">
                            <%= order.getCkProductId().getProductPrice()%>
                        </div>
                        <div class="column tableBody">
                            <%= order.getOrderPaymentAmount()%>
                        </div>
                    </div>
                </div>
            </div>
        </section> 

        <!--payment detail-->
        <section class="product" id="product">


            <div class="box-container">
                <div class="box">
                    <form action="<%= request.getContextPath()%>/PaymentDone" method="post">
                        <h3>Payment Method</h3>
                        <hr>
                        <!--card name-->
                        <div class="row inputRow">
                            <div class="column tableBody inputLabel">
                                <label>Name On Card</label>
                            </div>
                            <div class="column tableBody" style="width: 100%">
                                <input type="text" class="inputPayment" name="cardName" placeholder="Name Here" required>
                            </div>
                        </div>
                        <!--card number-->
                        <div class="row inputRow">
                            <div class="column tableBody inputLabel">
                                <label>Credit Card Number</label>
                            </div>
                            <div class="column tableBody" style="width: 100%;">
                                <input type="text" class="inputPayment" name="cardNo" placeholder="eg: 1234-1234-1234-1234" required>
                            </div>
                        </div>
                        <%
                            String errorCreditCard = (String) session.getAttribute("errorCreditCard");
                            if (errorCreditCard != null) {
                                out.print(errorCreditCard);
                            }
                            session.removeAttribute("errorCreditCard");
                        %>
                        <!--exp month-->
                        <div class="row inputRow">
                            <div class="column tableBody inputLabel">
                                <label>Exp Month</label>
                            </div>
                            <div class="column tableBody" style="width: 100%">
                                <input type="text" class="inputPayment" name="expMonth" placeholder="eg: 01 - 12 (Month)" required>
                            </div>
                        </div>
                        <%
                            String errorMonth = (String) session.getAttribute("errorMonth");
                            if (errorMonth != null) {
                                out.print(errorMonth);
                            }
                            session.removeAttribute("errorMonth");
                        %>
                        <!--ccv-->
                        <div class="row inputRow">
                            <div class="column tableBody inputLabel">
                                <label>CCV</label>
                            </div>
                            <div class="column tableBody" style="width: 100%">
                                <input type="text" class="inputPayment" name="ccv" placeholder="eg: 123 (CCV)" required>
                            </div>
                        </div>
                        <%
                            String errorCCV = (String) session.getAttribute("errorCCV");
                            if (errorCCV != null) {
                                out.print(errorCCV);
                            }
                            session.removeAttribute("errorCCV");
                        %>
                        <!--exp year-->
                        <div class="row inputRow">
                            <div class="column tableBody inputLabel">
                                <label>Exp Year</label>
                            </div>
                            <div class="column tableBody" style="width: 100%">
                                <input type="text" class="inputPayment" name="expYear" placeholder="eg: 22 (Year)" required>
                            </div>
                        </div>
                         <%
                            String errorYear = (String) session.getAttribute("errorYear");
                            if (errorYear != null) {
                                out.print(errorYear);
                            }
                            session.removeAttribute("errorYear");
                        %>
                        <!--let the servlet get the value-->
                        <input type="text" class="inputPayment" name="uuid" value="<%= order.getOrderUuid()%>" hidden>
                        <input type="text" class="inputPayment" name="productQuantity" value="<%= order.getOrderQty()%>" hidden>
                        <input type="text" class="inputPayment" name="prodID" value="<%= order.getCkProductId().getProductId()%>" hidden>

                        <div class="row inputRow">
                            <div class="column tableBody inputLabel">
                            </div>
                            <div class="column tableBody" style="width: 100%">
                                <button class="btn" name="btnValue" type="submit" style="width: 100%; border-radius: 3px" value="Paynow">Proceed</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section> 
        <script>
            var close = document.getElementsByClassName("closebtn");
            var i;
            for (i = 0; i < close.length; i++) {
                close[i].onclick = function () {
                    var div = this.parentElement;
                    div.style.opacity = "0";
                    setTimeout(function () {
                        div.style.display = "none";
                    }, 600);
                }
            }
        </script>
        <%
            session.removeAttribute("successMsg");
        %>
        <!-- Content ends -->
        <jsp:include page="../Layout/footer.jsp"></jsp:include>  
    </body>
</html>
