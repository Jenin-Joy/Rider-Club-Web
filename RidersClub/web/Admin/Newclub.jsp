<%-- 
    Document   : Newclub
    Created on : 23 Jan, 2021, 3:28:10 PM
    Author     : asus
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title
        <%@include file="HomePage.jsp" %>
    </head>
    <h3 align="center">New Club</h3>
     <body>
         <%
             if(request.getParameter("delid")!=null)
             {
                 String del="delete from tbl_club where club_id='"+request.getParameter("delid")+"'";
                 con.executeCommand(del);
             }
         %>
         <form id="tab">
            <table border="1" align="center">
                <tr>
                    <th>No</th>
                    <th>Name</th>
                    <th>Contact</th>
                    <th>Email</th>
                    <th>Logo</th>
                    <th>Proof</th>
                    <th>District</th>
                    <th>Club Type</th>
                    <th>Action</th>
                    
                    
                </tr>
                <%
                    int i=0;
                    String sel="select * from tbl_club c inner join tbl_district d on c.district_id=d.district_id inner join tbl_clubtype t on t.clubtype_id=c.clubtype_id";
                    ResultSet rs=con.selectCommand(sel);
                    while(rs.next())
                    {
                        i=i+1;
                %>
                <tr>
                    <td><%out.println(i);%></td>
                    <td><%out.println(rs.getString("club_name"));%></td>
                    <td><%out.println(rs.getString("club_contact"));%></td>
                    <td><a href="mailto:<%out.println(rs.getString("club_email"));%>"><%out.println(rs.getString("club_email"));%></td>
                    <td><img src="../Assets/Club/Club_logos/<%=rs.getString("club_logo")%>" height="100" width="100"></td>
                    <td><img src="../Assets/Club/Club_proofs/<%=rs.getString("club_proof")%>" height="100" width="100"></td>
                    <td><%out.println(rs.getString("district_name"));%></td>
                    <td><%out.println(rs.getString("clubtype_name"));%></td>
                    <td><a href="Newclub.jsp?delid=<%=rs.getString("club_id")%>">Delete</a></td>
                </tr>
                <%
                    }
                %>
                
            </table>
        </form>
    </body>
</html>
