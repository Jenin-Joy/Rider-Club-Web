<%-- 
    Document   : ViewFeedBack
    Created on : 10 Mar, 2021, 4:18:54 PM
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
    <h3 align="center">Feed Back</h3>
    <body>
        <%
            if(request.getParameter("delid")!=null)
            {
                String del="delete from tbl_feedback where feedback_id='"+request.getParameter("delid")+"'";
                con.executeCommand(del);
            }
        %>
        <h3 align="center">User Feed Back</h3>
        <form id="tab">
            <table border="1" align="center">
                <tr>
                    <th>No</th>
                    <th>User Name</th>
                    <th>Feed Back</th>
                    <th>Action</th>
                </tr>
                <%
                    int i=0;
                    String sel="select * from tbl_feedback f inner join tbl_user u on f.user_id=u.user_id";
                    ResultSet rs=con.selectCommand(sel);
                    while(rs.next())
                    {
                        i++;
                %>
                <tr>
                    <td><%out.println(i);%></td>
                    <td><%=rs.getString("user_name")%></td>
                    <td><%=rs.getString("feedback_condent")%></td>
                    <td><a href="ViewFeedBack.jsp?delid=<%=rs.getString("feedback_id")%>">Delete</a></td>
                </tr>
                <%  
                    }
                %>
            </table>
       
            
            <h3 align="center">Shop Feed Back</h3>
        
            <table border="1" align="center">
                <tr>
                    <th>No</th>
                    <th>Shop Name</th>
                    <th>Feed Back</th>
                    <th>Action</th>
                </tr>
                <%
                    int j=0;
                    String sel1="select * from tbl_feedback f inner join tbl_shop s on f.shop_id=s.shop_id";
                    ResultSet r=con.selectCommand(sel1);
                    while(r.next())
                    {
                        j++;
                %>
                <tr>
                    <td><%out.println(j);%></td>
                    <td><%=r.getString("shop_name")%></td>
                    <td><%=r.getString("feedback_condent")%></td>
                    <td><a href="ViewFeedBack.jsp?delid=<%=r.getString("feedback_id")%>">Delete</a></td>
                </tr>
                <%  
                    }
                %>
            </table>
        
            
            <h3 align="center">Showroom Feed Back</h3>
        
            <table border="1" align="center">
                <tr>
                    <th>No</th>
                    <th>Showroom Name</th>
                    <th>Feed Back</th>
                    <th>Action</th>
                </tr>
                <%
                    int p=0;
                    String sel2="select * from tbl_feedback f inner join tbl_showroom sh on f.showroom_id=sh.showroom_id";
                    ResultSet s=con.selectCommand(sel2);
                    while(s.next())
                    {
                        p++;
                %>
                <tr>
                    <td><%out.println(p);%></td>
                    <td><%=s.getString("showroom_name")%></td>
                    <td><%=s.getString("feedback_condent")%></td>
                    <td><a href="ViewFeedBack.jsp?delid=<%=s.getString("feedback_id")%>">Delete</a></td>
                </tr>
                <%  
                    }
                %>
            </table>
        </form>
    </body>
</html>
