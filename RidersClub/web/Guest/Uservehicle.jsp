<%-- 
    Document   : Uservehicle
    Created on : 14 Jan, 2021, 3:15:05 PM
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
        <style type="text/css">
body {
	background-image: url(Template/img/background/user1.jpg);
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	margin-top: 160px;
}
      </style>
    </head>
    <body>
        <div id="tab" align="left">
        <form method="post" action="UservehUploadAction.jsp" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>Vehicle Category</td>
                    <td><select name="selcat" onchange="vecat(this.value)" required="required"><option value="">..Select..</option>
                            <%
                              String sel="select * from tbl_vehiclecat";
                              ResultSet ca=con.selectCommand(sel);
                              while(ca.next())
                              {
                              %>
                              <option value="<%=ca.getString("vehiclecat_id")%>"><%=ca.getString("vehiclecat_name")%></option>
                            <%
                              }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Vehicle Company</td>
                    <td><select name="selcompany" id="txtselcat" required="required"><option value="">..Select..</option>
                            
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Vehicle Name</td>
                    <td><input type="text" name="txtname" placeholder="Vehicle Name" autocomplete="off" required="required"></td>
                </tr>
                <tr>
                    <td>Model</td>
                    <td><input type="text" name="txtmodel" required="required" placeholder="Model" autocomplete="off"></td>
                </tr>
                <tr>
                    <td>User Photo</td>
                    <td><input type="file" name="txtphoto" required="required"></td>
                </tr>
                 <tr>
                    <td>Licence</td>
                    <td><input type="file" name="txtlicence" required="required"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="Submit">
                        <input type="reset" name="btnreset" value="Cancel"></td>
                </tr>
            </table>
        </form>
        </div>
    </body>
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
<%@include file='Footer.jsp' %>
</html>
