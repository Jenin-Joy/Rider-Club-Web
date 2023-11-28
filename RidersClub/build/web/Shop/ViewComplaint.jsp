<%-- 
    Document   : ViewComplaint
    Created on : 10 Mar, 2021, 3:54:07 PM
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
        <form id="tab">
            <table border="1" align="center">
                <tr>
                    <th>No</th>
                    <th>Shop Name</th>
                    <th>Complaint</th>
                    <th>Complaint Type</th>
                    <th>Date</th>
                    <th>Replay</th>
                </tr
                <%
                    int p=0;
                    String sel2="select * from tbl_complaint c inner join tbl_shop s on c.shop_id=s.shop_id inner join tbl_complainttype ct on c.complainttype_id=ct.complainttype_id";
                    
                    ResultSet r=con.selectCommand(sel2);
                    while(r.next())
                    {
                        p++;
                      %>
                      <tr>
                          <td><%out.println(p);%></td>
                          <td><%=r.getString("Shop_name")%></td>
                          <td><%=r.getString("complaint_condent")%></td>
                          <td><%=r.getString("complainttype_name")%></td>
                          <td><%=r.getString("complaint_date")%></td>
                          <td><%=r.getString("complaint_replay")%></td>
                      </tr>
                <%  
                    }
                %>
            </table>
        </form>
    </body>
</html>
<%@include file='Footer.jsp' %>