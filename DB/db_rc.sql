# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     db_rc
# Server version:               5.0.51b-community-nt
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    28-11-2023 14:56:57
# --------------------------------------------------------

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI,NO_BACKSLASH_ESCAPES';*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;*/


#
# Database structure for database 'db_rc'
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ "db_rc" /*!40100 DEFAULT CHARACTER SET latin1 */;

USE "db_rc";


#
# Table structure for table 'tbl_admin'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_admin" (
  "admin_id" tinyint(3) unsigned NOT NULL auto_increment,
  "admin_name" varchar(50) default NULL,
  "admin_password" varchar(50) default NULL,
  PRIMARY KEY  ("admin_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_admin'
#

LOCK TABLES "tbl_admin" WRITE;
/*!40000 ALTER TABLE "tbl_admin" DISABLE KEYS;*/
REPLACE INTO "tbl_admin" ("admin_id", "admin_name", "admin_password") VALUES
	(1,'jeninjoy','jeninjoy123');
/*!40000 ALTER TABLE "tbl_admin" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_club'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_club" (
  "club_id" tinyint(3) unsigned NOT NULL auto_increment,
  "club_name" varchar(50) default NULL,
  "club_contact" varchar(50) default NULL,
  "club_email" varchar(50) default NULL,
  "club_logo" varchar(50) default NULL,
  "club_proof" varchar(50) default NULL,
  "vehiclecat_id" tinyint(3) unsigned default NULL,
  "user_id" tinyint(3) unsigned default NULL,
  "district_id" tinyint(3) unsigned default NULL,
  "clubtype_id" tinyint(3) unsigned default NULL,
  PRIMARY KEY  ("club_id")
);



#
# Dumping data for table 'tbl_club'
#

# No data found.



#
# Table structure for table 'tbl_clubtype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_clubtype" (
  "clubtype_id" tinyint(3) unsigned NOT NULL auto_increment,
  "clubtype_name" varchar(50) default NULL,
  PRIMARY KEY  ("clubtype_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_clubtype'
#

LOCK TABLES "tbl_clubtype" WRITE;
/*!40000 ALTER TABLE "tbl_clubtype" DISABLE KEYS;*/
REPLACE INTO "tbl_clubtype" ("clubtype_id", "clubtype_name") VALUES
	(1,'Two Wheel');
/*!40000 ALTER TABLE "tbl_clubtype" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_complaint'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_complaint" (
  "complaint_id" tinyint(3) unsigned NOT NULL auto_increment,
  "complaint_content" varchar(50) default NULL,
  "complaint_date" date default NULL,
  "complainttype_id" tinyint(3) unsigned default NULL,
  "show_id" tinyint(3) unsigned default NULL,
  "showroom_id" tinyint(3) unsigned default NULL,
  "user_id" tinyint(3) unsigned default NULL,
  "complaint_status" varchar(50) default '0',
  PRIMARY KEY  ("complaint_id")
);



#
# Dumping data for table 'tbl_complaint'
#

# No data found.



#
# Table structure for table 'tbl_complainttype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_complainttype" (
  "complainttype_id" tinyint(3) unsigned NOT NULL auto_increment,
  "complainttype_name" varchar(3) default NULL,
  PRIMARY KEY  ("complainttype_id")
);



#
# Dumping data for table 'tbl_complainttype'
#

# No data found.



#
# Table structure for table 'tbl_district'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_district" (
  "district_id" tinyint(3) unsigned NOT NULL auto_increment,
  "district_name" varchar(50) default NULL,
  PRIMARY KEY  ("district_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_district'
#

LOCK TABLES "tbl_district" WRITE;
/*!40000 ALTER TABLE "tbl_district" DISABLE KEYS;*/
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(1,'Ernakulam');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(2,'kottayam');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(3,'Idukki');
/*!40000 ALTER TABLE "tbl_district" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_event'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_event" (
  "event_id" tinyint(3) unsigned NOT NULL auto_increment,
  "event_name" varchar(50) default NULL,
  "event_location" varchar(50) default NULL,
  "event_landmark1" varchar(50) default NULL,
  "event_landmark2" varchar(50) default NULL,
  "event_logo" varchar(50) default NULL,
  "event_duration" varchar(50) default NULL,
  "event_startdate" date default NULL,
  "event_rules" varchar(50) default NULL,
  "event_contact" varchar(50) default NULL,
  "event_tickets" varchar(50) default NULL,
  "event_totoaltickets" varchar(50) default NULL,
  "event_ticketrate" varchar(50) default NULL,
  "eventtype_id" tinyint(3) unsigned default NULL,
  "club_id" tinyint(3) unsigned default NULL,
  "place_id" tinyint(3) unsigned default NULL,
  PRIMARY KEY  ("event_id")
);



#
# Dumping data for table 'tbl_event'
#

# No data found.



#
# Table structure for table 'tbl_eventbooking'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_eventbooking" (
  "booking_totalticket" varchar(50) default NULL,
  "booking_totaltamount" varchar(50) default NULL,
  "booking_date" date default NULL,
  "shop_id" tinyint(3) unsigned default NULL,
  "showroom_id" tinyint(3) unsigned default NULL,
  "user_id" tinyint(3) unsigned default NULL,
  "event_id" tinyint(3) unsigned default NULL,
  "booking_id" tinyint(3) unsigned NOT NULL auto_increment,
  PRIMARY KEY  ("booking_id")
);



#
# Dumping data for table 'tbl_eventbooking'
#

# No data found.



#
# Table structure for table 'tbl_eventtype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_eventtype" (
  "eventtype_id" tinyint(3) unsigned NOT NULL auto_increment,
  "eventtype_name" varchar(50) default NULL,
  PRIMARY KEY  ("eventtype_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_eventtype'
#

LOCK TABLES "tbl_eventtype" WRITE;
/*!40000 ALTER TABLE "tbl_eventtype" DISABLE KEYS;*/
REPLACE INTO "tbl_eventtype" ("eventtype_id", "eventtype_name") VALUES
	(1,'2 Day Event');
/*!40000 ALTER TABLE "tbl_eventtype" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_feedback'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_feedback" (
  "feedback_id" tinyint(3) unsigned NOT NULL auto_increment,
  "feedback_content" varchar(50) default NULL,
  "shop_id" tinyint(3) unsigned default NULL,
  "showroom_id" tinyint(3) unsigned default NULL,
  "user_id" tinyint(3) unsigned default NULL,
  PRIMARY KEY  ("feedback_id")
);



#
# Dumping data for table 'tbl_feedback'
#

# No data found.



#
# Table structure for table 'tbl_partsbooking'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_partsbooking" (
  "partsbooking_id" tinyint(3) unsigned NOT NULL auto_increment,
  "partsbooking_number" varchar(50) default NULL,
  "partsbooking_name" varchar(50) default NULL,
  "partsbooking_amount" varchar(50) default NULL,
  "partsbooking_date" date default NULL,
  "user_id" tinyint(3) unsigned default NULL,
  "showroom_id" tinyint(3) unsigned default NULL,
  "shop_id" tinyint(3) unsigned default NULL,
  PRIMARY KEY  ("partsbooking_id")
);



#
# Dumping data for table 'tbl_partsbooking'
#

# No data found.



#
# Table structure for table 'tbl_place'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_place" (
  "place_id" tinyint(3) unsigned NOT NULL auto_increment,
  "place_name" varchar(50) default NULL,
  "district_id" tinyint(3) unsigned default NULL,
  PRIMARY KEY  ("place_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_place'
#

LOCK TABLES "tbl_place" WRITE;
/*!40000 ALTER TABLE "tbl_place" DISABLE KEYS;*/
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	(1,'Angamaly',1);
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	(2,'Malayattoor',1);
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	(3,'Thodupuzha',3);
/*!40000 ALTER TABLE "tbl_place" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_requestclub'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_requestclub" (
  "requestclub_id" tinyint(3) unsigned NOT NULL auto_increment,
  "requestclub_rdate" date default NULL,
  "shop_id" tinyint(3) unsigned default NULL,
  "showroom_id" tinyint(3) unsigned default NULL,
  "user_id" tinyint(3) unsigned default NULL,
  "club_id" tinyint(3) unsigned default NULL,
  PRIMARY KEY  ("requestclub_id")
);



#
# Dumping data for table 'tbl_requestclub'
#

# No data found.



#
# Table structure for table 'tbl_shop'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_shop" (
  "shop_id" tinyint(3) unsigned NOT NULL auto_increment,
  "shop_name" varchar(50) default NULL,
  "shop_contact" varchar(50) default NULL,
  "shop_email" varchar(50) default NULL,
  "shop_landmar1" varchar(50) default NULL,
  "shop_landmar2" varchar(50) default NULL,
  "shop_address" varchar(50) default NULL,
  "shop_logo" varchar(50) default NULL,
  "shop_proof" varchar(50) default NULL,
  "shop_password" varchar(50) default NULL,
  "shop_doj" date default NULL,
  "shop_username" varchar(50) default NULL,
  "shop_licno" varchar(50) default NULL,
  "shoptype_id" tinyint(3) unsigned default NULL,
  "place_id" tinyint(3) unsigned default NULL,
  "shop_pstatus" varchar(50) default '0',
  PRIMARY KEY  ("shop_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_shop'
#

LOCK TABLES "tbl_shop" WRITE;
/*!40000 ALTER TABLE "tbl_shop" DISABLE KEYS;*/
REPLACE INTO "tbl_shop" ("shop_id", "shop_name", "shop_contact", "shop_email", "shop_landmar1", "shop_landmar2", "shop_address", "shop_logo", "shop_proof", "shop_password", "shop_doj", "shop_username", "shop_licno", "shoptype_id", "place_id", "shop_pstatus") VALUES
	(1,'shop 1','7894561230','shop1@gmail.com','aaa','bbb','hbs  kshbv kjsnjv ksjdvk sjvjb skdb ksbdvv','logo_1314.png','Proof_1375.png','shop123','2023-11-28','shop','789546',1,1,'1');
/*!40000 ALTER TABLE "tbl_shop" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_shoptype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_shoptype" (
  "shoptype_id" tinyint(3) unsigned NOT NULL auto_increment,
  "shoptype_name" varchar(50) default NULL,
  PRIMARY KEY  ("shoptype_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_shoptype'
#

LOCK TABLES "tbl_shoptype" WRITE;
/*!40000 ALTER TABLE "tbl_shoptype" DISABLE KEYS;*/
REPLACE INTO "tbl_shoptype" ("shoptype_id", "shoptype_name") VALUES
	(1,'Modification');
/*!40000 ALTER TABLE "tbl_shoptype" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_showroom'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_showroom" (
  "showroom_id" tinyint(3) unsigned NOT NULL auto_increment,
  "showroom_name" varchar(50) default NULL,
  "showroom_contact" varchar(50) default NULL,
  "showroom_email" varchar(50) default NULL,
  "showroom_address" varchar(50) default NULL,
  "showroom_username" varchar(50) default NULL,
  "showroom_password" varchar(50) default NULL,
  "showroom_proof" varchar(50) default NULL,
  "showroom_photo" varchar(50) default NULL,
  "showroom_doj" date default NULL,
  "vehiclecom_id" tinyint(3) unsigned default NULL,
  "vehiclecat_id" tinyint(3) unsigned default NULL,
  "place_id" tinyint(3) unsigned default NULL,
  "district_id" tinyint(3) unsigned default NULL,
  "showroom_pstatus" varchar(50) default '0',
  PRIMARY KEY  ("showroom_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_showroom'
#

LOCK TABLES "tbl_showroom" WRITE;
/*!40000 ALTER TABLE "tbl_showroom" DISABLE KEYS;*/
REPLACE INTO "tbl_showroom" ("showroom_id", "showroom_name", "showroom_contact", "showroom_email", "showroom_address", "showroom_username", "showroom_password", "showroom_proof", "showroom_photo", "showroom_doj", "vehiclecom_id", "vehiclecat_id", "place_id", "district_id", "showroom_pstatus") VALUES
	(1,'showroom 1','9874563210','showroom1@gmail.com','sacjsdvojnnvd','showroom','showroom123','Proof_1196.png','photo_2015.png','2023-11-28',1,1,1,1,'1');
/*!40000 ALTER TABLE "tbl_showroom" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_user'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_user" (
  "user_id" tinyint(3) unsigned NOT NULL auto_increment,
  "user_name" varchar(50) default NULL,
  "user_email" varchar(50) default NULL,
  "user_contact" varchar(50) default NULL,
  "user_address" varchar(50) default NULL,
  "user_gen" varchar(50) default NULL,
  "user_bio" varchar(50) default NULL,
  "user_username" varchar(50) default NULL,
  "user_password" varchar(50) default NULL,
  "user_doj" date default NULL,
  "place_id" tinyint(3) unsigned default NULL,
  "user_pstatus" tinyint(3) unsigned default '0',
  PRIMARY KEY  ("user_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_user'
#

LOCK TABLES "tbl_user" WRITE;
/*!40000 ALTER TABLE "tbl_user" DISABLE KEYS;*/
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_email", "user_contact", "user_address", "user_gen", "user_bio", "user_username", "user_password", "user_doj", "place_id", "user_pstatus") VALUES
	(3,'Jenin Joy','jeninjoy21@gmail.com','9539891072','Avittampilly(H) Naduvattom p.o
kalady via, EKM','male','Traveller...','jenin','jenin123','2023-11-27',2,1);
/*!40000 ALTER TABLE "tbl_user" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_usergallery'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_usergallery" (
  "usergallery_id" tinyint(3) unsigned NOT NULL auto_increment,
  "usergallery_photo" varchar(50) default NULL,
  "user_id" tinyint(3) unsigned default NULL,
  PRIMARY KEY  ("usergallery_id")
);



#
# Dumping data for table 'tbl_usergallery'
#

# No data found.



#
# Table structure for table 'tbl_uservehicle'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_uservehicle" (
  "uv_id" tinyint(3) unsigned NOT NULL auto_increment,
  "uv_name" varchar(50) default NULL,
  "uv_model" varchar(50) default NULL,
  "uv_photo" varchar(50) default NULL,
  "uv_liproof" varchar(50) default NULL,
  "user_id" tinyint(3) unsigned default NULL,
  "vehiclecat_id" tinyint(3) unsigned default NULL,
  "vehiclecom_id" tinyint(3) unsigned default NULL,
  PRIMARY KEY  ("uv_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_uservehicle'
#

LOCK TABLES "tbl_uservehicle" WRITE;
/*!40000 ALTER TABLE "tbl_uservehicle" DISABLE KEYS;*/
REPLACE INTO "tbl_uservehicle" ("uv_id", "uv_name", "uv_model", "uv_photo", "uv_liproof", "user_id", "vehiclecat_id", "vehiclecom_id") VALUES
	(1,'Standered 350','2018','photo_1948.png','lic_no_1437.png',3,1,1);
/*!40000 ALTER TABLE "tbl_uservehicle" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_vehiclecat'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_vehiclecat" (
  "vehiclecat_id" tinyint(3) unsigned NOT NULL auto_increment,
  "vehiclecat_name" varchar(50) default NULL,
  PRIMARY KEY  ("vehiclecat_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_vehiclecat'
#

LOCK TABLES "tbl_vehiclecat" WRITE;
/*!40000 ALTER TABLE "tbl_vehiclecat" DISABLE KEYS;*/
REPLACE INTO "tbl_vehiclecat" ("vehiclecat_id", "vehiclecat_name") VALUES
	(1,'2 wheeler');
/*!40000 ALTER TABLE "tbl_vehiclecat" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_vehiclecom'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_vehiclecom" (
  "vehiclecom_id" tinyint(3) unsigned NOT NULL auto_increment,
  "vehiclecom_name" varchar(50) default NULL,
  "vehiclecat_id" tinyint(3) unsigned default NULL,
  PRIMARY KEY  ("vehiclecom_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_vehiclecom'
#

LOCK TABLES "tbl_vehiclecom" WRITE;
/*!40000 ALTER TABLE "tbl_vehiclecom" DISABLE KEYS;*/
REPLACE INTO "tbl_vehiclecom" ("vehiclecom_id", "vehiclecom_name", "vehiclecat_id") VALUES
	(1,'Royal Enfield',1);
/*!40000 ALTER TABLE "tbl_vehiclecom" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_vehicleparts'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_vehicleparts" (
  "vehicleparts_id" tinyint(3) unsigned NOT NULL auto_increment,
  "vehicleparts_name" varchar(50) default NULL,
  "vehicleparts_photo" varchar(50) default NULL,
  "vehicleparts_amt" varchar(50) default NULL,
  "shop_id" tinyint(3) unsigned default NULL,
  "showroom_id" tinyint(3) unsigned default NULL,
  PRIMARY KEY  ("vehicleparts_id")
);



#
# Dumping data for table 'tbl_vehicleparts'
#

# No data found.

/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/
