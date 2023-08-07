<%@page import="Customer.Entity.Customer"%>
<%@page import="Sorting.SortByNameUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../Layout/header.html"></jsp:include> 
        </head>
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
        <body>
        <jsp:include page="../Layout/navbar.jsp"></jsp:include>  
            <!-- Content here start -->

        <%@page import="Customer.da.CustomerDA,java.util.*"%>  
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
        <%
            List<Customer> list = CustomerDA.getAllRecords();
            Collections.sort(list, new SortByNameUser());
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
                        <p class="pb-2 mt-4"><a href="/home">Home</a> / <a href="../Customer/CustomerList.jsp">Customer</a> / <strong>Customer List</strong></p>

                        <div class="container">
                            <h3 class="text-center">List of Customer</h3>
                            <hr>
                            <br>
                            <table class="table table-bordered ">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Full Name</th>
                                        <th>E-mail</th>
                                        <th>Username</th>
                                        <th>Gender</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!--   for (Todo todo: todos) {  -->
                                    <c:forEach items="${list}" var="Customer">

                                        <tr>
                                            <td><c:out value="<%= ++i%>" /></td>
                                            <td><c:out value="${Customer.getCustomerFullname()}" /></td>
                                            <td><c:out value="${Customer.getCustomerEmail()}" /></td>
                                            <td><c:out value="${Customer.getCustomerUsername()}" /></td>
                                            <td><c:out value="${Customer.getCustomerGender()}" /></td>
                                            <td align="center">
                                                <a href="<%= request.getContextPath()%>/RetrieveCustomerDetails?custID=<c:out value='${Customer.getCustomerId()}' />">
                                                    <button type="button" class="btn btn-primary">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
                                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                                                    </svg>
                                                    </button>
                                                </a>
                                                <a href="<%= request.getContextPath()%>/CustomerDelete?custID=<c:out value='${Customer.getCustomerId()}' />">
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
