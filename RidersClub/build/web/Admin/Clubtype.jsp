<%-- 
    Document   : clubtype
    Created on : 14 Jan, 2021, 2:47:01 PM
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
    <h3 align="center">Club Type</h3>
    <body>
        <%
            String cltype="",ins="",clubtypename="",clubtypeid="";
            if(request.getParameter("btnsave")!=null)
            {
                cltype=request.getParameter("txtclub");
               // out.println(cltype);
                if(request.getParameter("clname").equals(""))
                {
                ins="insert into tbl_clubtype(clubtype_name)value('"+request.getParameter("txtclub")+"')";
                con.executeCommand(ins);
                response.sendRedirect("Clubtype.jsp");
                }
                else
                {
                    String edit="update tbl_clubtype set clubtype_name='"+cltype+"' where clubtype_id='"+request.getParameter("clname")+"'";
                    out.println(edit);
                    con.executeCommand(edit);
                   response.sendRedirect("Clubtype.jsp");
                }
            }
            if(request.getParameter("delid")!=null)
            {
                String del="delete from tbl_clubtype where clubtype_id='"+request.getParameter("delid")+"'";
                con.executeCommand(del);
                response.sendRedirect("Clubtype.jsp");
            }
            
            if(request.getParameter("editid")!=null)
            {
                String sel="select * from tbl_clubtype where clubtype_id='"+request.getParameter("editid")+"'";
                ResultSet cl=con.selectCommand(sel);
                while(cl.next())
                {
                    clubtypename=cl.getString("clubtype_name");
                    clubtypeid=cl.getString("clubtype_id");
                }
            }
        %>
        <form method="post" id="tab">
            <table align="center">
                <tr>
                    <td>Club Type</td>
                    <input type="hidden" name="clname" value="<%=(clubtypeid)%>">
                    <td><input type="text" name="txtclub" id="txtclub" value="<%out.println(clubtypename);%>"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="Submit"><input type="reset" name="btncancel" value="Cancel"></td>
                </tr>
            </table>
                <br><br>
         <table align="center">
             <tr>
                 <th>No</th>
                 <th>Club Type</th>
                 <th colspan="2">Actions</th>
             </tr>
             <%
            int i=0;
            String sel="select * from tbl_clubtype";
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
                i=i+1;
            %>
            <tr>
                <td><%out.println(i);%></td>
                <td><%out.println(rs.getString("clubtype_name"));%></td>
                <td><a href="Clubtype.jsp?delid=<%=rs.getString("clubtype_id")%>">Delete</a></td>
                <td><a href="Clubtype.jsp?editid=<%=rs.getString("clubtype_id")%>">Edit</a></td>
            </tr>
            <%
            }
             %>
         </table>
        </form>
    </body>
</html>
