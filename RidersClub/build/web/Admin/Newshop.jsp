<%-- 
    Document   : Viewshop
    Created on : 23 Jan, 2021, 3:06:13 PM
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
    <h3 align="center">New Shop</h3>
    <body>
        <%
            if(request.getParameter("accid")!=null)
            {
                String edit="update tbl_shop set shop_pstatus='1' where shop_id='"+request.getParameter("accid")+"'";
                con.executeCommand(edit);
            }
            if(request.getParameter("rejid")!=null)
            {
                String edit1="update tbl_shop set shop_pstatus='2' where shop_id='"+request.getParameter("rejid")+"'";
                con.executeCommand(edit1);
            }
        %>
        <form id="tab" style="overflow-x: auto">
            <table border="1" align="center" width="2000">
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
                    <th width="130">Lisence No</th>
                    <th>District</th>
                    <th>Place</th>
                    <th>Shop Type</th>
                    <th width="150">Action</th>
                    
                    
                </tr>
                <%
                    int i=0;
                    String sel="select * from tbl_shop s inner join tbl_place p on s.place_id=p.place_id inner join tbl_shoptype st on st.shoptype_id=s.shoptype_id inner join tbl_district d on d.district_id=p.district_id where s.shop_pstatus='0'";
                    ResultSet rs=con.selectCommand(sel);
                    while(rs.next())
                    {
                        i=i+1;
                %>
                <tr>
                    <td><%out.println(i);%></td>
                    <td><%=rs.getString("shop_name")%></td>
                    <td><%=rs.getString("shop_contact")%></td>
                    <td><a href="mailto:<%=rs.getString("shop_email")%>"><%=rs.getString("shop_email")%></td>
                    <td><%=rs.getString("shop_landmar1")%></td>
                    <td><%=rs.getString("shop_landmar2")%></td>
                    <td><%=rs.getString("shop_address")%></td>
                    <td><img src="../Assets/Shop/Shop_logo/<%=rs.getString("shop_logo")%>" height="100" width="100"></td>
                    <td><img src="../Assets/Shop/Shop_proof/<%=rs.getString("shop_proof")%>" height="100" width="100"></td>
                    <td><%=rs.getString("shop_doj")%></td>
                    <td><%=rs.getString("shop_licno")%></td>
                    <td><%=rs.getString("district_name")%></td>
                    <td><%=rs.getString("place_name")%></td>
                    <td><%=rs.getString("shoptype_name")%></td>
                    <td><a href="Newshop.jsp?accid=<%=rs.getString("shop_id")%>">Accept</a>
                    <a href="Newshop.jsp?rejid=<%=rs.getString("shop_id")%>">Reject</a></td>
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
