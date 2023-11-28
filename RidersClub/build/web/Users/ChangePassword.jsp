<%-- 
    Document   : ChangePassword
    Created on : 23 Jan, 2021, 3:58:26 PM
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
            String sel="",userpassword="";
            sel="select * from tbl_user where user_id='"+session.getAttribute("uid")+"'";
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
            userpassword=rs.getString("user_password");
            }
            if(request.getParameter("btnsave")!=null)
            {
                if(userpassword.equals(request.getParameter("txtcupass")))
                {
                 if((request.getParameter("txtnewpass")).equals(request.getParameter("conpass")))
                 {
                     String edit="update tbl_user set user_password='"+request.getParameter("txtnewpass")+"' where user_id='"+session.getAttribute("uid")+"'";
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
        <form id="tab">
            <table align="center">
                <tr>
                    <td>Current Password</td>
                    <td><input type="text" name="txtcupass" required="required" placeholder="Current password" autocomplete="off" pattern="[a-zA-Z0-9]{5,20}" title="Enter at least 5 character"></td>
                </tr>
                <tr>
                    <td>New Password</td>
                    <td><input type="text" name="txtnewpass" required="required" placeholder="New password" autocomplete="off" pattern="[a-zA-Z0-9]{5,20}" title="Enter at least 5 character"></td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                    <td><input type="text" name="conpass" required="required" placeholder="Confirm password" autocomplete="off" pattern="[a-zA-Z0-9]{5,20}" title="Enter at least 5 character"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="Submit"><input type="reset" name="txtcancel" value="Cancel"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
<%@include file="Footer.jsp" %>