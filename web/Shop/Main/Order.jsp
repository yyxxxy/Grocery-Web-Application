<%-- 
    Document   : trackcart
    Created on : Mar 23, 2022, 1:49:23 PM
    Author     : user
--%>

<%@page import="BuyEntity.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Customer.Entity.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cart-list");
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
    .inputOrder{
        border: 1px solid #C5C6D0;
        border-radius: 3px;
        font-size: 15px;
        width: 80%;
    }
</style>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../Layout/header.jsp"></jsp:include> 
        </head>
        <body>
        <jsp:include page="../Layout/navbar.jsp"></jsp:include>
        <%
            for (int i = 0; i < cartList.size(); i++) {
        %>

        <!-- Content starts  -->
        <section class="product" id="product">


            <div class="box-container">
                <div class="box">
                    <form action="<%= request.getContextPath()%>/PaymentServlet" method="post">
                        <div class="row">
                            <div class="column">
                                <img src="<%= request.getContextPath()%>/ImageProductUpload/<%= cartList.get(i).getProductImage()%>" alt="">
                            </div>
                            <div class="column text-left">
                                <div>
                                    <div class="row">   
                                        <div class="columm" style="text-align: left; width: 50%; text-align: right">
                                            <h3  class="product" style="font-size: 20px">Item Name : </h3>
                                        </div>
                                        <div class="columm" style="text-align: left; width: 100%;">
                                            <h3 style="text-align: left; font-size: 20px; padding-left: 5px" class="product"> <%= cartList.get(i).getProductName()%></h3>
                                        </div>

                                    </div>
                                    <div>
                                        <!--price-->
                                        <div class="row">   
                                            <div style="text-align: left; width: 50%; text-align: right" class="price product columm">
                                                <h3  class="product" style="font-size: 20px">Item Price : </h3>
                                            </div>
                                            <div style="text-align: left; width: 100%; color: red" class="price product columm">
                                                <h3  class="product" style="font-size: 20px; color: red; padding-left: 5px">RM&nbsp;<%= cartList.get(i).getProductPrice()%></h3>
                                            </div>
                                        </div>
                                        <!--qty-->
                                        <div class="row">   
                                            <div style="text-align: left; width: 50%; text-align: right" class="price product columm">
                                                <h3  class="product" style="font-size: 20px">Product Quantity : </h3>
                                            </div>
                                            <div style="text-align: left; width: 100%; color: red" class="price product columm">
                                                <h3  class="product" style="font-size: 20px; color: var(--green); padding-left: 5px"><%= cartList.get(i).getQuantity()%></h3>
                                            </div>
                                        </div>
                                        <!--total amount-->
                                        <div class="row">   
                                            <div style="text-align: left; width: 50%; text-align: right" class="price product columm">
                                                <h3  class="product" style="font-size: 20px">Total Amount : </h3>
                                            </div>
                                            <div style="text-align: left; width: 100%; color: red" class="price product columm">
                                                <h3  class="product" style="font-size: 20px; color: red; padding-left: 5px">RM&nbsp;<%= String.format("%.2f", cartList.get(i).calculateTotalAmount(cartList.get(i).getProductPrice(), cartList.get(i).getQuantity()))%></h3>
                                            </div>
                                        </div>

                                        <hr>

                                        <!--personal Detail-->

                                        <div class="row">   
                                            <div style="text-align: left; width: 100%; text-align: center" class="price product columm">
                                                <h3  class="product" style="font-size: 20px; color:var(--green)">Personal Detail</h3>
                                            </div>
                                        </div>

                                        <!--name-->
                                        <div class="row">   
                                            <div style="text-align: left; width: 50%; text-align: right" class="price product columm">
                                                <h3  class="product" style="font-size: 20px">Name : </h3>
                                            </div>
                                            <div style="text-align: left; width: 100%; color: red; padding-left: 5px" class="price product columm">
                                                <input type="text" name="orderName" class="inputOrder" required>
                                            </div>
                                        </div>

                                        <!--address-->
                                        <div class="row">   
                                            <div style="text-align: left; width: 50%; text-align: right" class="price product columm">
                                                <h3  class="product" style="font-size: 20px">Address : </h3>
                                            </div>
                                            <div style="text-align: left; width: 100%; color: red; padding-left: 5px" class="price product columm">
                                                <input type="text" name="orderAddress" class="inputOrder" required>
                                            </div>
                                        </div>

                                        <!-- Get the value >.< -->
                                        <input type="text" name="productQuantity" class="inputOrder" value="<%= cartList.get(i).getQuantity()%>" hidden>
                                        <input type="text" name="orderTotalAmount" class="inputOrder" value="<%= String.format("%.2f", cartList.get(i).calculateTotalAmount(cartList.get(i).getProductPrice(), cartList.get(i).getQuantity()))%>" hidden>
                                        <input type="text" name="orderStatus" class="inputOrder" value="Payment Fail" hidden>
                                        <input type="text" name="prodID" class="inputOrder" value="<%= cartList.get(i).getProductId()%>" hidden>
                                        <input type="text" name="custID" class="inputOrder" value="<%= cust.getCustomerId()%>" hidden>
                                        
                                        
                                        <div class="row">   
                                            <div style="text-align: left; width: 100%; color: red; padding-left: 5px" class="price product columm">
                                                <button class="btn" name="btnValue" type="submit" style="width: 100%; padding-left: 5px; border-radius: 3px" value="Paynow">Pay now</button>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div>

                            </div>

                        </div>

                        <%
                            }
                        %>
                    </form>
                </div>
            </div>
        </section> 
        <!-- Content ends -->
        <jsp:include page="../Layout/footer.jsp"></jsp:include>  
    </body>
</html>
