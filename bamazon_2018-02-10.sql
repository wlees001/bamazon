# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.21)
# Database: bamazon
# Generation Time: 2018-02-10 15:35:54 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(40) NOT NULL,
  `department_name` varchar(40) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int(4) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`item_id`, `product_name`, `department_name`, `price`, `stock_quantity`)
VALUES
	(1,'Dove Shampoo','Cosmetics',5.75,500),
	(2,'Dove Conditioner','Cosmetics',6.25,627),
	(3,'Glad 12 Gal Trash Bags','Grocery',5.99,300),
	(4,'Brawny Paper Towels','Grocery',4.25,400),
	(5,'Granny Smith Apples','Produce',0.35,800),
	(6,'Chiquita Bannana','Produce',0.20,10000),
	(7,'Tropicana Orange Juice','Grocery',4.45,267),
	(8,'Horizon Organic Milk','Grocery',4.50,200),
	(9,'Huggies Diapers','Children',2.75,476),
	(10,'Charmin Toiler Paper','Grocery',12.99,575),
	(11,'Pampers Baby Wipes','Children',1.50,423),
	(12,'Yoga Mat','Sports',12.75,150),
	(13,'5lb Dumb bell','Sports',7.99,89),
	(14,'Tie Dye Shirt','Clothing',5.55,120),
	(15,'Nike Shorts','Clothing',17.88,250),
	(16,'Purina Cat Chow','Pet',7.25,157),
	(17,'Fancy Feast Wet Cat Food','Pet',12.50,163),
	(18,'Ibuprophen','Pharmacy',4.95,389),
	(19,'Band Aid','Pharmacy',3.25,550),
	(20,'Ben & Jerry Ice Cream','Grocery',3.25,432);

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
