<%-- 
    Document   : Profile
    Created on : 9 Feb, 2021, 12:48:50 PM
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
        <%@include file="Header.jsp" %>
    </head>
    <body>
        <%
            String uvid="",sel1="";
            sel1="select * from tbl_uservehicle where user_id='"+session.getAttribute("uid")+"'";
            ResultSet se=con.selectCommand(sel1);
            while(se.next())
            {
                uvid=se.getString("uv_id");
            }
            
            String sel="select * from tbl_uservehicle uv inner join tbl_user u on uv.user_id=u.user_id where uv_id='"+uvid+"' and u.user_id='"+session.getAttribute("uid")+"'";
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
        %>
        <form id="tab">
            <table align="center">
                <tr>
                    <td colspan="2">
                        <img src="../Assets/User/User_photo/<%=rs.getString("uv_photo")%>" height="200" width="200"> 
                    </td>
                </tr>
                <tr>
                    <td style="color: lightsteelblue">User Name</td>
                    <td>
                        <%=rs.getString("user_name")%>
                    </td>
                </tr>
                <tr>
                    <td style="color: lightsteelblue">User Bio</td>
                    <td><%=rs.getString("user_bio")%></td>
                    
                </tr>
          
                    <%
            }
                    %>
                    <tr><td colspan="2">  <a href="EditProfile.jsp">Edit Profile</a>
       
        <a href="UserGallery.jsp">Gallery</a>
        <a href="ChangePassword.jsp">Change Password</a></td></tr>
            </table>
        </form>
    </body>
</html>
<%@include file="Footer.jsp" %>