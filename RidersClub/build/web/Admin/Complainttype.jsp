<%-- 
    Document   : complainttype
    Created on : 14 Jan, 2021, 2:44:42 PM
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
    <h3 align="center">Complaint Type</h3>
    <body>
        <%
            String cttype="",ins="",complainttypename="",complainttypeid="";
            if(request.getParameter("btnsave")!=null)
            {
                cttype=request.getParameter("txtcom");
                if(request.getParameter("clname").equals(""))
                {
                ins="insert into tbl_complainttype(complainttype_name)value('"+request.getParameter("txtcom")+"')";
                con.executeCommand(ins);
                response.sendRedirect("Complainttype.jsp");
                }
                else
                {
                    String edit="update tbl_complainttype set complainttype_name='"+cttype+"' where complainttype_id='"+request.getParameter("clname")+"'";
                    con.executeCommand(edit);
                    response.sendRedirect("Complainttype.jsp"); 
                }
            }
            
            if(request.getParameter("delid")!=null)
            {
                String del="delete from tbl_complainttype where complainttype_id='"+request.getParameter("delid")+"'";
                con.executeCommand(del);
                response.sendRedirect("Complainttype.jsp");
            }
            
            if(request.getParameter("editid")!=null)
            {
                String sel="select * from tbl_complainttype where complainttype_id='"+request.getParameter("editid")+"'";
                ResultSet ct=con.selectCommand(sel);
                while(ct.next())
                {
                    complainttypename=ct.getString("complainttype_name");
                    complainttypeid=ct.getString("complainttype_id");
                }
            }
        %>
        <form method="post" id="tab">
            <table align="center">
                <tr>
                    <td>Complaint Type</td>
                <input type="hidden" name="clname" value="<%=(complainttypeid)%>">
                    <td><input type="text" name="txtcom" id="txtcom" value="<%out.println(complainttypename);%>"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="Submit"><input type="reset" name="btncancel" value="Cancel"></td>
                </tr>
            </table>
                <br><br>    
         <table align="center">
             <tr>
                 <th>No</th>
                 <th>Complaint Type</th>
                 <th colspan="2">Action</th>
             </tr>
             <%
            int i=0;
            String sel="select * from tbl_complainttype";
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
                i=i+1;
            %>
            <tr>
                <td><%out.println(i);%></td>
                <td><%out.println(rs.getString("complainttype_name"));%></td>
                <td><a href="Complainttype.jsp?delid=<%=rs.getString("complainttype_id")%>">Delete</a></td>
                <td><a href="Complainttype.jsp?editid=<%=rs.getString("complainttype_id")%>">Edit</a></td>
            </tr>
            <%
            }
             %>
         </table>
        </form>
    </body>
</html>
