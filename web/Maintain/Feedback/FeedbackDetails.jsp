<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="BuyEntity.Feedback"%>
<%@page import="Customer.Entity.Customer"%>
<%@page import="Customer.da.CustomerDA"%>
<%@page import="ProductCategory.Entity.Product"%>
<%@page import="Product.da.ProductDA"%>
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
            Feedback feedback = (Feedback) session.getAttribute("Feedback");
        %>

        <div class="row">
            <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
                <div class="d-flex flex-column-fluid">
                    <div class="container">
                        <p class="pb-2 mt-4"><a href="/home">Home</a> / <a href="../Feedback/FeedbackList.jsp">Feedback</a> / <strong>Feedback Details</strong></p>

                        <div>
                            <div id="productDetailBox">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <label class="m-0 ml-2 mt-4" for="orderDetails">
                                            <h3>
                                                <legend>Feedback Details</legend>
                                            </h3>
                                        </label>

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="form-row">

                                                    <!-- Feedback ID -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="feedbackID" class="h7 float-right">Feedback ID</label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <input type="text" name="feedbackID" class="form-control" value="<%= feedback.getFeedbackId()%>" readonly>
                                                        </div>
                                                    </div>
                                                    <!-- Product Name -->
                                                    <div class="mt-3 col-md-4" >
                                                        <label for="productName" class="h7 float-right">Product Name</label>
                                                    </div>

                                                    <%
                                                        Product product = ProductDA.serachByID(feedback.getFkProductId().getProductId());
                                                    %>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <input type="text" name="productName" class="form-control" value="<%= product.getProductName()%>" readonly>
                                                        </div>
                                                    </div>

                                                    <!-- Customer Name -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="customerName" class="h7 float-right">Customer Name</label>
                                                    </div>

                                                    <%
                                                        Customer customer = CustomerDA.getCustomerRecordById(feedback.getFkCustomerId().getCustomerId());
                                                    %>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <input type="text" name="prodName" class="form-control" value="<%= customer.getCustomerUsername()%>" readonly>
                                                        </div>
                                                    </div>

                                                    <!--  Rating  -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="rating" class="h7 float-right">Rating</label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <input type="text" name="rating" class="form-control" value="<%= feedback.getRating()%>" readonly>
                                                        </div>
                                                    </div>

                                                    <!--  Customer Comment  -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="customerComment" class="h7 float-right">Customer Comment</label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <textarea class="form-control" placeholder="Feedback here" name="customerComment" cols="30" rows="10" readonly><%= feedback.getCommentFeedback()%></textarea>
                                                        </div>
                                                    </div>

                                                    <!-- Date -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="date" class="h7 float-right">Date</label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <%
                                                                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
                                                                String dateFormatted = simpleDateFormat.format(feedback.getFeedbackDate());
                                                            %>
                                                            <input type="text" name="date" class="form-control" value="<%= dateFormatted%>" readonly>
                                                        </div>
                                                    </div>

                                                    <!-- Staff Comment -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="staffComment" class="h7 float-right"> Staff Comment </label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <%
                                                                if (feedback.getStaffComment() == "" || feedback.getStaffComment() == null) {
                                                            %>
                                                            <textarea class="form-control" placeholder="Feedback here" name="staffComment" style="color: red" cols="30" rows="10" readonly>No Staff Comment</textarea>
                                                            <%
                                                            } else {
                                                            %>
                                                            <textarea class="form-control" placeholder="Feedback here" name="staffComment" cols="30" rows="10" readonly><%= feedback.getStaffComment()%></textarea>
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
                </div>
            </div>
            <!-- Content here end -->
            <jsp:include page="../Layout/footer.html"></jsp:include>  
    </body>
</html>
