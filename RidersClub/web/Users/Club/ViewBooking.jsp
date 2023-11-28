<%-- 
    Document   : ViewBooking
    Created on : 27 Feb, 2021, 3:34:08 PM
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
        <h3 align="center">USER BOOKING</h3>
        <form id="tab">
            <table border='1' align="center">
                <tr>
                    <th>No</th>
                    <th>Event Name</th>
                    <th>Booking Date</th>
                    <th>Total Booked Tickets</th>
                    <th>Total Amount</th>
                    <th>User Name</th>
                    
                </tr>
                <%
                    int i=0;
                    String sel="select * from tbl_eventbooking eb inner join tbl_event e on eb.event_id=e.event_id inner join tbl_user u on eb.user_id=u.user_id where e.event_id='"+request.getParameter("eventid")+"' and u.user_id='"+session.getAttribute("uid")+"' and event_payment_status='1'";
                    //out.println(sel);
                    ResultSet rs=con.selectCommand(sel);
                    while(rs.next())
                    {
                        i++;
                %>
                <tr>
                    <td><%out.println(i);%></td>
                    <td><%=rs.getString("event_name")%></td>
                    <td><%=rs.getString("booking_date")%></td>
                    <td><%=rs.getString("booking_totalticket")%></td>
                    <td><%=rs.getString("booking_totalamount")%></td>
                    <td><%=rs.getString("user_name")%></td>
                    
                </tr>
                <%
                    }
                %>
            </table>
            
            <h3 align="center">SHOP BOOKING</h3>
             <table border='1' align="center">
                <tr>
                    <th>No</th>
                    <th>Event Name</th>
                    <th>Booking Date</th>
                    <th>Total Booked Tickets</th>
                    <th>Total Amount</th>
                    <th>Shop Name</th>
                    
                </tr>
                <%
                    
                    String sel1="select * from tbl_eventbooking eb inner join tbl_event e on eb.event_id=e.event_id inner join tbl_shop s on eb.shop_id=s.shop_id where e.event_id='"+request.getParameter("eventid")+"'  and event_payment_status='1'"; 
                    //out.println(sel1);
                    ResultSet r=con.selectCommand(sel1);
                    while(r.next())
                    {
                        i++;
                %>
                <tr>
                    <td><%out.println(i);%></td>
                    <td><%=r.getString("event_name")%></td>
                    <td><%=r.getString("booking_date")%></td>
                    <td><%=r.getString("booking_totalticket")%></td>
                    <td><%=r.getString("booking_totalamount")%></td>
                    <td><%=r.getString("shop_name")%></td>
                    
                </tr>
                <%
                    }
                %>
            </table>
            
            <h3 align="center">SHOWROOM BOOKING</h3>
             <table border='1' align="center">
                <tr>
                    <th>No</th>
                    <th>Event Name</th>
                    <th>Booking Date</th>
                    <th>Total Booked Tickets</th>
                    <th>Total Amount</th>
                    <th>Showroom Name</th>
                    
                </tr>
                <%
                    
                    String sel2="select * from tbl_eventbooking eb inner join tbl_event e on eb.event_id=e.event_id inner join tbl_showroom sh on eb.showroom_id=sh.showroom_id where e.event_id='"+request.getParameter("eventid")+"'  and event_payment_status='1'"; 
                    //out.println(sel2);
                    ResultSet s=con.selectCommand(sel2);
                    while(s.next())
                    {
                        i++;
                %>
                <tr>
                    <td><%out.println(i);%></td>
                    <td><%=s.getString("event_name")%></td>
                    <td><%=s.getString("booking_date")%></td>
                    <td><%=s.getString("booking_totalticket")%></td>
                    <td><%=s.getString("booking_totalamount")%></td>
                    <td><%=s.getString("showroom_name")%></td>
                    
                </tr>
                <%
                    }
                %>
            </table>
        </form>
    </body>
</html>
<%@include file="Footer.jsp" %>