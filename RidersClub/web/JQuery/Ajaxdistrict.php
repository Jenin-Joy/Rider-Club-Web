<?php
$con=mysql_connect("localhost","root","");
mysql_select_db("db_interactiveportal",$con);
$stateid=$_REQUEST['sid'];
?>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>AjaxDistrict::interactiveportal</title>
</head>

<body>
<option>--Select--</option>
      <?php
	  $sel="select * from tbl_district where state_id='".$stateid."'";
	  $exe=mysql_query($sel); 
	  while($row=mysql_fetch_array($exe))
	  {
		  
	  ?>
      <option value="<?php echo $row['dist_id'];?>"><?php echo $row['district'];?></option>
      <?php
	  }
	  ?>
</body>
</html>