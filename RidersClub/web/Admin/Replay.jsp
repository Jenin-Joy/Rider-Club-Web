<%-- 
    Document   : Replay
    Created on : 10 Mar, 2021, 12:52:09 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="HomePage.jsp" %>
    </head>
    <h3 align="center">Replay</h3>
    <body>
        <%
            String up="update tbl_complaint set complaint_status='1' where complaint_id='"+request.getParameter("editid")+"'";
            con.executeCommand(up);
            if(request.getParameter("btnsave")!=null)
            {
                String edit="update tbl_complaint set complaint_replay='"+request.getParameter("txtreplay")+"' where complaint_id='"+request.getParameter("txtid")+"'";
                //out.println(edit);
                
                if(con.executeCommand(edit))
                {
                    out.println("<script>alert('reply sended')</script>");
                }
            }
        %>
        <form id="tab">
            <table align="center">
                <tr>
                    <td>Replay</td>
                <input type="hidden" name="txtid" value="<%=request.getParameter("editid")%>">
                    <td><textarea cols="50" rows="10" name="txtreplay"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" align="right"><input type="submit" name="btnsave" value="Send"><input type="reset"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
