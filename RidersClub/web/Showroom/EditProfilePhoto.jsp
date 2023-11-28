<%-- 
    Document   : EditProfilePhoto
    Created on : 14 Feb, 2021, 1:10:48 PM
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
            
            String sel="",showroomphoto="";
            sel="select * from tbl_showroom where showroom_id='"+session.getAttribute("shroomid")+"'";
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
                showroomphoto=rs.getString("showroom_photo");
            }
        %>
        <form method="post" action="ProfilePhotoUploadAction.jsp" enctype="multipart/form-data" id='tab'>
            <table align='center'>
                <tr>
                    <td colspan="2"><img src="../Assets/Showroom/Showroom_photo/<%=showroomphoto%>" height="200" width="200"></td>
            </tr>
                <tr>
                    <td>Choose Profile Photo</td>
                    <td><input type="file" name="txtphoto"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="Edit"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
<%@include file='Footer.jsp' %>