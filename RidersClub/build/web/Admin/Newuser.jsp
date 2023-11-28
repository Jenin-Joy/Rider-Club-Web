<%-- 
    Document   : Newuser
    Created on : 23 Jan, 2021, 3:39:15 PM
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
        <%@include file="HomePage.jsp" %>
    </head>
    <h3 align="center">New User</h3>
    <body>
        <%
            if(request.getParameter("accid")!=null)
            {
                String edit="update tbl_user set user_pstatus='1' where user_id='"+request.getParameter("accid")+"'";
            con.executeCommand(edit);
            }
            if(request.getParameter("rejid")!=null)
            {
                String edit1="update tbl_user set user_pstatus='2' where user_id='"+request.getParameter("rejid")+"'";
                con.executeCommand(edit1);
            }
        %>
        <form id="tab" style="overflow-x: auto">
            <table border="1" align="center" width="1500">
                <tr>
                    <th>No</th>
                    <th>Name</th>
                    <th>Contact</th>
                    <th>Email</th>
                    <th>Gender</th>
                    <th>Bio</th>
                    <th>Address</th> 
                    <th>Date of join</th>                    
                    <th>Place</th>
                    <th>District</th>
                    <th>Action</th>
                   
                    
                    
                </tr>
                <%
                    int i=0;
                    String sel="select * from tbl_user u inner join tbl_place p on u.place_id=p.place_id inner join tbl_district d on d.district_id=p.district_id where user_pstatus='0'";
                    ResultSet rs=con.selectCommand(sel);
                    while(rs.next())
                    {
                        i=i+1;
                %>
                <tr>
                    <td><%out.println(i);%></td>
                    <td><%out.println(rs.getString("user_name"));%></td>
                    <td><%out.println(rs.getString("user_contact"));%></td>
                    <td><a href="maulto:<%out.println(rs.getString("user_email"));%>"><%out.println(rs.getString("user_email"));%></td>
                    <td><%out.println(rs.getString("user_gen"));%></td>
                    <td><%out.println(rs.getString("user_bio"));%></td>
                    <td><%out.println(rs.getString("user_address"));%></td>                   
                    <td><%out.println(rs.getString("user_doj"));%></td>                   
                    <td><%out.println(rs.getString("place_name"));%></td>
                    <td><%out.println(rs.getString("district_name"));%></td>
                    <td><a href="Newuser.jsp?accid=<%=rs.getString("user_id")%>">Accept</a>
                    <a href="Newuser.jsp?rejid=<%=rs.getString("user_id")%>">Reject</a></td>
                </tr>
                <%
                    }
                %>
                <tr>
                    
                </tr>
            </table>
        </form>
    </body>
</html>
