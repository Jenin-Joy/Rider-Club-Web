<%-- 
    Document   : User
    Created on : 13 Jan, 2021, 7:57:15 PM
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
	background-image: url(Template/img/background/user.jpg);
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	margin-top: 160px;
}
      </style>
    </head>
    <body>
        <div id="tab" align="right">
        <%
            String name="",contact="",email="",gen="",dis="",pla="",bio="",address="",usname="",pass="",repass,ins="";
            if(request.getParameter("btnsave")!=null)
            {
                name=request.getParameter("txtname");
                contact=request.getParameter("txtcontact");
                email=request.getParameter("txtemail");
                gen=request.getParameter("gender");
                pla=request.getParameter("selpl");
                bio=request.getParameter("txtbio");
                address=request.getParameter("txtaddress");
                usname=request.getParameter("txtusname");
                pass=request.getParameter("txtpass");
                repass=request.getParameter("txtrepass");
                ins="insert into tbl_user(user_name,user_contact,user_email,user_gen,user_bio,user_address,user_username,user_password,place_id,user_doj)value('"+name+"','"+contact+"','"+email+"','"+gen+"','"+bio+"','"+address+"','"+usname+"','"+pass+"','"+pla+"',curdate())";
                out.println(ins);
                if(con.executeCommand(ins))
                {
                response.sendRedirect("Uservehicle.jsp");
                }
            }
        %>
        <form>
            <table>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" placeholder=" Name" autocomplete="off" required="required"></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txtcontact" placeholder="Contact" autocomplete="off" required="required" pattern="[0-9]{10,12}" title="Enter a valid number"></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txtemail" required="required" placeholder="Email Id" autocomplete="off"></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td><input type="radio" name="gender" value="male" required="required">Male
                        <input type="radio" name="gender" value="female">Female
                    </td>
                </tr>
                <tr>
                    <td>District</td>
                    <td><select name="seldis" onchange="dis(this.value)" required="required"><option value="">..Select..</option>
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
                    <td><select name="selpl" id="txtselpal" required="required">
                            <option value="">..Select..</option>
                             
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Bio</td>
                    <td><textarea name="txtbio" required="required" placeholder="Bio"></textarea></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><textarea name="txtaddress" required="required" placeholder="Address"></textarea></td>
                </tr>
                <tr>
                    <td>User Name</td>
                    <td><input type="text" name="txtusname" required="required" autocomplete="off" placeholder="User Name"></td>
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
                    <td colspan="2" align="center"><a href="Uservehicle.jsp"><input type="submit" name="btnsave" value="Next"></a>
                        </td>
                </tr>
            </table>
        </form>
                       
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
        </div>
    </body>
    <%@include file='Footer.jsp' %>
</html>
