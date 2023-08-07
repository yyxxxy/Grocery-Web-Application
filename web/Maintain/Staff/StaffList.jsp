<%@page import="Staff.da.StaffDA"%>
<%@page import="Staff.entity.Staff"%>
<%@page import="java.util.List"%>
<%@page import="Sorting.SortByNameProduct"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        .alert {
            padding: 20px;
            background-color: #f44336;
            color: white;
            opacity: 1;
            transition: opacity 0.6s;
            margin-bottom: 15px;
        }

        .alert.success {background-color: #04AA6D;}
        .alert.info {background-color: #2196F3;}
        .alert.warning {background-color: #ff9800;}

        .closebtn {
            margin-left: 15px;
            color: white;
            font-weight: bold;
            float: right;
            font-size: 22px;
            line-height: 20px;
            cursor: pointer;
            transition: 0.3s;
        }

        .closebtn:hover {
            color: black;
        }
    </style>
    <head>
        <jsp:include page="../Layout/header.html"></jsp:include> 
        </head>
        <body>
        <jsp:include page="../Layout/navbar.jsp"></jsp:include>  
            <!-- Content here start -->

        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
        <%
            List<Staff> list = StaffDA.getAllRecords();
            request.setAttribute("list", list);
            int i = 0;
            String successMsg = (String) session.getAttribute("successMsg");
        %>  


        <div class="row">
            <%
                if (successMsg != null) {
                    out.print(successMsg);
                }
            %>

            <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
                <div class="d-flex flex-column-fluid">
                    <div class="container">
                        <p class="pb-2 mt-4"><a href="/home">Home</a> / <a href="../Staff/StaffList.jsp">Staff</a> / <strong>Staff List</strong></p>

                        <div class="container">
                            <h3 class="text-center">List of Staff</h3>
                            <hr>
                            <div class="container text-left">

                                <a href="../Staff/RegisterStaff.jsp" ><button class="btn btn-primary">Register Staff<i class="bi bi-check"></i></button></a>
                            </div>
                            <br>
                            <table class="table table-bordered ">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Staff Name</th>
                                        <th>Staff Email</th>
                                        <th>Staff Full Name</th>
                                        <th>Staff Gender</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!--   for (Todo todo: todos) {  -->
                                    <c:forEach items="${list}" var="staff">

                                        <tr>
                                            <td><c:out value="<%= ++i%>" /></td>
                                            <td><c:out value="${staff.getStaffUsername()}" /></td>
                                            <td><c:out value="${staff.getStaffEmail()}" /></td>
                                            <td><c:out value="${staff.getStaffFullname()}" /></td>
                                            <td><c:out value="${staff.getStaffGender()}" /></td>
                                            <td align="center">
                                                <a href="<%= request.getContextPath()%>/StaffDetails?staffID=<c:out value='${staff.getStaffId()}' />">
                                                    <button type="button" class="btn btn-primary">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
                                                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                        <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                                                        </svg>
                                                    </button>
                                                </a>
                                                <a href="<%= request.getContextPath()%>/StaffDeatilUpdate?staffID=<c:out value='${staff.getStaffId()}' />">
                                                    <button type="button" class="btn btn-success"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                                        </svg>
                                                    </button>
                                                </a>
                                                <a href="<%= request.getContextPath()%>/DeleteStaff?staffID=<c:out value='${staff.getStaffId()}' />" onclick="return confirm('Are you sure you want to delete this item?');">
                                                    <button type="button" class="btn btn-danger">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
                                                        <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/>
                                                        </svg>
                                                    </button>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <!-- } -->
                                </tbody>

                            </table>
                        </div>

                    </div>
                </div>
            </div>

            <script>
                var close = document.getElementsByClassName("closebtn");
                var i;
                for (i = 0; i < close.length; i++) {
                    close[i].onclick = function () {
                        var div = this.parentElement;
                        div.style.opacity = "0";
                        setTimeout(function () {
                            div.style.display = "none";
                        }, 600);
                    }
                }
            </script>
            <%
                session.removeAttribute("successMsg");
            %>

            <!-- Content here end -->
            <jsp:include page="../Layout/footer.html"></jsp:include>  
    </body>
</html>
