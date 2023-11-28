
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    
<%
                
                String selQry="select * from tbl_chat c inner join tbl_user u on u.user_id=c.chat_from where c.chat_club_id='"+session.getAttribute("clubchatid")+"' order by chat_id asc ";
                //out.print(selQry);
                
                ResultSet rs=con.selectCommand(selQry);
                while(rs.next())
                {
                if(rs.getString("chat_from").equals(session.getAttribute("uid")))
                {
                %>

                
                <div class="right">

                    <i class="name"><%=session.getAttribute("uname")%></i>
                    <br><br>
                    <span>

                       <%=rs.getString("chat_content")%>

                    </span>

                </div>
                
<%

                }
                else
                {
                
%>
                
                <div class="left">
                    <i class="name"><%=rs.getString("user_name")%></i><br><br>
                    <span>
                        
                        <%=rs.getString("chat_content")%>
                        
                    </span>

                </div>
                
                <%
                
                }
                }
                
                %>
