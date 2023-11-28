<%-- 
    Document   : ViewComplaint
    Created on : 10 Mar, 2021, 3:44:53 PM
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
                    <th>User Name</th>
                    <th>Complaint</th>
                    <th>Complaint Type</th>
                    <th>Date</th>
                    <th>Replay</th>
                </tr>
                <%
                    int i=0;
                    String sel="select * from tbl_complaint c inner join tbl_user u on c.user_id=u.user_id inner join tbl_complainttype ct on c.complainttype_id=ct.complainttype_id";
                    //out.println(sel);
                    ResultSet rs=con.selectCommand(sel);
                    while(rs.next())
                    {
                        i++;
                      %>
                      <tr>
                          <td><%out.println(i);%></td>
                          <td><%=rs.getString("user_name")%></td>
                          <td><%=rs.getString("complaint_condent")%></td>
                          <td><%=rs.getString("complainttype_name")%></td>
                          <td><%=rs.getString("complaint_date")%></td>
                          <td><%=rs.getString("complaint_replay")%></td>
                          
                      </tr>
                <%  
                    }
                %>
            </table>
        </form></body>
</html>
<%@include file="Footer.jsp" %>