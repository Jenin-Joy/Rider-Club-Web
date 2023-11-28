<%-- 
    Document   : ViewProfile
    Created on : 14 Feb, 2021, 10:52:10 AM
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
            String sel="select * from tbl_showroom sh inner join tbl_place p on sh.place_id=p.place_id inner join tbl_district d on sh.district_id=d.district_id where sh.showroom_id='"+session.getAttribute("shroomid")+"'";
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
        %>
        <form id='tab'>
            <table align='center'>
                <tr>
                    <td colspan="2"><img src="../Assets/Showroom/Showroom_photo/<%=rs.getString("showroom_photo")%>" height="200" width="200"></td>
                </tr>
                <tr>
                    <td style="color: lightsteelblue">Name</td>
                    <td><%=rs.getString("showroom_name")%></td>
                </tr>
                <tr>
                    <td style="color: lightsteelblue">Address</td>
                    <td><%=rs.getString("showroom_address")%></td>
                </tr>
                <tr>
                    <td style="color: lightsteelblue">Contact</td>
                    <td><%=rs.getString("showroom_contact")%></td>
                </tr>
                <tr>
                    <td style="color: lightsteelblue">Email</td>
                    <td><a href="mailto:<%=rs.getString("showroom_email")%>"><%=rs.getString("showroom_email")%></td>
                </tr>
                <tr>
                    <td style="color: lightsteelblue">District</td>
                    <td><%=rs.getString("district_name")%></td>
                </tr>
                <tr>
                    <td style="color: lightsteelblue">Place</td>
                    <td><%=rs.getString("place_name")%></td>
                </tr>
                <tr>
                    <td colspan="2"><a href="ChangePassword.jsp">Change Password</a>
                 <a href="EditProfile.jsp">Edit Profile</a></td>
                </tr>
            </table>
        </form>
        <%
            }
        %>
    </body>
</html>
<%@include file='Footer.jsp' %>