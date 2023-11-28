<%-- 
    Document   : Place
    Created on : 13 Jan, 2021, 1:18:49 PM
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
    <h3 align="center">Add Place</h3>
    <body>
        <%
            String dis="",place="",ins="",placename="",placeid="",districtid="";
            if(request.getParameter("btnsave")!=null)
            {
            dis=request.getParameter("seldis");
            place=request.getParameter("txtplace");
            if(request.getParameter("txtplid").equals(""))
            {
            ins="insert into tbl_place(place_name,district_id)value('"+place+"','"+dis+"')";
            //out.println(ins);
            con.executeCommand(ins);
            }
            else
            {
                String edit="update tbl_place set place_name='"+place+"',district_id='"+dis+"' where place_id='"+request.getParameter("txtplid")+"'";
                con.executeCommand(edit);
                response.sendRedirect("Place.jsp");
            }
            }
            
            if(request.getParameter("delid")!=null)
            {
                String del="delete from tbl_place where place_id='"+request.getParameter("delid")+"'";
                con.executeCommand(del);
            }
            if(request.getParameter("editid")!=null)
            {
                String sel="select * from tbl_place p inner join tbl_district d on p.district_id=d.district_id where place_id='"+request.getParameter("editid")+"'";
                ResultSet pl1=con.selectCommand(sel);
                while(pl1.next())
                {
                    placename=pl1.getString("place_name");
                    placeid=pl1.getString("place_id");
                    districtid=pl1.getString("district_id");
                }
            }
        %>
        <form id="tab">
            <table align="center">
                <tr>
                    <td>District</td>
                    <td><select name="seldis">
                            <option>...Select...</option>
                            <%
                              String sel="select * from tbl_district";
                              ResultSet rs=con.selectCommand(sel);
                              while(rs.next())
                              {
                              %>
                              <option value="<%=rs.getString("district_id")%>" <%if(rs.getString("district_id").equals(districtid)){out.println("selected");}%> ><%=rs.getString("district_name")%></option>
                            <%
                              }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Place</td>
                    <td><input type="hidden" name="txtplid" value="<%= placeid %>">
                        <input type="text" name="txtplace" value="<%out.println(placename);%>"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="Submit"><input type="reset" name="btnreset" value="Cancel"></td>
                </tr>
            </table>
                <br><br>
                        <table border="1" align="center">
                            <tr>
                                <th>No</th>
                                <th>District</th>
                                <th>Place</th>
                                <th colspan="2">Actions</th>
                            </tr>
                            <%
                              int i=0;
                              String sel1="select * from tbl_place p inner join tbl_district d on p.district_id=d.district_id";
                              ResultSet pl=con.selectCommand(sel1);
                              while(pl.next())
                              {
                                  i=i+1;
                              %>
                              <tr>
                                  <td><%out.println(i);%></td>
                                  <td><%=pl.getString("district_name")%></td>
                                  <td><%=pl.getString("place_name")%></td>
                                  <td><a href="Place.jsp?delid=<%=pl.getString("place_id")%>">Delete</a></td>
                                  <td><a href="Place.jsp?editid=<%=pl.getString("place_id")%>">Edit</a></td>
                              </tr>
                            <%
                              }
                            %>
                        </table>
        </form>
    </body>
</html>
