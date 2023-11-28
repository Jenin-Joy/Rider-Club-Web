<%-- 
    Document   : Viewshowroom
    Created on : 24 Jan, 2021, 4:24:44 PM
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
        <form id="tab">
            <table  align="center" width="600">
                <tr>
                    <td>District<select name="seldis" onchange="dis(this.value)"><option>..Select..</option>
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
               
                <td>Place<select name="txtplace" id="txtselpal"><option>..Select..</option></select></td>
                
                    <td colspan="2" align="center" width="300"><input type="submit" name="btnsave" value="Search"></td>
                </tr>
            </table>
        
                        <%
                              
                              
                              if(request.getParameter("btnsave")!=null)
                              {
                                  
                        %>
            <table border='1'align="center">
    <tr>
        <th>No</th>
        <th>Photo</th>
        <th>Showroom Name</th>
        <th colspan="2" align="center">Action</th>
      
    </tr>
    <%
    
                              int i=0;
                              String sel2="select * from tbl_showroom sh inner join tbl_place p on p.place_id=sh.place_id inner join tbl_district d on d.district_id=p.district_id inner join tbl_vehiclecom vc on vc.vehiclecom_id=sh.vehiclecom_id inner join tbl_vehiclecat vcat on vcat.vehiclecat_id=vc.vehiclecat_id where sh.place_id='"+request.getParameter("txtplace")+"'";
                              //out.println(sel2);
                              ResultSet sh=con.selectCommand(sel2);
                              while(sh.next())
                              {
                                  i=i+1;
    %>
         <tr>
             <td><%out.println(i);%></td>
             <td><img src="../Assets/Showroom/Showroom_photo/<%=sh.getString("showroom_photo")%>" height="100" width="100"></td>
             <td><%=sh.getString("showroom_name")%></td>
             <td><a href="ViewShowroomProfile.jsp?shid=<%=sh.getString("showroom_id")%>">View</a></td>
            
        
    </tr>  
    <%
                              }
                              }
    %>
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
</html>
<%@include file="Footer.jsp" %>