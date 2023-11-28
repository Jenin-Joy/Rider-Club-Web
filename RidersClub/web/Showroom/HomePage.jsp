<%-- 
    Document   : HomePage
    Created on : 14 Feb, 2021, 10:51:51 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file='Header.jsp' %>
        <style type="text/css">
body {
	background-image: url(Template/img/background/showroom123.jpg);
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	//margin-top: 280px;
}
            </style>
    </head>
    <body>
        <h1 style="color: window">Hello <%=session.getAttribute("shroomname")%></h1>
    
    </body>
</html>
<%@include file='Footer.jsp' %>