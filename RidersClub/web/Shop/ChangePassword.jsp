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
        <%@include file='Header.jsp' %>
    </head>
    <body>
        <body>
        <%
            String sel="",shoppassword="";
            sel="select * from tbl_shop where shop_id='"+session.getAttribute("shopid")+"'";
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
            shoppassword=rs.getString("shop_password");
            }
            if(request.getParameter("btnsave")!=null)
            {
                if(shoppassword.equals(request.getParameter("txtcupass")))
                {
                 if((request.getParameter("txtnewpass")).equals(request.getParameter("conpass")))
                 {
                     String edit="update tbl_shop set shop_password='"+request.getParameter("txtnewpass")+"'";
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
                    <td><input type="text" name="txtcupass" placeholder="Current Password" autocomplete="off" required="required" pattern="[a-zA-Z0-9]{5-20}" title="Enter at least 8 character"></td>
                </tr>
                <tr>
                    <td>New Password</td>
                    <td><input type="text" name="txtnewpass" placeholder="New Password" autocomplete="off" required="required" pattern="[a-zA-Z0-9]{5-20}" title="Enter at least 8 character"></td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                    <td><input type="text" name="conpass" placeholder="Confirm Password" autocomplete="off" required="required" pattern="[a-zA-Z0-9]{5-20}" title="Enter at least 8 character"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="Submit"><input type="reset" name="txtcancel" value="Cancel"></td>
                </tr>
            </table>
        </form>
    </body>
    </body>
</html>
<%@include file='Footer.jsp' %>
