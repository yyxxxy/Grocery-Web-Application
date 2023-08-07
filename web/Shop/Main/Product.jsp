<%-- 
    Document   : CategoryPage
    Created on : Mar 22, 2022, 5:26:25 PM
    Author     : user
--%>

<%@page import="Sorting.SortByNameProduct"%>
<%@page import="Sorting.SortByNameProductCat"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="ProductCategory.da.ProductCategoryDA"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyGrocery | Products </title>
        <jsp:include page="../Layout/header.jsp"></jsp:include>  
        </head>
        <body>
        <jsp:include page="../Layout/navbar.jsp"></jsp:include>
        <%@page import="ProductCategory.Entity.ProductCategory" %>
        <%@page import="Product.da.ProductDA,ProductCategory.Entity.Product,java.util.*"%>  
        <%
            List<Product> list = ProductDA.getAllRecords();
            List<ProductCategory> prodCatList = ProductCategoryDA.getAllRecords();
            Collections.sort(prodCatList, new SortByNameProductCat());
            Collections.sort(list, new SortByNameProduct());

            int i = 0;
            int count = list.size();
        %> 
        <!-- product section starts  -->

        <section class="product" id="product">
            <%
                for (i = 0; i < prodCatList.size(); i++) {

            %>
            <h1 class="heading"><span><%= prodCatList.get(i).getProductCatName()%></span></h1>
            <div class="box-container">
                <%
                    for (int j = 0; j < list.size(); j++) {
                        if (prodCatList.get(i).getProductCatName().equals(list.get(j).getFkProdCatId().getProductCatName())) {
                %>
                <div class="box">
                    <div class="icons">
                        <a href="<%= request.getContextPath()%>/ProductDetails?prodID=<%= list.get(j).getProductId()%>" class="fas fa-eye"></a>
                    </div>
                     <form action="<%= request.getContextPath()%>/OrderServlet" method="post">
                    <img src="<%= request.getContextPath()%>/ImageProductUpload/<%= list.get(j).getProductImage()%>" alt="">
                    <h3><%= list.get(j).getProductName()%></h3>
                    <div class="price">RM&nbsp;<%= list.get(j).getProductPrice()%> </div>
                    <%
                        if (list.get(j).getProductQty() == 0) {
                    %>
                    <div class="quantity product">
                        <span>quantity : </span>    
                        <span style="color: red; font-size: 15px"> Out Of Stock</span>
                    </div>
                    <%
                    } else {
                    %>
                    <div class="quantity product">
                        <span>quantity : </span>
                        <input type="number" name="productQTY" min="1" max="<%= list.get(j).getProductQty()%>" value="1">
                    </div>
                    <br>
                    <span style="color: #B8B8B8; font-size: 15px">Product Left : <%= list.get(j).getProductQty()%> left</span>
                    <!-- Get the value >.< -->
                    <input type="text" name="prodID" value="<%= list.get(j).getProductId()%>" hidden>
                    <button class="btn" type="submit" style="width: 100%">Order Now</button>
                    <%
                        }
                    %>
                     </form>
                </div>
                <%
                        }
                    }
                %>
            </div>
            <%
                }
            %>
        </section>

        <!-- product section ends -->
        <jsp:include page="../Layout/footer.jsp"></jsp:include>  
    </body>
</html>
