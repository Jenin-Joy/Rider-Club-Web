<%-- 
    Document   : RejectedList
    Created on : 20 Feb, 2021, 12:51:15 PM
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
    <h3 align="center">Rejected List</h3>
    <body>
        <%
            if(request.getParameter("accid")!=null)
            {
                String edit="update tbl_showroom set showroom_pstatus='1' where showroom_id='"+request.getParameter("accid")+"'";
                con.executeCommand(edit);
            
            }
        %>
        <h3 align="center">Rejected Showroom</h3>
        <form id="tab" style="overflow-x: auto">
            <table border="1" align="center" width="1500">
                <tr>
                    <th>No</th>
                    <th>Showroom Name</th>
                    <th>Showroom Address</th>
                    <th>Showroom Contact</th>
                    <th>Showroom Email</th>
                    <th>Showroom Proof</th>
                    <th>Showroom Photo</th>
                    <th width="100">Date Of Join</th>
                    <th>District</th>
                    <th>Place</th>
                    <th>Category</th>
                    <th>Company</th>
                    <th>Action</th>
                </tr>
                <%
                    int i=0;
                    String sel="select * from tbl_showroom sh inner join tbl_vehiclecom vh on sh.vehiclecom_id=vh.vehiclecom_id inner join tbl_vehiclecat vc on vh.vehiclecat_id=vc.vehiclecat_id inner join tbl_place p on p.place_id=sh.place_id inner join tbl_district d on p.district_id=d.district_id where sh.showroom_pstatus='2'";
                    ResultSet rs=con.selectCommand(sel);
                    while(rs.next())
                    {
                        i++;
                %>
                <tr>
                    <td><%out.println(i);%></td>
                    <td><%=rs.getString("showroom_name")%></td>
                    <td><%=rs.getString("showroom_address")%></td>
                    <td><%=rs.getString("showroom_contact")%></td>
                    <td><%=rs.getString("showroom_email")%></td>
                    <td><img src="../Assets/Showroom/Showroom_proof/<%=rs.getString("showroom_proof")%>" height="100" width="100"></td>
                    <td><img src="../Assets/Showroom/Showroom_photo/<%=rs.getString("showroom_photo")%>" height="100" width="100" ></td>
                    <td><%=rs.getString("showroom_doj")%></td>
                    <td><%=rs.getString("district_name")%></td>
                    <td><%=rs.getString("place_name")%></td>
                    <td><%=rs.getString("vehiclecat_name")%></td>
                    <td><%=rs.getString("vehiclecom_name")%></td>
                    <td>
                        <a href="RejectedList.jsp?accid=<%=rs.getString("showroom_id")%>">Accept</a></td>
                </tr>
                <%
                    }
                %>
            </table>
            
            <%
                    if(request.getParameter("accid1")!=null)
            {
                String edit="update tbl_shop set shop_pstatus='1' where shop_id='"+request.getParameter("accid1")+"'";
                con.executeCommand(edit);
            }
            %>
            
            <h3 align="center">Rejected Shop</h3>
            <table border="1"align="center" width="2000">
                <tr>
                    <th>No</th>
                    <th>Name</th>
                    <th>Contact</th>
                    <th>Email</th>
                    <th colspan="2">Land Mark</th>
                    <th width="250">Address</th>
                    <th>Logo</th>
                    <th>Proof</th>
                    <th width="100">Date of join</th>
                    <th width="150">Lisence No</th>
                    <th>District</th>
                    <th>Place</th>
                    <th>Shop Type</th>
                    <th>Action</th>
                    
                    
                </tr>
                <%
                    int j=0;
                    String sel1="select * from tbl_shop s inner join tbl_place p on s.place_id=p.place_id inner join tbl_shoptype st on st.shoptype_id=s.shoptype_id inner join tbl_district d on d.district_id=p.district_id where s.shop_pstatus='2'";
                    ResultSet r=con.selectCommand(sel1);
                    while(r.next())
                    {
                        j++;
                %>
                <tr>
                    <td><%out.println(j);%></td>
                    <td><%=r.getString("shop_name")%></td>
                    <td><%=r.getString("shop_contact")%></td>
                    <td><a href="mailto:<%=r.getString("shop_email")%>"><%=r.getString("shop_email")%></td>
                    <td><%=r.getString("shop_landmar1")%></td>
                    <td><%=r.getString("shop_landmar2")%></td>
                    <td><%=r.getString("shop_address")%></td>
                    <td><img src="../Assets/Shop/Shop_logo/<%=r.getString("shop_logo")%>" height="100" width="100"></td>
                    <td><img src="../Assets/Shop/Shop_proof/<%=r.getString("shop_proof")%>" height="100" width="100"></td>
                    <td><%=r.getString("shop_doj")%></td>
                    <td><%=r.getString("shop_licno")%></td>
                    <td><%=r.getString("district_name")%></td>
                    <td><%=r.getString("place_name")%></td>
                    <td><%=r.getString("shoptype_name")%></td>
                    <td>
                    <a href="RejectedList.jsp?accid1=<%=r.getString("shop_id")%>">Accept</a></td>
                </tr>
                <%
                    }
                %>
                
            </table>
                
                <%
                    if(request.getParameter("accid2")!=null)
            {
                String edit="update tbl_user set user_pstatus='1' where user_id='"+request.getParameter("accid2")+"'";
            con.executeCommand(edit);
            }
                %>
                
                <h3 align="center">Rejected User</h3>
                 <table border="1" align="center">
                <tr>
                    <th>No</th>
                    <th>Name</th>
                    <th>Contact</th>
                    <th>Email</th>
                    <th>Gender</th>
                    <th>Bio</th>
                    <th>Address</th> 
                    <th>Date of join</th>                    
                    <th>Place</th>
                    <th>District</th>
                    <th>Action</th>
                   
                    
                    
                </tr>
                <%
                    int p=0;
                    String sel2="select * from tbl_user u inner join tbl_place p on u.place_id=p.place_id inner join tbl_district d on d.district_id=p.district_id where user_pstatus='2'";
                    ResultSet s=con.selectCommand(sel2);
                    while(s.next())
                    {
                        p++;
                %>
                <tr>
                    <td><%out.println(p);%></td>
                    <td><%out.println(s.getString("user_name"));%></td>
                    <td><%out.println(s.getString("user_contact"));%></td>
                    <td><a href="maulto:<%out.println(s.getString("user_email"));%>"><%out.println(s.getString("user_email"));%></td>
                    <td><%out.println(s.getString("user_gen"));%></td>
                    <td><%out.println(s.getString("user_bio"));%></td>
                    <td><%out.println(s.getString("user_address"));%></td>                   
                    <td><%out.println(s.getString("user_doj"));%></td>                   
                    <td><%out.println(s.getString("place_name"));%></td>
                    <td><%out.println(s.getString("district_name"));%></td>
                    <td>
                    <a href="RejectedList.jsp?accid2=<%=s.getString("user_id")%>">Accept</a></td>
                </tr>
                <%
                    }
                %>
                <tr>
                    
                </tr>
            </table>
        </form>
    </body>
</html>
