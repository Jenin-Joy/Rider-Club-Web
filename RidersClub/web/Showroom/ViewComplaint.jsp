<%-- 
    Document   : ViewComplaint
    Created on : 10 Mar, 2021, 3:48:16 PM
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
     <form id='tab'>
            <table border="1" align='center'>
                <tr>
                    <th>No</th>
                    <th>Showroom Name</th>
                    <th>Complaint</th>
                    <th>Complaint Type</th>
                    <th>Date</th>
                    <th>Replay</th>
                </tr>
                <%
                    int j=0;
                    String sel1="select * from tbl_complaint c inner join tbl_showroom s on c.showroom_id=s.showroom_id inner join tbl_complainttype ct on c.complainttype_id=ct.complainttype_id";
                    
                    ResultSet s=con.selectCommand(sel1);
                    while(s.next())
                    {
                        j++;
                      %>
                      <tr>
                          <td><%out.println(j);%></td>
                          <td><%=s.getString("Showroom_name")%></td>
                          <td><%=s.getString("complaint_condent")%></td>
                          <td><%=s.getString("complainttype_name")%></td>
                          <td><%=s.getString("complaint_date")%></td>
                          <td><%=s.getString("complaint_replay")%></td>
                      </tr>
                <%  
                    }
                %>
            </table>
        </form>
    </body>
</html>
<%@include file='Footer.jsp' %>