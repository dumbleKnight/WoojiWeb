-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: wjweb
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

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
-- Table structure for table `accounts_customuser`
--

DROP TABLE IF EXISTS `accounts_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_customuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `head_pic` varchar(100) NOT NULL,
  `bio` longtext NOT NULL,
  `is_premium` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser`
--

LOCK TABLES `accounts_customuser` WRITE;
/*!40000 ALTER TABLE `accounts_customuser` DISABLE KEYS */;
INSERT INTO `accounts_customuser` VALUES (1,'pbkdf2_sha256$150000$Bn9I9Ic2WcLh$930LImrlauDOmSjZ9v7Rb2qUE19SrQVk2f16/EINbQo=','2020-01-06 17:41:21.315371',1,'wooji','WoojiCap','','info@woojicap.com',1,1,'2019-12-03 02:24:35.000000','user_head_pic/wooji.jpg','Hi, I\'m from Wooji.',1),(2,'pbkdf2_sha256$150000$MMdAheAOAuwd$/NAEcwuwKu71/zd1MmvUAO0LKLeeonB/Ul1CXqmNIcw=','2020-01-06 17:45:53.566080',0,'oscar','Oscar','Yu','yhyoscar@gmail.com',1,1,'2019-12-03 02:58:36.000000','user_head_pic/Screen_Shot_2020-01-01_at_7.27.15_PM.png','Hi, I\'m oscar.',0),(4,'pbkdf2_sha256$150000$nR7iLp7R7whz$9wzuzkn/iL2Q/GONnUVYHHwQAf024u3O4B0SCDywuYg=','2019-12-08 14:36:00.000000',0,'bob','Bob','Robert','bob.meng@yahoo.com',0,1,'2019-12-08 14:34:52.000000','user_head_pic/default.jpg','',1),(5,'pbkdf2_sha256$150000$pCxIcHQLrcEW$wJ0INJyfqis0bpXFVQOMBFPRQFID6kIg3FBVL2OXedE=','2019-12-10 01:16:37.000000',1,'zmlzeze','','','moliang.zhou@woojicap.com',1,1,'2019-12-10 01:15:29.000000','user_head_pic/default.jpg','Hi, I\'m Moliang!',1),(7,'pbkdf2_sha256$150000$G4rCK9OfouYh$g8DjEN0LxpLZNUQsayRyvP2MWK9yK8Lz5VZvL+Fi05s=','2019-12-10 02:27:59.756152',0,'enlighter','','','quyaoxian@gmail.com',1,1,'2019-12-10 01:17:26.000000','user_head_pic/default.jpg','',0),(8,'pbkdf2_sha256$150000$dYJbIQENmuIS$A1Wxn/qfQbLCo7BEGiGyHvyZi4P7ffJWyGN0+SFjeG8=',NULL,0,'tianshi9421','','','tianshi.wang@wooji.com',0,0,'2019-12-10 02:29:59.000000','user_head_pic/default.jpg','',0),(9,'pbkdf2_sha256$150000$vg3FxrMMluNp$PhVZD/VFd4hIl19IeL72VEoUtQet+zDVVi+U79QGQUQ=','2019-12-24 01:18:11.648541',0,'tianshiw','','','tianshi.wang@woojicap.com',0,1,'2019-12-10 02:32:01.655888','user_head_pic/default.jpg','',0),(10,'pbkdf2_sha256$150000$nhpRbdvBe6Wy$x6OpIblI7SG53nrrRfQViKsYyyDAzU8VqlfUFvW+Uj4=','2019-12-21 01:09:44.403769',0,'MeowKun','Kecheng','Tao','tkc1364411045@gmail.com',0,1,'2019-12-21 01:08:11.827785','user_head_pic/il_570xN.1400672378_gcol.jpg','test',0),(11,'pbkdf2_sha256$150000$C50a4qPOIAx7$HEZicgfR1QaH7LmgXb2lKlMq44hN0LIvP6hoa6milac=','2019-12-28 15:10:51.000000',0,'Feng','','','Feng.Zhao.1@stonybrook.edu',0,1,'2019-12-21 01:09:30.000000','user_head_pic/Screen_Shot_2020-01-01_at_7.26.44_PM_tIDtD9E.png','',0),(12,'pbkdf2_sha256$150000$74HW3n8xBNsI$4PBnwOCBii/EMEpnhFTXlouLHu+mmPvnQEgE0QBSbVA=',NULL,0,'Fengzhao','','','1169826623a@gmail.com',0,0,'2019-12-21 01:13:40.000000','user_head_pic/Screen_Shot_2020-01-01_at_7.26.44_PM.png','',0),(13,'pbkdf2_sha256$150000$UJ5hp4YboWtr$CDg/v95wGjrY87lRIjY2DvBZIAaOzSjCXh8BRkSSU8Q=','2020-01-02 17:04:05.408759',0,'abcd','','','yqu1@alumni.nd.edu',0,1,'2020-01-02 17:02:59.777157','user_head_pic/default.jpg','',0),(14,'pbkdf2_sha256$150000$ixamivoHuQYw$rtOGauDhZTzYXleJumi4IIJOSlsZtfGMXRDpvzbyYfw=','2020-01-05 22:30:22.300388',0,'kwokq','','','guoqing@hotmail.com.hk',0,1,'2020-01-05 22:28:49.911341','user_head_pic/default.jpg','',0);
/*!40000 ALTER TABLE `accounts_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_customuser_groups`
--

DROP TABLE IF EXISTS `accounts_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_customuser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customuser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_customuser_groups_customuser_id_group_id_c074bdcb_uniq` (`customuser_id`,`group_id`),
  KEY `accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_customuser__customuser_id_bc55088e_fk_accounts_` FOREIGN KEY (`customuser_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser_groups`
--

LOCK TABLES `accounts_customuser_groups` WRITE;
/*!40000 ALTER TABLE `accounts_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_customuser_user_permissions`
--

DROP TABLE IF EXISTS `accounts_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_customuser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customuser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_customuser_user_customuser_id_permission_9632a709_uniq` (`customuser_id`,`permission_id`),
  KEY `accounts_customuser__permission_id_aea3d0e5_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_customuser__customuser_id_0deaefae_fk_accounts_` FOREIGN KEY (`customuser_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `accounts_customuser__permission_id_aea3d0e5_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser_user_permissions`
--

LOCK TABLES `accounts_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `accounts_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add stock data',6,'add_stockdata'),(22,'Can change stock data',6,'change_stockdata'),(23,'Can delete stock data',6,'delete_stockdata'),(24,'Can view stock data',6,'view_stockdata'),(25,'Can add stock profile',7,'add_stockprofile'),(26,'Can change stock profile',7,'change_stockprofile'),(27,'Can delete stock profile',7,'delete_stockprofile'),(28,'Can view stock profile',7,'view_stockprofile'),(29,'Can add stock universe',8,'add_stockuniverse'),(30,'Can change stock universe',8,'change_stockuniverse'),(31,'Can delete stock universe',8,'delete_stockuniverse'),(32,'Can view stock universe',8,'view_stockuniverse'),(33,'Can add treemap coordinate',9,'add_treemapcoordinate'),(34,'Can change treemap coordinate',9,'change_treemapcoordinate'),(35,'Can delete treemap coordinate',9,'delete_treemapcoordinate'),(36,'Can view treemap coordinate',9,'view_treemapcoordinate'),(53,'Can add user',14,'add_customuser'),(54,'Can change user',14,'change_customuser'),(55,'Can delete user',14,'delete_customuser'),(56,'Can view user',14,'view_customuser'),(73,'Can add blog',19,'add_blog'),(74,'Can change blog',19,'change_blog'),(75,'Can delete blog',19,'delete_blog'),(76,'Can view blog',19,'view_blog'),(77,'Can add Tag',20,'add_tag'),(78,'Can change Tag',20,'change_tag'),(79,'Can delete Tag',20,'delete_tag'),(80,'Can view Tag',20,'view_tag'),(81,'Can add comment',21,'add_comment'),(82,'Can change comment',21,'change_comment'),(83,'Can delete comment',21,'delete_comment'),(84,'Can view comment',21,'view_comment');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blog`
--

DROP TABLE IF EXISTS `blog_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `summary` longtext NOT NULL,
  `body` longtext NOT NULL,
  `pub_time` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `is_draft` tinyint(1) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blog`
--

LOCK TABLES `blog_blog` WRITE;
/*!40000 ALTER TABLE `blog_blog` DISABLE KEYS */;
INSERT INTO `blog_blog` VALUES (1,'The global rebound continued last week as US equity inched higher','The global rebound continued last week as US equity inched higher, treasury curves steepened, etc. The sentiment is still risky, ow risky assets such as equities(especially em). We still insist such trends will continue into Q1 next year but potentially with some volatility or small adjustments towards the year-end.','The global rebound continued last week as US equity inched higher, treasury curves steepened, etc. The sentiment is still risky, ow risky assets such as equities(especially em). We still insist such trends will continue into Q1 next year but potentially with some volatility or small adjustments towards the year-end.\r\n\r\nAside from the optimism, there are two areas worth pointing out that could be potential risks. One is the HK protest; the scale keeps escalating and has seriously impacted HK growth. Last week, the HK quartet GDP printed a negative return. As for opportunities, we believe investments will shift towards SGP and hence long $SGD. However, I wouldn’t advise shorting $HKD as HK has mainland to back its financial stability so the risk of shorting it is still large.\r\n\r\nThe other major longer-term factor is the debt market; either government debt or corporate debt has reached a massive level. I still believe the last cut from the Fed was a terrible mistake and it has stimulated the debt growth by introducing dovish fiscal policy when not needed. Surely we could all benefit from the short-term stimulation effect, but in case of any funding crisis, the debt bomb will blow up the economy as we’ve never seen before.\r\n\r\n![blog1](/media/editor/blog1_20191209203426388930.jpg \"blog1\")','2019-12-03 00:50:13.000000',1,0,NULL),(3,'U.S. stocks climbed to record highs last week','U.S. stocks climbed to record highs last week after the October jobs report showed more jobs than expected.','U.S. stocks climbed to record highs last week after the October jobs report showed more jobs than expected. The Federal Reserve cut interest rates for the third time this year and signaled there\'s still steam in the stock market engine. Although the third-quarter GDP estimate showed weakness last week (from 2.0% to 1.9%), many risks are mitigated for the remainder of the year. To name a few, the U.S./China trade tensions, uncertainty on the Brexit front, and weakness in manufacturing. Overall, Wooji is still confident in the U.S. economy, supported by a strong labor market, solid corporate earnings, and low interest rates.','2019-11-13 01:43:24.000000',4,0,NULL),(6,'Most of last week’s earnings beat market expectations','Most of last week’s earnings beat market expectations, with an average EPS return of 5% vs -3%.','<p>Most of last week&rsquo;s earnings beat market expectations, with an average EPS return of 5% vs -3%. The banks forecasted the growth would bottom in 3Q and start to stabilize in 4Q; we should see growth recovery in 1Q 2020 if the trend continues, with growth expectation to be 7% by then. The business cycle has recovered due to the de-escalation of the trade war. I feel there was a significant turn-around of market sentiment last week. By Monday evening, many equity markets globally have reached record highs. Additionally, historically speaking, during election year, the equities usually per Therefore, it was a good call in previous commentaries that we OW EM equities with last week&rsquo;s SHANGHAI index returning to around 1.7% beating SP500 of 1.3%. In the year-to-date performance, Russian equities outperformed all other asset classes, which is also as we suggested 2-3 months ago. With this new shift in sentiment, it&rsquo;s recommended to keep OW EM equities with the expectation that EM is going to outperform US; it&rsquo;s also suggested to long CAD over JPY for macro divergence. It also marks our closure to short AUD/JPY trade suggested previously. Additionally, as the trade war ebbs, long oil due to fundamentals improvement. To wrap up the economic data, Monday&rsquo;s flash PMI data also suggests global manufacturing recovery, but still shows weak growth and steep pullback of employment growth. This backs up above point that though momentum fades, macro is going to recover. Long base metal trading would also be recommended hence. What we need to pay attention next week is the Fed&rsquo;s movement. The market bets there is 25bps cut with high probability. I personally don&rsquo;t see a reason why Fed needs to cut again, given de-escalation of global slowdown risks and trade war risk. In case Fed is not cut, we might want to pre-position ahead of the Fed announcement for some VIX position (or at least close short VIX carry) in case Trump might attack Fed and use some counter measure (such as re-escalation of trade war) to force Fed cuts in the future.&nbsp;</p>\r\n\r\n<p><img alt=\"Image may contain: fire and outdoor\" src=\"https://scontent.fbos1-1.fna.fbcdn.net/v/t1.0-9/74236364_151115059608375_5915342565678252032_o.jpg?_nc_cat=103&amp;_nc_ohc=yhCrKFzNC-cAQkhd2IRsar-8lJIkGLKqI4hpdP-tl4dPgourwZ9nAfJjg&amp;_nc_ht=scontent.fbos1-1.fna&amp;oh=4b85f43e175ecccd995b3d58fdebd32d&amp;oe=5EA9C678\" style=\"height:450px; width:800px\" /></p>','2020-01-06 16:45:58.169025',1,0,'2020-01-06 16:44:40.764217'),(7,'Wooji is a fin-tech company','','<p>Wooji is a fin-tech company that provides state of the art machine-learning, AI based algorithmic solutions in finance. Wooji provides indicators and investment forecasts to private investors as well as institutions. We aim to uncover the best investment opportunities in the option and the cryptocurrency markets. Wooji are a collection of machine learning scientists, software engineers, and quantitative modelers from top universities and cutting-edge AI institutions, all working in concert to create and manage high-performing trading models. Our global team soughts to deliver market-leading investment returns and empowers our customer to navigate the increasingly complex world of investment management.</p>\r\n\r\n<p><img src=\"http://www.aphanti.com/media/editor/70627073_106447937408421_4390683635783565312_n_20191226184130077867.png\" /></p>','2019-09-01 17:28:11.000000',1,0,'2020-01-04 18:29:12.000000'),(8,'Wooji provide option & cryptocurrency trading strategy','','Wooji provide option & cryptocurrency trading strategy to private investors as well as institutions.\r\n\r\nAn option is an art of choosing. A stock option gives an investor the right, but not the obligation, to buy or sell a stock at an agreed-upon price and date. Wooji uses an implied volatility-based, multi-factor model to help you identify the best option to trade among the vast universe of tickers, strikes, and expiry dates.\r\n\r\nA cryptocurrency is a digital asset that uses strong cryptography to secure financial transactions, control the creation of additional units, and verify the transfer of assets. Whether they can replace cash remains a hot debate. But no worries, Wooji\'s powerful AI indicators got your back in trading cryptos.![](/media/editor/blog2_20191226184355804228.jpg)','2019-09-08 22:43:03.000000',1,0,NULL),(9,'September reversal paused during pre-market today','','September reversal paused during pre-market today in response to the Saudi oil attack. The oil price surged more than 10% immediately post-attack, while the stock market is relatively calm, which makes the market even more interesting and complex as the global major central bank just eased cycle kick-started with ECB QE and awaiting for Fed and BOJ. \r\nBefore diving in our perspectives on the market, I would like to take a retrospective view and quickly summarize past weeks’ comments. Three weeks ago, it was advised that the equity market would pause its decline due to US-China trade war and start to reverse. Dow has been up by at least 3% since then. Additionally, in EM, the strategy was UW EM currencies again USD/JPY/CHF, long Russia Equity index. The currency strategy has not performed well due to the risk on sentiment with sight of potential downplay of trade war. Besides, Russia equity gapped overnight, due to the surge of oil price. Though it was not part of visions before, but despite of this overnight gap, MOEX did raise 6% over past 2-3 weeks as well. For rates, it was commented: 1. Curve invert would be corrected and it did, 2. 10Y UST year-end target being 1.5%, it’s 1.8% so as I write this. It looks short term view has been good, while longer term view has not been realized yet.![](/media/editor/blog3_20191226184518327283.jpg)','2019-09-16 22:44:44.000000',1,0,NULL),(10,'Trump impeachment process was kick-started by Nancy Pelosi','','Last week was a relatively calm week until the Trump impeachment process was kick-started by Nancy Pelosi. Then on Friday, the market was suddenly fluxed with risk averse trade around 11:30AM after the White House announced it’s considering blocking Chinese investment. The equity market volume is unstable with quiet time only trading 6bio a day to 7.8bio in volatile times. It looks like if we still held the VIX instrument, we would have been able to profit even more last Friday. \r\nDespite many uncertainties, VIX still failed to pop one level up and the market stayed intact. All suggests to me that the bull is continuing. Even though I was with the market that a degree of calmness is correct, the recent development brings me more unrest. I’m starting to see that with the increased likelihood of trade war escalation, the current cease-fire is only to avoid provoking China on its 70th anniversary. But both countries have great issues within; China is fighting for high leverage, increasing CPI, high pork price, HK protest etc., while Trump is facing House and Congress hearings. My view is they’re both seeking a way to direct attention from inside to foreign affairs. Thus I have a higher bet on the trade negotiation in Oct. being unsuccessful. \r\nAside from political issues, there aren’t many economic data being published that are significant enough. The only piece of info is the consumer sentiment, which is lower than expected. This is as expected; it has been commented that as business sentiment falls the wage growth would follow and then the last piece of the puzzle to complete the recession sentiment is the decline of consumer sentiment. Once this feedback loop forms, we are waiting to see at least a sentiment recession to occur next year. Hopefully the business and capex will prove me wrong in the near future and we’ll still be at mid-cycle as Fed believes, but I fear the worst.\r\nFor the coming week, my attention is on the HK protest. If it provokes the Chinese government even further to a stage that it will use military force, I would be cautious on HK equity market. Also, I am watching how the Fed is going to prepare its future balance sheet and what it will do to regain the control of the overnight rate. In terms of the market, I don’t foresee a large market swing. We’ll likely follow a small decline at beginning of the week, but I believe we will see US equity ends up in the green by Friday. \r\nLastly for the currency market, my stand has not changed except for US dollar – I am not so bullish about it due to the Fed balance sheet growth. Additionally, if US does start to restrict Chinese investment, a 7.4 USD/CNH is not impossible. I still stand with my medium term forecast of 7.12-7.2 range until further development of the story.![](/media/editor/blog4_20191226184702307146.jpg)','2019-09-30 22:46:51.000000',1,0,NULL),(11,'October is usually a month of frenzied actions','','October is usually a month of frenzied actions across all asset classes and all markets. Indeed the market had a wild swing in past week. Even though the direction was as predicted that we started the week in red, and would eventually end up in the green by end of the week, the magnitude and volatility did shock me a little. I feel like the bull market is about to end, and investors will finally stop their fanaticism and take another look at what they are holding at the moment. The US equity market volume reached a single day high for half the year on Wednesday, traded 8bio shares, given the disappointing ISM number. The recession fear started to kick in.\r\nTaking a retrospective look, we believe our previous recommendations were good as it was indeed good timing for equity in terms of direction, the call of stop bullish in USD was just in time, DXY started to fall last week, and the reasoning about the chain of reactions of the economical data has been confirmed by the poor ISM number and somewhat mixing NFP. Today, as I write this commentary, economists also have raised their fears of recession.\r\nWith such new developments in the market, the question becomes how to position the assets. The safe haven assets such as UST10y, would be good to invest in. Additionally, I believe the year-end liquidity will suffer a heavy hit; people will desperately need cash. Therefore, 3M EUR/USD might be good instruments to hold in order to take advantage of the year-end funding squeeze, and potentially EUR will make cuts in Q4.\r\nFor the rest of the assets, equity will enter a range-bouncing regime, with DJI’s highest, I believe, reaching 26800, and lowest at 26000 for the rest of the year. Depending on the trade war talk, if everything goes really well, there is a chance to regain the yearly high, but I have less confidence that such a talk could end well, at least for Q4 2019.\r\nThough Chinese manufacturing activity and investment surprisingly improved, I am not so optimistic on how China will do in the near or medium term; therefore, commodity market, and commodity currencies could still suffer heavy hits.\r\nAn additional risk to watch is HK. The protestors keep escalating the tension; I fear HKD will crash once Chinese military step in and HKMA might not have the ability to enforce the 7.85 pegging.\r\n![](/media/editor/blog5_20191226184840455144.png)','2019-10-07 22:47:58.000000',1,0,NULL),(12,'There were many good developments in the market last week','','<p>There were many good developments in the market last week and the first two days of the current week. A first phase deal is in place between the US and China. Brexit had some impressive developments. Lastly, banks kick started Q3 earnings with better than expected results. All of these are contributing to a big rally in the global market; S&amp;P500 reached 3000 again and DJI reached a 4-week high at a level of 27000. As such, the previous strategies or forecasts need to be revised to reflect the most current market development. 1. CNH has regained some strength and USDCNH moved down from 7.2 to 7.1. I use USDCNH as a general indicator of sentiment from China. 2. Revise previous UW in Euro and GBP. GBPUSD moved up by around 150 pips over past five days in reaction to the news. 3. OW Chinese bond generates a positive return and potential downplay of trade war is easing some credit risks. Though the market completely shifts its sentiment from recession worry to future growth, I still have some reservations on the following: 1. How likely is it that a final deal between the US and China could be reached by the end of the year? I have some doubt that the first phase deal will lead to further victory. 2. IMF downgraded the US GDP growth, so did China; I worry that the trade war impact has already kicked in and its impact will slowly be baked into further decline of business/investment sentiment, Capex, and finally transfer to labor market and earnings. 3. Banks have impressive earnings, but most of them come from the mortgage business and some from bond trading; this might suggest the market is supported by consumers rather than corporate investment. So should we be so optimistic about the earnings on other sectors? I cast my doubt. 4. Though many believe the market will continue such rally, I feel there will be headwinds blown from surprised earnings, Feds, and lengthy negotiation of trade wars. As such, I would still position myself with some UST 10s for above potential risks. 5. I still stand by my previous forecast of range bouncing of US equity with DJI moving between 26000-27000; as such, I feel we are at the high of DJI now. 6. Additionally, with only a fraction of the big picture, I hesitate to revive the previous call on UST 10s being 1.5% at year-end. This is also the reason why I believe owning some 10s at the moment might be a reasonable hedge. What to watch for this week: 1. Q3 earnings 2. Fed speak 3. US-EU / US-China trade talk 4. US retail sales 5. China IP/Retail Sales/Q3 GDP ![](/media/editor/blog6_20191226185038753067.jpg)&nbsp;</p>','2019-10-16 22:50:57.000000',1,0,NULL),(13,'Last week equity markets ended with near record highs','','<p>Last week equity markets ended with near record highs helped by earning data from banks and the successful conclusion of the trade talks. Even though the retail data is not good and the Chinese 3Q GDP growth mis-forecasted the target (6.0% vs 6.1%) and is the slowest in 20 years, the market doesn&rsquo;t seem bothered at all. There is another round of risk on sentiment with UST 10s yield keep claiming, equity inching higher, VIX decreasing to its lowest level in 2 months. Additionally, an agreement between Britain and Europe has been reached, though a proposal has not been passed by parliament yet. Euro-dollar rallied throughout the week as a result. So our call on long Euro-dollar, US equities, Euro equities was good. Though UST 10S decreased, I still keep my view on having some exposure of 10s in the portfolio, in case of any surprises. Given the above summary, do I change my view of incoming economic instability and end of cycle to a more optimistic view? Unfortunately, I don&rsquo;t see any of the above as enough to signal the market is doing fine and will continue on this path. I see this good data as superficial, for several reasons: 1. Bank earnings are good, but they are saved by the consumer mortgages; most banks, except Citi, have traded missed their targets. This is consistent with consumer sentiment still being good, and we are again saved by consumers rather than the business investment sentiment. 2. Retail data shows some weakness on the consumer sentiment might start changing now. As previously mentioned, if the economy is going bad then consumer sentiment, I believe, would be the last factor to show it. In other words, consumer spending is a delayed factor to suggest the economy is in trouble. 3. Trade war concludes its first round with optimism, I am still not fully convinced a truce can be reached by the year end, and there are some serious issues both countries need to agree up on such as intellectual properties etc, and those would take a long time to negotiate. The problem has to do with the re-structuring of both countries&rsquo; market and law which I don&rsquo;t think can be resolved in a short time. Additionally, the first round truce is because both countries could not afford any escalation now. Trump is under investigation for Ukraine matters; he needs to find some positive news to save his election. China has GDP growth historical low, and as I mentioned, deflating CNH would make the Chinese face serious issues regarding food safety which China is already experiencing and has somewhat brought instability into the regime. All those factors together forces such a short term deal. Given the above analysis, what direction would we advise to take for the different markets? I believe DJI has reached its historical high, breaking it would be hard. It&rsquo;s not wise to short it for now, nor do I think it has any room to grow. This implies that the risk adjusted return in equities in the short term is not attractive anymore and I would stay neutral to US equities. I continue my call on Euro equities as I do believe the Euro will grant additional time to Britain and as Euro is undervalued by the BE instability, it&rsquo;s time for it to make some correction. USDCNH just touched 7.0 last week. I believe as Chinese is facing some difficult times, and there is instability in the region (HK continues its protest), I believe USDCNH would range bounce from 7.0-7.15. So, I believe it&rsquo;s a good time for short USDCNH now, for the short term. Lastly, I still believe keeping some UST exposure in your portfolio is good, to hedge out any surprises. ![](/media/editor/blog7_20191226185146933745.png)</p>','2020-01-04 18:27:29.856326',1,0,'2020-01-04 18:27:25.505771'),(14,'Hapyy Birthday, Wooji!','','<p>Hapyy Birthday, Wooji! Oct 22, 2019 is Wooji Capital&#39;s 1 year Birthday. Thank you very much for being with us. We are gald to celebrete this great day with all our friends. Every person who forward this message and contact us by info@woojicap.com will received a gift from Wooji.![](/media/editor/blog8_20191226185804204794.jpg)</p>','2019-10-22 22:56:42.000000',1,0,NULL),(15,'Most of last week’s earnings beat market expectations','','<p><span style=\"color:#e74c3c\">Most of last week&rsquo;s earnings beat market expectations, </span>with an average EPS return of 5% vs -3%. The banks forecasted the growth would bottom in 3Q and start to stabilize in 4Q; we should see growth recovery in 1Q 2020 if the trend continues, with growth expectation to be 7% by then. The business cycle has recovered due to the de-escalation of the trade war. I feel there was a significant turn-around of market sentiment last week. By Monday evening, many equity markets globally have reached record highs. Additionally, historically speaking, during election year, the equities usually per Therefore, it was a good call in previous commentaries that we OW EM equities with last week&rsquo;s SHANGHAI index returning to around 1.7% beating SP500 of 1.3%. In the year-to-date performance, Russian equities outperformed all other asset classes, which is also as we suggested 2-3 months ago. With this new shift in sentiment, it&rsquo;s recommended to keep OW EM equities with the expectation that EM is going to outperform US; it&rsquo;s also suggested to long CAD over JPY for macro divergence. It also marks our closure to short AUD/JPY trade suggested previously. Additionally, as the trade war ebbs, long oil due to fundamentals improvement. To wrap up the economic data, Monday&rsquo;s flash PMI data also suggests global manufacturing recovery, but still shows weak growth and steep pullback of employment growth. This backs up above point that though momentum fades, macro is going to recover. Long base metal trading would also be recommended hence. What we need to pay attention next week is the Fed&rsquo;s movement. The market bets there is 25bps cut with high probability. I personally don&rsquo;t see a reason why Fed needs to cut again, given de-escalation of global slowdown risks and trade war risk. In case Fed is not cut, we might want to pre-position ahead of the Fed announcement for some VIX position (or at least close short VIX carry) in case Trump might attack Fed and use some counter measure (such as re-escalation of trade war) to force Fed cuts in the future. ![](/media/editor/blog9_20191226190009954996.jpg)&nbsp;&nbsp;</p>','2019-10-29 22:59:44.000000',11,0,NULL);
/*!40000 ALTER TABLE `blog_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blog_tag`
--

DROP TABLE IF EXISTS `blog_blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_blog_tag_blog_id_tag_id_574faa6a_uniq` (`blog_id`,`tag_id`),
  KEY `blog_blog_tag_tag_id_6a5a1786_fk_blog_tag_id` (`tag_id`),
  CONSTRAINT `blog_blog_tag_blog_id_cc8a96d9_fk_blog_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `blog_blog` (`id`),
  CONSTRAINT `blog_blog_tag_tag_id_6a5a1786_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blog_tag`
--

LOCK TABLES `blog_blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_blog_tag` DISABLE KEYS */;
INSERT INTO `blog_blog_tag` VALUES (1,1,4),(2,1,5),(5,3,1),(6,3,2),(7,3,3),(8,6,4),(9,6,6);
/*!40000 ALTER TABLE `blog_blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_comment`
--

DROP TABLE IF EXISTS `blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `time` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `blog_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_comment_blog_id_c664fb0d_fk_blog_blog_id` (`blog_id`),
  CONSTRAINT `blog_comment_blog_id_c664fb0d_fk_blog_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `blog_blog` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_comment`
--

LOCK TABLES `blog_comment` WRITE;
/*!40000 ALTER TABLE `blog_comment` DISABLE KEYS */;
INSERT INTO `blog_comment` VALUES (1,'Great blog!','2019-12-07 01:41:41.000000',1,1),(2,'Agree with the author','2019-12-10 14:05:23.000000',2,6),(3,'Sounds reasonable','2019-12-07 23:00:00.000000',1,6);
/*!40000 ALTER TABLE `blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tag`
--

DROP TABLE IF EXISTS `blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `color` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
INSERT INTO `blog_tag` VALUES (1,'Trump','#faa'),(2,'Trade war','#afa'),(3,'China','#aaf'),(4,'Amazon','#ffa'),(5,'New York','#faf'),(6,'Tech','#aff');
/*!40000 ALTER TABLE `blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (6,'2019-12-08 14:26:05.352357','3','Kenneth',3,'',14,1),(7,'2019-12-10 00:44:28.323389','1','Trump',1,'[{\"added\": {}}]',20,1),(8,'2019-12-10 00:44:46.201044','2','Trade war',1,'[{\"added\": {}}]',20,1),(9,'2019-12-10 00:45:07.527550','3','China',1,'[{\"added\": {}}]',20,1),(10,'2019-12-10 00:45:45.889715','4','Amazon',1,'[{\"added\": {}}]',20,1),(11,'2019-12-10 00:46:54.450180','5','New York',1,'[{\"added\": {}}]',20,1),(12,'2019-12-10 00:47:22.186489','6','Tech',1,'[{\"added\": {}}]',20,1),(13,'2019-12-10 00:52:13.133725','1','The global rebound continued last week as US equity inched higher',1,'[{\"added\": {}}]',19,1),(14,'2019-12-10 01:34:36.298993','1','The global rebound continued last week as US equity inched higher',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(15,'2019-12-10 01:40:44.896424','2','the VIX entered its new low',1,'[{\"added\": {}}]',19,1),(16,'2019-12-10 01:42:01.333178','1','[12/06/2019, 20:41:41] wooji\'s comment on The global rebound continued last week as US equity inched higher',1,'[{\"added\": {}}]',21,1),(17,'2019-12-10 01:42:04.695945','1','[12/06/2019, 20:41:41] wooji\'s comment on The global rebound continued last week as US equity inched higher',2,'[]',21,1),(18,'2019-12-10 01:44:37.391920','3','U.S. stocks climbed to record highs last week',1,'[{\"added\": {}}]',19,1),(19,'2019-12-10 02:26:27.925146','5','zmlzeze',2,'[{\"changed\": {\"fields\": [\"is_premium\", \"bio\", \"is_staff\", \"is_superuser\"]}}]',14,1),(20,'2019-12-10 02:27:02.418521','7','enlighter',2,'[{\"changed\": {\"fields\": [\"is_active\", \"is_staff\"]}}]',14,1),(21,'2019-12-10 02:27:16.749553','6','yaoxiq',3,'',14,1),(22,'2019-12-10 14:03:01.431524','6','Most of last week’s earnings beat market expectations',1,'[{\"added\": {}}]',19,1),(23,'2019-12-10 14:05:20.668005','1','[12/06/2019, 20:41:41] wooji\'s comment on The global rebound continued last week as US equity inched higher',2,'[]',21,1),(24,'2019-12-10 14:06:31.469829','2','[12/10/2019, 09:05:23] oscar\'s comment on Most of last week’s earnings beat market expectations',1,'[{\"added\": {}}]',21,1),(25,'2019-12-10 14:07:00.071536','3','[12/07/2019, 18:00:00] wooji\'s comment on Most of last week’s earnings beat market expectations',1,'[{\"added\": {}}]',21,1),(26,'2019-12-11 17:41:53.133915','8','tianshi9421',2,'[{\"changed\": {\"fields\": [\"is_active\"]}}]',14,1),(27,'2019-12-21 01:14:48.347199','8','tianshi9421',2,'[{\"changed\": {\"fields\": [\"is_active\"]}}]',14,1),(28,'2019-12-26 23:41:58.035616','7','Wooji is a fin-tech company',1,'[{\"added\": {}}]',19,1),(29,'2019-12-26 23:44:00.904584','8','Wooji provide option & cryptocurrency trading strategy',1,'[{\"added\": {}}]',19,1),(30,'2019-12-26 23:45:21.661220','9','September reversal paused during pre-market today',1,'[{\"added\": {}}]',19,1),(31,'2019-12-26 23:47:18.620346','10','Last week was a relatively calm week until the Trump impeachment process was kick-started by Nancy Pelosi',1,'[{\"added\": {}}]',19,1),(32,'2019-12-26 23:49:08.855873','11','October is usually a month of frenzied actions',1,'[{\"added\": {}}]',19,1),(33,'2019-12-26 23:51:02.243763','12','There were many good developments in the market last week',1,'[{\"added\": {}}]',19,1),(34,'2019-12-26 23:52:44.546455','13','Last week equity markets ended with near record highs',1,'[{\"added\": {}}]',19,1),(35,'2019-12-26 23:58:13.251062','14','Hapyy Birthday, Wooji!',1,'[{\"added\": {}}]',19,1),(36,'2019-12-27 00:00:13.817438','15','Most of last week’s earnings beat market expectations',1,'[{\"added\": {}}]',19,1),(37,'2019-12-27 19:50:08.003315','10','Trump impeachment process was kick-started by Nancy Pelosi',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',19,1),(38,'2019-12-28 19:48:20.869035','15','Most of last week’s earnings beat market expectations',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(39,'2019-12-28 20:48:09.210115','13','Last week equity markets ended with near record highs',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(40,'2019-12-28 20:48:50.927623','13','Last week equity markets ended with near record highs',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(41,'2019-12-28 20:49:26.557877','13','Last week equity markets ended with near record highs',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(42,'2019-12-28 21:24:40.852450','15','Most of last week’s earnings beat market expectations',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(43,'2019-12-28 21:26:33.268464','14','Hapyy Birthday, Wooji!',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(44,'2019-12-28 21:27:13.033142','15','Most of last week’s earnings beat market expectations',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(45,'2019-12-28 21:48:26.568196','12','There were many good developments in the market last week',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(46,'2019-12-28 21:52:38.528813','14','Hapyy Birthday, Wooji!',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(47,'2019-12-28 22:05:22.852906','14','Hapyy Birthday, Wooji!',2,'[]',19,1),(48,'2019-12-29 01:52:01.711159','12','Fengzhao',2,'[{\"changed\": {\"fields\": [\"head_pic\"]}}]',14,1),(49,'2019-12-29 02:03:55.793031','4','bob',2,'[{\"changed\": {\"fields\": [\"is_premium\"]}}]',14,1),(50,'2020-01-02 00:26:51.306383','12','Fengzhao',2,'[{\"changed\": {\"fields\": [\"head_pic\"]}}]',14,1),(51,'2020-01-02 00:27:01.569766','2','oscar',2,'[{\"changed\": {\"fields\": [\"head_pic\"]}}]',14,1),(52,'2020-01-02 00:27:25.990134','2','oscar',2,'[{\"changed\": {\"fields\": [\"head_pic\"]}}]',14,1),(53,'2020-01-02 00:28:56.452487','15','Most of last week’s earnings beat market expectations',2,'[{\"changed\": {\"fields\": [\"author\", \"body\"]}}]',19,1),(54,'2020-01-02 00:29:42.812835','11','Feng',2,'[{\"changed\": {\"fields\": [\"head_pic\"]}}]',14,1),(55,'2020-01-02 00:44:38.026187','19','Test 4 - wooji',2,'[{\"changed\": {\"fields\": [\"is_draft\"]}}]',19,1),(56,'2020-01-02 00:44:43.330511','18','Title 3 - wooji',2,'[{\"changed\": {\"fields\": [\"is_draft\"]}}]',19,1),(57,'2020-01-02 00:44:47.836544','17','test title 2 - wooji',2,'[{\"changed\": {\"fields\": [\"is_draft\"]}}]',19,1),(58,'2020-01-02 00:44:54.795010','16','test title - wooji',2,'[{\"changed\": {\"fields\": [\"is_draft\"]}}]',19,1),(59,'2020-01-02 01:02:21.621039','19','Test 4 - wooji',2,'[{\"changed\": {\"fields\": [\"update_time\"]}}]',19,1),(60,'2020-01-02 02:18:41.298537','28','Test 4 - wooji',3,'',19,1),(61,'2020-01-02 02:18:41.312968','27','blog test 6 - wooji',3,'',19,1),(62,'2020-01-02 02:18:41.321364','26','test 7 - wooji',3,'',19,1),(63,'2020-01-02 02:18:41.329313','25','test 7 - wooji',3,'',19,1),(64,'2020-01-02 02:18:41.354328','24','test 7 - wooji',3,'',19,1),(65,'2020-01-02 02:18:41.362947','23','test blog 8 - wooji',3,'',19,1),(66,'2020-01-02 02:18:41.371291','22','test 7 - wooji',3,'',19,1),(67,'2020-01-02 02:18:41.379572','21','blog test 6 - wooji',3,'',19,1),(68,'2020-01-02 02:18:41.387954','20','test 5 - wooji',3,'',19,1),(69,'2020-01-02 02:18:41.396299','19','Test 4 - wooji',3,'',19,1),(70,'2020-01-02 02:18:41.404697','18','Title 3 - wooji',3,'',19,1),(71,'2020-01-02 02:18:41.413051','17','test title 2 - wooji',3,'',19,1),(72,'2020-01-02 02:18:41.421347','16','test title - wooji',3,'',19,1),(73,'2020-01-04 18:29:19.453038','7','Wooji is a fin-tech company - wooji',2,'[{\"changed\": {\"fields\": [\"pub_time\", \"update_time\"]}}]',19,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (14,'accounts','customuser'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(19,'blog','blog'),(21,'blog','comment'),(20,'blog','tag'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(6,'stock','stockdata'),(7,'stock','stockprofile'),(8,'stock','stockuniverse'),(9,'stock','treemapcoordinate');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-12-03 02:23:15.906945'),(2,'contenttypes','0002_remove_content_type_name','2019-12-03 02:23:16.137155'),(3,'auth','0001_initial','2019-12-03 02:23:16.347125'),(4,'auth','0002_alter_permission_name_max_length','2019-12-03 02:23:16.966431'),(5,'auth','0003_alter_user_email_max_length','2019-12-03 02:23:16.989032'),(6,'auth','0004_alter_user_username_opts','2019-12-03 02:23:17.006396'),(7,'auth','0005_alter_user_last_login_null','2019-12-03 02:23:17.022020'),(8,'auth','0006_require_contenttypes_0002','2019-12-03 02:23:17.025953'),(9,'auth','0007_alter_validators_add_error_messages','2019-12-03 02:23:17.046278'),(10,'auth','0008_alter_user_username_max_length','2019-12-03 02:23:17.057505'),(11,'auth','0009_alter_user_last_name_max_length','2019-12-03 02:23:17.065733'),(12,'auth','0010_alter_group_name_max_length','2019-12-03 02:23:17.091037'),(13,'auth','0011_update_proxy_permissions','2019-12-03 02:23:17.111933'),(14,'accounts','0001_initial','2019-12-03 02:23:17.322805'),(15,'admin','0001_initial','2019-12-03 02:23:18.174708'),(16,'admin','0002_logentry_remove_auto_add','2019-12-03 02:23:18.514938'),(17,'admin','0003_logentry_add_action_flag_choices','2019-12-03 02:23:18.535237'),(19,'sessions','0001_initial','2019-12-03 02:23:19.807993'),(20,'stock','0001_initial','2019-12-03 02:23:20.253013'),(22,'blog','0001_initial','2019-12-08 14:23:43.567623'),(23,'blog','0002_auto_20200101_1942','2020-01-02 00:43:07.113590');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('03nwk68gp99fx0zkhhoh9o13akyaxzw0','MDJiMTZiYTUyZjM4YTlkMDM0ZDM0NGNmYjIyZDRkM2ZiY2JhOTAwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjRhOGU3OTMzYjc3YmRkZDMwY2Y0NWQ1OGI2OGQ5NDRiNjViNzA1In0=','2020-01-07 01:25:22.909980'),('0g1gcy1gtlxugtvxua76cmi2f7katqzy','MDJiMTZiYTUyZjM4YTlkMDM0ZDM0NGNmYjIyZDRkM2ZiY2JhOTAwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjRhOGU3OTMzYjc3YmRkZDMwY2Y0NWQ1OGI2OGQ5NDRiNjViNzA1In0=','2020-01-07 01:25:26.469000'),('1nf66a92om35hr14739w2muk8cqy604x','MDJiMTZiYTUyZjM4YTlkMDM0ZDM0NGNmYjIyZDRkM2ZiY2JhOTAwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjRhOGU3OTMzYjc3YmRkZDMwY2Y0NWQ1OGI2OGQ5NDRiNjViNzA1In0=','2020-01-07 01:21:08.564066'),('22x3iolh8onc5hijc160k7lzp1zl9son','MDJiMTZiYTUyZjM4YTlkMDM0ZDM0NGNmYjIyZDRkM2ZiY2JhOTAwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjRhOGU3OTMzYjc3YmRkZDMwY2Y0NWQ1OGI2OGQ5NDRiNjViNzA1In0=','2020-01-06 20:28:30.836314'),('2oiqzecewvayz8mkm5pi3hp5bc1nason','OTk0MGIzOTQ4MDJkNzdmYjhlMjdkOTIzMWQ4MDQ2MzdiMzM5MDIzODp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWI4MmM0NDc2ZWFjZjFkMGE1M2M3MDc5MTJjZjAxNGM3YWRkMzgzYiJ9','2020-01-16 17:04:05.422846'),('3p6ssibw5uk5r2erqbhh44a78nk7vlaw','MDJiMTZiYTUyZjM4YTlkMDM0ZDM0NGNmYjIyZDRkM2ZiY2JhOTAwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjRhOGU3OTMzYjc3YmRkZDMwY2Y0NWQ1OGI2OGQ5NDRiNjViNzA1In0=','2020-01-11 19:22:59.495134'),('49883p1fxv2lys9sslemgeu8c77b2smg','ODg4MTEwOTRlNzVlMWIwN2U2Njk5NDc4Y2Q4MzY1OTc2ZjRkZjhjZTp7Il9hdXRoX3VzZXJfaWQiOiI5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MmUzNGZiZThjOTkyNTJlYjAzZWZkZTA1MzUxN2E0NjQwNjY3ZmVjIn0=','2019-12-24 02:32:18.150228'),('4engeq6q15hsd92z92r7zgojimczpfjj','MDJiMTZiYTUyZjM4YTlkMDM0ZDM0NGNmYjIyZDRkM2ZiY2JhOTAwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjRhOGU3OTMzYjc3YmRkZDMwY2Y0NWQ1OGI2OGQ5NDRiNjViNzA1In0=','2020-01-06 21:40:24.139731'),('5jnf63hebd7ukwshxntcymw1qjcq67bi','MDJiMTZiYTUyZjM4YTlkMDM0ZDM0NGNmYjIyZDRkM2ZiY2JhOTAwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjRhOGU3OTMzYjc3YmRkZDMwY2Y0NWQ1OGI2OGQ5NDRiNjViNzA1In0=','2020-01-04 01:16:00.831910'),('7hzchhqvmq4n0qlg4ruyzq3oqc45q66b','M2E0M2VkZmI3MjVhNjAxMjBhNjZmYTVhNTE3NDBlZTY0Nzg2ZGJhYzp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZmM4MDczOTEyYjk1NGExNDZkYTcxNWU2OTgwZTkxNmVjN2I4MGNlOCJ9','2020-01-19 22:30:22.314714'),('8lmhxbzkt9hyvghhyxzv48vqqiiqruyy','MDJiMTZiYTUyZjM4YTlkMDM0ZDM0NGNmYjIyZDRkM2ZiY2JhOTAwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjRhOGU3OTMzYjc3YmRkZDMwY2Y0NWQ1OGI2OGQ5NDRiNjViNzA1In0=','2019-12-18 01:29:41.178180'),('9hovw1aq3zrd8d5rhoxdh0sif95cckru','NWQyYjQxNjExY2QzNDJjY2U0NDVhZTQxMmQ0MWZkZmY1ZmEwZGY1Nzp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYWYzZDBiNjAwY2RlMmU2Y2UxMTJiNmYxOWUxMzFlNmNlOTJjYzBmMCJ9','2020-01-11 15:10:51.538038'),('bhb9eyt5yjo39gy5htmdw5sbhlmb888s','MDJiMTZiYTUyZjM4YTlkMDM0ZDM0NGNmYjIyZDRkM2ZiY2JhOTAwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjRhOGU3OTMzYjc3YmRkZDMwY2Y0NWQ1OGI2OGQ5NDRiNjViNzA1In0=','2020-01-12 02:03:34.437381'),('bje5w4as95bvc9wlb50bbbmwno0qsri8','MDJiMTZiYTUyZjM4YTlkMDM0ZDM0NGNmYjIyZDRkM2ZiY2JhOTAwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjRhOGU3OTMzYjc3YmRkZDMwY2Y0NWQ1OGI2OGQ5NDRiNjViNzA1In0=','2019-12-22 14:37:21.905084'),('c88cmxhcn8jd6xeiik29wdpgqgdlc334','ODkwNWNkY2UxY2ExZTg3NGEzYWEzMGU0ODdmNjFlNGNjNTg4MzJlOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzOTNjNzg5ZTdjOWViNzI2NjMzYTA0ZDRkNjI5YjE3NjVhMDk5ZjdhIn0=','2020-01-20 17:45:53.574485'),('e4v19ofwq7wi2wrwf7bagf2rlx9f3gqy','MmNjNjVlYmU0ODgxMzRjZTY1NzZmYWFhZDA3NGNjZmNmMDUxNjMyMzp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNjJiYjE4YjlkY2I1MmI1ZDRiZDgzOTI2OWQxNTc3ZDY1MmEzNmVkIn0=','2019-12-22 14:35:39.173327'),('fd8pg3hsazzol6hkmmi38e3tfa3s7saw','MDJiMTZiYTUyZjM4YTlkMDM0ZDM0NGNmYjIyZDRkM2ZiY2JhOTAwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjRhOGU3OTMzYjc3YmRkZDMwY2Y0NWQ1OGI2OGQ5NDRiNjViNzA1In0=','2020-01-11 15:10:22.730065'),('iujscc8xe5fl69j3jopxsk1xwmm4fy5m','MDJiMTZiYTUyZjM4YTlkMDM0ZDM0NGNmYjIyZDRkM2ZiY2JhOTAwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjRhOGU3OTMzYjc3YmRkZDMwY2Y0NWQ1OGI2OGQ5NDRiNjViNzA1In0=','2020-01-04 01:15:40.030034'),('ky9g787am32ml7ajof69ugfy4a53jsou','MDJiMTZiYTUyZjM4YTlkMDM0ZDM0NGNmYjIyZDRkM2ZiY2JhOTAwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjRhOGU3OTMzYjc3YmRkZDMwY2Y0NWQ1OGI2OGQ5NDRiNjViNzA1In0=','2019-12-21 21:18:35.435995'),('l7nzlf0mine3ecbrmwtmr8ab9rgsbk07','NWQyYjQxNjExY2QzNDJjY2U0NDVhZTQxMmQ0MWZkZmY1ZmEwZGY1Nzp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYWYzZDBiNjAwY2RlMmU2Y2UxMTJiNmYxOWUxMzFlNmNlOTJjYzBmMCJ9','2020-01-04 01:13:59.467645'),('ld5lp1geefpo10boctiz6p25stvhw1dr','MDJiMTZiYTUyZjM4YTlkMDM0ZDM0NGNmYjIyZDRkM2ZiY2JhOTAwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjRhOGU3OTMzYjc3YmRkZDMwY2Y0NWQ1OGI2OGQ5NDRiNjViNzA1In0=','2020-01-11 21:39:21.957868'),('mjilam6g4d91nikl003b19btdkkfky50','MDJiMTZiYTUyZjM4YTlkMDM0ZDM0NGNmYjIyZDRkM2ZiY2JhOTAwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjRhOGU3OTMzYjc3YmRkZDMwY2Y0NWQ1OGI2OGQ5NDRiNjViNzA1In0=','2019-12-25 17:39:17.569338'),('njzrbacqj4uj2ypkz3ww7e2isfe9e1h1','MDJiMTZiYTUyZjM4YTlkMDM0ZDM0NGNmYjIyZDRkM2ZiY2JhOTAwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjRhOGU3OTMzYjc3YmRkZDMwY2Y0NWQ1OGI2OGQ5NDRiNjViNzA1In0=','2020-01-07 01:24:44.259166'),('nxkf5k197nkume402bcvdfdhlbf411r2','MDJiMTZiYTUyZjM4YTlkMDM0ZDM0NGNmYjIyZDRkM2ZiY2JhOTAwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjRhOGU3OTMzYjc3YmRkZDMwY2Y0NWQ1OGI2OGQ5NDRiNjViNzA1In0=','2020-01-12 01:12:30.894751'),('ofjwpf4qtylpmuehtg5o7xfvt430j6dq','ODkwNWNkY2UxY2ExZTg3NGEzYWEzMGU0ODdmNjFlNGNjNTg4MzJlOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzOTNjNzg5ZTdjOWViNzI2NjMzYTA0ZDRkNjI5YjE3NjVhMDk5ZjdhIn0=','2020-01-20 17:22:20.669949'),('ou1bbqd968nbbloe9czgk3h3x9fql32n','MDJiMTZiYTUyZjM4YTlkMDM0ZDM0NGNmYjIyZDRkM2ZiY2JhOTAwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjRhOGU3OTMzYjc3YmRkZDMwY2Y0NWQ1OGI2OGQ5NDRiNjViNzA1In0=','2020-01-10 19:47:11.424898'),('ozya576j7fd2w05rpzbxa5vazmme17hh','MDJiMTZiYTUyZjM4YTlkMDM0ZDM0NGNmYjIyZDRkM2ZiY2JhOTAwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjRhOGU3OTMzYjc3YmRkZDMwY2Y0NWQ1OGI2OGQ5NDRiNjViNzA1In0=','2020-01-11 23:02:11.349894'),('pxotf64fzylxs4ybmxdnjugthstevvh3','MTIyY2UwYzBhNDkzYTAwNmM2NWEwNzU1Mjc2OGFhMzM1ZDdkY2E4Zjp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2NjgzYWRlN2U4NTQ4MWY5OGFjNDVmMjM2Y2QyYjAwNTg0MDZlNzE0In0=','2019-12-24 02:27:59.781001'),('t186xv31ek6d0vz9me36s304hkj9usmf','NTg0MjRlNmIzZWI2MWM5YzhhOWM3NzIxMzEyMDY1MDk1NGU2NGY4Yzp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhOGZkNzg0MDc5YWFkNjM1NjgwMjNhYWJlNWM0Y2NkMjlhOWM3YTY3In0=','2019-12-24 01:16:37.865012'),('t7tc6apqpwhqwgmv0elfxx89gt4ge1gx','ODkwNWNkY2UxY2ExZTg3NGEzYWEzMGU0ODdmNjFlNGNjNTg4MzJlOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzOTNjNzg5ZTdjOWViNzI2NjMzYTA0ZDRkNjI5YjE3NjVhMDk5ZjdhIn0=','2019-12-24 20:14:05.224886'),('thr1iesnyc2581yrp0wu5csrf7uaz4vr','MDJiMTZiYTUyZjM4YTlkMDM0ZDM0NGNmYjIyZDRkM2ZiY2JhOTAwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjRhOGU3OTMzYjc3YmRkZDMwY2Y0NWQ1OGI2OGQ5NDRiNjViNzA1In0=','2020-01-20 16:12:25.767820'),('u8yoic9k553si61durzjzcugmtssfl5n','ODkwNWNkY2UxY2ExZTg3NGEzYWEzMGU0ODdmNjFlNGNjNTg4MzJlOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzOTNjNzg5ZTdjOWViNzI2NjMzYTA0ZDRkNjI5YjE3NjVhMDk5ZjdhIn0=','2019-12-18 02:17:47.658402'),('u9aiotdc91orefmun2a6s6hgfingroeq','ODkwNWNkY2UxY2ExZTg3NGEzYWEzMGU0ODdmNjFlNGNjNTg4MzJlOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzOTNjNzg5ZTdjOWViNzI2NjMzYTA0ZDRkNjI5YjE3NjVhMDk5ZjdhIn0=','2020-01-20 16:49:59.810146'),('uomoipe13vq8zp2b6rf4612shm8vkgv0','MDJiMTZiYTUyZjM4YTlkMDM0ZDM0NGNmYjIyZDRkM2ZiY2JhOTAwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjRhOGU3OTMzYjc3YmRkZDMwY2Y0NWQ1OGI2OGQ5NDRiNjViNzA1In0=','2020-01-20 17:23:12.514307'),('wjj7unsjw3akh07f9tz2orsod1qo2l3b','MDJiMTZiYTUyZjM4YTlkMDM0ZDM0NGNmYjIyZDRkM2ZiY2JhOTAwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjRhOGU3OTMzYjc3YmRkZDMwY2Y0NWQ1OGI2OGQ5NDRiNjViNzA1In0=','2020-01-16 00:56:39.073309'),('x9ymgdkjmuqpcnnavsha1twy2vrtu9ut','MDJiMTZiYTUyZjM4YTlkMDM0ZDM0NGNmYjIyZDRkM2ZiY2JhOTAwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjRhOGU3OTMzYjc3YmRkZDMwY2Y0NWQ1OGI2OGQ5NDRiNjViNzA1In0=','2020-01-11 22:07:22.356748'),('xd3b4dlsnkqnmjb57ixzwyrfx5lxj9yy','ODkwNWNkY2UxY2ExZTg3NGEzYWEzMGU0ODdmNjFlNGNjNTg4MzJlOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzOTNjNzg5ZTdjOWViNzI2NjMzYTA0ZDRkNjI5YjE3NjVhMDk5ZjdhIn0=','2019-12-21 19:37:59.475635');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_stockdata`
--

DROP TABLE IF EXISTS `stock_stockdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_stockdata` (
  `symbol` varchar(20) NOT NULL,
  `histdata_market` varchar(100) DEFAULT NULL,
  `histdata_fund` varchar(100) DEFAULT NULL,
  `recent_date` date NOT NULL,
  `recent_price` double DEFAULT NULL,
  `recent_mktcap` double DEFAULT NULL,
  `recent_return_1d` double DEFAULT NULL,
  `recent_return_1w` double DEFAULT NULL,
  `recent_return_1m` double DEFAULT NULL,
  `recent_return_1y` double DEFAULT NULL,
  `pred_short` double DEFAULT NULL,
  `pred_medium` double DEFAULT NULL,
  `pred_long` double DEFAULT NULL,
  `pred_short_star` int(11) DEFAULT NULL,
  `pred_medium_star` int(11) DEFAULT NULL,
  `pred_long_star` int(11) DEFAULT NULL,
  `profile_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`symbol`),
  KEY `stock_stockdata_profile_id_fdf6920e_fk_stock_stockprofile_symbol` (`profile_id`),
  CONSTRAINT `stock_stockdata_profile_id_fdf6920e_fk_stock_stockprofile_symbol` FOREIGN KEY (`profile_id`) REFERENCES `stock_stockprofile` (`symbol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_stockdata`
--

LOCK TABLES `stock_stockdata` WRITE;
/*!40000 ALTER TABLE `stock_stockdata` DISABLE KEYS */;
INSERT INTO `stock_stockdata` VALUES ('AAPL','histdata_market/AAPL.csv','histdata_fundamental/AAPL.csv','2019-09-27',218.82,988886967600,-0.004866069398335449,0.005006200339870537,0.0718064263322884,-0.007258869431086112,0.8942463551014374,0.6080148554103598,0.6553014393826009,4,2,2,'AAPL'),('AXP','histdata_market/AXP.csv','histdata_fundamental/AXP.csv','2019-09-27',118.59,98391039660,-0.002691110924228357,0.015325342465753566,0.0071337579617833935,0.09795389315804082,0.6171402059244724,0.3122384237093311,0.24084236314852148,3,-2,-3,'AXP'),('BA','histdata_market/BA.csv','histdata_fundamental/BA.csv','2019-09-27',382.86,215439150600,-0.010416397425624835,0.00914626110335015,0.07929974910495297,0.04884530038626966,0.5942075164927626,0.613668540563063,0.1808813709997491,2,2,-4,'BA'),('CAT','histdata_market/CAT.csv','histdata_fundamental/CAT.csv','2019-09-27',126.59,71218141510,0.0015824036711764577,-0.012250312109862604,0.11651084847415771,-0.17353267611151002,0.27739218585214964,0.7942326802787499,0.8615796928623963,-2,4,4,'CAT'),('CSCO','histdata_market/CSCO.csv','histdata_fundamental/CSCO.csv','2019-09-27',48.84,207339963600,0.00020479213598201262,-0.015322580645161232,0.04381278050865589,0.008882462301177618,0.20682501193266156,0.749242242651602,0.4701569620174568,-3,4,-1,'CSCO'),('CVX','histdata_market/CVX.csv','histdata_fundamental/CVX.csv','2019-09-27',118.6,225152374800,-0.012982689747004006,-0.04601029601029605,0.023914357247690532,-0.0274702747027471,0.1978769052035393,0.318046493927853,0.21795383024385673,-3,-2,-3,'CVX'),('DIS','histdata_market/DIS.csv','histdata_fundamental/DIS.csv','2019-09-27',129.96,234107214840,-0.009979431705644859,-0.017464277613971402,-0.03368280169529336,0.12802708098255366,0.6642102776924607,0.6669976356541631,0.8142444499397651,3,3,4,'DIS'),('DOW','histdata_market/DOW.csv','histdata_fundamental/DOW.csv','2019-09-27',47.07,34982988840,-0.0033876773237347946,-0.023646546359676446,0.14330823415108074,0,0.5779724029674804,0.5084414486135395,0.48624475057038297,2,1,1,'DOW'),('GS','histdata_market/GS.csv','histdata_fundamental/GS.csv','2019-09-27',208.97,75138089080,0.0036019594659495446,-0.022316833536071945,0.055031049628919027,-0.08698881509961554,0.933295571912761,0.07030658455908545,0.05553484951765986,5,-5,-5,'GS'),('HD','histdata_market/HD.csv','histdata_fundamental/HD.csv','2019-09-27',229.86,251731868580,0.00030462596283564736,0.0231005474696222,0.05338893726227023,0.10765227447956827,0.5533749535634734,0.1477852958797511,0.47969210789936867,1,-3,1,'HD'),('IBM','histdata_market/IBM.csv','histdata_fundamental/IBM.csv','2019-09-27',143.24,126892735000,-0.0021595262974573037,0.009585565266422513,0.09201799191888416,-0.05520744014247081,0.548491721978993,0.03699069269399913,0.3354926648879477,1,-5,-2,'IBM'),('INTC','histdata_market/INTC.csv','histdata_fundamental/INTC.csv','2019-09-27',50.78,224955400000,-0.00274941084053415,0.0011829652996846463,0.10897575889932298,0.11115973741794316,0.022897149467188793,0.9322848650934927,0.7529529373205134,-5,5,3,'INTC'),('JNJ','histdata_market/JNJ.csv','histdata_fundamental/JNJ.csv','2019-09-27',128.6,339396747600,-0.0019402405898331088,-0.023167489555640075,-0.00802221536562786,-0.06919513607411698,0.14982247469117949,0.11104849641753278,0.21650679443118126,-4,-4,-3,'JNJ'),('JPM','histdata_market/JPM.csv','histdata_fundamental/JPM.csv','2019-09-27',117.72,376407934200,0.005895924122020002,-0.009924306139613148,0.11329676565159841,0.023474178403755985,0.3262308468005386,0.9073829864786112,0.055809071448512104,-2,5,-5,'JPM'),('KO','histdata_market/KO.csv','histdata_fundamental/KO.csv','2019-09-27',54.31,232231026370,-0.0014708586137157642,0.0074197736969023875,-0.007492690058479523,0.18451472191930218,0.16774282206683655,0.8869577212474629,0.364746281434972,-3,5,-2,'KO'),('MCD','histdata_market/MCD.csv','histdata_fundamental/MCD.csv','2019-09-27',213.16,161883083040,0.0026340545625587186,0.018004680261712647,-0.013376533209905173,0.2859555984555986,0.020604954014734944,0.7004954320985797,0.6872658674839358,-5,3,3,'MCD'),('MMM','histdata_market/MMM.csv','histdata_fundamental/MMM.csv','2019-09-27',164.53,94650653870,0.004272721723737938,-0.013372511393619502,0.056372391653290554,-0.22049557018998434,0.9161605313411822,0.862590118049175,0.9439923263418155,5,4,5,'MMM'),('MRK','histdata_market/MRK.csv','histdata_fundamental/MRK.csv','2019-09-27',82.91,212280691250,-0.011564139246542648,-0.026420854861437304,-0.030519176800748338,0.17887103654201608,0.40143971051424054,0.3854368990455346,0.8791578810645355,-2,-1,5,'MRK'),('MSFT','histdata_market/MSFT.csv','histdata_fundamental/MSFT.csv','2019-09-27',137.73,1051624881570,-0.012971191056327935,-0.012263339070568091,0.014660380138499907,0.20836988945429002,0.4414337930511405,0.29292166301506184,0.33243401758498925,-1,-2,-2,'MSFT'),('NKE','histdata_market/NKE.csv','histdata_fundamental/NKE.csv','2019-09-27',92.31,115559565840,0.0015189324075077781,0.06495154591601282,0.12532000487626482,0.10286738351254487,0.6744364835940674,0.3227353520972118,0.6796246814306349,3,-1,3,'NKE'),('PFE','histdata_market/PFE.csv','histdata_fundamental/PFE.csv','2019-09-27',36.22,200334558560,0.012297372833985465,-0.012810029980921178,0.05474665113570176,-0.17078754578754585,0.14374576162368635,0.45893210372948645,0.49834854100177983,-4,-1,1,'PFE'),('PG','histdata_market/PG.csv','histdata_fundamental/PG.csv','2019-09-27',124.57,311752992810,0.0020915453302228215,0.01906086387434547,0.03334715885524675,0.4961566178236847,0.4304318740285331,0.5295963969579218,0.38206825594255056,-1,1,-1,'PG'),('TRV','histdata_market/TRV.csv','histdata_fundamental/TRV.csv','2019-09-27',148,38537128000,-0.0006752194463199857,0.011758271807492449,0.00611828687967364,0.1428571428571428,0.5675665190297011,0.5127944444357999,0.5854846220650735,1,1,2,'TRV'),('UNH','histdata_market/UNH.csv','histdata_fundamental/UNH.csv','2019-09-27',215.26,203997812060,-0.0010209764247262054,-0.0757009747090901,-0.03440541874130898,-0.1812407287664981,0.5926296996151748,0.014220335216212354,0.1963704900866775,2,-5,-4,'UNH'),('UTX','histdata_market/UTX.csv','histdata_fundamental/UTX.csv','2019-09-27',136.39,117693522410,-0.008289100559877971,0.006048535811757683,0.09488640924781233,-0.02271424476927497,0.42385380343415013,0.658041976283316,0.7648661067856222,-1,2,4,'UTX'),('V','histdata_market/V.csv','histdata_fundamental/V.csv','2019-09-27',174,300492954000,-0.009393680614859123,-0.00034470872113068207,-0.024554322233434234,0.16567294164936008,0.13558058576150955,0.1804810566916598,0.8672786953839127,-4,-3,5,'V'),('VZ','histdata_market/VZ.csv','histdata_fundamental/VZ.csv','2019-09-27',60.3,249400800000,-0.0023163467902052037,0.00016586498590154264,0.05456453305351516,0.13473842679713965,0.06787620745266498,0.1578028236618617,0.41324915902245973,-5,-3,-1,'VZ'),('WBA','histdata_market/WBA.csv','histdata_fundamental/WBA.csv','2019-09-27',54.41,49140010630,0.006102071005917198,-0.010727272727272807,0.10030333670374092,-0.25424890350877194,0.9351357775075382,0.725399349377766,0.20460744646415774,5,3,-4,'WBA'),('WMT','histdata_market/WMT.csv','histdata_fundamental/WMT.csv','2019-09-27',118.45,336905439800,0.001267962806424494,0.012566250641135257,0.0536381426792385,0.25224653768897354,0.6774479115730602,0.09169665086929313,0.1484018643388474,4,-4,-5,'WMT'),('XOM','histdata_market/XOM.csv','histdata_fundamental/XOM.csv','2019-09-27',71.48,302439456880,0.0071861349866142454,-0.008324084350721295,0.06384878702187846,-0.16670552576358122,0.7671238249515554,0.1397268577383759,0.6017766729749291,4,-4,2,'XOM');
/*!40000 ALTER TABLE `stock_stockdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_stockprofile`
--

DROP TABLE IF EXISTS `stock_stockprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_stockprofile` (
  `symbol` varchar(20) NOT NULL,
  `company_name` varchar(200) NOT NULL,
  `exchange` varchar(20) NOT NULL,
  `country` varchar(200) NOT NULL,
  `address1` varchar(200) NOT NULL,
  `address2` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `zipcode` varchar(200) NOT NULL,
  `weburl` varchar(200) NOT NULL,
  `ipo_date` date NOT NULL,
  `business_desc` longtext NOT NULL,
  `sector` varchar(200) NOT NULL,
  `industry` varchar(200) NOT NULL,
  PRIMARY KEY (`symbol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_stockprofile`
--

LOCK TABLES `stock_stockprofile` WRITE;
/*!40000 ALTER TABLE `stock_stockprofile` DISABLE KEYS */;
INSERT INTO `stock_stockprofile` VALUES ('AAPL','Apple INC','14','USA','One Apple Park Way','','Cupertino','CA','95014','www.apple.com','1980-12-12','Apple Inc. designs, manufactures, and markets mobile communication and media devices, and personal computers. It also sells various related software, services, accessories, and third-party digital content and applications.','Information Technology','Technology Hardware, Storage & Peripherals'),('AXP','American Express Co','11','USA','200 Vesey Street, Lower Manhattan','','New York','NY','10285','www.americanexpress.com','1900-01-01','American Express Company, together with its subsidiaries, provides charge and credit payment card products, and travel-related services to consumers and businesses worldwide.','Financials','Consumer Finance'),('BA','Boeing Co','11','USA','100 North Riverside Plaza','','Chicago','IL','60606','www.boeing.com','1900-01-01','The Boeing Company, together with its subsidiaries, designs, develops, manufactures, sales, services, and supports commercial jetliners, military aircraft, satellites, missile defense, human space flight and launch systems, and services worldwide.','Industrials','Aerospace & Defense'),('CAT','Caterpillar INC','11','USA','510 Lake Cook Road, Suite 100','','Deerfield','IL','60015','www.caterpillar.com','1900-01-01','Caterpillar Inc. manufactures and sells construction and mining equipment, diesel and natural gas engines, and industrial gas turbines.','Industrials','Machinery'),('CSCO','Cisco Systems INC','14','USA','170 West Tasman Drive','','San Jose','CA','95134','www.cisco.com','1990-02-16','Cisco Systems, Inc. designs, manufactures, and sells Internet Protocol based networking and other products related to the communications and information technology industry worldwide.','Information Technology','Communications Equipment'),('CVX','Chevron CORP','11','USA','6001 Bollinger Canyon Road','','San Ramon','CA','94583','www.chevron.com','1900-01-01','Chevron Corporation, through its subsidiaries, engages in integrated energy, chemicals, and petroleum operations worldwide. The company operates in two segments, Upstream and Downstream.','Energy','Oil, Gas & Consumable Fuels'),('DIS','Disney (walt) Co','11','USA','500 South Buena Vista Street','','Burbank','CA','91521','www.thewaltdisneycompany.com','1900-01-01','The Walt Disney Company, together with its subsidiaries, operates as an entertainment company worldwide.','Communication Services','Entertainment'),('DOW','Dow INC','11','USA','2211 H.H. Dow Way','','Midland','MI','48674','www.dow.com','1900-01-01','Dow Inc. provides various materials science solutions for consumer care, infrastructure, and packaging markets worldwide.','Materials','Chemicals'),('GS','Goldman Sachs Group INC','11','USA','200 West Street','','New York','NY','10282','www.goldmansachs.com','1999-05-03','The Goldman Sachs Group, Inc. operates as an investment banking, securities, and investment management company worldwide. It operates in four segments: Investment Banking, Institutional Client Services, Investing & Lending, and Investment Management.','Financials','Capital Markets'),('HD','Home Depot INC','11','USA','2455 Paces Ferry Road','','Atlanta','GA','30339','www.homedepot.com','1900-01-01','The Home Depot, Inc. operates as a home improvement retailer.','Consumer Discretionary','Specialty Retail'),('IBM','Intl Business Machines CORP','11','USA','1 New Orchard Road','','Armonk','NY','10504','www.ibm.com','1900-01-01','International Business Machines Corporation operates as an integrated technology and services company worldwide.','Information Technology','IT Services'),('INTC','Intel CORP','14','USA','2200 Mission College Boulevard','','Santa Clara','CA','95054','www.intel.com','1900-01-01','Intel Corporation offers computing, networking, data storage, and communication solutions worldwide. It operates through Client Computing Group, Data Center Group, Internet of Things Group, Non-Volatile Memory Solutions Group, Programmable Solutions Group, and All Other segments.','Information Technology','Semiconductors & Semiconductor Equipment'),('JNJ','Johnson & Johnson','11','USA','One Johnson & Johnson Plaza','','New Brunswick','NJ','8933','www.jnj.com','1900-01-01','Johnson & Johnson, together with its subsidiaries, researches and develops, manufactures, and sells various products in the health care field worldwide. It operates in three segments: Consumer, Pharmaceutical, and Medical Devices.','Health Care','Pharmaceuticals'),('JPM','Jpmorgan Chase & Co','11','USA','383 Madison Avenue','','New York','NY','10179','www.jpmorganchase.com','1900-01-01','JPMorgan Chase & Co. operates as a financial services company worldwide. It operates in four segments: Consumer & Community Banking (CCB), Corporate & Investment Bank (CIB), Commercial Banking (CB), and Asset & Wealth Management (AWM).','Financials','Banks'),('KO','Coca-cola Co','11','USA','One Coca-Cola Plaza','','Atlanta','GA','30313','www.coca-colacompany.com','1900-01-01','The Coca-Cola Company, a beverage company, manufactures and distributes various nonalcoholic beverages worldwide. The company provides sparkling soft drinks; water, enhanced water, and sports drinks; juice, dairy, and plant-based beverages; teas and coffees; and energy drinks.','Consumer Staples','Beverages'),('MCD','Mcdonald\'s CORP','11','USA','110 North Carpenter Street','','Chicago','IL','60607','corporate.mcdonalds.com','1900-01-01','McDonald\'s Corporation operates and franchises McDonald\'s restaurants in the United States and internationally. Its restaurants offer various food products, soft drinks, coffee, and other beverages, as well as breakfast menu.','Consumer Discretionary','Hotels, Restaurants & Leisure'),('MMM','3m Co','11','USA','3M Center','','St. Paul','MN','55144','www.3m.com','1983-12-30','3M Company develops, manufactures, and markets various products worldwide. It operates through four business segments: Safety & Industrial, Transportation & Electronics, Health Care, and Consumer.','Industrials','Industrial Conglomerates'),('MRK','Merck & Co','11','USA','2000 Galloping Hill Road','','Kenilworth','NJ','7033','www.merck.com','1900-01-01','Merck & Co., Inc. provides healthcare solutions worldwide. It operates through four segments: Pharmaceutical, Animal Health, Healthcare Services, and Alliances.','Health Care','Pharmaceuticals'),('MSFT','Microsoft CORP','14','USA','One Microsoft Way','','Redmond','WA','98052','www.microsoft.com','1900-01-01','Microsoft Corporation develops, licenses, and supports software, services, devices, and solutions worldwide.','Information Technology','Software'),('NKE','Nike INC  -cl B','11','USA','One Bowerman Drive','','Beaverton','OR','97005','www.nike.com','1900-01-01','NIKE, Inc., together with its subsidiaries, designs, develops, markets, and sells athletic footwear, apparel, equipment, and accessories worldwide. The company offers NIKE brand products in six categories, including running, NIKE basketball, the Jordan brand, football, training, and sportswear.','Consumer Discretionary','Textiles, Apparel & Luxury Goods'),('PFE','Pfizer INC','11','USA','235 East 42nd Street','','New York','NY','10017','www.pfizer.com','1900-01-01','Pfizer Inc. develops, manufactures, and sells healthcare products worldwide.','Health Care','Pharmaceuticals'),('PG','Procter & Gamble Co','11','USA','One Procter & Gamble Plaza','','Cincinnati','OH','45202','www.pginvestor.com','1900-01-01','The Procter & Gamble Company provides branded consumer packaged goods to consumers in North and Latin America, Europe, the Asia Pacific, Greater China, India, the Middle East, and Africa.','Consumer Staples','Household Products'),('TRV','Travelers Cos INC','11','USA','485 Lexington Avenue','','New York','NY','10017','www.travelers.com','1996-04-22','The Travelers Companies, Inc., through its subsidiaries, provides a range of commercial and personal property, and casualty insurance products and services to businesses, government units, associations, and individuals in the United states and internationally.','Financials','Insurance'),('UNH','Unitedhealth Group INC','11','USA','UnitedHealth Group Center, 9900 Bren Road East','','Minnetonka','MN','55343','www.unitedhealthgroup.com','1900-01-01','UnitedHealth Group Incorporated operates as a diversified health care company in the United States. It operates through four segments: UnitedHealthcare, OptumHealth, OptumInsight, and OptumRx.','Health Care','Health Care Providers & Services'),('UTX','United Technologies CORP','11','USA','10 Farm Springs Road','','Farmington','CT','6032','www.utc.com','1900-01-01','United Technologies Corporation provides technology products and services to building systems and aerospace industries worldwide.','Industrials','Aerospace & Defense'),('V','Visa INC','11','USA','PO Box 8999','','San Francisco','CA','941282-8999','usa.visa.com','2008-03-19','Visa Inc. operates as a payments technology company worldwide. The company facilitates commerce through the transfer of value and information among consumers, merchants, financial institutions, businesses, strategic partners, and government entities.','Information Technology','IT Services'),('VZ','Verizon Communications INC','11','USA','1095 Avenue of the Americas','','New York','NY','10036','www.verizon.com','1900-01-01','Verizon Communications Inc., through its subsidiaries, offers communications, information, and entertainment products and services to consumers, businesses, and governmental agencies worldwide.','Communication Services','Diversified Telecommunication Services'),('WBA','Walgreens Boots Alliance INC','14','USA','108 Wilmot Road','','Deerfield','IL','60015','www.walgreensbootsalliance.com','1900-01-01','Walgreens Boots Alliance, Inc. operates as a pharmacy-led health and wellbeing company. It operates through three segments: Retail Pharmacy USA, Retail Pharmacy International, and Pharmaceutical Wholesale.','Consumer Staples','Food & Staples Retailing'),('WMT','Walmart INC','11','USA','702 SW 8th Street','','Bentonville','AR','72716','www.stock.walmart.com','1900-01-01','Walmart Inc. engages in the retail and wholesale operations in various formats worldwide. The company operates through three segments: Walmart U.S., Walmart International, and Sam\'s Club.','Consumer Staples','Food & Staples Retailing'),('XOM','Exxon Mobil CORP','11','USA','5959 Las Colinas Boulevard','','Irving','TX','75039','corporate.exxonmobil.com','1900-01-01','Exxon Mobil Corporation explores for and produces crude oil and natural gas in the United States, Canada/Other Americas, Europe, Africa, Asia, and Australia/Oceania. It operates through Upstream, Downstream, and Chemical segments.','Energy','Oil, Gas & Consumable Fuels');
/*!40000 ALTER TABLE `stock_stockprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_stockuniverse`
--

DROP TABLE IF EXISTS `stock_stockuniverse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_stockuniverse` (
  `name` varchar(20) NOT NULL,
  `desc` longtext NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_stockuniverse`
--

LOCK TABLES `stock_stockuniverse` WRITE;
/*!40000 ALTER TABLE `stock_stockuniverse` DISABLE KEYS */;
INSERT INTO `stock_stockuniverse` VALUES ('DOW30','Dow Jones 30 index'),('RUSSELL3000','Russell 3000 index'),('SP100','S&P large Cap 100 index'),('SP1500','S&P extended 1500 index'),('SP400','S&P small Cap 400 index'),('SP500','S&P large Cap 500 index'),('SP600','S&P medium Cap 600 index');
/*!40000 ALTER TABLE `stock_stockuniverse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_treemapcoordinate`
--

DROP TABLE IF EXISTS `stock_treemapcoordinate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_treemapcoordinate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x0` int(10) unsigned NOT NULL,
  `y0` int(10) unsigned NOT NULL,
  `x1` int(10) unsigned NOT NULL,
  `y1` int(10) unsigned NOT NULL,
  `data_id` varchar(20) NOT NULL,
  `profile_id` varchar(20) NOT NULL,
  `universe_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_treemapcoordin_data_id_60234920_fk_stock_sto` (`data_id`),
  KEY `stock_treemapcoordin_profile_id_dcf333be_fk_stock_sto` (`profile_id`),
  KEY `stock_treemapcoordin_universe_id_64136f87_fk_stock_sto` (`universe_id`),
  CONSTRAINT `stock_treemapcoordin_data_id_60234920_fk_stock_sto` FOREIGN KEY (`data_id`) REFERENCES `stock_stockdata` (`symbol`),
  CONSTRAINT `stock_treemapcoordin_profile_id_dcf333be_fk_stock_sto` FOREIGN KEY (`profile_id`) REFERENCES `stock_stockprofile` (`symbol`),
  CONSTRAINT `stock_treemapcoordin_universe_id_64136f87_fk_stock_sto` FOREIGN KEY (`universe_id`) REFERENCES `stock_stockuniverse` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_treemapcoordinate`
--

LOCK TABLES `stock_treemapcoordinate` WRITE;
/*!40000 ALTER TABLE `stock_treemapcoordinate` DISABLE KEYS */;
INSERT INTO `stock_treemapcoordinate` VALUES (1,1,1,330,308,'MSFT','MSFT','DOW30'),(2,1,310,330,599,'AAPL','AAPL','DOW30'),(3,332,1,508,205,'JPM','JPM','DOW30'),(4,510,1,656,205,'PG','PG','DOW30'),(5,658,1,799,205,'XOM','XOM','DOW30'),(6,332,207,467,419,'V','V','DOW30'),(7,332,421,467,599,'HD','HD','DOW30'),(8,469,207,641,344,'VZ','VZ','DOW30'),(9,643,207,799,344,'INTC','INTC','DOW30'),(10,469,346,605,485,'PFE','PFE','DOW30'),(11,469,487,605,599,'MCD','MCD','DOW30'),(12,607,346,707,466,'IBM','IBM','DOW30'),(13,709,346,799,466,'NKE','NKE','DOW30'),(14,607,468,677,599,'AXP','AXP','DOW30'),(15,679,468,799,542,'MMM','MMM','DOW30'),(16,679,544,799,599,'CAT','CAT','DOW30'),(17,1,1,379,308,'MSFT','MSFT','SP100'),(18,1,310,379,599,'AAPL','AAPL','SP100'),(19,381,1,609,145,'V','V','SP100'),(20,611,1,799,145,'VZ','VZ','SP100'),(21,381,147,524,319,'INTC','INTC','SP100'),(22,526,147,662,319,'BA','BA','SP100'),(23,664,147,799,319,'MRK','MRK','SP100'),(24,381,321,542,461,'CSCO','CSCO','SP100'),(25,381,463,542,599,'PFE','PFE','SP100'),(26,544,321,675,426,'IBM','IBM','SP100'),(27,677,321,799,426,'UTX','UTX','SP100'),(28,544,428,680,519,'NKE','NKE','SP100'),(29,544,521,680,599,'AXP','AXP','SP100'),(30,682,428,799,496,'GS','GS','SP100'),(31,682,498,757,599,'CAT','CAT','SP100'),(32,759,498,799,599,'TRV','TRV','SP100'),(33,1,1,324,434,'AAPL','AAPL','SP500'),(34,1,436,324,599,'JPM','JPM','SP500'),(35,326,1,605,171,'JNJ','JNJ','SP500'),(36,607,1,799,171,'DIS','DIS','SP500'),(37,326,173,469,391,'CVX','CVX','SP500'),(38,326,393,469,599,'MRK','MRK','SP500'),(39,471,173,636,349,'CSCO','CSCO','SP500'),(40,638,173,799,349,'UNH','UNH','SP500'),(41,471,351,676,487,'PFE','PFE','SP500'),(42,471,489,676,599,'MCD','MCD','SP500'),(43,678,351,799,459,'MMM','MMM','SP500'),(44,678,461,799,542,'CAT','CAT','SP500'),(45,678,544,799,599,'WBA','WBA','SP500'),(46,1,1,281,441,'MSFT','MSFT','SP400'),(47,1,443,281,599,'JPM','JPM','SP400'),(48,283,1,475,205,'WMT','WMT','SP400'),(49,477,1,654,205,'PG','PG','SP400'),(50,656,1,799,205,'HD','HD','SP400'),(51,283,207,418,405,'KO','KO','SP400'),(52,283,407,418,599,'INTC','INTC','SP400'),(53,420,207,610,338,'BA','BA','SP400'),(54,612,207,799,338,'MRK','MRK','SP400'),(55,420,340,604,469,'CSCO','CSCO','SP400'),(56,420,471,604,599,'UNH','UNH','SP400'),(57,606,340,711,465,'NKE','NKE','SP400'),(58,713,340,799,465,'MMM','MMM','SP400'),(59,606,467,734,534,'GS','GS','SP400'),(60,606,536,734,599,'CAT','CAT','SP400'),(61,736,467,799,535,'TRV','TRV','SP400'),(62,736,537,799,599,'DOW','DOW','SP400'),(63,1,1,217,315,'JPM','JPM','SP600'),(64,1,317,217,599,'JNJ','JNJ','SP600'),(65,219,1,509,188,'XOM','XOM','SP600'),(66,511,1,799,188,'V','V','SP600'),(67,219,190,420,397,'KO','KO','SP600'),(68,219,399,420,599,'CVX','CVX','SP600'),(69,422,190,611,383,'UNH','UNH','SP600'),(70,613,190,799,383,'PFE','PFE','SP600'),(71,422,385,557,599,'MCD','MCD','SP600'),(72,559,385,664,599,'IBM','IBM','SP600'),(73,666,385,799,485,'GS','GS','SP600'),(74,666,487,743,599,'WBA','WBA','SP600'),(75,745,487,799,599,'DOW','DOW','SP600'),(76,1,1,310,308,'MSFT','MSFT','SP1500'),(77,1,310,310,599,'AAPL','AAPL','SP1500'),(78,312,1,490,191,'JPM','JPM','SP1500'),(79,492,1,650,191,'WMT','WMT','SP1500'),(80,652,1,799,191,'PG','PG','SP1500'),(81,312,193,469,335,'VZ','VZ','SP1500'),(82,312,337,469,469,'DIS','DIS','SP1500'),(83,312,471,469,599,'CVX','CVX','SP1500'),(84,471,193,638,313,'INTC','INTC','SP1500'),(85,640,193,799,313,'BA','BA','SP1500'),(86,471,315,599,457,'UNH','UNH','SP1500'),(87,471,459,599,599,'PFE','PFE','SP1500'),(88,601,315,711,446,'MCD','MCD','SP1500'),(89,713,315,799,446,'IBM','IBM','SP1500'),(90,601,448,726,531,'UTX','UTX','SP1500'),(91,601,533,726,599,'MMM','MMM','SP1500'),(92,728,448,799,507,'WBA','WBA','SP1500'),(93,728,509,799,555,'TRV','TRV','SP1500'),(94,728,557,799,599,'DOW','DOW','SP1500'),(95,1,1,314,434,'AAPL','AAPL','RUSSELL3000'),(96,1,436,314,599,'JPM','JPM','RUSSELL3000'),(97,316,1,571,181,'JNJ','JNJ','RUSSELL3000'),(98,573,1,799,181,'V','V','RUSSELL3000'),(99,316,183,479,391,'HD','HD','RUSSELL3000'),(100,316,393,479,599,'VZ','VZ','RUSSELL3000'),(101,481,183,643,372,'CVX','CVX','RUSSELL3000'),(102,645,183,799,372,'BA','BA','RUSSELL3000'),(103,481,374,605,599,'CSCO','CSCO','RUSSELL3000'),(104,607,374,713,523,'UTX','UTX','RUSSELL3000'),(105,715,374,799,523,'MMM','MMM','RUSSELL3000'),(106,607,525,735,599,'CAT','CAT','RUSSELL3000'),(107,737,525,799,599,'DOW','DOW','RUSSELL3000');
/*!40000 ALTER TABLE `stock_treemapcoordinate` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-06 18:17:53
