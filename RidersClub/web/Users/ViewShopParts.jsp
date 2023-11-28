<%-- 
    Document   : ViewParts
    Created on : 11 Mar, 2021, 12:15:34 PM
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
        
          if(request.getParameter("partsid")!=null)
            {
                session.setAttribute("pratsID", request.getParameter("partsid"));
                response.sendRedirect("BookShopParts.jsp");
            }
        %>
        
        
        
        
        
        
        
        
        
        
        
        
        <%
            String sel1="select * from tbl_shop where shop_id='"+request.getParameter("shid")+"'";
            ResultSet r=con.selectCommand(sel1);
            while(r.next())
            {
        %>
        <h3><%//=r.getString("shop_name")%></h3>
        <%
            }
        %>
        <form id="tab">
            <table border="1" align="center">
                <tr>
                    <th>No</th>
                    <th>Parts Name</th>
                    <th>Parts Photo</th>
                    <th>Stock</th>
                     <th>Total Parts</th>
                <th>Rate pre parts</th>
                    <th>Action</th>
                </tr>
                <%
                    int i=0;
                    String sel="";
                    sel="select * from tbl_vehicleparts v inner join tbl_shop s on v.shop_id=s.shop_id where v.shop_id='"+request.getParameter("shid")+"'";
                    ResultSet rs=con.selectCommand(sel);
                    while(rs.next())
                    {
                        session.setAttribute("shopid",request.getParameter("shid"));
                        String name=rs.getString("shop_name");
                        i++;
                %>
                <tr>
                    <td><%out.println(i);%></td>
                    <td><%=rs.getString("vehicleparts_name")%></td>
                    <td><img src="../Assets/Shop/VehicleParts_photo/<%=rs.getString("vehicleparts_photo")%>" width="100" height="100"></td>
                    <%

                int status=Integer.parseInt(rs.getString("vehicleparts_number"));
                //out.println(status);
                    if((status)!=0)
                    {
                     %>
                    <td style="color: green">In Stock</td>
                    <%   
                    }
                    else 
                    {
                    %>
                    <td style="color: red">Out Of Stock</td>
                    <%   
                    }
                    %>
                    <td><%=rs.getString("vehicleparts_number")%></td>
                <td><%=rs.getString("vehicleparts_amt")%></td>
                <%
                if(rs.getString("vehicleparts_number").equals("0"))
                {
                %>
                <td style="color: red">Closed</td>
                <%
                }else{
                %>
                    <td><a href="ViewShopParts.jsp?partsid=<%=rs.getString("vehicleparts_id")%>">Book</a></td>
                </tr>
                <%
                    }}
                %>
            </table>
        </form>
    </body>
</html>
<%@include file="Footer.jsp" %>