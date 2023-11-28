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
        <%@include file="Header.jsp" %>
    </head>
    <body>
        <% 
            String sel="",name="",contact="",email="",gender="",bio="",address="",usname="";
            sel="select * from tbl_user where user_id='"+session.getAttribute("uid")+"'";
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
                name=rs.getString("user_name");
                contact=rs.getString("user_contact");
                email=rs.getString("user_email");
                gender=rs.getString("user_gen");
                bio=rs.getString("user_bio");       
                address=rs.getString("user_address");
                usname=rs.getString("user_username") ;       
            }
               
            if(request.getParameter("btnsave")!=null)
            {
                String edit="update tbl_user set user_name='"+request.getParameter("txtname")+"',user_contact='"+request.getParameter("txtcontact")+"',user_email='"+request.getParameter("txtemail")+"',user_gen='"+request.getParameter("txtgender")+"',user_bio='"+request.getParameter("txtbio")+"',user_address='"+request.getParameter("txtaddress")+"',user_username='"+request.getParameter("txtusname")+"'";
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
                    <td>Gender</td>
                    <td><input type="text" name="txtgender" value="<%=gender%>"></td>
                </tr>
                <tr>
                    <td>Bio</td>
                    <td><input type="text" name="txtbio" value="<%=bio%>"></td>
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
                <tr>
                    <td colspan="2"><a href="EditProfilePhoto.jsp">Edit Profile Photo</a></td>
                </tr>
            </table>
        </form>
    </body>
</html>
<%@include file="Footer.jsp" %>