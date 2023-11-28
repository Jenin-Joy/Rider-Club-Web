<%-- 
    Document   : EditProfile
    Created on : 23 Jan, 2021, 3:58:17 PM
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
            String sel="",name="",contact="",email="",address="",usname="";
            sel="select * from tbl_shop where shop_id='"+session.getAttribute("shopid")+"'";
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
               name=rs.getString("shop_name");
               contact=rs.getString("shop_contact");
               email=rs.getString("shop_email");
               address=rs.getString("shop_address");
               usname=rs.getString("shop_username");
            }
            
            if(request.getParameter("btnsave")!=null)
            {
                String edit="update tbl_shop set shop_name='"+request.getParameter("txtname")+"',shop_contact='"+request.getParameter("txtcontact")+"',shop_email='"+request.getParameter("txtemail")+"',shop_address='"+request.getParameter("txtaddress")+"',shop_username='"+request.getParameter("txtusname")+"'";
                out.println(edit);
                con.executeCommand(edit);
                out.println("<script>alert('Profile Updated')</script>");
                response.sendRedirect("EditProfile.jsp");
            }
        %>
        <form id="tab">
            <table align="center">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" value="<%=name%>"></td>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txtcontact" value="<%=contact%>"></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="txtemail" value="<%=email%>"></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><textarea name="txtaddress"><%=address%></textarea></td>
                </tr>
                <tr>
                    <td>User name</td>
                    <td><input type="text" name="txtusname" value="<%=usname%>"></td>
                </tr>
                 <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="Edit"></td>
                </tr>
                <tr><td colspan="2"><a href="ChangePassword.jsp">Change Password</a></td></tr>
            </table>
        </form>
    </body>
</html>
<%@include file='Footer.jsp' %>