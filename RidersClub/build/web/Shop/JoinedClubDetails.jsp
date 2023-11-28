<%-- 
    Document   : JoinedClubDetails
    Created on : 6 May, 2021, 5:30:22 PM
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
            session.setAttribute("clubid",request.getParameter("clubid"));
        
        String sel="select * from tbl_club c inner join tbl_district d on d.district_id=c.district_id inner join tbl_clubtype ct on ct.clubtype_id=c.clubtype_id where  c.club_id='"+session.getAttribute("clubid")+"'";
        //out.println(sel);
        ResultSet rs=con.selectCommand(sel);
        while(rs.next())
        {
        %>
        <form id="tab">
            <table align="center" width="600">
                <tr>
                    <td colspan="2" align="center"><img src="../Assets/Club/Club_logos/<%=rs.getString("club_logo")%>" width="300" height="200">
                        </td>
                </tr>
                <tr>
                    <td style="color: lightsteelblue">Club Name</td>
                    <td><%=rs.getString("club_name")%></td>
                </tr>
                <tr>
                    <td style="color: lightsteelblue">Club Email</td>
                    <td><a href="mailto:<%=rs.getString("club_email")%>"><%=rs.getString("club_email")%></td>
                </tr>
                <tr>
                    <td style="color: lightsteelblue">Club Contact</td>
                    <td><%=rs.getString("club_contact")%></td>
                </tr>
                <tr>
                    <td style="color: lightsteelblue">Club Type</td>
                    <td><%=rs.getString("clubtype_name")%></td>
                </tr>
                <tr>
                    <td style="color: lightsteelblue">Club District</td>
                    <td><%=rs.getString("district_name")%></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                    
                    <a href="Groupmem.jsp?id=<%=rs.getString("club_id")%>">Club Members</a>
                    
                    <a href="Chat/UserChat.jsp?cid=<%=rs.getString("club_id")%>">Chat</a>
                    
                </tr>
            </table>
        </form>
                <%
        }
                %>
    </body>
    <%@include file="Footer.jsp" %>
</html>
