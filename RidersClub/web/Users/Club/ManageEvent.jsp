<%-- 
    Document   : ManageEvent
    Created on : 25 Feb, 2021, 2:11:05 PM
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
            if(request.getParameter("clubid")!=null)
            {
                session.setAttribute("cid",request.getParameter("clubid"));
            }
        %>
        
        <form method="post" action="EventUploadAction.jsp" enctype="multipart/form-data" id="tab"   >
            <table align="center">
                <tr>
                    <td>Event Name</td>
                    <td><input type="text" name="txtname" required="required" autocomplete="off" placeholder="Event Name"></td>
                </tr>
                <tr>
                    <td>District</td>
                    <td><select name="seldis" onchange="dis(this.value)" required="required">
                            <option value="">..Select..</option>
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
                    <td>Location</td>
                    <td><textarea name="txtlocation" required="required" placeholder="Location name"></textarea></td>
                </tr>
                <tr>
                    <td>Land Mark 1</td>
                    <td><input type="text" name="txtlan1" required="required" placeholder="Land Mark 1" autocomplete="off"></td>
                </tr>
                <tr>
                    <td>Land Mark 2</td>
                    <td><input type="text" name="txtlan2" required="required" placeholder="Land Mark 2" autocomplete="off"></td>
                </tr>
                <tr>
                    <td>Logo</td>
                    <td><input type="file" name="txtlogo" required="required"></td>
                </tr>
                <tr>
                    <td>Duration</td>
                    <td><input type="text" name="txtdur" required="required" placeholder="Duration" autocomplete="off"></td>
                </tr>
                <tr>
                    <td>Event type</td>
                    <td><select name="selevtype" required="required"><option value="">..Select..</option>
                        <%
                              String sel1="select *from tbl_eventtype";
                              ResultSet rs=con.selectCommand(sel1);
                              while(rs.next())
                              {
                        %>
                        <option value="<%=rs.getString("eventtype_id")%>"><%=rs.getString("eventtype_name")%></option>
                        <%
                              }
                        %>
                        </select></td>
                </tr>
                <tr>
                    <td>Start Date</td>
                    <td><input type="date" name="txtstdate" required="required"></td>
                </tr>
                <tr>
                    <td>Rules and Regulation</td>
                    <td><input type="file" name="txtrules" required="required"></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txtcontact" required="required" placeholder="Contact Number" autocomplete="off" pattern="[0-9]{10,12}" title="Enter a valid number"></td>
                </tr>
                <tr>
                    <td>Ticket Available</td>
                    <td><input type="radio" name="txtticket" value="yes" required="required">Yes
                        <input type="radio" name="txtticket" value="no">No</td>
                </tr>
                <tr>
                    <td>Total Tickets</td>
                    <td><input type="text" name="txttotal" required="required" placeholder="Total tickets" autocomplete="off"></td>
                </tr>
                <tr>
                    <td>Rate per Tickets</td>
                    <td><input type="text" name="txtrate" required="required" placeholder="Rate" autocomplete="off"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="Create Event"></td>
                </tr>
            </table>
        </form>
                        <script src="../../JQuery/jQuery.js" type="text/javascript"></script>
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
    </body>
</html>
<%@include file="Footer.jsp" %>