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
        <%@page import="ProductCategory.Entity.Product" %>
        <%
            Product prod = (Product) session.getAttribute("prod");
        %>
        <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
            <div class="d-flex flex-column-fluid">
                <div class="container">
                    <p class="pb-2 mt-4"><a href="/home">Home</a> / <a href="../Product/ProductList.jsp">Product</a> / <strong>Update Product</strong></p>


                    <form id="create-product" action="<%= request.getContextPath()%>/UpdateProduct" method="POST" enctype="multipart/form-data">
                        <button class="btn btn-primary">Update Product<i class="bi bi-check"></i></button>

                        <div>
                            <div id="productDetailBox">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <label class="m-0 ml-2 mt-4" for="prodDetail">
                                            <h3>
                                                <legend>Update Product Details</legend>
                                            </h3>
                                        </label>

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="form-row">
                                                    
                                                    <!-- Product id -->
                                                    <div class="mt-3 col-md-4" hidden>
                                                        <label for="prodID" class="h7 float-right">Product id <span class="text-danger">*</span> </label>
                                                    </div>

                                                    <div class="col-md-6" hidden>
                                                        <div class="form-group">
                                                            <input type="text" name="prodID" class="form-control" value="<%= prod.getProductId()%>">
                                                        </div>
                                                    </div>
                                                    
                                                    <!-- Product name -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="prodName" class="h7 float-right">Product name <span class="text-danger">*</span> </label>
                                                    </div>

                                                    <div class="col-md-6" >
                                                        <div class="form-group">
                                                            <input type="text" name="prodName" class="form-control" value="<%= prod.getProductName()%>">
                                                        </div>
                                                    </div>
                                                    
                                                    <!-- Product Cat -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="prodcatid" class="h7 float-right">Product Category</label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <select class="form-select" name="prodcatid">
                                                                <option value="" disabled >Select a category</option>
                                                                <c:forEach items="${list}" var="prodCat">
                                                                    <c:if test="${prodCat.getProductCatId() == prod.getFkProdCatId().getProductCatId()}">
                                                                        <option selected value="<c:out value="${prodCat.getProductCatId()}" />"> <c:out value="${prodCat.getProductCatName()}" /> </option>
                                                                        </c:if>
                                                                        <c:if test="${prodCat.getProductCatId() != prod.getFkProdCatId().getProductCatId()}">
                                                                        <option value="<c:out value="${prodCat.getProductCatId()}" />"> <c:out value="${prodCat.getProductCatName()}" /> </option>
                                                                    </c:if>
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
                                                            <input type="numeric" id="prodPrice" name="prodPrice" class="form-control" value="<%= prod.getProductPrice()%>">
                                                        </div>
                                                    </div>

                                                    <!-- Product Quantity -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="prodQuantity" class="h7 float-right">Quantity</label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <input type="number" name="prodQuantity" class="form-control" value="<%= prod.getProductQty()%>">
                                                        </div>
                                                    </div>

                                                    <!-- Product DESC -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="prodDesc" class="h7 float-right">Product Description</label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <input type="text" name="prodDesc" class="form-control" value="<%= prod.getProductDesc()%>">
                                                        </div>
                                                    </div>

                                                    <!-- Product Image -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="prodImage" class="h7 float-right">Product Image</label>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <img src="<%= request.getContextPath()%>/ImageProductUpload/<%= prod.getProductImage()%>" style="width:   50px; height: 50px">
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
        <jsp:include page="../Layout/footer.html"></jsp:include>  
    </body>
</html>
