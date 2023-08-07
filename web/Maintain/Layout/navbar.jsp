<%-- 
    Document   : navbar
    Created on : Mar 20, 2022, 11:05:30 PM
    Author     : user
--%>

<%@page import="Staff.entity.Staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Staff staff = (Staff) session.getAttribute("UserRole");
%>

<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/Other/html.html to edit this template
-->
<html>
    <body oncontextmenu='return false' class='snippet-body'>
    <body id="body-pd">
        <header class="header" id="header">
            <div class="header_toggle"> <i class='bx bx-menu' id="header-toggle"></i> </div>
            <div class="header_userName"><%= staff.getStaffUsername()%></div>
        </header>
        <div class="l-navbar" id="nav-bar">
            <nav class="nav">
                <div> 
                    <a href="../Main/index.jsp" class="nav_logo"> <i class='bx bx-layer nav_logo-icon'></i><span class="nav_logo-name">Maintain System</span> </a>
                    <div class="nav_list"> 
                        <a href="../Search/SearchCriteria.jsp" class="nav_link"> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                            </svg> <span class="nav_name">Search Criteria</span> </a>
                        <a href="../Customer/CustomerList.jsp" class="nav_link"> <i class='bx bx-user nav_icon'></i> <span class="nav_name">Customer</span> </a>
                        <a href="../Staff/StaffList.jsp" class="nav_link"> <i class='bx bx-user nav_icon'></i> <span class="nav_name">Staff</span> </a>
                        <a href="../Product/ProductList.jsp" class="nav_link"> <i class='bx bx-bar-chart-alt-2 nav_icon'></i> <span class="nav_name">Product</span> </a>
                        <a href="../ProductCategory/ProductCategoryList.jsp" class="nav_link"> <i class='bx bx-bar-chart-alt-2 nav_icon'></i> <span class="nav_name">Product Category</span> </a>
                        <a href="../Order/SalesRecord.jsp" class="nav_link"> <i class='bx bx-bar-chart-alt-2 nav_icon'></i> <span class="nav_name">Sales Record</span> </a>
                        <a href="../Feedback/FeedbackList.jsp" class="nav_link"> <i class='bx bx-bar-chart-alt-2 nav_icon'></i> <span class="nav_name">Feedback List</span> </a>
                        <a href="../Report/Report.jsp" class="nav_link"> <i class='bx bx-bar-chart-alt-2 nav_icon'></i> <span class="nav_name">Report</span> </a>
                    </div>
                </div> <a href="<%= request.getContextPath()%>/LogOutServlet" class="nav_link"> <i class='bx bx-log-out nav_icon'></i> <span class="nav_name">SignOut</span> </a>
            </nav>
        </div>
</html>
