<%-- 
    Document   : ViewShopProfile
    Created on : 13 Mar, 2021, 4:40:45 PM
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
            String sel="select * from tbl_shop s inner join tbl_place p on s.place_id=p.place_id inner join tbl_district d on p.district_id=d.district_id where shop_id='"+request.getParameter("shopid")+"'";
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
        %>
        <form id="tab">
            <table align="center">
                <tr>
                    <td colspan="2" align="center"><img src="../Assets/Shop/Shop_logo/<%=rs.getString("shop_logo")%>" width="200" height="200"></td>
                </tr>
                <tr>
                    <td style="color: lightsteelblue">Shop Name</td>
                    <td><%=rs.getString("shop_name")%></td>
                </tr>
                <tr>
                    <td style="color: lightsteelblue">Shop Address</td>
                    <td><%=rs.getString("shop_address")%></td>
                </tr>
                <tr>
                    <td style="color: lightsteelblue">Shop Landmark</td>
                    <td colspan="2"><%=rs.getString("shop_landmar1")%>
                    <br><%=rs.getString("shop_landmar2")%></td>
                </tr>
                <tr>
                    <td style="color: lightsteelblue">Shop Email</td>
                    <td><a href="mailto:<%=rs.getString("shop_email")%>"><%=rs.getString("shop_email")%></td>
                </tr>
                <tr>
                    <td style="color: lightsteelblue">Shop Contact</td>
                    <td><%=rs.getString("shop_contact")%></td>
                </tr>
                <tr>
                    <td style="color: lightsteelblue">Shop District</td>
                    <td><%=rs.getString("district_name")%></td>
                </tr>
                <tr>
                    <td style="color: lightsteelblue">Shop Place</td>
                    <td><%=rs.getString("place_name")%></td>
                </tr>
          
                <tr><td> <a href="ViewShopParts.jsp?shid=<%=rs.getString("shop_id")%>">View Parts</a></td></tr>
            </table>
        </form>
        <%
            }
        %>
    </body>
</html>
<%@include file="Footer.jsp" %>