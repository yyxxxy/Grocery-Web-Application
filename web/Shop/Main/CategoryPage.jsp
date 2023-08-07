<%-- 
    Document   : CategoryPage
    Created on : Mar 22, 2022, 5:26:25 PM
    Author     : user
--%>

<%@page import="Sorting.SortByNameProduct"%>
<%@page import="ProductCategory.da.ProductCategoryDA"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../Layout/header.jsp"></jsp:include>  
        </head>
        <body>
        <jsp:include page="../Layout/navbar.jsp"></jsp:include>
        <%@page import="ProductCategory.Entity.ProductCategory" %>
        <%
            ProductCategory prodCat = (ProductCategory) session.getAttribute("prodCat");
        %>
        <%@page import="Product.da.ProductDA,ProductCategory.Entity.Product,java.util.*"%>  
        <%
            List<Product> list = ProductDA.getAllRecords();
            Collections.sort(list, new SortByNameProduct());
            int i = 0;
        %> 
        <!-- product section starts  -->

        <section class="product" id="product">

            <h1 class="heading"><span><%= prodCat.getProductCatName()%></span></h1>

            <div class="box-container">
                <%
                    for (i = 0; i < list.size(); i++) {
                        if (list.get(i).getFkProdCatId().getProductCatName().equals(prodCat.getProductCatName())) {
                %>
                <div class="box">
                    <form action="<%= request.getContextPath()%>/OrderServlet" method="post">
                        <div class="icons">
                            <a href="<%= request.getContextPath()%>/ProductDetails?prodID=<%= list.get(i).getProductId()%>" class="fas fa-eye"></a>
                        </div>
                        <img src="<%= request.getContextPath()%>/ImageProductUpload/<%= list.get(i).getProductImage()%>" width="250" height="250">
                        <h3><%= list.get(i).getProductName()%></h3>
                        <div class="price">RM&nbsp;<%= list.get(i).getProductPrice()%> </div>
                        <div class="quantity">
                            <span>quantity : </span>
                            <input type="number" name="productQTY" min="1" max="<%= list.get(i).getProductQty()%>" value="1">
                        </div>
                        <span style="color: #B8B8B8; font-size: 15px">Product Left : <%= list.get(i).getProductQty()%> left</span>
                        <!-- Get the value >.< -->
                        <input type="text" name="prodID" value="<%= list.get(i).getProductId()%>" hidden>
                        <button class="btn" type="submit" style="width: 100%">Order Now</button>
                    </form>
                </div>
                <%
                        }
                    }
                %>


            </div>

        </section>

        <!-- product section ends -->
        <jsp:include page="../Layout/footer.jsp"></jsp:include>  
    </body>
</html>
