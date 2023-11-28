<%-- 
    Document   : SendReplay
    Created on : 10 Mar, 2021, 3:58:50 PM
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
    <h3 align="center">Replay</h3>
    <body>
        <h3 align="center">Shop Replays</h3>
        <form id="tab">
            <table border="1" align="center">
                <tr>
                    <th>No</th>
                    <th>Shop Name</th>
                    <th>Complaint</th>
                    <th>Complaint Type</th>
                    <th>Date</th>
                    <th>Replay</th>
                </tr>
                <%
                    int p=0;
                    String sel2="select * from tbl_complaint c inner join tbl_shop s on c.shop_id=s.shop_id inner join tbl_complainttype ct on c.complainttype_id=ct.complainttype_id where c.complaint_status='1'";
                    
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
            <h3 align="center">Showroom Replays</h3>
            
              <table border="1" align="center">
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
                    String sel1="select * from tbl_complaint c inner join tbl_showroom s on c.showroom_id=s.showroom_id inner join tbl_complainttype ct on c.complainttype_id=ct.complainttype_id where c.complaint_status='1'";
                    
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
            <h3 align="center">User Replays</h3>
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
                    String sel="select * from tbl_complaint c inner join tbl_user u on c.user_id=u.user_id inner join tbl_complainttype ct on c.complainttype_id=ct.complainttype_id where c.complaint_status='1'";
                    
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
        </form>
    </body>
</html>
