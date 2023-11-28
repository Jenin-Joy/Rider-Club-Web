<%-- 
    Document   : Ajaxplace
    Created on : 23 Dec, 2020, 2:51:53 PM
    Author     : asus
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <option>--Select--</option>
       <%
                          String sel1="select * from tbl_place where district_id='"+request.getParameter("disid")+"'";
                          ResultSet ps=con.selectCommand(sel1);
                          while(ps.next())
                          {
                        %>
                        <option value="<%=ps.getString("place_id")%>"><%=ps.getString("place_name")%></option>
                        <%
                          }
                        %>
    </body>
</html>
