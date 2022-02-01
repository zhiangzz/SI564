-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: 35.239.81.122    Database: marvel_database
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `character_stat`
--

DROP TABLE IF EXISTS `character_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_stat` (
  `ID` int NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Alignment` varchar(255) DEFAULT NULL,
  `Intelligence` int DEFAULT NULL,
  `Strength` int DEFAULT NULL,
  `Speed` int DEFAULT NULL,
  `Durability` int DEFAULT NULL,
  `Power` int DEFAULT NULL,
  `Combat` int DEFAULT NULL,
  `Total` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `character_stat_ID_index` (`ID`),
  CONSTRAINT `character_stat_superheroes_power_matrix_ID_fk` FOREIGN KEY (`ID`) REFERENCES `superheroes_power_matrix` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_stat`
--

LOCK TABLES `character_stat` WRITE;
/*!40000 ALTER TABLE `character_stat` DISABLE KEYS */;
INSERT INTO `character_stat` VALUES (0,'Ant Man','good',100,10,23,28,32,32,225),(1,'Black Panther','good',88,16,30,60,41,100,335),(2,'Black Widow','good',75,13,27,32,32,100,279),(3,'Captain America','good',63,75,45,90,50,100,423),(4,'Captain Marvel','good',100,100,67,95,62,56,480),(5,'Deadpool','neutral',50,15,30,100,100,100,395),(6,'Doctor Strange','good',100,15,10,35,65,32,257),(7,'Gamora','good',61,30,35,20,25,35,206),(8,'Hawkeye','good',50,12,23,14,26,80,205),(9,'Hulk','good',65,100,50,90,100,100,505),(10,'Iron Man','good',100,85,58,85,100,64,492),(11,'Loki','bad',88,57,47,85,85,56,418),(12,'Spider Man','good',55,50,55,45,50,55,310),(13,'Thanos','bad',88,100,17,100,100,80,485),(14,'Thor','good',69,100,92,100,100,85,546),(15,'Valkyrie','good',63,70,60,60,70,75,398),(16,'Venom','bad',75,57,65,84,79,84,444),(17,'Vision','good',100,72,54,95,76,70,467),(18,'Wasp','good',70,60,70,35,25,65,325),(19,'Wolverine','good',55,32,38,100,44,100,369),(20,'Winter Soldier','neutral',68,65,40,40,65,70,348),(21,'War Machine','good',63,80,63,100,100,85,491),(22,'Shang Chi','good',45,45,55,45,55,65,310),(23,'Star Lord','good',35,50,40,60,55,60,300),(24,'Groot','good',45,45,25,85,60,55,315),(25,'Rocket Raccoon','good',65,45,35,60,65,25,295),(26,'Drax the Destroyer','good',45,45,55,65,65,60,335),(27,'Professor X','good',100,35,30,60,95,32,352),(28,'Iceman','good',70,65,60,55,80,45,375);
/*!40000 ALTER TABLE `character_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters_to_comics`
--

DROP TABLE IF EXISTS `characters_to_comics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characters_to_comics` (
  `characterID` int NOT NULL,
  `comicID` int NOT NULL,
  PRIMARY KEY (`comicID`),
  KEY `characters_to_comics_comics_comicID_fk` (`comicID`),
  KEY `characters_to_comics_marvel_character_info_idexID_fk` (`characterID`),
  CONSTRAINT `characters_to_comics_marvel_character_info_idexID_fk` FOREIGN KEY (`characterID`) REFERENCES `marvel_character_info` (`idexID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters_to_comics`
--

LOCK TABLES `characters_to_comics` WRITE;
/*!40000 ALTER TABLE `characters_to_comics` DISABLE KEYS */;
INSERT INTO `characters_to_comics` VALUES (0,1001),(1,1002),(2,1003),(3,1004),(4,1005),(5,1006),(6,1007),(7,1008),(8,1009),(9,1010),(10,1011),(11,1012),(12,1013),(13,1014),(14,1015),(15,1016),(16,1017),(17,1018),(18,1019),(19,1020),(20,1021),(21,1022),(22,1023),(23,1024),(24,1025),(25,1026),(26,1027),(27,1028),(28,1029);
/*!40000 ALTER TABLE `characters_to_comics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comics`
--

DROP TABLE IF EXISTS `comics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comics` (
  `comicID` int NOT NULL,
  `comics_title` varchar(255) DEFAULT NULL,
  `issueNumber` int NOT NULL,
  `characterName` varchar(255) DEFAULT NULL,
  `charID` int DEFAULT NULL,
  PRIMARY KEY (`comicID`),
  KEY `comics_comicID_index` (`comicID`),
  CONSTRAINT `comics_characters_to_comics_comicID_fk` FOREIGN KEY (`comicID`) REFERENCES `characters_to_comics` (`comicID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comics`
--

LOCK TABLES `comics` WRITE;
/*!40000 ALTER TABLE `comics` DISABLE KEYS */;
INSERT INTO `comics` VALUES (1001,'Ant-Man (2003) #2',2,'Ant Man',0),(1002,'Rise Of The Black Panther (Trade Paperback)',0,'Black Panther',1),(1003,'Black Widow: Deadly Origin',2,'Black Widow',2),(1004,'Captain America (2018)',0,'Captain America',3),(1005,'The Mighty Captain Marvel Vol. 1: Alien Nation (Trade Paperback)',1,'Captain Marvel',4),(1006,'Deadpool (2018)',0,'Deadpool',5),(1007,'Death of Doctor Strange(2021) #1',5,'Doctor Strange',6),(1008,'Thanos(2019) #3',3,'Gamora',7),(1009,'Hawkeye: Freefall',6,'Hawkeye',8),(1010,'Immortal Hulk (2018)',40,'Hulk',9),(1011,'Demon in a Bottle',128,'Iron Man',10),(1012,'Journey into mystery (1952)',83,'Loki',11),(1013,'Ultimate Spider-Man (Spanish Language Edition) (2000) #4',4,'Spider Man',12),(1014,'Thanos Vol. 1: Thanos Returns',6,'Thanos',13),(1015,'Thor Vol. 1: The Devourer King',6,'Thor',14),(1016,'The Mighty Valkyries',1,'Valkyrie',15),(1017,'Venom (2018) #4',4,'Venom',16),(1018,'Vision Vol. 1: Little Worse Than A Man',6,'Vision',17),(1019,'Ant-Man & the Wasp (2018) #5',5,'Wasp',18),(1020,'Ultimate X-Men (Spanish Language Edition) (2000) #4',4,'Wolverine',19),(1021,'Winter Soldier by Ed Brubaker: The Complete Collection',7,'Winter Soldier',20),(1022,'Infinity Wars (2018) #2',2,'War Machine',21),(1023,'Shang-Chi by Gene Luen Yang Vol. 1: Brothers & Sisters',5,'Shang Chi',22),(1024,'Star-Lord & Kitty Pride',3,'Star Lord',23),(1025,'I Am Groot',3,'Groot',24),(1026,'Rocket Raccoon Volume 1: A Chasing Tale',4,'Rocket Raccoon',25),(1027,'Guardians of the Galaxy Vol. 3',5,'Drax the Destroyer',26),(1028,'X-Men (2010)',0,'Professor X',27),(1029,'Iceman Vol. 1: Thawing Out',3048,'Iceman',28);
/*!40000 ALTER TABLE `comics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marvel_character_info`
--

DROP TABLE IF EXISTS `marvel_character_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marvel_character_info` (
  `idexID` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `alignment` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `eye_color` varchar(255) DEFAULT NULL,
  `race` varchar(255) DEFAULT NULL,
  `hair_color` varchar(255) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  PRIMARY KEY (`idexID`),
  KEY `marvel_character_info_idexID_index` (`idexID`),
  CONSTRAINT `marvel_character_info_character_stat_ID_fk` FOREIGN KEY (`idexID`) REFERENCES `character_stat` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marvel_character_info`
--

LOCK TABLES `marvel_character_info` WRITE;
/*!40000 ALTER TABLE `marvel_character_info` DISABLE KEYS */;
INSERT INTO `marvel_character_info` VALUES (0,'Ant Man','good','Male','blue','Human','Blond','Marvel Comics',122,211),(1,'Black Panther','good','Male','brown','Human','Black','Marvel Comics',90,183),(2,'Black Widow','good','Female','green','Human','Auburn','Marvel Comics',59,170),(3,'Captain America','good','Male','blue','Human','Blond','Marvel Comics',108,188),(4,'Captain Marvel','good','Female','blue','Human-Kree','Blond','Marvel Comics',74,180),(5,'Deadpool','neutral','Male','brown','Mutant','No Hair','Marvel Comics',95,188),(6,'Doctor Strange','good','Male','grey','Human','Black','Marvel Comics',81,188),(7,'Gamora','good','Female','yellow','Zen-Whoberian','Black','Marvel Comics',77,183),(8,'Hawkeye','good','Male','blue','Human','Blond','Marvel Comics',104,191),(9,'Hulk','good','Male','green','Human / Radiation','Green','Marvel Comics',630,244),(10,'Iron Man','good','Male','blue','Human','Black','Marvel Comics',191,198),(11,'Loki','bad','Male','green','Asgardian','Black','Marvel Comics',236,193),(12,'Spider Man','good','Male','hazel','Human','Brown','Marvel Comics',74,178),(13,'Thanos','bad','Male','red','Eternal','No Hair','Marvel Comics',443,201),(14,'Thor','good','Male','blue','Asgardian','Blond','Marvel Comics',288,198),(15,'Valkyrie','good','Female','blue','-','Blond','Marvel Comics',214,191),(16,'Venom','bad','Male','blue','Symbiote','Strawberry Blond','Marvel Comics',117,191),(17,'Vision','good','Male','gold','Android','No Hair','Marvel Comics',135,191),(18,'Wasp','good','Female','blue','Human','Auburn','Marvel Comics',50,163),(19,'Wolverine','good','Male','blue','Mutant','Black','Marvel Comics',135,160),(20,'Winter Soldier','good','Male','brown','Human','Brown','Marvel Comics',117,175),(21,'War Machine','good','Male','brown','Human','Brown','Marvel Comics',95,185),(22,'Shang Chi','good','Male','brown','Human','Black','Marvel Comics',79,178),(23,'Star Lord','good','Male','blue','Human','Blond','Marvel Comics',79,188),(24,'Groot','good',NULL,NULL,'Tree',NULL,'Marvel Comics',NULL,NULL),(25,'Rocket Raccoon','good','Male','brown','Animal','Brown','Marvel Comics',25,122),(26,'Drax the Destroyer','good','Male','red','Human / Altered','No Hair','Marvel Comics',306,193),(27,'Professor X','good','Male','blue','Human','Brown','Marvel Comics',86,186),(28,'Iceman','good','Male','brown','Human','Blond','Marvel Comics',55,165);
/*!40000 ALTER TABLE `marvel_character_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marvel_movies`
--

DROP TABLE IF EXISTS `marvel_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marvel_movies` (
  `movie_ID` int NOT NULL,
  `hero_ID` int DEFAULT NULL,
  `character` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `original_title` varchar(255) DEFAULT NULL,
  `rate` varchar(255) DEFAULT NULL,
  `meta_score` int DEFAULT NULL,
  `minutes` int DEFAULT NULL,
  `release` int DEFAULT NULL,
  `budget` int DEFAULT NULL,
  `opening_weekend_usa` int DEFAULT NULL,
  `gross_usa` int DEFAULT NULL,
  `gross_worldwide` int DEFAULT NULL,
  PRIMARY KEY (`movie_ID`),
  KEY `marvel_dc_movies_movie_ID_index` (`movie_ID`),
  KEY `marvel_movies_hero_ID_index` (`hero_ID`),
  CONSTRAINT `marvel_movies_marvel_character_info_idexID_fk` FOREIGN KEY (`hero_ID`) REFERENCES `marvel_character_info` (`idexID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marvel_movies`
--

LOCK TABLES `marvel_movies` WRITE;
/*!40000 ALTER TABLE `marvel_movies` DISABLE KEYS */;
INSERT INTO `marvel_movies` VALUES (101,0,'Ant Man','Marvel','Ant-Man','7.3',64,117,2015,130,57,180,519),(102,0,'Ant Man','Marvel','Ant-Man and the Wasp','7.1',70,118,2018,162,75,216,622),(103,1,'Black Panther','Marvel','Black Panther','7.3',88,134,2018,200,202,700,1346),(104,2,'Black Widow','Marvel','Black Widow','6.7',67,134,2021,200,80,184,380),(105,3,'Captain America','Marvel','Captain America: The First Avenger','6.9',66,124,2011,140,65,176,370),(106,3,'Captain America','Marvel','Captain America: The Winter Soldier','7.7',70,136,2014,170,95,259,714),(107,3,'Captain America','Marvel','Captain America: Civil War','7.8',75,147,2016,250,179,408,1153),(108,4,'Captain Marvel','Marvel','Captain Marvel','6.9',64,123,2019,175,153,426,1128),(109,5,'Deadpool','Marvel','Deadpool','8',65,108,2016,58,132,363,783),(110,6,'Doctor Strange','Marvel','Doctor Strange','7.5',72,115,2016,165,85,232,677),(111,7,'Gamora',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(112,8,'Hawkeye',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(113,9,'Hulk','Marvel','The Incredible Hulk','6.7',61,112,2008,150,55,134,263),(114,10,'Iron Man','Marvel','Iron Man','7.9',79,126,2008,140,98,318,585),(115,10,'Iron Man','Marvel','Iron Man Two','7',57,124,2010,200,128,312,623),(116,10,'Iron Man','Marvel','Iron Man Three','7.2',62,130,2013,200,174,409,1214),(117,11,'Loki','Marvel','Thor:Ragnarok','7.9',74,130,2017,180,122,315,853),(118,12,'Spider Man','Marvel','Spider-Man: Homecoming','7.4',73,133,2017,175,117,334,880),(119,12,'Spider Man','Marvel','Spider-Man: Far from Home','7.6',69,129,2019,160,92,390,1131),(120,14,'Thor','Marvel','Thor: The Dark World','6.9',54,112,2013,170,85,206,644),(121,14,'Thor','Marvel','Thor:Ragnarok','7.9',74,130,2017,180,122,315,853),(122,15,'Valkyrie','Marvel','Thor:Ragnarok','7.9',74,130,2017,180,122,315,853),(123,16,'Venom','Marvel','Venom','8.1',6,140,2018,110,80,213,856),(124,17,'Vision',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(125,18,'Wasp','Marvel','Ant-Man and the Wasp','7.1',70,118,2018,162,75,216,622),(126,19,'Wolverine','Marvel','The Wolverine','6.7',61,126,2013,120,53,133,415),(127,20,'Winter Soldier','Marvel','Captain America: The Winter Soldier','7.7',70,136,2014,170,95,259,714),(128,21,'War Machine','Marvel','Iron Man','7.9',79,126,2008,140,98,318,585),(129,22,'Shang Chi','Marvel','Shang-Chi and the Legend of the Ten Rings','7.6',71,132,2021,NULL,75,224,432),(130,23,'Star Lord',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(131,24,'Groot',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(132,25,'Rocket Raccoon',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(133,26,'Drax the Destroyer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(134,27,'Professor X','Marvel','X-Men','7.5',88,104,2000,75,55,24,6000),(135,28,'Iceman',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `marvel_movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `superheroes_power_matrix`
--

DROP TABLE IF EXISTS `superheroes_power_matrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `superheroes_power_matrix` (
  `ID` int NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Agility` varchar(255) DEFAULT NULL,
  `Accelerated Healing` varchar(255) DEFAULT NULL,
  `Lantern Power Ring` varchar(255) DEFAULT NULL,
  `Dimensional Awareness` varchar(255) DEFAULT NULL,
  `Cold Resistance` varchar(255) DEFAULT NULL,
  `Durability` varchar(255) DEFAULT NULL,
  `Stealth` varchar(255) DEFAULT NULL,
  `Energy Absorption` varchar(255) DEFAULT NULL,
  `Flight` varchar(255) DEFAULT NULL,
  `Danger Sense` varchar(255) DEFAULT NULL,
  `Underwater breathing` varchar(255) DEFAULT NULL,
  `Marksmanship` varchar(255) DEFAULT NULL,
  `Weapons Master` varchar(255) DEFAULT NULL,
  `Power Augmentation` varchar(255) DEFAULT NULL,
  `Animal Attributes` varchar(255) DEFAULT NULL,
  `Longevity` varchar(255) DEFAULT NULL,
  `Intelligence` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `superheroes_power_matrix_ID_index` (`ID`),
  CONSTRAINT `superheroes_power_matrix_marvel_character_info_idexID_fk` FOREIGN KEY (`ID`) REFERENCES `marvel_character_info` (`idexID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `superheroes_power_matrix`
--

LOCK TABLES `superheroes_power_matrix` WRITE;
/*!40000 ALTER TABLE `superheroes_power_matrix` DISABLE KEYS */;
INSERT INTO `superheroes_power_matrix` VALUES (0,'Ant Man','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','TRUE'),(1,'Black Panther','TRUE','FALSE','FALSE','FALSE','FALSE','FALSE','TRUE','FALSE','FALSE','FALSE','FALSE','TRUE','TRUE','FALSE','FALSE','FALSE','FALSE'),(2,'Black Widow','TRUE','FALSE','FALSE','FALSE','FALSE','FALSE','TRUE','FALSE','FALSE','FALSE','FALSE','TRUE','TRUE','FALSE','FALSE','TRUE','TRUE'),(3,'Captain America','TRUE','FALSE','FALSE','FALSE','FALSE','TRUE','TRUE','FALSE','FALSE','FALSE','FALSE','TRUE','TRUE','FALSE','FALSE','TRUE','FALSE'),(4,'Captain Marvel','TRUE','TRUE','FALSE','FALSE','TRUE','TRUE','FALSE','TRUE','TRUE','TRUE','FALSE','TRUE','FALSE','FALSE','FALSE','TRUE','TRUE'),(5,'Deadpool','TRUE','TRUE','FALSE','TRUE','FALSE','FALSE','TRUE','FALSE','FALSE','FALSE','FALSE','TRUE','TRUE','FALSE','FALSE','TRUE','FALSE'),(6,'Doctor Strange','FALSE','FALSE','FALSE','TRUE','FALSE','FALSE','FALSE','FALSE','TRUE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','TRUE','FALSE'),(7,'Gamora','TRUE','TRUE','FALSE','FALSE','FALSE','TRUE','TRUE','FALSE','FALSE','FALSE','FALSE','TRUE','TRUE','FALSE','FALSE','FALSE','TRUE'),(8,'Hawkeye','TRUE','FALSE','FALSE','FALSE','FALSE','FALSE','TRUE','FALSE','FALSE','FALSE','FALSE','TRUE','TRUE','FALSE','FALSE','FALSE','FALSE'),(9,'Hulk','TRUE','TRUE','FALSE','FALSE','TRUE','TRUE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','TRUE','FALSE'),(10,'Iron Man','FALSE','TRUE','FALSE','FALSE','FALSE','TRUE','FALSE','TRUE','TRUE','FALSE','TRUE','TRUE','FALSE','FALSE','FALSE','FALSE','FALSE'),(11,'Loki','FALSE','TRUE','FALSE','FALSE','FALSE','TRUE','FALSE','FALSE','TRUE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','TRUE','TRUE'),(12,'Spider Man','TRUE','TRUE','FALSE','FALSE','FALSE','TRUE','TRUE','FALSE','FALSE','TRUE','FALSE','TRUE','FALSE','FALSE','TRUE','FALSE','FALSE'),(13,'Thanos','TRUE','TRUE','FALSE','FALSE','TRUE','TRUE','FALSE','FALSE','TRUE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','TRUE','TRUE'),(14,'Thor','TRUE','TRUE','FALSE','FALSE','FALSE','TRUE','FALSE','FALSE','TRUE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','TRUE','FALSE'),(15,'Valkyrie','FALSE','FALSE','FALSE','FALSE','FALSE','TRUE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE'),(16,'Venom','FALSE','TRUE','FALSE','FALSE','FALSE','TRUE','FALSE','FALSE','FALSE','TRUE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE'),(17,'Vision','FALSE','FALSE','FALSE','FALSE','FALSE','TRUE','TRUE','TRUE','TRUE','FALSE','FALSE','TRUE','FALSE','FALSE','FALSE','FALSE','TRUE'),(18,'Wasp','TRUE','FALSE','FALSE','FALSE','FALSE','FALSE','TRUE','FALSE','TRUE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','TRUE'),(19,'Wolverine','TRUE','TRUE','FALSE','FALSE','TRUE','TRUE','TRUE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','TRUE','FALSE'),(20,'Winter Soldier','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','TRUE','FALSE','FALSE','FALSE','TRUE','FALSE'),(21,'War Machine','FALSE','FALSE','FALSE','FALSE','FALSE','TRUE','FALSE','TRUE','TRUE','FALSE','TRUE','TRUE','FALSE','FALSE','FALSE','FALSE','FALSE'),(22,'Shang Chi','TRUE','FALSE','FALSE','FALSE','FALSE','TRUE','TRUE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE'),(23,'Star Lord','TRUE','FALSE','FALSE','FALSE','FALSE','TRUE','FALSE','FALSE','FALSE','FALSE','FALSE','TRUE','TRUE','FALSE','FALSE','TRUE','TRUE'),(24,'Groot','FALSE','FALSE','FALSE','FALSE','FALSE','TRUE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','TRUE','TRUE'),(25,'Rocket Raccoon','TRUE','FALSE','FALSE','FALSE','TRUE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','TRUE','TRUE','FALSE','TRUE','FALSE','FALSE'),(26,'Drax the Destroyer','TRUE','TRUE','FALSE','FALSE','TRUE','TRUE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','TRUE','FALSE','FALSE','FALSE','FALSE'),(27,'Professor X','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','FALSE','TRUE'),(28,'Iceman','TRUE','TRUE','FALSE','FALSE','TRUE','TRUE','FALSE','FALSE','FALSE','FALSE','FALSE','TRUE','FALSE','FALSE','FALSE','FALSE','FALSE');
/*!40000 ALTER TABLE `superheroes_power_matrix` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-06  4:57:43
