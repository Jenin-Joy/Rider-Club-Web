<%-- 
    Document   : Acceptlist
    Created on : 25 Jan, 2021, 5:20:53 PM
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
           if(request.getParameter("rejectedid")!=null)
           {
                String edit="update tbl_requestclub set requestclub_vstatus='2' where requestclub_id='"+request.getParameter("rejectedid")+"' ";
            if(con.executeCommand(edit))
            {
                %> 
      <script type="text/javascript">
            alert("Rejected");
            setTimeout(function(){window.location.href='Myclub.jsp'},100);
        </script>
     <%
            }
           }
        %>
        
        <h3 align="center">Shop List</h3>
        <form id="tab">
            <table border="1" align="center">
                <tr>
                     <th>No</th>
                    <th>Shop Name</th>
                    <th>Date Of Join</th>
                    <th>Shop Address</th>
                    <th>Action</th>
                </tr>
        <%
            int i=0;
            String clubid="",sel="";
             sel="select * from tbl_requestclub rc inner join tbl_shop s on rc.shop_id=s.shop_id inner join tbl_club c on rc.club_id=c.club_id where c.user_id='"+session.getAttribute("uid")+"' and requestclub_vstatus='1' and rc.club_id='"+request.getParameter("cid")+"'";
          // out.println(sel);
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
                     <td><a href="Acceptlist.jsp?rejectedid=<%=rs.getString("requestclub_id")%>">Reject</a></td>
                </tr>
            
        <%
            }
        %>
        </table>
        </form>
        <h3 align="center">Showroom List</h3>
        <form id="tab">
            <table align="center" border="1">
                <tr>
                    <th>No</th>
                    <th>Showroom Name</th>
                    <th>Date of Join</th>
                    <th>Showroom Address</th>
                    <th>Action</th>
                </tr>
                <%
            int j=0;
            String sel1="select * from tbl_requestclub rc inner join tbl_showroom s on rc.showroom_id=s.showroom_id inner join tbl_club c on rc.club_id=c.club_id where c.user_id='"+session.getAttribute("uid")+"' and requestclub_vstatus='1' and rc.club_id='"+request.getParameter("cid")+"'";
            ResultSet r=con.selectCommand(sel1);
            while(r.next())
            {
                j=j+1;
        %>
        
                <tr>
                    <td><%out.println(i);%></td>
                    <td><%=r.getString("showroom_name")%></td>
                    <td><%=r.getString("requestclub_rdate")%></td>
                    <td><%=r.getString("showroom_address")%></td>
                     <td><a href="Acceptlist.jsp?rejectedid=<%=r.getString("requestclub_id")%>">Reject</a></td>
                </tr>
            
        <%
            }
        %>
            </table>
        </form>
       
        
        
        <h3 align="center">User List</h3>
        
        <form id="tab">
            <table border="1" align="center">
                <tr>
                     <th>No</th>
                    <th>User Name</th>
                    <th>Date Of Join</th>
                    <th>User Address</th>
                    <th>Action</th>
                </tr>
        <%
            int p=0;
            String sel2="select * from tbl_requestclub rc inner join tbl_user u on rc.user_id=u.user_id inner join tbl_club c on rc.club_id=c.club_id where c.user_id='"+session.getAttribute("uid")+"' and requestclub_vstatus='1' and rc.club_id='"+request.getParameter("cid")+"'";
            ResultSet s=con.selectCommand(sel2);
            while(s.next())
            {
                p=p+1;
        %>
        
                <tr>
                    <td><%out.println(p);%></td>
                    <td><%=s.getString("user_name")%></td>
                    <td><%=s.getString("requestclub_rdate")%></td>
                    <td><%=s.getString("user_address")%></td>
                    <td><a href="Acceptlist.jsp?rejectedid=<%=s.getString("requestclub_id")%>">Reject</a></td>
                </tr>
            
        <%
            }
        %>
        </table>
        </form>
    </body>
</html>
<%@include file="Footer.jsp" %>