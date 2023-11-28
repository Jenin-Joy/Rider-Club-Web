<%-- 
    Document   : Groupmem
    Created on : 17 Feb, 2021, 2:35:41 PM
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
            String id=request.getParameter("id");
        %>
        <form id="tab">
            <h3 align="center">User Members</h3>
            <table border="1" align="center">
                <tr>
                    
                    <th>No</th>
                    <th>Members</th>
                    <th>Action</th>
                </tr>
                <%
                    int i=0;
                    String sel="select * from tbl_requestclub r inner join tbl_club c on r.club_id=c.club_id inner join tbl_user u on u.user_id=r.user_id where r.requestclub_vstatus='1' and c.club_id='"+request.getParameter("id")+"'";
                    //out.println(sel);
                    ResultSet rs=con.selectCommand(sel);
                    while(rs.next())
                    {
                        i++;
                %>
                <tr>
                    <td><%out.println(i);%></td>
                    <td><%=rs.getString("user_name")%></td>
                    <td><a href="ViewUserProfile.jsp?userid=<%=rs.getString("user_id")%>">View</a></td>
                </tr>
                        
                <%
                    }
                %>
            </table>
            
            <h3 align="center">Shop Members</h3>
            <table border="1" align="center">
                <tr>
                    
                    <th>No</th>
                    <th>Members</th>
                    <th>Action</th>
                </tr>
                <%
                    int j=0;
                    String sel1="select * from tbl_requestclub r inner join tbl_club c on r.club_id=c.club_id inner join tbl_shop s on r.shop_id=s.shop_id where r.requestclub_vstatus='1' and c.club_id='"+request.getParameter("id")+"'";
                    //out.println(sel1);
                    ResultSet r=con.selectCommand(sel1);
                    while(r.next())
                    {
                        j++;
                %>
                <tr>
                    <td><%out.println(j);%></td>
                    <td><%=r.getString("shop_name")%></td>
                    <td><a href="ViewShopProfile.jsp?shopid=<%=r.getString("shop_id")%>">View</a></td>
                </tr>
                        
                <%
                    }
                %>
            </table>
            
             <h3 align="center">Showroom Members</h3>
            <table border="1" align="center">
                <tr>
                    
                    <th>No</th>
                    <th>Members</th>
                    <th>Action</th>
                </tr>
                <%
                    int p=0;
                    String sel2="select * from tbl_requestclub r inner join tbl_club c on r.club_id=c.club_id inner join tbl_showroom sh on r.showroom_id=sh.showroom_id where r.requestclub_vstatus='1' and c.club_id='"+request.getParameter("id")+"'";
                   // out.println(sel2);
                    ResultSet s=con.selectCommand(sel2);
                    while(s.next())
                    {
                        i++;
                %>
                <tr>
                    <td><%out.println(i);%></td>
                    <td><%=s.getString("showroom_name")%></td>
                    <td><a href="ViewShowroomProfile.jsp?shid=<%=s.getString("showroom_id")%>">View</a></td>
                </tr>
                        
                <%
                    }
                %>
            </table>
        </form>
    </body>
</html>
<%@include file="Footer.jsp" %>