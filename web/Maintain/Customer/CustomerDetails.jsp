<%@page import="Customer.Entity.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../Layout/header.html"></jsp:include> 
        </head>
        <body>
        <jsp:include page="../Layout/navbar.jsp"></jsp:include>  
        <%
            Customer customer = (Customer) session.getAttribute("customer");
        %>
        <!-- Content here start -->

        <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
            <div class="d-flex flex-column-fluid">
                <div class="container">
                    <p class="pb-2 mt-4"><a href="/home">Home</a> / <a href="../Customer/CustomerList.jsp">Staff</a> / <strong>Staff Details</strong></p>

                    <div>
                        <div id="productDetailBox">
                            <div class="row">
                                <div class="col-lg-12">
                                    <label class="m-0 ml-2 mt-4" for="admin">
                                        <h3>
                                            <legend>Customer Details</legend>
                                        </h3>
                                    </label>

                                    <div class="card">
                                        <div class="card-body">
                                            <div class="form-row">
                                                <!-- User name -->
                                                <div class="mt-3 col-md-4">
                                                    <label for="custUserName" class="h7 float-right">Customer username</label>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input type="text" name="custUserNamee" class="form-control" value="<%= customer.getCustomerUsername()%>" readonly>
                                                    </div>
                                                </div>

                                                <!-- User Email -->
                                                <div class="mt-3 col-md-4">
                                                    <label for="custEmail" class="h7 float-right">Customer E-mail</label>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input type="email" name="custEmail" class="form-control" value="<%= customer.getCustomerEmail()%>" readonly>
                                                    </div>
                                                </div>

                                                <!-- User Full name -->
                                                <div class="mt-3 col-md-4">
                                                    <label for="userFullName" class="h7 float-right">Customer Full Name</label>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input type="text" name="userFullName" class="form-control" value="<%= customer.getCustomerFullname()%>" readonly>
                                                    </div>
                                                </div>

                                                <!-- User Gender -->
                                                <div class="mt-3 col-md-4">
                                                    <label for="userGender" class="h7 float-right">Customer Gender</label>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input type="text" name="userICNo" class="form-control" value="<%= customer.getCustomerGender()%>" readonly>
                                                    </div>
                                                </div>


                                                <!-- User IC No -->
                                                <div class="mt-3 col-md-4">
                                                    <label for="userICNo" class="h7 float-right">Customer IC No.</label>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input type="text" name="userICNo" class="form-control" value="<%= customer.getCustomerIcNo()%>" readonly>
                                                    </div>
                                                </div>

                                                <!-- User PH No -->
                                                <div class="mt-3 col-md-4">
                                                    <label for="userPHNo" class="h7 float-right">Customer Phone Number</span></label>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input type="text" name="userPHNo" class="form-control" value="<%= customer.getCustomerPhNo()%>" readonly>
                                                    </div>
                                                </div>

                                                <!-- User Address-->
                                                <div class="mt-3 col-md-4">
                                                    <label for="userAddress" class="h7 float-right">Customer Address</label>
                                                </div>
                                                <%
                                                    if (customer.getCustomerAddress() != null) {
                                                %>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input type="text" name="userAddress" class="form-control" value="<%= customer.getCustomerAddress()%>" readonly>
                                                    </div>
                                                </div>
                                                <%
                                                    }
                                                %>

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
