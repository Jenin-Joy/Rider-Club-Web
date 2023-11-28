<%-- 
    Document   : Requestclub
    Created on : 25 Jan, 2021, 3:56:13 PM
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
            if(request.getParameter("btnsave")!=null)
            {
                String ins="insert into tbl_requestclub(showroom_id,club_id,requestclub_rdate)value('"+session.getAttribute("shroomid")+"','"+request.getParameter("clubid")+"',curdate())";
                con.executeCommand(ins);
                //out.println(ins);
                out.println("<script>alert('Requesr Send Successfully')</script>");
                response.sendRedirect("HomePage.jsp");
            }
        %>
        <form method="post" id='tab'>
            <table align="center" cellpadding="10" border="1" style="border-collapse:collapse;">
                    <tr>
                        <th>NO</th>
                        <th>Club Name</th>
                        <th>Contact</th>
                        <th>Email</th>
                        <th>Logo</th>
                        <th>District</th>
                        <th>Club Type</th>
                    </tr>
                    <%
                                        int i=0;
                                        String sel1="select * from tbl_club c inner join tbl_district d on d.district_id=c.district_id inner join tbl_clubtype ct on ct.clubtype_id=c.clubtype_id where club_id='"+request.getParameter("clubid")+"'";
                                        ResultSet rs=con.selectCommand(sel1);
                                        while(rs.next())
                                        {
                                            i=i+1;
                    %>
                     <tr>
                    <td><%out.println(i);%></td>
                    <td><%=rs.getString("club_name")%></td>
                    <td><%=rs.getString("club_contact")%></td>
                    <td><%=rs.getString("club_email")%></td>
                    <td><img src="../Assets/Club/Club_logos/<%=rs.getString("club_logo")%>" height="100" width="200"></td>
                    <td><%=rs.getString("district_name")%></td>
                    <td><%=rs.getString("clubtype_name")%></td>
                    
                </tr>
                    <%
                                        }
                                      
                                                                        
                    %>
                     <tr>
                         <td colspan="7" align="right"><input type="submit" name="btnsave" value="Send Request"></td>
                    </tr>
                             </table>
        </form> 
    </body>
</html>
<%@include file='Footer.jsp' %>