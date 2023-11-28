<%-- 
    Document   : ViewShowroomProfile
    Created on : 9 Feb, 2021, 8:15:17 PM
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
            String sel="select * from tbl_showroom sh inner join tbl_vehiclecom ve on sh.vehiclecom_id=ve.vehiclecom_id inner join tbl_vehiclecat vc on ve.vehiclecat_id=vc.vehiclecat_id inner join tbl_place p on p.place_id=sh.place_id inner join tbl_district d on d.district_id=p.district_id where sh.showroom_id='"+request.getParameter("shid")+"'";   
            //out.println(sel);
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
        %>
        <form id="tab">
            <table align="center">
                <tr>
                    <td colspan="2"><img src="../Assets/Showroom/Showroom_photo/<%=rs.getString("showroom_photo")%>" height="200" width="200"></td>
                </tr>
                <tr>
                    <td style="color: lightsteelblue">Showroom Name</td>
                <td><%=rs.getString("showroom_name")%></td>
                </tr>
                <tr>
                    <td style="color: lightsteelblue">Showroom Address</td>
                <td><%=rs.getString("showroom_address")%></td>
                </tr>
                <tr>
                    <td style="color: lightsteelblue">Showroom Contact</td>
                <td><%=rs.getString("showroom_contact")%></td>
                </tr>
                <tr>
                    <td style="color: lightsteelblue">Showroom Email</td>
                    <td><a href="mailto:<%=rs.getString("showroom_email")%>"><%=rs.getString("showroom_email")%></td>
                </tr>   
                <tr>
                    <td style="color: lightsteelblue">Showroom Company</td>
                    <td><%=rs.getString("vehiclecom_name")%></td>
                </tr>
                <tr>
                    <td style="color: lightsteelblue">Showroom Category</td>
                    <td><%=rs.getString("vehiclecat_name")%></td>
                </tr>
                <tr>
                    <td style="color: lightsteelblue">Showroom District</td>
                <td><%=rs.getString("district_name")%></td>
                </tr>
                <tr><td style="color: lightsteelblue">Showroom Place</td>
                <td><%=rs.getString("place_name")%></td> 
                </tr>
            
                <tr><td><a href="ViewShowroomParts.jsp?shroomid=<%=rs.getString("showroom_id")%>">View Parts</a></td></tr>
            </table>
        </form>
                <%
            }
                %>
    </body>
</html>
<%@include file="Footer.jsp" %>