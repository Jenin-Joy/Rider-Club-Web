<%-- 
    Document   : ViewMyClub
    Created on : 14 Mar, 2021, 11:06:01 AM
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
            session.setAttribute("clubid",request.getParameter("club"));
        
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
                    <td colspan="2" align="center"><a href="Viewrequest.jsp?clubid=<%=rs.getString("club_id")%>">View Request</a>  
                    <a href="../Users/Club/ManageEvent.jsp?clubid=<%=rs.getString("club_id")%>">Create Event</a>
                    <a href="Groupmem.jsp?id=<%=rs.getString("club_id")%>">Club Members</a>
                    <a href="Club/MyEvent.jsp?clid=<%=rs.getString("club_id")%>">My Event</a>
                    <a href="Acceptlist.jsp?cid=<%=rs.getString("club_id")%>">Accepted List</a>
                    <a href="Rejectlist.jsp?cid=<%=rs.getString("club_id")%>">Rejected List</a></td>
                </tr>
            </table>
        </form>
                <%
        }
                %>
    </body>
</html>
<%@include file="Footer.jsp" %>