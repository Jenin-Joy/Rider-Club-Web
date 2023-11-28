<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    String insQry="insert into tbl_chat(chat_from,chat_club_id,chat_content,chat_time,chat_date) values('"+session.getAttribute("uid") +"','"+request.getParameter("cid") +"','"+request.getParameter("chat") +"',curtime(),curdate())";
    if(con.executeCommand(insQry))
    {
        out.println("sended");
    }
    else
    {
        out.println("failed");
        out.println(insQry);
    }
    
%>