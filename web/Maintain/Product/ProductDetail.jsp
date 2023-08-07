<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../Layout/header.html"></jsp:include> 
        </head>
        <body>
        <jsp:include page="../Layout/navbar.jsp"></jsp:include>  
            <!-- Content here start -->
        <%@page import="ProductCategory.Entity.Product" %>
        <%
            Product prod = (Product) session.getAttribute("prod");
        %>

        <div class="row">
            <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
                <div class="d-flex flex-column-fluid">
                    <div class="container">
                        <p class="pb-2 mt-4"><a href="/home">Home</a> / <a href="../Product/ProductList.jsp">Product</a> / <strong>Product Details</strong></p>

                        <div>
                            <div id="productDetailBox">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <label class="m-0 ml-2 mt-4" for="prodDetail">
                                            <h3>
                                                <legend>Product Details</legend>
                                            </h3>
                                        </label>

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="form-row">
                                                    <!-- Product name -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="prodName" class="h7 float-right">Product Name </label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <input type="text" name="prodName" class="form-control" value="<%= prod.getProductName()%>" readonly>
                                                        </div>
                                                    </div>
                                                    <!-- Product ID -->
                                                    <div class="mt-3 col-md-4" >
                                                        <label for="prodID" class="h7 float-right">Product ID </label>
                                                    </div>

                                                    <div class="col-md-6" >
                                                        <div class="form-group">
                                                            <input type="text" name="prodID" class="form-control" value="<%= prod.getProductId()%>" readonly>
                                                        </div>
                                                    </div>

                                                    <!-- Product Cat -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="prodcatid" class="h7 float-right">Product Category</label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <input type="text" name="prodID" class="form-control" value="<%= prod.getFkProdCatId().getProductCatName()%>" readonly>
                                                        </div>
                                                    </div>

                                                    <!-- Product price -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="prodPrice" class="h7 float-right"> Product Price </label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <input type="numeric" id="prodPrice" name="prodPrice" class="form-control"  value="RM <%= prod.getProductPrice()%>" readonly>
                                                        </div>
                                                    </div>

                                                    <!-- Product Quantity -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="prodQuantity" class="h7 float-right">Quantity</label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <input type="number" name="prodQuantity" class="form-control" value="<%= prod.getProductQty()%>" readonly>
                                                        </div>
                                                    </div>

                                                    <!-- Product DESC -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="prodDesc" class="h7 float-right">Product Description</label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <textarea class="form-control" readonly> <%= prod.getProductDesc()%></textarea>
                                                        </div>
                                                    </div>

                                                    <!-- Product Image -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="prodImage" class="h7 float-right">Image</label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <img src="<%= request.getContextPath()%>/ImageProductUpload/<%= prod.getProductImage()%>" style="width:   300px; height: 300px">
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
