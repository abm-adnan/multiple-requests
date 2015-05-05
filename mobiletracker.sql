# ************************************************************
# Sequel Pro SQL dump
# Version 4135
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.34)
# Database: mobiletracker
# Generation Time: 2015-05-03 08:31:18 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table mobile
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mobile`;

CREATE TABLE `mobile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL DEFAULT '',
  `score` int(11) DEFAULT NULL,
  `pass` tinyint(1) DEFAULT NULL,
  `cms` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `mobile` WRITE;
/*!40000 ALTER TABLE `mobile` DISABLE KEYS */;

INSERT INTO `mobile` (`id`, `url`, `score`, `pass`, `cms`)
VALUES
	(1,'',NULL,NULL,NULL),
	(2,'http://vanlines.com.au',60,0,'WORDPRESS'),
	(3,'http://salesgenerator.com.au',66,0,''),
	(4,'http://greenhouse2011.com',64,0,''),
	(5,'http://fiveislandspress.com',63,0,'WORDPRESS'),
	(6,'http://bountyoil.com',60,0,'WORDPRESS'),
	(7,'http://rc1.com.au',100,1,'WORDPRESS'),
	(8,'http://itesk.org',0,0,''),
	(9,'http://facebook.com',100,1,''),
	(12,'http://netechy.com',99,0,''),
	(13,'http://abcoder.com',99,0,'WORDPRESS');

/*!40000 ALTER TABLE `mobile` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
