<?php
$con=mysql_connect("localhost","root","");
mysql_select_db("db_interactiveportal",$con);

if(isset($_POST['btnsubmit']))
{
$var=$_POST['txtplace'];
$distid=$_POST['listdistrict'];
$insert="insert into tbl_place(place_name,dist_id) values('".$var."','".$distid."')";
mysql_query($insert,$con);
echo"<script>alert('successfully inserted')</script>";
header("location:PlaceDetails.php");
}
?>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PlaceDetails::interactiveportal</title>




<script src="jQuery.js" type="text/javascript"></script>





<script>
function getdis(a)
{
	//alert(a);
	$.ajax({url:"Ajaxdistrict.php?sid="+a,
	success: function(result){
	$("#listdistrict").html(result);}});
}
</script>





</head>

<body>
<form id="form1" name="form1" method="post" action="">
  <table width="200" border="1">
    <tr>
      <td width="67"> State</td>
      <td width="117"><label for="liststate"></label>
        <select name="liststate" id="liststate" onchange="getdis(this.value)">
        <option>--select--</option>
        <?php
		$sel="select * from tbl_state";
		$rows=mysql_query($sel);
		while($data=mysql_fetch_array($rows))
		{
			$stateid=$data['state_id'];
			$state=$data['state_name'];
			?>
			<option value="<?php echo $stateid;?>"><?php echo $state;?></option>
             
			<?php
		}
			?>
            
      </select></td>
    </tr>
    <tr>
      <td>District</td>
      <td><label for="listdistrict"></label>
        <select name="listdistrict" id="listdistrict">
      </select></td>
    </tr>
    <tr>
      <td>place</td>
      <td><label for="txtplace"></label>
      <input type="text" name="txtplace" id="txtplace" /></td>
    </tr>
    <tr>
      <td colspan="2"><div align="center">
        <input type="submit" name="btnsubmit" id="btnsubmit" value="Submit" />
        <input type="reset" name="btncancel" id="btncancel" value="cancel" />
      </div></td>
    </tr>
  </table>
</form>
<table border="1">
<tr>
<th>state</th>
<th>district</th>
<th>place</th>
</tr>
<?php
$select="select * from tbl_place p inner join tbl_district d on d.dist_id=p.dist_id inner join tbl_state s on s.state_id=d.state_id";
$row=mysql_query($select,$con);
while($data=mysql_fetch_array($row))
{
	?>
    <tr>
    <td><?php echo $data['state_name'];?></td>
    <td><?php echo $data['district'];?></td>
    <td><?php echo $data['place_name'];?></td>

    </tr>
    <?php
}
?>
</table>
</body>
</html>