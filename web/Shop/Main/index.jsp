<%-- 
    Document   : index
    Created on : Mar 21, 2022, 1:03:32 PM
    Author     : user
--%>

<%@page import="BuyEntity.Cart"%>
<%@page import="Sorting.SortByNameProductCat"%>
<%@page import="ProductCategory.Entity.ProductCategory"%>
<%@page import="ProductCategory.da.ProductCategoryDA"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <jsp:include page="../Layout/header.jsp"></jsp:include>  
        <body>
        <%@page import="Product.da.ProductDA,ProductCategory.Entity.Product,java.util.*"%> 
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
        <%
            List<Product> list = ProductDA.getAllRecords();
            List<ProductCategory> prodCatList = ProductCategoryDA.getAllRecords();
            Collections.sort(prodCatList, new SortByNameProductCat());
            int i = 0;
            int count = list.size();
            int qty;
            String showMsg = (String) session.getAttribute("showMessage");
        %> 
        <jsp:include page="../Layout/navbar.jsp"></jsp:include>

            <!--show message-->
        <%        
            if (showMsg != null) {
        %>
        <script>
            <%= showMsg%>
        </script>
        <% 
            }
        %>


        <!-- category section starts  -->

        <section class="category" id="category">

            <h1 class="heading">shop by <span>category</span></h1>

            <div class="box-container">
                <%        
                    for (i = 0; i < prodCatList.size(); i++) {
                %>
                <div class="box">
                    <h3><%= prodCatList.get(i).getProductCatName()%></h3>
                    <img src="<%= request.getContextPath()%>/ImageProductCategory/<%= prodCatList.get(i).getProductCatImage()%>" alt="" width="150" height="150">
                    <a href="<%= request.getContextPath()%>/CategorySelected?prodcatid=<c:out value="<%= prodCatList.get(i).getProductCatId()%>" />"class="btn">shop now</a>
                </div>
                <%
                    }
                %>

            </div>

        </section>

        <!-- category section ends -->

        <!-- product section starts  -->

        <section class="product" id="product">

            <h1 class="heading">latest <span>products</span></h1>

            <div class="box-container">
                <%    
                    for (i = 0; i < list.size(); i++) {
                        count--;
                %>
                <div class="box">
                    <div class="icons">
                        <a href="<%= request.getContextPath()%>/ProductDetails?prodID=<%= list.get(count).getProductId()%>" class="fas fa-eye"></a>
                    </div>
                    <form action="<%= request.getContextPath()%>/OrderServlet" method="post">
                        <img src="<%= request.getContextPath()%>/ImageProductUpload/<%= list.get(count).getProductImage()%>" width="250" height="250">
                        <h3><%= list.get(count).getProductName()%></h3>
                        <div class="price">RM&nbsp;<%= list.get(count).getProductPrice()%> </div>
                        <%
                            if (list.get(count).getProductQty() == 0) {
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
                            <input type="number" name="productQTY" min="1" max="<%= list.get(count).getProductQty()%>" value="1">
                        </div>
                        <span style="color: #B8B8B8; font-size: 15px">Product Left : <%= list.get(count).getProductQty()%> left</span>
                        <!-- Get the value >.< -->
                        <input type="text" name="prodID" value="<%= list.get(count).getProductId()%>" hidden>
                        <button class="btn" type="submit" style="width: 100%">Order Now</button>
                        <%
                            }
                        %>
                    </form>
                </div>
                <%
                        if (i >= 7) {
                            i = list.size();
                        }
                    }
                    session.removeAttribute("showMessage");
                %>


            </div>

        </section>

        <!-- product section ends -->
        <jsp:include page="../Layout/footer.jsp"></jsp:include>  
    </body>
</html>