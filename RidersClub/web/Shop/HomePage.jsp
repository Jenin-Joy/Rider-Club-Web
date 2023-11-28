<%-- 
    Document   : HomePage
    Created on : 23 Jan, 2021, 3:58:08 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file='Header.jsp' %>
        <style type="text/css">
body {
	background-image: url(Template/img/background/shop.jpg);
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	//margin-top: 280px;
}
            </style>
    </head>
    <body>
        <h1 style="color: white">Hello <%=session.getAttribute("shopname")%></h1>
       
    </body>
</html>
<%@include file="Footer.jsp"%>
