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
        
        <form method="post" action="VehiclepartsUploadAction.jsp" enctype="multipart/form-data" id="tab">
            
            <table  align="center">
                <tr>
                    <td>Parts Name</td>
                    <td><input type="text" name="txtparts" required="required" placeholder="Parts Name" ></td>
                </tr>
                <tr>
                    <td>Add Parts Photo</td>
                    <td><input type="file" name="txtphoto" required="required"></td>
                </tr>
                <tr>
                    <td>Amount</td>
                    <td><input type="text" name="txtamt" placeholder="Amount" required="required" autocomplete="off"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="Add"></td>
                </tr>
            </table>
        
       
        <table border="1"  align="center">
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
            String sel1="select * from tbl_vehicleparts where shop_id='"+session.getAttribute("shopid")+"'";
            ResultSet in=con.selectCommand(sel1);
            while(in.next())
            {
                int vehiclenumber=Integer.parseInt(in.getString("vehicleparts_number"));
                i++;
            %>
            <tr>
                <td><%out.println(i);%></td>
                <td><%=in.getString("vehicleparts_name")%></td>
                <td><img src="../Assets/Shop/VehicleParts_photo/<%=in.getString("vehicleparts_photo")%>" height="200" width="200"></td>
                <td><%=in.getString("vehicleparts_amt")%></td>
                <%
                if((vehiclenumber)!= 0)
                {
                %>
                <td><%=in.getString("vehicleparts_number")%></td>
                <%
                }else{
                %>
                <td style="color: red">Out of Stock</td>
                <%
                }
                %>
                <td><a href="AddStock.jsp?id=<%=in.getString("vehicleparts_id")%>">Add Stock</a></td>
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