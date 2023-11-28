<%-- 
    Document   : ChangePassword
    Created on : 14 Feb, 2021, 10:51:35 AM
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
            String sel="",showroompassword="";
            sel="select * from tbl_showroom where showroom_id='"+session.getAttribute("shroomid")+"'";
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
            showroompassword=rs.getString("showroom_password");
            }
            if(request.getParameter("btnsave")!=null)
            {
                if(showroompassword.equals(request.getParameter("txtcupass")))
                {
                 if((request.getParameter("txtnewpass")).equals(request.getParameter("conpass")))
                 {
                     String edit="update tbl_showroom set showroom_password='"+request.getParameter("txtnewpass")+"' where showroom_id='"+session.getAttribute("shroomid")+"'";
                     con.executeCommand(edit);
                     out.println("<script>alert ('Password Changed')</script>");
                 }
                 else
                 {
                     out.println("<script>alert ('Error In New Password')</script>");
                 }
                }
                else
                {
                    out.println("<script>alert ('Error In Current Password')</script>");
                }
            }
        %>
        <form id='tab'>
            <table align='center'>
                <tr>
                    <td>Current Password</td>
                    <td><input type="text" name="txtcupass" placeholder="Current Password" required="required" autocomplete="off" pattern="[0-9]{10,12}" title="Enter Valid Number"></td>
                </tr>
                <tr>
                    <td>New Password</td>
                    <td><input type="text" name="txtnewpass" placeholder="New Password" required="required" autocomplete="off" pattern="[0-9]{10,12}" title="Enter Valid Number"></td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                    <td><input type="text" name="conpass" placeholder="Confirm Password" required="required" autocomplete="off" pattern="[0-9]{10,12}" title="Enter Valid Number"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="Submit"><input type="reset" name="txtcancel" value="Cancel"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
<%@include file='Footer.jsp' %>