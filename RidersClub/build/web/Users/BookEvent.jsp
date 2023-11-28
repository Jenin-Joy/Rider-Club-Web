<%-- 
    Document   : BookEvent
    Created on : 27 Feb, 2021, 12:07:38 PM
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
        <%
            
            
            String sel="",ticketrate="",count="";
                    sel="select * from tbl_event e inner join tbl_place p on e.place_id=p.place_id inner join tbl_district d on p.district_id=d.district_id inner join tbl_eventtype et on e.eventtype_id=et.eventtype_id where event_id='"+request.getParameter("eventid")+"'";
                    ResultSet rs=con.selectCommand(sel);
                    while(rs.next())
                    {
                        ticketrate=rs.getString("event_ticketrate");
                        count=rs.getString("event_totaltickets");
        %>
       
            <table border="1" align="center">
                <tr>
                    <td colspan="3" align="center"><img src="../Assets/Club/Event_logo/<%=rs.getString("event_logo")%>" height="200" width="300""></td>
                </tr>
                <tr>
                    <td>Event Name</td>
                    <td colspan="2"><%=rs.getString("event_name")%></td>
                </tr>
                <tr>
                    <td>District</td>
                    <td colspan="2"><%=rs.getString("district_name")%></td>
                </tr>
                <tr>
                    <td>Place</td>
                    <td colspan="2"><%=rs.getString("event_location")%></td>
                </tr>
                <tr>
                    <td>Location</td>
                    <td colspan="2"><%=rs.getString("place_name")%></td>
                </tr>
                <tr>
                    <td>Land Marks</td>
                    <td><%=rs.getString("event_landmark1")%></td>
                    <td><%=rs.getString("event_landmark2")%></td>
                </tr>
                <tr>
                    <td>Event Duration</td>
                    <td colspan="2"><%=rs.getString("event_duration")%></td>
                </tr>                    
                <tr>
                    <td>Event Type</td>
                    <td colspan="2"><%=rs.getString("eventtype_name")%></td>
                </tr>
                <tr>
                    <td>Start Date</td>
                    <td colspan="2"><%=rs.getString("event_startdate")%></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td colspan="2"><%=rs.getString("event_contact")%></td>
                </tr>
                <tr>
                    <td>Tickets Available</td>
                    <%
                    if((Integer.parseInt(count))!=0)
                    {
                    %>
                    <td colspan="2"><%=rs.getString("event_tickets")%></td>
                    <%
                    }else{
                    %>
                    <td style="color: red" colspan="2">Not Available</td>
                    <%
                    }
                    %>
                </tr>
                <tr>
                    <td>Total Tickets</td>
                    <%
                    if((Integer.parseInt(count))!=0)
                    {
                    %>
                    <td colspan="2"><%=rs.getString("event_totaltickets")%>
                        <input type="hidden" name="ttot" value="<%=rs.getString("event_totaltickets")%>"</td>
                    <%
                    }else
                    {
                    %>
                    <td style="color: red" colspan="2">Full</td>
                    <%
                    }
                    %>
                </tr>
                <tr>
                    <td>Rate Per Tickets</td>
                    <td colspan="2"><%=rs.getString("event_ticketrate")%></td>
                </tr>
             </table>
        
        <%
                    }
        %>
        
        <br><br>
        <%
                   
             if(request.getParameter("btnsave")!=null)
             {
                 String ins="insert into tbl_eventbooking(booking_totalticket,user_id,event_id,booking_totalamount,booking_date)values('"+request.getParameter("txttotal")+"','"+session.getAttribute("uid")+"','"+request.getParameter("hid")+"','"+request.getParameter("txttotalrate")+"',curdate())";
                 //out.println(ins);   
                if(con.executeCommand(ins))       
                {
                    //System.out.println(request.getParameter("ttot"));
                    String edit="";
                    int tcount = Integer.parseInt(request.getParameter("ttot"));
                    int ttot = Integer.parseInt(request.getParameter("txttotal"));
                    int total = tcount - ttot;
                    edit="update tbl_event set event_totaltickets ='"+total+"' where event_id='"+request.getParameter("hid")+"'";
                    con.executeCommand(edit);
                    
                    String sel2="select max(booking_id) as id from tbl_eventbooking";
                    ResultSet rs2=con.selectCommand(sel2);
                    if(rs2.next())
                    {
                    response.sendRedirect("Payment.jsp?id="+rs2.getString("id")+"");
                    }
                }
             }
             
             
        %>
        
     
        <table align="center">
            <tr>
                <td>Number of Tickets</td>
                <td>
                    <input id="demoInput" autocomplete="off" type="number" onchange="ticrate()" value="1" min="1" max="<%=count%>" name="txttotal">
                </td>
            </tr>
        </table>
            
            <table align="center">
            <tr>
                <td>Per Ticket Rate</td>
                <td><input type="text" id="r" value="<%=ticketrate%>" readonly="">
                    <input type="hidden" name='hid' value="<%=request.getParameter("eventid")%>"</td>
            </tr>
            <tr>
                <td>Total Rate</td>
                <td><input type="text" id="tot" value="<%=ticketrate%>" readonly="" name="txttotalrate"></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" name="btnsave" value="Book"></td>
                </tr>
        </table>
        </form>
    </body>
</html>
 
<script>
  
   function ticrate()
   {
       //alert(rate);
       var rate = document.getElementById("demoInput").value;
       var r = document.getElementById("r").value;
       var tot = r * rate ;
       document.getElementById("tot").value=tot;
       
    }  
  
   </script><%@include file="Footer.jsp" %>