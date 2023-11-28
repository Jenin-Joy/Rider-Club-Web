<%-- 
    Document   : NewShowroom
    Created on : 20 Feb, 2021, 11:33:32 AM
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
    <h3 align="center">New Showroom</h3>
    <body>
        <%
            if(request.getParameter("accid")!=null)
            {
                String edit="update tbl_showroom set showroom_pstatus='1' where showroom_id='"+request.getParameter("accid")+"'";
                con.executeCommand(edit);
            
            }
            if(request.getParameter("rejid")!=null)
            {
                String edit1="update tbl_showroom set showroom_pstatus='2' where showroom_id='"+request.getParameter("rejid")+"'";
                con.executeCommand(edit1);
              
            }
        %>
        <form id="tab" style="overflow-x:auto">
            <table border="1" width="1800">
                <tr>
                    <th>No</th>
                    <th>Showroom Name</th>
                    <th width="250">Showroom Address</th>
                    <th>Showroom Contact</th>
                    <th>Showroom Email</th>
                    <th>Showroom Proof</th>
                    <th>Showroom Photo</th>
                    <th width="100">Date Of Join</th>
                    <th>District</th>
                    <th>Place</th>
                    <th width="100">Category</th>
                    <th>Company</th>
                    <th width="150">Action</th>
                </tr>
                <%
                    int i=0;
                    String sel="select * from tbl_showroom sh inner join tbl_vehiclecom vh on sh.vehiclecom_id=vh.vehiclecom_id inner join tbl_vehiclecat vc on vh.vehiclecat_id=vc.vehiclecat_id inner join tbl_place p on p.place_id=sh.place_id inner join tbl_district d on p.district_id=d.district_id where sh.showroom_pstatus='0'";
                    ResultSet rs=con.selectCommand(sel);
                    while(rs.next())
                    {
                        i++;
                %>
                <tr>
                    <td><%out.println(i);%></td>
                    <td><%=rs.getString("showroom_name")%></td>
                    <td><%=rs.getString("showroom_address")%></td>
                    <td><%=rs.getString("showroom_contact")%></td>
                    <td><a href="mailto:<%=rs.getString("showroom_email")%>"><%=rs.getString("showroom_email")%></td>
                    <td><img src="../Assets/Showroom/Showroom_proof/<%=rs.getString("showroom_proof")%>" height="100" width="100"></td>
                    <td><img src="../Assets/Showroom/Showroom_photo/<%=rs.getString("showroom_photo")%>" height="100" width="100" ></td>
                    <td><%=rs.getString("showroom_doj")%></td>
                    <td><%=rs.getString("district_name")%></td>
                    <td><%=rs.getString("place_name")%></td>
                    <td><%=rs.getString("vehiclecat_name")%></td>
                    <td><%=rs.getString("vehiclecom_name")%></td>
                    <td><a href="NewShowroom.jsp?accid=<%=rs.getString("showroom_id")%>">Accept</a>
                        <a href="NewShowroom.jsp?rejid=<%=rs.getString("showroom_id")%>">Reject</a></td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>
    </body>
</html>
