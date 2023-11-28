<%-- 
    Document   : shop
    Created on : 14 Jan, 2021, 2:54:54 PM
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
	background-image: url(Template/img/background/shop.jpg);
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	margin-top: 160px;
}
      </style>
    </head>
    <body>
        <div id="tab" align="right">
        <form method="post" action="ShopUploadAction.jsp" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" autocomplete="off" placeholder="Shop Name" required="required"></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txtcon" autocomplete="off" placeholder="Contact" required="required" pattern="[0-9]{10,12}" title="Enter valid Number">
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txtemail" autocomplete="off" required="required" placeholder="Email"></td>
                </tr>
                <tr>
                    <td>District</td>
                    <td><select name="seldis"  onchange="dis(this.value)" required="required"><option value="">..Select..</option>
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
                    <td>place</td>
                    <td><select name="selpl" id="txtselpal" required="required"><option value="">..Select..</option></select></td>
                </tr>
                 <tr>
                    <td>Land mark 1</td>
                    <td><input type="text" name="txtlan1" autocomplete="off" placeholder="Land Mark 1" required="required"></td>
                </tr>
                 <tr>
                    <td>Land mark 2</td>
                    <td><input type="text" name="txtlan2" autocomplete="off" placeholder="Land Mark 2" required="required"></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><textarea name="txtaddress" placeholder="Address" required="required"></textarea></td>
                </tr>
                <tr>
                    <td>Shop type</td>
                    <td><select name="slctdty" required="required"><option value="">..Select..</option>
                            <%
                              String sel1="select * from tbl_shoptype";
                              ResultSet cl=con.selectCommand(sel1);
                              while(cl.next())
                              {
                            %>
                            <option value="<%=cl.getString("shoptype_id")%>"><%=cl.getString("shoptype_name")%></option>
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
                    <td>License no</td>
                    <td><input type="text" name="txtlic" required="required" autocomplete="off" placeholder="License Number"></td>
                </tr>
                <tr>
                    <td>User Name</td>
                    <td><input type="text" name="txtusname" placeholder="User Name" autocomplete="off" required="required"></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="txtpass" placeholder="Password" autocomplete="off" required="required" pattern="[a-zA-Z0-9]{5-20}" title="Enter at least 8 character"></td>
                </tr>
                <tr>
                    <td>Re-password</td>
                    <td><input type="password" name="txtrepass" placeholder="Re-Password" autocomplete="off" required="required" pattern="[a-zA-Z0-9]{5-20}" title="Enter at least 8 character"></td>
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
function dis(a)
{
	//alert(a);
	$.ajax({url:"Ajaxplace.jsp?disid="+a,
	success: function(result){
            //alert(result);
	$("#txtselpal").html(result);}});
}
</script>
<%@include file='Footer.jsp' %>
</html>
