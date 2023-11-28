<%-- 
    Document   : ViewEvent
    Created on : 27 Feb, 2021, 10:58:15 AM
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
        <form id='tab' style="overflow-x: auto">
            <table border="1" align="center" width="1800">
                <tr>
                    <th>No</th>
                    <th>Event Name</th>
                    <th>District</th>
                    <th>Place</th>
                    <th width="200">Location</th>
                    <th colspan="2" align="center">Land Marks</th>
                    <th width="150">Logo</th>
                    <th width="50">Event Duration</th>
                    <th>Event Type</th>
                    <th width="100">Start Date</th>
                    <th width="150">Rules And Regulation</th>
                    <th>Contact</th>
                    <th>Tickets Available</th>
                    <th width="50">Total Tickets</th>
                    <th width="80">Rate Per Tickets</th>
                    <th>Action</th>
                </tr>
                <%
                    int i=0;
                    String sel="select * from tbl_event e inner join tbl_place p on e.place_id=p.place_id inner join tbl_district d on p.district_id=d.district_id inner join tbl_eventtype et on e.eventtype_id=et.eventtype_id";
                    ResultSet rs=con.selectCommand(sel);
                    while(rs.next())
                    {
                        i++;
                %>
                <tr>
                    <td><%out.println(i);%></td>
                    <td><%=rs.getString("event_name")%></td>
                    <td><%=rs.getString("district_name")%></td>
                    <td><%=rs.getString("place_name")%></td>
                    <td><%=rs.getString("event_location")%></td>
                    <td><%=rs.getString("event_landmark1")%></td>
                    <td><%=rs.getString("event_landmark2")%></td>
                    <td><img src="../Assets/Club/Event_logo/<%=rs.getString("event_logo")%>" height="100" width="100"></td>
                    <td><%=rs.getString("event_duration")%></td>
                    <td><%=rs.getString("eventtype_name")%></td>
                    <td><%=rs.getString("event_startdate")%></td>
                    <td><img src="../Assets/Club/Event_rules/<%=rs.getString("event_rules")%>" height="100" width="100"></td>
                    <td><%=rs.getString("event_contact")%></td>
                    <td><%=rs.getString("event_tickets")%></td>
                     <%
                    if(rs.getString("event_totaltickets").equals("0"))
                    {
                   %>
                    <td style="color: red">Not Available</td>
                    <%
                    }else{
                     %>
                    <td><%=rs.getString("event_totaltickets")%></td>
                    <%
                    }
                    %>
                    <td><%=rs.getString("event_ticketrate")%></td>
                    <td style="color: red"><%
                 if(rs.getString("event_totaltickets").equals("0"))
                    {
                   out.println("Closed");
                    }else
                    {
                         %>
                        <a href="BookEvent.jsp?eventid=<%=rs.getString("event_id")%>">Book Tickets</a>
                    <% 
                    }
                 
                    %>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>
    </body>
</html>
<%@include file='Footer.jsp' %>