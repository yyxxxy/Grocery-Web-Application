<%@page import="Staff.entity.Staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../Layout/header.html"></jsp:include>  
        <body>
        <jsp:include page="../Layout/navbar.jsp"></jsp:include>  
            <!-- Content here start --> 
        <%
            Staff staff = (Staff) session.getAttribute("Staff");
        %>

        <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
            <div class="d-flex flex-column-fluid">
                <div class="container">
                    <p class="pb-2 mt-4"><a href="/home">Home</a> / <a href="../Staff/StaffList.jsp">Staff</a> / <strong>Update Staff</strong></p>

                    <form id="create-staff" action="<%= request.getContextPath()%>/StaffUpdateServlet" method="POST">
                        <button class="btn btn-primary">Update Staff<i class="bi bi-check"></i></button>

                        <div>
                            <div id="staffDetailBox">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <label class="m-0 ml-2 mt-4" for="staffDetail">
                                            <h3>
                                                <legend>Staff Details</legend>
                                            </h3>
                                        </label>

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="form-row">
                                                    <input type="text" name="staffID" class="form-control" value="<%= staff.getStaffId()%>" hidden>
                                                    <!-- Product name -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="staffName" class="h7 float-right">Staff Username <span class="text-danger">*</span> </label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <input type="text" name="staffName" class="form-control" value="<%= staff.getStaffUsername()%>">
                                                        </div>
                                                    </div>

                                                    <!-- Staff password -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="staffPassword" class="h7 float-right">Staff Password <span class="text-danger">*</span> </label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <input type="password" id="prodPrice" name="staffPassword" class="form-control"  value="<%= staff.getStaffPassword()%>" readonly>
                                                        </div>
                                                    </div>

                                                    <!-- Staff email -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="staffEmail" class="h7 float-right"> Staff Email </label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <input type="email" id="prodPrice" name="staffEmail" class="form-control" value="<%= staff.getStaffEmail()%>">
                                                        </div>
                                                    </div>

                                                    <!-- Staff Full Name -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="staffFullname" class="h7 float-right">Staff Full Name</label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <input type="text" name="staffFullname" class="form-control" value="<%= staff.getStaffFullname()%>">
                                                        </div>
                                                    </div>

                                                    <!-- Staff IC NO -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="staffIC" class="h7 float-right">Staff IC No.</label>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <input type="text" name="staffIC" class="form-control" value="<%= staff.getStaffIcNo()%>">
                                                        </div>
                                                    </div>

                                                    <!-- Staff ph no. -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="staffPH" class="h7 float-right" >Staff Phone No.</label>                                                       
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <input type="text" name="staffPH" class="form-control" value="<%= staff.getStaffPhNo()%>">
                                                        </div>
                                                    </div>

                                                    <!-- Staff address -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="staffAddress" class="h7 float-right" >Staff Address</label>                                                       
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <input type="text" name="staffAddress" class="form-control"value="<%= staff.getStaffAddress()%>">
                                                        </div>
                                                    </div>

                                                    <!-- Staff Gender -->
                                                    <div class="mt-3 col-md-4">
                                                        <label for="staffGender" class="h7 float-right" >Staff Gender</label>                                                       
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <select class="form-select" name="staffGender">
                                                                <%
                                                                    if (staff.getStaffGender().equals("Male")) {
                                                                %>
                                                                <option value="" disabled>Select a Gender</option>
                                                                <option value="Male" selected>Male</option>
                                                                <option value="Female">Female</option>
                                                                <option value="Other">Other</option>
                                                                <%
                                                                } else if (staff.getStaffGender().equals("Female")) {
                                                                %>
                                                                <option value="" disabled>Select a Gender</option>
                                                                <option value="Male">Male</option>
                                                                <option value="Female" selected>Female</option>
                                                                <option value="Other">Other</option>
                                                                <%
                                                                } else if (staff.getStaffGender().equals("Other")) {
                                                                %>
                                                                <option value="" disabled>Select a Gender</option>
                                                                <option value="Male">Male</option>
                                                                <option value="Female">Female</option>
                                                                <option value="Other" selected>Other</option>
                                                                <%
                                                                } else {
                                                                %>
                                                                <option value="" disabled selected>Select a Gender</option>
                                                                <option value="Male">Male</option>
                                                                <option value="Female">Female</option>
                                                                <option value="Other">Other</option>
                                                                <%
                                                                    }
                                                                %>
                                                            </select>
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
