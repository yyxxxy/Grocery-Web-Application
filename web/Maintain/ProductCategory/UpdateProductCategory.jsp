<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../Layout/header.html"></jsp:include> 
        </head>
        <body>
        <jsp:include page="../Layout/navbar.jsp"></jsp:include>  
            <!-- Content here start -->
        <%@page import="ProductCategory.Entity.ProductCategory" %>
        <%
            ProductCategory prodCat = (ProductCategory) session.getAttribute("prodCat");
            session.removeAttribute("prod");
        %>
        <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
            <div class="d-flex flex-column-fluid">
                <div class="container">
                    <p class="pb-2 mt-4"><a href="/home">Home</a> / <a href="../ProductCategory/ProductCategoryList.jsp">Product Category</a> / <strong>Update Product Category</strong></p>


                    <form id="create-product" action="<%= request.getContextPath()%>/UpdateProductCategory" method="POST">
                        <button type="submit" class="btn btn-primary">Update Product Category<i class="bi bi-check"></i></button>

                        <div>
                            <div id="productDetailBox">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <label class="m-0 ml-2 mt-4" for="prodDetail">
                                            <h3>
                                                <legend>Product Category Details</legend>
                                            </h3>
                                        </label>

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="form-row">
                                                    <!-- Product Category name -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="productcatname" class="h7 float-right">Product Category Name <span class="text-danger">*</span> </label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <input type="text" name="productcatname" class="form-control" value="<%= prodCat.getProductCatName()%>">
                                                        </div>
                                                    </div>
                                                        
                                                     <!-- Product  Category Image -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="productcatimage" class="h7 float-right">Image</label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <img src="<%= request.getContextPath()%>/ImageProductCategory/<%= prodCat.getProductCatImage()%>" style="width:   300px; height: 300px">
                                                        </div>
                                                    </div>

                                                    <!-- Product Category id -->
                                                    <div class="mt-3 col-md-4" hidden>
                                                        <label for="productcatid" class="h7 float-right">Product ID <span class="text-danger">*</span> </label>
                                                    </div>

                                                    <div class="col-md-6" hidden>
                                                        <div class="form-group">
                                                            <input type="text" name="productcatid" class="form-control" value="<%= prodCat.getProductCatId()%>">
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

        <!-- Content here end -->
        <jsp:include page="../Layout/footer.html"></jsp:include>  
    </body>
</html>
