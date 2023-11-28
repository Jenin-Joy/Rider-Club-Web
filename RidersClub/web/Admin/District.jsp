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
    <h3 align="center">Add District</h3>
    <body>
        <%
            String dis="",ins="",districtname="",districtid="";
            if(request.getParameter("btnsave")!=null)
            {
                dis=request.getParameter("txtdis");
                
            if(request.getParameter("txtid").equals(""))
            {
             // dis=request.getParameter("txtdis");  
                ins="insert into tbl_district(district_name)value('"+dis+"')";
                con.executeCommand(ins);
                
            }
            else
            {     
                
                
                
                 String edit="update tbl_district set district_name='"+dis+"' where district_id='"+request.getParameter("txtid")+"'";
               con.executeCommand(edit);
               response.sendRedirect("District.jsp");
            }
            }
            
            
            if(request.getParameter("delid")!=null)
            {
                String del="delete from tbl_district where district_id='"+request.getParameter("delid")+"'";
                con.executeCommand(del);
            }
            if(request.getParameter("editid")!=null)
            {
                String sel="select * from tbl_district where district_id='"+request.getParameter("editid")+"'";
                ResultSet ed=con.selectCommand(sel);
                while(ed.next())
                {
                    districtname=ed.getString("district_name");
                    districtid=ed.getString("district_id");
                }
            }
        %>
        <form method="post" id="tab">
            <table align="center">
                <tr>
                    <td>District</td>
                    <input type="hidden" name="txtid" value="<%=(districtid)%>">
                    <td><input type="text" name="txtdis" id="txtdis" value="<%out.println(districtname);%>"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="Submit"><input type="reset" name="btncancel" value="Cancel"></td>
                </tr>
            </table>
        
                <br><br>
        <table border="1" align="center">
            <tr>
                <th>No</th>
                <th>District</th>
                <th colspan="2">Actions</th>
            </tr>
            <%
            int i=0;
            String sel="select * from tbl_district";
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
                i=i+1;
            %>
            <tr>
                <td><%out.println(i);%></td>
                <td><%out.println(rs.getString("district_name"));%></td>
                <td><a href="District.jsp?delid=<%=rs.getString("district_id")%>">Delete</a></td>
                <td><a href="District.jsp?editid=<%=rs.getString("district_id")%>">Edit</a></td>
            </tr>
            <%    
            }
            %>
        </table>
        </form>
    </body>
</html>
