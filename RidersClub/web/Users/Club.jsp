<%-- 
    Document   : Club
    Created on : 14 Jan, 2021, 3:23:50 PM
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
       
         <form method="post" action="ClubUploadAction.jsp" enctype="multipart/form-data" id="tab">
            <table align="center">
                <tr>
                    <td>Club Name</td>
                    <td><input type="text" name="txtname" required="required" placeholder="Club Name" autocomplete="off"></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txtcontact" required="required" placeholder="Contact Number" autocomplete="off" pattern="[0-9]{10,12}" title="Enter valid number"></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txtemail" required="required" placeholder="Email" autocomplete="off"></td>
                </tr>
                <tr>
                    <td>District</td>
                    <td><select name="seldis" required="required"><option value="">..Select..</option>
                            <%
                              String sel="select * from tbl_district";
                              ResultSet rs=con.selectCommand(sel);
                              while(rs.next())
                              {
                            %>
                            <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                            <%
                              }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Club type</td>
                    <td><select name="seltype" required="required"><option value="">..Select..</option>
                            <%
                              String sel1="select * from tbl_clubtype";
                              ResultSet cl=con.selectCommand(sel1);
                              while(cl.next())
                              {
                            %>
                            <option value="<%=cl.getString("clubtype_id")%>"><%=cl.getString("clubtype_name")%></option>
                            <%
                              }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Logo</td>
                    <td><input type="file" name="txtlogo" id="txtlogo" required="required"></td>
                </tr>
                 <tr>
                    <td>Proof</td>
                    <td><input type="file" name="txtproof" id="txtproof" required="required"></td>
                </tr>
                <tr>
                    <td>Vehicle category</td>
                    <td><select name="selvecat" required="required"><option value="`">..Select..</option>
                            <%
                              String sel2="select * from tbl_vehiclecat";
                              ResultSet vecat=con.selectCommand(sel2);
                              while(vecat.next())
                              {
                            %>
                            <option value="<%=vecat.getString("vehiclecat_id")%>"><%=vecat.getString("vehiclecat_name")%></option>
                            <%
                              }
                            %>
                        </select>
                    </td>
                </tr>
                
               <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="Submit">
                        <input type="reset" name="btnreset" value="Cancel"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
<%@include file="Footer.jsp" %>