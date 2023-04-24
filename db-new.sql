/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 5.6.12-log : Database - safe_journey1
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`safe_journey1` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `safe_journey1`;

/*Table structure for table `allocation` */

DROP TABLE IF EXISTS `allocation`;

CREATE TABLE `allocation` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) DEFAULT NULL,
  `bid` int(11) DEFAULT NULL,
  `fees` int(11) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `allocation` */

insert  into `allocation`(`aid`,`sid`,`bid`,`fees`) values 
(1,1,1,4000),
(2,2,2,7000);

/*Table structure for table `bus` */

DROP TABLE IF EXISTS `bus`;

CREATE TABLE `bus` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `bus_number` varchar(50) DEFAULT NULL,
  `chasis_number` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `destination` varchar(50) NOT NULL,
  `route_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`bid`,`destination`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `bus` */

insert  into `bus`(`bid`,`bus_number`,`chasis_number`,`model`,`destination`,`route_id`) values 
(1,'1','KL 18 J 1111','Tumbo','vadakara',1),
(2,'2','KL 58 Q 1000','Mini','thalasseri',2);

/*Table structure for table `complaints` */

DROP TABLE IF EXISTS `complaints`;

CREATE TABLE `complaints` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `complaint` varchar(200) DEFAULT NULL,
  `reply` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `complaints` */

insert  into `complaints`(`cid`,`pid`,`complaint`,`reply`,`date`) values 
(1,2,'over speed','sorry','2023-04-11');

/*Table structure for table `driver` */

DROP TABLE IF EXISTS `driver`;

CREATE TABLE `driver` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `dlid` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone_number` int(11) DEFAULT NULL,
  `place` varchar(50) DEFAULT NULL,
  `post` varchar(50) DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `license_number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `driver` */

insert  into `driver`(`did`,`dlid`,`name`,`email`,`phone_number`,`place`,`post`,`pin`,`age`,`bus_id`,`license_number`) values 
(1,5,'Kuttan','kuttan@gmail.com',2147483647,'iringannur','edacheri',673502,32,1,'KL2021000012038'),
(2,6,'shibu','shibu@gmail.com',2147483647,'mahe','mahe',63872,23,2,'du2839h');

/*Table structure for table `entry` */

DROP TABLE IF EXISTS `entry`;

CREATE TABLE `entry` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) DEFAULT NULL,
  `check_in_time` varchar(11) DEFAULT NULL,
  `check_out_time` varchar(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT 'pending',
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `entry` */

insert  into `entry`(`eid`,`sid`,`check_in_time`,`check_out_time`,`date`,`status`) values 
(1,1,'20:06:36','20:07:48','2023-04-11','checkout'),
(2,2,'20:07:15','pending','2023-04-11','checkin');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`lid`,`email`,`password`,`type`) values 
(1,'admin','admin','admin'),
(2,'muhamed@gmail.com','1234','parent'),
(3,'shashi@gmail.com','3893940394','parent'),
(4,'raju@gmail.com','9843848732','parent'),
(5,'kuttan@gmail.com','34567','driver'),
(6,'shibu@gmail.com','9439882384','driver');

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `did` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `message` varchar(200) DEFAULT NULL,
  `date` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `message` */

/*Table structure for table `parent` */

DROP TABLE IF EXISTS `parent`;

CREATE TABLE `parent` (
  `parent_id` int(11) NOT NULL,
  `p_name` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `job` varchar(100) DEFAULT NULL,
  `plid` int(11) DEFAULT NULL,
  PRIMARY KEY (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `parent` */

insert  into `parent`(`parent_id`,`p_name`,`phone`,`email`,`job`,`plid`) values 
(2,'muhammed','1234566675','muhamed@gmail.com','business',2),
(3,'shashi','3893940394','shashi@gmail.com','sales',3);

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `last_date` varchar(100) DEFAULT NULL,
  `fees` int(11) DEFAULT NULL,
  `plid` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `payment` */

insert  into `payment`(`pid`,`last_date`,`fees`,`plid`) values 
(1,'1970-01-22',4000,1),
(2,'2023-04-11',7000,2);

/*Table structure for table `route` */

DROP TABLE IF EXISTS `route`;

CREATE TABLE `route` (
  `route_id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(50) DEFAULT NULL,
  `to` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `route` */

insert  into `route`(`route_id`,`from`,`to`) values 
(1,'vadakara','puliyavu'),
(2,'thalasseri','puliyavu');

/*Table structure for table `route_point` */

DROP TABLE IF EXISTS `route_point`;

CREATE TABLE `route_point` (
  `route_point_id` int(11) NOT NULL AUTO_INCREMENT,
  `route_id` int(11) DEFAULT NULL,
  `route_point` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`route_point_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `route_point` */

insert  into `route_point`(`route_point_id`,`route_id`,`route_point`) values 
(1,1,'Edacheri'),
(2,2,'thalasseri');

/*Table structure for table `status` */

DROP TABLE IF EXISTS `status`;

CREATE TABLE `status` (
  `statusid` int(11) NOT NULL AUTO_INCREMENT,
  `did` int(11) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`statusid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `status` */

insert  into `status`(`statusid`,`did`,`status`) values 
(1,5,'break down');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `class` varchar(100) DEFAULT NULL,
  `division` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `blood_group` varchar(50) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `post` varchar(50) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `pin` varchar(25) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `plid` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `student` */

insert  into `student`(`sid`,`name`,`class`,`division`,`gender`,`blood_group`,`place`,`post`,`district`,`pin`,`photo`,`plid`) values 
(1,'adil','lkg','B','male','A-','edacheri','edacheri','kozhikode','45005CD36EA4','/static/student/download (6).jpeg',2),
(2,'raju','2nd','B','male','A-','thalasseri','thalasseri','kannur','5900D49ABDAA','/static/student/download (5).jpeg',3);

/*Table structure for table `track` */

DROP TABLE IF EXISTS `track`;

CREATE TABLE `track` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `bid` int(11) DEFAULT NULL,
  `time` varchar(233) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `place` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=latin1;

/*Data for the table `track` */

insert  into `track`(`tid`,`bid`,`time`,`date`,`latitude`,`longitude`,`place`) values 
(1,0,'21:20:31','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(2,0,'21:20:31','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(3,0,'21:20:35','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(4,0,'21:20:36','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(5,0,'21:20:36','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(6,0,'21:20:41','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(7,0,'21:20:42','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(8,0,'21:20:42','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(9,0,'21:20:45','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(10,0,'21:20:46','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(11,0,'21:20:46','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(12,0,'21:20:51','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(13,0,'21:20:52','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(14,0,'21:20:52','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(15,0,'21:20:56','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(16,0,'21:20:57','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(17,0,'21:20:57','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(18,0,'21:21:01','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(19,0,'21:21:01','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(20,0,'21:21:02','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(21,0,'21:21:06','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(22,0,'21:21:07','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(23,0,'21:21:07','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(24,0,'21:21:11','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(25,0,'21:21:12','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(26,0,'21:21:12','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(27,0,'21:21:18','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(28,0,'21:21:18','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(29,0,'21:21:18','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(30,0,'21:21:21','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(31,0,'21:21:22','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(32,0,'21:21:22','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(33,0,'21:21:26','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(34,0,'21:21:27','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(35,0,'21:21:27','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(36,0,'21:21:31','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(37,0,'21:21:32','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(38,0,'21:21:32','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(39,0,'21:21:37','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(40,0,'21:21:37','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(41,0,'21:21:37','2023-04-11','11.2589797','75.7839354','Cee Cee Center'),
(52,0,'21:21:57','2023-04-11','11.2589678','75.783942','Cee Cee Center'),
(53,0,'21:21:57','2023-04-11','11.2589678','75.783942','Cee Cee Center'),
(54,0,'21:22:02','2023-04-11','11.2589678','75.783942','Cee Cee Center'),
(55,0,'21:22:02','2023-04-11','11.2589678','75.783942','Cee Cee Center'),
(56,0,'21:22:02','2023-04-11','11.2589678','75.783942','Cee Cee Center'),
(57,0,'21:22:07','2023-04-11','11.2589678','75.783942','Cee Cee Center'),
(58,0,'21:22:08','2023-04-11','11.2589678','75.783942','Cee Cee Center'),
(59,0,'21:22:08','2023-04-11','11.2589678','75.783942','Cee Cee Center'),
(60,0,'21:22:12','2023-04-11','11.2589678','75.783942','Cee Cee Center'),
(61,0,'21:22:12','2023-04-11','11.2589678','75.783942','Cee Cee Center'),
(62,0,'21:22:12','2023-04-11','11.2589678','75.783942','Cee Cee Center'),
(63,0,'21:22:16','2023-04-11','11.2589678','75.783942','Cee Cee Center'),
(64,0,'21:22:17','2023-04-11','11.2589678','75.783942','Cee Cee Center'),
(65,0,'21:22:17','2023-04-11','11.2589678','75.783942','Cee Cee Center'),
(66,0,'21:22:22','2023-04-11','11.2589678','75.783942','Cee Cee Center'),
(67,1,'21:22:33','2023-04-11','11.2589678','75.783942','Cee Cee Center'),
(68,1,'21:22:33','2023-04-11','11.2589678','75.783942','Cee Cee Center'),
(69,1,'21:22:33','2023-04-11','11.2589678','75.783942','Cee Cee Center'),
(70,1,'21:22:39','2023-04-11','11.2589678','75.783942','Cee Cee Center'),
(71,1,'21:22:39','2023-04-11','11.2589678','75.783942','Cee Cee Center'),
(72,1,'21:22:44','2023-04-11','11.2589678','75.783942','Cee Cee Center'),
(73,1,'21:22:44','2023-04-11','11.2589678','75.783942','Cee Cee Center'),
(74,1,'21:22:49','2023-04-11','11.2589678','75.783942','Cee Cee Center'),
(75,1,'21:22:49','2023-04-11','11.2589678','75.783942','Cee Cee Center'),
(76,1,'21:22:54','2023-04-11','11.2589678','75.783942','Cee Cee Center'),
(77,1,'21:22:54','2023-04-11','11.2589678','75.783942','Cee Cee Center'),
(78,1,'21:22:59','2023-04-11','11.2589678','75.783942','Cee Cee Center'),
(79,1,'21:22:59','2023-04-11','11.2589678','75.783942','Cee Cee Center'),
(80,1,'21:23:04','2023-04-11','11.2589678','75.783942','Cee Cee Center'),
(81,1,'21:23:04','2023-04-11','11.2589678','75.783942','Cee Cee Center'),
(82,1,'21:23:10','2023-04-11','11.2589821','75.7839289','Mavoor Road'),
(83,1,'21:23:10','2023-04-11','11.2589821','75.7839289','Mavoor Road'),
(84,1,'21:23:15','2023-04-11','11.2589821','75.7839289','Mavoor Road'),
(85,1,'21:23:15','2023-04-11','11.2589821','75.7839289','Mavoor Road'),
(86,1,'21:23:20','2023-04-11','11.2589821','75.7839289','Mavoor Road'),
(87,1,'21:23:20','2023-04-11','11.2589821','75.7839289','Mavoor Road'),
(88,1,'21:23:24','2023-04-11','11.2589821','75.7839289','Mavoor Road'),
(89,1,'21:23:25','2023-04-11','11.2589821','75.7839289','Mavoor Road'),
(90,1,'21:23:30','2023-04-11','11.2589821','75.7839289','Mavoor Road'),
(91,1,'21:23:30','2023-04-11','11.2589821','75.7839289','Mavoor Road'),
(92,1,'21:23:35','2023-04-11','11.2589821','75.7839289','Mavoor Road'),
(93,1,'21:23:35','2023-04-11','11.2589821','75.7839289','Mavoor Road'),
(94,1,'21:23:40','2023-04-11','11.2589821','75.7839289','Mavoor Road'),
(95,1,'21:23:40','2023-04-11','11.2589821','75.7839289','Mavoor Road'),
(96,1,'21:23:45','2023-04-11','11.2589821','75.7839289','Mavoor Road'),
(97,1,'21:23:45','2023-04-11','11.2589821','75.7839289','Mavoor Road'),
(98,1,'21:23:50','2023-04-11','11.2589821','75.7839289','Mavoor Road'),
(99,1,'21:23:50','2023-04-11','11.2589821','75.7839289','Mavoor Road'),
(100,1,'21:23:55','2023-04-11','11.2589821','75.7839289','Mavoor Road'),
(101,1,'21:23:55','2023-04-11','11.2589821','75.7839289','Mavoor Road'),
(102,1,'21:24:00','2023-04-11','11.2589821','75.7839289','Mavoor Road'),
(103,1,'21:24:00','2023-04-11','11.2589821','75.7839289','Mavoor Road'),
(104,1,'21:24:05','2023-04-11','11.2589821','75.7839289','Mavoor Road'),
(105,1,'21:24:05','2023-04-11','11.2589821','75.7839289','Mavoor Road'),
(106,1,'21:24:10','2023-04-11','11.2589821','75.7839289','Mavoor Road'),
(107,1,'21:24:10','2023-04-11','11.2589821','75.7839289','Mavoor Road'),
(108,1,'21:24:15','2023-04-11','11.2589821','75.7839289','Mavoor Road'),
(109,1,'21:24:15','2023-04-11','11.2589821','75.7839289','Mavoor Road'),
(110,1,'21:49:54','2023-04-11','11.2589692','75.7839419','Cee Cee Center'),
(111,1,'21:49:54','2023-04-11','11.2589692','75.7839419','Cee Cee Center'),
(112,1,'21:49:55','2023-04-11','11.2589692','75.7839419','Cee Cee Center'),
(113,1,'21:49:59','2023-04-11','11.2589692','75.7839419','Cee Cee Center'),
(114,1,'21:49:59','2023-04-11','11.2589692','75.7839419','Cee Cee Center'),
(115,1,'21:50:05','2023-04-11','11.2589692','75.7839419','Cee Cee Center'),
(116,1,'21:50:05','2023-04-11','11.2589692','75.7839419','Cee Cee Center'),
(117,1,'21:50:09','2023-04-11','11.2589692','75.7839419','Cee Cee Center'),
(118,1,'21:50:09','2023-04-11','11.2589692','75.7839419','Cee Cee Center'),
(119,1,'21:50:14','2023-04-11','11.2589692','75.7839419','Cee Cee Center'),
(120,1,'21:50:14','2023-04-11','11.2589692','75.7839419','Cee Cee Center'),
(121,1,'21:50:20','2023-04-11','11.2589692','75.7839419','Cee Cee Center'),
(122,1,'21:50:20','2023-04-11','11.2589692','75.7839419','Cee Cee Center'),
(123,1,'21:50:24','2023-04-11','11.2589776','75.7839422','Cee Cee Center'),
(124,1,'21:50:24','2023-04-11','11.2589776','75.7839422','Cee Cee Center'),
(125,1,'21:50:29','2023-04-11','11.2589776','75.7839422','Cee Cee Center'),
(126,1,'21:50:29','2023-04-11','11.2589776','75.7839422','Cee Cee Center'),
(127,1,'21:50:34','2023-04-11','11.2589776','75.7839422','Cee Cee Center'),
(128,1,'21:50:34','2023-04-11','11.2589776','75.7839422','Cee Cee Center'),
(129,1,'21:50:40','2023-04-11','11.2589776','75.7839422','Cee Cee Center'),
(130,1,'21:50:40','2023-04-11','11.2589776','75.7839422','Cee Cee Center'),
(131,1,'21:50:45','2023-04-11','11.2589776','75.7839422','Cee Cee Center'),
(132,1,'21:50:45','2023-04-11','11.2589776','75.7839422','Cee Cee Center'),
(133,1,'21:50:49','2023-04-11','11.2589776','75.7839422','Cee Cee Center'),
(134,1,'21:50:49','2023-04-11','11.2589776','75.7839422','Cee Cee Center'),
(135,1,'21:50:54','2023-04-11','11.2589776','75.7839422','Cee Cee Center'),
(136,1,'21:50:54','2023-04-11','11.2589776','75.7839422','Cee Cee Center'),
(137,1,'21:51:00','2023-04-11','11.2589776','75.7839422','Cee Cee Center'),
(138,1,'21:51:00','2023-04-11','11.2589776','75.7839422','Cee Cee Center'),
(139,1,'21:51:04','2023-04-11','11.2589776','75.7839422','Cee Cee Center'),
(140,1,'21:51:04','2023-04-11','11.2589776','75.7839422','Cee Cee Center'),
(141,1,'21:51:10','2023-04-11','11.2589776','75.7839422','Cee Cee Center'),
(142,1,'21:51:10','2023-04-11','11.2589776','75.7839422','Cee Cee Center'),
(143,1,'21:51:14','2023-04-11','11.2589776','75.7839422','Cee Cee Center'),
(144,1,'21:51:14','2023-04-11','11.2589776','75.7839422','Cee Cee Center'),
(145,1,'21:51:19','2023-04-11','11.2589776','75.7839422','Cee Cee Center'),
(146,1,'21:51:19','2023-04-11','11.2589776','75.7839422','Cee Cee Center'),
(147,1,'21:51:25','2023-04-11','11.2589776','75.7839422','Cee Cee Center'),
(148,1,'21:51:25','2023-04-11','11.2589776','75.7839422','Cee Cee Center'),
(149,1,'21:51:29','2023-04-11','11.2589776','75.7839422','Cee Cee Center'),
(150,1,'21:51:29','2023-04-11','11.2589776','75.7839422','Cee Cee Center'),
(151,1,'21:51:35','2023-04-11','11.2589776','75.7839422','Cee Cee Center'),
(152,1,'21:51:35','2023-04-11','11.2589776','75.7839422','Cee Cee Center'),
(153,1,'21:51:39','2023-04-11','11.2589692','75.7839459','Cee Cee Center'),
(154,1,'21:51:39','2023-04-11','11.2589692','75.7839459','Cee Cee Center'),
(155,1,'21:51:45','2023-04-11','11.2589692','75.7839459','Cee Cee Center'),
(156,1,'21:51:45','2023-04-11','11.2589692','75.7839459','Cee Cee Center');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
