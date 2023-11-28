<%-- 
    Document   : UserChat
    Created on : 24 Mar, 2021, 8:14:57 PM
    Author     : alans
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="Header.jsp" %>
        <style>

            div.container{
                padding-top: 100px;
            }


            div.chat-area{
                padding: 20px;
                border-style: ridge;
                width: 50%;
                height: 250px;
                overflow: auto;


            }
            div.right {
                position: relative;
                text-align: right;
                min-width: 45%;
                padding: 10px 15px;
                border-radius: 6px;
                border: 1px solid #ccc;
                float: right;
                margin: 10px;
                right: 20px;
            }

            div.right::before {
                content: '';
                position: absolute;
                visibility: visible;
                top: -1px;
                right: -10px;
                border: 10px solid transparent;
                border-top: 10px solid #ccc;
            }

            div.right::after {
                content: '';
                position: absolute;
                visibility: visible;
                top: 0px;
                right: -8px;
                border: 10px solid transparent;
                clear: both;
            }
            div.left {
                position: relative;
                text-align: left;
                min-width: 45%;
                padding: 10px 15px;
                margin: 10px;
                border-radius: 6px;
                border: 1px solid #ccc;
                float: left;
                left: 20px;
            }

            div.left::before {
                content: '';
                position: absolute;
                visibility: visible;
                top: -1px;
                left: -10px;
                border: 10px solid transparent;
                border-top: 10px solid #ccc;
            }

            div.left::after  {
                content: '';
                position: absolute;
                visibility: visible;
                top: 0px;
                right: -8px;
                border: 10px solid transparent;

                clear: both;
            }

            div.msg-area
            {
                padding-top: 30px;
            }


        </style>
    </head>

    <body>
        <%
            String club=request.getParameter("cid");
            session.setAttribute("clubchatid",request.getParameter("cid") );
            //out.println(session.getAttribute("clubchatid"));
        %>

        <div class="container" align="center">

            <div class="chat-area" id="chat-area" >
                
                

            </div>

            <div class="msg-area">

                <textarea name="msg" rows="4" cols="109" id="msg"></textarea>

            </div>

            <div class="button">

                <input type="button" name="btn_send"  id="btn_send" onclick="sendChat()" value="Send"/>

            </div>

        </div>
        <input type="hidden" value="<%=request.getParameter("cid")%>" id="club_id">
        <%@include file="Footer.jsp" %>
    </body>

    <script src="../../JQuery/jQuery.js"></script>

    <script>

                    function sendChat()
                    {

                        var chat = document.getElementById("msg").value;
                        var club_id = document.getElementById("club_id").value;
                        $.ajax({url: "AjaxChat.jsp?chat=" + chat + "&cid=" + club_id,
                            success: function(result) {


                                document.getElementById("msg").value = "";
                               
                                $('#chat-area').animate({scrollTop: $('#chat-area')[0].scrollHeight});


                            }});

                    }
                    $(document).ready(function() {
//                        alert("hii")
                        setInterval(function() {
                            $("#chat-area").load('Load.jsp')
                        }, 50);
                    });

    </script>

</html>
