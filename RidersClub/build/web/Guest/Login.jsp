<%-- 
    Document   : Login
    Created on : 13 Jan, 2021, 8:32:08 PM
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
	background-image: url(Template/img/background/DYlJKo.jpg);
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	margin-top: 280px;
}
            </style>
    </head>
    <body>
        <%
            if(request.getParameter("btnsave")!=null)
            {
                String sel="",sel1="",sel2="",sel3="";
            sel="select * from tbl_user where user_username='"+request.getParameter("txtusname")+"' and user_password='"+request.getParameter("txtpass")+"'";
            //out.println(sel);
            ResultSet us=con.selectCommand(sel);
            
            sel2="select * from tbl_shop where shop_username='"+request.getParameter("txtusname")+"' and shop_password='"+request.getParameter("txtpass")+"'";
             ResultSet us1=con.selectCommand(sel2);
            
            sel1="select * from tbl_admin where admin_name='"+request.getParameter("txtusname")+"' and admin_password='"+request.getParameter("txtpass")+"'";
             ResultSet us2=con.selectCommand(sel1);
             
             sel3="select * from tbl_showroom where showroom_username='"+request.getParameter("txtusname")+"' and showroom_password='"+request.getParameter("txtpass")+"'";
             ResultSet us3=con.selectCommand(sel3);
             
            
            if(us.next())
            {
                 if(us.getString("user_pstatus").equals("0"))
                {
                     %> 
      <script type="text/javascript">
            alert("Your Registration is Pending");
            setTimeout(function(){window.location.href='Login.jsp'},100);
        </script>
     <%
                }
                else if(us.getString("user_pstatus").equals("2"))
                {
                     %> 
      <script type="text/javascript">
            alert("Your Registration is Rejected");
            setTimeout(function(){window.location.href='Login.jsp'},100);
        </script>
        <%
                }
                else
                {
               session.setAttribute("uid", us.getString("user_id"));
               session.setAttribute("uname", us.getString("user_name"));
               response.sendRedirect("../Users/HomePage.jsp");
                }
            }
            else if(us1.next())
            {
                if(us1.getString("shop_pstatus").equals("0"))
                {
                     %> 
      <script type="text/javascript">
            alert("Your Registration is Pending");
            setTimeout(function(){window.location.href='Login.jsp'},100);
        </script>
     <%
                }
                else if(us1.getString("shop_pstatus").equals("2"))
                {
                     %> 
      <script type="text/javascript">
            alert("Your Registration is Rejected");
            setTimeout(function(){window.location.href='Login.jsp'},100);
        </script>
     <%
                }
                else
                {
                session.setAttribute("shopid", us1.getString("shop_id"));
               session.setAttribute("shopname", us1.getString("shop_name"));
               response.sendRedirect("../Shop/HomePage.jsp"); 
                        }
            }
             else if(us3.next())
            {
                 if(us3.getString("showroom_pstatus").equals("0"))
                {
                     %> 
      <script type="text/javascript">
            alert("Your Registration is Pending");
            setTimeout(function(){window.location.href='Login.jsp'},100);
        </script>
     <%
                }
                else if(us3.getString("showroom_pstatus").equals("2"))
                {
                     %> 
      <script type="text/javascript">
            alert("Your Registration is Rejected");
            setTimeout(function(){window.location.href='Login.jsp'},100);
        </script>
        <%
                }
                else
                {
                session.setAttribute("shroomid", us3.getString("showroom_id"));
               session.setAttribute("shroomname", us3.getString("showroom_name"));
               response.sendRedirect("../Showroom/HomePage.jsp"); 
                }
            }
           else  if(us2.next())
            {
              
               response.sendRedirect("../Admin/HomePage.jsp");
            }
            else
           {
               out.println("<script>alert('Incorrect UserName or Password !!!')</script>");
           }
            }
        %>
        <div id="tab" align="right">
        <form>
            <table>
                <tr>
                    <td >User Name</td>
                    <td><input type="text" name="txtusname" autocomplete="off" placeholder="User Name" required="required" ></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="txtpass" autocomplete="off" placeholder="Password" required="reuired" pattern="[a-zA-Z0-9]{5,20}" title="Enter at least 5 character" ></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="Submit">
                        <input type="reset" name="btnreset" value="Cancel"></td>
                </tr>
            </table>
        </form>
        </div>
        <%@include file='Footer.jsp' %>
    </body>
</html>
