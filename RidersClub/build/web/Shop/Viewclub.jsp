<%-- 
    Document   : Viewclub
    Created on : 25 Jan, 2021, 2:58:13 PM
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
        <body align="center">
            <form method="POST" id="tab">
                <table align="center" cellpadding="10" width="700">
                    <tr>
                        <td width="200">Vehicle Category</td>
                        <td width="200"><select name="selvecat"><option>..Select..</option>
                                <%
                                    String sel="select * from tbl_vehiclecat";
                                    ResultSet rs=con.selectCommand(sel);
                                    while(rs.next())
                                    {
                                %>
                                <option value="<%=rs.getString("vehiclecat_id")%>"><%=rs.getString("vehiclecat_name")%></option>
                                <%
                                    }
                                %>
                            </select>
                        </td>
                        <td width="250"><input type="submit" name="btnsave" value="Submit"></td>
                    </tr>
                </table>
            
                            <%
                                    if(request.getParameter("btnsave")!=null)
                                    {
                             %>
                <table border="1" align="center" cellpadding="10">
                    <tr>
                        <th>NO</th>
                        <th>Club Name</th>
                        <th>Contact</th>
                        <th>Email</th>
                        <th>Logo</th>
                        <th>District</th>
                        <th>Club Type</th>
                        <th>Action</th>
                    </tr>
                    <%
                                        int i=0;
                                        String sel1="select * from tbl_club c inner join tbl_district d on d.district_id=c.district_id inner join tbl_clubtype ct on ct.clubtype_id=c.clubtype_id where vehiclecat_id='"+request.getParameter("selvecat")+"'";
                                        ResultSet vecat=con.selectCommand(sel1);
                                        while(vecat.next())
                                        {
                                            i=i+1;
                    %>
                     <tr>
                    <td><%out.println(i);%></td>
                    <td><%=vecat.getString("club_name")%></td>
                    <td><%=vecat.getString("club_contact")%></td>
                    <td><%=vecat.getString("club_email")%></td>
                    <td><img src="../Assets/Club/Club_logos/<%=vecat.getString("club_logo")%>" height="100" width="200"></td>
                    <td><%=vecat.getString("district_name")%></td>
                    <td><%=vecat.getString("clubtype_name")%></td>
                    <%
                        String selCount="select * from tbl_requestclub where club_id='"+ vecat.getString("club_id") +"' and shop_id='"+session.getAttribute("shopid")+"'"; 
                        //out.print(selCount);
                        ResultSet rsCount=con.selectCommand(selCount);
                        String vstatus="";
                        if(rsCount.next()){
                              vstatus=rsCount.getString("requestclub_vstatus");
                              //out.print(vstatus);
                             
                        }
                        if(vstatus.equals("0")){
                     %>
                     
                     
                     <td style="color:red;">Pending</td>
                        
                     
                     <%
                        }else if(vstatus.equals("1"))
                        {
                     %>
                        
                     <td style="color: darkseagreen;">Already Member</td>
                    
                    <%
                        }else if(vstatus.equals("2")){
                    %>
                    
                    <td>Rejected</td>
                    <%
                            
                        }else{
                      %>
                      
                      <td><a href="Requestclub.jsp?clubid=<%=vecat.getString("club_id")%>">Join Now</a></td>
                      <%
                                }
                       %>
                </tr>
                    <%
                                        }
                                      
                                    }
                                    
                    %>
                             </table>
                             <a href="Myrequestedclub.jsp">My Requested Club</a>
                             </form>
        </body>
</html>
<%@include file='Footer.jsp' %>