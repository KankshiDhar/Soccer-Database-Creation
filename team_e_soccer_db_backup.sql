CREATE DATABASE  IF NOT EXISTS `team_e_soccer_db` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `team_e_soccer_db`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: team_e_soccer_db
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `awards`
--

DROP TABLE IF EXISTS `awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awards` (
  `AwardId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `AwardName` varchar(45) NOT NULL,
  PRIMARY KEY (`AwardId`),
  UNIQUE KEY `AwardId_UNIQUE` (`AwardId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awards`
--

LOCK TABLES `awards` WRITE;
/*!40000 ALTER TABLE `awards` DISABLE KEYS */;
INSERT INTO `awards` VALUES (1,'Ballon d\'Or'),(2,'Best FIFA Men\'s Player'),(3,'Best FIFA Women\'s Player'),(4,'Best FIFA Men\'s Goalkeeper'),(5,'Best FIFA Women\'s Goalkeeper');
/*!40000 ALTER TABLE `awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awardshistory`
--

DROP TABLE IF EXISTS `awardshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awardshistory` (
  `AwardId` int(10) unsigned NOT NULL,
  `PlayerId` int(10) unsigned NOT NULL,
  `AwardYear` year(4) NOT NULL,
  PRIMARY KEY (`AwardId`,`PlayerId`,`AwardYear`),
  KEY `fk_AwardsHistory_Players1_idx` (`PlayerId`),
  CONSTRAINT `fk_AwardsHistory_Awards1` FOREIGN KEY (`AwardId`) REFERENCES `awards` (`AwardId`),
  CONSTRAINT `fk_AwardsHistory_Players1` FOREIGN KEY (`PlayerId`) REFERENCES `players` (`PlayerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awardshistory`
--

LOCK TABLES `awardshistory` WRITE;
/*!40000 ALTER TABLE `awardshistory` DISABLE KEYS */;
INSERT INTO `awardshistory` VALUES (1,1,2017),(2,1,2016),(2,1,2017),(1,2,2019),(2,2,2019),(4,12,2018),(1,16,2018),(2,16,2018),(4,16,2019),(4,17,2017),(5,18,2019),(3,19,2019),(3,20,2018);
/*!40000 ALTER TABLE `awardshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `awardspresented`
--

DROP TABLE IF EXISTS `awardspresented`;
/*!50001 DROP VIEW IF EXISTS `awardspresented`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `awardspresented` AS SELECT 
 1 AS `Player Name`,
 1 AS `Award`,
 1 AS `Year`,
 1 AS `Nationality`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `clubs`
--

DROP TABLE IF EXISTS `clubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clubs` (
  `ClubId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ClubName` varchar(45) NOT NULL,
  `ClubCity` varchar(45) DEFAULT NULL,
  `ClubCountryID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ClubId`),
  UNIQUE KEY `ClubId_UNIQUE` (`ClubId`),
  KEY `fk_Clubs_NationalTeams1_idx` (`ClubCountryID`),
  CONSTRAINT `fk_Clubs_NationalTeams1` FOREIGN KEY (`ClubCountryID`) REFERENCES `nationalteams` (`NationalTeamId`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clubs`
--

LOCK TABLES `clubs` WRITE;
/*!40000 ALTER TABLE `clubs` DISABLE KEYS */;
INSERT INTO `clubs` VALUES (1,'Liverpool','Liverpool',2),(2,'Manchester City','Manchester',2),(3,'Manchester United','Manchester',2),(4,'Tottenham Hotspur','Tottenham',2),(5,'Bayern Munich','Munich',20),(6,'Dortmund Borussia','Dortmund',20),(7,'Paris Saint-Germain','Paris',10),(8,'Marseille','Marseille',10),(9,'Real Madrid','Madrid',11),(10,'FC Barcelona','Barcelona',11),(11,'Atletico Madrid','Madrid',11),(12,'Juventus','Turin',9),(13,'AC Milan','Milan',9),(14,'AFC Ajax','Amsterdam',21),(15,'Arsenal','London',2),(16,'LA Galaxy','Los Angeles',16),(17,'Galatasaray','Istanbul',26),(19,'Chelsea','London',2),(20,'KRC Genk','Genk',25),(21,'Inter Milan','Milan',9),(22,'Leicester City','Leicester',2),(23,'Everton','Liverpool',2),(24,'Reign FC','Seattle',16),(25,'Orlando Pride','Orlando',19);
/*!40000 ALTER TABLE `clubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clubs_in_leagues`
--

DROP TABLE IF EXISTS `clubs_in_leagues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clubs_in_leagues` (
  `ClubId` int(10) unsigned NOT NULL,
  `LeagueId` int(10) unsigned NOT NULL,
  `SeasonStartYear` year(4) NOT NULL,
  PRIMARY KEY (`ClubId`,`LeagueId`,`SeasonStartYear`),
  KEY `fk_Clubs_has_Leagues_Leagues1_idx` (`LeagueId`),
  KEY `fk_Clubs_has_Leagues_Clubs1_idx` (`ClubId`),
  CONSTRAINT `fk_Clubs_has_Leagues_Clubs1` FOREIGN KEY (`ClubId`) REFERENCES `clubs` (`ClubId`),
  CONSTRAINT `fk_Clubs_has_Leagues_Leagues1` FOREIGN KEY (`LeagueId`) REFERENCES `leagues` (`LeagueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clubs_in_leagues`
--

LOCK TABLES `clubs_in_leagues` WRITE;
/*!40000 ALTER TABLE `clubs_in_leagues` DISABLE KEYS */;
INSERT INTO `clubs_in_leagues` VALUES (1,1,2018),(1,1,2019),(2,1,2018),(2,1,2019),(3,1,2018),(3,1,2019),(4,1,2018),(4,1,2019),(15,1,2018),(15,1,2019),(19,1,2018),(9,2,2018),(9,2,2019),(10,2,2018),(10,2,2019),(11,2,2018),(11,2,2019),(5,3,2018),(5,3,2019),(6,3,2018),(6,3,2019),(7,4,2018),(7,4,2019),(8,4,2018),(8,4,2019),(12,5,2018),(12,5,2019),(13,5,2018),(13,5,2019),(16,7,2018),(14,9,2018),(14,9,2019),(1,10,2018),(1,10,2019),(2,10,2018),(2,10,2019),(3,10,2018),(4,10,2018),(4,10,2019),(5,10,2018),(5,10,2019),(6,10,2018),(6,10,2019),(7,10,2018),(7,10,2019),(8,10,2019),(9,10,2018),(9,10,2019),(10,10,2018),(10,10,2019),(11,10,2019),(12,10,2019),(13,10,2019),(14,10,2019),(19,10,2018),(3,11,2019),(15,11,2019),(17,12,2018),(17,12,2019),(24,13,2018),(24,13,2019),(25,13,2018),(25,13,2019);
/*!40000 ALTER TABLE `clubs_in_leagues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `clubsinleagues`
--

DROP TABLE IF EXISTS `clubsinleagues`;
/*!50001 DROP VIEW IF EXISTS `clubsinleagues`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `clubsinleagues` AS SELECT 
 1 AS `Club Name`,
 1 AS `Location`,
 1 AS `League`,
 1 AS `Season Start Year`,
 1 AS `Season End Year`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `continents`
--

DROP TABLE IF EXISTS `continents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `continents` (
  `ContinentName` varchar(20) NOT NULL,
  PRIMARY KEY (`ContinentName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `continents`
--

LOCK TABLES `continents` WRITE;
/*!40000 ALTER TABLE `continents` DISABLE KEYS */;
INSERT INTO `continents` VALUES ('Africa'),('Antartica'),('Asia'),('Australia'),('Europe'),('North America'),('South America');
/*!40000 ALTER TABLE `continents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `europeleagueclubs`
--

DROP TABLE IF EXISTS `europeleagueclubs`;
/*!50001 DROP VIEW IF EXISTS `europeleagueclubs`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `europeleagueclubs` AS SELECT 
 1 AS `Club Name`,
 1 AS `Location`,
 1 AS `League`,
 1 AS `Season Start Year`,
 1 AS `Season End Year`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `goaldifference`
--

DROP TABLE IF EXISTS `goaldifference`;
/*!50001 DROP VIEW IF EXISTS `goaldifference`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `goaldifference` AS SELECT 
 1 AS `ClubId`,
 1 AS `Club Name`,
 1 AS `Goal Difference`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `leagues`
--

DROP TABLE IF EXISTS `leagues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leagues` (
  `LeagueId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `LeagueName` varchar(45) NOT NULL,
  `ContinentName` varchar(20) NOT NULL,
  PRIMARY KEY (`LeagueId`),
  UNIQUE KEY `LeagueId_UNIQUE` (`LeagueId`),
  KEY `fk_Leagues_Continents1_idx` (`ContinentName`),
  CONSTRAINT `fk_Leagues_Continents1` FOREIGN KEY (`ContinentName`) REFERENCES `continents` (`ContinentName`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leagues`
--

LOCK TABLES `leagues` WRITE;
/*!40000 ALTER TABLE `leagues` DISABLE KEYS */;
INSERT INTO `leagues` VALUES (1,'English Premier League','Europe'),(2,'La Liga','Europe'),(3,'Bundesliga','Europe'),(4,'Ligue 1','Europe'),(5,'Serie A','Europe'),(6,'Superliga Argentina','South America'),(7,'Major League Soccer','North America'),(8,'J1 League','Asia'),(9,'Eredivisie','Europe'),(10,'UEFA Champions League','Europe'),(11,'UEFA Europa League','Europe'),(12,'Super Lig','Europe'),(13,'National Women\'s Soccer League','North America');
/*!40000 ALTER TABLE `leagues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchstats`
--

DROP TABLE IF EXISTS `matchstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matchstats` (
  `MatchId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `HomeTeamId` int(10) unsigned NOT NULL,
  `AwayTeamId` int(10) unsigned NOT NULL,
  `DateOfMatch` date NOT NULL,
  `Winner` int(10) DEFAULT NULL,
  `HomeGoals` tinyint(4) NOT NULL,
  `AwayGoals` tinyint(4) NOT NULL,
  PRIMARY KEY (`MatchId`),
  UNIQUE KEY `MatchId_UNIQUE` (`MatchId`),
  KEY `fk_MatchStats_Clubs1_idx` (`HomeTeamId`),
  KEY `fk_MatchStats_Clubs2_idx` (`AwayTeamId`),
  CONSTRAINT `fk_MatchStats_Clubs1` FOREIGN KEY (`HomeTeamId`) REFERENCES `clubs` (`ClubId`),
  CONSTRAINT `fk_MatchStats_Clubs2` FOREIGN KEY (`AwayTeamId`) REFERENCES `clubs` (`ClubId`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchstats`
--

LOCK TABLES `matchstats` WRITE;
/*!40000 ALTER TABLE `matchstats` DISABLE KEYS */;
INSERT INTO `matchstats` VALUES (1,1,12,'2019-11-10',1,3,1),(2,1,4,'2019-10-27',1,3,1),(3,9,7,'2019-11-26',NULL,3,3),(4,21,7,'2019-10-08',21,4,2),(5,7,4,'2018-08-12',7,3,2),(6,8,2,'2018-01-18',2,3,4),(7,21,13,'2019-03-06',13,5,4),(8,12,21,'2019-10-12',21,3,4),(9,8,3,'2018-06-13',8,3,2),(10,9,12,'2018-04-14',8,3,2),(11,3,14,'2018-07-15',14,6,4),(12,2,15,'2019-08-16',NULL,3,3),(13,3,11,'2019-11-17',3,3,2),(14,20,6,'2018-12-18',6,3,4),(15,11,3,'2018-10-19',11,3,2),(16,13,1,'2018-11-20',1,3,4),(17,2,19,'2019-10-21',NULL,3,3),(18,5,24,'2018-10-22',5,7,2),(19,8,18,'2019-10-23',8,3,2),(20,10,9,'2018-10-24',9,3,4),(21,10,9,'2018-10-24',9,3,4),(22,7,2,'2019-10-25',2,3,4),(23,8,10,'2019-10-26',8,3,2),(24,12,1,'2018-10-27',12,3,2),(25,14,6,'2018-10-28',6,3,4),(26,17,8,'2018-01-29',8,3,4),(27,18,9,'2019-03-30',9,3,4),(28,19,12,'2018-04-12',12,3,4),(29,1,23,'2018-06-01',1,3,2),(30,5,24,'2019-11-02',NULL,3,3),(31,7,1,'2018-11-03',NULL,3,3),(32,9,8,'2018-11-04',8,3,4),(33,21,13,'2018-11-05',21,3,2),(34,16,11,'2019-11-06',11,3,4),(35,1,9,'2018-11-07',1,4,2),(36,1,7,'2019-11-08',1,3,2),(37,3,4,'2018-11-09',4,3,4),(38,2,5,'2018-11-10',2,3,2),(39,8,12,'2018-11-11',8,3,2),(40,6,1,'2019-11-12',1,3,4);
/*!40000 ALTER TABLE `matchstats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nationalteams`
--

DROP TABLE IF EXISTS `nationalteams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nationalteams` (
  `NationalTeamId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CountryName` varchar(45) NOT NULL,
  `ContinentName` varchar(20) NOT NULL,
  PRIMARY KEY (`NationalTeamId`),
  UNIQUE KEY `NationalTeamId_UNIQUE` (`NationalTeamId`),
  KEY `fk_NationalTeams_Continents_idx` (`ContinentName`),
  CONSTRAINT `fk_NationalTeams_Continents` FOREIGN KEY (`ContinentName`) REFERENCES `continents` (`ContinentName`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nationalteams`
--

LOCK TABLES `nationalteams` WRITE;
/*!40000 ALTER TABLE `nationalteams` DISABLE KEYS */;
INSERT INTO `nationalteams` VALUES (1,'Argentina','South America'),(2,'England','Europe'),(3,'Portugal','Europe'),(4,'Japan','Asia'),(5,'India','Asia'),(6,'South Africa','Africa'),(7,'Egypt','Africa'),(8,'Sweden','Europe'),(9,'Italy','Europe'),(10,'France','Europe'),(11,'Spain','Europe'),(12,'China','Asia'),(13,'Australia','Australia'),(14,'New Zealand','Australia'),(15,'Chile','South America'),(16,'USA','North America'),(17,'Mexico','North America'),(18,'Uruguay','South America'),(19,'Brazil','South America'),(20,'Germany','Europe'),(21,'Netherlands','Europe'),(22,'Senegal','Africa'),(23,'Poland','Europe'),(24,'Wales','Europe'),(25,'Belgium','Europe'),(26,'Croatia','Europe');
/*!40000 ALTER TABLE `nationalteams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `overallranking`
--

DROP TABLE IF EXISTS `overallranking`;
/*!50001 DROP VIEW IF EXISTS `overallranking`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `overallranking` AS SELECT 
 1 AS `ClubId`,
 1 AS `Club Name`,
 1 AS `Total Wins`,
 1 AS `Goal Difference`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `PlayerId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PlayerFirstName` varchar(45) DEFAULT NULL,
  `PlayerLastName` varchar(45) NOT NULL,
  `BirthYear` year(4) DEFAULT NULL,
  `NationalTeamId` int(10) unsigned NOT NULL,
  `ClubId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`PlayerId`),
  KEY `fk_Players_NationalTeams1_idx` (`NationalTeamId`),
  KEY `fk_Players_Clubs1_idx` (`ClubId`),
  CONSTRAINT `fk_Players_Clubs1` FOREIGN KEY (`ClubId`) REFERENCES `clubs` (`ClubId`),
  CONSTRAINT `fk_Players_NationalTeams1` FOREIGN KEY (`NationalTeamId`) REFERENCES `nationalteams` (`NationalTeamId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'Cristiano','Ronaldo',1985,3,12),(2,'Lionel','Messi',1987,1,10),(3,'Virgil','van Dijk',1991,21,1),(4,'Mohamed','Salah',1992,7,1),(5,'Sadio','Mane',1992,22,1),(6,'Harry','Kane',1993,2,4),(7,'Zlatan','Ibrahimovic',1981,8,7),(8,'Manuel','Neuer',1986,20,5),(9,'Eden','Hazard',1991,25,9),(10,'Robert','Lewandowski',1988,23,5),(11,'Gareth','Bale',1989,24,9),(12,'Thibaut','Courtois',1992,25,9),(13,'Vincent','Kompany',1986,25,2),(14,'Mesut','Ozil',1988,20,15),(15,'Hugo','Lloris',1986,10,4),(16,'Luka','Modric',1985,26,9),(17,'Gialuigi','Buffon',1978,9,12),(18,'Sari','van Veenendaal',1990,21,11),(19,'Megan','Rapinoe',1985,16,24),(20,'Marta','da Silva',1986,19,25);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerstats`
--

DROP TABLE IF EXISTS `playerstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playerstats` (
  `PlayerId` int(10) unsigned NOT NULL,
  `Height` int(10) unsigned NOT NULL,
  `Attack` int(10) unsigned NOT NULL,
  `Defense` int(10) unsigned NOT NULL,
  `Midfield` int(10) unsigned NOT NULL,
  PRIMARY KEY (`PlayerId`),
  CONSTRAINT `fk_PlayerStats_Players1` FOREIGN KEY (`PlayerId`) REFERENCES `players` (`PlayerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerstats`
--

LOCK TABLES `playerstats` WRITE;
/*!40000 ALTER TABLE `playerstats` DISABLE KEYS */;
INSERT INTO `playerstats` VALUES (1,187,437,84,354),(2,170,433,96,351),(3,198,314,268,345),(4,177,391,122,375),(5,177,398,122,354),(6,187,421,130,380),(7,195,404,89,368),(8,193,119,38,188),(9,177,398,83,359),(10,182,407,95,374),(11,185,420,161,364),(12,198,86,54,122),(13,185,308,251,328),(14,180,375,59,306),(15,187,94,57,138),(16,187,99,109,200),(17,189,56,87,176),(18,168,279,70,270),(19,171,301,65,289),(20,164,286,77,310);
/*!40000 ALTER TABLE `playerstats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `topdefenders`
--

DROP TABLE IF EXISTS `topdefenders`;
/*!50001 DROP VIEW IF EXISTS `topdefenders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `topdefenders` AS SELECT 
 1 AS `Player Name`,
 1 AS `Current Club`,
 1 AS `Nationality`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `topstrikers`
--

DROP TABLE IF EXISTS `topstrikers`;
/*!50001 DROP VIEW IF EXISTS `topstrikers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `topstrikers` AS SELECT 
 1 AS `Player Name`,
 1 AS `Current Club`,
 1 AS `Nationality`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `totalwinsoverall`
--

DROP TABLE IF EXISTS `totalwinsoverall`;
/*!50001 DROP VIEW IF EXISTS `totalwinsoverall`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `totalwinsoverall` AS SELECT 
 1 AS `ClubId`,
 1 AS `Club Name`,
 1 AS `Total Wins`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `totalwinsthisyear`
--

DROP TABLE IF EXISTS `totalwinsthisyear`;
/*!50001 DROP VIEW IF EXISTS `totalwinsthisyear`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `totalwinsthisyear` AS SELECT 
 1 AS `ClubId`,
 1 AS `Club Name`,
 1 AS `Total Wins`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `awardspresented`
--

/*!50001 DROP VIEW IF EXISTS `awardspresented`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `awardspresented` AS select concat(`players`.`PlayerFirstName`,' ',`players`.`PlayerLastName`) AS `Player Name`,`awards`.`AwardName` AS `Award`,`awardshistory`.`AwardYear` AS `Year`,`nationalteams`.`CountryName` AS `Nationality` from (((`players` join `awardshistory` on((`players`.`PlayerId` = `awardshistory`.`PlayerId`))) join `awards` on((`awardshistory`.`AwardId` = `awards`.`AwardId`))) join `nationalteams` on((`players`.`NationalTeamId` = `nationalteams`.`NationalTeamId`))) order by `awards`.`AwardName` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `clubsinleagues`
--

/*!50001 DROP VIEW IF EXISTS `clubsinleagues`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `clubsinleagues` AS select `clubs`.`ClubName` AS `Club Name`,concat(`clubs`.`ClubCity`,', ',`nationalteams`.`CountryName`) AS `Location`,`leagues`.`LeagueName` AS `League`,`clubs_in_leagues`.`SeasonStartYear` AS `Season Start Year`,(`clubs_in_leagues`.`SeasonStartYear` + 1) AS `Season End Year` from (((`clubs` join `clubs_in_leagues` on((`clubs`.`ClubId` = `clubs_in_leagues`.`ClubId`))) left join `leagues` on((`clubs_in_leagues`.`LeagueId` = `leagues`.`LeagueId`))) left join `nationalteams` on((`clubs`.`ClubCountryID` = `nationalteams`.`NationalTeamId`))) order by `clubs_in_leagues`.`SeasonStartYear` desc,`leagues`.`LeagueName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `europeleagueclubs`
--

/*!50001 DROP VIEW IF EXISTS `europeleagueclubs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `europeleagueclubs` AS select `clubs`.`ClubName` AS `Club Name`,concat(`clubs`.`ClubCity`,', ',`nationalteams`.`CountryName`) AS `Location`,`leagues`.`LeagueName` AS `League`,`clubs_in_leagues`.`SeasonStartYear` AS `Season Start Year`,(`clubs_in_leagues`.`SeasonStartYear` + 1) AS `Season End Year` from (((`clubs` join `clubs_in_leagues` on((`clubs`.`ClubId` = `clubs_in_leagues`.`ClubId`))) left join `leagues` on((`clubs_in_leagues`.`LeagueId` = `leagues`.`LeagueId`))) left join `nationalteams` on((`clubs`.`ClubCountryID` = `nationalteams`.`NationalTeamId`))) where (`leagues`.`ContinentName` = 'Europe') order by `clubs_in_leagues`.`SeasonStartYear` desc,`leagues`.`LeagueName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `goaldifference`
--

/*!50001 DROP VIEW IF EXISTS `goaldifference`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `goaldifference` AS select `gdtable`.`ClubId` AS `ClubId`,`clubs`.`ClubName` AS `Club Name`,sum(`gdtable`.`GD`) AS `Goal Difference` from ((select `clubs`.`ClubId` AS `ClubId`,sum((`matchstats`.`AwayGoals` - `matchstats`.`HomeGoals`)) AS `GD` from (`clubs` join `matchstats` on((`clubs`.`ClubId` = `matchstats`.`AwayTeamId`))) group by `clubs`.`ClubId` union select `clubs`.`ClubId` AS `ClubId`,sum((`matchstats`.`HomeGoals` - `matchstats`.`AwayGoals`)) AS `GD` from (`clubs` join `matchstats` on((`clubs`.`ClubId` = `matchstats`.`HomeTeamId`))) group by `clubs`.`ClubId` order by `ClubId`) `gdtable` join `clubs` on((`gdtable`.`ClubId` = `clubs`.`ClubId`))) group by `gdtable`.`ClubId` order by sum(`gdtable`.`GD`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `overallranking`
--

/*!50001 DROP VIEW IF EXISTS `overallranking`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `overallranking` AS select `goaldifference`.`ClubId` AS `ClubId`,`goaldifference`.`Club Name` AS `Club Name`,`totalwinsoverall`.`Total Wins` AS `Total Wins`,`goaldifference`.`Goal Difference` AS `Goal Difference` from (`goaldifference` left join `totalwinsoverall` on((`totalwinsoverall`.`ClubId` = `goaldifference`.`ClubId`))) order by `totalwinsoverall`.`Total Wins` desc,`goaldifference`.`Goal Difference` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `topdefenders`
--

/*!50001 DROP VIEW IF EXISTS `topdefenders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `topdefenders` AS select concat(`players`.`PlayerFirstName`,' ',`players`.`PlayerLastName`) AS `Player Name`,`clubs`.`ClubName` AS `Current Club`,`players`.`NationalTeamId` AS `Nationality` from ((`players` left join `clubs` on((`players`.`ClubId` = `clubs`.`ClubId`))) join `playerstats` on((`players`.`PlayerId` = `playerstats`.`PlayerId`))) where (`playerstats`.`Defense` > 150) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `topstrikers`
--

/*!50001 DROP VIEW IF EXISTS `topstrikers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `topstrikers` AS select concat(`players`.`PlayerFirstName`,' ',`players`.`PlayerLastName`) AS `Player Name`,`clubs`.`ClubName` AS `Current Club`,`players`.`NationalTeamId` AS `Nationality` from ((`players` left join `clubs` on((`players`.`ClubId` = `clubs`.`ClubId`))) join `playerstats` on((`players`.`PlayerId` = `playerstats`.`PlayerId`))) where (`playerstats`.`Attack` > 350) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `totalwinsoverall`
--

/*!50001 DROP VIEW IF EXISTS `totalwinsoverall`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `totalwinsoverall` AS select `clubs`.`ClubId` AS `ClubId`,`clubs`.`ClubName` AS `Club Name`,count(`matchstats`.`Winner`) AS `Total Wins` from (`clubs` join `matchstats` on((`clubs`.`ClubId` = `matchstats`.`Winner`))) group by `clubs`.`ClubId` order by count(`matchstats`.`Winner`) desc,`clubs`.`ClubName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `totalwinsthisyear`
--

/*!50001 DROP VIEW IF EXISTS `totalwinsthisyear`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `totalwinsthisyear` AS select `clubs`.`ClubId` AS `ClubId`,`clubs`.`ClubName` AS `Club Name`,count(`matchstats`.`Winner`) AS `Total Wins` from (`clubs` join `matchstats` on((`clubs`.`ClubId` = `matchstats`.`Winner`))) where ((year(`matchstats`.`DateOfMatch`) = year(now())) or (year(`matchstats`.`DateOfMatch`) = (year(now()) + 1))) group by `clubs`.`ClubId` order by count(`matchstats`.`Winner`) desc,`clubs`.`ClubName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-10  1:23:17
