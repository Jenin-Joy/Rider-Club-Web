<%-- 
    Document   : Myclub
    Created on : 24 Jan, 2021, 3:45:19 PM
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
        <form id="tab">
            <table border="1" align="center">
                <tr>
                    <th>NO</th>
                    <th>Club Name</th>
                    <th>Contact</th>
                    <th>Email</th>
                    <th>Logo</th>
                    <th>District</th>
                    <th>Club Type</th>
                    <th colspan="3" align="center">Action</th>
                </tr>
                <%
                    int i=0;
                    String sel="select * from tbl_club c inner join tbl_district d on d.district_id=c.district_id inner join tbl_clubtype ct on ct.clubtype_id=c.clubtype_id where user_id='"+session.getAttribute("uid")+"'";
                    ResultSet cl=con.selectCommand(sel);
                    while(cl.next())
                    {
                        i=i+1;
                %>
                <tr>
                    <td><%out.println(i);%></td>
                    <td><%=cl.getString("club_name")%></td>
                    <td><%=cl.getString("club_contact")%></td>
                    <td><%=cl.getString("club_email")%></td>
                    <td><img src="../Assets/Club/Club_logos/<%=cl.getString("club_logo")%>" height="100" width="200"></td>
                    <td><%=cl.getString("district_name")%></td>
                    <td><%=cl.getString("clubtype_name")%></td>
                    <td><a href="ViewMyClub.jsp?club=<%=cl.getString("club_id")%>">View</a></td>
                    
                </tr>
                <%
                    }
                %>
                
            </table>
                <table align="center">
                    <tr><td><a href="Club.jsp">Create Club</a></td></tr>
                    <tr><td><a href="JoinedClub.jsp">Joined Club</a></td></tr>
                </table>
                
                
        </form>
    </body>
</html>
<%@include file="Footer.jsp" %>