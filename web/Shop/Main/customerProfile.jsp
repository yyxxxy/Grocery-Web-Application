<%-- 
    Document   : customerProfile
    Created on : Mar 24, 2022, 10:58:16 PM
    Author     : user
--%>

<%@page import="Customer.Entity.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>

    .inputUpdate{
        border: 1px solid grey;
        border-radius: 5px;
        height:35px;
        font-size: 15px;
        width: 250px;
        padding-left: 5px;
    }
    .row {
        display: flex;
    }

    .col{
        flex: 50%;
    }
    .colInput{
        text-align: left;
        font-size: 30px;
        padding-left: 5px;
    }
    .colLabel{
        text-align: right;
        font-size: 30px;
        padding-right: 10px;
        padding-top: 5px;
    }
    .customerHead{
        font-size: 35px;
        text-align: center;
    }
    .btnProfileSave{
        font-size:  28px;
        border-radius: 5px;
        color: var(--green);
        background-color: #B2D3C2;
        padding: 5px;
    }
    .btnProfileSave:hover{
        font-size:  30px;
        border-radius: 5px;
        color: white;
        background-color: #234f1e;
    }
    .colInput:checked{
        border: 1px solid var(--green);
    }
    .selectBox{
        border: 1px solid grey;
        text-align: left;
        font-size: 17px;
        height: 37px;
        width: 250px;
        padding-left: 5px;
        border-radius: 5px;
    }
</style>
<html>
    <%
        Customer cust = (Customer) session.getAttribute("CustomerDetails");
        String successful = (String) session.getAttribute("successfulMsg");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyGrocery | Customer </title>
        <jsp:include page="../Layout/header.jsp"></jsp:include>  
        </head>
        <body>
        <jsp:include page="../Layout/navbar.jsp"></jsp:include>
            <h3 class="customerHead"><span style="color: var(--green)">Profile</span> Setting</h3>
            <form id="create-product" action="<%= request.getContextPath()%>/UpdateProfile" method="POST" >
            <div class="box-container" style="text-align: center">
                <input type="text" name="custID" class="inputUpdate" placeholder="Full Name" value="<%= cust.getCustomerId()%>" hidden>

                <%
                    if (successful != null) {
                %>
                <h3 class="msg"><span style="color: var(--green); font-size: 15px"><%= successful%></span></h3>
                    <%
                        }
                    %>
                <div class="row">
                    <div class="col colLabel">
                        <label> Full Name </label>
                    </div>
                    <div class="col colInput">
                        <input type="text" name="fullname" class="inputUpdate" placeholder="Full Name" value="<%= cust.getCustomerFullname()%>">
                    </div>
                </div>

                <div class="row">
                    <div class="col colLabel">
                        <label> Gender </label>
                    </div>
                    <div class="col colInput">
                        <select name="gender" id="gender" class="selectBox">
                            <%
                            if(cust.getCustomerGender().equals("Male")){
                            %>
                            <option value=""disabled>Select a gender</option>
                            <option value="Male" selected>Male</option>
                            <option value="Female">Female</option>
                            <%
                                }else if(cust.getCustomerGender().equals("Female")){
                            %>
                            <option value=""disabled>Select a gender</option>
                            <option value="Male" >Male</option>
                            <option value="Female" selected>Female</option>
                            <%
                                }else{
                            %>
                            <option value=""disabled selected>Select a gender</option>
                            <option value="Male" >Male</option>
                            <option value="Female" >Female</option>
                            <%
                            }
                            %>
                        </select>
                    </div>
                </div>

                <div class="row">
                    <div class="col colLabel">
                        <label> Username </label>
                    </div>
                    <div class="col colInput">
                        <input type="text" name="username" class="inputUpdate" placeholder="Username" value="<%= cust.getCustomerUsername()%>">
                    </div>
                </div>

                <div class="row">
                    <div class="col colLabel">
                        <label> IC No. </label>
                    </div>
                    <div class="col colInput">
                        <input type="text" name="icNo" class="inputUpdate" placeholder="IC No." value="<%= cust.getCustomerIcNo()%>">
                    </div>
                </div>

                <div class="row">
                    <div class="col colLabel">
                        <label> Phone Number </label>
                    </div>
                    <div class="col colInput">
                        <input type="text" name="phno" class="inputUpdate" placeholder="Phone Number" value="<%= cust.getCustomerPhNo()%>">
                    </div>
                </div>

                <div class="row">
                    <div class="col colLabel">
                        <label> Address </label>
                    </div>
                    <div class="col colInput">
                        <input type="text" name="address" class="inputUpdate" placeholder="Address" value="<%= cust.getCustomerAddress()%>">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col colLabel">
                </div>
                <div class="col colInput" style="padding-top: 10px">
                    <button type="submit" class="btnProfileSave">Save Profile</button>
                </div>
            </div>
        </form>


        <jsp:include page="../Layout/footer.jsp"></jsp:include>  
    </body>
</html>
