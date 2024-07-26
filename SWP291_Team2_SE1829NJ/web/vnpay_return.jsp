<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="com.vnpay.common.Config"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="jakarta.servlet.http.HttpSession" %>
<%@page import="model.Account" %>
<%@page import="model.Cart" %>
<%@page import="dao.BillDAO" %>




<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>KẾT QUẢ THANH TOÁN</title>
        <!-- Bootstrap core CSS -->
        <link href="/vnpay_jsp/assets/bootstrap.min.css" rel="stylesheet"/>
        <!-- Custom styles for this template -->
        <link href="/vnpay_jsp/assets/jumbotron-narrow.css" rel="stylesheet"> 
        <script src="/vnpay_jsp/assets/jquery-1.11.3.min.js"></script>
        <style>
            button {
                padding: 15px 25px;
                border: unset;
                border-radius: 15px;
                color: #212121;
                z-index: 1;
                background: #e8e8e8;
                position: relative;
                font-weight: 1000;
                font-size: 17px;
                -webkit-box-shadow: 4px 8px 19px -3px rgba(0,0,0,0.27);
                box-shadow: 4px 8px 19px -3px rgba(0,0,0,0.27);
                transition: all 250ms;
                overflow: hidden;
            }

            button::before {
                content: "";
                position: absolute;
                top: 0;
                left: 0;
                height: 100%;
                width: 0;
                border-radius: 15px;
                background-color: #212121;
                z-index: -1;
                -webkit-box-shadow: 4px 8px 19px -3px rgba(0,0,0,0.27);
                box-shadow: 4px 8px 19px -3px rgba(0,0,0,0.27);
                transition: all 250ms
            }

            button:hover {
                color: #e8e8e8;
            }

            button:hover::before {
                width: 100%;
            }
            a{
                color: black;
            }
            /* General container styling */
            .container {
                max-width: 960px;
                margin: 0 auto;
                padding: 20px;
            }

            /* Header styling */
            .header {
                border-bottom: 2px solid #e8e8e8;
                margin-bottom: 20px;
                padding-bottom: 10px;
            }

            .header h3 {
                margin: 0;
                font-size: 24px;
                color: #333;
            }

            /* Form group styling */
            .form-group {
                margin-bottom: 20px;
                padding: 10px;
                border: 1px solid #e8e8e8;
                border-radius: 5px;
                background-color: #f9f9f9;
            }

            .form-group label {
                display: block;
                font-weight: bold;
                color: #333;
                margin-bottom: 5px;
            }

            /* Price label styling */
            #price {
                font-size: 18px;
                color: #e74c3c; /* Red color for emphasis */
            }

            /* Responsive table styling */
            .table-responsive {
                overflow-x: auto;
            }

            /* Footer styling */
            .footer {
                text-align: center;
                padding: 20px 0;
                border-top: 2px solid #e8e8e8;
                margin-top: 20px;
                background-color: #f1f1f1;
            }

            .footer p {
                margin: 0;
                color: #555;
            }

            /* Button styling */
            button {
                padding: 15px 25px;
                border: none;
                border-radius: 15px;
                color: #212121;
                background: #e8e8e8;
                font-weight: bold;
                font-size: 17px;
                box-shadow: 4px 8px 19px -3px rgba(0, 0, 0, 0.27);
                transition: background-color 250ms, color 250ms;
                position: relative;
                overflow: hidden;
                cursor: pointer;
                text-align: center;
            }

            button:hover {
                color: #e8e8e8;
                background-color: #212121;
            }

            button::before {
                content: "";
                position: absolute;
                top: 0;
                left: 0;
                height: 100%;
                width: 0;
                border-radius: 15px;
                background-color: #212121;
                transition: width 250ms;
                z-index: -1;
            }

            button:hover::before {
                width: 100%;
            }

            /* Anchor tags inside buttons */
            button a {
                color: inherit;
                text-decoration: none;
            }

        </style>
    </head>
    <body>
        <%
            //Begin process return from VNPAY
            Map fields = new HashMap();
            for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
                String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    fields.put(fieldName, fieldValue);
                }
            }

            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            if (fields.containsKey("vnp_SecureHashType")) {
                fields.remove("vnp_SecureHashType");
            }
            if (fields.containsKey("vnp_SecureHash")) {
                fields.remove("vnp_SecureHash");
            }
            String signValue = Config.hashAllFields(fields);

        %>
        <!--Begin display -->
        <button><a href="homepage">Back to Home Page</a></button>
        <div class="container">
            <div class="header clearfix">
                <h3 class="text-muted">KẾT QUẢ THANH TOÁN</h3>
            </div>
            <div class="table-responsive">
                <div class="form-group">
                    <label >Mã giao dịch thanh toán:</label>
                    <label><%=request.getParameter("vnp_TxnRef")%></label>
                </div>    
                <div class="form-group">
                    <label >Số tiền:</label>
                    <label id="price">${cart.totalCost}</label>
                </div>  
                <div class="form-group">
                    <label >Mô tả giao dịch:</label>
                    <label><%=request.getParameter("vnp_OrderInfo")%></label>
                </div> 
                <div class="form-group">
                    <label >Mã lỗi thanh toán:</label>
                    <label><%=request.getParameter("vnp_ResponseCode")%></label>
                </div> 
                <div class="form-group">
                    <label >Mã giao dịch tại CTT VNPAY-QR:</label>
                    <label><%=request.getParameter("vnp_TransactionNo")%></label>
                </div> 
                <div class="form-group">
                    <label >Mã ngân hàng thanh toán:</label>
                    <label><%=request.getParameter("vnp_BankCode")%></label>
                </div> 
                <div class="form-group">
                    <label >Thời gian thanh toán:</label>
                    <label><%=request.getParameter("vnp_PayDate")%></label>
                </div> 
                <div class="form-group">
                    <label >Tình trạng giao dịch:</label>
                    <label>
                        <%
                            HttpSession sessionObj = request.getSession(true);

                            // Lấy giá trị từ session
                            Cart cart = (Cart) sessionObj.getAttribute("cart");
                            Account acc = (Account) sessionObj.getAttribute("acc");

                            if (cart == null || acc == null) {
                                response.sendRedirect("homepage");
                            return;
                            }
                            BillDAO dao = new BillDAO();
                            int bill_id = dao.getLastBillId();

                            int userId = dao.getUserIdByAccountUsername(acc.getUsername());

                            if (signValue.equals(vnp_SecureHash)) {
                                if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                                    dao.addBooking(cart, userId, bill_id);
                                    dao.changeStatusInCartVNPAY(cart);
                                    dao.updatePaymentModeByUserId(bill_id,true);
                                    session.removeAttribute("cart");
                                    session.setAttribute("size", 0);
                                    out.print("Thành công");
                                } else {
                                    dao.deletePaymentModeByUserId(bill_id);
                                    out.print("Không thành công");
                                }

                            } else {
                                out.print("invalid signature");
                            }
                        %></label>
                </div> 
            </div>
            <p>
                &nbsp;
            </p>
            <footer class="footer">
                <p>&copy; VNPAY 2020</p>
            </footer>
        </div>  
        <script>
            function formatPrice(price) {
                return parseFloat(price).toLocaleString('en-US', {
                    maximumFractionDigits: 2
                });
            }


// Select all elements with id 'price'
            const priceElements = document.querySelectorAll('#price');

// Loop through each element and format its content
            priceElements.forEach(element => {
                let price = element.textContent;
                element.textContent = formatPrice(price);
            });
        </script>
    </body>
</html>
