<%-- 
    Document   : vehiclecat
    Created on : 14 Jan, 2021, 2:50:14 PM
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
    <h3 align="center">Add Vehicle Category</h3>
    <body>
        <%
            String vcat="",ins="",vehiclecatname="",vehiclecatid="";
            if(request.getParameter("btnsave")!=null)
            {
                vcat=request.getParameter("txtvecat");
                if(request.getParameter("vename").equals(""))
                {
                ins="insert into tbl_vehiclecat(vehiclecat_name)value('"+request.getParameter("txtvecat")+"')";
                //out.println(ins);
                con.executeCommand(ins);
                response.sendRedirect("Vehiclecat.jsp");
                }
                else
                {
                    String edit="update tbl_vehiclecat set vehiclecat_name='"+vcat+"' where vehiclecat_id='"+request.getParameter("vename")+"'";
                    con.executeCommand(edit);
                    response.sendRedirect("Vehiclecat.jsp");
                }
            }
            
            if(request.getParameter("delid")!=null)
            {
                String del="delete from tbl_vehiclecat where vehiclecat_id='"+(request.getParameter("delid"))+"'";
                con.executeCommand(del);
                response.sendRedirect("Vehiclecat.jsp");
            }
            
            if(request.getParameter("editid")!=null)
            {
                String sel="select * from tbl_vehiclecat where vehiclecat_id='"+request.getParameter("editid")+"'";
                ResultSet ve=con.selectCommand(sel);
                while(ve.next())
                {
                    vehiclecatname=ve.getString("vehiclecat_name");
                    vehiclecatid=ve.getString("vehiclecat_id");
                }
            }
        %>
        <form method="post" id="tab">
            <table align="center">
                <tr>
                    <td>Vehicle category</td>
                <input type="hidden" name="vename" value="<%=(vehiclecatid)%>">
                    <td><input type="text" name="txtvecat" id="txtvecat" value="<%out.println(vehiclecatname);%>"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="Submit"><input type="reset" name="btncancel" value="Cancel"></td>
                </tr>
            </table>
                <br><br>
         <table align="center">
             <tr>
                 <th>No</th>
                 <th>Vehicle Category</th>
                 <th colspan="2">Action</th>
             </tr>
             <%
            int i=0;
            String sel="select * from tbl_vehiclecat";
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
                i=i+1;
             %>
             <tr>
                 <td><%out.println(i);%></td>
                 <td><%out.println(rs.getString("vehiclecat_name"));%></td>
                 <td><a href="Vehiclecat.jsp?delid=<%=rs.getString("vehiclecat_id")%>">Delete</a></td>
                 <td><a href="Vehiclecat.jsp?editid=<%=rs.getString("vehiclecat_id")%>">Edit</a></td>
             </tr>
             <%
            }
             %>
         </table>
        </form>
    </body>
</html>
