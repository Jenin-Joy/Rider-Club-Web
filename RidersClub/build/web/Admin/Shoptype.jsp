<%-- 
    Document   : shoptype
    Created on : 14 Jan, 2021, 2:46:18 PM
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
    <h3 align="center">Add Shop Type</h3>
    <body>
        <%
          String ins="",stype="",shoptypename="",shoptypeid="";
          if(request.getParameter("btnsave")!=null)
          {
              stype=request.getParameter("txtshop");
              if(request.getParameter("shname").equals(""))
              {
              ins="insert into tbl_shoptype(shoptype_name)value('"+request.getParameter("txtshop")+"')";
              con.executeCommand(ins);
              response.sendRedirect("Shoptype.jsp");
              }
              else
              {
                  String edit="update tbl_shoptype set shoptype_name='"+stype+"' where shoptype_id='"+request.getParameter("shname")+"'";
                  con.executeCommand(edit);
                  response.sendRedirect("Shoptype.jsp");
              }
          }
          
          if(request.getParameter("delid")!=null)
          {
              String del="delete from tbl_shoptype where shoptype_id='"+request.getParameter("delid")+"'";
              con.executeCommand(del);
              response.sendRedirect("Shoptype.jsp");
          }
          
          if(request.getParameter("editid")!=null)
          {
              String sel="select * from tbl_shoptype where shoptype_id='"+request.getParameter("editid")+"'";
              ResultSet sh=con.selectCommand(sel);
              while(sh.next())
              {
                  shoptypename=sh.getString("shoptype_name");
                  shoptypeid=sh.getString("shoptype_id");
              }
          }
        %>
        <form method="post" id="tab">
            <table align="center">
                <tr>
                    <td>Shop Type</td>
                <input type="hidden" name="shname" value="<%=(shoptypeid)%>">
                    <td><input type="text" name="txtshop" id="txtshop" value="<%out.println(shoptypename);%>"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="Submit"><input type="reset" name="btncancel" value="Cancel"></td>
                </tr>
            </table>
                <br><br>
         <table align="center">
             <tr>
                 <th>No</th>
                 <th>Shop Type</th>
                 <th colspan="2">Action</th>
             </tr>
             <%
          int i=0;
          String sel="select * from tbl_shoptype";
          ResultSet rs=con.selectCommand(sel);
          while(rs.next())
          {
              i=i+1;
              %>
              <tr>
                  <td><%out.println(i);%></td>
                  <td><%out.println(rs.getString("shoptype_name"));%></td>
                  <td><a href="Shoptype.jsp?delid=<%=rs.getString("shoptype_id")%>">Delete</a></td>
                  <td><a href="Shoptype.jsp?editid=<%=rs.getString("shoptype_id")%>">Edit</a></td>
              </tr>
             <%
          }
             %>
         </table>
        </form>
    </body>
</html>
