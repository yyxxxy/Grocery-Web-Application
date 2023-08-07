<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../Layout/header.html"></jsp:include>  
        <body>
        <jsp:include page="../Layout/navbar.jsp"></jsp:include>  
            <!-- Content here start -->
        <%@page import="ProductCategory.da.ProductCategoryDA,ProductCategory.Entity.ProductCategory,java.util.*"%>  
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
        <%
            List<ProductCategory> list = ProductCategoryDA.getAllRecords();
            request.setAttribute("list", list);
        %> 


        <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
            <div class="d-flex flex-column-fluid">
                <div class="container">
                    <p class="pb-2 mt-4"><a href="/home">Home</a> / <a href="../Product/ProductList.jsp">Product</a> / <strong>Create Product</strong></p>


                    <form id="create-product" action="<%= request.getContextPath()%>/CreateProduct" method="POST" enctype="multipart/form-data">
                        <button class="btn btn-primary">Create Product<i class="bi bi-check"></i></button>

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
                                                        <label for="prodName" class="h7 float-right">Product name <span class="text-danger">*</span> </label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <input type="text" name="prodName" class="form-control" value="">
                                                        </div>
                                                    </div>

                                                    <!-- Product Cat -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="prodcatid" class="h7 float-right">Product Category</label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <select class="form-select" name="prodcatid">
                                                                <option value="" disabled selected>Select a category</option>
                                                                <c:forEach items="${list}" var="prodCat">
                                                                    <option value="<c:out value="${prodCat.getProductCatId()}" />"> <c:out value="${prodCat.getProductCatName()}" /> </option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <!-- Product price -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="prodPrice" class="h7 float-right"> Product Price </label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <input type="numeric" id="prodPrice" name="prodPrice" class="form-control">
                                                        </div>
                                                    </div>

                                                    <!-- Product Quantity -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="prodQuantity" class="h7 float-right">Quantity</label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <input type="number" name="prodQuantity" class="form-control" value="">
                                                        </div>
                                                    </div>

                                                    <!-- Product DESC -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="prodDesc" class="h7 float-right">Product Description</label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <input type="text" name="prodDesc" class="form-control" value="">
                                                        </div>
                                                    </div>

                                                    <!-- Product Image -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="prodImage" class="h7 float-right" >Product Image</label>                                                       
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <input type="file" name="prodImage" class="form-control" value="" placeholder="Select a image" >
                                                            <span class="text-danger">*<p>Product Image cannot be modified make sure your image selected is correct.</p></span>
                                                        </div>
                                                    </div>


                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- cONTENT HERE end -->

    </body>
    <jsp:include page="../Layout/footer.html"></jsp:include>  

</html>
