<%-- 
    Document   : BookShopParts
    Created on : 13 Mar, 2021, 11:56:42 AM
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
            String sel="",count="",partsrate="";
            sel="select * from tbl_vehicleparts where vehicleparts_id='"+session.getAttribute("pratsID")+"'";
            //out.println(sel);
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
                int vehiclepartsnum=Integer.parseInt(rs.getString("vehicleparts_number"));
                 count=rs.getString("vehicleparts_number");
                 partsrate=rs.getString("vehicleparts_amt");
        %>
          <%
           if(request.getParameter("btnsave")!=null)
           {
                String ins="insert into tbl_partsbooking(partsbooking_number,partsbooking_name,partsbooking_amount,user_id,shop_id,partsbooking_date)value('"+request.getParameter("txttotal")+"','"+request.getParameter("name")+"','"+request.getParameter("txttotalrate")+"','"+session.getAttribute("uid")+"','"+session.getAttribute("shopid")+"',curdate())";
             out.println(ins);
                if(con.executeCommand(ins))       
                {
                    System.out.println(request.getParameter("ttot"));
                    String edit="";
                    int tcount = Integer.parseInt(request.getParameter("ttot"));
                    System.out.print("Tcount"+tcount);
                    int ttot = Integer.parseInt(request.getParameter("txttotal"));
                    int total = tcount - ttot;
                    edit="update tbl_vehicleparts set vehicleparts_number ='"+total+"' where vehicleparts_id='"+session.getAttribute("pratsID")+"'";
                    con.executeCommand(edit);
                    
                    String sel2="select max(partsbooking_id) as id from tbl_partsbooking";
                    ResultSet rs2=con.selectCommand(sel2);
                    if(rs2.next())
                    {
                    response.sendRedirect("Payment1.jsp?id="+rs2.getString("id")+"");
                    }
                }
           }
        %>
        <form id="tab">
            <table border="1" align="center">
                <tr>
                    <td colspan="3"><img src="../Assets/Shop/VehicleParts_photo/<%=rs.getString("vehicleparts_photo")%>" width="200" height="200"></td>
                </tr>
                <tr>
                    <td>Parts Name</td>
                    <td colspan="2"><%=rs.getString("vehicleparts_name")%>
                    <input type="hidden" name="name" value="<%=rs.getString("vehicleparts_name")%>"</td>
                       
                </tr>
                <tr>
                    <td>Parts Rate</td>
                    <td colspan="2"><%=rs.getString("vehicleparts_amt")%></td>
                </tr>
                <tr>
                    <td>Number of Parts and Status</td>
                    <td><%=rs.getString("vehicleparts_number")%>
                        <input type="hidden" name="ttot" value="<%=rs.getString("vehicleparts_number")%>"</td>
                    <%
                    if((vehiclepartsnum)!=0)
                    {
                    %>
                    <td style="color: green">In Stock</td>
                    <%
                    }else{
                    %>
                    <td style="color: red">Out of Stock</td>
                    <%    
                    }
                    %>
                </tr>
            </table>
     
        <%
            }
            
        %>
        <br><br>
      
        <table align="center">
            <tr>
                <td>Number of Parts</td>
                <td><input id="demoInput" autocomplete="off" onchange="ticrate()" type="number" value="1" min="1" max="<%=count%>" name="txttotal"></td>
            </tr>
            <tr>
                <td>Per Part Rate</td>
                <td><input type="text" id="r" value="<%=partsrate%>" readonly="">
                    </td>
            </tr>
            <tr>
                <td>Total Rate</td>
                <td><input type="text" id="tot" value="<%=partsrate%>" readonly="" name="txttotalrate"></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" name="btnsave" value="Book"></td>
                </tr>
        </table>
        </form>
            <script>
  
   function ticrate()
   {
       //alert(rate);
       var rate = document.getElementById("demoInput").value;
       var r = document.getElementById("r").value;
       var tot = r * rate ;
       document.getElementById("tot").value=tot;
       
    }  
  
   </script>
    </body>
</html>
<%@include file="Footer.jsp" %>