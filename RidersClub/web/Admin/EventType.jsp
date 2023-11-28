<%-- 
    Document   : District
    Created on : 13 Jan, 2021, 11:54:02 AM
    Author     : asus
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="HomePage.jsp" %>
    </head>
    <h3 align="center">Add Event Type</h3>
    <body>
        <%
            String dis="",ins="",eventtypename="",eventtypeid="";
            if(request.getParameter("btnsave")!=null)
            {
                dis=request.getParameter("txtevtype");
                
            if(request.getParameter("txtid").equals(""))
            {
             // dis=request.getParameter("txtdis");  
                ins="insert into tbl_eventtype(eventtype_name)value('"+dis+"')";
                con.executeCommand(ins);
                
            }
            else
            {     
                
                
                
                 String edit="update tbl_eventtype set eventtype_name='"+dis+"' where eventtype_id='"+request.getParameter("txtid")+"'";
               con.executeCommand(edit);
               response.sendRedirect("EventType.jsp");
            }
            }
            
            
            if(request.getParameter("delid")!=null)
            {
                String del="delete from tbl_eventtype where eventtype_id='"+request.getParameter("delid")+"'";
                con.executeCommand(del);
            }
            if(request.getParameter("editid")!=null)
            {
                String sel="select * from tbl_eventtype where eventtype_id='"+request.getParameter("editid")+"'";
                ResultSet ed=con.selectCommand(sel);
                while(ed.next())
                {
                    eventtypename=ed.getString("eventtype_name");
                    eventtypeid=ed.getString("eventtype_id");
                }
            }
        %>
        <form method="post" id="tab">
            <table align="center">
                <tr>
                    <td>Event Type</td>
                    <input type="hidden" name="txtid" value="<%=(eventtypeid)%>">
                    <td><input type="text" name="txtevtype" id="txtevtype" value="<%out.println(eventtypename);%>"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="Submit"><input type="reset" name="btncancel" value="Cancel"></td>
                </tr>
            </table>
        
                <br><br>
        <table border="1" align="center">
            <tr>
                <th>No</th>
                <th>Event Type</th>
                <th colspan="2">Actions</th>
            </tr>
            <%
            int i=0;
            String sel="select * from tbl_eventtype";
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
                i=i+1;
            %>
            <tr>
                <td><%out.println(i);%></td>
                <td><%out.println(rs.getString("eventtype_name"));%></td>
                <td><a href="EventType.jsp?delid=<%=rs.getString("eventtype_id")%>">Delete</a></td>
                <td><a href="EventType.jsp?editid=<%=rs.getString("eventtype_id")%>">Edit</a></td>
            </tr>
            <%    
            }
            %>
        </table>
        </form>
    </body>
</html>
