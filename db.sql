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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `allocation` */

insert  into `allocation`(`aid`,`sid`,`bid`,`fees`) values 
(2,2,4,NULL),
(3,3,3,NULL),
(4,3,3,NULL),
(5,3,3,NULL),
(6,6,6,NULL),
(7,5,7,NULL),
(9,8,8,NULL),
(10,5,6,NULL),
(11,5,6,NULL),
(12,6,6,NULL),
(13,5,6,NULL),
(14,0,0,NULL),
(15,6,7,NULL),
(16,5,7,500),
(90,5,7,NULL);

/*Table structure for table `bus` */

DROP TABLE IF EXISTS `bus`;

CREATE TABLE `bus` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `bus_number` varchar(50) DEFAULT NULL,
  `chasis_number` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `destination` varchar(50) NOT NULL,
  PRIMARY KEY (`bid`,`destination`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `bus` */

insert  into `bus`(`bid`,`bus_number`,`chasis_number`,`model`,`destination`) values 
(6,'1','kl4556','mahindra','kalladikod'),
(7,'2','kl51m4747','tata sumo','karimpuzha'),
(8,'3','kl51k8282','mahindra','mannarkkad');

/*Table structure for table `complaints` */

DROP TABLE IF EXISTS `complaints`;

CREATE TABLE `complaints` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `complaint` varchar(200) DEFAULT NULL,
  `reply` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `complaints` */

insert  into `complaints`(`cid`,`pid`,`complaint`,`reply`,`date`) values 
(1,5,'hgfjhgkugloihuisahuhiuguigiksa','okkk\r\n','2021-01-18'),
(2,2,'not bad bt ','pending','2022-06-22'),
(3,2,'','pending','2022-06-22'),
(4,2,'t5ttt','pending','2022-06-24'),
(5,7,'igsots8gzogx','pending','2022-06-27');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `driver` */

insert  into `driver`(`did`,`dlid`,`name`,`email`,`phone_number`,`place`,`post`,`pin`,`age`,`bus_id`,`license_number`) values 
(1,0,'','',0,NULL,'',0,0,0,NULL),
(2,9,'aiugedi','iuaued',654564,'kannur','ehkhb',65465,54,7,'873657269q481'),
(3,10,'kwgeiu','asbkj',54468,'loihhoef','kuiu',6548,54,1,NULL),
(4,11,'suku','kuugiu',665,'jygui','uygi',9868,54,2,NULL),
(5,13,'asdjf','asnhg',655466,'nfjy','jhk',6486,51,5,'54653'),
(6,14,'dwjhv','wemhv',656165,'jgfujy','jykmj',635163,51,6,'685465'),
(7,15,'ramu','djshbids@gmail.com',2147483647,'eiwhbsdak','sdjbhisd',652651,54,7,'651656516'),
(8,2,'dhamu','uyasdvgvuas@kugu',2147483647,'asjasj','ksadok',356555,54,7,'3244565555'),
(9,6,'kumar','kuymar@g',2147483647,'skp','kpz',679513,54,6,'65432198');

/*Table structure for table `entry` */

DROP TABLE IF EXISTS `entry`;

CREATE TABLE `entry` (
  `eid` int(11) NOT NULL,
  `sid` int(11) DEFAULT NULL,
  `bid` int(11) DEFAULT NULL,
  `check_in_time` int(11) DEFAULT NULL,
  `check_out_time` int(11) DEFAULT NULL,
  `student_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `entry` */

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`lid`,`email`,`password`,`type`) values 
(1,'admin','admin','admin'),
(2,'uyasdvgvuas@kugu','6513249856','driver'),
(4,'pradeep2007@gmail.com','9605646464','parent'),
(5,'sujatha@gmail.com','9496233162','parent'),
(6,'kuymar@g','9496233162','driver'),
(7,'kingini@g','9496233162','parent');

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `did` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `message` varchar(200) DEFAULT NULL,
  `date` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `message` */

insert  into `message`(`mid`,`did`,`pid`,`message`,`date`) values 
(1,9,2,'helloo','2022-06-22'),
(2,9,0,'Bus late for 1 hr','2022-06-23'),
(3,9,0,'hallooo','2022-06-23'),
(4,9,3,'bus late by 1 hour','2022-06-23'),
(5,9,0,'','2022-06-24'),
(6,9,0,'','2022-06-24');

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
(4,'pradeep','9605646464','pradeep2007@gmail.com','accountant',4),
(5,'sujatha','9496233162','sujatha@gmail.com','home maker',5),
(7,'kingini','9496233162','kingini@g','baker',7);

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `last_date` date DEFAULT NULL,
  `fees` int(11) DEFAULT NULL,
  `plid` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `payment` */

insert  into `payment`(`pid`,`last_date`,`fees`,`plid`) values 
(1,'2022-06-30',3000,2);

/*Table structure for table `status` */

DROP TABLE IF EXISTS `status`;

CREATE TABLE `status` (
  `statusid` int(11) NOT NULL AUTO_INCREMENT,
  `did` int(11) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`statusid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `status` */

insert  into `status`(`statusid`,`did`,`status`) values 
(20,9,'on the way');

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
  `pin` int(11) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `plid` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `student` */

insert  into `student`(`sid`,`name`,`class`,`division`,`gender`,`blood_group`,`place`,`post`,`district`,`pin`,`photo`,`plid`) values 
(5,'sudheesh','ist','A','radio','A+','karimpuzha','karimpuzha','palakkad',679513,'/static/staff//3065211.jpg',2),
(6,'anjali','lkg','B','radio2','A+','tnpuram','pulamanthole','malappuram',562894,'/static/staff//3065211.jpg',5),
(7,'shahla yasmin','ukg','A','radio2','B+','pulamanthole','pulamanthole','malappuram',452186,'/static/staff//20220608-143225-417.MP4',6),
(9,'kunjus','lkg','LKG','FEMALE','A+','skp','kfh','palakkad',3516511,'/static/student/3065211.jpg',7);

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
) ENGINE=InnoDB AUTO_INCREMENT=415 DEFAULT CHARSET=latin1;

/*Data for the table `track` */

insert  into `track`(`tid`,`bid`,`time`,`date`,`latitude`,`longitude`,`place`) values 
(301,7,'18:52:56','2022-06-26','10.9191909','76.4246672',NULL),
(302,7,'18:53:11','2022-06-26','10.9191907','76.4246673',NULL),
(303,7,'18:53:26','2022-06-26','10.919261666666667','76.42451333333334',NULL),
(304,7,'18:53:41','2022-06-26','10.9191907','76.4246673',NULL),
(305,7,'18:54:26','2022-06-26','10.919135000000002','76.424765',NULL),
(306,7,'18:54:41','2022-06-26','10.9191907','76.4246673',NULL),
(307,7,'10:23:10','2022-06-27','11.2578342','75.7845932',NULL),
(308,7,'10:23:25','2022-06-27','11.2578262','75.7845853',NULL),
(309,7,'10:23:40','2022-06-27','11.2578262','75.7845853',NULL),
(310,7,'10:23:55','2022-06-27','11.2578549','75.7846528',NULL),
(311,7,'10:24:10','2022-06-27','11.2578549','75.7846528',NULL),
(312,7,'10:24:25','2022-06-27','11.2578244','75.7845952',NULL),
(313,7,'10:24:41','2022-06-27','11.2578244','75.7845952',NULL),
(314,7,'10:24:56','2022-06-27','11.2578114','75.7845878',NULL),
(315,7,'10:25:11','2022-06-27','11.2578114','75.7845878',NULL),
(316,7,'10:25:26','2022-06-27','11.2578099','75.7845794',NULL),
(317,7,'10:25:41','2022-06-27','11.2578099','75.7845794',NULL),
(318,7,'10:25:56','2022-06-27','11.2578422','75.7846708',NULL),
(319,7,'10:26:11','2022-06-27','11.2578422','75.7846708',NULL),
(320,7,'10:26:26','2022-06-27','11.2578499','75.7846286',NULL),
(321,7,'10:26:41','2022-06-27','11.2578499','75.7846286',NULL),
(322,7,'10:26:56','2022-06-27','11.2578139','75.7845827',NULL),
(323,7,'10:27:12','2022-06-27','11.2578243','75.7846047',NULL),
(324,7,'10:27:27','2022-06-27','11.2578243','75.7846047',NULL),
(325,7,'10:27:42','2022-06-27','11.2578155','75.7845912',NULL),
(326,7,'10:27:57','2022-06-27','11.2578155','75.7845912',NULL),
(327,7,'10:28:12','2022-06-27','11.2578176','75.7846022',NULL),
(328,7,'10:28:27','2022-06-27','11.2578176','75.7846022',NULL),
(329,7,'10:28:43','2022-06-27','11.2578464','75.7846899',NULL),
(330,7,'10:28:57','2022-06-27','11.2578464','75.7846899',NULL),
(331,7,'10:29:13','2022-06-27','11.2578106','75.7845749',NULL),
(332,7,'10:29:28','2022-06-27','11.2578106','75.7845749',NULL),
(333,7,'10:29:43','2022-06-27','11.2578063','75.7845862',NULL),
(334,7,'10:29:58','2022-06-27','11.2578063','75.7845862',NULL),
(335,7,'10:30:13','2022-06-27','11.2578203','75.7845851',NULL),
(336,7,'10:30:28','2022-06-27','11.2578203','75.7845851',NULL),
(337,7,'10:30:43','2022-06-27','11.2578279','75.7846065',NULL),
(338,7,'10:30:58','2022-06-27','11.2578279','75.7846065',NULL),
(339,7,'10:31:14','2022-06-27','11.2578546','75.7846807',NULL),
(340,7,'10:31:29','2022-06-27','11.2578546','75.7846807',NULL),
(341,6,'10:31:37','2022-06-27','11.2578221','75.7845886',NULL),
(342,6,'10:31:44','2022-06-27','11.2578221','75.7845886',NULL),
(343,6,'10:31:52','2022-06-27','11.2578221','75.7845886',NULL),
(344,6,'10:32:06','2022-06-27','11.257865','75.78469',NULL),
(345,6,'10:32:07','2022-06-27','11.2578167','75.7845824',NULL),
(346,6,'10:32:14','2022-06-27','11.2578167','75.7845824',NULL),
(347,6,'10:32:22','2022-06-27','11.257903333333335','75.784905',NULL),
(348,6,'10:32:29','2022-06-27','11.257849','75.7846551',NULL),
(349,6,'10:32:37','2022-06-27','11.257849','75.7846551',NULL),
(350,6,'11:31:41','2022-06-27','11.2578147','75.7846006',NULL),
(351,6,'11:31:56','2022-06-27','11.2578213','75.7846021',NULL),
(352,6,'11:32:11','2022-06-27','11.2578213','75.7846021',NULL),
(353,6,'11:32:26','2022-06-27','11.257809','75.7846026',NULL),
(354,6,'11:32:42','2022-06-27','11.257809','75.7846026',NULL),
(355,6,'11:32:57','2022-06-27','11.2578507','75.7846859',NULL),
(356,6,'11:33:12','2022-06-27','11.2578507','75.7846859',NULL),
(357,6,'11:33:27','2022-06-27','11.2578512','75.7846865',NULL),
(358,6,'11:33:42','2022-06-27','11.2578512','75.7846865',NULL),
(359,6,'11:33:57','2022-06-27','11.257854','75.7846559',NULL),
(360,6,'11:34:12','2022-06-27','11.257854','75.7846559',NULL),
(361,6,'11:34:27','2022-06-27','11.257805','75.7845859',NULL),
(362,6,'11:34:43','2022-06-27','11.257805','75.7845859',NULL),
(363,6,'11:34:58','2022-06-27','11.2578552','75.7846561',NULL),
(364,6,'11:35:13','2022-06-27','11.2578552','75.7846561',NULL),
(365,6,'11:35:28','2022-06-27','11.2578109','75.784589',NULL),
(366,6,'11:35:43','2022-06-27','11.2578109','75.784589',NULL),
(367,6,'11:35:58','2022-06-27','11.2578139','75.7845824',NULL),
(368,6,'11:36:13','2022-06-27','11.2578139','75.7845824',NULL),
(369,6,'11:36:28','2022-06-27','11.2578035','75.7845723',NULL),
(370,6,'11:36:44','2022-06-27','11.2578035','75.7845723',NULL),
(371,6,'11:36:59','2022-06-27','11.2578513','75.7846629',NULL),
(372,6,'11:37:14','2022-06-27','11.2578513','75.7846629',NULL),
(373,6,'11:37:29','2022-06-27','11.2578474','75.784664',NULL),
(374,6,'11:37:44','2022-06-27','11.2578474','75.784664',NULL),
(375,6,'11:37:59','2022-06-27','11.2578202','75.7845919',NULL),
(376,6,'11:38:14','2022-06-27','11.2578202','75.7845919',NULL),
(377,6,'11:38:29','2022-06-27','11.2578425','75.7846878',NULL),
(378,6,'11:38:45','2022-06-27','11.2578425','75.7846878',NULL),
(379,6,'11:39:00','2022-06-27','11.2578497','75.784681',NULL),
(380,6,'11:39:15','2022-06-27','11.2578497','75.784681',NULL),
(381,6,'11:39:30','2022-06-27','11.2578102','75.7845912',NULL),
(382,6,'11:39:45','2022-06-27','11.2578102','75.7845912',NULL),
(383,6,'11:40:00','2022-06-27','11.257812','75.7845848',NULL),
(384,6,'11:40:15','2022-06-27','11.257812','75.7845848',NULL),
(385,6,'11:40:30','2022-06-27','11.2578095','75.7845827',NULL),
(386,6,'11:40:46','2022-06-27','11.2578311','75.7846223',NULL),
(387,6,'11:41:01','2022-06-27','11.2578311','75.7846223',NULL),
(388,6,'11:41:16','2022-06-27','11.2578109','75.7846023',NULL),
(389,6,'11:41:31','2022-06-27','11.2578109','75.7846023',NULL),
(390,6,'11:41:46','2022-06-27','11.2578205','75.7845801',NULL),
(391,6,'11:42:01','2022-06-27','11.2578205','75.7845801',NULL),
(392,6,'11:42:16','2022-06-27','11.2578595','75.7846508',NULL),
(393,6,'11:42:31','2022-06-27','11.2578595','75.7846508',NULL),
(394,6,'11:42:47','2022-06-27','11.2578557','75.7846559',NULL),
(395,6,'11:43:02','2022-06-27','11.2578557','75.7846559',NULL),
(396,6,'11:43:17','2022-06-27','11.2578196','75.7845822',NULL),
(397,6,'11:43:32','2022-06-27','11.2578196','75.7845822',NULL),
(398,6,'11:44:02','2022-06-27','11.2578029','75.784571',NULL),
(399,6,'11:44:17','2022-06-27','11.2578031','75.7845815',NULL),
(400,6,'11:44:33','2022-06-27','11.2578031','75.7845815',NULL),
(401,6,'11:44:48','2022-06-27','11.2578477','75.7846673',NULL),
(402,6,'11:45:03','2022-06-27','11.2578477','75.7846673',NULL),
(403,6,'11:45:18','2022-06-27','11.2578162','75.7845851',NULL),
(404,6,'11:45:33','2022-06-27','11.257821666666667','75.78459',NULL),
(405,6,'11:45:48','2022-06-27','11.2578446','75.7846889',NULL),
(406,6,'11:46:03','2022-06-27','11.257813333333335','75.78466333333334',NULL),
(407,6,'11:46:18','2022-06-27','11.2578253','75.7845923',NULL),
(408,6,'11:46:34','2022-06-27','11.257831666666668','75.78462166666667',NULL),
(409,6,'11:46:49','2022-06-27','11.2578204','75.7845977',NULL),
(410,6,'11:47:04','2022-06-27','11.257800000000001','75.78459333333333',NULL),
(411,6,'11:47:19','2022-06-27','11.2578057','75.784581',NULL),
(412,6,'11:47:34','2022-06-27','11.257846666666667','75.78456',NULL),
(413,6,'11:47:49','2022-06-27','11.2578484','75.7846819',NULL),
(414,6,'11:48:04','2022-06-27','11.257851666666665','75.78461333333333',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
