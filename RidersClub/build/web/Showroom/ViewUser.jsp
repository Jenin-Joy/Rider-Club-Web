<%-- 
    Document   : ViewUser
    Created on : 14 Feb, 2021, 11:27:37 AM
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
        <%@include file='Header.jsp' %>
    </head>
    <body>
        <form id='tab'>
            <table border="1" align='center'>
                <tr>
                    <th>No</th>
                    <th>User Name</th>
                    <th>Action</th>
                </tr>
        <%
            int i=0;
          String sel="select * from tbl_user ";
          ResultSet rs=con.selectCommand(sel);
          while(rs.next())
          {
              i++;
        %>
        <tr>
            <td><%out.println(i);%></td>
            <td><%=rs.getString("user_name")%></td>
            <td><a href="ViewUserProfile.jsp?userid=<%=rs.getString("user_id")%>">View</a></td>
                
        </tr>
        <%
          }
        %>
          </table>
        </form>
    </body>
</html>
<%@include file='Footer.jsp' %>