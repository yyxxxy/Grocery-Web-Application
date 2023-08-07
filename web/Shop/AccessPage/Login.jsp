
<!DOCTYPE html>
<html>
    <!--prevent back-->
    <%
        response.setHeader("Pragma", "no_cache");
        response.setHeader("Cache-Control", "no_store");
        response.setHeader("Expires", "0");
        response.setDateHeader("Expires", -1);
    %>
    <head>
        <title>Login | MyGrocery</title>
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
    <body style="height: 150%">
        <!-- main -->
        <div class="main-w3layouts wrapper" >
            <h1>MyGrocery Login</h1>
            <div class="main-agileinfo">
                <div class="agileits-top" >
                    <form id="create-customer" action="<%= request.getContextPath()%>/LoginCustomer" method="post">
                        <input class="text" type="text" name="customerUsername" placeholder="Username" required>
                        <%
                            String msgUsername = (String) session.getAttribute("errorMessageUsername");
                            if (msgUsername != null) {
                        %>
                        <span class="text-danger" style="color: #FF6347"><%= msgUsername%></span>
                        <%
                            }
                            session.removeAttribute("errorMessageUsername");
                        %>
                        <br>
                        <input class="text" type="password" name="customerPassword" placeholder="Password" required>
                        <%
                            String msgPsw = (String) session.getAttribute("errorMessagePsw");
                            if (msgPsw != null) {
                        %>
                        <span class="text-danger" style="color: #FF6347"><%= msgPsw%></span>
                        <%
                            }
                            session.removeAttribute("errorMessagePsw");
                        %>
                        <br>

                        <div class="wthree-text">
                            <div class="clear"> </div>
                        </div>
                        <input type="submit" value="login">
                    </form>
                    <p>Don't have an Account? <a href="../AccessPage/Register.jsp"> Sign Up Now!</a></p>
                </div>
            </div>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>

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
        <!-- //main -->
    </body>
</html>