<%@page import="ProductCategory.Entity.Product"%>
<%@page import="Product.da.ProductDA"%>
<%@page import="report.TopProduct"%>
<%@page import="Customer.Entity.Customer"%>
<%@page import="Customer.da.CustomerDA"%>
<%@page import="report.TopCustomer"%>
<%@page import="BuyEntity.Feedback"%>
<%@page import="BuyDA.FeedbackDA"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.YearMonth"%>
<%@page import="BuyDA.OrderListDA"%>
<%@page import="java.util.List"%>
<%@page import="BuyEntity.OrderTable"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../Layout/header.html"></jsp:include> 
            <script 
                src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js">
            </script>
        </head>
        <body>
        <jsp:include page="../Layout/navbar.jsp"></jsp:include>  
        <%
            String selection = (String) session.getAttribute("Selection");
        %>  
        <!-- Content here start -->
        <div class="row">

            <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
                <div class="d-flex flex-column-fluid">
                    <div class="container">
                        <p class="pb-2 mt-4"><a href="/home">Home</a> / <strong>Report</strong></p>
                        <div class="row" style="text-align: center">
                            <h3>Type Of Report</h3>
                        </div>
                        <hr>
                        <form action="<%= request.getContextPath()%>/ReportGetSelect" method="get">
                            <div class="row">
                                <div class="col-md-4">
                                    <span><b>Report</b></span>
                                </div>
                                <div class="col-md-4">
                                    <div class="row">
                                        <span><b>Select the Report:</b></span>
                                    </div>
                                    <div class="row" >
                                        <div class="form-check" style="padding-left: 35px;">
                                            <input type="radio" class="form-check-input" id="Customer" name="reportSelect" value="SalesReportYear">
                                            <label for="SalesReportYear">Sales Report Year</label><br>
                                            <input type="radio" class="form-check-input" id="Product" name="reportSelect" value="SalesReportMonth">
                                            <label for="SalesReportMonth">Sales Report Month</label><br>
                                            <input type="radio" class="form-check-input" id="SalesRecord" name="reportSelect" value="SalesReportWeek">
                                            <label for="SalesReportWeek">Sales Report Week</label><br>
                                            <input type="radio" class="form-check-input" id="SalesRecord" name="reportSelect" value="topCustomer">
                                            <label for="topCustomer">Top Customer (Spend)</label><br>
                                            <input type="radio" class="form-check-input" id="SalesRecord" name="reportSelect" value="topProduct">
                                            <label for="topProduct">Top Product (Sales)</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <button class="btn btn-primary">Generate Report<i class="bi bi-check"></i></button>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <hr>



                        <%
                            if (selection != null) {
                                if (selection.equals("SalesReportWeek")) {
                        %>
                        <!--week-->
                        <div id="reportDiv">
                            <div class="row" style="text-align: left">
                                <h3>Sales Report (Last <span style="color: greenyellow">Week</span>)</h3>
                            </div>
                            <hr>
                            <canvas id="SalesChartWeek" width="900" height="400"></canvas>
                        </div>
                        <%
                        } else if (selection.equals("SalesReportMonth")) {
                        %>
                        <!--month-->
                        <div id="reportDiv">
                            <div class="row" style="text-align: left">
                                <h3>Sales Report (Last <span style="color: greenyellow">Year</span>)</h3>
                            </div>
                            <hr>
                            <canvas id="SalesChartMonth" width="900" height="400"></canvas>
                        </div>
                        <%
                        } else if (selection.equals("SalesReportYear")) {
                        %>
                        <!--year-->
                        <div id="reportDiv">
                            <div class="row" style="text-align: left">
                                <h3>Sales Report (Last 5 <span style="color: greenyellow">Years</span>)</h3>
                            </div>
                            <hr>
                            <canvas id="SalesChartYear" width="900" height="400"></canvas>
                        </div>
                        <%
                        } else if (selection.equals("topCustomer")) {
                        %>
                        <!--CUSTOMER-->
                        <div id="reportDiv">
                            <div class="row" style="text-align: left">
                                <h3>Top Five Customer (<span style="color: greenyellow">Spend</span>)</h3>
                            </div>
                            <hr>
                            <canvas id="TopCustomer" width="900" height="400"></canvas>
                        </div>
                        <%
                        } else if (selection.equals("topProduct")) {
                        %>
                        <!--Product-->
                        <div id="reportDiv">
                            <div class="row" style="text-align: left">
                                <h3>Top Ten Product (<span style="color: greenyellow">Sales</span>)</h3>
                            </div>
                            <hr>
                            <canvas id="TopProduct" width="900" height="400"></canvas>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
            </div>
            <%
                session.removeAttribute("Selection");
            %>
            <!--get date range-->
            <%
                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                Calendar cal = Calendar.getInstance();
                // get starting date
                cal.add(Calendar.DAY_OF_YEAR, -8);
                Date[] dates = new Date[7];
                //String day
                String[] dayStr = new String[7];
                // loop adding one day in each iteration
                for (int i = 0; i < 7; i++) {
                    cal.add(Calendar.DAY_OF_YEAR, 1);
                    dates[i] = cal.getTime();
                    dayStr[i] = sdf.format(dates[i]);
                }
            %>
            <!--get the month range-->
            <%
                SimpleDateFormat sdfMonth = new SimpleDateFormat("MM-yyyy");
                Calendar calMonth = Calendar.getInstance();
                // get starting date
                calMonth.add(Calendar.MONTH, -13);
                Date[] MonthSave = new Date[12];

                //String date
                String[] MonthStr = new String[12];
                // loop adding one day in each iteration
                for (int i = 0; i < 12; i++) {
                    calMonth.add(Calendar.MONTH, 1);
                    MonthSave[i] = calMonth.getTime();
                    MonthStr[i] = sdfMonth.format(MonthSave[i]);
                }
            %>
            <!--get the Year range-->
            <%
                SimpleDateFormat sdfYear = new SimpleDateFormat("yyyy");
                Calendar calYear = Calendar.getInstance();
                // get starting date
                calYear.add(Calendar.YEAR, -6);
                Date[] YearSave = new Date[5];

                //String date
                String[] YearStr = new String[5];
                // loop adding one day in each iteration
                for (int i = 0; i < 5; i++) {
                    calYear.add(Calendar.YEAR, 1);
                    YearSave[i] = calYear.getTime();
                    YearStr[i] = sdfYear.format(YearSave[i]);
                }
            %>
            <!--get the total sales of the day-->
            <%
                List<OrderTable> orderTable = OrderListDA.getAllRecords();
                double dateOneTotal = 0;
                double dateTwoTotal = 0;
                double dateThreeTotal = 0;
                double dateFourTotal = 0;
                double dateFiveTotal = 0;
                double dateSixTotal = 0;
                double dateSevenTotal = 0;
                for (int i = 0; i < orderTable.size(); i++) {
                    String dateOrder = sdf.format(orderTable.get(i).getOrderDate());

                    if (dateOrder.equals(dayStr[0]) && orderTable.get(i).getOrderStatus().equals("Payment Fail") == false && orderTable.get(i).getOrderStatus().equals("Cancel") == false) {
                        dateOneTotal += orderTable.get(i).getOrderPaymentAmount();
                    } else if (dateOrder.equals(dayStr[1]) && orderTable.get(i).getOrderStatus().equals("Payment Fail") == false && orderTable.get(i).getOrderStatus().equals("Cancel") == false) {
                        dateTwoTotal += orderTable.get(i).getOrderPaymentAmount();
                    } else if (dateOrder.equals(dayStr[2]) && orderTable.get(i).getOrderStatus().equals("Payment Fail") == false && orderTable.get(i).getOrderStatus().equals("Cancel") == false) {
                        dateThreeTotal += orderTable.get(i).getOrderPaymentAmount();
                    } else if (dateOrder.equals(dayStr[3]) && orderTable.get(i).getOrderStatus().equals("Payment Fail") == false && orderTable.get(i).getOrderStatus().equals("Cancel") == false) {
                        dateFourTotal += orderTable.get(i).getOrderPaymentAmount();
                    } else if (dateOrder.equals(dayStr[4]) && orderTable.get(i).getOrderStatus().equals("Payment Fail") == false && orderTable.get(i).getOrderStatus().equals("Cancel") == false) {
                        dateFiveTotal += orderTable.get(i).getOrderPaymentAmount();
                    } else if (dateOrder.equals(dayStr[5]) && orderTable.get(i).getOrderStatus().equals("Payment Fail") == false && orderTable.get(i).getOrderStatus().equals("Cancel") == false) {
                        dateSixTotal += orderTable.get(i).getOrderPaymentAmount();
                    } else if (dateOrder.equals(dayStr[6]) && orderTable.get(i).getOrderStatus().equals("Payment Fail") == false && orderTable.get(i).getOrderStatus().equals("Cancel") == false) {
                        dateSevenTotal += orderTable.get(i).getOrderPaymentAmount();
                    }

                }
            %>
            <!--get the total sales of the day-->
            <%
                double monthOneTotal = 0;
                double monthTwoTotal = 0;
                double monthThreeTotal = 0;
                double monthFourTotal = 0;
                double monthFiveTotal = 0;
                double monthSixTotal = 0;
                double monthSevenTotal = 0;
                double monthEightTotal = 0;
                double monthNineTotal = 0;
                double monthTenTotal = 0;
                double monthElevenTotal = 0;
                double monthTwelveTotal = 0;
                for (int i = 0; i < orderTable.size(); i++) {
                    String dateOrder = sdfMonth.format(orderTable.get(i).getOrderDate());
                    if (dateOrder.equals(MonthStr[0]) && orderTable.get(i).getOrderStatus().equals("Payment Fail") == false && orderTable.get(i).getOrderStatus().equals("Cancel") == false) {
                        monthOneTotal += orderTable.get(i).getOrderPaymentAmount();
                    } else if (dateOrder.equals(MonthStr[1]) && orderTable.get(i).getOrderStatus().equals("Payment Fail") == false && orderTable.get(i).getOrderStatus().equals("Cancel") == false) {
                        monthTwoTotal += orderTable.get(i).getOrderPaymentAmount();
                    } else if (dateOrder.equals(MonthStr[2]) && orderTable.get(i).getOrderStatus().equals("Payment Fail") == false && orderTable.get(i).getOrderStatus().equals("Cancel") == false) {
                        monthThreeTotal += orderTable.get(i).getOrderPaymentAmount();
                    } else if (dateOrder.equals(MonthStr[3]) && orderTable.get(i).getOrderStatus().equals("Payment Fail") == false && orderTable.get(i).getOrderStatus().equals("Cancel") == false) {
                        monthFourTotal += orderTable.get(i).getOrderPaymentAmount();
                    } else if (dateOrder.equals(MonthStr[4]) && orderTable.get(i).getOrderStatus().equals("Payment Fail") == false && orderTable.get(i).getOrderStatus().equals("Cancel") == false) {
                        monthFiveTotal += orderTable.get(i).getOrderPaymentAmount();
                    } else if (dateOrder.equals(MonthStr[5]) && orderTable.get(i).getOrderStatus().equals("Payment Fail") == false && orderTable.get(i).getOrderStatus().equals("Cancel") == false) {
                        monthSixTotal += orderTable.get(i).getOrderPaymentAmount();
                    } else if (dateOrder.equals(MonthStr[6]) && orderTable.get(i).getOrderStatus().equals("Payment Fail") == false && orderTable.get(i).getOrderStatus().equals("Cancel") == false) {
                        monthSevenTotal += orderTable.get(i).getOrderPaymentAmount();
                    } else if (dateOrder.equals(MonthStr[7]) && orderTable.get(i).getOrderStatus().equals("Payment Fail") == false && orderTable.get(i).getOrderStatus().equals("Cancel") == false) {
                        monthEightTotal += orderTable.get(i).getOrderPaymentAmount();
                    } else if (dateOrder.equals(MonthStr[8]) && orderTable.get(i).getOrderStatus().equals("Payment Fail") == false && orderTable.get(i).getOrderStatus().equals("Cancel") == false) {
                        monthNineTotal += orderTable.get(i).getOrderPaymentAmount();
                    } else if (dateOrder.equals(MonthStr[9]) && orderTable.get(i).getOrderStatus().equals("Payment Fail") == false && orderTable.get(i).getOrderStatus().equals("Cancel") == false) {
                        monthTenTotal += orderTable.get(i).getOrderPaymentAmount();
                    } else if (dateOrder.equals(MonthStr[10]) && orderTable.get(i).getOrderStatus().equals("Payment Fail") == false && orderTable.get(i).getOrderStatus().equals("Cancel") == false) {
                        monthElevenTotal += orderTable.get(i).getOrderPaymentAmount();
                    } else if (dateOrder.equals(MonthStr[11]) && orderTable.get(i).getOrderStatus().equals("Payment Fail") == false && orderTable.get(i).getOrderStatus().equals("Cancel") == false) {
                        monthTwelveTotal += orderTable.get(i).getOrderPaymentAmount();
                    }

                }
            %>
            <!--get the total sales of the Year-->
            <%
                double YearOneTotal = 0;
                double YearTwoTotal = 0;
                double YearThreeTotal = 0;
                double YearFourTotal = 0;
                double YearFiveTotal = 0;
                for (int i = 0; i < orderTable.size(); i++) {
                    String dateOrder = sdfYear.format(orderTable.get(i).getOrderDate());

                    if (dateOrder.equals(YearStr[0]) && orderTable.get(i).getOrderStatus().equals("Payment Fail") == false && orderTable.get(i).getOrderStatus().equals("Cancel") == false) {
                        YearOneTotal += orderTable.get(i).getOrderPaymentAmount();
                    } else if (dateOrder.equals(YearStr[1]) && orderTable.get(i).getOrderStatus().equals("Payment Fail") == false && orderTable.get(i).getOrderStatus().equals("Cancel") == false) {
                        YearTwoTotal += orderTable.get(i).getOrderPaymentAmount();
                    } else if (dateOrder.equals(YearStr[2]) && orderTable.get(i).getOrderStatus().equals("Payment Fail") == false && orderTable.get(i).getOrderStatus().equals("Cancel") == false) {
                        YearThreeTotal += orderTable.get(i).getOrderPaymentAmount();
                    } else if (dateOrder.equals(YearStr[3]) && orderTable.get(i).getOrderStatus().equals("Payment Fail") == false && orderTable.get(i).getOrderStatus().equals("Cancel") == false) {
                        YearFourTotal += orderTable.get(i).getOrderPaymentAmount();
                    } else if (dateOrder.equals(YearStr[4]) && orderTable.get(i).getOrderStatus().equals("Payment Fail") == false && orderTable.get(i).getOrderStatus().equals("Cancel") == false) {
                        YearFiveTotal += orderTable.get(i).getOrderPaymentAmount();
                    }

                }
            %>

            <!--top sales graph script (Week)-->
            <script type="text/javascript">

                var ctx = document.getElementById("SalesChartWeek");
                var myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: ["<%= sdf.format(dates[0])%>", "<%= sdf.format(dates[1])%>", "<%= sdf.format(dates[2])%>", "<%= sdf.format(dates[3])%>", "<%= sdf.format(dates[4])%>", "<%= sdf.format(dates[5])%>", "<%= sdf.format(dates[6])%>"],
                        datasets: [
                            {label: 'Sales of Week',
                                data: [<%= dateOneTotal%>, <%= dateTwoTotal%>, <%= dateThreeTotal%>, <%= dateFourTotal%>, <%= dateFiveTotal%>, <%= dateSixTotal%>, <%= dateSevenTotal%>],
                                backgroundColor: ['rgba(54, 162, 235, 0.2)'
                                ],

                                borderColor: [
                                    'rgba(54, 162, 235, 1)'
                                ],
                                borderWidth: 1
                            }
                        ]
                    },
                    options: {
                        scales: {
                            yAxes: [{
                                    ticks: {
                                        beginAtZero: true
                                    }
                                }]
                        }
                    }
                });

            </script>
            <!--top sales graph script (Month)-->
            <script type="text/javascript">
                var ctx = document.getElementById("SalesChartMonth");
                var myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: ["<%= MonthStr[0]%>", "<%= MonthStr[1]%>", "<%= MonthStr[2]%>", "<%= MonthStr[3]%>", "<%= MonthStr[4]%>", "<%= MonthStr[5]%>", "<%= MonthStr[6]%>", "<%= MonthStr[7]%>", "<%= MonthStr[8]%>", "<%= MonthStr[9]%>", "<%= MonthStr[10]%>", "<%= MonthStr[11]%>"],
                        datasets: [
                            {label: 'Sales of Month',
                                data: [<%= monthOneTotal%>, <%= monthTwoTotal%>, <%= monthThreeTotal%>, <%= monthFourTotal%>, <%= monthFiveTotal%>, <%= monthSixTotal%>, <%= monthSevenTotal%>, <%= monthEightTotal%>, <%= monthNineTotal%>, <%= monthTenTotal%>, <%= monthElevenTotal%>, <%= monthTwelveTotal%>],
                                backgroundColor: ['rgba(54, 162, 235, 0.2)'
                                ],

                                borderColor: [
                                    'rgba(54, 162, 235, 1)'
                                ],
                                borderWidth: 1
                            }
                        ]
                    },
                    options: {
                        scales: {
                            yAxes: [{
                                    ticks: {
                                        beginAtZero: true
                                    }
                                }]
                        }
                    }
                });

            </script>
            <!--top sales graph script (Last 5 years)-->
            <script type="text/javascript">
                var ctx = document.getElementById("SalesChartYear");
                var myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: ["<%= YearStr[0]%>", "<%= YearStr[1]%>", "<%= YearStr[2]%>", "<%= YearStr[3]%>", "<%= YearStr[4]%>"],
                        datasets: [
                            {label: 'Sales of Year',
                                data: [<%= YearOneTotal%>, <%= YearTwoTotal%>, <%= YearThreeTotal%>, <%= YearFourTotal%>, <%= YearFiveTotal%>],
                                backgroundColor: ['rgba(54, 162, 235, 0.2)'
                                ],

                                borderColor: [
                                    'rgba(54, 162, 235, 1)'
                                ],
                                borderWidth: 1
                            }
                        ]
                    },
                    options: {
                        scales: {
                            yAxes: [{
                                    ticks: {
                                        beginAtZero: true
                                    }
                                }]
                        }
                    }
                });

            </script>
            <!--top 5 customer-->
            <script type="text/javascript">
                var ctx = document.getElementById("TopCustomer");
                var myChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: [<%
                            List<TopCustomer> topCustomer = OrderListDA.getTopFiveCustomer();
                            for (int i = 0; i < topCustomer.size(); i++) {
                                Customer customer = CustomerDA.getCustomerRecordById(topCustomer.get(i).getCustomerID());
                                out.print("\"" + customer.getCustomerUsername() + "\",");
                            }
                %>],
                        datasets: [
                            {label: 'Total Spend',
                                data: [<%
                                    for (int i = 0; i < topCustomer.size(); i++) {
                                        out.print(topCustomer.get(i).getPrice() + ",");
                                    }
                %>],
                                backgroundColor: [
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(54, 162, 235, 0.2)'
                                ],

                                borderColor: [
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(54, 162, 235, 1)'
                                ],
                                borderWidth: 1
                            }
                        ]
                    },
                    options: {
                        scales: {
                            yAxes: [{
                                    ticks: {
                                        beginAtZero: true
                                    }
                                }]
                        }
                    }
                });

            </script>

            <!--top 10 Product-->
            <script type="text/javascript">
                var ctx = document.getElementById("TopProduct");
                var myChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: [<%
                            List<TopProduct> topProduct = OrderListDA.getTopTenProduct();
                            for (int i = 0; i < topProduct.size(); i++) {
                                Product product = ProductDA.serachByID(topProduct.get(i).getProductID());
                                out.print("\"" + product.getProductName() + "\",");
                            }
                %>],
                        datasets: [
                            {label: 'Total Sales',
                                data: [<%
                                    for (int i = 0; i < topProduct.size(); i++) {
                                        out.print(topProduct.get(i).getPrice() + ",");
                                    }
                %>],
                                backgroundColor: [
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(54, 162, 235, 0.2)'
                                ],

                                borderColor: [
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(54, 162, 235, 1)'
                                ],
                                borderWidth: 1
                            }
                        ]
                    },
                    options: {
                        scales: {
                            yAxes: [{
                                    ticks: {
                                        beginAtZero: true
                                    }
                                }]
                        }
                    }
                });

            </script>

            <!-- Content here end -->
            <jsp:include page="../Layout/footer.html"></jsp:include>  
    </body>
</html>
