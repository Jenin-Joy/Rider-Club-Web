<%-- 
    Document   : UserUploadAction
    Created on : 23 Dec, 2020, 11:25:23 AM
    Author     : asus
--%>

<%@page import="java.sql.ResultSet"%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <%
            
        File savedFile=null; 
        FileItem f_item=null;
        
        

String field_name="";
String file_name="";
String logo="";
String rules="";


String field[] = new String[20];
String value[]=new String[20];

//checking if request cotains multipart data
boolean isMultipart=ServletFileUpload.isMultipartContent(request);

if(isMultipart)
{
    System.out.println("ifff");

    FileItemFactory factory=new DiskFileItemFactory();
    ServletFileUpload upload=new ServletFileUpload(factory);

    //declaring a list of form fields
    List items_list=null;

    //assigning fields to list 'items_list'
    try
    {
    items_list=upload.parseRequest(request);
    }
    catch(FileUploadException ex)
    {
        out.println(ex);
    }

          //declaring iterator
   Iterator itr=items_list.iterator();
    int k=0;
    //iterating through the list 'items_list'
    while(itr.hasNext())
    {
        
        //typecasting next element in items_list as fileitem
        f_item=(FileItem)itr.next();

        //checking if 'f_item' contains a formfield(common controls like textbox,dropdown,radio buttonetc)
       if(f_item.isFormField())
        {
          
            //getting fieldname and value
            field[k]=f_item.getFieldName();
            value[k]=f_item.getString();
                
                k++;
        }
       else
       {
		   
		   
           //f_item=(FileItem)itr.next();
            
          file_name=f_item.getName();
           field_name=f_item.getFieldName();
           if(field_name.equals("txtlogo"))
           {
         String ext=file_name.substring(file_name.lastIndexOf("."));
            //setting path to store image
            File proj_path=new File(config.getServletContext().getRealPath("/"));
            String file_path=proj_path.getParentFile().getParentFile().getPath()+"\\web\\Assets\\Club\\Event_logo\\";
            Random r=new Random();
             int r_num=r.nextInt(1111)+999;
             
            logo="logo_"+r_num+ext;
            //creating a file object
            savedFile=new File(file_path+logo);
            try
            {
                //writing the file object
                f_item.write(savedFile);               
                
            }
            catch(Exception ex)
            {
                out.println(ex);
            }
            }
           
           file_name=f_item.getName();
           field_name=f_item.getFieldName();
           if(field_name.equals("txtrules"))
           {
         String ext=file_name.substring(file_name.lastIndexOf("."));
            //setting path to store image
            File proj_path=new File(config.getServletContext().getRealPath("/"));
            String file_path=proj_path.getParentFile().getParentFile().getPath()+"\\web\\Assets\\Club\\Event_rules\\";
            Random r=new Random();
             int r_num=r.nextInt(1111)+999;
             
            rules="rules_"+r_num+ext;
            //creating a file object
            savedFile=new File(file_path+rules);
            try
            {
                //writing the file object
                f_item.write(savedFile);               
                
            }
            catch(Exception ex)
            {
                out.println(ex);
            }
            }
           
           
           
           
          
           
       }
           
           }
    
    //Strinh str1="insert into tbl_wantedlist ()";
        String ins="insert into tbl_event(event_name,place_id,event_location,event_landmark1,event_landmark2,event_logo,event_duration,eventtype_id,event_startdate,event_rules,event_contact,event_tickets,event_totaltickets,event_ticketrate,club_id)values('"+value[0]+"','"+value[2]+"','"+value[3]+"','"+value[4]+"','"+value[5]+"','"+logo+"','"+value[6]+"','"+value[7]+"','"+value[8]+"','"+rules+"','"+value[9]+"','"+value[10]+"','"+value[11]+"','"+value[12]+"','"+session.getAttribute("cid")+"')";
        con.executeCommand(ins);
        //out.println(ins);
  
   
    boolean status=con.executeCommand(ins);
    
    if(status==true)
    {
      %> 
      <script type="text/javascript">
            alert("Event is Created");
            setTimeout(function(){window.location.href='ManageEvent.jsp'},100);
        </script>
     <%
    }
    
    
    
     }   


      

        %>
    </body>
</html>
