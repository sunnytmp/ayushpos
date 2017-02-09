-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: usersdb
-- ------------------------------------------------------
-- Server version	5.5.46-0ubuntu0.14.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bankaccount`
--

DROP TABLE IF EXISTS `bankaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bankaccount` (
  `transdate` date DEFAULT NULL,
  `particular` varchar(100) DEFAULT NULL,
  `chequeno` varchar(15) DEFAULT NULL,
  `debit` int(11) DEFAULT NULL,
  `credit` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankaccount`
--

LOCK TABLES `bankaccount` WRITE;
/*!40000 ALTER TABLE `bankaccount` DISABLE KEYS */;
INSERT INTO `bankaccount` VALUES ('2012-01-08','As Cash','123451637463889',0,2000,2000000),('2015-07-02','As Cash','763235678923',0,100000,3000000);
/*!40000 ALTER TABLE `bankaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `descp` varchar(20) DEFAULT NULL,
  `image` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (82,'Grains','Wheat,Raggi,Corn',NULL),(83,'Flour','All Flour Types',NULL),(85,'Oil\'s','All Oils',NULL),(86,'Stationery','Stationeries',NULL),(87,'Confectionery','Confectioneries',NULL),(88,'Masala _Powder','Masalakoottukal',NULL),(89,'Cattle_Feed','Cattle feeds',NULL),(90,'Spices','All Spices',NULL),(91,'Electronics','Electronic Items',NULL),(92,'Insect_Killers','Insect Killers',NULL),(93,'Cool_Drinks_Soda','Soda Items',NULL),(94,'Cool_Drinks_Juice','Soft Drinks',NULL),(95,'Snacks','All Snacks',NULL),(96,'Cosmetics','Beauty Items',NULL),(97,'Dairy','All Milk Items',NULL),(98,'Cadbury','Chocolates',NULL),(99,'Dry_Friuts','All Dry fruits',NULL),(100,'House_Keepping','House Keepping items',NULL),(101,'Tooth_Paste','All Tooth Pastes',NULL),(102,'Agarbathi','Chandanathiri items',NULL),(103,'Rices','All rice categories',NULL),(104,'Bath_Soaps','Bathing_Soaps',NULL),(105,'Wash_soap','Washing Soaps',NULL),(106,'Masalas','Masala kootukal',NULL),(107,'Washing_Powder','Washing Powders',NULL),(108,'Pooja_Items','Pooja Items',NULL),(109,'Baby_Foods','Baby Foods',NULL),(110,'Baby_Products','Other Baby Products',NULL),(111,'Women_Products','Women Products',NULL),(112,'Talcum_Powders','Talcum Powders',NULL),(113,'Coffee_powder','Coffee powders',NULL),(114,'Tea_Powder','Tea powder',NULL),(115,'Biscuits','All biscuites',NULL),(116,'Spices_Powder','Spices Powder',NULL),(117,'Room_cleaner','Room cleaning items',NULL),(118,'BathRoom_cleaner','Bathroom Cleaner',NULL),(119,'Toilet_Cleaner','Toilet Cleaner',NULL),(120,'Grooming','Mens Grooming item',NULL),(121,'Tooth_Brush','Tooth Brush',NULL),(122,'Smoking_Items','Smoking items',NULL),(123,'Vegitables','All Vegitables',NULL),(124,'Fabric_Conditioner','Fabric Conditioner',NULL),(125,'Shampoos','All Shampoos items',NULL),(126,'Fruits','Fruits items',NULL),(127,'Nutrition_Drinks','Health Drinks',NULL),(128,'Book\'s','All book items',NULL),(129,'Plastic','All Plastic items',NULL),(130,'Dry_Fish','Dry Fish items',NULL),(131,'Ice_Cream','Ice Creame items',NULL),(132,'Squash','All types squashes',NULL),(133,'Face_Cream','Face Cream',NULL),(134,'Fabric_Whitner','Fabric Whitner',NULL),(135,'Noodles','All types Noodles',NULL),(136,'Salt\'s','All types Salt',NULL),(137,'Medicine\'s','Tablet\'s&Creams',NULL),(138,'Food_Jam','Food Jam items',NULL),(139,'Perfumes','Body Perfumes',NULL),(140,'Face_Wash','All face wash items',NULL),(141,'Hair_Oils','Hair oils',NULL),(142,'Hair_Dye','Hair Dye',NULL),(143,'Antiseptic','antiseptic liquid',NULL),(144,'Bubble_Gum','Bubble Gum',NULL),(145,'Preservative','All preservatives',NULL),(146,'Pickles','All types of pickles',NULL),(147,'Water','All types of water',NULL),(148,'Hair Oil','All Type Of Hair Oil',NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(15) DEFAULT NULL,
  `categoryid` int(13) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `saleprice` double DEFAULT NULL,
  `tax` mediumtext,
  `discount` mediumtext,
  `brandname` varchar(100) DEFAULT NULL,
  `catalog` varchar(15) DEFAULT NULL,
  `remarks` varchar(15) DEFAULT NULL,
  `updatedby` varchar(15) DEFAULT NULL,
  `updatedone` varchar(15) DEFAULT NULL,
  `discontinued` varchar(15) DEFAULT NULL,
  `reasondiscont` varchar(100) DEFAULT NULL,
  `image` blob,
  `companyname` varchar(100) DEFAULT NULL,
  `supid` int(11) DEFAULT NULL,
  `poid` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CAT_FK` (`categoryid`),
  KEY `PO_PK` (`poid`),
  CONSTRAINT `CAT_FK` FOREIGN KEY (`categoryid`) REFERENCES `category` (`id`),
  CONSTRAINT `PO_PK` FOREIGN KEY (`poid`) REFERENCES `purchaseorder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=604 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (228,'89040245343',102,'Swarna Champa Agarbathi',12,50,NULL,'0','0','Swarna Champa','BAKTHI','Good',NULL,NULL,'0','NA',NULL,'Moksha Agarbatti',NULL,16,NULL),(229,'8906005800091',102,'Maya Supreme agarbathi',10,50,NULL,'1','0','Maya Supreme','Supreme Divine','Good',NULL,NULL,'0','NA',NULL,'Koya\'s Agarbathi',NULL,16,NULL),(232,'8901324013849',86,'Apsara Pencil_box',50,10,NULL,'0','0','Apsara Platinum','Extra Dark','Good',NULL,NULL,'0','NA',NULL,'Hindustan pencils',NULL,16,NULL),(236,'8901262090414',97,'Amulya Milk Powder',10,10,NULL,'0','0','Amulya','Dairy Whitner','Good',NULL,NULL,'0','NA',NULL,'Banaskantha Dist. Co-operative Milk Producer\'s Union Ltd',NULL,16,NULL),(237,'8906057530359',104,'Medimix Soap',22,10,NULL,'0','0','Medimix','Ayurvedic Soap','Good',NULL,NULL,'0','NA',NULL,'Ava Cholayil health care Pvt. Ltd',NULL,NULL,NULL),(238,'8901399009020',104,'Chandrika Soap',22,10,NULL,'0','0','Chandrika','Active Ayrveda','Good',NULL,NULL,'0','NA',NULL,'Wipro Enterprices Ltd',NULL,NULL,NULL),(239,'8901314306180',101,'Colgate Active Salt 23g',10,10,NULL,'0','0','Colgate','Active Salt','Fight Germs',NULL,NULL,'0','NA',NULL,'Colgate-Palmolive (India) Ltd',NULL,16,NULL),(240,'8901030556227',105,'Surf Excel',10,10,NULL,'0','0','Surf Excel','Stain Eraser','Good',NULL,NULL,'0','NA',NULL,'Hindustan Uniliver Limited',NULL,NULL,NULL),(241,'8901751000023',102,'Cycle Agarbathi',10,50,NULL,'0','0','Cycle','Three in One','Good fragrance',NULL,NULL,'0','NA',NULL,'N. Ranga Rao & Sons Pvt. Ltd',NULL,NULL,NULL),(242,'8901063325500',95,'Britannia Rusk',10,20,NULL,'0','0','Britannia','NA','Good',NULL,NULL,'0','NA',NULL,'Britannia industries',NULL,16,NULL),(243,'8901440205395',104,'Eastern Chicken Masala',10,20,NULL,'0','0','Eastern','NA','Good',NULL,NULL,'0','NA',NULL,'Eastern Ltd',NULL,16,NULL),(244,'8906017766583',116,'Quality Mallipodi',9.5,20,NULL,'0','0','Quality','NA','Good',NULL,NULL,'0','NA',NULL,'Quality food product int',NULL,16,NULL),(245,'8901491502030',95,'Lays American style cream & onion',5,50,NULL,'0','0','Lays','NA','Good',NULL,NULL,'0','NA',NULL,'pepsi co india',NULL,NULL,NULL),(246,'8906017760017',116,'Quality Turmeric powder',10.5,50,NULL,'0','0','Quality','NA','Good',NULL,NULL,'0','NA',NULL,'Quality food product int',NULL,16,NULL),(247,'8901440205388',88,'Eastern Samber Powder',10,50,NULL,'0','0','Eastern','NA','Good',NULL,NULL,'0','NA',NULL,'Eastern Ltd',NULL,16,NULL),(255,'8901030288838',105,'Sunlight Washing Soap',18,50,NULL,'0','0','Sunlight','NA','Good',NULL,NULL,'0','NA',NULL,'Hindustan uniliver',NULL,NULL,NULL),(256,'89007495',98,'Munch',5,50,NULL,'0','0','Nestle','NA','Good',NULL,NULL,'0','NA',NULL,'Nestle India',NULL,NULL,NULL),(257,'8901063016699',115,'Britannia 50 50 biscuits',10,50,NULL,'0','0','Britannia','NA','Good',NULL,NULL,'0','NA',NULL,'Britannia Industries',NULL,16,NULL),(258,'8904010690195',116,'Nirapara Chilly Powder',23.5,50,NULL,'0','0','Nirapara','NA','Good',NULL,NULL,'0','NA',NULL,'K K R Food Products',NULL,16,NULL),(259,'8906007750097',101,'K P  Namboodiri\'s Tooth Paste 50 g',22,50,NULL,'0','0','K P Namboodiri\'s','NA','Good',NULL,NULL,'0','NA',NULL,'K P Namboodiri\'s',NULL,NULL,NULL),(260,'8906012254344',105,'Oorvasi',5,50,NULL,'0','0','Oorvasi','NA','Good',NULL,NULL,'0','NA',NULL,'Rajam Industries',NULL,NULL,NULL),(261,'8904027302517',104,'Jo Lime',10,30,NULL,'0','0','Jo','NA','Good',NULL,NULL,'0','NA',NULL,'V V F (India) Limited',NULL,NULL,NULL),(262,'8901030461132',112,'Pond\'s Magic 30g powder',10,20,NULL,'0','0','Pond\'s','NA','Good',NULL,NULL,'0','NA',NULL,'Hindustan Uniliver',NULL,16,NULL),(263,'8901088055871',85,'Parachute Coconut oil 44 ml',15,20,NULL,'0','0','Parachute','NA','Good',NULL,NULL,'0','NA',NULL,'Marico',NULL,NULL,NULL),(264,'8906007750172',101,'K P Namboodiri\'s Choornam',10,20,NULL,'0','0','K P Namboodiris','NA','Good',NULL,NULL,'0','NA',NULL,'KP Namboodiri\'s',NULL,NULL,NULL),(265,'8901725134723',115,'Sunfeast Bounce Choco Twist 100g',10,20,NULL,'0','0','Sunfeest','NA','Good',NULL,NULL,'0','NA',NULL,'Vell Biscuits Private Limited',NULL,16,NULL),(266,'8906021122436',116,'Aachi Pepper powder',12,20,NULL,'0','0','Aachi','NA','Good',NULL,NULL,'0','NA',NULL,'Aachi masala foods',NULL,16,NULL),(267,'8901030564208',107,'Surf Excel Wash powder',2,50,NULL,'0','0','Surf Excel','NA','Good',NULL,NULL,'0','NA',NULL,'Hindustan uniliver',NULL,NULL,NULL),(268,'8902102161295',105,'Exo Bar',5,50,NULL,'0','0','Exo','NA','Good',NULL,NULL,'0','NA',NULL,'Jyothy Laboratary',NULL,NULL,NULL),(269,'8901324580020',86,'Nataraj Scale 15 cm',5,50,NULL,'0','0','Nataraj','NA','Good',NULL,NULL,'0','NA',NULL,'Hindustan Pencils',NULL,NULL,NULL),(270,'8901030518980',113,'Bru InstantPacket',2,50,NULL,'0','0','Bru','NA','Good',NULL,NULL,'0','NA',NULL,'Hindustan uniliver',NULL,16,NULL),(327,'8904004203417',132,'Mr.Butlers Pineapple squash 200ml',48,20,NULL,'0','0','Mr.Butlers','NA','Good',NULL,NULL,'0','NA',NULL,'Moksha food & Beverages',NULL,NULL,NULL),(328,'8901314200044',121,'Colgate tooth brush',18,30,NULL,'0','0','Colgate','NA','Good',NULL,NULL,'0','NA',NULL,'Colgate Palmolive',NULL,NULL,NULL),(329,'8901725043414',122,'Scissors Wills',54,20,NULL,'0','0','Wills','NA','Good',NULL,NULL,'0','NA',NULL,'QMA, ITC  Ltd',NULL,NULL,NULL),(330,'4902430619394',125,'Head & Shoulders Sahampoo',3,50,NULL,'0','0','Head & Shoulders','NA','Good',NULL,NULL,'0','NA',NULL,'Procter & Gample Home Products',NULL,NULL,NULL),(331,'8901030556036',125,'Clinic Plus Shampoo',10,30,NULL,'0','0','Clinic Plus','NA','Good',NULL,NULL,'0','NA',NULL,'Hindustan Uniliver',NULL,NULL,NULL),(346,'8901030604874',124,'Comfort',3,30,NULL,'0','0','Comfort','NA','Good',NULL,NULL,'0','NA',NULL,'Hindustan uniliver',NULL,NULL,NULL),(347,'8901030556845',125,'Clinic Plus Sachet',1,50,NULL,'0','0','Clinic Plus','NA','Good',NULL,NULL,'0','NA',NULL,'Hindustan Uniliver',NULL,NULL,NULL),(348,'8901425006283',86,'Crayons Pencils',10,50,NULL,'0','0','Camel','NA','Good',NULL,NULL,'0','NA',NULL,'Kokuyo Camelin',NULL,NULL,NULL),(349,'8901030565250',133,'Fair & Lovely',8,50,NULL,'0','0','Fair & Lovely','NA','Good',NULL,NULL,'0','NA',NULL,'Hindustan Uniliver',NULL,NULL,NULL),(350,'8901106205110',120,'Topaz shaving blade',10,50,NULL,'0','0','Topaz','NA','Good',NULL,NULL,'0','NA',NULL,'laser Shaving',NULL,NULL,NULL),(351,'8902102194910',134,'Ujala Supreme 30ml',7,50,NULL,'0','0','Ujala','NA','Good',NULL,NULL,'0','NA',NULL,'Jyothy Laborataries',NULL,NULL,NULL),(352,'8901725177317',122,'Gold Scissors',80,20,NULL,'0','0','Gold Flake','NA','Godd',NULL,NULL,'0','NA',NULL,'Q M A, I T C  Ltd',NULL,NULL,NULL),(353,'8901725065218',122,'MiniGold',50,20,NULL,'0','0','Century','NA','Good',NULL,NULL,'0','NA',NULL,'Q M A, I T C Ltd',NULL,16,NULL),(354,'8904055105265',120,'Super Max Blade',24,20,NULL,'0','0','Vidyut Super Max','NA','Good',NULL,NULL,'0','NA',NULL,'Super Max Personal Care',NULL,16,NULL),(355,'8902042111183',114,'A V T Premium',10,30,NULL,'0','0','A V T','NA','Good',NULL,NULL,'0','NA',NULL,'P L Lawrance & co',NULL,NULL,NULL),(356,'8901719103667',115,'Parle Magix Elachi',10,20,NULL,'0','0','Parle','NA','Good',NULL,NULL,'0','NA',NULL,'Parle Products',NULL,16,NULL),(357,'8908000885011',94,'Podaran Mango drink',10,20,NULL,'0','0','Podaran','NA','Good',NULL,NULL,'0','NA',NULL,'Podaran Foods India',NULL,NULL,NULL),(358,'8908000885080',93,'Tilo Lemon 200ml',10,20,NULL,'0','0','Podaran','NA','Good',NULL,NULL,'0','NA',NULL,'Podaran foods',NULL,NULL,NULL),(359,'8901030462443',104,'Rexona Coconut & Olive 100g',27,20,NULL,'0','0','Rexona','NA','Good',NULL,NULL,'0','NA',NULL,'Hindustan uniliver',NULL,16,NULL),(360,'836449006613',86,'Lexi Pen',50,20,NULL,'0','0','Lexi','NA','Good',NULL,NULL,'0','NA',NULL,'Lexi Pvt Ltd',NULL,NULL,NULL),(361,'8901063163065',115,'Tiger Glucose',10,20,NULL,'0','0','Britannia','NA','Good',NULL,NULL,'0','NA',NULL,'Britannia Industries',NULL,NULL,NULL),(362,'8901063162143',115,'Marigold',10,20,NULL,'0','0','Britannia','NA','Good',NULL,NULL,'0','NA',NULL,'Britannia Industries',NULL,NULL,NULL),(363,'8901719103650',115,'Parle Magix orange',10,10,NULL,'0','0','Parle','NA','Good',NULL,NULL,'0','NA',NULL,'Parle',NULL,NULL,NULL),(364,'8901725134785',115,'Sunfeast Bounce Pinapple 100g',10,50,NULL,'0','0','Sunfeast','NA','Good',NULL,NULL,'0','NA',NULL,'ITC Ltd',NULL,16,NULL),(365,'8908000369023',136,'Kristal Salt 500g',9,30,NULL,'0','0','Kristal','NA','Good',NULL,NULL,'0','NA',NULL,'Escee Infrastructure',NULL,NULL,NULL),(366,'8901058842722',135,'Maggi masala 70g',12,30,NULL,'0','0','Maggi','NA','Good',NULL,NULL,'0','NA',NULL,'Nestle',NULL,NULL,NULL),(367,'8901725181222',135,'Yippee Masala 70g',12,30,NULL,'0','0','Sunfeast','NA','Good',NULL,NULL,'0','NA',NULL,'I T C Ltd',NULL,NULL,NULL),(368,'8901030323805',112,'Pond\'s Magic 50g',46,50,NULL,'0','0','Ponds','NA','Good',NULL,NULL,'0','NA',NULL,'Hindustan unillever',NULL,NULL,NULL),(369,'8901030323768',112,'Ponds Dreamflower',35,50,NULL,'0','0','Ponds','Na','Good',NULL,NULL,'0','NA',NULL,'Hindustan ltd',NULL,16,NULL),(370,'8901725193119',95,'Bingo friedred5rs',5,50,NULL,'0','0','Bingo','NA','Good',NULL,NULL,'0','Na',NULL,'Itc',NULL,NULL,NULL),(371,'8901396152002',119,'Harpic Orginal 200ml',30,50,NULL,'0','0','Harpic','Na','Good',NULL,NULL,'0','Na',NULL,'Reckitt',NULL,NULL,NULL),(372,'8864684681021',83,'Nivas Puttupodi',24,50,NULL,'0','0','Nivas','Na','Good',NULL,NULL,'0','Na',NULL,'Nivas',NULL,NULL,NULL),(373,'8904118000049',93,'Club Soda 600ml',15,50,NULL,'0','0','Golden Valley','Na','Good',NULL,NULL,'0','Na',NULL,'Nest Product',NULL,NULL,NULL),(374,'8864684681014',83,'Nivas Riceflour',25,50,NULL,'0','0','Nivas','Na','Good',NULL,NULL,'0','Na',NULL,'Navasltd',NULL,NULL,NULL),(375,'8901324008456',86,'Nataraj Pencil',40,50,NULL,'0','0','Nataraj','Na','Good',NULL,NULL,'0','Na',NULL,'Hinudustan Pencils',NULL,NULL,NULL),(376,'8906007750035',101,'K P N Powder 40g',18,50,NULL,'0','0','KPN','Na','Good',NULL,NULL,'0','Na',NULL,'KPN',NULL,16,NULL),(377,'8906007750349',101,'K P N powder 80g',28,50,NULL,'0','0','KPN','Na','Good',NULL,NULL,'0','Na',NULL,'KPN',NULL,NULL,NULL),(378,'8906007750103',101,'K P N Toothpaste 100g',46,50,NULL,'0','0','KPN','Na','Good',NULL,NULL,'0','Na',NULL,'KPN',NULL,16,NULL),(379,'8908000885035',94,'Mango Dink 500ml',30,50,NULL,'0','0','Podaran','Na','Good',NULL,NULL,'0','Na',NULL,'Podaran',NULL,NULL,NULL),(380,'701142119246',113,'Coffee Time 5rs',5,50,NULL,'0','0','Krishna','Na','Good',NULL,NULL,'0','Na',NULL,'Krishna',NULL,16,NULL),(381,'8902042111176',114,'Avt Premium 5rs',5,50,NULL,'0','0','Avt','Na','Good',NULL,NULL,'0','Na',NULL,'Avt Ltd',NULL,16,NULL),(382,'8901052031207',114,'kanan Devan5rs',10,50,NULL,'0','0','Kanandevan','Na','Good',NULL,NULL,'0','Na',NULL,'Tata',NULL,NULL,NULL),(383,'8901052037269',115,'Kanandevan 100g',30,50,NULL,'0','0','Kanandevan','Na','Good',NULL,NULL,'0','na',NULL,'Tata',NULL,16,NULL),(384,'8904004203004',138,'Pine apple Jam',24,50,NULL,'0','0','Mr.Butler\'s','Na','Good',NULL,NULL,'0','Na',NULL,'Moksha Food',NULL,NULL,NULL),(385,'0701142119253',113,'Krishna Cofee 10rs',10,50,NULL,'0','0','Krishna','Na','Good',NULL,NULL,'0','Na',NULL,'Krishan',NULL,16,NULL),(386,'8901399000591',104,'Santoor  Sandal 100g',25,50,NULL,'0','0','Santoor','Na','Good',NULL,NULL,'0','Na',NULL,'Wipro',NULL,NULL,NULL),(387,'8901440023258',106,'Eastern Cumin100g',40.5,50,NULL,'0','0','Eastarn','NA','Good',NULL,NULL,'0','Na',NULL,'Eastarn ltd',NULL,16,NULL),(388,'8902979023146',125,'Meera Shampoo',3,50,NULL,'0','0','Meera','Na','Good',NULL,NULL,'0','Na',NULL,'Cavincare',NULL,NULL,NULL),(389,'8901396393306',104,'Dettol original 75g',27,50,NULL,'0','0','Dettol','Na','Good',NULL,NULL,'0','Na',NULL,'Reckitt',NULL,NULL,NULL),(390,'8901440013280',88,'Eastern meatmasala100',32,50,NULL,'0','0','Eastern','Na','Good',NULL,NULL,'0','Na',NULL,'Eastern',NULL,16,NULL),(391,'4902430682572',110,'Pampers m',24,50,NULL,'0','0','Pampers','Na','Good',NULL,NULL,'0','Na',NULL,'Pampers',NULL,16,NULL),(392,'4902430682565',110,'Pampers s',20,50,NULL,'0','0','Pampers','Na','Good',NULL,NULL,'0','Na',NULL,'Pampers',NULL,16,NULL),(393,'4902430682558',110,'Pampers L',26,50,NULL,'0','0','Pampers','Na','Good',NULL,NULL,'0','Na',NULL,'Pampers',NULL,16,NULL),(394,'4902430673143',111,'whisper chioce',34,50,NULL,'0','0','Whisper','Na','Good',NULL,NULL,'0','Na',NULL,'Whisper',NULL,16,NULL),(396,'8901023000034',115,'cinthol orginal 100g',33,50,NULL,'0','0','Godrej','Na','Good',NULL,NULL,'0','Na',NULL,'Godrej',NULL,16,NULL),(398,'8901399004087',127,'Glucovita 125g',24,50,NULL,'0','0','Glucose','Na','Good',NULL,NULL,'0','Na',NULL,'Wipro',NULL,NULL,NULL),(399,'8901725133535',115,'Choco twist 5rs',5,50,NULL,'0','0','Sunfeast','NA','Good',NULL,NULL,'0','Na',NULL,'Sunfeast',NULL,NULL,NULL),(400,'8901030561566',104,'Hamam neem 100g',28,50,NULL,'0','0','Hamam','Na','Good',NULL,NULL,'0','Na',NULL,'Hindustan',NULL,NULL,NULL),(401,'8906021122528',88,'Aachi  rasam Powder',10,50,NULL,'0','0','Aachi','Na','Good',NULL,NULL,'0','Na',NULL,'Aachi',NULL,16,NULL),(402,'8901138513627',140,'Himalaya Neem 15ml',15,50,NULL,'0','0','Himalaya','Na','Good',NULL,NULL,'0','Na',NULL,'Himalaya',NULL,NULL,NULL),(403,'8904059801026',86,'Krompo Mini scetch',15,50,NULL,'0','0','Brill','Na','Good',NULL,NULL,'0','Na',NULL,'Bril',NULL,NULL,NULL),(404,'8901088076104',141,'Jasmine 90 ml',39,50,NULL,'0','0','Parachute','Na','Good',NULL,NULL,'0','Na',NULL,'Marico',NULL,NULL,NULL),(405,'8901396350101',143,'Dettol 60 ml',20,50,NULL,'0','0','Dettol','Na','Good',NULL,NULL,'0','Na',NULL,'M.L KTk',NULL,NULL,NULL),(406,'4009900502283',144,'Boomer Strawberry',161,20,NULL,'0','0','Wrigley\'s','Na','Good',NULL,NULL,'0','Na',NULL,'wrigley\'s',NULL,NULL,NULL),(407,'8908001518017',95,'Gingelly Oil 100ml',18.5,50,NULL,'0','0','Swarnam','Na','Good',NULL,NULL,'0','Na',NULL,'Swarnam',NULL,16,NULL),(408,'8861361361092',111,'Roasted Sooji 500gram',32,50,NULL,'0','0','Amuthasurabhi','Na','Good',NULL,NULL,'0','Na',NULL,'Jasmin',NULL,16,NULL),(409,'8901248226127',137,'Mentho Plus balm',2,50,NULL,'0','0','Emami','Na','Good',NULL,NULL,'0','Na',NULL,'Emami',NULL,NULL,NULL),(410,'8901030604867',124,'Comfort Lily fresh',3,50,NULL,'0','0','Comfort','Na','Good',NULL,NULL,'0','Na',NULL,'Comfort',NULL,NULL,NULL),(411,'8901860633037',86,'Fevi gum',5,50,NULL,'0','0','Fevicol','Na','Good',NULL,NULL,'0','Na',NULL,'Pidilite',NULL,NULL,NULL),(412,'8902979000444',125,'Karthika Shampoo',1,100,NULL,'0','0','Cavincare','NA','Good',NULL,NULL,'0','Na',NULL,'Cavincare',NULL,NULL,NULL),(413,'8901248253185',133,'Fair And Handsome10rs',10,50,NULL,'0','0','Emami','Na','Good',NULL,NULL,'0','Na',NULL,'Emami',NULL,16,NULL),(414,'9898854190043',86,'Scissor Small',18,40,NULL,'0','0','Dexaen','Na','Good',NULL,NULL,'0','Na',NULL,'Dexaen',NULL,NULL,NULL),(415,'8901247571211',142,'Kesh kala 50 ml',30,30,NULL,'0','0','Vasmol','Na','Good',NULL,NULL,'0','Na',NULL,'Vasmol',NULL,NULL,NULL),(416,'4902430672535',111,'Whisper 7 pad',29,50,NULL,'0','0','whisper','Na','Good',NULL,NULL,'0','Na',NULL,'Whisper',NULL,NULL,NULL),(417,'8901248253161',133,'Fair and Handsome25rs',25,50,NULL,'0','0','Emami','na','Good',NULL,NULL,'0','Na',NULL,'Emami',NULL,16,NULL),(423,'8901725710095',108,'Mangaldeep Sambrani',20,50,NULL,'0','0','Managaldeep','Na','Good',NULL,NULL,'0','Na',NULL,'ITC',NULL,NULL,NULL),(424,'8902102198833',100,'Exo Safai Scrumber',15,50,NULL,'0','0','Exo','Na','Good',NULL,NULL,'0','Na',NULL,'Jyothi Laboratary',NULL,NULL,NULL),(425,'8908002505368',104,'Cutee_Sandal',20,50,NULL,'0','0','Cutee','N','Na',NULL,NULL,'0','Na',NULL,'Good Buy Soap Pvt Ltd',NULL,NULL,NULL),(426,'8908002505351',104,'Cutee_OliveSona',20,50,NULL,'0','0','Cutee','Na','Good',NULL,NULL,'0','Na',NULL,'Good Buy Soap Pvt Ltd',NULL,NULL,NULL),(427,'80974482',98,'Kinder Joy',40,50,NULL,'0','0','Kinder','Na','Good',NULL,NULL,'0','Na',NULL,'Ferrero india',NULL,NULL,NULL),(428,'8908002505474',104,'Cutee_HaldiManjal',20,50,NULL,'0','0','Cutee','Na','Good',NULL,NULL,'0','Na',NULL,'Good Buy Soap Pvt Ltd',NULL,NULL,NULL),(429,'8901030585821',104,'Lifeboy_ActiveSilver',27,50,NULL,'0','0','Lifeboy','Na','Good',NULL,NULL,'0','Na',NULL,'Hindustan ltd',NULL,16,NULL),(430,'8718291678427',91,'Philips 60w Bulb',15,50,NULL,'0','0','Philips','Na','Good',NULL,NULL,'0','Na',NULL,'Philips',NULL,NULL,NULL),(431,'8901571000258',127,'Boost 200g',105,50,NULL,'0','0','Boost','Na','Good',NULL,NULL,'0','Na',NULL,'G S K Ltd',NULL,NULL,NULL),(432,'8901030558184',105,'Rin 10rs',10,50,NULL,'0','0','Rin','Na','good',NULL,NULL,'0','Na',NULL,'hindustan',NULL,NULL,NULL),(433,'8901030518126',105,'Rin 14rs',14,50,NULL,'0','0','Rin','Na','Good',NULL,NULL,'0','Na',NULL,'HIndustan',NULL,NULL,NULL),(434,'8906005802194',108,'Maya Supreme Dhoop',15,50,NULL,'0','0','Koya\'s','Na','Good',NULL,NULL,'0','Na',NULL,'Koya\'s Ltd',NULL,NULL,NULL),(435,'8901030615412',101,'Close Up',47,50,NULL,'0','0','Close Up','Na','Good',NULL,NULL,'0','Na',NULL,'Hindustan uniliver',NULL,NULL,NULL),(436,'8901030478666',104,'RexonaSavePackof4',75,50,NULL,'0','15','Rexoan','Na','Good',NULL,NULL,'0','Na',NULL,'Unilever',NULL,NULL,NULL),(437,'8828530520012',92,'Jeevan Mosquito coil',25,50,NULL,'0','0','Jeevan','Na','Good',NULL,NULL,'0','Na',NULL,'Sri sathuragiri',NULL,NULL,NULL),(438,'8901678008560',108,'Sri Parimala Doop',20,50,NULL,'0','0','Sri Parimala`','Na','good',NULL,NULL,'0','Na',NULL,'Sri Parimala',NULL,NULL,NULL),(439,'8901030620973',104,'Lux_Velvet100g',26,50,NULL,'0','0','Lux','Na','Good',NULL,NULL,'0','Na',NULL,'Hindustan',NULL,NULL,NULL),(440,'8901030599422',104,'Lux_Velvet10rs',10,50,NULL,'0','0','Lux','NA','Good',NULL,NULL,'0','Na',NULL,'Hinduatsn',NULL,NULL,NULL),(441,'8901030408724',104,'Lux Peach&Cream5rs',5,50,NULL,'0','0','Lux','Na','Good',NULL,NULL,'0','Na',NULL,'Hindustan',NULL,NULL,NULL),(442,'8908000369047',136,'Kristal Salt 1kg',14,50,NULL,'0','0','Escee','Na','Good',NULL,NULL,'0','Na',NULL,'Escee Ltd',NULL,16,NULL),(443,'8901030599415',104,'Lux SOftTouch 10rs',10,50,NULL,'0','0','Lux','Na','Good',NULL,NULL,'0','Na',NULL,'Hindustan',NULL,NULL,NULL),(444,'453436758517',121,'Coolest Brush Rs 15',15,50,NULL,'0','0','Coolest','Na','Good',NULL,NULL,'0','Na',NULL,'Ushtavinayak Ltd',NULL,NULL,NULL),(445,'8901030538780',105,'SurfExcelBarSoap',27,50,NULL,'0','0','Surfexcel','Na','Good',NULL,NULL,'0','Na',NULL,'Hindustan',NULL,16,NULL),(446,'8901108174070',104,'Nirma_white_10rs',10,50,NULL,'0','0','Nirma','Na','Good',NULL,NULL,'0','Na',NULL,'Nirma ltd',NULL,NULL,NULL),(447,'870351001403',83,'Savorit semia150g',17,50,NULL,'0','0','Savorit','Na','Good',NULL,NULL,'0','Na',NULL,'Savorit Ltd',NULL,NULL,NULL),(448,'8901108172021',104,'Nirma Green 14rs',14,50,NULL,'0','0','Nirma','Na','Good',NULL,NULL,'0','Na',NULL,'Nirma ltd',NULL,NULL,NULL),(449,'8901751003116',102,'Cycleagarbathi 115g',50,50,NULL,'0','0','Cycle','Na','Good',NULL,NULL,'0','Na',NULL,'N Ranga Rao Ltd',NULL,NULL,NULL),(450,'8901314088574',121,'Colgate Cibaca',35,50,NULL,'0','0','Colgate','Na','Good',NULL,NULL,'0','Na',NULL,'Colgate Palmolive',NULL,NULL,NULL),(451,'8906057530908',104,'Medimix 5rs',5,50,NULL,'0','0','Medimex','Na','Good',NULL,NULL,'0','Na',NULL,'Ava',NULL,NULL,NULL),(452,'8906032103563',104,'Ruchino1_snadle10rs',10,50,NULL,'0','0','RuchiNo','Na','Good',NULL,NULL,'0','Na',NULL,'EverShine',NULL,NULL,NULL),(453,'8904058700375',92,'Laxmanrekhaa',15,50,NULL,'0','0','Laxmanrekhaa','Na','Good',NULL,NULL,'0','Na',NULL,'Midas ltd',NULL,NULL,NULL),(454,'8904000900983',101,'Anchor White',40,50,NULL,'0','0','Anchor','Na','Good',NULL,NULL,'0','Na',NULL,'Anchor Ltd',NULL,NULL,NULL),(455,'4902430679749',121,'Oral-B medium',22,50,NULL,'0','0','Oral-B','Na','Good',NULL,NULL,'0','Na',NULL,'Rialto Enterprices',NULL,NULL,NULL),(456,'8901751000047',102,'Cycle Small 5rs',5,50,NULL,'0','0','Cycle','Na','Good',NULL,NULL,'0','Na',NULL,'Cycle',NULL,NULL,NULL),(457,'8901012112519',110,'johnsonBabySoap_15rs',15,50,NULL,'0','0','johnsonm','Na','Na',NULL,NULL,'0','Na',NULL,'Johnson',NULL,NULL,NULL),(458,'8901030566851',104,'International_Breeze',10,50,NULL,'0','0','Jai','Na','Good',NULL,NULL,'0','Na',NULL,'Hindustanlever',NULL,NULL,NULL),(459,'8904000900921',101,'Anchor Rs5',5,50,NULL,'0','0','Anchor','Na','Good',NULL,NULL,'0','Na',NULL,'Anchor',NULL,NULL,NULL),(460,'8901030610967',107,'Surfexcel 500g',57,50,NULL,'0','0','Surf excel','Na','Good',NULL,NULL,'0','Na',NULL,'Hindustan Uniliver',NULL,NULL,NULL),(461,'8901030601354',124,'Comfort 200ml',53,50,NULL,'0','0','Comfort','Na','Good',NULL,NULL,'0','Na',NULL,'Hindustan Uniliver',NULL,NULL,NULL),(462,'8901725131975',115,'Marie Light 200g',20,50,NULL,'0','0','Sunfeast','Na','Good',NULL,NULL,'0','Na',NULL,'Mohan Bakers',NULL,NULL,NULL),(463,'8901725133597',115,'Sunfeast Bounce pineapple 50g',5,50,NULL,'0','0','Sunfeast','Nothing','Good',NULL,NULL,'0','NA',NULL,'Itc',NULL,16,NULL),(464,'8906007240123',83,'Elite Broken Wheat 500g',28,50,NULL,'0','0','Elite','Na','Good',NULL,NULL,'0','Na',NULL,'Elite',NULL,NULL,NULL),(465,'8901023015311',104,'Godrey germProtction pack 4',98,50,NULL,'0','28','Godrej','Na','Good',NULL,NULL,'0','Na',NULL,'Gogrej',NULL,NULL,NULL),(466,'8902102160137',105,'Exo round 250g',25,50,NULL,'0','0','Exo','Na','Good',NULL,NULL,'0','Na',NULL,'Jyothi Laboratary',NULL,NULL,NULL),(467,'8901030597855',104,'Lifebouy_ActiveSalt_10rs',10,50,NULL,'0','0','LIfebouy','Na','Good',NULL,NULL,'0','Na',NULL,'Hindustan',NULL,16,NULL),(468,'8906002419579',105,'DrWash',23,50,NULL,'0','0','Dr.wash','Na','Good',NULL,NULL,'0','Na',NULL,'Ashique Export',NULL,NULL,NULL),(469,'8906012251336',107,'Oorvasi Wash powder rs5',5,50,NULL,'0','0','oorvasi','Na','Good',NULL,NULL,'0','Na',NULL,'Rajam',NULL,NULL,NULL),(470,'8901030493072',104,'Pears-Pure&Gentle',36,50,NULL,'0','0','pears','Na','Good',NULL,NULL,'0','NA',NULL,'Hindustan',NULL,NULL,NULL),(471,'8906057530007',104,'Medimex-Clear Glycerine',40,50,NULL,'0','0','Medimex','Na','Good',NULL,NULL,'0','NA',NULL,'AVA',NULL,NULL,NULL),(472,'8902102125709',124,'Crisp&Shine floral 100g',25,50,NULL,'0','0','Ujala','Na','Good',NULL,NULL,'0','Na',NULL,'Jyothi',NULL,NULL,NULL),(473,'8908002975017',104,'Kashya Soap-Ayruvedamix',25,50,NULL,'0','0','Kashya Soap','Na','Good',NULL,NULL,'0','NA',NULL,'Sanjeevini Herbals',NULL,NULL,NULL),(474,'8901396395300',104,'Detol Cool',27,50,NULL,'0','0','Detol','Na','Good',NULL,NULL,'0','NA',NULL,'Reckitty',NULL,NULL,NULL),(475,'815865000122',142,'Black rose',60,50,NULL,'0','0','Black rose','Na','Good',NULL,NULL,'0','Na',NULL,'Henna',NULL,NULL,NULL),(476,'8906001031215',104,'Radhas 100g',25,50,NULL,'0','0','Radhas','NA','Good',NULL,NULL,'0','Na',NULL,'Radhas pvt ltd',NULL,NULL,NULL),(477,'8901751000085',102,'Bansuri Agarbathi',5,50,NULL,'0','0','Cycle','Na','Goods',NULL,NULL,'0','Na',NULL,'Cycle',NULL,NULL,NULL),(478,'8904000950711',104,'Dyna Premimum',10,50,NULL,'0','0','Dyna','NA','Good',NULL,NULL,'0','Na',NULL,'Dyna',NULL,NULL,NULL),(479,'8902102125648',124,'Crisp&Shine Blossom 100ml',25,50,NULL,'0','0','Ujala','Na','Good',NULL,NULL,'0','Na',NULL,'Jyothi',NULL,NULL,NULL),(480,'8901725131951',115,'Sunfeast-Marie LIght',10,50,NULL,'0','0','Sunfeast','Na','Good',NULL,NULL,'0','Na',NULL,'ITC',NULL,NULL,NULL),(481,'8901314010520',101,'Colgate White 100g',48,50,NULL,'0','0','Colgate','Na','Good',NULL,NULL,'0','Na',NULL,'Colgate',NULL,NULL,NULL),(482,'8906017760604',116,'Quality Coriander 100g',18,50,NULL,'0','0','Quality','Na','Good',NULL,NULL,'0','Na',NULL,'Quality',NULL,NULL,NULL),(483,'8901719255151',115,'Parle-g-Orginal',10,50,NULL,'0','0','Parle','Na','Good',NULL,NULL,'0','Na',NULL,'Parle',NULL,NULL,NULL),(484,'8906034800093',145,'Green Chillies Vineger 1ltr',27,50,NULL,'0','0','Green chillies','Na','Good',NULL,NULL,'0','Na',NULL,'Manjaly',NULL,NULL,NULL),(485,'490243066646',120,'Gillette-Guard',22,50,NULL,'0','0','Gillette','Na','Good',NULL,NULL,'0','NA',NULL,'Care Utility Pvt Ltd',NULL,NULL,NULL),(486,'8902102194927',134,'Ujala Supreme 30rs',30,50,NULL,'0','0','Ujala','Na','Good',NULL,NULL,'0','NA',NULL,'Jyothy LAb',NULL,NULL,NULL),(487,'8901157001143',92,'Goodknight liquid',69,50,NULL,'0','0','Godrej','Na','Good',NULL,NULL,'0','Na',NULL,'Godrej',NULL,NULL,NULL),(488,'8901063093416',115,'Goodday-Cashenw Cook-10rs',10,50,NULL,'0','0','Britannia','Na','Good',NULL,NULL,'0','Na',NULL,'Britannia',NULL,NULL,NULL),(489,'8901725132132',115,'Sunfeast 3rs',3,100,NULL,'0','0','Sunfeast','na','Good',NULL,NULL,'0','NA',NULL,'ITC',NULL,NULL,NULL),(490,'8906015120011',112,'Z Talc 50g',45,50,NULL,'0','0','Z talc','Na','Good',NULL,NULL,'0','Na',NULL,'Sadanam Ltd',NULL,NULL,NULL),(491,'8901012165249',111,'Stayfree Secure',33,50,NULL,'0','0','Stayfree','Na','Good',NULL,NULL,'0','NA',NULL,'johnson &Johnson',NULL,NULL,NULL),(492,'8901030522420',107,'Sunlight-Color Guard 10rs',10,50,NULL,'0','0','Sunfeast','NA','Good',NULL,NULL,'0','NA',NULL,'LeverCare',NULL,NULL,NULL),(493,'8901157001150',92,'GoodKnight  silver refil',63,50,NULL,'0','0','Godrej','Na','Good',NULL,NULL,'0','Na',NULL,'Godrej',NULL,NULL,NULL),(494,'8906014520300',112,'Gokul Santhol 30g',33,50,NULL,'0','0','Gokul','Na','Good',NULL,NULL,'0','Na',NULL,'T S R & Co',NULL,NULL,NULL),(495,'8901396350200',143,'Dettol Liquid 110ml',33,50,NULL,'0','0','Dettol','Na','Good',NULL,NULL,'0','Na',NULL,'M.l.KTK',NULL,NULL,NULL),(496,'8901030567100',125,'Dove Shampoo Sachet',3,50,NULL,'0','0','Dove','Na','Good',NULL,NULL,'0','Na',NULL,'Hindustan Uniliver',NULL,NULL,NULL),(497,'4902430653176',107,'Tide plus jasmine',1.5,50,NULL,'0','0','Tide','Na','Good',NULL,NULL,'0','Na',NULL,'Tide Ltd',NULL,NULL,NULL),(498,'8906000510049',86,'Cricket Ball',28,50,NULL,'0','0','Stumper','Na','Good',NULL,NULL,'0','Na',NULL,'MVPL Ltd',NULL,NULL,NULL),(499,'8901719703058',115,'Krack Jack rs10',10,50,NULL,'0','0','Parle','Na','Good',NULL,NULL,'0','Na',NULL,'Parle Ltd',NULL,NULL,NULL),(500,'8901764032707',93,'Sprite 600ml',30,50,NULL,'0','0','Sprite','Na','Godd',NULL,NULL,'0','Na',NULL,'Cocoa-Cola',NULL,NULL,NULL),(501,'8902080104055',93,'Pepsi 600ml',35,50,NULL,'0','0','Pepsi','Na','Good',NULL,NULL,'0','Na',NULL,'Pepsi Ltd',NULL,NULL,NULL),(502,'8902080304561',93,'7Up 1.25 Ltr',55,50,NULL,'0','0','7up','Na','Good',NULL,NULL,'0','Na',NULL,'A T C Ltd',NULL,16,NULL),(503,'8902080104567',93,'Pepsi 1.25 Ltr',55,50,NULL,'0','0','Pepsi','Na','Good',NULL,NULL,'0','Na',NULL,'PepsiLtd',NULL,NULL,NULL),(504,'8904118000056',93,'Club Soda 1.50 Ltr',30,50,NULL,'0','0','Golden Valley','Na','Good',NULL,NULL,'0','Na',NULL,'Nest foods',NULL,NULL,NULL),(505,'8902080304080',93,'7up 2 Ltr',90,50,NULL,'0','0','7 up','Na','Good',NULL,NULL,'0','Na',NULL,'Pepsi Ltd',NULL,16,NULL),(506,'8901571003655',115,'Horlicks Biscuits 200g',20,50,NULL,'0','0','Horlicks','Na','Good',NULL,NULL,'0','Na',NULL,'G S K Ltd',NULL,NULL,NULL),(507,'8901058842746',135,'Maggi 4 pack',45,50,NULL,'0','0','Nestle','Na','good',NULL,NULL,'0','Na',NULL,'Nestle Ltd',NULL,NULL,NULL),(508,'8902080204090',93,'Mirinda 600ml',35,50,NULL,'0','0','Pepsi','Na','Good',NULL,NULL,'0','Na',NULL,'Pepsico',NULL,NULL,NULL),(509,'8902080304097',93,'7up 600ml',30,50,NULL,'0','0','7 up','Na','Good',NULL,NULL,'0','Na',NULL,'Pepsico',NULL,16,NULL),(510,'8901972060141',115,'Creme 4 Fun 10rs',10,50,NULL,'0','0','Dukes','Na','Good',NULL,NULL,'0','Na',NULL,'Ravi Ltd',NULL,NULL,NULL),(511,'8901725132873',115,'Dark Fantasy Choco fills 75g',30,50,NULL,'0','0','Sunfeast','Na','Good',NULL,NULL,'0','Na',NULL,'I T C Ltd',NULL,NULL,NULL),(512,'8901972053747',115,'Creme 4 Fun Chocolate',10,50,NULL,'0','0','Dukes','Na','Good',NULL,NULL,'0','Na',NULL,'Ravi Ltd',NULL,NULL,NULL),(513,'8901063012349',115,'Milk Bikis 150g',20,50,NULL,'0','0','Britannia','Na','Good',NULL,NULL,'0','Na',NULL,'Britannia Ltd',NULL,NULL,NULL),(514,'8901063023895',115,'Marie gold 200g',22,50,NULL,'0','0','Britannia','Na','Good',NULL,NULL,'0','Na',NULL,'Britannia Ltd',NULL,NULL,NULL),(515,'8903183200019',86,'Classmate Pencil',40,50,NULL,'0','0','Classmate','Na','Good',NULL,NULL,'0','Na',NULL,'I T C Ltd',NULL,NULL,NULL),(516,'8901207089107',86,'Dabur red 50g',19,50,NULL,'0','0','Dabur','Na','Good',NULL,NULL,'0','N',NULL,'Dabur Ltd',NULL,NULL,NULL),(517,'8904010690218',116,'Nirapara Coriander powder 100g',18.5,50,NULL,'0','0','Nirapara','Na','Good',NULL,NULL,'0','Na',NULL,'Nirapara',NULL,NULL,NULL),(518,'8901063138155',115,'Arrowroot 150g',20,50,NULL,'0','0','Britannia','Na','Good',NULL,NULL,'0','Na',NULL,'Britannia',NULL,NULL,NULL),(519,'8901719255168',115,'Parle-G Gluco 250g',20,50,NULL,'0','0','Parle','Na','Good',NULL,NULL,'0','Na',NULL,'Parle',NULL,NULL,NULL),(520,'8901571003648',115,'Horlicks Bisciut  10Rs',10,50,NULL,'0','0','horlicks','Na','Good',NULL,NULL,'0','Na',NULL,'G S K Ltd',NULL,NULL,NULL),(521,'8902979001441',125,'Meera Shampoo 10rs',10,50,NULL,'0','0','Meera','Na','Good',NULL,NULL,'0','Na',NULL,'Cavin Care',NULL,NULL,NULL),(522,'8901743040310',116,'Melam Turmeric Powder 50g',10.5,50,NULL,'0','0','Melam','Na','Good',NULL,NULL,'0','Na',NULL,'A V A ltd',NULL,NULL,NULL),(523,'8901571000098',127,'Horlicks Classic Mart 200g',104,50,NULL,'0','0','Horlicks','Na','Good',NULL,NULL,'0','Na',NULL,'Horlicks',NULL,NULL,NULL),(524,'8906032010401',85,'Ruchi Gold Palmolein 200ml',19,50,NULL,'0','0','Ruchi Gold','Na','Good',NULL,NULL,'0','Na',NULL,'Ruchi Ltd',NULL,NULL,NULL),(525,'8901287100013',104,'Mysore Sandal soap 75g',35,50,NULL,'0','0','Mysore Sandal','Na','Good',NULL,NULL,'0','Na',NULL,'Karnataka Ltd',NULL,NULL,NULL),(526,'8901399009211',104,'Chandrika Sandal&Safron 75g',30,50,NULL,'0','0','Chandrika','Na','Good',NULL,NULL,'0','Na',NULL,'Wipro Ltd',NULL,NULL,NULL),(527,'8901725134747',115,'Sunfeast Bounce Orange 10rs',10,50,NULL,'0','0','Sunfeast','Na','Good',NULL,NULL,'0','Na',NULL,'I T C Ltd',NULL,NULL,NULL),(528,'8901063162136',115,'Marie Gold 120g',15,50,NULL,'0','0','Britannia','Na','Good',NULL,NULL,'0','Na',NULL,'Britannia Ltd',NULL,NULL,NULL),(529,'8906032010012',85,'Ruchi Gold 1 Ltr',86,50,NULL,'0','0','Ruchi','Na','Good',NULL,NULL,'0','Na',NULL,'Ruchi Soya',NULL,NULL,NULL),(530,'8906001232384',104,'Nature Power papaya 125g',30,50,NULL,'0','0','Nature power','Na','Good',NULL,NULL,'0','Na',NULL,'Power Soap ltd',NULL,NULL,NULL),(531,'8901523111025',107,'Sabena 500g',12,50,NULL,'0','0','Sabena','Na','Good',NULL,NULL,'0','Na',NULL,'Ecof ltd',NULL,NULL,NULL),(532,'8901030603174',105,'Vim  bar 10rs',10,50,NULL,'0','0','Vim','Na','Good',NULL,NULL,'0','Na',NULL,'Hindustan uniliver Ltd',NULL,NULL,NULL),(533,'8901030620980',104,'Lux rose water 100g',26,50,NULL,'0','0','Lux','Na','Good',NULL,NULL,'0','Na',NULL,'Hindustan Uniliver Ltd',NULL,NULL,NULL),(534,'8901030514685',101,'Pepsodent 10rs',10,50,NULL,'0','0','Pepsodent','Na','Good',NULL,NULL,'0','Na',NULL,'Hindustan uniliver Ltd',NULL,NULL,NULL),(535,'8901314306050',101,'Colgate Cibaca 30g',10,50,NULL,'0','0','Colgate','Na','Good',NULL,NULL,'0','Na',NULL,'Colgate Ltd',NULL,NULL,NULL),(536,'8901233019451',98,'Perk 5rs',5,50,NULL,'0','0','Perk','Na','Good',NULL,NULL,'0','Na',NULL,'Mondelez ltd',NULL,NULL,NULL),(537,'8904125701861',96,'Shingar Kajal 10rs',10,50,NULL,'0','0','Shingar','Na','Good',NULL,NULL,'0','Na',NULL,'Shingar Ltd',NULL,NULL,NULL),(538,'8908004839294',146,'Narasus cut mango pickle 80g',10,50,NULL,'0','0','Narasus','Na','Good',NULL,NULL,'0','Na',NULL,'Narasus Ltd',NULL,NULL,NULL),(539,'8908004839355',146,'Narasus Cut lime Pickle 80g',10,50,NULL,'0','0','Narasus','Na','Good',NULL,NULL,'0','Na',NULL,'Narasus',NULL,NULL,NULL),(540,'8902102125952',124,'Ujala Crisp&shine Sachet',3,50,NULL,'0','0','Ujala','Na','Good',NULL,NULL,'0','Na',NULL,'Jyothi Laboratary',NULL,NULL,NULL),(541,'8901691003450',91,'Evereday AA 1015',125,50,NULL,'0','0','Evereday','Na','Good',NULL,NULL,'0','Na',NULL,'Evereday',NULL,NULL,NULL),(542,'8901030522437',107,'Sunlight colour guard 500g',39,50,NULL,'0','0','Sunlight','Na','Good',NULL,NULL,'0','Na',NULL,'Hindustan uniliver',NULL,NULL,NULL),(543,'8901030574405',107,'Wheel 500g',26,50,NULL,'0','0','Wheel','Na','Good',NULL,NULL,'0','Na',NULL,'Hindustan Uniliver',NULL,NULL,NULL),(544,'4902430627108',107,'Tide Naturals lemon 500g',31,50,NULL,'0','0','Tide','Na','Good',NULL,NULL,'0','Na',NULL,'Tide',NULL,NULL,NULL),(545,'8906032013938',104,'Ruchi No1',10,50,NULL,'0','0','Ruchi','Na','Good',NULL,NULL,'0','Na',NULL,'M K T Ltd',NULL,NULL,NULL),(546,'8906010261047',85,'Gold Winner 500ml',54,50,NULL,'0','0','Gold winner','Na','Good',NULL,NULL,'0','Na',NULL,'Kaleesuwari',NULL,NULL,NULL),(547,'8906032010029',85,'Ruchi Gold 500ml',44,50,NULL,'0','0','Ruchi gold','Na','Good',NULL,NULL,'0','Na',NULL,'Ruchi Soya',NULL,NULL,NULL),(548,'8906010261030',85,'Gold winner 200ml',21,50,NULL,'0','0','Gold winner','Na','Good',NULL,NULL,'0','Na',NULL,'Kaleesuwari',NULL,NULL,NULL),(549,'8904001800282',85,'Idhayam Nallenna 200ml',52,50,NULL,'0','0','Idhayam','Na','Good',NULL,NULL,'0','Na',NULL,'V V V Ltd',NULL,NULL,NULL),(550,'8906032010166',85,'Ruchi Gold Mustard Oil 200ml',39,50,NULL,'0','0','Ruchi','Na','Good',NULL,NULL,'0','Na',NULL,'Ruchi Soya',NULL,NULL,NULL),(551,'8906005451149',85,'K P L Shundhi Coconut Oil 500ml',70,50,NULL,'0','0','K P L','Na','Good',NULL,NULL,'0','Na',NULL,'K P L Ltd',NULL,NULL,NULL),(552,'8901088050586',85,'Parachute Coconut oil 175ml',54,50,NULL,'0','0','Parchute','Na','Good',NULL,NULL,'0','Na',NULL,'Marico Ltd',NULL,NULL,NULL),(553,'8906029780218',85,'Milma Ghee 200ml',102,50,NULL,'0','0','Milma','Na','Good',NULL,NULL,'0','Na',NULL,'Milma Ltd',NULL,NULL,NULL),(554,'62620454X1',98,'Milikybar',5,50,NULL,'0','0','Milkybar','Na','Good',NULL,NULL,'0','Na',NULL,'Nestle Ltd',NULL,NULL,NULL),(555,'8902042111107',114,'A V  T 1kg pack',220,50,NULL,'0','0','A V T','Na','Good',NULL,NULL,'0','Na',NULL,'A V T Ltd',NULL,NULL,NULL),(556,'4902430684224',120,'Gillette 7o clock',22,50,NULL,'0','0','Gillette','Na','Good',NULL,NULL,'0','Na',NULL,'Care utility',NULL,NULL,NULL),(557,'8901030606311',105,'Vim 5rs',5,50,NULL,'0','0','Vim','Na','Good',NULL,NULL,'0','Na',NULL,'Hindustan uniliver',NULL,NULL,NULL),(558,'8902080504060',147,'Aquafina 1Ltr',20,50,NULL,'0','0','Aqufina','Na','Good',NULL,NULL,'0','Na',NULL,'Pepsico',NULL,NULL,NULL),(559,'8904027303095',104,'Jo Almond & Cream Pack of 4',48,50,NULL,'0','18','Jo','Na','Na',NULL,NULL,'0','NA',NULL,'Jo',NULL,NULL,NULL),(560,'8904027303255',104,'Jo Sandle & Turmeric Pack of 4',48,50,NULL,'0','18','Jo','NA','Na',NULL,NULL,'0','NA',NULL,'Jo',NULL,NULL,NULL),(561,'8901023011085',104,'Godrej No.1 aloe vera pack of 4',68,50,NULL,'0','0','Godrej No.1','Na','Na',NULL,NULL,'0','Na',NULL,'Godrej',NULL,NULL,NULL),(562,'8906002411146',104,'Gladys-International',20,50,NULL,'0','0','Gladys','Na','Na',NULL,NULL,'0','Na',NULL,'Ashique Export',NULL,NULL,NULL),(563,'8901030565368',133,'Fair & Lovely 50g',89,50,NULL,'0','0','Fair & Llovely','Na','Good',NULL,NULL,'0','Na',NULL,'Fair and Lovely',NULL,NULL,NULL),(564,'4902430651752',125,'Head & Shoulders lemon Fresh 80ml',60,50,NULL,'0','0','Head & Shoulder','Na','Good',NULL,NULL,'0','Na',NULL,'Head and Shoulder',NULL,NULL,NULL),(565,'8906001231295',105,'Power Active',10,50,NULL,'0','0','Power Active','Na','Na',NULL,NULL,'0','Na',NULL,'Power Sopa',NULL,NULL,NULL),(566,'8901030585838',105,'Lifebouy Nature Green',25,50,NULL,'0','0','lifebuoy','Na','Na',NULL,NULL,'0','Na',NULL,'Lifebuoy',NULL,NULL,NULL),(567,'8901396151005',119,'Harpic Original 500ml',74,50,NULL,'0','0','Harpic','Na','Good',NULL,NULL,'0','Na',NULL,'Reckitt',NULL,NULL,NULL),(568,'8901030585517',104,'Lifebuoy Lemon Fresh',25,50,NULL,'0','0','Lifebuoy','Na','Na',NULL,NULL,'0','NA',NULL,'Lifebouye',NULL,NULL,NULL),(569,'8906002411344',104,'Lexus Skin Care',24,50,NULL,'0','0','Lexus','Na','Na',NULL,NULL,'0','Na',NULL,'Lexus',NULL,NULL,NULL),(570,'8906001232407',104,'Nature Power Lime',28,50,NULL,'0','0','Nature','Na','Na',NULL,NULL,'0','Na',NULL,'Nature',NULL,16,NULL),(571,'8906001232421',104,'Nature Power Sandle',28,50,NULL,'0','0','Nature','Na','Na',NULL,NULL,'0','Na',NULL,'Nature',NULL,NULL,NULL),(572,'8901399010019',104,'Santhoor',26,50,NULL,'0','0','Santhoor','Na','Na',NULL,NULL,'0','Na',NULL,'Santhoor',NULL,NULL,NULL),(573,'8902102125693',124,'Crisp& Shine Floral 200ml',47,50,NULL,'0','0','Ujala','Na','Good',NULL,NULL,'0','Na',NULL,'Jyothi Laboratery',NULL,16,NULL),(574,'8901440023135',116,'Eastern Turmeric Powder 50g',10.5,50,NULL,'0','0','Eastern','Na','Good',NULL,NULL,'0','Na',NULL,'Eastern Ltd',NULL,NULL,NULL),(575,'8901052031368',114,'Kanan Devan Classic 250g',75,50,NULL,'0','0','Tata','Na','Goods',NULL,NULL,'0','Na',NULL,'Tata Ltd',NULL,NULL,NULL),(576,'8904010690270',116,'Nirapara Coriander Powder 250g',45,50,NULL,'0','0','Niarapara','Na','Good',NULL,NULL,'0','Na',NULL,'K K R Foods',NULL,NULL,NULL),(577,'8902102125631',124,'Ujala Crisp&Shine Blossom 200ml',47,50,NULL,'0','0','Ujala','Na','Good',NULL,NULL,'0','Na',NULL,'Jyothi Laboratary',NULL,NULL,NULL),(578,'8901030574375',107,'Wheel 170g',10,50,NULL,'0','0','Wheel','Na','Good',NULL,NULL,'0','Na',NULL,'Hindustan Uniliver',NULL,NULL,NULL),(579,'8901088056571',141,'Parachute Ayurvedic Hair oil 45ml',33,50,NULL,'0','0','Parachute','Na','Good',NULL,NULL,'0','Na`',NULL,'Marico',NULL,NULL,NULL),(580,'89069012259714',105,'Oorvasi 10rs',10,50,NULL,'0','0','Oorvasi','Na','Na',NULL,NULL,'0','Na',NULL,'Rajam ndustries',NULL,NULL,NULL),(581,'801092120528',132,'Happy Pineaplle Squash 200ml',55,50,NULL,'0','0','Happy','Na','Good',NULL,NULL,'0','Na',NULL,'Kilban Foods',NULL,NULL,NULL),(582,'8901725937188',104,'Vivel Aloe Vera',25,50,NULL,'0','0','Vivel','na','Na',NULL,NULL,'0','NA',NULL,'ITC',NULL,NULL,NULL),(583,'8906001239154',105,'Power jumbo',10,50,NULL,'0','0','power Jumbo','Na','Na',NULL,NULL,'0','NA',NULL,'Power',NULL,NULL,NULL),(584,'8901396117612',117,'Lizol Lavender 200ml',30,50,NULL,'0','0','Lizol','Na','Good',NULL,NULL,'0','Na',NULL,'Reckitt',NULL,NULL,NULL),(585,'8901063016613',115,'50 50 sweet and salt 200g',25,50,NULL,'0','0','Britannia','Na','Na',NULL,NULL,'0','Na',NULL,'Britannia',NULL,NULL,NULL),(586,'8902042111060',114,'A V T Premium 250g',75,50,NULL,'0','0','A V T','Na','Good',NULL,NULL,'0','Na',NULL,'A V T Ltd',NULL,NULL,NULL),(587,'8902102300687',107,'Ujala wash powder 500g',40,50,NULL,'0','0','Ujala','Na','Good',NULL,NULL,'0','Na',NULL,'Jyothi Laboratary',NULL,NULL,NULL),(588,'8906017760048',116,'Quality Turmeric Powder 100g',20,50,NULL,'0','0','quality','Na','Good',NULL,NULL,'0','Na',NULL,'Quality',NULL,NULL,NULL),(589,'8906029780201',85,'Milma Ghee 100ml',53,50,NULL,'0','0','Milma','Na','Good',NULL,NULL,'0','Na',NULL,'Milma',NULL,NULL,NULL),(590,'801092110529',132,'Happy Orange Squash 200ml',55,50,NULL,'0','0','Happy','Na','Good',NULL,NULL,'0','Na',NULL,'Kilban foods',NULL,NULL,NULL),(591,'8902102194934',134,'Ujala Supreme 250ml',60,50,NULL,'0','0','Ujala','Na','Good',NULL,NULL,'0','Na',NULL,'Jyothi Laboratary',NULL,NULL,NULL),(592,'004001400999',83,'Prince Atta 1 kg',41,50,NULL,'0','0','Prince','Na','Good',NULL,NULL,'0','Na',NULL,'Prince Ltd',NULL,16,NULL),(593,'8901725121747',83,'Aashirvaad Atta 1kg',49,50,NULL,'0','0','Aashirvaad','Na','Good',NULL,NULL,'0','Na',NULL,'Century',NULL,NULL,NULL),(594,'8904010690249',116,'Nirapara Chilly powder 250g',60,50,NULL,'0','0','Nirapara','Na','Good',NULL,NULL,'0','Na',NULL,'K K R Ltd',NULL,NULL,NULL),(595,'8901030611926',107,'Sunlight Colour Guard 1kg',78,50,NULL,'0','0','Sunlight','Na','Good',NULL,NULL,'0','Na',NULL,'Hindustan Uniliver',NULL,NULL,NULL),(596,'8906029780058',97,'Milma Dark',19,30,NULL,'0','0','Milma','NA','good',NULL,NULL,'0','Na',NULL,'Milma',NULL,NULL,NULL),(597,'8906029780010',97,'milma lightBlue',18,50,NULL,'0','0','milma','Na','Na',NULL,NULL,'0','Na',NULL,'Milma',NULL,NULL,NULL),(598,'8906029781239',97,'MIlma Curd',20,50,NULL,'0','0','Milma','Na','Good',NULL,NULL,'0','Na',NULL,'Milma',NULL,NULL,NULL),(599,'9144221931826',98,'Mr.Fun',10,50,NULL,'0','0','CornChoco','Na','Na',NULL,NULL,'0','Na',NULL,'Corn Choco',NULL,NULL,NULL),(600,'8906030531083',146,'Papjo Lime pickle 1kg',76,50,NULL,'0','0','Papjo','Na','Good',NULL,NULL,'0','Na`',NULL,'PeeJay',NULL,NULL,NULL),(601,'8906002660711',85,'Coconad coconut oil 1Ltr',140,50,NULL,'0','0','KLF','Na','Good',NULL,NULL,'0','Na',NULL,'KLF Ltd',NULL,NULL,NULL),(602,'8906002660551',85,'Coconad Coconut oil 500ml',74,50,NULL,'0','0','K L F','Na','Good',NULL,NULL,'0','Na',NULL,'K L F Ltd',NULL,NULL,NULL),(603,'2261',86,'Swar61',12,10,NULL,'1','0','Swarna Champa','BAKTHI','Good',NULL,NULL,'0','NA',NULL,'Moksha Agarbatti',NULL,16,NULL);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `username` varchar(15) DEFAULT NULL,
  `password` varchar(15) DEFAULT NULL,
  `role` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('admin','admin','administator');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qty` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ord_fk` (`order_id`),
  KEY `item_fk` (`item_id`),
  CONSTRAINT `item_fk` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  CONSTRAINT `ord_fk` FOREIGN KEY (`order_id`) REFERENCES `orderheader` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderheader`
--

DROP TABLE IF EXISTS `orderheader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderheader` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordernumber` varchar(20) DEFAULT NULL,
  `orderdate` datetime DEFAULT NULL,
  `totdiscount` int(4) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_fk` (`userid`),
  CONSTRAINT `user_fk` FOREIGN KEY (`userid`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderheader`
--

LOCK TABLES `orderheader` WRITE;
/*!40000 ALTER TABLE `orderheader` DISABLE KEYS */;
INSERT INTO `orderheader` VALUES (100,'122NEW19','2016-02-07 00:00:00',0,NULL);
/*!40000 ALTER TABLE `orderheader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseorder`
--

DROP TABLE IF EXISTS `purchaseorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchaseorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordernumber` varchar(20) NOT NULL,
  `itemid` int(11) DEFAULT NULL,
  `supplierid` int(11) DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `rate` double NOT NULL,
  `orderdate` datetime DEFAULT NULL,
  `deliverydate` datetime DEFAULT NULL,
  `totalamt` double DEFAULT NULL,
  `notes` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sup_fk` (`supplierid`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseorder`
--

LOCK TABLES `purchaseorder` WRITE;
/*!40000 ALTER TABLE `purchaseorder` DISABLE KEYS */;
INSERT INTO `purchaseorder` VALUES (16,'SEEDDATA',0,NULL,0,0,'2016-01-27 00:00:00',NULL,23888.45,'Notes'),(43,'IT_NEWREAL',0,37,0,0,'2016-01-27 00:00:00',NULL,23888.45,'Notes'),(44,'IT_NEWREAL',0,37,0,0,'2016-01-27 00:00:00',NULL,23888.45,'Notes'),(45,'IT_NEWREAL',0,37,0,0,'2016-01-27 00:00:00',NULL,23888.45,'Notes');
/*!40000 ALTER TABLE `purchaseorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `register` (
  `firstname` varchar(25) DEFAULT NULL,
  `lastname` varchar(25) DEFAULT NULL,
  `usernam` varchar(20) NOT NULL,
  `password` varchar(35) DEFAULT NULL,
  `confirmpass` varchar(35) DEFAULT NULL,
  `role` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`usernam`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register`
--

LOCK TABLES `register` WRITE;
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` VALUES ('Shabna','Kabeer','Shabna123','abc','abc','staff');
/*!40000 ALTER TABLE `register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registerbank`
--

DROP TABLE IF EXISTS `registerbank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registerbank` (
  `ifsccode` varchar(25) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `branch` varchar(25) DEFAULT NULL,
  `accno` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ifsccode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registerbank`
--

LOCK TABLES `registerbank` WRITE;
/*!40000 ALTER TABLE `registerbank` DISABLE KEYS */;
INSERT INTO `registerbank` VALUES ('SB4657389TP','SBT','Palakkad','6768932167'),('SBI78976WES','SBI','Palakkad','7896453673');
/*!40000 ALTER TABLE `registerbank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `descp` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `phone2` varchar(20) DEFAULT NULL,
  `address1` varchar(20) DEFAULT NULL,
  `address2` varchar(20) DEFAULT NULL,
  `address3` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (37,'MMMe','New Bazar','34543534','335345','sdsd asdasd Add1','add2','add3'),(38,'Update','New Bazar','34543534','335345','sdsd asdasd Add1','add2','add3');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `PHONE` varchar(20) DEFAULT NULL,
  `FAX` varchar(20) DEFAULT NULL,
  `ADD1` varchar(20) DEFAULT NULL,
  `ADD2` varchar(20) DEFAULT NULL,
  `ADD3` varchar(20) DEFAULT NULL,
  `CARDNO` varchar(20) DEFAULT NULL,
  `CARDEXPDT` date DEFAULT NULL,
  `AccountId` varchar(20) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `job` varchar(20) DEFAULT NULL,
  `customerType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (48,'malathy','1e10e232e61655de22abbee1f3782118',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-05  0:33:42
