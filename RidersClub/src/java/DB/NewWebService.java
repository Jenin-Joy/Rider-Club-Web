/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author asus
 */
@WebService(serviceName = "NewWebService")
public class NewWebService {

    ConnectionClass con = new ConnectionClass();

    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "GetDistrict")
    public String GetDistrict() {
        //TODO write your implementation code here:
        String sel = "select * from tbl_district ";
        ResultSet rs = con.selectCommand(sel);
        // System.out.println(sel);
        JSONArray j = new JSONArray();
        try {
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                {
                    try {
                        jo.put("did", rs.getString("district_id"));
                        jo.put("dname", rs.getString("district_name"));
                        j.put(jo);
                    } catch (JSONException ex) {
                        Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        //  System.out.println(j.toString());
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "GetType")
    public String GetType() {
        //TODO write your implementation code here:
        String sel = "select * from tbl_shoptype ";
        ResultSet rs = con.selectCommand(sel);
        // System.out.println(sel);
        JSONArray j = new JSONArray();
        try {
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                {
                    try {
                        jo.put("tid", rs.getString("shoptype_id"));
                        jo.put("tname", rs.getString("shoptype_name"));
                        j.put(jo);
                    } catch (JSONException ex) {
                        Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(j.toString());
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "GetPlace")
    public String GetPlace(@WebParam(name = "district") String district) {
        //TODO write your implementation code here:
        String sel = "select * from tbl_place where district_id='" + district + "'";
        ResultSet rs = con.selectCommand(sel);
        //   System.out.println(sel);
        JSONArray j = new JSONArray();
        {
            try {
                while (rs.next()) {
                    JSONObject jo = new JSONObject();
                    {
                        try {
                            jo.put("pid", rs.getString("place_id"));
                            jo.put("pname", rs.getString("place_name"));
                            j.put(jo);
                        } catch (JSONException ex) {
                            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                        }

                    }
                }
            } catch (SQLException ex) {
                Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        // System.out.println(j.toString());
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "Registration")
    public String Registration(@WebParam(name = "user_name") String user_name, @WebParam(name = "user_contact") String user_contact, @WebParam(name = "user_email") String user_email, @WebParam(name = "user_gen") String user_gen, @WebParam(name = "user_bio") String user_bio, @WebParam(name = "user_address") String user_address, @WebParam(name = "user_username") String user_username, @WebParam(name = "user_password") String user_password, @WebParam(name = "place_id") String place_id) {
        String result = "";
        String ins = "insert into tbl_user (user_name,user_contact,user_email,user_gen,user_bio,user_address,user_username,user_password,user_doj,place_id)value('" + user_name + "','" + user_contact + "','" + user_email + "','" + user_gen + "','" + user_bio + "','" + user_address + "','" + user_username + "','" + user_password + "',curdate(),'" + place_id + "')";
        boolean status = con.executeCommand(ins);
        //System.out.println(ins);
        if (status == true) {
            result = "Inserted Successfully";
        } else {
            result = "Insertion Faild";
        }
        return result;

    }

    /**
     * Web service operation
     */
    /**
     * Web service operation
     */
    @WebMethod(operationName = "GetPassword")
    public String GetPassword(@WebParam(name = "current_password") String current_password, @WebParam(name = "new_password") String new_password, @WebParam(name = "confirm_password") String confirm_password, @WebParam(name = "user_id") String user_id) {
        //TODO write your implementation code here:
        String result = "";
        String sel = "select * from tbl_user where user_id='" + user_id + "' and user_password='" + current_password + "'";
        //System.out.println(current_password);
        //System.out.println(new_password);System.out.println(confirm_password);
        //System.out.println(sel);
        ResultSet rs = con.selectCommand(sel);
        try {
            if (rs.next()) {
                if (new_password.equals(confirm_password)) {
                    String edit = "update tbl_user set user_password='" + new_password + "' where user_id='" + user_id + "'";
                    boolean status = con.executeCommand(edit);

                    if (status == true) {
                        result = "Inserted Successfully ";
                    } else {
                        result = "Insertion faild";
                    }
                }
            }
        } catch (Exception e) {
        }
        return result;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "GetFeedback")
    public String GetFeedback(@WebParam(name = "feedback_condent") String feedback_condent) {
        //TODO write your implementation code here:
        String result = "";
        String ins = "insert into tbl_feedback(feedback_condent,user_id)value('" + feedback_condent + "','20')";
        //System.out.println(ins);
        if (con.executeCommand(ins)) {
            result = "Feed Back send successfully";
        } else {
            result = "Error";
        }
        return result;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "GetComplaintType")
    public String GetComplaintType() {
        //TODO write your implementation code here:
        String sel = "select * from tbl_complainttype";
        ResultSet rs = con.selectCommand(sel);
        JSONArray j = new JSONArray();
        try {
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                {
                    try {
                        jo.put("comid", rs.getString("complainttype_id"));
                        jo.put("complaint", rs.getString("complainttype_name"));
                        j.put(jo);
                    } catch (SQLException | JSONException e) {
                        Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, e);
                    }
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, e);
        }
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "GetComplaint")
    public String GetComplaint(@WebParam(name = "complainttype_id") String complainttype_id, @WebParam(name = "complaint") String complaint, @WebParam(name = "user_id") String user_id) {
        //TODO write your implementation code here:
        String result = "";
        String ins = "insert into tbl_complaint(complaint_condent,complainttype_id,complaint_date,user_id)value('" + complaint + "','" + complainttype_id + "',curdate(),'" + user_id + "')";
        //System.out.println(ins);
        if (con.executeCommand(ins)) {
            result = "Complaint send";
        } else {
            result = "Error";
        }
        return result;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "GetUserProfile")
    public String GetUserProfile(@WebParam(name = "user_id") String user_id) {
        String sel = "select * from tbl_user where user_id='" + user_id + "'";
        // System.out.println(sel);
        ResultSet rs = con.selectCommand(sel);
        JSONArray j = new JSONArray();
        try {
            if (rs.next()) {
                JSONObject jo = new JSONObject();
                {
                    try {
                        jo.put("name", rs.getString("user_name"));
                        jo.put("contact", rs.getString("user_contact"));
                        jo.put("email", rs.getString("user_email"));
                        jo.put("gender", rs.getString("user_gen"));
                        jo.put("bio", rs.getString("user_bio"));
                        jo.put("address", rs.getString("user_address"));
                        jo.put("username", rs.getString("user_username"));
                        // System.out.println(jo);
                        j.put(jo);
                    } catch (SQLException | JSONException e) {
                        Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, e);
                    }
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, e);
        }
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "EditProfile")
    public String EditProfile(@WebParam(name = "user_id") String user_id, @WebParam(name = "name") String name, @WebParam(name = "contact") String contact, @WebParam(name = "email") String email, @WebParam(name = "gender") String gender, @WebParam(name = "bio") String bio, @WebParam(name = "address") String address, @WebParam(name = "username") String username) {
        //TODO write your implementation code here:
        String result = "";
        String Update = "update tbl_user set user_name='" + name + "', user_contact='" + contact + "', user_email='" + email + "', user_gen='" + gender + "', user_bio='" + bio + "', user_address='" + address + "', user_username='" + username + "' where user_id='" + user_id + "'";
        System.out.println(Update);
        if (con.executeCommand(Update)) {
            result = "Up Dated";
        } else {
            result = "Error";
        }
        return result;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "GetLogin")
    public String GetLogin(@WebParam(name = "username") String username, @WebParam(name = "password") String password) {
        //TODO write your implementation code here:
        String id = "";
        String sel = "select * from tbl_user where user_username='" + username + "' and user_password='" + password + "'";
        System.out.println(sel);
        ResultSet rs = con.selectCommand(sel);
        try {

            if (rs.next()) {
                id = rs.getString("user_id");
                System.out.println(id);
            }

        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "getShop")
    public String getShop(@WebParam(name = "tid") String tid, @WebParam(name = "pid") String pid) {
        int i = 0;
        String sel = "select * from tbl_shop where place_id='" + tid + "' and shoptype_id='" + pid + "';";
        //System.out.println(sel);
        ResultSet rs = con.selectCommand(sel);
        JSONArray j = new JSONArray();
        try {
            while (rs.next()) {
                i++;
                JSONObject jo = new JSONObject();
                {
                    try {
                        jo.put("no", i);
                        jo.put("sname", rs.getString("shop_name"));
                        jo.put("view", "View");
                        jo.put("id", rs.getString("shop_id"));
                        j.put(jo);
                    } catch (SQLException | JSONException e) {
                        Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, e);
                    }
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, e);
        }
        //System.out.println(j.toString());
        return j.toString();
    }

    @WebMethod(operationName = "GetShowroom")
    public String GetShowroom(@WebParam(name = "districtid") String districtid, @WebParam(name = "placeid") String placeid) {
        int i = 0;
        String sel = "select * from tbl_showroom where place_id='" + placeid + "' and district_id='" + districtid + "';";
        //System.out.println(sel);
        ResultSet rs = con.selectCommand(sel);
        JSONArray j = new JSONArray();
        try {
            while (rs.next()) {
                i++;
                JSONObject jo = new JSONObject();
                {
                    try {
                        jo.put("no", i);
                        jo.put("shname", rs.getString("showroom_name"));
                        jo.put("view", "View");
                        jo.put("id", rs.getString("showroom_id"));

                        j.put(jo);
                    } catch (SQLException | JSONException e) {
                        Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, e);
                    }
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, e);
        }
        //System.out.println(j.toString());
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "GetVehicleCat")
    public String GetVehicleCat() {
        //TODO write your implementation code here:
        String Sel = "select * from tbl_vehiclecat";
        ResultSet rs = con.selectCommand(Sel);
        JSONArray j = new JSONArray();
        try {
            while (rs.next())
            {
                JSONObject jo = new JSONObject();                
                {
                    try {
                        jo.put("vehiclecatid", rs.getString("vehiclecat_id"));
                        jo.put("vehiclecatname", rs.getString("vehiclecat_name"));
                        j.put(jo);
                    } catch (JSONException ex) {
                        Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                    }
                 
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "GetVehicleCom")
    public String GetVehicleCom(@WebParam(name = "vehiclecatid") String vehiclecatid) {
        //TODO write your implementation code here:
        String sel = "select * from tbl_vehiclecom where vehiclecat_id='"+vehiclecatid+"'";
        System.out.println(sel);
        ResultSet rs = con.selectCommand(sel);
        JSONArray j = new JSONArray();
        try {
            while (rs.next()){
                JSONObject jo = new JSONObject();
                try {
                    jo.put("vehiclecomid", rs.getString("vehiclecom_id"));
                    jo.put("vehiclecomname", rs.getString("vehiclecom_name"));
                    j.put(jo);
                } catch (JSONException ex) {
                    Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                }
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "VehicleReg")
    public String VehicleReg(@WebParam(name = "vehiclename") String vehiclename, @WebParam(name = "vehiclemodel") String vehiclemodel, @WebParam(name = "vehiclecat") String vehiclecat, @WebParam(name = "vehiclecom") String vehiclecom, @WebParam(name = "user_id") String user_id) {
        //TODO write your implementation code here:
        String result="";
        String ins = "insert into tbl_uservehicle(uv_name,uv_model,user_id,vehiclecom_id,vehiclecat_id) values('"+vehiclename+"','"+vehiclemodel+"','"+user_id+"','"+vehiclecom+"','"+vehiclecat+"')";
      // System.out.println(ins);
        //System.out.println(vehiclecat);
        // System.out.println(vehiclecom);
        if(con.executeCommand(ins))
        {
            result = "Inserted";
        }else
        {
            result = "error";
        }
        return result;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "GetShopProfile")
    public String GetShopProfile(@WebParam(name = "shop_id") String shop_id) {
        //TODO write your implementation code here:
        String Sel = "select * from tbl_shop s inner join tbl_place p on s.place_id = p.place_id inner join tbl_district d on p.district_id=d.district_id where shop_id='"+shop_id+"'";
        ResultSet rs = con.selectCommand(Sel);
        //System.out.println(Sel);
        //System.out.println(shop_id);
        JSONArray j = new JSONArray();
        try {
            if(rs.next()){
                JSONObject jo = new JSONObject();
                try {
                    jo.put("name", rs.getString("shop_name"));
                    jo.put("address", rs.getString("shop_address"));
                    jo.put("landmark1", rs.getString("shop_landmar1"));
                    jo.put("landmark2", rs.getString("shop_landmar2"));
                    jo.put("email", rs.getString("shop_email"));
                    jo.put("contact", rs.getString("shop_contact"));
                    jo.put("district", rs.getString("district_name"));
                    jo.put("place", rs.getString("place_name"));
                    j.put(jo);
                } catch (JSONException ex) {
                    Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                }
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "GetShowroomProfile")
    public String GetShowroomProfile(@WebParam(name = "showroom_id") String showroom_id) {
        //TODO write your implementation code here:
        String sel = "select * from tbl_showroom s inner join tbl_place p on s.place_id = p.place_id inner join tbl_district d on p.district_id=d.district_id where shop_id='"+showroom_id+"'";
        ResultSet rs = con.selectCommand(sel);
        JSONArray j = new JSONArray();
        try {
            if(rs.next()){
                JSONObject jo = new JSONObject();
                try {
                    jo.put("name", rs.getString("Showroom_name"));
                    jo.put("address", rs.getString("showroom_address"));
                    jo.put("contact", rs.getString("showroom_contact"));
                    jo.put("email", rs.getString("showroom_email"));
                    jo.put("district", rs.getString("district_name"));
                    jo.put("place", rs.getString("place_name"));
                    j.put(jo);
                } catch (JSONException ex) {
                    Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return j.toString();
    }


   

}
