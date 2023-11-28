<%-- 
    Document   : Myrequestedclub
    Created on : 25 Jan, 2021, 5:49:23 PM
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
            <table border="1"  align="center">
                <tr>
                     <th>No</th>
                    <th>Club Name</th>
                    <th>Date Of Request</th>
                    <th>Contact</th>
                    <th>Email ID</th>
                    
                    <th>Status</th>
                    <th>Action</th>
                    
                </tr>
        <%
            int i=0;
            String sel="select * from tbl_requestclub rc inner join tbl_club c on rc.club_id=c.club_id where shop_id='"+session.getAttribute("shopid")+"'";
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
                i=i+1;
        %>
        <tr>
                    <td><%out.println(i);%></td>
                    <td><%=rs.getString("club_name")%></td>
                    <td><%=rs.getString("requestclub_rdate")%></td>
                    <td><%=rs.getString("club_contact")%></td>
                    <td><%=rs.getString("club_email")%></td>
                    <%
                    String club="";
    String selCount="select * from tbl_requestclub where club_id='"+ rs.getString("club_id") +"' and shop_id='"+session.getAttribute("shopid")+"'"; 
    //out.print(selCount);
    ResultSet rsCount=con.selectCommand(selCount);
    String vstatus="";
    if(rsCount.next()){
          vstatus=rsCount.getString("requestclub_vstatus");
          //out.print(vstatus);
         club=rsCount.getString("club_id");
    }
    if(vstatus.equals("0")){
 %>
 
 
 <td style="color:red;">Pending</td>
    
 
 <%
    }else if(vstatus.equals("1"))
    {
 %>
    
 <td style="color: darkseagreen;">Already Member</td>

<%
    }else if(vstatus.equals("2")){
%>

<td>Rejected</td>
<%
        
    }else{
  %>
  
  <td><a href="Requestclub.jsp?clubid=<%=rs.getString("club_id")%>">Join Now</a></td>
  <%
            }
   %>
   <%
    if(vstatus.equals("0")){
   %>
 
 
 <td style="color:red;">Pending</td>
    
 
 <%
        
    }else if(vstatus.equals("1"))
    {
 %>
   
   <td><a href="JoinedClubDetails.jsp?clubid=<%=rs.getString("club_id")%>">View</a></td>
   <%
    }else{
%>

<td>Closed</td>
<%
    }
        %>
                </tr>
        <%
            }
        %>
            </table>
        </form>
    </body>
</html>
<%@include file='Footer.jsp' %>