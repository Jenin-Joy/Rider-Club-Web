<%-- 
    Document   : vechiclecomp
    Created on : 14 Jan, 2021, 2:52:01 PM
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
    <h3 align="center">Add Vehicle Company</h3>
    <body> 
        <%
            String cat="",com="",ins="",vehiclecomname="",vehiclecomid="",vehiclecatid="";
            if(request.getParameter("btnsave")!=null)
            {
                cat=request.getParameter("selcat");
                com=request.getParameter("txtcomp");
                if(request.getParameter("comname").equals(""))
                {
                ins="insert into tbl_vehiclecom(vehiclecom_name,vehiclecat_id)value('"+com+"','"+cat+"')";
                con.executeCommand(ins);
                response.sendRedirect("Vehiclecomp.jsp");
                }
                else
                {
                    String edit="update tbl_vehiclecom set vehiclecom_name='"+com+"',vehiclecat_id='"+cat+"' where vehiclecom_id='"+request.getParameter("comname")+"'";
                    con.executeCommand(edit);
                    response.sendRedirect("Vehiclecomp.jsp");
                }
            }
            
            if(request.getParameter("delid")!=null)
            {
                String del="delete from tbl_vehiclecom where vehiclecom_id='"+request.getParameter("delid")+"'";
                con.executeCommand(del);
                response.sendRedirect("Vehiclecomp.jsp");
            }
            
            if(request.getParameter("editid")!=null)
            {
                String sel="select * from tbl_vehiclecom c inner join tbl_vehiclecat ca on c.vehiclecat_id=ca.vehiclecat_id where vehiclecom_id='"+request.getParameter("editid")+"'";
                ResultSet ve=con.selectCommand(sel);
                while(ve.next())
                {
                    vehiclecomname=ve.getString("vehiclecom_name");
                    vehiclecomid=ve.getString("vehiclecom_id");
                    vehiclecatid=ve.getString("vehiclecat_id");
                }
            }
        %>
        <form method="post" id="tab">
            <table align="center">
                <tr>
                    <td>Category</td>
                    <td><select name="selcat">?<option>..Select..</option>
                        <%
                            String sel="select * from tbl_vehiclecat";
                            ResultSet ca=con.selectCommand(sel);
                            while(ca.next())
                            {
                        %>
                        <option value="<%=ca.getString("vehiclecat_id")%>" <%if(ca.getString("vehiclecat_id").equals(vehiclecatid)) {out.println("selected");}%>><%=ca.getString("vehiclecat_name")%></option>
                        <% 
                            }
                        %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Company</td>
                <input type="hidden" name="comname" value="<%=(vehiclecomid)%>">
                <td><input type="text" name="txtcomp" id="txtcomp" value="<%out.println(vehiclecomname);%>"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="Submit"><input type="reset" name="btncancel" value="Cancel"></td>
                </tr>
            </table>
                <brb><br>
                        <table align="center">
                            <tr>
                                <th>No</th>
                                <th>Vehicle Category</th> 
                                <th>Vehicle Company</th>
                                <th colspan="2">Action</th>
                            </tr>
                            <%
                            int i=0;
                            String sel1="select * from tbl_vehiclecom c inner join tbl_vehiclecat ca on c.vehiclecat_id=ca.vehiclecat_id";
                            ResultSet co=con.selectCommand(sel1);
                            while(co.next())
                            {
                                i=i+1;
                            %>
                            <tr>
                                <td><%out.println(i);%></td>
                                <td><%=co.getString("vehiclecat_name")%></td>
                                <td><%=co.getString("vehiclecom_name")%></td>
                                <td><a href="Vehiclecomp.jsp?delid=<%=co.getString("vehiclecom_id")%>">Delete</a></td>
                                <td><a href="Vehiclecomp.jsp?editid=<%=co.getString("vehiclecom_id")%>">Edit</a></td>
                            </tr>
                            <%
                            }
                            %>
                        </table>
        </form>
    </body>
</html>
