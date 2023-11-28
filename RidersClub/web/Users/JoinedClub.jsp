<%-- 
    Document   : JoinedClub
    Created on : 6 May, 2021, 5:16:09 PM
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
                    <th>No</th>
                    <th>Logo</th>
                    <th>Club Name</th>
                    <th>Action</th>
                </tr>
        <%
            int i=0;
            String sel="select * from tbl_requestclub rc inner join tbl_club c on rc.club_id=c.club_id where rc.user_id='"+session.getAttribute("uid")+"'";
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
                i++;
        %>
                <tr>
                    <td><%out.println(i);%></td>
                    <td><img src="../Assets/Club/Club_logos/<%=rs.getString("club_logo")%>" width="100" height="100"></td>
                    <td><%=rs.getString("club_name")%></td>
                    <td><a href="JoinedClubDetails.jsp?clubid=<%=rs.getString("club_id")%>">View</a></td>
                </tr>
          
        <%
            }
        %>
          </table>
        </form>
    </body>
    <%@include file="Footer.jsp" %>
</html>
