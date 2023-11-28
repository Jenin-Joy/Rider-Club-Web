<%-- 
    Document   : FeedBack
    Created on : 10 Mar, 2021, 4:04:40 PM
    Author     : asus
--%>

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
                String ins="insert into tbl_feedback(feedback_condent,shop_id)values('"+request.getParameter("txtfeedback")+"','"+session.getAttribute("shopid")+"')";
            //out.println(ins);
                con.executeCommand(ins);
                response.sendRedirect("FeedBack.jsp");
            }
        %>
        <form id="tab">
            <table  align="center">
                <tr>
                    <td>Feed Back</td>
                    <td><textarea cols="50" rows="10" name="txtfeedback" required="required" placeholder="Feed Back"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" align="right"><input type="submit" name="btnsave" value="Sent"><input type="reset"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
<%@include file='Footer.jsp' %>