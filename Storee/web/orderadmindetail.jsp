<%-- 
    Document   : productadmindetail
    Created on : Mar 16, 2024, 1:16:16 PM
    Author     : ducco
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="productadmin.jsp" %>
<body style="background-color: grey;">
    <div style="margin-left: 700px; margin-top:100px; padding: 30px; font-size: 30px; border: black 2px solid; display: inline-block; background-color: white;">
        <h1>Order Detail </h1>
        <a href='admin?action=orderlist'>Order List</a> | <a href='login?action=logout'>Logout</a>
        <form action="admin"method="POST">
                <table style="font-size: 30px">


                    <tr><td>Id</td><td>${requestScope.orders.id}</td></tr>
                    <tr><td>User ID</td><td>${requestScope.orders.userID}</td></tr>
                    <tr><td>Address</td><td>${requestScope.orders.address}</td></tr>
                    <tr><td>Phone</td><td>${requestScope.orders.phone}</td></tr>	
                    <tr><td>Status</td><td>${requestScope.orders.status}</td></tr>		 
                    <tr><td>Voucher ID</td><td>${requestScope.orders.voucherID}</td></tr>		 
                    <tr><td>Total Price</td><td>${requestScope.orders.totalPrice}</td></tr>		 
                    
                </table>


                <form action="admin">
                    <input type=hidden name="id" value="${requestScope.orders.id}">
                    <input type=hidden name="action" value="order-edit">
                    <input style="justify-content: center;
                           font-size: 20px;
                           padding: 10px;
                           " type=submit value="Edit"></form>
            </form>
</body>
