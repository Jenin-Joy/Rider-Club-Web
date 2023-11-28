<%-- 
    Document   : ManageShowRooms
    Created on : 23 Jan, 2021, 4:04:58 PM
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
    <h3 align="center">Add Showroom</h3>
    <body>
        <%
            if(request.getParameter("delid")!=null)
            {
                String del="delete from tbl_showroom where showroom_id='"+request.getParameter("delid")+"'";
                con.executeCommand(del);
            }
        %>
        <form method="post" action="ShowroomUploadAction.jsp" enctype="multipart/form-data" id="tab">
            <table align="center">
                <tr>
                    <td>District</td>
                    <td><select name="seldis" onchange="dis(this.value)"><option>..Select..</option>
                            <%
                              String sel="select * from tbl_district";
                              ResultSet di=con.selectCommand(sel);
                              while(di.next())
                              {
                              %>
                              <option value="<%=di.getString("district_id")%>"><%=di.getString("district_name")%></option>
                            <%
                              }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Place</td>
                    <td><select name="selpl" id="txtselpal">
                            <option>..Select..</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Vehicle category</td>
                    <td><select name="selcat" onchange="vecat(this.value)"><option>..Select..</option>
                            <%
                              String sel1="select * from tbl_vehiclecat";
                              ResultSet vecat=con.selectCommand(sel1);
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
                    <td>vehicle company</td>
                    <td><select name="selcat" id="txtselcat">
                            <option>..Select..</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Showroom Name</td>
                    <td><input type="text" name="txtname"></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><textarea name="txtaddress"></textarea></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txtcontact"></td>
                </tr>
                <tr>
                    <td>Email ID</td>
                    <td><input type="email" name="txtemail"></td>
                </tr>
                <tr>
                    <td>Proof</td>
                    <td><input type="file" name="txtproof"></td>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td><input type="file" name="txtphoto"></td>
                </tr>
                <tr>
                    <td colspan="2" align='center'><input type="submit" name="btnsave" value="Submit"><input type="reset" name="btncancel" value="Cancel"></td>
                </tr>
            </table>
        </form>
    </body>
    <script src="../JQuery/jQuery.js" type="text/javascript"></script>
<script>
function dis(a)
{
	//alert(a);
	$.ajax({url:"Ajaxplace.jsp?disid="+a,
	success: function(result){
            //alert(result);
	$("#txtselpal").html(result);}});
}
</script>
<script src="../JQuery/jQuery.js" type="text/javascript"></script>
<script>
function vecat(a)
{
	//alert(a);
	$.ajax({url:"Ajaxcategory.jsp?catid="+a,
	success: function(result){
            //alert(result);
	$("#txtselcat").html(result);}});
}
</script>


</html>
