<%-- 
    Document   : Viewshop
    Created on : 26 Jan, 2021, 12:42:28 PM
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
        <%@include file="Header.jsp" %>
    </head>
    <body align="center">
        <form id="tab">
            <table align="center" width="1100">
                <tr>
                    <td>Shop Type</td>
                    <td><select name="selshtype">
                            <option>...Select...</option>
                            <%
                              String sel="select * from tbl_shoptype";
                              ResultSet rs=con.selectCommand(sel);
                              while(rs.next())
                              {
                              %>
                              <option value="<%=rs.getString("shoptype_id")%>"><%=rs.getString("shoptype_name")%></option>
                            <%
                              }
                            %>
                        </select>
                    </td>
                    <td>District</td>
                    <td><select name="seldis" onchange="dis(this.value)">
                            <option>...Select...</option>
                            <%
                              String sel2="select * from tbl_district";
                              ResultSet dis=con.selectCommand(sel2);
                              while(dis.next())
                              {
                              %>
                              <option value="<%=dis.getString("district_id")%>"><%=dis.getString("district_name")%></option>
                            <%
                              }
                            %>
                        </select>
                    </td>
                    <td>Place</td>
                    <td><select name="selplace"id="txtselpal">
                            <option>...Select...</option>
                            
                        </select>
                    </td>
                    <td width="300"><input type="submit" name="btnsave" value="Search"></td>
            </tr>
            </table>
        
                        <%
                              if(request.getParameter("btnsave")!=null)
                              {
                        %>
                        <table border="1" align="center">
                            <tr>
                                <th>No</th>
                                <th>Logo</th>
                                <th>Name</th>
                                <th>Action</th>
                            </tr>
                            <%
                    int i=0;
                    String sel1="select * from tbl_shop s inner join tbl_place p on s.place_id=p.place_id inner join tbl_shoptype st on st.shoptype_id=s.shoptype_id inner join tbl_district d on d.district_id=p.district_id where st.shoptype_id='"+request.getParameter("selshtype")+"' and p.place_id='"+request.getParameter("selplace")+"'";
                    //out.println(sel1);
                    ResultSet sh=con.selectCommand(sel1);
                    while(sh.next())
                    {
                        i=i+1;
                %>
                <tr>
                    <td><%out.println(i);%></td>
                    <td><img src="../Assets/Shop/Shop_logo/<%=sh.getString("shop_logo")%>" height="100" width="100"></td>
                    <td><%=sh.getString("shop_name")%></td>
                    <td><a href="ViewShopProfile.jsp?shopid=<%=sh.getString("shop_id")%>">View</a></td>
                    
                </tr>
                <%
                    }
                              }
                %>
                        </table>
        </form>
    </body>
    <script src="../JQuery/jQuery.js" type="text/javascript"></script>
<script>
function dis(a)
{
	//alert(a);
	$.ajax({url:"Ajaxplace.jsp?disid="+a,
	success: function(result){
            //alert(result);
	$("#txtselpal").html(result);}});
}
</script>
</html>
<%@include file="Footer.jsp" %>