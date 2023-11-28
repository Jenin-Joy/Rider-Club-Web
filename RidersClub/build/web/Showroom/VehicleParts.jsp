<%-- 
    Document   : VehicleParts
    Created on : 23 Jan, 2021, 4:01:54 PM
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
    <body align="center"> 
        
        <form method="post" action="VehiclepartsUploadAction.jsp" enctype="multipart/form-data" id='tab'>
            
            <table align='center'>
                <tr>
                    <td>Add Parts</td>
                    <td><input type="text" name="txtparts" required="required" placeholder="Add Parts"></td>
                </tr>
                <tr>
                    <td>Add Parts Photo</td>
                    <td><input type="file" name="txtphoto" required="required"></td>
                </tr>
                <tr>
                    <td>Amount</td>
                    <td><input type="text" name="txtamt" required="required" placeholder="Amount"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="Add"></td>
                </tr>
            </table>
        
        <table border="1" align='center'>
            <tr>
                <th>NO</th>
                <th>Parts Name</th>
                <th>Parts Photo</th>
                <th>Amount</th>
                <th>Stock</th>
                <th>Action</th>
            </tr>
            <% 
            int i=0;
            String parts="",sel="";
            sel="select *from tbl_vehicleparts where showroom_id='"+session.getAttribute("shroomid")+"'";
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
                int vehiclenumber=Integer.parseInt(rs.getString("vehicleparts_number"));
                i++;
                parts=rs.getString("vehicleparts_name");
            %> 
            <tr>
                <td><%out.println(i);%></td>
                <td><%=rs.getString("vehicleparts_name")%></td>
                <td><img src="../Assets/Showroom/VehicleParts_photo/<%=rs.getString("vehicleparts_photo")%>" height="200" width="200"></td>
                <td><%=rs.getString("vehicleparts_amt")%></td>
                <%
                if((vehiclenumber)!= 0)
                {
                %>
                <td><%=rs.getString("vehicleparts_number")%></td>
                <%
                }else{
                %>
                <td style="color: red">Out of Stock</td>
                <%
                }
                %>
                <td><a href="AddStock.jsp?id=<%=rs.getString("vehicleparts_id")%>">Add Stock</a></td>
            </tr>
            <%
            }
            %>
           
        </table>
           
        </form>
            <a href="ViewBooking.jsp">Booking</a>
    </body>
</html>
<%@include file='Footer.jsp' %>