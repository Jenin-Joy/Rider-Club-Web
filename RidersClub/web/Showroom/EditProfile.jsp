<%-- 
    Document   : EditProfile
    Created on : 14 Feb, 2021, 12:00:16 PM
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
            String name="",address="",contact="",email="",district="",place="",sel="",sel3="",placename="",placeid="",districtid="";
            sel="select * from tbl_showroom sh inner join tbl_place p on sh.place_id=p.place_id inner join tbl_district d on sh.district_id=d.district_id where sh.showroom_id='"+session.getAttribute("shroomid")+"'";
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
                name=rs.getString("showroom_name");
                address=rs.getString("showroom_address");
                contact=rs.getString("showroom_contact");     
                email=rs.getString("showroom_email");
                district=rs.getString("district_name");                               
                place=rs.getString("place_name");                                
            }
            
                
            
            if(request.getParameter("btnsave")!=null)
            {
                String edit="update tbl_showroom set showroom_name='"+request.getParameter("txtname")+"',showroom_address='"+request.getParameter("txtaddress")+"',showroom_contact='"+request.getParameter("txtcontact")+"',showroom_email='"+request.getParameter("txtemail")+"' where showroom_id='"+session.getAttribute("shroomid")+"'";
                if(con.executeCommand(edit))
                {
                    out.println("<script>alert ('Profile Updated Successfuly')</script>");
                    response.sendRedirect("EditProfile.jsp");
                }
                else
                {
                    out.println("<script>alert ('Error in Updation')</script>");
                }
            }
            
            
        %>
        <form id='tab'>
            <table align='center'>
                
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" value="<%=name%>"></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text" name="txtaddress" value="<%=address%>"></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txtcontact" value="<%=contact%>"></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="txtemail" value="<%=email%>"></td>
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
<%@include file='Footer.jsp' %>