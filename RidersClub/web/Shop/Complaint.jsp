<%-- 
    Document   : Complaint
    Created on : 10 Mar, 2021, 11:18:36 AM
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
    <body>
        <%
            if(request.getParameter("btnsave")!=null)
            {
                String ins="insert into tbl_complaint(complaint_condent,complainttype_id,shop_id,complaint_date)values('"+request.getParameter("txtcomplaint")+"','"+request.getParameter("selcomplaint")+"','"+session.getAttribute("shopid")+"',curdate())";
            //out.println(ins);
                con.executeCommand(ins);
            response.sendRedirect("Complaint.jsp");
            }
        %>
        <form id="tab">
            <table align="center">
                <tr>
                    <td>Complaint Type</td>
                    <td><select name="selcomplaint" required="required"><option value="">..Select..</option>
                        <%
                            String sel="select * from tbl_complainttype";
                            ResultSet rs=con.selectCommand(sel);
                            while(rs.next())
                            {
                                %>
                                <option value="<%=rs.getString("complainttype_id")%>"><%=rs.getString("complainttype_name")%></option>
                            <%
                            }
                        %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Complaint</td>
                    <td><textarea cols="100" rows="10" name="txtcomplaint" placeholder="Complaint" required="required"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" align="right"><input type="submit" name="btnsave" value="Send"><input type="reset" ></td>
                </tr>
                <tr><td colspan="2"><a href="ViewComplaint.jsp">View Replay</a></td></tr>
            </table>
        </form>
    </body>
</html>
<%@include file='Footer.jsp' %>