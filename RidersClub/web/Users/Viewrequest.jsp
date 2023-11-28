
<%-- 
    Document   : Viewrequest
    Created on : 25 Jan, 2021, 4:49:50 PM
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
         <%
                    
                    if(request.getParameter("acid")!=null)
                    {
                        String edit="update tbl_requestclub set requestclub_vstatus='1' where requestclub_id='"+request.getParameter("acid")+"'";
                        if(con.executeCommand(edit))
                        {
                      
                        out.println("<script>alert('Accepted')</script>");
                        response.sendRedirect("Viewrequest.jsp?clubid="+request.getParameter("clubid")+"");
                        %> 
      <script type="text/javascript">
            alert("Accepted Successfully..");
            setTimeout(function(){window.location.href='Viewrequest.jsp?clubid='+request.getParameter("clubid")},100);
        </script>
     <%
                        
                        
                        
                        }
                    }
                        
                        if(request.getParameter("reid")!=null)
                        {
                            String edit1="update tbl_requestclub set requestclub_vstatus='2' where requestclub_id='"+request.getParameter("reid")+"'";
                            //out.println(edit1);
                            if(con.executeCommand(edit1))
                            {
                                %> 
      <script type="text/javascript">
            alert("Rejected");
            setTimeout(function(){window.location.href='Viewrequest.jsp?clubid='+request.getParameter("clubid")},100);
        </script>
     <%
                        
                            }
                        }
                    
                %>
                <form id="tab">
            
            <input type="hidden" name="club_id" value="<%= request.getParameter("clubid")%>">
        
        
        
            <h3 align="center">Shop Request</h3>
            <table border="1" align="center">
                <tr>
                    <th>No</th>
                    <th>Shop Name</th>
                    <th>Date Of Join</th>
                    <th>Shop Address</th>
                    <th colspan="2">Action</th>
                    
                </tr>
                <%
                    int i=0;
                    String sel="select * from tbl_requestclub rc inner join tbl_shop s on rc.shop_id=s.shop_id inner join tbl_club c on rc.club_id=c.club_id where c.club_id='"+request.getParameter("clubid")+"' and requestclub_vstatus='0'";
                    //out.println(sel);
                    ResultSet rs=con.selectCommand(sel);
                  while(rs.next())
                    {
                        i=i+1;
                %>
                <tr>
                    <td><%out.println(i);%></td>
                    <td><%=rs.getString("shop_name")%></td>
                    <td><%=rs.getString("requestclub_rdate")%></td>
                    <td><%=rs.getString("shop_address")%></td>
                    <td><a href="Viewrequest.jsp?acid=<%=rs.getString("requestclub_id")%>&clubid=<%= request.getParameter("clubid")%>">Accept</a></td>
                    <td><a href="Viewrequest.jsp?reid=<%=rs.getString("requestclub_id")%>&clubid=<%= request.getParameter("clubid")%>">Reject</a></td>
                </tr>
                <%
                
                    }
                  %>
               
            </table>
                  
                  <h3 align="center">User Request</h3>
            <table border="1" align="center">
                <tr>
                    <th>No</th>
                    <th>User Name</th>
                    <th>Date Of Join</th>
                    <th>User Address</th>
                    <th colspan="2">Action</th>
                    
                </tr>
                <%
                    int j=0;
                    String sel1="select * from tbl_requestclub rc inner join tbl_user u on rc.user_id=u.user_id inner join tbl_club c on rc.club_id=c.club_id where c.club_id='"+request.getParameter("clubid")+"' and requestclub_vstatus='0'";
                    //out.println(sel1);
                    ResultSet r=con.selectCommand(sel1);
                  while(r.next())
                    {
                        j=j+1;
                %>
                <tr>
                    <td><%out.println(j);%></td>
                    <td><%=r.getString("user_name")%></td>
                    <td><%=r.getString("requestclub_rdate")%></td>
                    <td><%=r.getString("user_address")%></td>
                    <td><a href="Viewrequest.jsp?acid=<%=r.getString("requestclub_id")%>&clubid=<%= request.getParameter("clubid")%>">Accept</a></td>
                    <td><a href="Viewrequest.jsp?reid=<%=r.getString("requestclub_id")%>&clubid=<%= request.getParameter("clubid")%>">Reject</a></td>
                </tr>
                <%
                
                    }
                  %>
               
            </table>
                  
                  <h3 align="center">Showroom Request</h3>
            <table border="1" align="center">
                <tr>
                    <th>No</th>
                    <th>Showroom Name</th>
                    <th>Date Of Join</th>
                    <th>Showroom Address</th>
                    <th colspan="2">Action</th>
                    
                </tr>
                <%
                    int p=0;
                    String sel2="select * from tbl_requestclub rc inner join tbl_showroom sh on rc.showroom_id=sh.showroom_id inner join tbl_club c on rc.club_id=c.club_id where c.club_id='"+request.getParameter("clubid")+"' and requestclub_vstatus='0'";
                    //out.println(sel2);
                    ResultSet s=con.selectCommand(sel2);
                  while(s.next())
                    {
                        p=p+1;
                %>
                <tr>
                    <td><%out.println(p);%></td>
                    <td><%=s.getString("showroom_name")%></td>
                    <td><%=s.getString("requestclub_rdate")%></td>
                    <td><%=s.getString("showroom_address")%></td>
                    <td><a href="Viewrequest.jsp?acid=<%=s.getString("requestclub_id")%>&clubid=<%= request.getParameter("clubid")%>">Accept</a></td>
                    <td><a href="Viewrequest.jsp?reid=<%=s.getString("requestclub_id")%>&clubid=<%= request.getParameter("clubid")%>">Reject</a></td>
                </tr>
                <%
                
                    }
                  %>
               
            </table>
        </form>
    </body>
</html>
<%@include file="Footer.jsp" %>