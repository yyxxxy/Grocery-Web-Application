<!DOCTYPE html>
<html>
    <head>
        <title>Register | MyGrocery</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- Custom Theme files -->
        <link href="../css/registerCss.css" rel="stylesheet" type="text/css" media="all" />
        <!-- //Custom Theme files -->
        <!-- web font -->
        <link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">
        <!-- //web font -->
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
        <!-- main -->
        <div class="main-w3layouts wrapper">
            <h1>Sign Up</h1>
            <div class="main-agileinfo">
                <div class="agileits-top">
                    <form id="create-customer" action="<%= request.getContextPath()%>/RegisterCustomer" method="post">
                        <!--must mroe than 6-->
                        <input class="text" type="text" name="customerUsername" placeholder="Username" required>
                        <%
                            String errorMsgUserName = (String) session.getAttribute("errorMsgUserName");
                            if (errorMsgUserName != null) {
                                out.print(errorMsgUserName);
                            }
                            session.removeAttribute("errorMsgUserName");
                        %>
                        <br>
                        <input class="text email" type="email" name="customerEmail" placeholder="Email" required>
                        <br>
                        <input class="text" type="password" name="customerPassword" placeholder="Password" minlength="8" maxlength="16" required><br>
                        <input class="text w3lpass" type="password" name="repeatPassword" placeholder="Confirm Password" minlength="8" maxlength="16" required>
                        <%
                            String errorMsgUserPasswrod = (String) session.getAttribute("errorMsgUserPassword");
                            if (errorMsgUserPasswrod != null) {
                                out.print(errorMsgUserPasswrod);
                            }
                            session.removeAttribute("errorMsgUserPassword");
                        %>
                        <br>
                        <h4>Personal Details</h4><br>
                        <input class="text" type="text" name="customerFullname" placeholder="Full Name" required><br>
                        <input class="text" type="text" name="customerICNo" placeholder="Identity Card No." required>
                        <%
                            String icMsg = (String) session.getAttribute("icMsg");
                            if (icMsg
                                    != null) {
                        %>
                        <span class="text-danger" style="color: white; font-size: 20px; background: red"><%= icMsg%></span>
                        <%
                            }

                            session.removeAttribute(
                                    "icMsg");
                        %>
                        <br>
                        <input class="text" type="text" name="customerPHNo" placeholder="Phone Number" required><br>
                        <input class="text" type="text" name="customerAddress" placeholder="Home Address" required><br>
                        <select class="form-select" name="customerGender" required>
                            <option value="" disabled selected>Select a Gender</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Other">Other</option>
                        </select>

                        <div class="wthree-text">
                            <div class="clear"> </div>
                        </div>
                        <input type="submit" value="SIGNUP">
                    </form>
                    <p>Already have an Account? <a href="../AccessPage/Login.jsp"> Login Now!</a></p>
                </div>
            </div>
            <!-- //copyright -->
            <ul class="colorlib-bubbles">
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
            </ul>
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
        <!-- //main -->
    </body>
</html>