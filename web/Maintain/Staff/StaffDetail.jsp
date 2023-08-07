<%@page import="Staff.entity.Staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../Layout/header.html"></jsp:include>  
        <body>
        <jsp:include page="../Layout/navbar.jsp"></jsp:include>  
            <!-- Content here start -->
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
        <%
            Staff staff = (Staff) session.getAttribute("Staff");
        %> 


        <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
            <div class="d-flex flex-column-fluid">
                <div class="container">
                    <p class="pb-2 mt-4"><a href="/home">Home</a> / <a href="../Staff/StaffList.jsp">Staff</a> / <strong>Staff Detail</strong></p>

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
                                                <!-- Product name -->
                                                <div class="mt-3 col-md-4">
                                                    <label for="staffName" class="h7 float-right">Staff Username <span class="text-danger">*</span> </label>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input type="text" name="staffName" class="form-control" value="<%= staff.getStaffUsername()%>" readonly>
                                                    </div>
                                                </div>

                                                <!-- Staff password -->
                                                <div class="mt-3 col-md-4">
                                                    <label for="staffPassword" class="h7 float-right">Staff Password <span class="text-danger">*</span> </label>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input type="text" id="prodPrice" name="staffPassword" class="form-control" value="<%= staff.getStaffPassword()%>" readonly="">
                                                    </div>
                                                </div>

                                                <!-- Staff email -->
                                                <div class="mt-3 col-md-4">
                                                    <label for="staffEmail" class="h7 float-right"> Staff Email </label>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input type="email" id="prodPrice" name="staffEmail" class="form-control" value="<%= staff.getStaffEmail()%>" readonly>
                                                    </div>
                                                </div>

                                                <!-- Staff Full Name -->
                                                <div class="mt-3 col-md-4">
                                                    <label for="staffFullname" class="h7 float-right">Staff Full Name</label>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input type="text" name="staffFullname" class="form-control" value="<%= staff.getStaffFullname()%>" readonly>
                                                    </div>
                                                </div>

                                                <!-- Staff IC NO -->
                                                <div class="mt-3 col-md-4">
                                                    <label for="staffIC" class="h7 float-right">Staff IC No.</label>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input type="text" name="staffIC" class="form-control" value="<%= staff.getStaffIcNo()%>" readonly>
                                                    </div>
                                                </div>

                                                <!-- Staff ph no. -->
                                                <div class="mt-3 col-md-4">
                                                    <label for="staffPH" class="h7 float-right" >Staff Phone No.</label>                                                       
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input type="text" name="staffPH" class="form-control" value="<%= staff.getStaffPhNo()%>" readonly>
                                                    </div>
                                                </div>

                                                <!-- Staff address -->
                                                <div class="mt-3 col-md-4">
                                                    <label for="staffAddress" class="h7 float-right" >Staff Address</label>                                                       
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input type="text" name="staffAddress" class="form-control" value="<%= staff.getStaffAddress()%>" readonly>
                                                    </div>
                                                </div>

                                                <!-- Staff Gender -->
                                                <div class="mt-3 col-md-4">
                                                    <label for="staffGender" class="h7 float-right" >Staff Gender</label>                                                       
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                         <input type="text" name="staffGender" class="form-control" value="<%= staff.getStaffGender()%>" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- cONTENT HERE end -->

    </body>
    <jsp:include page="../Layout/footer.html"></jsp:include>  

</html>
