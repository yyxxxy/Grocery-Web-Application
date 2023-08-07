<%@page import="ProductCategory.Entity.ProductCategory"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Product.da.ProductDA"%>
<%@page import="ProductCategory.Entity.Product"%>
<%@page import="Customer.Entity.Customer"%>
<%@page import="BuyDA.OrderListDA"%>
<%@page import="BuyEntity.OrderTable"%>
<%@page import="Sorting.SortByNameUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../Layout/header.html"></jsp:include> 
        </head>
        <body>
        <jsp:include page="../Layout/navbar.jsp"></jsp:include>  
            <!-- Content here start -->

        <%@page import="Customer.da.CustomerDA,java.util.*"%>
        <%
            String selection = (String) session.getAttribute("Selection");
            String searchInput = (String) session.getAttribute("userInput");

        %>  


        <div class="row">

            <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
                <div class="d-flex flex-column-fluid">
                    <div class="container">
                        <p class="pb-2 mt-4"><a href="/home">Home</a> / <strong>Search</strong></p>
                        <div class="row" style="text-align: center">
                            <h3>Search By Criteria</h3>
                        </div>
                        <hr>

                        <form action="<%= request.getContextPath()%>/SearchServlet" method="get">
                            <div class="row">
                                <div class="col-md-4">
                                    <span><b>Search Category</b></span>
                                </div>
                                <div class="col-md-4">
                                    <div class="row">
                                        <span><b>Select the category:</b></span>
                                    </div>
                                    <div class="row" >
                                        <div class="form-check" style="padding-left: 35px;">
                                            <input type="radio" class="form-check-input" id="Customer" name="searchCategory" value="Customer">
                                            <label for="Customer">Customer</label><br>
                                            <input type="radio" class="form-check-input" id="Product" name="searchCategory" value="Product">
                                            <label for="Product">Product</label><br>
                                            <input type="radio" class="form-check-input" id="SalesRecord" name="searchCategory" value="SalesRecord">
                                            <label for="SalesRecord">Sales Record</label><br>
                                            <input type="radio" class="form-check-input" id="Order" name="searchCategory" value="Order">
                                            <label for="Order">Order</label><br>
                                            <input type="radio" class="form-check-input" id="Order" name="searchCategory" value="Staff">
                                            <label for="Staff">Staff</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-md-4">
                                    <span><b>Search here:</b></span>
                                </div>
                                <div class="col-md-4" style="padding-left: 0px; padding-right: 0px;">
                                    <input type="text" name="search" placeholder="Search Here.." style="width: 100%; border: 1px solid gainsboro; border-radius: 3px">
                                </div>
                            </div>
                        </form>
                        <hr>
                        <%
                            int count = 0;
                            String host = "jdbc:derby://localhost:1527/MyGrocery";
                            String user = "nbuser";
                            String password = "nbuser";
                            Connection conn = null;
                            try {
                                Class.forName("org.apache.derby.jdbc.ClientDriver");
                                conn = DriverManager.getConnection(host, user, password);
                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }
                            Statement stat = null;
                            ResultSet res = null;
                            if (selection != null) {
                                if (selection.equals("Customer")) {
                                    stat = conn.createStatement();
                                    String data = searchInput;
                                    String query = "SELECT * FROM CUSTOMER WHERE CUSTOMER_USERNAME LIKE '%" + data + "%' OR CUSTOMER_FULLNAME LIKE '%" + data + "%' OR CUSTOMER_EMAIL LIKE '%" + data + "%'";
                                    res = stat.executeQuery(query);

                        %>
                        <!--CUSTOMER LIST SEARCH-->
                        <div class="container">
                            <h3 class="text-center">List of Customer</h3>
                            <hr>
                            <br>
                            <table class="table table-bordered ">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Full Name</th>
                                        <th>E-mail</th>
                                        <th>Username</th>
                                        <th>Gender</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <%                                    while (res.next()) {
                                            ++count;
                                    %>


                                    <tr>
                                        <td><%= count%></td>
                                        <td><%= res.getString("CUSTOMER_FULLNAME")%></td>
                                        <td><%= res.getString("CUSTOMER_EMAIL")%></td>
                                        <td><%= res.getString("CUSTOMER_USERNAME")%></td>
                                        <td><%= res.getString("CUSTOMER_GENDER")%></td>
                                        <td align="center">
                                            <a href="<%= request.getContextPath()%>/RetrieveCustomerDetails?custID=<%= res.getString("CUSTOMER_ID")%>">
                                                <button type="button" class="btn btn-primary">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
                                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                                                    </svg>
                                                </button>
                                            </a>
                                            <a href="<%= request.getContextPath()%>/CustomerDelete?custID=<%= res.getString("CUSTOMER_ID")%>">
                                                <button type="button" class="btn btn-danger">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
                                                    <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/>
                                                    </svg>
                                                </button>
                                            </a>
                                        </td>
                                    </tr>

                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                        <%
                        } else if (selection.equals("Product")) {
                            stat = conn.createStatement();
                            String data = searchInput;
                            String query = "SELECT * FROM PRODUCT WHERE PRODUCT_NAME LIKE '%" + data + "%'";
                            res = stat.executeQuery(query);

                        %>
                        <!--PRODUCT SEARCH LIST-->
                        <div class="container">
                            <h3 class="text-center">List of Product</h3>
                            <hr>
                            <br>
                            <table class="table table-bordered ">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Product Image</th>
                                        <th>Product Name</th>
                                        <th>Product Price</th>
                                        <th>Product Quantity</th>
                                        <th>Product Category</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%                                        while (res.next()) {
                                            ++count;
                                    %>
                                    <tr>
                                        <td><%= count%></td>
                                        <td><img src="<%= request.getContextPath()%>/ImageProductUpload/<%= res.getString("PRODUCT_IMAGE")%>" style="width:   50px; height: 50px"></td>
                                        <td><%= res.getString("PRODUCT_NAME")%></td>
                                        <td><%= res.getString("PRODUCT_PRICE")%></td>
                                        <td><%= res.getString("PRODUCT_QTY")%></td>
                                        <%
                                            ProductCategory productCat = ProductDA.getProductCategoryRecord(Integer.parseInt(res.getString("FK_PROD_CAT_ID")));
                                        %>
                                        <td><%= productCat.getProductCatName()%></td>
                                        <td align="center">
                                            <a href="<%= request.getContextPath()%>/RetrieveProductDetails?prodID=<%= res.getString("PRODUCT_ID")%>">
                                                <button type="button" class="btn btn-primary">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
                                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                                                    </svg>
                                                </button>
                                            </a>
                                            <a href="<%= request.getContextPath()%>/RetrieveProductUpdate?prodID=<%= res.getString("PRODUCT_ID")%>">
                                                <button type="button" class="btn btn-success"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                                    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                                    </svg>
                                                </button>
                                            </a>
                                            <a href="<%= request.getContextPath()%>/DeleteProduct?prodID=<%= res.getString("PRODUCT_ID")%>">
                                                <button type="button" class="btn btn-danger">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
                                                    <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/>
                                                    </svg>
                                                </button>
                                            </a>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                        <%
                        } else if (selection.equals("SalesRecord")) {
                            stat = conn.createStatement();
                            String data = searchInput;
                            String query = "SELECT * FROM ORDER_TABLE WHERE ORDER_UUID LIKE '%" + data + "%' OR ORDER_RECEIVE_NAME LIKE '%" + data + "%' OR ORDER_STATUS LIKE '%" + data + "%'";
                            res = stat.executeQuery(query);
                        %>
                        <div class="container">
                            <h3 class="text-center">Sales records</h3>
                            <hr>
                            <br>
                            <table class="table table-bordered ">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Order UUID</th>
                                        <th>Order Receive Name</th>
                                        <th>Payment Amount</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        while (res.next()) {
                                            String status = res.getString("ORDER_STATUS");
                                            if (status.equals("Cancel") == false && status.equals("Payment Fail") == false) {
                                    %>
                                    <tr>
                                        <td><%= ++count%></td>
                                        <td><%= res.getString("ORDER_UUID")%></td>
                                        <td><%= res.getString("ORDER_RECEIVE_NAME")%></td>

                                        
                                        <td>RM <%= res.getString("ORDER_PAYMENT_AMOUNT")%></td>

                                        <!--Set the background color to the text-->
                                        <%
                                            if (status.equals("Success")) {
                                        %>
                                        <td style="text-align: center"><span  style="background-color: greenyellow; color: white; padding: 5px; border-radius: 5px"><%= status%></span></td>
                                            <%
                                            } else if (status.equals("Cancel")) {
                                            %>
                                        <td style="text-align: center"><span  style="background-color: gainsboro; color: white; padding: 5px; border-radius: 5px"><%= status%></span></td>
                                            <%
                                            } else if (status.equals("Payment Fail")) {
                                            %>
                                        <td style="text-align: center"><span  style="background-color: red; color: white; padding: 5px; border-radius: 5px"><%= status%></span></td>
                                            <%
                                            } else if (status.equals("Packaging")) {
                                            %>
                                        <td style="text-align: center"><span  style="background-color:#FA8128 ; color: white; padding: 5px; border-radius: 5px"><%= status%></span></td>
                                            <%
                                            } else if (status.equals("Shipping")) {
                                            %>
                                        <td style="text-align: center"><span  style="background-color:#FA8128 ; color: white; padding: 5px; border-radius: 5px"><%= status%></span></td>
                                            <%
                                            } else if (status.equals("Delivered")) {
                                            %>
                                        <td style="text-align: center"><span  style="background-color: greenyellow; color: white; padding: 5px; border-radius: 5px"><%= status%></span></td>
                                            <%
                                                }
                                            %>
                                        <!--//check the status to assign the user can do what kind of action-->


                                        <td align="center">
                                            <a href="<%= request.getContextPath()%>/OrderDetialMaintain?orderID=<%= res.getString("ORDER_ID")%>">
                                                <button type="button" class="btn btn-primary">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
                                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                                                    </svg>
                                                </button>
                                            </a>
                                            <a href="<%= request.getContextPath()%>/OrderMaintainDetailsUpdate?orderID=<%= res.getString("ORDER_ID")%>">
                                                <button type="button" class="btn btn-success"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                                    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                                    </svg>
                                                </button>
                                            </a>
                                        </td>
                                    </tr>
                                    <%
                                            }
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                        <%
                        } else if (selection.equals("Order")) {
                            stat = conn.createStatement();
                            String data = searchInput;
                            String query = "SELECT * FROM ORDER_TABLE WHERE ORDER_UUID LIKE '%" + data + "%' OR ORDER_RECEIVE_NAME LIKE '%" + data + "%' OR ORDER_STATUS LIKE '%" + data + "%'";
                            res = stat.executeQuery(query);
                        %>
                        <div class="container">
                            <h3 class="text-center">Order records</h3>
                            <hr>
                            <br>
                            <table class="table table-bordered ">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Order UUID</th>
                                        <th>Order Receive Name</th>
                                        <th>Payment Amount</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        while (res.next()) {
                                            String status = res.getString("ORDER_STATUS");

                                            ++count;
                                    %>
                                    <tr>
                                        <td><%= count%></td>
                                        <td><%= res.getString("ORDER_UUID")%></td>
                                        <td><%= res.getString("ORDER_RECEIVE_NAME")%></td>

                                        
                                        <td>RM <%= res.getString("ORDER_PAYMENT_AMOUNT")%></td>

                                        <!--Set the background color to the text-->
                                        <%
                                            if (status.equals("Success")) {
                                        %>
                                        <td style="text-align: center"><span  style="background-color: greenyellow; color: white; padding: 5px; border-radius: 5px"><%= status%></span></td>
                                            <%
                                            } else if (status.equals("Cancel")) {
                                            %>
                                        <td style="text-align: center"><span  style="background-color: gainsboro; color: white; padding: 5px; border-radius: 5px"><%= status%></span></td>
                                            <%
                                            } else if (status.equals("Payment Fail")) {
                                            %>
                                        <td style="text-align: center"><span  style="background-color: red; color: white; padding: 5px; border-radius: 5px"><%= status%></span></td>
                                            <%
                                            } else if (status.equals("Packaging")) {
                                            %>
                                        <td style="text-align: center"><span  style="background-color:#FA8128 ; color: white; padding: 5px; border-radius: 5px"><%= status%></span></td>
                                            <%
                                            } else if (status.equals("Shipping")) {
                                            %>
                                        <td style="text-align: center"><span  style="background-color:#FA8128 ; color: white; padding: 5px; border-radius: 5px"><%= status%></span></td>
                                            <%
                                            } else if (status.equals("Delivered")) {
                                            %>
                                        <td style="text-align: center"><span  style="background-color: greenyellow; color: white; padding: 5px; border-radius: 5px"><%= status%></span></td>
                                            <%
                                                }
                                            %>
                                        <!--//check the status to assign the user can do what kind of action-->


                                        <td align="center">
                                            <a href="<%= request.getContextPath()%>/OrderDetialMaintain?orderID=<%= res.getString("ORDER_ID")%>">
                                                <button type="button" class="btn btn-primary">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
                                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                                                    </svg>
                                                </button>
                                            </a>
                                            <a href="<%= request.getContextPath()%>/OrderMaintainDetailsUpdate?orderID=<%= res.getString("ORDER_ID")%>">
                                                <button type="button" class="btn btn-success"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                                    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                                    </svg>
                                                </button>
                                            </a>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                            <%
                            } else if (selection.equals("Staff")) {
                                stat = conn.createStatement();
                                String data = searchInput;
                                String query = "SELECT * FROM STAFF WHERE STAFF_USERNAME LIKE '%" + data + "%' OR STAFF_EMAIL LIKE '%" + data + "%' OR STAFF_FULLNAME LIKE '%" + data + "%' OR STAFF_GENDER LIKE '%" + data + "%'";
                                res = stat.executeQuery(query);
                            %>
                            <div class="container">
                                <h3 class="text-center">Staff records</h3>
                                <hr>
                                <br>
                                <table class="table table-bordered ">
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>Staff Username</th>
                                            <th>Staff Email</th>
                                            <th>Staff Full Name</th>
                                            <th>Staff Gender</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            while (res.next()) {
                                                ++count;
                                        %>
                                        <tr>
                                            <td><%= count%></td>
                                            <td><%= res.getString("STAFF_USERNAME")%></td>
                                            <td><%= res.getString("STAFF_EMAIL")%></td>
                                            <td><%= res.getString("STAFF_FULLNAME")%></td>
                                            <td><%= res.getString("STAFF_GENDER")%></td>

                                            <td align="center">
                                                <a href="<%= request.getContextPath()%>/StaffDetails?staffID=<%= res.getString("STAFF_ID")%>">
                                                    <button type="button" class="btn btn-primary">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
                                                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                        <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                                                        </svg>
                                                    </button>
                                                </a>
                                                <a href="<%= request.getContextPath()%>/StaffDeatilUpdate?staffID=<%= res.getString("STAFF_ID")%>">
                                                    <button type="button" class="btn btn-success"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                                        </svg>
                                                    </button>
                                                </a>
                                                <a href="<%= request.getContextPath()%>/DeleteStaff?staffID=<%= res.getString("STAFF_ID")%>">
                                                    <button type="button" class="btn btn-danger">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
                                                        <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/>
                                                        </svg>
                                                    </button>
                                                </a>
                                            </td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                            <%
                                    }
                                }
                            %>
                        </div>
                    </div>
                </div>
                <%
                    session.removeAttribute("Selection");
                    session.removeAttribute("userInput");
                %>
            </div>
            <!-- Content here end -->
            <jsp:include page="../Layout/footer.html"></jsp:include>  
    </body>
</html>
