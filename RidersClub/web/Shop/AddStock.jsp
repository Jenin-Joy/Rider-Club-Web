<%-- 
    Document   : AddStock
    Created on : 11 Mar, 2021, 4:01:14 PM
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
    </head>
    <body>
        <%
            String partsid=request.getParameter("id");
            //out.println(partsid);
            String sel="select * from tbl_vehicleparts where vehicleparts_id='"+request.getParameter("txthistock")+"'";
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
                int oldstock=Integer.parseInt(rs.getString("vehicleparts_number"));
               
            //out.print(oldstock);
            
            if(request.getParameter("btnsave")!=null)
            {
                int tot=oldstock+Integer.parseInt(request.getParameter("txtstock"));
                String up="update tbl_vehicleparts set vehicleparts_number='"+tot+"' where vehicleparts_id='"+request.getParameter("txthistock")+"'";
               // out.println(up);
                if(con.executeCommand(up))
                {
                    %><script type="text/javascript">
            alert("Stock Updated..");
            setTimeout(function(){window.location.href='VehicleParts.jsp'},100);
        </script><%
                    
                }else
                {
                    out.println("<script>alert('Error')</script>");
                }
                %> <%
            }}
        %>
        <form id="tab">
            <table  align="center">
                <tr>
                    <td>Add Stock</td>
                    <td><input type="text" name="txtstock" placeholder="Stock" required="required">
                        <input type="hidden" name="txthistock" value="<%=partsid%>"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="Add"><input type="reset"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
<%@include file='Footer.jsp' %>
