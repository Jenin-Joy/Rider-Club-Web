<%-- 
    Document   : ViewUserProfile
    Created on : 9 Feb, 2021, 2:21:25 PM
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
       
        
        <%
            String sel1="",photo="";
                    sel1="select * from tbl_uservehicle where user_id='"+request.getParameter("userid")+"'";
            ResultSet r=con.selectCommand(sel1);
            while(r.next())
            {
               photo=r.getString("uv_photo");
            }
        %>
        
        <%
            String sel="select * from tbl_user where user_id='"+request.getParameter("userid")+"'";
            //out.println(sel);
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
        %>
        <form id="tab">
            <table align="center">
                <tr>
                    <td colspan="2">
                        <img src="../Assets/User/User_photo/<%=photo%>" height="200" width="200"> 
                    </td>
                </tr>
                <tr>
                    <td style="color: lightsteelblue">User Name</td>
                    <td><%=rs.getString("user_name")%></td>
                </tr>
                <tr>
                    <td style="color: lightsteelblue">User Email</td>
                    <td><a href="mailto:<%=rs.getString("user_username")%>"><%=rs.getString("user_email")%></td>
                </tr>
                <tr>
                    <td style="color: lightsteelblue">User Bio</td>
                    <td><%=rs.getString("user_bio")%></td>
                </tr>
                <tr>
                    <td><a href="ViewUserGallery.jsp?usid=<%=rs.getString("user_id")%>">Gallery</a></td>
                </tr>
            </table>
        </form>
                    <%
            }
                    %>
    </body>
</html>
<%@include file='Footer.jsp' %>