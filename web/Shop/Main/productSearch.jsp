<%-- 
    Document   : ProductDetail
    Created on : Mar 24, 2022, 4:38:05 PM
    Author     : user
--%>

<%@page import="Product.da.ProductDA"%>
<%@page import="BuyEntity.OrderTable"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="ProductCategory.Entity.Product" %>
<%
    List<Product> list = (List<Product>) session.getAttribute("productSearch");
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

            <section class="product" id="product">
            <%
                if (list.isEmpty() == true) {
            %>
            <div class="erorrmsg">
                <h1 style="text-align: center; font-size: 35px">Product <span style="color: red">Not Available</span>.....</h1>
            </div>
            <%
                }
            %>
            <%
                for (int i = 0; i < list.size(); i++) {

            %>
            <div class="box-container" style="padding: 25px">
                <div class="box">

                    <form action="<%= request.getContextPath()%>/OrderServlet" method="post">
                        <div class="row">
                            <div class="column">
                                <img src="<%= request.getContextPath()%>/ImageProductUpload/<%= list.get(i).getProductImage()%>" alt="">
                            </div>
                            <div class="column text-left">
                                <div>
                                    <h3 style="text-align: left; width: 100%" class="product"><%= list.get(i).getProductName()%></h3>
                                    <div>
                                        <div style="text-align: left; width: 100%; font-size: 25px; color: red" class="price product"><b>RM&nbsp;<%= list.get(i).getProductPrice()%></b></div>
                                        <div class="desc">
                                            <p style="font-size: 15px; text-align: left"><b>Description </b></p>
                                            <hr>
                                            <p style="font-size: 15px; text-align: left"> <%= list.get(i).getProductDesc()%> </p>
                                            <hr>
                                        </div>
                                        <%
                                            if (list.get(i).getProductQty() == 0) {
                                        %>
                                        <div class="quantity product">
                                            <span>quantity : </span>    
                                            <span style="color: red; font-size: 15px"> Out Of Stock</span>
                                        </div>
                                        <%
                                        } else {
                                        %>
                                        <div class="quantity product">
                                            <span>quantity : </span>
                                            <input type="number" name="productQTY" min="1" max="<%= list.get(i).getProductQty()%>" value="1">
                                            <span style="color: #B8B8B8; font-size: 15px">Product Left : <%= list.get(i).getProductQty()%> left</span>
                                        </div>
                                        <!-- Get the value >.< -->
                                        <input type="text" name="prodID" value="<%= list.get(i).getProductId()%>" hidden>
                                        <button class="btn" type="submit" style="width: 100%">Order Now</button>
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </form>
                </div>
            </div>
            <%
                }
            %>
        </section> 
        <!-- Content ends -->
        <jsp:include page="../Layout/footer.jsp"></jsp:include>  
    </body>
</html>
