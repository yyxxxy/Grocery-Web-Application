<%-- 
    Document   : navbar
    Created on : Mar 22, 2022, 1:34:30 PM
    Author     : user
--%>

<%@page import="Customer.Entity.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- header section starts  -->
    <%
        Customer cust = (Customer) session.getAttribute("CustomerDetails");
    %>
    <header>

        <div class="header-1">

            <a href="../Main/index.jsp" class="logo"><i class="fas fa-shopping-basket"></i>My<span style="color: var(--green)">Grocery</span></a>

            <form action="<%= request.getContextPath()%>/SearchProduct" class="search-box-container" method="post">
                <input type="search" id="search-box" placeholder="search here..." name="searchName">
                <button for="search-box" class="fas fa-search"></button>
            </form>

            <p style="font-size: 20px">Welcome, <%= cust.getCustomerUsername()%></p>

        </div>

        <div class="header-2">
            <div id="menu-bar" class="fas fa-bars"></div>
            <nav class="navbar">
                <a href="../Main/index.jsp">home</a>
                <a href="../Main/Product.jsp">product</a>
            </nav>

            <div class="icons">
                <a href="../Main/customerProfile.jsp" class="fas fa-user"></a>
                <a href="../Main/orderHistory.jsp" class="fas fa-shopping-cart"></a>
                <a href="<%= request.getContextPath()%>/LogOutCustomer" class="fas fa-sign-out-alt"></a>
            </div>

        </div>

    </header>

    <!-- header section ends -->
</html>
