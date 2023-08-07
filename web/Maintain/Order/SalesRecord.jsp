<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Customer.Entity.Customer"%>
<%@page import="BuyDA.OrderListDA"%>
<%@page import="BuyEntity.OrderTable"%>
<%@page import="Sorting.SortByDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        .alert {
            padding: 20px;
            background-color: #f44336;
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
    <head>
        <jsp:include page="../Layout/header.html"></jsp:include> 
        </head>
        <body>
        <jsp:include page="../Layout/navbar.jsp"></jsp:include>  
            <!-- Content here start -->

        <%@page import="Customer.da.CustomerDA,java.util.*"%>
        <%
            List<OrderTable> list = OrderListDA.getAllRecords();
            Collections.sort(list, new SortByDate());
            int count = 0;
            String successMsg = (String) session.getAttribute("successMsg");
        %>  


        <div class="row">
            <%
                if (successMsg != null) {
                    out.print(successMsg);
                }
            %>

            <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
                <div class="d-flex flex-column-fluid">
                    <div class="container">
                        <p class="pb-2 mt-4"><a href="/home">Home</a> / <a href="../Order/SalesRecord.jsp">Sales</a> / <strong>Sales Records</strong></p>

                        <div class="container">
                            <h3 class="text-center">Sales records</h3>
                            <hr>
                            <br>
                            <table class="table table-bordered ">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Order UUID</th>
                                        <th>User Name</th>
                                        <th>Payment Amount</th>
                                        <th>Date</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!--   for (Todo todo: todos) {  -->
                                    <%
                                        for (int i = 0; i < list.size(); i++) {
                                            if (list.get(i).getOrderStatus().equals("Cancel") == false && list.get(i).getOrderStatus().equals("Payment Fail") == false) {
                                    %>

                                    <tr>
                                        <td><%= ++count%></td>
                                        <td><%= list.get(i).getOrderUuid()%></td>

                                        <%
                                            Customer customer = CustomerDA.getCustomerRecordById(list.get(i).getCkCustomerId().getCustomerId());
                                        %>

                                        <td><%=  customer.getCustomerUsername()%></td>
                                        <td>RM <%=  list.get(i).getOrderPaymentAmount()%></td>

                                        <%
                                            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                                            String date = sdf.format(list.get(i).getOrderDate());
                                        %>
                                        <td><%= date%></td>

                                        <!--Set the background color to the text-->
                                        <%
                                            if (list.get(i).getOrderStatus().equals("Success")) {
                                        %>
                                        <td style="text-align: center"><span  style="background-color: greenyellow; color: white; padding: 5px; border-radius: 5px"><%=  list.get(i).getOrderStatus()%></span></td>
                                            <%
                                            } else if (list.get(i).getOrderStatus().equals("Cancel")) {
                                            %>
                                        <td style="text-align: center"><span  style="background-color: gainsboro; color: white; padding: 5px; border-radius: 5px"><%=  list.get(i).getOrderStatus()%></span></td>
                                            <%
                                            } else if (list.get(i).getOrderStatus().equals("Payment Fail")) {
                                            %>
                                        <td style="text-align: center"><span  style="background-color: red; color: white; padding: 5px; border-radius: 5px"><%=  list.get(i).getOrderStatus()%></span></td>
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
                                        <!--//check the status to assign the user can do what kind of action-->


                                        <td align="center">
                                            <a href="<%= request.getContextPath()%>/OrderDetialMaintain?orderID=<%=  list.get(i).getOrderId()%>">
                                                <button type="button" class="btn btn-primary">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
                                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                                                    </svg>
                                                </button>
                                            </a>
                                            <a href="<%= request.getContextPath()%>/OrderMaintainDetailsUpdate?orderID=<%= list.get(i).getOrderId()%>">
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
                                    <!-- } -->
                                </tbody>

                            </table>
                        </div>

                    </div>
                </div>
            </div>
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
            <!-- Content here end -->
            <jsp:include page="../Layout/footer.html"></jsp:include>  
    </body>
</html>
