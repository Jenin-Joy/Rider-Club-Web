<%-- 
    Document   : ViewUserGallery
    Created on : 14 Mar, 2021, 8:07:07 PM
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
        <form id="tab">
            <table align="center">
            <tr>
            <%
                String sel="",userphoto="";
                int i=0; 
                
                sel="select * from tbl_usergallery where user_id='"+request.getParameter("usid")+"'";
              // out.println(sel);
                ResultSet rs=con.selectCommand(sel);
                while(rs.next())
                {
                    i++;
                    userphoto=rs.getString("usergallery_photo");
                    %>
            
             
                <td><img src="../Assets/User/UserGallery/<%=userphoto%>" height="300" width="200"></td>
           
            
            <%
            
                    if(i==4)
                    {
                        out.println("</tr><tr>");
                        i=0;
                      
                       
                        
                    }
                   
                }
                
                if(request.getParameter("r")!=null)
                {
                    
                    response.sendRedirect("UserGallery.jsp");
                }
               
            %>
          
        </table>
        </form>
    </body>
</html>
<%@include file='Footer.jsp' %>