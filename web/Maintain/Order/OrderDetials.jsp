<%@page import="Customer.Entity.Customer"%>
<%@page import="Customer.da.CustomerDA"%>
<%@page import="ProductCategory.Entity.Product"%>
<%@page import="Product.da.ProductDA"%>
<%@page import="BuyEntity.OrderTable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../Layout/header.html"></jsp:include> 
        </head>
        <body>
        <jsp:include page="../Layout/navbar.jsp"></jsp:include>  
            <!-- Content here start -->
        <%
            OrderTable order = (OrderTable) session.getAttribute("order");
        %>

        <div class="row">
            <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
                <div class="d-flex flex-column-fluid">
                    <div class="container">
                        <p class="pb-2 mt-4"><a href="/home">Home</a> / <a href="../Order/SalesRecord.jsp">Sales</a> / <strong>Order Details</strong></p>

                        <div>
                            <div id="productDetailBox">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <label class="m-0 ml-2 mt-4" for="orderDetails">
                                            <h3>
                                                <legend>Order Details</legend>
                                            </h3>
                                        </label>

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="form-row">

                                                    <!-- Order UUID -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="orderUUID" class="h7 float-right">Order UUID</label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <input type="text" name="orderUUID" class="form-control" value="<%= order.getOrderUuid()%>" readonly>
                                                        </div>
                                                    </div>
                                                    <!-- Receiver Name -->
                                                    <div class="mt-3 col-md-4" >
                                                        <label for="orderReceiver" class="h7 float-right">Order Receiver</label>
                                                    </div>

                                                    <div class="col-md-6" >
                                                        <div class="form-group">
                                                            <input type="text" name="orderReceiver" class="form-control" value="<%= order.getOrderReceiveName()%>" readonly>
                                                        </div>
                                                    </div>

                                                    <!-- Order Address -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="orderAddress" class="h7 float-right">Receiver Address</label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <input type="text" name="orderAddress" class="form-control" value="<%= order.getOrderAddress()%>" readonly>
                                                        </div>
                                                    </div>

                                                    <!--Customer name (UserName)-->     
                                                    <div class="mt-3 col-md-4">
                                                        <label for="custName" class="h7 float-right">User Name</label>
                                                    </div>

                                                    <%
                                                        Customer customer = CustomerDA.getCustomerRecordById(order.getCkCustomerId().getCustomerId());
                                                    %>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <input type="text" name="prodName" class="form-control" value="<%= customer.getCustomerUsername()%>" readonly>
                                                        </div>
                                                    </div>

                                                    <!-- Product Name -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="prodName" class="h7 float-right">Product Name</label>
                                                    </div>

                                                    <%
                                                        Product product = ProductDA.serachByID(order.getCkProductId().getProductId());
                                                    %>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <input type="text" name="prodName" class="form-control" value="<%= product.getProductName()%>" readonly>
                                                        </div>
                                                    </div>

                                                    <!-- Product QTY -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="prodQTY" class="h7 float-right">Product Quantity</label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <input type="text" name="prodQTY" class="form-control" value="<%= order.getOrderQty()%>" readonly>
                                                        </div>
                                                    </div>

                                                    <!-- Order payment Amount -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="orderPaymentAmount" class="h7 float-right"> Product Price </label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <input type="numeric" name="orderPaymentAmount" class="form-control"  value="RM <%= order.getOrderPaymentAmount()%>" readonly>
                                                        </div>
                                                    </div>

                                                    <!-- Order Status -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="orderStatus" class="h7 float-right">Order Status</label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <input type="text" name="orderStatus" class="form-control" value="<%= order.getOrderStatus()%>" readonly>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Content here end -->
            <jsp:include page="../Layout/footer.html"></jsp:include>  
    </body>
</html>
