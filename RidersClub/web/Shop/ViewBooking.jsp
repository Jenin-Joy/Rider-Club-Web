<%-- 
    Document   : ViewBooking
    Created on : 5 May, 2021, 4:15:28 PM
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
            String sel1="",payment="";
            sel1="select * from tbl_partsbooking where shop_id='"+session.getAttribute("shopid")+"'";
            ResultSet r=con.selectCommand(sel1);
            while(r.next())
            {
                payment=r.getString("parts_booking_status");
            }
            
        %>
        <form id="tab">
            <table  align="center" border="1">
                <tr>
                    <th>No</th>
                    <th>Item Name</th>
                    <th>Number of Parts Booked</th>
                    <th>User Name</th>
                    <th>Date of Booked</th>
                    <th>Payment</th>
                </tr>
                <%
                    int i=0;
                    String sel="select * from tbl_partsbooking  p inner join tbl_user u on p.user_id=u.user_id where shop_id='"+session.getAttribute("shopid")+"'";
                    ResultSet rs=con.selectCommand(sel);
                    while(rs.next())
                    {
                        i++;
                %>
                <td><%out.println(i);%></td>
                <td><%=rs.getString("partsbooking_name")%></td>
                <td><%=rs.getString("partsbooking_number")%></td>
                <td><%=rs.getString("user_name")%></td>
                <td><%=rs.getString("partsbooking_date")%></td>
                <%
                if(payment.equals("1"))
                {
                %>
                <td style="color: green">Payed</td>
                <%
                }else{
                %>
                <td style="color: red">Not Payed</td>
                <%
                    }}
                %>
            </table>
        </form>
    </body>
    <%@include file='Footer.jsp' %>
</html>
