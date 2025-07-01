-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `sub41_addresses`
--

DROP TABLE IF EXISTS `sub41_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_addresses` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `addressLine3` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sub41_fk_cszzmiqbwntconefdtyopplmiwtkwdytosio` (`primaryOwnerId`),
  CONSTRAINT `sub41_fk_aiczuflxhfvtsrnlgpstjeosyivmfjlkgfvp` FOREIGN KEY (`id`) REFERENCES `sub41_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_cszzmiqbwntconefdtyopplmiwtkwdytosio` FOREIGN KEY (`primaryOwnerId`) REFERENCES `sub41_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_announcements`
--

DROP TABLE IF EXISTS `sub41_announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sub41_idx_utrsvrnvgjoyfmelpicuijapyvrdwviefcsz` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `sub41_idx_wywucbmzgoatfwluewaspygymphnvshkiwyh` (`dateRead`),
  KEY `sub41_fk_byqcgnlqnqjwznjokrenkvozgrujxjcnknke` (`pluginId`),
  CONSTRAINT `sub41_fk_byqcgnlqnqjwznjokrenkvozgrujxjcnknke` FOREIGN KEY (`pluginId`) REFERENCES `sub41_plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_morgxrseizvjihwlahktylolptaphrszwjgl` FOREIGN KEY (`userId`) REFERENCES `sub41_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_assetindexdata`
--

DROP TABLE IF EXISTS `sub41_assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sub41_idx_ydlfmuxeiqgzebhrbylekkiswgqtkhvgruvz` (`sessionId`,`volumeId`),
  KEY `sub41_idx_olpnrmypvvqhjbnuzsakcvodxuroanetrenb` (`volumeId`),
  CONSTRAINT `sub41_fk_fukbzstmuuiyqbsnxwbuudmtrivcpjfrvxlg` FOREIGN KEY (`volumeId`) REFERENCES `sub41_volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_vjsbhteypqsfxtwrxxlhdhrdeqnzwynfyqyn` FOREIGN KEY (`sessionId`) REFERENCES `sub41_assetindexingsessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_assetindexingsessions`
--

DROP TABLE IF EXISTS `sub41_assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_assets`
--

DROP TABLE IF EXISTS `sub41_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sub41_idx_lnvifglwqunjyblqunmjjclmhyvcmiqcsxhx` (`filename`,`folderId`),
  KEY `sub41_idx_rvwozzxffoyuzfeuktxgymfozupktvskxmye` (`folderId`),
  KEY `sub41_idx_ceplypwodijxxbqnlvhpwgdnmwskazoxzyfj` (`volumeId`),
  KEY `sub41_fk_broowqyssvrekuejjhxodsluwiuaajhbcbji` (`uploaderId`),
  CONSTRAINT `sub41_fk_broowqyssvrekuejjhxodsluwiuaajhbcbji` FOREIGN KEY (`uploaderId`) REFERENCES `sub41_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `sub41_fk_qtaamhfqhsjczupltmgyiifiskledjhaiwig` FOREIGN KEY (`id`) REFERENCES `sub41_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_tycrplmazsxmixmlveiwieblbjzvqwchuhcr` FOREIGN KEY (`folderId`) REFERENCES `sub41_volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_vnrewpdkplriyoayyhzyqayrzdqzxgepvsvq` FOREIGN KEY (`volumeId`) REFERENCES `sub41_volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_assets_sites`
--

DROP TABLE IF EXISTS `sub41_assets_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_assets_sites` (
  `assetId` int NOT NULL,
  `siteId` int NOT NULL,
  `alt` text,
  PRIMARY KEY (`assetId`,`siteId`),
  KEY `sub41_fk_wrfcpvowdqwpwwipyrymtefqyrogpondqdzt` (`siteId`),
  CONSTRAINT `sub41_fk_jkedonuvcnaysdwagufvwqxchwapfxzsaqya` FOREIGN KEY (`assetId`) REFERENCES `sub41_assets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_wrfcpvowdqwpwwipyrymtefqyrogpondqdzt` FOREIGN KEY (`siteId`) REFERENCES `sub41_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_authenticator`
--

DROP TABLE IF EXISTS `sub41_authenticator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_authenticator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `auth2faSecret` varchar(255) DEFAULT NULL,
  `oldTimestamp` int unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sub41_fk_gwhpedxgwlvxxzwzclfpongzuggwxjewsirr` (`userId`),
  CONSTRAINT `sub41_fk_gwhpedxgwlvxxzwzclfpongzuggwxjewsirr` FOREIGN KEY (`userId`) REFERENCES `sub41_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_bulkopevents`
--

DROP TABLE IF EXISTS `sub41_bulkopevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_bulkopevents` (
  `key` char(10) NOT NULL,
  `senderClass` varchar(255) NOT NULL,
  `eventName` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`key`,`senderClass`,`eventName`),
  KEY `sub41_idx_njdcfvfyaplpclerknoyxzajtzkdzvxqnukf` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_categories`
--

DROP TABLE IF EXISTS `sub41_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sub41_idx_ggcsqxhecssdfppcvlkuklrolmldonmbirpu` (`groupId`),
  KEY `sub41_fk_djwbshemzznvzrefylnmprbrnscvbbdhygxp` (`parentId`),
  CONSTRAINT `sub41_fk_djwbshemzznvzrefylnmprbrnscvbbdhygxp` FOREIGN KEY (`parentId`) REFERENCES `sub41_categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `sub41_fk_qfowuhlscqwtbecpuekungvhlmsctngoylbz` FOREIGN KEY (`groupId`) REFERENCES `sub41_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_twbtfajtiubyrzmzoweqzriogfwmgousczmf` FOREIGN KEY (`id`) REFERENCES `sub41_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_categorygroups`
--

DROP TABLE IF EXISTS `sub41_categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sub41_idx_kofnravxbkwrosukbvwyiumoqloilwaqchqa` (`name`),
  KEY `sub41_idx_vqytvrrdfnzudbapeucdqavjypjuyqeafdja` (`handle`),
  KEY `sub41_idx_cvugvzwgzirlkolbremptsbbbiufustdcoap` (`structureId`),
  KEY `sub41_idx_avotuhhjdhkcxtouwfeqiqygdnvshdtksqth` (`fieldLayoutId`),
  KEY `sub41_idx_pdpiovnxvjnediimhvdelrurkvjgdusewyxe` (`dateDeleted`),
  CONSTRAINT `sub41_fk_thdyiirxilqhwdrwtntnjwvedtmctrivzjzn` FOREIGN KEY (`structureId`) REFERENCES `sub41_structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_tqpghhfayrfgsudrjsvztwkcjjgztfrzopag` FOREIGN KEY (`fieldLayoutId`) REFERENCES `sub41_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_categorygroups_sites`
--

DROP TABLE IF EXISTS `sub41_categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub41_idx_bcokuewlpuxmnwmpootiejmtxtznpxlqyrge` (`groupId`,`siteId`),
  KEY `sub41_idx_zipwbfxlddnpanaeyyykyuhkboafalncndgd` (`siteId`),
  CONSTRAINT `sub41_fk_aeivfizajjumqnygnvzextotsnlbkjimoxvl` FOREIGN KEY (`siteId`) REFERENCES `sub41_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sub41_fk_kcgjwourooztcexviezecqphjlavgnjstmgb` FOREIGN KEY (`groupId`) REFERENCES `sub41_categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_changedattributes`
--

DROP TABLE IF EXISTS `sub41_changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `sub41_idx_etucjgkwdgahgzxfperxryxvwmymybvswqcs` (`elementId`,`siteId`,`dateUpdated`),
  KEY `sub41_fk_yjdmrindnhwpwjlcljuufzghylwavwooueam` (`siteId`),
  KEY `sub41_fk_xvbcamcodbkouoyvtvgjgpxmgmiukxmghtas` (`userId`),
  CONSTRAINT `sub41_fk_fzozkruymwhjwrtfykfcwuqohvleawutfyjk` FOREIGN KEY (`elementId`) REFERENCES `sub41_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sub41_fk_xvbcamcodbkouoyvtvgjgpxmgmiukxmghtas` FOREIGN KEY (`userId`) REFERENCES `sub41_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sub41_fk_yjdmrindnhwpwjlcljuufzghylwavwooueam` FOREIGN KEY (`siteId`) REFERENCES `sub41_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_changedfields`
--

DROP TABLE IF EXISTS `sub41_changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `layoutElementUid` char(36) NOT NULL DEFAULT '0',
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`,`layoutElementUid`),
  KEY `sub41_idx_ncfnmgewkezrswcaupmjlxobuyscrjexslwi` (`elementId`,`siteId`,`dateUpdated`),
  KEY `sub41_fk_nygzgcwjcyuelzrmatyrigbhryatpaxnphxi` (`siteId`),
  KEY `sub41_fk_mhpmqsslgrmltykcibjiyxkjbtckzkvtzwaf` (`fieldId`),
  KEY `sub41_fk_phpsutnveicnomaacgzlyijpfqggbfdhehhz` (`userId`),
  CONSTRAINT `sub41_fk_mhpmqsslgrmltykcibjiyxkjbtckzkvtzwaf` FOREIGN KEY (`fieldId`) REFERENCES `sub41_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sub41_fk_nygzgcwjcyuelzrmatyrigbhryatpaxnphxi` FOREIGN KEY (`siteId`) REFERENCES `sub41_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sub41_fk_phpsutnveicnomaacgzlyijpfqggbfdhehhz` FOREIGN KEY (`userId`) REFERENCES `sub41_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sub41_fk_rmrwlaoklaogsweskduoikriszsyfnvyyodm` FOREIGN KEY (`elementId`) REFERENCES `sub41_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_craftidtokens`
--

DROP TABLE IF EXISTS `sub41_craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sub41_fk_jrpshavkdzyqpvqnpqpwwhqrlxdpsijdqslm` (`userId`),
  CONSTRAINT `sub41_fk_jrpshavkdzyqpvqnpqpwwhqrlxdpsijdqslm` FOREIGN KEY (`userId`) REFERENCES `sub41_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_deprecationerrors`
--

DROP TABLE IF EXISTS `sub41_deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text,
  `traces` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub41_idx_ydrbpcfqzzchguorxuurnbhtavbwgzrpovik` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_drafts`
--

DROP TABLE IF EXISTS `sub41_drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `sub41_idx_jdlytoidjwzdnqozvxvymwlekawhciklqlqe` (`creatorId`,`provisional`),
  KEY `sub41_idx_hhgspadnvwjohkkyzzzwoorgcewsvyyoxlzq` (`saved`),
  KEY `sub41_fk_cgyiuvmlmlzzmskmkcdahdnnjwddarkkyxkz` (`canonicalId`),
  CONSTRAINT `sub41_fk_cgyiuvmlmlzzmskmkcdahdnnjwddarkkyxkz` FOREIGN KEY (`canonicalId`) REFERENCES `sub41_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_fwfyidrgkdhdlaqhnbmqytrmobddlwrvupst` FOREIGN KEY (`creatorId`) REFERENCES `sub41_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_elementactivity`
--

DROP TABLE IF EXISTS `sub41_elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `sub41_idx_sjnhdkbctfsdeyoqbfsojrxdpkzgvduqevrw` (`elementId`,`timestamp`,`userId`),
  KEY `sub41_fk_urbxfqiuegzgmbuwjtyuooznswspxewyxaia` (`userId`),
  KEY `sub41_fk_rdyiqiacytubbbchnndewjcssobchdpgplsn` (`siteId`),
  KEY `sub41_fk_xrbihtpgwyyyxbjwqpnnjqafzcpyaovedanp` (`draftId`),
  CONSTRAINT `sub41_fk_muzzvcdlvuzyegxrgxnqljpqucoqiulefibl` FOREIGN KEY (`elementId`) REFERENCES `sub41_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_rdyiqiacytubbbchnndewjcssobchdpgplsn` FOREIGN KEY (`siteId`) REFERENCES `sub41_sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_urbxfqiuegzgmbuwjtyuooznswspxewyxaia` FOREIGN KEY (`userId`) REFERENCES `sub41_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_xrbihtpgwyyyxbjwqpnnjqafzcpyaovedanp` FOREIGN KEY (`draftId`) REFERENCES `sub41_drafts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_elements`
--

DROP TABLE IF EXISTS `sub41_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sub41_idx_yhzobyhmteihcvdzzxpjuyadswolxrcrdvrl` (`dateDeleted`),
  KEY `sub41_idx_tvyrjwucqwuwhqvwcqnrtoimuuhcthtaipkm` (`fieldLayoutId`),
  KEY `sub41_idx_asoffhkympmsusvbncwyodqggmikgzdcbsds` (`type`),
  KEY `sub41_idx_ldnotizpcpqhcqmaywsgbpquukpeqbsnpepp` (`enabled`),
  KEY `sub41_idx_koksohxwydxylqbsfdbjdkydculmuyjfrurx` (`canonicalId`),
  KEY `sub41_idx_zvxflayoxddvlmocryzpfdvcjrgtcslgaqta` (`archived`,`dateCreated`),
  KEY `sub41_idx_dpduipvnoeyturjlfgwlpcimwjtzcawuhztl` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `sub41_idx_pnwaxstyoyhzcpgbrrxrprhwddumslvbdciv` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `sub41_fk_tnyajyiixdabrdmpooxxtkkterwkrydovmll` (`draftId`),
  KEY `sub41_fk_zpreielccpjhyjptkqwzyzcesmwtthpfbxac` (`revisionId`),
  CONSTRAINT `sub41_fk_egiqnybydmtuzlbhllnuohebbzuemyzyhnjh` FOREIGN KEY (`fieldLayoutId`) REFERENCES `sub41_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `sub41_fk_tjucbkbixtsunnebzixkkttjtmbyoflrwzxb` FOREIGN KEY (`canonicalId`) REFERENCES `sub41_elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `sub41_fk_tnyajyiixdabrdmpooxxtkkterwkrydovmll` FOREIGN KEY (`draftId`) REFERENCES `sub41_drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_zpreielccpjhyjptkqwzyzcesmwtthpfbxac` FOREIGN KEY (`revisionId`) REFERENCES `sub41_revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=458 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_elements_bulkops`
--

DROP TABLE IF EXISTS `sub41_elements_bulkops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_elements_bulkops` (
  `elementId` int NOT NULL,
  `key` char(10) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`elementId`,`key`),
  KEY `sub41_idx_pazpmhzwjqkbayhkvwbbqzktwkdbxdsnkege` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_elements_owners`
--

DROP TABLE IF EXISTS `sub41_elements_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_elements_owners` (
  `elementId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`elementId`,`ownerId`),
  KEY `sub41_fk_nzmzaxqtshaalwiankoagrmllmvjpebcalvp` (`ownerId`),
  CONSTRAINT `sub41_fk_iealzddybegnekneijzgtzsqxkwqvnqmlnqj` FOREIGN KEY (`elementId`) REFERENCES `sub41_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_nzmzaxqtshaalwiankoagrmllmvjpebcalvp` FOREIGN KEY (`ownerId`) REFERENCES `sub41_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_elements_sites`
--

DROP TABLE IF EXISTS `sub41_elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `content` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub41_idx_neflfocjjfaxprgzfbrbvooeezaqiypmkbcf` (`elementId`,`siteId`),
  KEY `sub41_idx_vzhwvnuzbyxxadevwktvjrnofdvrwcymctdz` (`siteId`),
  KEY `sub41_idx_yezjcnublhlurmcuasmaykfgbipkqjpywypd` (`title`,`siteId`),
  KEY `sub41_idx_hbwfdobtuogvnllamxfsydhzwdyucljiqidc` (`slug`,`siteId`),
  KEY `sub41_idx_vlwrvczltltrykmwgykplvndeixfaadbefln` (`enabled`),
  KEY `sub41_idx_onajxgyqmyzuwmrogltusfufsblzkvuhltln` (`uri`,`siteId`),
  CONSTRAINT `sub41_fk_fiynfhgyfxwupmvxolfybekzrfnuhzbdlxtm` FOREIGN KEY (`elementId`) REFERENCES `sub41_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_gekzjynlmjaxbcgvdobkamospnrywzygjzoy` FOREIGN KEY (`siteId`) REFERENCES `sub41_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=458 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_entries`
--

DROP TABLE IF EXISTS `sub41_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_entries` (
  `id` int NOT NULL,
  `sectionId` int DEFAULT NULL,
  `parentId` int DEFAULT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `status` enum('live','pending','expired') NOT NULL DEFAULT 'live',
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `deletedWithSection` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sub41_idx_arwqjkuwuithiscsdzcoiqonnxkmqrlxuomt` (`postDate`),
  KEY `sub41_idx_hfrcgicxfayttpbrnajplwjxmpyaqrgrtvcu` (`expiryDate`),
  KEY `sub41_idx_wpszpmzgrgynrvcdduqukeldgecvvakfqhcr` (`status`),
  KEY `sub41_idx_loemzdftpzinpcsmmwgrdntmanqbpvmdohmk` (`sectionId`),
  KEY `sub41_idx_cduxgxzsfqjbcnxfsqmlxgolaoxokxvnpnsa` (`typeId`),
  KEY `sub41_idx_itufpwvflzzogcmmbanliqkakrnscwqhecda` (`primaryOwnerId`),
  KEY `sub41_idx_udrygkynietiivfbjwgasjrsxyqyjxuafojg` (`fieldId`),
  KEY `sub41_fk_tjzvpedxapmgkifgntmwqtslnsnxwbkhbaxx` (`parentId`),
  CONSTRAINT `sub41_fk_bavpukukmmfoxylyjtmxcxpqjaxcpqcsjppj` FOREIGN KEY (`id`) REFERENCES `sub41_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_bcabohzjhbqjcyxlbfqtlzhhsmqizqbigkna` FOREIGN KEY (`fieldId`) REFERENCES `sub41_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_ctsjymykihxwpiqualpjecaemxjhdvpcbine` FOREIGN KEY (`sectionId`) REFERENCES `sub41_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_mgagmekqolslxurgnrbgjwmissdtbrwgpevz` FOREIGN KEY (`typeId`) REFERENCES `sub41_entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_tjzvpedxapmgkifgntmwqtslnsnxwbkhbaxx` FOREIGN KEY (`parentId`) REFERENCES `sub41_entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `sub41_fk_yzvsquljfqoyjsrdtvheifdwzbrswpzwdbwm` FOREIGN KEY (`primaryOwnerId`) REFERENCES `sub41_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_entries_authors`
--

DROP TABLE IF EXISTS `sub41_entries_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_entries_authors` (
  `entryId` int NOT NULL,
  `authorId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`entryId`,`authorId`),
  KEY `sub41_idx_jbtpexvldisxtwpojjmbhkhihemlrtocnrdw` (`authorId`),
  KEY `sub41_idx_udcbyubkbwqfmhabwfpfycffiflflhsszfge` (`entryId`,`sortOrder`),
  CONSTRAINT `sub41_fk_jttuiiucxyascttfqrjvxggvxhypjdpjcvcg` FOREIGN KEY (`authorId`) REFERENCES `sub41_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_zpkcvsjmkxecqeqcuygfeyjircuhzxivfvho` FOREIGN KEY (`entryId`) REFERENCES `sub41_entries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_entrytypes`
--

DROP TABLE IF EXISTS `sub41_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `showSlugField` tinyint(1) DEFAULT '1',
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text,
  `showStatusField` tinyint(1) DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sub41_idx_oadvskkqpxytbzpcnvtgnsgpdahkhdsfoebd` (`fieldLayoutId`),
  KEY `sub41_idx_qmmieptnhefwiiygnwnailwqieavltaxqisv` (`dateDeleted`),
  CONSTRAINT `sub41_fk_ksqihyqrhruszobtcerzyalkdtchfmjpeiny` FOREIGN KEY (`fieldLayoutId`) REFERENCES `sub41_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_fieldlayouts`
--

DROP TABLE IF EXISTS `sub41_fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `config` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sub41_idx_tjlyjejjclqarybhrjyjmfruoouxuczqgbpy` (`dateDeleted`),
  KEY `sub41_idx_riiscaxkfdceptzjxukhcyqwiyeohbiiekhz` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_fields`
--

DROP TABLE IF EXISTS `sub41_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sub41_idx_ntcsqwvpecjjtrdhxoazgoyxxgfkoicrvjwt` (`handle`,`context`),
  KEY `sub41_idx_eilbqzlftbyqsvjwwpwfdymvlezfuaaazygy` (`context`),
  KEY `sub41_idx_thpjyczwurinytvuzqboooijjwrdgribjkwa` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_crm_fields`
--

DROP TABLE IF EXISTS `sub41_freeform_crm_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_crm_fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `integrationId` int NOT NULL,
  `label` text NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `required` tinyint(1) DEFAULT '0',
  `options` longtext,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_crm_fields_type_idx` (`type`),
  KEY `freeform_crm_fields_integrationId_category_idx` (`integrationId`,`category`),
  CONSTRAINT `freeform_crm_fields_integrationId_fk` FOREIGN KEY (`integrationId`) REFERENCES `sub41_freeform_integrations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_email_marketing_fields`
--

DROP TABLE IF EXISTS `sub41_freeform_email_marketing_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_email_marketing_fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mailingListId` int NOT NULL,
  `label` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `required` tinyint(1) DEFAULT '0',
  `options` longtext,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_email_marketing_fields_type_idx` (`type`),
  KEY `freeform_email_marketing_fields_mailingListId_category_idx` (`mailingListId`,`category`),
  CONSTRAINT `freeform_email_marketing_fields_mailingListId_fk` FOREIGN KEY (`mailingListId`) REFERENCES `sub41_freeform_email_marketing_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_email_marketing_lists`
--

DROP TABLE IF EXISTS `sub41_freeform_email_marketing_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_email_marketing_lists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `integrationId` int NOT NULL,
  `resourceId` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `memberCount` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `freeform_email_marketing_lists_integrationId_resourceId_unq_idx` (`integrationId`,`resourceId`),
  CONSTRAINT `freeform_email_marketing_lists_integrationId_fk` FOREIGN KEY (`integrationId`) REFERENCES `sub41_freeform_integrations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_export_notifications`
--

DROP TABLE IF EXISTS `sub41_freeform_export_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_export_notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `profileId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `fileType` varchar(30) NOT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `frequency` varchar(20) NOT NULL,
  `recipients` longtext NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `freeform_export_notifications_profileId_fk` (`profileId`),
  CONSTRAINT `freeform_export_notifications_profileId_fk` FOREIGN KEY (`profileId`) REFERENCES `sub41_freeform_export_profiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_export_profiles`
--

DROP TABLE IF EXISTS `sub41_freeform_export_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_export_profiles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `formId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `limit` int DEFAULT NULL,
  `dateRange` varchar(255) DEFAULT NULL,
  `rangeStart` varchar(255) DEFAULT NULL,
  `rangeEnd` varchar(255) DEFAULT NULL,
  `fields` longtext NOT NULL,
  `filters` longtext,
  `statuses` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `freeform_export_profiles_formId_fk` (`formId`),
  CONSTRAINT `freeform_export_profiles_formId_fk` FOREIGN KEY (`formId`) REFERENCES `sub41_freeform_forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_export_settings`
--

DROP TABLE IF EXISTS `sub41_freeform_export_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_export_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `setting` longtext,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_export_settings_userId_fk` (`userId`),
  CONSTRAINT `freeform_export_settings_userId_fk` FOREIGN KEY (`userId`) REFERENCES `sub41_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_favorite_fields`
--

DROP TABLE IF EXISTS `sub41_freeform_favorite_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_favorite_fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `metadata` longtext,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_favorite_fields_userId_fk` (`userId`),
  CONSTRAINT `freeform_favorite_fields_userId_fk` FOREIGN KEY (`userId`) REFERENCES `sub41_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_feed_messages`
--

DROP TABLE IF EXISTS `sub41_freeform_feed_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_feed_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `feedId` int NOT NULL,
  `message` text NOT NULL,
  `conditions` longtext NOT NULL,
  `type` varchar(255) NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `issueDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_feed_messages_feedId_fk` (`feedId`),
  CONSTRAINT `freeform_feed_messages_feedId_fk` FOREIGN KEY (`feedId`) REFERENCES `sub41_freeform_feeds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_feeds`
--

DROP TABLE IF EXISTS `sub41_freeform_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_feeds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hash` varchar(255) NOT NULL,
  `min` varchar(255) DEFAULT NULL,
  `max` varchar(255) DEFAULT NULL,
  `issueDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `freeform_feeds_hash_unq_idx` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_fields_type_groups`
--

DROP TABLE IF EXISTS `sub41_freeform_fields_type_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_fields_type_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `color` varchar(10) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `types` longtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_forms`
--

DROP TABLE IF EXISTS `sub41_freeform_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_forms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL,
  `name` varchar(100) NOT NULL,
  `handle` varchar(100) NOT NULL,
  `spamBlockCount` int unsigned NOT NULL DEFAULT '0',
  `metadata` longtext,
  `order` int DEFAULT NULL,
  `createdByUserId` int DEFAULT NULL,
  `updatedByUserId` int DEFAULT NULL,
  `dateArchived` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`),
  KEY `freeform_forms_order_idx` (`order`),
  KEY `freeform_forms_createdByUserId_fk` (`createdByUserId`),
  KEY `freeform_forms_updatedByUserId_fk` (`updatedByUserId`),
  CONSTRAINT `freeform_forms_createdByUserId_fk` FOREIGN KEY (`createdByUserId`) REFERENCES `sub41_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `freeform_forms_updatedByUserId_fk` FOREIGN KEY (`updatedByUserId`) REFERENCES `sub41_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_forms_fields`
--

DROP TABLE IF EXISTS `sub41_freeform_forms_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_forms_fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `formId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `metadata` longtext,
  `rowId` int DEFAULT NULL,
  `order` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_forms_fields_rowId_order_idx` (`rowId`,`order`),
  KEY `freeform_forms_fields_formId_fk` (`formId`),
  CONSTRAINT `freeform_forms_fields_formId_fk` FOREIGN KEY (`formId`) REFERENCES `sub41_freeform_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `freeform_forms_fields_rowId_fk` FOREIGN KEY (`rowId`) REFERENCES `sub41_freeform_forms_rows` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_forms_groups`
--

DROP TABLE IF EXISTS `sub41_freeform_forms_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_forms_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteId` int NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `order` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_forms_groups_siteId_fk` (`siteId`),
  CONSTRAINT `freeform_forms_groups_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sub41_sites` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_forms_groups_entries`
--

DROP TABLE IF EXISTS `sub41_freeform_forms_groups_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_forms_groups_entries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `formId` int NOT NULL,
  `order` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_forms_groups_entries_groupId_fk` (`groupId`),
  KEY `freeform_forms_groups_entries_formId_fk` (`formId`),
  CONSTRAINT `freeform_forms_groups_entries_formId_fk` FOREIGN KEY (`formId`) REFERENCES `sub41_freeform_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `freeform_forms_groups_entries_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `sub41_freeform_forms_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_forms_integrations`
--

DROP TABLE IF EXISTS `sub41_freeform_forms_integrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_forms_integrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `integrationId` int NOT NULL,
  `formId` int NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `metadata` longtext,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_forms_integrations_integrationId_fk` (`integrationId`),
  KEY `freeform_forms_integrations_formId_fk` (`formId`),
  CONSTRAINT `freeform_forms_integrations_formId_fk` FOREIGN KEY (`formId`) REFERENCES `sub41_freeform_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `freeform_forms_integrations_integrationId_fk` FOREIGN KEY (`integrationId`) REFERENCES `sub41_freeform_integrations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_forms_layouts`
--

DROP TABLE IF EXISTS `sub41_freeform_forms_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_forms_layouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `formId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_forms_layouts_formId_idx` (`formId`),
  CONSTRAINT `freeform_forms_layouts_formId_fk` FOREIGN KEY (`formId`) REFERENCES `sub41_freeform_forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_forms_notifications`
--

DROP TABLE IF EXISTS `sub41_freeform_forms_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_forms_notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `class` varchar(255) NOT NULL,
  `formId` int NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `metadata` longtext,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_forms_notifications_formId_fk` (`formId`),
  CONSTRAINT `freeform_forms_notifications_formId_fk` FOREIGN KEY (`formId`) REFERENCES `sub41_freeform_forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_forms_pages`
--

DROP TABLE IF EXISTS `sub41_freeform_forms_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_forms_pages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `formId` int NOT NULL,
  `layoutId` int NOT NULL,
  `label` varchar(255) NOT NULL,
  `order` int DEFAULT NULL,
  `metadata` longtext,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_forms_pages_formId_order_idx` (`formId`,`order`),
  KEY `freeform_forms_pages_layoutId_fk` (`layoutId`),
  CONSTRAINT `freeform_forms_pages_formId_fk` FOREIGN KEY (`formId`) REFERENCES `sub41_freeform_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `freeform_forms_pages_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `sub41_freeform_forms_layouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_forms_rows`
--

DROP TABLE IF EXISTS `sub41_freeform_forms_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_forms_rows` (
  `id` int NOT NULL AUTO_INCREMENT,
  `formId` int NOT NULL,
  `layoutId` int NOT NULL,
  `order` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_forms_rows_formId_order_idx` (`formId`,`order`),
  KEY `freeform_forms_rows_layoutId_fk` (`layoutId`),
  CONSTRAINT `freeform_forms_rows_formId_fk` FOREIGN KEY (`formId`) REFERENCES `sub41_freeform_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `freeform_forms_rows_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `sub41_freeform_forms_layouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_forms_sites`
--

DROP TABLE IF EXISTS `sub41_freeform_forms_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_forms_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `formId` int NOT NULL,
  `siteId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `freeform_forms_sites_siteId_formId_unq_idx` (`siteId`,`formId`),
  KEY `freeform_forms_sites_formId_fk` (`formId`),
  CONSTRAINT `freeform_forms_sites_formId_fk` FOREIGN KEY (`formId`) REFERENCES `sub41_freeform_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `freeform_forms_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sub41_sites` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_forms_translations`
--

DROP TABLE IF EXISTS `sub41_freeform_forms_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_forms_translations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `formId` int NOT NULL,
  `siteId` int NOT NULL,
  `translations` longtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `freeform_forms_translations_formId_siteId_unq_idx` (`formId`,`siteId`),
  KEY `freeform_forms_translations_siteId_fk` (`siteId`),
  CONSTRAINT `freeform_forms_translations_formId_fk` FOREIGN KEY (`formId`) REFERENCES `sub41_freeform_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `freeform_forms_translations_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sub41_sites` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_integrations`
--

DROP TABLE IF EXISTS `sub41_freeform_integrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_integrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `enabled` tinyint(1) DEFAULT '1',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `class` varchar(255) DEFAULT NULL,
  `metadata` longtext,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`),
  KEY `freeform_integrations_type_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_integrations_queue`
--

DROP TABLE IF EXISTS `sub41_freeform_integrations_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_integrations_queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `submissionId` int NOT NULL,
  `integrationType` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `fieldHash` varchar(20) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_integrations_queue_status_idx` (`status`),
  KEY `freeform_integrations_queue_submissionId_fk` (`submissionId`),
  CONSTRAINT `freeform_integrations_queue_submissionId_fk` FOREIGN KEY (`submissionId`) REFERENCES `sub41_freeform_submissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_limited_users`
--

DROP TABLE IF EXISTS `sub41_freeform_limited_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_limited_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `settings` longtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_notification_log`
--

DROP TABLE IF EXISTS `sub41_freeform_notification_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_notification_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_notification_log_type_dateCreated_idx` (`type`,`dateCreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_notification_templates`
--

DROP TABLE IF EXISTS `sub41_freeform_notification_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_notification_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pdfTemplateIds` text,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `description` text,
  `fromName` varchar(255) NOT NULL,
  `fromEmail` varchar(255) NOT NULL,
  `replyToName` varchar(255) DEFAULT NULL,
  `replyToEmail` varchar(255) DEFAULT NULL,
  `cc` varchar(255) DEFAULT NULL,
  `bcc` varchar(255) DEFAULT NULL,
  `bodyHtml` mediumtext,
  `bodyText` mediumtext,
  `autoText` tinyint(1) NOT NULL DEFAULT '1',
  `includeAttachments` tinyint(1) DEFAULT '1',
  `presetAssets` varchar(255) DEFAULT NULL,
  `sortOrder` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_payments`
--

DROP TABLE IF EXISTS `sub41_freeform_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `integrationId` int NOT NULL,
  `fieldId` int NOT NULL,
  `submissionId` int NOT NULL,
  `resourceId` varchar(50) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `status` varchar(40) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `metadata` longtext,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `freeform_payments_integrationId_resourceId_unq_idx` (`integrationId`,`resourceId`),
  KEY `freeform_payments_integrationId_type_idx` (`integrationId`,`type`),
  KEY `freeform_payments_resourceId_idx` (`resourceId`),
  KEY `freeform_payments_fieldId_fk` (`fieldId`),
  KEY `freeform_payments_submissionId_fk` (`submissionId`),
  CONSTRAINT `freeform_payments_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `sub41_freeform_forms_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `freeform_payments_integrationId_fk` FOREIGN KEY (`integrationId`) REFERENCES `sub41_freeform_integrations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `freeform_payments_submissionId_fk` FOREIGN KEY (`submissionId`) REFERENCES `sub41_freeform_submissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_pdf_templates`
--

DROP TABLE IF EXISTS `sub41_freeform_pdf_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_pdf_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `fileName` text NOT NULL,
  `body` longtext NOT NULL,
  `sortOrder` int NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_rules`
--

DROP TABLE IF EXISTS `sub41_freeform_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_rules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `combinator` varchar(20) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_rules_buttons`
--

DROP TABLE IF EXISTS `sub41_freeform_rules_buttons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_rules_buttons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pageId` int NOT NULL,
  `button` varchar(30) NOT NULL,
  `display` varchar(10) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sub41_fk_vskuakkgjzuxekdablnnqkazbzkfretslftz` (`pageId`),
  CONSTRAINT `sub41_fk_gqljzfmlbudtcttejipeoougfqnlinvakcre` FOREIGN KEY (`id`) REFERENCES `sub41_freeform_rules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sub41_fk_vskuakkgjzuxekdablnnqkazbzkfretslftz` FOREIGN KEY (`pageId`) REFERENCES `sub41_freeform_forms_pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_rules_conditions`
--

DROP TABLE IF EXISTS `sub41_freeform_rules_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_rules_conditions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ruleId` int NOT NULL,
  `fieldId` int NOT NULL,
  `operator` varchar(20) NOT NULL,
  `value` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_rules_conditions_ruleId_fk` (`ruleId`),
  KEY `sub41_fk_gqsmllxhodugkiwxtcrxwzfftkojjymebcoo` (`fieldId`),
  CONSTRAINT `freeform_rules_conditions_ruleId_fk` FOREIGN KEY (`ruleId`) REFERENCES `sub41_freeform_rules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sub41_fk_gqsmllxhodugkiwxtcrxwzfftkojjymebcoo` FOREIGN KEY (`fieldId`) REFERENCES `sub41_freeform_forms_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_rules_fields`
--

DROP TABLE IF EXISTS `sub41_freeform_rules_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_rules_fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `display` varchar(10) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sub41_fk_wohhlmiyrjbvpqpdvinkpomriqdpcpjcdbrk` (`fieldId`),
  CONSTRAINT `sub41_fk_wohhlmiyrjbvpqpdvinkpomriqdpcpjcdbrk` FOREIGN KEY (`fieldId`) REFERENCES `sub41_freeform_forms_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sub41_fk_xinppoiwzojtfvlccqsoyiamwiinqreoxwfi` FOREIGN KEY (`id`) REFERENCES `sub41_freeform_rules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_rules_notifications`
--

DROP TABLE IF EXISTS `sub41_freeform_rules_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_rules_notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `notificationId` int NOT NULL,
  `send` tinyint(1) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sub41_fk_hwausxxutzrtvlknnqtugkpltbhsnqyqbtjt` (`notificationId`),
  CONSTRAINT `sub41_fk_bfneawlbhuehxjipisekdidngdoqhbntaayg` FOREIGN KEY (`id`) REFERENCES `sub41_freeform_rules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sub41_fk_hwausxxutzrtvlknnqtugkpltbhsnqyqbtjt` FOREIGN KEY (`notificationId`) REFERENCES `sub41_freeform_forms_notifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_rules_pages`
--

DROP TABLE IF EXISTS `sub41_freeform_rules_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_rules_pages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pageId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sub41_fk_kihyxgymldykaanksrocbpdinddmsetnqynx` (`pageId`),
  CONSTRAINT `sub41_fk_aoqezfbuvgpdlkmyzrzwnkjjztgszwuuxqxl` FOREIGN KEY (`id`) REFERENCES `sub41_freeform_rules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sub41_fk_kihyxgymldykaanksrocbpdinddmsetnqynx` FOREIGN KEY (`pageId`) REFERENCES `sub41_freeform_forms_pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_rules_submit_form`
--

DROP TABLE IF EXISTS `sub41_freeform_rules_submit_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_rules_submit_form` (
  `id` int NOT NULL AUTO_INCREMENT,
  `formId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sub41_fk_vsjdqepcekjsscppyfohyigvhhinqzfcdoty` (`formId`),
  CONSTRAINT `sub41_fk_brmgulgercfkzpcaytabspwhjfjiqaoutskx` FOREIGN KEY (`id`) REFERENCES `sub41_freeform_rules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sub41_fk_vsjdqepcekjsscppyfohyigvhhinqzfcdoty` FOREIGN KEY (`formId`) REFERENCES `sub41_freeform_forms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_saved_forms`
--

DROP TABLE IF EXISTS `sub41_freeform_saved_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_saved_forms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(100) DEFAULT NULL,
  `formId` int NOT NULL,
  `token` varchar(100) NOT NULL,
  `payload` longtext,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_saved_forms_token_idx` (`token`),
  KEY `freeform_saved_forms_dateCreated_idx` (`dateCreated`),
  KEY `freeform_saved_forms_sessionId_idx` (`sessionId`),
  KEY `freeform_saved_forms_formId_fk` (`formId`),
  CONSTRAINT `freeform_saved_forms_formId_fk` FOREIGN KEY (`formId`) REFERENCES `sub41_freeform_forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_session_context`
--

DROP TABLE IF EXISTS `sub41_freeform_session_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_session_context` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contextKey` varchar(100) NOT NULL,
  `sessionId` varchar(100) NOT NULL,
  `formId` int NOT NULL,
  `propertyBag` longtext,
  `attributeBag` longtext,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_session_context_contextKey_formId_idx` (`contextKey`,`formId`),
  KEY `freeform_session_context_sessionId_idx` (`sessionId`),
  KEY `freeform_session_context_formId_fk` (`formId`),
  CONSTRAINT `freeform_session_context_formId_fk` FOREIGN KEY (`formId`) REFERENCES `sub41_freeform_forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_spam_reason`
--

DROP TABLE IF EXISTS `sub41_freeform_spam_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_spam_reason` (
  `id` int NOT NULL AUTO_INCREMENT,
  `submissionId` int NOT NULL,
  `reasonType` varchar(100) NOT NULL,
  `reasonMessage` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_spam_reason_submissionId_reasonType_idx` (`submissionId`,`reasonType`),
  CONSTRAINT `freeform_spam_reason_submissionId_fk` FOREIGN KEY (`submissionId`) REFERENCES `sub41_freeform_submissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_statuses`
--

DROP TABLE IF EXISTS `sub41_freeform_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_statuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `color` varchar(30) DEFAULT NULL,
  `sortOrder` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_submission_notes`
--

DROP TABLE IF EXISTS `sub41_freeform_submission_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_submission_notes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `submissionId` int NOT NULL,
  `note` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_submission_notes_submissionId_fk` (`submissionId`),
  CONSTRAINT `freeform_submission_notes_submissionId_fk` FOREIGN KEY (`submissionId`) REFERENCES `sub41_freeform_submissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_submissions`
--

DROP TABLE IF EXISTS `sub41_freeform_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_submissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `incrementalId` int NOT NULL,
  `userId` int DEFAULT NULL,
  `statusId` int DEFAULT NULL,
  `formId` int NOT NULL,
  `token` varchar(100) NOT NULL,
  `ip` varchar(46) DEFAULT NULL,
  `isSpam` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `freeform_submissions_incrementalId_unq_idx` (`incrementalId`),
  UNIQUE KEY `freeform_submissions_token_unq_idx` (`token`),
  KEY `freeform_submissions_userId_fk` (`userId`),
  KEY `freeform_submissions_formId_fk` (`formId`),
  KEY `freeform_submissions_statusId_fk` (`statusId`),
  CONSTRAINT `freeform_submissions_formId_fk` FOREIGN KEY (`formId`) REFERENCES `sub41_freeform_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `freeform_submissions_id_fk` FOREIGN KEY (`id`) REFERENCES `sub41_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `freeform_submissions_statusId_fk` FOREIGN KEY (`statusId`) REFERENCES `sub41_freeform_statuses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `freeform_submissions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `sub41_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_submissions_newsletter_form_1`
--

DROP TABLE IF EXISTS `sub41_freeform_submissions_newsletter_form_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_submissions_newsletter_form_1` (
  `id` int NOT NULL,
  `email_1` text,
  `checkbox_2` text,
  PRIMARY KEY (`id`),
  CONSTRAINT `sub41_fk_qfnvxlpzgtcdnqonllghrzkigpqkbkbcmlrz` FOREIGN KEY (`id`) REFERENCES `sub41_freeform_submissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_survey_preferences`
--

DROP TABLE IF EXISTS `sub41_freeform_survey_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_survey_preferences` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `fieldId` int NOT NULL,
  `chartType` varchar(200) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_survey_preferences_userId_fk` (`userId`),
  KEY `sub41_fk_ormejyimuekfbyizoxtbaysuorrmkyjcnmkt` (`fieldId`),
  CONSTRAINT `freeform_survey_preferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `sub41_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_ormejyimuekfbyizoxtbaysuorrmkyjcnmkt` FOREIGN KEY (`fieldId`) REFERENCES `sub41_freeform_forms_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_freeform_unfinalized_files`
--

DROP TABLE IF EXISTS `sub41_freeform_unfinalized_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_freeform_unfinalized_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `fieldHandle` varchar(255) DEFAULT NULL,
  `formToken` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_unfinalized_files_fieldHandle_formToken_idx` (`fieldHandle`,`formToken`),
  KEY `freeform_unfinalized_files_assetId_fk` (`assetId`),
  CONSTRAINT `freeform_unfinalized_files_assetId_fk` FOREIGN KEY (`assetId`) REFERENCES `sub41_assets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_globalsets`
--

DROP TABLE IF EXISTS `sub41_globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sub41_idx_oodvzcqsnszsxzjuxltbelszhxkyycjlpjvj` (`name`),
  KEY `sub41_idx_dnlthtktpwdtyscgesarrdjrjspbqtqyfhzd` (`handle`),
  KEY `sub41_idx_ehaqpuyycyenhtaoiglfbkahnhniaegkfkou` (`fieldLayoutId`),
  KEY `sub41_idx_tycgjphpsstsvoltuelkaangzummiagltrex` (`sortOrder`),
  CONSTRAINT `sub41_fk_fuwgtfeywnskddctrubenfgrdsjccoijplju` FOREIGN KEY (`id`) REFERENCES `sub41_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_nmzoqclcdkkhxqgpdfidxnuecfelkyduiupl` FOREIGN KEY (`fieldLayoutId`) REFERENCES `sub41_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_gqlschemas`
--

DROP TABLE IF EXISTS `sub41_gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` json DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_gqltokens`
--

DROP TABLE IF EXISTS `sub41_gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub41_idx_bxidlacxngqvxmhooizskgizxnghfwjnidwc` (`accessToken`),
  UNIQUE KEY `sub41_idx_lbhodlyymyosjyhfurywgtmrzwvkqrbynrdp` (`name`),
  KEY `sub41_fk_pbiidvzkqcicajhnkczrhctxpclndbkpohqr` (`schemaId`),
  CONSTRAINT `sub41_fk_pbiidvzkqcicajhnkczrhctxpclndbkpohqr` FOREIGN KEY (`schemaId`) REFERENCES `sub41_gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_imagetransformindex`
--

DROP TABLE IF EXISTS `sub41_imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sub41_idx_wmihwclfmcocwbngnbqyyrslzpdyrorotwkn` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_imagetransforms`
--

DROP TABLE IF EXISTS `sub41_imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sub41_idx_qtznykvufhdgbvthdvjepxmpldfndwfpjfzg` (`name`),
  KEY `sub41_idx_wxviysulgahroqqesddmbcxjywvlreaqgnwq` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_info`
--

DROP TABLE IF EXISTS `sub41_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_migrations`
--

DROP TABLE IF EXISTS `sub41_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub41_idx_frpwvsnpdrsvmmmyfwwaezlugvdlhvmyewik` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_plugins`
--

DROP TABLE IF EXISTS `sub41_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub41_idx_lrdparztdfeiuetagvfgexzowrfxcvokpndt` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_projectconfig`
--

DROP TABLE IF EXISTS `sub41_projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_queue`
--

DROP TABLE IF EXISTS `sub41_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `sub41_idx_dtgdnclmlazmcfygmtmlcnklljournrhygvz` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `sub41_idx_uwzgencssiqwfgtnqtntxvnehmcezgzvsuzw` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=1127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_recoverycodes`
--

DROP TABLE IF EXISTS `sub41_recoverycodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_recoverycodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `recoveryCodes` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_relations`
--

DROP TABLE IF EXISTS `sub41_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub41_idx_lqlmyebyinlhkophppftmtdgbmgbfkoiqcju` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `sub41_idx_sejdsxcugtlfrjvaaskleavejgaxnhevbgwj` (`sourceId`),
  KEY `sub41_idx_crlkmklusjdlfxpgkosvcwosjfmvkuvfxjhs` (`targetId`),
  KEY `sub41_idx_wpkmgcxqufkrlqtspnjhtluelavyypdwjomr` (`sourceSiteId`),
  CONSTRAINT `sub41_fk_ghhybbpyuorjqoirlyhlgxkgqxaoqtxuzbiy` FOREIGN KEY (`sourceId`) REFERENCES `sub41_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_ibswfpbvcnuaennyoymgxhjouvcwnkvtfobh` FOREIGN KEY (`fieldId`) REFERENCES `sub41_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_loyvaoweoyqsnbohandzspmjikoiofevrugc` FOREIGN KEY (`sourceSiteId`) REFERENCES `sub41_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_resourcepaths`
--

DROP TABLE IF EXISTS `sub41_resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_revisions`
--

DROP TABLE IF EXISTS `sub41_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub41_idx_wwnnvfdenwbjtnpfumhvipejigtlwtlhpcoy` (`canonicalId`,`num`),
  KEY `sub41_fk_ucdbpxbegkphaldqppxksckwhaoufstvlftc` (`creatorId`),
  CONSTRAINT `sub41_fk_kdefjcabdvdjqjabhtqzqqdvumlrkamcyeef` FOREIGN KEY (`canonicalId`) REFERENCES `sub41_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_ucdbpxbegkphaldqppxksckwhaoufstvlftc` FOREIGN KEY (`creatorId`) REFERENCES `sub41_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_searchindex`
--

DROP TABLE IF EXISTS `sub41_searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `sub41_idx_ozlmbgczwkgjwzwsgiqomunxkqbmotrxcwji` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_searchindexqueue`
--

DROP TABLE IF EXISTS `sub41_searchindexqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_searchindexqueue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `reserved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sub41_idx_rxggzcowygkhryqoqiqulpvgconyfbdgzfqv` (`elementId`,`siteId`,`reserved`),
  CONSTRAINT `sub41_fk_nfvawawkounmffcozgepxhvmjoetvbtzsbhy` FOREIGN KEY (`elementId`) REFERENCES `sub41_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=441 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_searchindexqueue_fields`
--

DROP TABLE IF EXISTS `sub41_searchindexqueue_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_searchindexqueue_fields` (
  `jobId` int NOT NULL,
  `fieldHandle` varchar(255) NOT NULL,
  PRIMARY KEY (`jobId`,`fieldHandle`),
  UNIQUE KEY `sub41_idx_uqwbojqbtvhbvncdjoyguoemvzsdbdazddnj` (`jobId`,`fieldHandle`),
  CONSTRAINT `sub41_fk_nvnajokvjpiychayvddhykuzlhguwzdyqyba` FOREIGN KEY (`jobId`) REFERENCES `sub41_searchindexqueue` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_sections`
--

DROP TABLE IF EXISTS `sub41_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `maxAuthors` smallint unsigned DEFAULT NULL,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sub41_idx_jmkccxymymtmedlydjjebzwyjjkfelvhipwh` (`handle`),
  KEY `sub41_idx_dxqfzdvgpbyrihlgxqxudwadybhxurirxxzp` (`name`),
  KEY `sub41_idx_iatfotoldgvxxpehfrvwnvsbazumdylxelwv` (`structureId`),
  KEY `sub41_idx_unvlkruefirtwedxjgscwegrelgkokiczrgy` (`dateDeleted`),
  CONSTRAINT `sub41_fk_trwjewwuztordbvmzbefrvtydtnvxhwjthcj` FOREIGN KEY (`structureId`) REFERENCES `sub41_structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_sections_entrytypes`
--

DROP TABLE IF EXISTS `sub41_sections_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_sections_entrytypes` (
  `sectionId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sectionId`,`typeId`),
  KEY `sub41_fk_jjfqxhzlpeytexfvcuvnclmdpoutmpqrwtui` (`typeId`),
  CONSTRAINT `sub41_fk_jjfqxhzlpeytexfvcuvnclmdpoutmpqrwtui` FOREIGN KEY (`typeId`) REFERENCES `sub41_entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_jkwgwgxczytsekqobteuvberpkcshklypdek` FOREIGN KEY (`sectionId`) REFERENCES `sub41_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_sections_sites`
--

DROP TABLE IF EXISTS `sub41_sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub41_idx_liwscqkkpvvdtmnrllllueidvnjklyepmtmt` (`sectionId`,`siteId`),
  KEY `sub41_idx_kfzhtwgvvyofzilgyovqluhasmbjdqqjzlml` (`siteId`),
  CONSTRAINT `sub41_fk_hjetmvklrqzvhwhbzbobbyaqxvmffefnhyja` FOREIGN KEY (`sectionId`) REFERENCES `sub41_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_lzvtyuwrkpvpugmgzbocsdfvcbdxpcpcsifr` FOREIGN KEY (`siteId`) REFERENCES `sub41_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_sequences`
--

DROP TABLE IF EXISTS `sub41_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_sequences` (
  `name` varchar(255) NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_sessions`
--

DROP TABLE IF EXISTS `sub41_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sub41_idx_dkejhtlcqqciaflquqyuuvtzzbdunbmtdylt` (`uid`),
  KEY `sub41_idx_rhirlgtetntizxoexovnljgsqkevgoyupirc` (`token`),
  KEY `sub41_idx_vtuxdudeeirfqhjaevppxenlvymaawxumgrn` (`dateUpdated`),
  KEY `sub41_idx_qiaovgxfghxfsatxvsiolseclpsbwgkqiqxj` (`userId`),
  CONSTRAINT `sub41_fk_qnypjlubfpvejtdjdkrgbbrlbygoymgiwygn` FOREIGN KEY (`userId`) REFERENCES `sub41_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_shunnedmessages`
--

DROP TABLE IF EXISTS `sub41_shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub41_idx_vnhrwkyopktncghhlzjhgotonrdwnuhcnbju` (`userId`,`message`),
  CONSTRAINT `sub41_fk_myqzigmtbujrhhyoajiavzqdkdbrrfqyquqm` FOREIGN KEY (`userId`) REFERENCES `sub41_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_sitegroups`
--

DROP TABLE IF EXISTS `sub41_sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sub41_idx_elpcrrbblrpnaedtimxnotxzkgacbnhcbjsm` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_sites`
--

DROP TABLE IF EXISTS `sub41_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sub41_idx_uarzkomkxlvqlgqalmoeqnekkbhesspqckhn` (`dateDeleted`),
  KEY `sub41_idx_iyzpnbqzmfwstskbaksiyvjnohgffwlddtjm` (`handle`),
  KEY `sub41_idx_cgadfwqumjrzotejwklwjxoqadwfyqanexfj` (`sortOrder`),
  KEY `sub41_fk_ayjhgqlervbafcmpjixblhcpjpsunfdmkqcb` (`groupId`),
  CONSTRAINT `sub41_fk_ayjhgqlervbafcmpjixblhcpjpsunfdmkqcb` FOREIGN KEY (`groupId`) REFERENCES `sub41_sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_sso_identities`
--

DROP TABLE IF EXISTS `sub41_sso_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_sso_identities` (
  `provider` varchar(255) NOT NULL,
  `identityId` varchar(255) NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`provider`,`identityId`,`userId`),
  KEY `sub41_fk_svesglufdkebolfulxulddoriagvmykgecdr` (`userId`),
  CONSTRAINT `sub41_fk_svesglufdkebolfulxulddoriagvmykgecdr` FOREIGN KEY (`userId`) REFERENCES `sub41_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_structureelements`
--

DROP TABLE IF EXISTS `sub41_structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub41_idx_kksapiwqnilykgdtlxnanddnlytadlgxmtwb` (`structureId`,`elementId`),
  KEY `sub41_idx_imwbfglpfcvitouyvamviihxyytohlnmakgt` (`root`),
  KEY `sub41_idx_spklnrzkwayqrxtptarcxwfcfhybjfqjvzlp` (`lft`),
  KEY `sub41_idx_icrbuodjelriyeaabyzhlyrfoxemtphbftsa` (`rgt`),
  KEY `sub41_idx_pjrfggcnntendualxtezufkdbvvgvpntqoim` (`level`),
  KEY `sub41_idx_kqsrrlpwaxuystlpxhzbamfazzpjgeojfqon` (`elementId`),
  CONSTRAINT `sub41_fk_lcbxqonvhtsfzyoswhucdbxscogjuclobboq` FOREIGN KEY (`structureId`) REFERENCES `sub41_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_structures`
--

DROP TABLE IF EXISTS `sub41_structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sub41_idx_kscbcbnfqceayqepwneasjjgmcitlvibthyi` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_systemmessages`
--

DROP TABLE IF EXISTS `sub41_systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub41_idx_viiewidaumxxeeybpsfrsicinncxbqkjxofz` (`key`,`language`),
  KEY `sub41_idx_pgcvolsoqjtaxqehyievclhvfudsktnzcwvf` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_taggroups`
--

DROP TABLE IF EXISTS `sub41_taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sub41_idx_khocvoveziiutkrbkobqfhwnqwknpyuawdjp` (`name`),
  KEY `sub41_idx_hcugppjktkucbsgcqvkibwzdvliswjtalrjg` (`handle`),
  KEY `sub41_idx_nmftattugbcrhayoeizqshterrytbfecjxaw` (`dateDeleted`),
  KEY `sub41_fk_xxtghmlyloxhtufvwtqkvbhpakhxnyjgvgie` (`fieldLayoutId`),
  CONSTRAINT `sub41_fk_xxtghmlyloxhtufvwtqkvbhpakhxnyjgvgie` FOREIGN KEY (`fieldLayoutId`) REFERENCES `sub41_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_tags`
--

DROP TABLE IF EXISTS `sub41_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sub41_idx_spcwmoctmbswuztlxjnjauvyoablqcryzcbu` (`groupId`),
  CONSTRAINT `sub41_fk_fxlnbmxzmuohdexdcwkbnndigjlfhdleaolx` FOREIGN KEY (`id`) REFERENCES `sub41_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_yoeupuccnleiperapykgzxeeerloahbgcnke` FOREIGN KEY (`groupId`) REFERENCES `sub41_taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_tokens`
--

DROP TABLE IF EXISTS `sub41_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub41_idx_mqeotlzrjrgeexvwgnwvxbvvzuhlyaxxoqpa` (`token`),
  KEY `sub41_idx_sotjxqwvrvirtknrpruusqtpqikuioglstuk` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_usergroups`
--

DROP TABLE IF EXISTS `sub41_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sub41_idx_dcefodazfdssapgqpaztfpexsymtmbvxwbui` (`handle`),
  KEY `sub41_idx_oountqiwwjnsrkwkhcemdnfjbnohtuugbanz` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_usergroups_users`
--

DROP TABLE IF EXISTS `sub41_usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub41_idx_jxndvhcagwrbtciqyutpruyvxzlkmflgismv` (`groupId`,`userId`),
  KEY `sub41_idx_rojkcmtltjndjkyvmeqelettnelcllrtmqhk` (`userId`),
  CONSTRAINT `sub41_fk_qrwpnhedcoylqeyyjoadblqnweruetwemdco` FOREIGN KEY (`userId`) REFERENCES `sub41_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_ullftsardowuexsbewzryevuiyyxmszhxtgp` FOREIGN KEY (`groupId`) REFERENCES `sub41_usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_userpermissions`
--

DROP TABLE IF EXISTS `sub41_userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub41_idx_pcvfzmvrvjcmqqhqgdgnnnqgnkzstthkucsl` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_userpermissions_usergroups`
--

DROP TABLE IF EXISTS `sub41_userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub41_idx_ekqgdbajfdfltpjeyjabklbsympndgnpnczv` (`permissionId`,`groupId`),
  KEY `sub41_idx_edcjcabliniegbnstgdmrtjkavlzdjtmuifo` (`groupId`),
  CONSTRAINT `sub41_fk_pwocenuptyycmefiepwbqbnlthizbtsjakvk` FOREIGN KEY (`groupId`) REFERENCES `sub41_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_rcsxestookytfpoknmqptkaclvkpbqiexebs` FOREIGN KEY (`permissionId`) REFERENCES `sub41_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_userpermissions_users`
--

DROP TABLE IF EXISTS `sub41_userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub41_idx_abmmygoqfbbrmeunfzjkseqdcolqzqqbkwzf` (`permissionId`,`userId`),
  KEY `sub41_idx_hbexnzkmprzovpsvsguewojyquzienasfdbf` (`userId`),
  CONSTRAINT `sub41_fk_cyozzznwclpohexlbeqinixutyulfshlryxb` FOREIGN KEY (`userId`) REFERENCES `sub41_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_uvxlphplscnxdhgfmphbdlbjncchulpmtsbt` FOREIGN KEY (`permissionId`) REFERENCES `sub41_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_userpreferences`
--

DROP TABLE IF EXISTS `sub41_userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` json DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `sub41_fk_aivngqhlxvijdcufczkmvescwcopelmbsnzm` FOREIGN KEY (`userId`) REFERENCES `sub41_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_users`
--

DROP TABLE IF EXISTS `sub41_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `affiliatedSiteId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sub41_idx_rshknbdsfuumoyglojfkzdsiblroetauwqcq` (`active`),
  KEY `sub41_idx_lckxapdeolzbxlmpfwhinvdnshsgkeenecxp` (`locked`),
  KEY `sub41_idx_vyaicoyffkekhxvldevcklachikotvmtirpd` (`pending`),
  KEY `sub41_idx_igkblfcunbhnqyvxtdrvzdseciimigakhzqt` (`suspended`),
  KEY `sub41_idx_nbguxgauykwllvcbftijkrqvpovmepjvjpse` (`verificationCode`),
  KEY `sub41_idx_yrfrvlgkuesqnhovponxxbcamfxkkrrmblej` (`email`),
  KEY `sub41_idx_xffokwjhbokpcdyhpdujpsxtuyabsgoaftpf` (`username`),
  KEY `sub41_fk_taelpbzwbdclhigctrnreeogwejaysuuajpy` (`photoId`),
  KEY `sub41_fk_sursgrvxacoluunzscjtnjyrusjhuyudtouo` (`affiliatedSiteId`),
  CONSTRAINT `sub41_fk_sursgrvxacoluunzscjtnjyrusjhuyudtouo` FOREIGN KEY (`affiliatedSiteId`) REFERENCES `sub41_sites` (`id`) ON DELETE SET NULL,
  CONSTRAINT `sub41_fk_taelpbzwbdclhigctrnreeogwejaysuuajpy` FOREIGN KEY (`photoId`) REFERENCES `sub41_assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `sub41_fk_uhdzwjezbffstbpjhligocjvcparcwyxqviz` FOREIGN KEY (`id`) REFERENCES `sub41_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_volumefolders`
--

DROP TABLE IF EXISTS `sub41_volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub41_idx_hqwilhdyhxpjtfkelcsjayonfvvhkwczjmac` (`name`,`parentId`,`volumeId`),
  KEY `sub41_idx_zetolgdlhzaqxyrzxwkosnyvpajqxjusvwkv` (`parentId`),
  KEY `sub41_idx_mbnbljgwpodxxfwqbjwdnyvoyrhfnepylrgi` (`volumeId`),
  CONSTRAINT `sub41_fk_nhpztwsxbpecmvxzzntwufsmnmvolplucxgr` FOREIGN KEY (`parentId`) REFERENCES `sub41_volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub41_fk_zlwubuphoqcjpofjsegscqjasbtcbisqqzru` FOREIGN KEY (`volumeId`) REFERENCES `sub41_volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_volumes`
--

DROP TABLE IF EXISTS `sub41_volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `subpath` varchar(255) DEFAULT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `altTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sub41_idx_culmwaufhuvuidbookohfhuciqqlnznnvnsi` (`name`),
  KEY `sub41_idx_joyvfazzltxbjihmxkyoxwjqjsimaeflfwot` (`handle`),
  KEY `sub41_idx_pkwlwwehvwqnebxfqxuvsjvyhrjvnovczgeh` (`fieldLayoutId`),
  KEY `sub41_idx_ljaykczxufxtbjcmdzbrdmtmgbgptxqrkfrd` (`dateDeleted`),
  CONSTRAINT `sub41_fk_ogdigvnkpwmuygxnecpgaczqjpizlkofgwnn` FOREIGN KEY (`fieldLayoutId`) REFERENCES `sub41_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_webauthn`
--

DROP TABLE IF EXISTS `sub41_webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_webauthn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `credentialId` varchar(255) DEFAULT NULL,
  `credential` text,
  `credentialName` varchar(255) DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sub41_fk_bugsdfyczvgrgwzentyalsvofnaczzccgkxz` (`userId`),
  CONSTRAINT `sub41_fk_bugsdfyczvgrgwzentyalsvofnaczzccgkxz` FOREIGN KEY (`userId`) REFERENCES `sub41_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub41_widgets`
--

DROP TABLE IF EXISTS `sub41_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub41_widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sub41_idx_nbsvwsemuxurgdicousgtfngexzwmpzszrgb` (`userId`),
  CONSTRAINT `sub41_fk_vbrjjokfekdteedjrqcuksdmccrnrbimsvxx` FOREIGN KEY (`userId`) REFERENCES `sub41_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-26  9:06:07
-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Dumping data for table `sub41_addresses`
--

LOCK TABLES `sub41_addresses` WRITE;
/*!40000 ALTER TABLE `sub41_addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_announcements`
--

LOCK TABLES `sub41_announcements` WRITE;
/*!40000 ALTER TABLE `sub41_announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_assetindexingsessions`
--

LOCK TABLES `sub41_assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `sub41_assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_assets`
--

LOCK TABLES `sub41_assets` WRITE;
/*!40000 ALTER TABLE `sub41_assets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_assets` VALUES (6,1,1,3,'Group-16.png','image',NULL,172,54,4840,NULL,0,0,'2025-06-20 15:59:33','2025-06-20 15:59:33','2025-06-20 15:59:33'),(7,1,1,3,'Group-16.svg','image',NULL,171,53,16080,NULL,0,0,'2025-06-20 15:59:50','2025-06-20 15:59:50','2025-06-20 15:59:50'),(8,1,1,3,'Group-16.svg','image',NULL,171,53,16080,NULL,0,0,'2025-06-20 16:06:17','2025-06-20 16:06:17','2025-06-20 16:06:17'),(9,1,1,3,'Group-16.svg','image',NULL,171,53,16080,NULL,1,1,'2025-06-23 11:20:09','2025-06-20 16:08:37','2025-06-23 11:20:09'),(10,1,1,3,'Group-16.png','image',NULL,172,54,4840,NULL,0,0,'2025-06-20 16:08:55','2025-06-20 16:08:55','2025-06-20 16:08:55'),(159,1,1,3,'Group-16_2025-06-23-112006_jwgf.svg','image',NULL,171,53,16080,NULL,0,0,'2025-06-23 11:20:06','2025-06-23 11:20:06','2025-06-23 11:20:06'),(160,2,4,3,'Group-16.svg','image',NULL,171,53,16080,NULL,0,0,'2025-06-23 11:24:50','2025-06-23 11:24:50','2025-06-23 11:24:56'),(161,2,4,3,'Group-16.png','image',NULL,172,54,4840,NULL,0,0,'2025-06-23 11:25:04','2025-06-23 11:25:04','2025-06-23 11:25:04'),(162,2,4,3,'Group-16.png','image',NULL,172,54,4840,NULL,0,0,'2025-06-23 11:25:33','2025-06-23 11:25:33','2025-06-23 11:25:33'),(163,2,4,3,'site-logo.svg','image',NULL,171,53,16080,NULL,NULL,NULL,'2025-06-23 11:28:40','2025-06-23 11:28:40','2025-06-23 11:28:40'),(166,2,4,3,'header-image-main-twi.png','image',NULL,1920,817,2510372,NULL,NULL,NULL,'2025-06-24 10:04:28','2025-06-24 10:04:28','2025-06-24 10:04:28'),(179,2,4,3,'Group-76.svg','image',NULL,439,123,8599,NULL,NULL,NULL,'2025-06-24 11:07:42','2025-06-24 11:07:42','2025-06-24 11:07:42'),(180,2,4,3,'Group-77.svg','image',NULL,439,147,7502,NULL,NULL,NULL,'2025-06-24 11:07:43','2025-06-24 11:07:43','2025-06-24 11:07:43'),(181,2,4,3,'On-deck-FlatHolm_SURVEYSEARCH-Cover.png','image',NULL,812,520,685256,NULL,NULL,NULL,'2025-06-24 11:09:04','2025-06-24 11:09:04','2025-06-24 11:09:04'),(182,2,4,3,'IMG_5182-cleaned.png','image',NULL,812,520,1046892,NULL,NULL,NULL,'2025-06-24 11:09:04','2025-06-24 11:09:04','2025-06-24 11:09:04'),(206,2,4,3,'ROV-lifted-out-of-the-sea.png','image',NULL,812,728,1350991,NULL,NULL,NULL,'2025-06-24 15:22:57','2025-06-24 15:22:57','2025-06-24 15:22:57'),(218,2,4,3,'AdobeStock_832269854_Preview.png','image',NULL,812,728,764780,NULL,NULL,NULL,'2025-06-24 15:27:54','2025-06-24 15:27:54','2025-06-24 15:27:54'),(340,2,4,3,'CAM.png','image',NULL,206,420,142791,NULL,NULL,NULL,'2025-06-25 13:31:51','2025-06-25 13:31:51','2025-06-25 13:31:51'),(341,2,4,3,'CTR.png','image',NULL,206,420,204046,NULL,NULL,NULL,'2025-06-25 13:31:51','2025-06-25 13:31:51','2025-06-25 13:31:51'),(342,2,4,3,'ERS.png','image',NULL,206,420,190647,NULL,NULL,NULL,'2025-06-25 13:31:51','2025-06-25 13:31:51','2025-06-25 13:31:51'),(343,2,4,3,'MIS.png','image',NULL,206,420,172495,NULL,NULL,NULL,'2025-06-25 13:31:52','2025-06-25 13:31:52','2025-06-25 13:31:52'),(344,2,4,3,'MNP.png','image',NULL,206,420,149029,NULL,NULL,NULL,'2025-06-25 13:31:52','2025-06-25 13:31:52','2025-06-25 13:31:52'),(345,2,4,3,'MVE.png','image',NULL,206,420,195303,NULL,NULL,NULL,'2025-06-25 13:31:52','2025-06-25 13:31:52','2025-06-25 13:31:52'),(346,2,4,3,'ROS.png','image',NULL,206,420,171405,NULL,NULL,NULL,'2025-06-25 13:31:52','2025-06-25 13:31:52','2025-06-25 13:31:52'),(347,2,4,3,'RTG.png','image',NULL,206,420,140926,NULL,NULL,NULL,'2025-06-25 13:31:52','2025-06-25 13:31:52','2025-06-25 13:31:52'),(348,2,4,3,'RVM.png','image',NULL,206,420,190492,NULL,NULL,NULL,'2025-06-25 13:31:52','2025-06-25 13:31:52','2025-06-25 13:31:52'),(349,2,4,3,'SNR.png','image',NULL,206,420,117956,NULL,NULL,NULL,'2025-06-25 13:31:52','2025-06-25 13:31:52','2025-06-25 13:31:52'),(350,2,4,3,'SPG.png','image',NULL,206,420,157590,NULL,NULL,NULL,'2025-06-25 13:31:52','2025-06-25 13:31:52','2025-06-25 13:31:52'),(351,2,4,3,'THR.png','image',NULL,206,420,175525,NULL,NULL,NULL,'2025-06-25 13:31:52','2025-06-25 13:31:53','2025-06-25 13:31:53'),(352,2,4,3,'TMS.png','image',NULL,206,420,195707,NULL,NULL,NULL,'2025-06-25 13:31:53','2025-06-25 13:31:53','2025-06-25 13:31:53'),(353,2,4,3,'UMB.png','image',NULL,206,420,170568,NULL,NULL,NULL,'2025-06-25 13:31:53','2025-06-25 13:31:53','2025-06-25 13:31:53'),(354,2,4,3,'WCH.png','image',NULL,206,420,161839,NULL,NULL,NULL,'2025-06-25 13:31:53','2025-06-25 13:31:53','2025-06-25 13:31:53'),(355,2,4,3,'WRS.png','image',NULL,206,420,155133,NULL,NULL,NULL,'2025-06-25 13:31:53','2025-06-25 13:31:53','2025-06-25 13:31:53');
/*!40000 ALTER TABLE `sub41_assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_assets_sites`
--

LOCK TABLES `sub41_assets_sites` WRITE;
/*!40000 ALTER TABLE `sub41_assets_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_assets_sites` VALUES (6,1,NULL),(7,1,NULL),(8,1,NULL),(9,1,NULL),(10,1,NULL),(159,1,NULL),(160,1,NULL),(161,1,NULL),(162,1,NULL),(163,1,NULL),(166,1,NULL),(179,1,NULL),(180,1,NULL),(181,1,NULL),(182,1,NULL),(206,1,NULL),(218,1,NULL),(340,1,NULL),(341,1,NULL),(342,1,NULL),(343,1,NULL),(344,1,NULL),(345,1,NULL),(346,1,NULL),(347,1,NULL),(348,1,NULL),(349,1,NULL),(350,1,NULL),(351,1,NULL),(352,1,NULL),(353,1,NULL),(354,1,NULL),(355,1,NULL);
/*!40000 ALTER TABLE `sub41_assets_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_authenticator`
--

LOCK TABLES `sub41_authenticator` WRITE;
/*!40000 ALTER TABLE `sub41_authenticator` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_authenticator` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_bulkopevents`
--

LOCK TABLES `sub41_bulkopevents` WRITE;
/*!40000 ALTER TABLE `sub41_bulkopevents` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_bulkopevents` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_categories`
--

LOCK TABLES `sub41_categories` WRITE;
/*!40000 ALTER TABLE `sub41_categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_categorygroups`
--

LOCK TABLES `sub41_categorygroups` WRITE;
/*!40000 ALTER TABLE `sub41_categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_categorygroups_sites`
--

LOCK TABLES `sub41_categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `sub41_categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_changedattributes`
--

LOCK TABLES `sub41_changedattributes` WRITE;
/*!40000 ALTER TABLE `sub41_changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_changedattributes` VALUES (3,1,'invalidLoginCount','2025-06-23 11:39:37',0,NULL),(3,1,'invalidLoginWindowStart','2025-06-23 11:39:37',0,NULL),(3,1,'lastPasswordChangeDate','2025-06-23 11:39:37',0,NULL),(3,1,'password','2025-06-23 11:39:37',0,NULL),(3,1,'verificationCode','2025-06-23 11:39:37',0,NULL),(3,1,'verificationCodeIssuedDate','2025-06-23 11:39:37',0,NULL),(11,1,'postDate','2025-06-23 08:09:06',0,3),(11,1,'slug','2025-06-23 10:19:37',0,3),(11,1,'status','2025-06-23 08:09:06',0,3),(11,1,'title','2025-06-23 10:19:37',0,3),(13,1,'slug','2025-06-23 10:19:23',0,3),(13,1,'title','2025-06-23 10:19:23',0,3),(14,1,'slug','2025-06-23 10:20:09',0,3),(14,1,'title','2025-06-23 10:20:09',0,3),(15,1,'slug','2025-06-23 10:19:48',0,3),(15,1,'title','2025-06-23 10:19:48',0,3),(16,1,'postDate','2025-06-23 08:11:09',0,3),(16,1,'slug','2025-06-24 13:01:49',0,3),(16,1,'status','2025-06-23 08:11:09',0,3),(16,1,'title','2025-06-24 13:01:49',0,3),(17,1,'postDate','2025-06-23 08:11:08',0,3),(17,1,'primaryOwnerId','2025-06-23 10:21:29',0,3),(17,1,'slug','2025-06-23 08:11:08',0,3),(17,1,'status','2025-06-23 08:11:08',0,3),(17,1,'title','2025-06-23 08:10:58',0,3),(18,1,'postDate','2025-06-23 08:17:34',0,3),(18,1,'slug','2025-06-23 08:17:33',0,3),(18,1,'title','2025-06-23 08:17:33',0,3),(18,1,'uri','2025-06-23 08:17:33',0,3),(20,1,'postDate','2025-06-23 08:17:41',0,3),(20,1,'slug','2025-06-23 08:17:40',0,3),(20,1,'title','2025-06-23 08:17:40',0,3),(20,1,'uri','2025-06-23 08:17:40',0,3),(22,1,'postDate','2025-06-23 08:17:52',0,3),(22,1,'slug','2025-06-23 08:17:52',0,3),(22,1,'title','2025-06-23 08:17:52',0,3),(22,1,'uri','2025-06-23 08:17:52',0,3),(24,1,'postDate','2025-06-23 08:18:03',0,3),(24,1,'slug','2025-06-23 08:17:58',0,3),(24,1,'title','2025-06-23 08:17:58',0,3),(24,1,'uri','2025-06-23 08:17:58',0,3),(26,1,'postDate','2025-06-23 08:18:12',0,3),(26,1,'slug','2025-06-23 08:18:11',0,3),(26,1,'title','2025-06-23 08:18:11',0,3),(26,1,'uri','2025-06-23 08:18:11',0,3),(28,1,'postDate','2025-06-23 08:18:22',0,3),(28,1,'slug','2025-06-23 08:18:21',0,3),(28,1,'title','2025-06-23 08:18:21',0,3),(28,1,'uri','2025-06-23 08:18:21',0,3),(30,1,'postDate','2025-06-23 08:18:33',0,3),(30,1,'slug','2025-06-23 08:18:32',0,3),(30,1,'title','2025-06-23 08:18:32',0,3),(30,1,'uri','2025-06-23 08:18:32',0,3),(32,1,'postDate','2025-06-23 08:18:49',0,3),(32,1,'slug','2025-06-23 08:18:48',0,3),(32,1,'title','2025-06-23 08:18:48',0,3),(32,1,'uri','2025-06-23 08:18:48',0,3),(34,1,'postDate','2025-06-23 08:18:58',0,3),(34,1,'slug','2025-06-23 08:18:58',0,3),(34,1,'title','2025-06-23 08:18:58',0,3),(34,1,'uri','2025-06-23 08:18:58',0,3),(36,1,'postDate','2025-06-23 08:19:07',0,3),(36,1,'slug','2025-06-23 08:19:04',0,3),(36,1,'title','2025-06-23 08:19:04',0,3),(36,1,'uri','2025-06-23 08:19:04',0,3),(38,1,'postDate','2025-06-23 08:19:15',0,3),(38,1,'slug','2025-06-23 08:19:14',0,3),(38,1,'title','2025-06-23 08:19:14',0,3),(38,1,'uri','2025-06-23 08:19:14',0,3),(40,1,'postDate','2025-06-23 08:19:24',0,3),(40,1,'slug','2025-06-23 08:19:22',0,3),(40,1,'title','2025-06-23 08:19:22',0,3),(40,1,'uri','2025-06-23 08:19:22',0,3),(42,1,'postDate','2025-06-23 08:19:31',0,3),(42,1,'slug','2025-06-23 08:19:31',0,3),(42,1,'title','2025-06-23 08:19:31',0,3),(42,1,'uri','2025-06-23 08:19:31',0,3),(44,1,'postDate','2025-06-23 08:19:40',0,3),(44,1,'slug','2025-06-23 08:19:40',0,3),(44,1,'title','2025-06-23 08:19:40',0,3),(44,1,'uri','2025-06-23 08:19:40',0,3),(46,1,'postDate','2025-06-23 08:19:49',0,3),(46,1,'slug','2025-06-23 08:19:48',0,3),(46,1,'title','2025-06-23 08:19:48',0,3),(46,1,'uri','2025-06-23 08:19:48',0,3),(48,1,'postDate','2025-06-23 08:20:30',0,3),(48,1,'slug','2025-06-23 08:19:56',0,3),(48,1,'title','2025-06-23 08:19:56',0,3),(48,1,'uri','2025-06-23 08:19:56',0,3),(50,1,'fieldLayoutId','2025-06-25 11:43:40',0,3),(50,1,'postDate','2025-06-23 08:21:04',0,3),(50,1,'slug','2025-06-23 08:21:03',0,3),(50,1,'title','2025-06-23 08:21:03',0,3),(50,1,'typeId','2025-06-25 11:43:40',0,3),(50,1,'uri','2025-06-23 08:21:03',0,3),(52,1,'fieldLayoutId','2025-06-25 11:45:15',0,3),(52,1,'slug','2025-06-23 08:32:44',0,3),(52,1,'typeId','2025-06-25 11:45:15',0,3),(52,1,'uri','2025-06-23 08:32:44',0,3),(54,1,'fieldLayoutId','2025-06-25 11:45:16',0,3),(54,1,'slug','2025-06-23 08:32:44',0,3),(54,1,'typeId','2025-06-25 11:45:16',0,3),(54,1,'uri','2025-06-23 08:32:44',0,3),(56,1,'fieldLayoutId','2025-06-25 11:45:18',0,3),(56,1,'slug','2025-06-23 08:32:44',0,3),(56,1,'typeId','2025-06-25 11:45:18',0,3),(56,1,'uri','2025-06-23 08:32:44',0,3),(58,1,'fieldLayoutId','2025-06-25 11:45:20',0,3),(58,1,'slug','2025-06-23 08:32:44',0,3),(58,1,'typeId','2025-06-25 11:45:20',0,3),(58,1,'uri','2025-06-23 08:32:44',0,3),(60,1,'fieldLayoutId','2025-06-25 11:45:20',0,3),(60,1,'slug','2025-06-23 08:32:44',0,3),(60,1,'typeId','2025-06-25 11:45:20',0,3),(60,1,'uri','2025-06-23 08:32:44',0,3),(62,1,'fieldLayoutId','2025-06-25 11:45:23',0,3),(62,1,'slug','2025-06-23 08:32:44',0,3),(62,1,'typeId','2025-06-25 11:45:23',0,3),(62,1,'uri','2025-06-23 08:32:44',0,3),(64,1,'fieldLayoutId','2025-06-25 11:45:23',0,3),(64,1,'slug','2025-06-23 08:32:44',0,3),(64,1,'typeId','2025-06-25 11:45:23',0,3),(64,1,'uri','2025-06-23 08:32:44',0,3),(66,1,'fieldLayoutId','2025-06-25 11:45:24',0,3),(66,1,'slug','2025-06-23 08:32:44',0,3),(66,1,'typeId','2025-06-25 11:45:24',0,3),(66,1,'uri','2025-06-23 08:32:44',0,3),(68,1,'fieldLayoutId','2025-06-25 11:45:16',0,3),(68,1,'slug','2025-06-23 08:32:44',0,3),(68,1,'typeId','2025-06-25 11:45:16',0,3),(68,1,'uri','2025-06-23 08:32:44',0,3),(70,1,'fieldLayoutId','2025-06-25 11:45:17',0,3),(70,1,'slug','2025-06-23 08:32:44',0,3),(70,1,'typeId','2025-06-25 11:45:17',0,3),(70,1,'uri','2025-06-23 08:32:44',0,3),(72,1,'fieldLayoutId','2025-06-25 11:45:18',0,3),(72,1,'slug','2025-06-23 08:32:44',0,3),(72,1,'typeId','2025-06-25 11:45:18',0,3),(72,1,'uri','2025-06-23 08:32:44',0,3),(74,1,'fieldLayoutId','2025-06-25 11:45:20',0,3),(74,1,'slug','2025-06-23 08:32:44',0,3),(74,1,'typeId','2025-06-25 11:45:20',0,3),(74,1,'uri','2025-06-23 08:32:44',0,3),(76,1,'fieldLayoutId','2025-06-25 11:45:20',0,3),(76,1,'slug','2025-06-23 08:32:44',0,3),(76,1,'typeId','2025-06-25 11:45:20',0,3),(76,1,'uri','2025-06-23 08:32:44',0,3),(78,1,'fieldLayoutId','2025-06-25 11:45:23',0,3),(78,1,'slug','2025-06-23 08:32:44',0,3),(78,1,'typeId','2025-06-25 11:45:23',0,3),(78,1,'uri','2025-06-23 08:32:44',0,3),(80,1,'fieldLayoutId','2025-06-25 11:45:24',0,3),(80,1,'slug','2025-06-23 08:32:44',0,3),(80,1,'typeId','2025-06-25 11:45:24',0,3),(80,1,'uri','2025-06-23 08:32:44',0,3),(82,1,'fieldLayoutId','2025-06-25 11:45:12',0,3),(82,1,'slug','2025-06-25 11:46:04',0,3),(82,1,'typeId','2025-06-25 11:45:12',0,3),(82,1,'uri','2025-06-25 11:46:04',0,3),(84,1,'fieldLayoutId','2025-06-25 11:47:02',0,3),(84,1,'slug','2025-06-23 08:32:44',0,3),(84,1,'title','2025-06-23 08:25:10',0,3),(84,1,'typeId','2025-06-25 11:47:02',0,3),(84,1,'uri','2025-06-23 08:32:44',0,3),(88,1,'fieldLayoutId','2025-06-25 11:47:03',0,3),(88,1,'postDate','2025-06-23 08:26:31',0,3),(88,1,'slug','2025-06-23 08:26:16',0,3),(88,1,'title','2025-06-23 08:26:16',0,3),(88,1,'typeId','2025-06-25 11:47:03',0,3),(88,1,'uri','2025-06-23 08:26:16',0,3),(90,1,'fieldLayoutId','2025-06-25 11:47:05',0,3),(90,1,'postDate','2025-06-23 08:26:35',0,3),(90,1,'slug','2025-06-23 08:26:34',0,3),(90,1,'status','2025-06-23 08:26:35',0,3),(90,1,'title','2025-06-23 08:26:34',0,3),(90,1,'typeId','2025-06-25 11:47:05',0,3),(90,1,'uri','2025-06-23 08:26:34',0,3),(92,1,'fieldLayoutId','2025-06-25 11:47:06',0,3),(92,1,'postDate','2025-06-23 08:26:44',0,3),(92,1,'slug','2025-06-23 08:26:42',0,3),(92,1,'status','2025-06-23 08:26:44',0,3),(92,1,'title','2025-06-23 08:26:42',0,3),(92,1,'typeId','2025-06-25 11:47:06',0,3),(92,1,'uri','2025-06-23 08:26:42',0,3),(94,1,'fieldLayoutId','2025-06-25 11:47:07',0,3),(94,1,'postDate','2025-06-23 08:26:55',0,3),(94,1,'slug','2025-06-23 08:26:54',0,3),(94,1,'status','2025-06-23 08:26:55',0,3),(94,1,'title','2025-06-23 08:26:54',0,3),(94,1,'typeId','2025-06-25 11:47:07',0,3),(94,1,'uri','2025-06-23 08:26:54',0,3),(96,1,'fieldLayoutId','2025-06-25 11:47:09',0,3),(96,1,'postDate','2025-06-23 08:27:24',0,3),(96,1,'slug','2025-06-23 08:27:01',0,3),(96,1,'status','2025-06-23 08:27:24',0,3),(96,1,'title','2025-06-23 08:27:01',0,3),(96,1,'typeId','2025-06-25 11:47:09',0,3),(96,1,'uri','2025-06-23 08:27:01',0,3),(98,1,'fieldLayoutId','2025-06-25 11:47:09',0,3),(98,1,'postDate','2025-06-23 08:27:30',0,3),(98,1,'slug','2025-06-23 08:27:29',0,3),(98,1,'status','2025-06-23 08:27:30',0,3),(98,1,'title','2025-06-23 08:27:29',0,3),(98,1,'typeId','2025-06-25 11:47:09',0,3),(98,1,'uri','2025-06-23 08:27:29',0,3),(100,1,'fieldLayoutId','2025-06-25 11:47:09',0,3),(100,1,'postDate','2025-06-23 08:27:35',0,3),(100,1,'slug','2025-06-23 08:27:35',0,3),(100,1,'status','2025-06-23 08:27:35',0,3),(100,1,'title','2025-06-23 08:27:35',0,3),(100,1,'typeId','2025-06-25 11:47:09',0,3),(100,1,'uri','2025-06-23 08:27:35',0,3),(102,1,'fieldLayoutId','2025-06-25 11:47:04',0,3),(102,1,'postDate','2025-06-23 08:30:24',0,3),(102,1,'slug','2025-06-23 08:30:23',0,3),(102,1,'status','2025-06-23 08:30:24',0,3),(102,1,'title','2025-06-23 08:30:23',0,3),(102,1,'typeId','2025-06-25 11:47:04',0,3),(102,1,'uri','2025-06-23 08:30:23',0,3),(104,1,'fieldLayoutId','2025-06-25 11:47:05',0,3),(104,1,'postDate','2025-06-23 08:30:32',0,3),(104,1,'slug','2025-06-23 08:30:29',0,3),(104,1,'status','2025-06-23 08:30:32',0,3),(104,1,'title','2025-06-23 08:30:29',0,3),(104,1,'typeId','2025-06-25 11:47:05',0,3),(104,1,'uri','2025-06-23 08:30:29',0,3),(106,1,'fieldLayoutId','2025-06-25 11:47:06',0,3),(106,1,'postDate','2025-06-23 08:30:41',0,3),(106,1,'slug','2025-06-23 08:30:40',0,3),(106,1,'status','2025-06-23 08:30:41',0,3),(106,1,'title','2025-06-23 08:30:40',0,3),(106,1,'typeId','2025-06-25 11:47:06',0,3),(106,1,'uri','2025-06-23 08:30:40',0,3),(108,1,'fieldLayoutId','2025-06-25 11:47:07',0,3),(108,1,'postDate','2025-06-23 08:30:51',0,3),(108,1,'slug','2025-06-23 08:30:51',0,3),(108,1,'status','2025-06-23 08:30:51',0,3),(108,1,'title','2025-06-23 08:30:51',0,3),(108,1,'typeId','2025-06-25 11:47:07',0,3),(108,1,'uri','2025-06-23 08:30:51',0,3),(110,1,'fieldLayoutId','2025-06-25 11:47:09',0,3),(110,1,'postDate','2025-06-23 08:31:00',0,3),(110,1,'slug','2025-06-23 08:30:59',0,3),(110,1,'status','2025-06-23 08:31:00',0,3),(110,1,'title','2025-06-23 08:30:59',0,3),(110,1,'typeId','2025-06-25 11:47:09',0,3),(110,1,'uri','2025-06-23 08:30:59',0,3),(112,1,'fieldLayoutId','2025-06-25 11:47:09',0,3),(112,1,'postDate','2025-06-23 08:31:08',0,3),(112,1,'slug','2025-06-23 08:31:06',0,3),(112,1,'status','2025-06-23 08:31:08',0,3),(112,1,'title','2025-06-23 08:31:06',0,3),(112,1,'typeId','2025-06-25 11:47:09',0,3),(112,1,'uri','2025-06-23 08:31:06',0,3),(114,1,'slug','2025-06-23 08:50:36',0,3),(114,1,'title','2025-06-23 08:50:36',0,3),(114,1,'uri','2025-06-23 08:50:36',0,3),(132,1,'fieldLayoutId','2025-06-25 11:47:10',0,3),(132,1,'postDate','2025-06-23 08:37:44',0,3),(132,1,'slug','2025-06-23 08:37:41',0,3),(132,1,'title','2025-06-23 08:37:41',0,3),(132,1,'typeId','2025-06-25 11:47:10',0,3),(132,1,'uri','2025-06-23 08:37:41',0,3),(134,1,'postDate','2025-06-23 08:48:48',0,3),(134,1,'slug','2025-06-23 08:48:48',0,3),(134,1,'title','2025-06-23 08:48:48',0,3),(134,1,'uri','2025-06-23 08:48:48',0,3),(139,1,'postDate','2025-06-23 10:17:06',0,3),(139,1,'slug','2025-06-23 10:16:59',0,3),(139,1,'title','2025-06-23 10:16:59',0,3),(139,1,'uri','2025-06-23 10:16:59',0,3),(142,1,'postDate','2025-06-23 10:17:19',0,3),(142,1,'slug','2025-06-23 10:17:19',0,3),(142,1,'title','2025-06-23 10:17:19',0,3),(142,1,'uri','2025-06-23 10:17:19',0,3),(144,1,'postDate','2025-06-23 10:17:35',0,3),(144,1,'slug','2025-06-23 10:17:35',0,3),(144,1,'title','2025-06-23 10:17:35',0,3),(144,1,'uri','2025-06-23 10:17:35',0,3),(146,1,'postDate','2025-06-23 10:17:46',0,3),(146,1,'slug','2025-06-23 10:17:43',0,3),(146,1,'title','2025-06-23 10:17:43',0,3),(146,1,'uri','2025-06-23 10:17:43',0,3),(148,1,'postDate','2025-06-23 10:17:53',0,3),(148,1,'slug','2025-06-23 10:17:53',0,3),(148,1,'status','2025-06-23 10:17:53',0,3),(148,1,'title','2025-06-23 10:17:53',0,3),(148,1,'uri','2025-06-23 10:17:53',0,3),(167,1,'primaryOwnerId','2025-06-24 10:53:57',0,3),(167,1,'slug','2025-06-24 10:53:57',0,3),(167,1,'title','2025-06-24 10:53:57',0,3),(186,1,'primaryOwnerId','2025-06-24 14:55:14',0,3),(186,1,'slug','2025-06-24 14:55:14',0,3),(186,1,'title','2025-06-24 14:55:14',0,3),(193,1,'fieldLayoutId','2025-06-25 11:43:50',0,3),(193,1,'postDate','2025-06-24 13:00:53',0,3),(193,1,'slug','2025-06-24 13:00:51',0,3),(193,1,'title','2025-06-24 13:00:51',0,3),(193,1,'typeId','2025-06-25 11:43:50',0,3),(193,1,'uri','2025-06-24 13:00:51',0,3),(211,1,'primaryOwnerId','2025-06-24 16:01:12',0,3),(211,1,'slug','2025-06-24 16:01:12',0,3),(211,1,'title','2025-06-24 16:01:12',0,3),(213,1,'title','2025-06-24 15:28:00',0,3),(253,1,'postDate','2025-06-25 10:32:04',0,3),(253,1,'slug','2025-06-25 10:32:04',0,3),(253,1,'title','2025-06-25 10:32:04',0,3),(253,1,'uri','2025-06-25 10:32:04',0,3),(255,1,'postDate','2025-06-25 10:32:18',0,3),(255,1,'slug','2025-06-25 10:32:18',0,3),(255,1,'title','2025-06-25 10:32:14',0,3),(255,1,'uri','2025-06-25 10:32:18',0,3),(390,1,'postDate','2025-06-25 14:00:43',0,3),(390,1,'slug','2025-06-25 14:00:43',0,3),(390,1,'title','2025-06-25 14:00:43',0,3),(390,1,'uri','2025-06-25 14:00:43',0,3),(392,1,'slug','2025-06-25 14:16:29',0,3),(392,1,'title','2025-06-25 14:16:46',0,3),(392,1,'uri','2025-06-25 14:16:29',0,3),(394,1,'slug','2025-06-25 14:16:29',0,3),(394,1,'title','2025-06-25 14:16:39',0,3),(394,1,'uri','2025-06-25 14:16:29',0,3),(402,1,'postDate','2025-06-25 14:17:22',0,3),(402,1,'slug','2025-06-25 14:17:06',0,3),(402,1,'title','2025-06-25 14:17:06',0,3),(402,1,'uri','2025-06-25 14:17:12',0,3),(404,1,'postDate','2025-06-25 14:17:31',0,3),(404,1,'slug','2025-06-25 14:17:27',0,3),(404,1,'status','2025-06-25 14:17:31',0,3),(404,1,'title','2025-06-25 14:17:27',0,3),(404,1,'uri','2025-06-25 14:17:27',0,3),(406,1,'postDate','2025-06-25 14:17:44',0,3),(406,1,'slug','2025-06-25 14:17:38',0,3),(406,1,'status','2025-06-25 14:17:44',0,3),(406,1,'title','2025-06-25 14:17:38',0,3),(406,1,'uri','2025-06-25 14:17:38',0,3),(408,1,'postDate','2025-06-25 14:17:58',0,3),(408,1,'slug','2025-06-25 14:17:55',0,3),(408,1,'status','2025-06-25 14:17:58',0,3),(408,1,'title','2025-06-25 14:17:55',0,3),(408,1,'uri','2025-06-25 14:17:55',0,3),(410,1,'postDate','2025-06-25 14:18:19',0,3),(410,1,'slug','2025-06-25 14:18:18',0,3),(410,1,'status','2025-06-25 14:18:19',0,3),(410,1,'title','2025-06-25 14:18:18',0,3),(410,1,'uri','2025-06-25 14:18:18',0,3),(412,1,'postDate','2025-06-25 14:18:28',0,3),(412,1,'slug','2025-06-25 14:18:24',0,3),(412,1,'status','2025-06-25 14:18:28',0,3),(412,1,'title','2025-06-25 14:18:24',0,3),(412,1,'uri','2025-06-25 14:18:24',0,3),(414,1,'postDate','2025-06-25 14:18:39',0,3),(414,1,'slug','2025-06-25 14:18:38',0,3),(414,1,'status','2025-06-25 14:18:39',0,3),(414,1,'title','2025-06-25 14:18:38',0,3),(414,1,'uri','2025-06-25 14:18:38',0,3),(416,1,'postDate','2025-06-25 14:18:54',0,3),(416,1,'slug','2025-06-25 14:18:52',0,3),(416,1,'status','2025-06-25 14:18:54',0,3),(416,1,'title','2025-06-25 14:18:52',0,3),(416,1,'uri','2025-06-25 14:18:52',0,3),(418,1,'postDate','2025-06-25 14:18:58',0,3),(418,1,'slug','2025-06-25 14:18:58',0,3),(418,1,'status','2025-06-25 14:18:58',0,3),(418,1,'title','2025-06-25 14:18:58',0,3),(418,1,'uri','2025-06-25 14:18:58',0,3),(420,1,'postDate','2025-06-25 14:19:22',0,3),(420,1,'slug','2025-06-25 14:19:22',0,3),(420,1,'status','2025-06-25 14:19:22',0,3),(420,1,'title','2025-06-25 14:19:22',0,3),(420,1,'uri','2025-06-25 14:19:22',0,3),(422,1,'postDate','2025-06-25 14:19:29',0,3),(422,1,'slug','2025-06-25 14:19:28',0,3),(422,1,'status','2025-06-25 14:19:29',0,3),(422,1,'title','2025-06-25 14:19:28',0,3),(422,1,'uri','2025-06-25 14:19:28',0,3),(424,1,'postDate','2025-06-25 14:20:31',0,3),(424,1,'slug','2025-06-25 14:19:39',0,3),(424,1,'status','2025-06-25 14:20:31',0,3),(424,1,'title','2025-06-25 14:19:39',0,3),(424,1,'uri','2025-06-25 14:19:50',0,3),(426,1,'postDate','2025-06-25 14:20:34',0,3),(426,1,'slug','2025-06-25 14:20:33',0,3),(426,1,'status','2025-06-25 14:20:34',0,3),(426,1,'title','2025-06-25 14:20:33',0,3),(426,1,'uri','2025-06-25 14:20:33',0,3),(428,1,'postDate','2025-06-25 14:20:39',0,3),(428,1,'slug','2025-06-25 14:20:38',0,3),(428,1,'status','2025-06-25 14:20:39',0,3),(428,1,'title','2025-06-25 14:20:38',0,3),(428,1,'uri','2025-06-25 14:20:38',0,3),(430,1,'postDate','2025-06-25 14:20:43',0,3),(430,1,'slug','2025-06-25 14:20:43',0,3),(430,1,'status','2025-06-25 14:20:43',0,3),(430,1,'title','2025-06-25 14:20:43',0,3),(430,1,'uri','2025-06-25 14:20:43',0,3),(432,1,'postDate','2025-06-25 14:20:50',0,3),(432,1,'slug','2025-06-25 14:20:50',0,3),(432,1,'status','2025-06-25 14:20:50',0,3),(432,1,'title','2025-06-25 14:20:50',0,3),(432,1,'uri','2025-06-25 14:20:50',0,3),(434,1,'postDate','2025-06-25 14:21:13',0,3),(434,1,'slug','2025-06-25 14:21:12',0,3),(434,1,'status','2025-06-25 14:21:13',0,3),(434,1,'title','2025-06-25 14:21:12',0,3),(434,1,'uri','2025-06-25 14:21:12',0,3),(436,1,'postDate','2025-06-25 14:21:18',0,3),(436,1,'slug','2025-06-25 14:21:18',0,3),(436,1,'status','2025-06-25 14:21:18',0,3),(436,1,'title','2025-06-25 14:21:18',0,3),(436,1,'uri','2025-06-25 14:21:18',0,3),(438,1,'postDate','2025-06-25 14:22:31',0,3),(438,1,'slug','2025-06-25 14:22:31',0,3),(438,1,'status','2025-06-25 14:22:31',0,3),(438,1,'title','2025-06-25 14:22:31',0,3),(438,1,'uri','2025-06-25 14:22:31',0,3),(440,1,'postDate','2025-06-25 14:22:36',0,3),(440,1,'slug','2025-06-25 14:22:36',0,3),(440,1,'status','2025-06-25 14:22:36',0,3),(440,1,'title','2025-06-25 14:22:36',0,3),(440,1,'uri','2025-06-25 14:22:36',0,3),(442,1,'postDate','2025-06-25 14:22:55',0,3),(442,1,'slug','2025-06-25 14:22:55',0,3),(442,1,'status','2025-06-25 14:22:55',0,3),(442,1,'title','2025-06-25 14:22:55',0,3),(442,1,'uri','2025-06-25 14:22:55',0,3),(444,1,'postDate','2025-06-25 14:23:01',0,3),(444,1,'slug','2025-06-25 14:23:01',0,3),(444,1,'status','2025-06-25 14:23:01',0,3),(444,1,'title','2025-06-25 14:23:01',0,3),(444,1,'uri','2025-06-25 14:23:01',0,3),(446,1,'postDate','2025-06-25 14:23:08',0,3),(446,1,'slug','2025-06-25 14:23:08',0,3),(446,1,'status','2025-06-25 14:23:08',0,3),(446,1,'title','2025-06-25 14:23:08',0,3),(446,1,'uri','2025-06-25 14:23:08',0,3),(448,1,'postDate','2025-06-25 14:23:13',0,3),(448,1,'slug','2025-06-25 14:23:11',0,3),(448,1,'status','2025-06-25 14:23:13',0,3),(448,1,'title','2025-06-25 14:23:11',0,3),(448,1,'uri','2025-06-25 14:23:11',0,3),(450,1,'slug','2025-06-25 14:23:40',0,3),(450,1,'title','2025-06-25 14:23:40',0,3),(450,1,'uri','2025-06-25 14:23:40',0,3),(457,1,'slug','2025-06-26 08:23:31',0,3),(457,1,'title','2025-06-26 08:23:31',0,3),(457,1,'uri','2025-06-26 08:23:31',0,3);
/*!40000 ALTER TABLE `sub41_changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_changedfields`
--

LOCK TABLES `sub41_changedfields` WRITE;
/*!40000 ALTER TABLE `sub41_changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_changedfields` VALUES (1,1,1,'8a6e64f9-321d-4af7-a127-8f93a0f10602','2025-06-25 09:15:33',0,3),(11,1,3,'907b0b2d-32ac-4a0b-a932-267eb2efe235','2025-06-23 10:19:37',0,3),(13,1,3,'907b0b2d-32ac-4a0b-a932-267eb2efe235','2025-06-23 10:19:23',0,3),(14,1,3,'907b0b2d-32ac-4a0b-a932-267eb2efe235','2025-06-23 10:20:09',0,3),(15,1,3,'907b0b2d-32ac-4a0b-a932-267eb2efe235','2025-06-23 10:19:48',0,3),(16,1,3,'83e91fbf-b380-46f8-82ff-2d8c80358adb','2025-06-24 13:01:49',0,3),(16,1,4,'a4f022c7-55a8-4e01-886d-86085984bb7c','2025-06-23 08:10:40',0,3),(16,1,6,'b58cf50d-0130-48e0-8993-4270d9cb20b4','2025-06-23 10:21:30',0,3),(17,1,5,'67d0b562-a644-4f8f-9703-8d0165c2e534','2025-06-23 10:21:30',0,3),(50,1,1,'ae048562-06fd-49b7-9e60-b3c9bb5b6a39','2025-06-25 13:17:41',0,3),(50,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:43:40',0,3),(52,1,2,'4da7212b-b18b-4781-897d-15da4c3d2e9b','2025-06-25 13:32:11',0,3),(52,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:45:15',0,3),(54,1,2,'4da7212b-b18b-4781-897d-15da4c3d2e9b','2025-06-25 13:38:53',0,3),(54,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:45:16',0,3),(56,1,2,'4da7212b-b18b-4781-897d-15da4c3d2e9b','2025-06-25 13:39:21',0,3),(56,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:45:18',0,3),(58,1,2,'4da7212b-b18b-4781-897d-15da4c3d2e9b','2025-06-25 13:39:09',0,3),(58,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:45:20',0,3),(60,1,2,'4da7212b-b18b-4781-897d-15da4c3d2e9b','2025-06-25 13:39:27',0,3),(60,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:45:20',0,3),(62,1,2,'4da7212b-b18b-4781-897d-15da4c3d2e9b','2025-06-25 13:39:43',0,3),(62,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:45:23',0,3),(64,1,2,'4da7212b-b18b-4781-897d-15da4c3d2e9b','2025-06-25 13:39:46',0,3),(64,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:45:23',0,3),(66,1,2,'4da7212b-b18b-4781-897d-15da4c3d2e9b','2025-06-25 13:39:48',0,3),(66,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:45:24',0,3),(68,1,2,'4da7212b-b18b-4781-897d-15da4c3d2e9b','2025-06-25 13:38:53',0,3),(68,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:45:16',0,3),(70,1,2,'4da7212b-b18b-4781-897d-15da4c3d2e9b','2025-06-25 13:38:54',0,3),(70,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:45:17',0,3),(72,1,2,'4da7212b-b18b-4781-897d-15da4c3d2e9b','2025-06-25 13:39:23',0,3),(72,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:45:18',0,3),(74,1,2,'4da7212b-b18b-4781-897d-15da4c3d2e9b','2025-06-25 13:39:24',0,3),(74,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:45:20',0,3),(76,1,2,'4da7212b-b18b-4781-897d-15da4c3d2e9b','2025-06-25 13:39:31',0,3),(76,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:45:20',0,3),(78,1,2,'4da7212b-b18b-4781-897d-15da4c3d2e9b','2025-06-25 13:39:44',0,3),(78,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:45:23',0,3),(80,1,2,'4da7212b-b18b-4781-897d-15da4c3d2e9b','2025-06-25 13:39:46',0,3),(80,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:45:24',0,3),(82,1,2,'4da7212b-b18b-4781-897d-15da4c3d2e9b','2025-06-25 13:39:48',0,3),(82,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:45:12',0,3),(84,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:47:02',0,3),(88,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:47:03',0,3),(90,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:47:05',0,3),(92,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:47:06',0,3),(94,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:47:07',0,3),(96,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:47:09',0,3),(98,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:47:09',0,3),(100,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:47:09',0,3),(102,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:47:04',0,3),(104,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:47:05',0,3),(106,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:47:06',0,3),(108,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:47:07',0,3),(110,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:47:09',0,3),(112,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:47:09',0,3),(132,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:47:10',0,3),(139,1,1,'8a6e64f9-321d-4af7-a127-8f93a0f10602','2025-06-23 10:17:00',0,3),(167,1,8,'4b6fba43-00e6-42e9-bd5d-df5a7c0e6d77','2025-06-24 10:53:57',0,3),(193,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 11:43:50',0,3),(211,1,12,'b52e2eda-b831-4172-a8b4-7e3a035063c1','2025-06-24 16:01:12',0,3),(212,1,9,'f20db730-adb1-464a-a81d-a7b1f4561641','2025-06-24 15:31:09',0,3),(213,1,2,'115b6113-df2d-45fb-ba86-d52c1d7796d0','2025-06-24 15:28:00',0,3),(213,1,9,'f20db730-adb1-464a-a81d-a7b1f4561641','2025-06-24 15:31:09',0,3),(213,1,11,'6c5af9fb-885b-4a4a-8994-f75bb36d71bf','2025-06-24 16:01:12',0,3),(390,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 14:48:01',0,3),(402,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 14:26:25',0,3),(404,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-25 14:26:24',0,3),(457,1,13,'9a743120-33d4-4879-96fd-896218a7bd14','2025-06-26 08:23:26',0,3);
/*!40000 ALTER TABLE `sub41_changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_craftidtokens`
--

LOCK TABLES `sub41_craftidtokens` WRITE;
/*!40000 ALTER TABLE `sub41_craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_deprecationerrors`
--

LOCK TABLES `sub41_deprecationerrors` WRITE;
/*!40000 ALTER TABLE `sub41_deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_drafts`
--

LOCK TABLES `sub41_drafts` WRITE;
/*!40000 ALTER TABLE `sub41_drafts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_drafts` VALUES (1,NULL,3,0,'First draft',NULL,0,NULL,0),(37,NULL,3,0,'First draft',NULL,0,NULL,1),(42,NULL,3,0,'First draft',NULL,0,NULL,0),(59,NULL,3,0,'First draft',NULL,0,NULL,0),(65,NULL,3,0,'First draft',NULL,0,NULL,0),(105,NULL,3,0,'First draft',NULL,0,NULL,0),(123,NULL,3,0,'First draft',NULL,0,NULL,0),(124,NULL,3,0,'First draft',NULL,0,NULL,0),(168,NULL,3,0,'First draft','',0,NULL,1),(172,NULL,3,0,'First draft','',0,NULL,1);
/*!40000 ALTER TABLE `sub41_drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_elementactivity`
--

LOCK TABLES `sub41_elementactivity` WRITE;
/*!40000 ALTER TABLE `sub41_elementactivity` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_elementactivity` VALUES (1,3,1,NULL,'edit','2025-06-25 09:15:30'),(1,3,1,NULL,'save','2025-06-25 09:15:33'),(8,3,1,NULL,'save','2025-06-20 16:06:21'),(11,3,1,NULL,'edit','2025-06-23 10:19:36'),(11,3,1,NULL,'save','2025-06-23 10:19:37'),(13,3,1,NULL,'edit','2025-06-23 10:19:21'),(13,3,1,NULL,'save','2025-06-23 10:19:23'),(14,3,1,NULL,'edit','2025-06-23 10:20:08'),(14,3,1,NULL,'save','2025-06-23 10:20:09'),(15,3,1,NULL,'edit','2025-06-23 10:19:47'),(15,3,1,NULL,'save','2025-06-23 10:19:48'),(16,3,1,NULL,'edit','2025-06-24 13:01:48'),(16,3,1,NULL,'save','2025-06-24 13:01:49'),(17,3,1,NULL,'edit','2025-06-23 10:20:56'),(17,3,1,NULL,'save','2025-06-23 08:11:08'),(18,3,1,NULL,'save','2025-06-23 08:17:34'),(20,3,1,NULL,'save','2025-06-23 08:17:41'),(22,3,1,NULL,'save','2025-06-23 08:17:52'),(24,3,1,NULL,'save','2025-06-23 08:18:03'),(26,3,1,NULL,'save','2025-06-23 08:18:12'),(28,3,1,NULL,'save','2025-06-23 08:18:22'),(30,3,1,NULL,'save','2025-06-23 08:18:33'),(32,3,1,NULL,'save','2025-06-23 08:18:49'),(34,3,1,NULL,'save','2025-06-23 08:18:58'),(36,3,1,NULL,'save','2025-06-23 08:19:07'),(38,3,1,NULL,'save','2025-06-23 08:19:15'),(40,3,1,NULL,'save','2025-06-23 08:19:24'),(42,3,1,NULL,'save','2025-06-23 08:19:31'),(44,3,1,NULL,'save','2025-06-23 08:19:40'),(46,3,1,NULL,'save','2025-06-23 08:19:49'),(48,3,1,NULL,'save','2025-06-23 08:20:30'),(50,3,1,NULL,'edit','2025-06-25 13:17:37'),(50,3,1,NULL,'save','2025-06-25 13:17:42'),(52,3,1,NULL,'edit','2025-06-25 13:32:00'),(52,3,1,NULL,'save','2025-06-25 13:38:52'),(54,3,1,NULL,'edit','2025-06-25 13:34:12'),(54,3,1,NULL,'save','2025-06-25 13:38:53'),(56,3,1,NULL,'edit','2025-06-25 13:39:19'),(56,3,1,NULL,'save','2025-06-25 13:39:21'),(58,3,1,NULL,'edit','2025-06-25 13:39:08'),(58,3,1,NULL,'save','2025-06-25 13:39:09'),(60,3,1,NULL,'edit','2025-06-25 13:39:26'),(60,3,1,NULL,'save','2025-06-25 13:39:27'),(62,3,1,NULL,'edit','2025-06-25 13:39:42'),(62,3,1,NULL,'save','2025-06-25 13:39:43'),(64,3,1,NULL,'edit','2025-06-25 13:38:12'),(64,3,1,NULL,'save','2025-06-25 13:39:46'),(66,3,1,NULL,'edit','2025-06-25 13:39:36'),(66,3,1,NULL,'save','2025-06-25 13:39:48'),(68,3,1,NULL,'edit','2025-06-25 13:34:00'),(68,3,1,NULL,'save','2025-06-25 13:38:53'),(70,3,1,NULL,'edit','2025-06-25 13:36:10'),(70,3,1,NULL,'save','2025-06-25 13:38:54'),(72,3,1,NULL,'edit','2025-06-25 13:39:14'),(72,3,1,NULL,'save','2025-06-25 13:39:23'),(74,3,1,NULL,'edit','2025-06-25 13:39:05'),(74,3,1,NULL,'save','2025-06-25 13:39:24'),(76,3,1,NULL,'edit','2025-06-25 13:39:29'),(76,3,1,NULL,'save','2025-06-25 13:39:31'),(78,3,1,NULL,'edit','2025-06-25 13:39:33'),(78,3,1,NULL,'save','2025-06-25 13:39:44'),(80,3,1,NULL,'edit','2025-06-25 13:38:23'),(80,3,1,NULL,'save','2025-06-25 13:39:54'),(82,3,1,NULL,'edit','2025-06-25 13:38:47'),(82,3,1,NULL,'save','2025-06-25 13:39:48'),(84,3,1,NULL,'edit','2025-06-25 11:46:38'),(84,3,1,NULL,'save','2025-06-25 11:47:02'),(88,3,1,NULL,'edit','2025-06-25 11:46:40'),(88,3,1,NULL,'save','2025-06-25 11:47:04'),(90,3,1,NULL,'edit','2025-06-25 11:46:43'),(90,3,1,NULL,'save','2025-06-25 11:47:05'),(92,3,1,NULL,'edit','2025-06-25 11:46:46'),(92,3,1,NULL,'save','2025-06-25 11:47:06'),(94,3,1,NULL,'edit','2025-06-25 11:46:48'),(94,3,1,NULL,'save','2025-06-25 11:47:07'),(96,3,1,NULL,'edit','2025-06-25 11:46:51'),(96,3,1,NULL,'save','2025-06-25 11:47:20'),(98,3,1,NULL,'edit','2025-06-25 11:46:54'),(98,3,1,NULL,'save','2025-06-25 11:47:21'),(100,3,1,NULL,'edit','2025-06-25 11:46:57'),(100,3,1,NULL,'save','2025-06-25 11:47:26'),(102,3,1,NULL,'edit','2025-06-25 11:46:42'),(102,3,1,NULL,'save','2025-06-25 11:47:04'),(104,3,1,NULL,'edit','2025-06-25 11:46:45'),(104,3,1,NULL,'save','2025-06-25 11:47:05'),(106,3,1,NULL,'edit','2025-06-25 11:46:47'),(106,3,1,NULL,'save','2025-06-25 11:47:06'),(108,3,1,NULL,'edit','2025-06-25 11:46:50'),(108,3,1,NULL,'save','2025-06-25 11:47:07'),(110,3,1,NULL,'edit','2025-06-25 11:46:53'),(110,3,1,NULL,'save','2025-06-25 11:47:21'),(112,3,1,NULL,'edit','2025-06-25 11:46:56'),(112,3,1,NULL,'save','2025-06-25 11:47:23'),(132,3,1,NULL,'edit','2025-06-25 11:46:59'),(132,3,1,NULL,'save','2025-06-25 11:47:28'),(134,3,1,NULL,'save','2025-06-23 08:48:48'),(139,3,1,NULL,'save','2025-06-23 10:17:06'),(142,3,1,NULL,'save','2025-06-23 10:17:20'),(144,3,1,NULL,'save','2025-06-23 10:17:35'),(146,3,1,NULL,'save','2025-06-23 10:17:46'),(148,3,1,NULL,'save','2025-06-23 10:17:53'),(167,3,1,NULL,'edit','2025-06-24 10:35:39'),(179,3,1,NULL,'save','2025-06-24 11:08:23'),(180,3,1,NULL,'save','2025-06-24 11:08:14'),(186,3,1,NULL,'edit','2025-06-24 14:55:11'),(193,3,1,NULL,'edit','2025-06-25 11:43:46'),(193,3,1,NULL,'save','2025-06-25 11:43:50'),(211,3,1,NULL,'edit','2025-06-24 16:01:09'),(253,3,1,NULL,'save','2025-06-25 10:32:04'),(255,3,1,NULL,'save','2025-06-25 10:32:18'),(390,3,1,NULL,'edit','2025-06-25 14:47:59'),(390,3,1,NULL,'save','2025-06-25 14:48:01'),(392,3,1,NULL,'edit','2025-06-25 14:16:46'),(392,3,1,NULL,'save','2025-06-25 14:16:46'),(394,3,1,NULL,'edit','2025-06-25 14:16:38'),(394,3,1,NULL,'save','2025-06-25 14:16:39'),(402,3,1,NULL,'edit','2025-06-25 14:26:02'),(402,3,1,NULL,'save','2025-06-25 14:26:25'),(404,3,1,NULL,'edit','2025-06-25 14:25:59'),(404,3,1,NULL,'save','2025-06-25 14:26:23'),(406,3,1,NULL,'save','2025-06-25 14:17:44'),(408,3,1,NULL,'save','2025-06-25 14:17:58'),(410,3,1,NULL,'save','2025-06-25 14:18:19'),(412,3,1,NULL,'save','2025-06-25 14:18:28'),(414,3,1,NULL,'save','2025-06-25 14:18:39'),(416,3,1,NULL,'save','2025-06-25 14:18:54'),(418,3,1,NULL,'save','2025-06-25 14:18:58'),(420,3,1,NULL,'save','2025-06-25 14:19:22'),(422,3,1,NULL,'save','2025-06-25 14:19:29'),(424,3,1,NULL,'save','2025-06-25 14:20:31'),(426,3,1,NULL,'save','2025-06-25 14:20:34'),(428,3,1,NULL,'save','2025-06-25 14:20:39'),(430,3,1,NULL,'save','2025-06-25 14:20:43'),(432,3,1,NULL,'save','2025-06-25 14:20:50'),(434,3,1,NULL,'save','2025-06-25 14:21:13'),(436,3,1,NULL,'save','2025-06-25 14:21:18'),(438,3,1,NULL,'save','2025-06-25 14:22:31'),(440,3,1,NULL,'save','2025-06-25 14:22:36'),(442,3,1,NULL,'save','2025-06-25 14:22:56'),(444,3,1,NULL,'save','2025-06-25 14:23:01'),(446,3,1,NULL,'save','2025-06-25 14:23:08'),(448,3,1,NULL,'save','2025-06-25 14:23:13'),(450,3,1,NULL,'save','2025-06-25 14:23:40'),(457,3,1,NULL,'save','2025-06-26 08:23:31');
/*!40000 ALTER TABLE `sub41_elementactivity` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_elements`
--

LOCK TABLES `sub41_elements` WRITE;
/*!40000 ALTER TABLE `sub41_elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_elements` VALUES (1,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-06-20 15:02:44','2025-06-25 09:15:32',NULL,NULL,NULL,'080350c9-9a5c-4803-ade5-2583a122a2f0'),(2,1,NULL,1,3,'craft\\elements\\Entry',1,0,'2025-06-20 15:02:44','2025-06-20 15:02:44',NULL,NULL,NULL,'72b02131-b417-4dec-b5b9-4065ef4284f0'),(3,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2025-06-20 15:02:44','2025-06-23 11:39:36',NULL,NULL,NULL,'4f86f2b1-0a89-4a99-806e-f919a651f5eb'),(4,NULL,1,NULL,3,'craft\\elements\\Entry',1,0,'2025-06-20 15:05:33','2025-06-20 15:05:33',NULL,NULL,NULL,'dad5d04f-2a84-4ca2-b982-f110918e1eef'),(5,NULL,NULL,NULL,7,'craft\\elements\\GlobalSet',1,0,'2025-06-20 15:57:13','2025-06-23 11:28:44',NULL,NULL,NULL,'861d3103-01e5-446c-b19c-8357db15e40d'),(6,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-06-20 15:59:33','2025-06-20 16:06:14',NULL,'2025-06-20 16:06:14',NULL,'1566196c-9834-4380-9428-3b87e953ef9c'),(7,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-06-20 15:59:50','2025-06-20 16:06:14',NULL,'2025-06-20 16:06:14',NULL,'e398cb35-0981-4ca9-bb98-31468958df8e'),(8,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-06-20 16:06:17','2025-06-20 16:08:34',NULL,'2025-06-20 16:08:34',NULL,'e2ea9eed-4349-452a-8dc0-95a69664464c'),(9,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-06-20 16:08:37','2025-06-23 11:23:09',NULL,'2025-06-23 11:23:09',NULL,'82bb865b-e853-4994-ab4b-d659ae2edd4f'),(10,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-06-20 16:08:55','2025-06-20 16:09:01',NULL,'2025-06-20 16:09:01',NULL,'f9be1a46-8b02-40ae-9961-44da56a1f386'),(11,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2025-06-20 16:20:37','2025-06-23 10:19:37',NULL,NULL,NULL,'94de2382-844d-476b-8a45-8ac11744828d'),(13,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2025-06-23 08:09:32','2025-06-23 10:19:23',NULL,NULL,NULL,'8aad46c5-e92b-4034-a698-a8a11e341f16'),(14,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2025-06-23 08:09:36','2025-06-23 10:20:09',NULL,NULL,NULL,'e5e78fc7-5a90-4ee6-946b-88d15b702947'),(15,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2025-06-23 08:09:39','2025-06-23 10:19:48',NULL,NULL,NULL,'20230773-97a2-41c7-87a1-a1612b8c5d21'),(16,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2025-06-23 08:09:44','2025-06-24 13:01:49',NULL,NULL,NULL,'e08d0047-bd40-4961-a730-3001ab0492e8'),(17,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2025-06-23 08:10:41','2025-06-23 10:21:29',NULL,NULL,NULL,'c02028f9-7364-4cec-aaa9-25921768ec4b'),(18,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:17:22','2025-06-23 08:24:45',NULL,'2025-06-23 08:24:45',NULL,'6e4bab44-2d0d-45fe-820a-14c4bcbaad56'),(19,18,NULL,2,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:17:34','2025-06-23 08:17:34',NULL,'2025-06-23 08:24:45',NULL,'7e4d6c49-9905-42eb-bacf-e0cbc9477e4c'),(20,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:17:35','2025-06-23 08:24:45',NULL,'2025-06-23 08:24:45',NULL,'cf4ef18e-930c-440d-ae7e-2259bdd64653'),(21,20,NULL,3,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:17:41','2025-06-23 08:17:41',NULL,'2025-06-23 08:24:45',NULL,'3b923bd1-cf06-4570-9784-8e8f51cae80a'),(22,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:17:50','2025-06-23 08:24:45',NULL,'2025-06-23 08:24:45',NULL,'a208e43d-e8cc-4977-86f4-ea17a5380b13'),(23,22,NULL,4,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:17:52','2025-06-23 08:17:52',NULL,'2025-06-23 08:24:45',NULL,'e892ff51-2e7b-44b6-8dc3-593b8980c014'),(24,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:17:57','2025-06-23 08:24:45',NULL,'2025-06-23 08:24:45',NULL,'9bc4405f-516c-4ad0-aac3-39e58b3de461'),(25,24,NULL,5,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:18:03','2025-06-23 08:18:03',NULL,'2025-06-23 08:24:45',NULL,'438ff046-fa82-4711-a1cd-165eee413439'),(26,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:18:07','2025-06-23 08:24:45',NULL,'2025-06-23 08:24:45',NULL,'fafeeb8c-e322-446f-88df-f369051cb281'),(27,26,NULL,6,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:18:12','2025-06-23 08:18:12',NULL,'2025-06-23 08:24:45',NULL,'6082d046-48fd-4b7e-8fd0-38297ecd024c'),(28,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:18:14','2025-06-23 08:24:45',NULL,'2025-06-23 08:24:45',NULL,'c9a552c7-be5d-4baf-ac84-39c03e80d47f'),(29,28,NULL,7,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:18:22','2025-06-23 08:18:22',NULL,'2025-06-23 08:24:45',NULL,'bc6be2c1-7087-44aa-836e-1466c9469963'),(30,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:18:30','2025-06-23 08:24:45',NULL,'2025-06-23 08:24:45',NULL,'0fb09797-0c3d-44e1-8390-7e47ccaa0cfc'),(31,30,NULL,8,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:18:33','2025-06-23 08:18:33',NULL,'2025-06-23 08:24:45',NULL,'d353be43-f2ea-4493-9627-fe135cf5cc2c'),(32,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:18:47','2025-06-23 08:24:45',NULL,'2025-06-23 08:24:45',NULL,'6215bbb6-db17-446a-b93d-cd757328079a'),(33,32,NULL,9,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:18:49','2025-06-23 08:18:49',NULL,'2025-06-23 08:24:45',NULL,'7ec26704-3cd3-4996-ab84-2e2e1e51939e'),(34,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:18:52','2025-06-23 08:24:45',NULL,'2025-06-23 08:24:45',NULL,'3d95aad3-ed26-4b01-9259-ba907fb391bb'),(35,34,NULL,10,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:18:58','2025-06-23 08:18:58',NULL,'2025-06-23 08:24:45',NULL,'852eb8aa-8216-428d-8ff1-ac6aed49ec22'),(36,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:19:01','2025-06-23 08:24:45',NULL,'2025-06-23 08:24:45',NULL,'5c026502-3d49-4fe2-aac7-90c305ce8b9b'),(37,36,NULL,11,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:19:07','2025-06-23 08:19:07',NULL,'2025-06-23 08:24:45',NULL,'2876fe58-d8db-430d-a7b5-01221e4148f9'),(38,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:19:07','2025-06-23 08:24:45',NULL,'2025-06-23 08:24:45',NULL,'2bbe94da-0cd7-4ad0-b238-53e38777fce2'),(39,38,NULL,12,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:19:15','2025-06-23 08:19:15',NULL,'2025-06-23 08:24:45',NULL,'5b4c11d1-f6ca-4831-836e-8bfab592a64e'),(40,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:19:22','2025-06-23 08:24:45',NULL,'2025-06-23 08:24:45',NULL,'766a09cb-5c07-426c-849a-5b276a076c5a'),(41,40,NULL,13,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:19:24','2025-06-23 08:19:24',NULL,'2025-06-23 08:24:45',NULL,'9f728afc-bc22-4b5b-94aa-9efd5658da9e'),(42,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:19:25','2025-06-23 08:24:45',NULL,'2025-06-23 08:24:45',NULL,'352a77aa-003a-40ed-958d-a8e25d3466b6'),(43,42,NULL,14,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:19:31','2025-06-23 08:19:31',NULL,'2025-06-23 08:24:45',NULL,'ee0ca0fe-e5db-452f-910b-66f651808835'),(44,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:19:34','2025-06-23 08:24:45',NULL,'2025-06-23 08:24:45',NULL,'4b3d876e-6082-49ac-bdd5-863255a78be0'),(45,44,NULL,15,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:19:40','2025-06-23 08:19:40',NULL,'2025-06-23 08:24:45',NULL,'3f550cb7-2f0b-4ee2-9d0e-2322c82dd4de'),(46,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:19:42','2025-06-23 08:24:45',NULL,'2025-06-23 08:24:45',NULL,'29efda54-c48c-46d6-9553-77b12dc233a9'),(47,46,NULL,16,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:19:49','2025-06-23 08:19:49',NULL,'2025-06-23 08:24:45',NULL,'e131427c-20c5-4851-9c53-68f9e197f015'),(48,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:19:49','2025-06-23 08:24:45',NULL,'2025-06-23 08:24:45',NULL,'3ecea68b-4220-4485-ae63-781d87341b26'),(49,48,NULL,17,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:20:30','2025-06-23 08:20:30',NULL,'2025-06-23 08:24:45',NULL,'273ffa80-543d-42e6-8a2b-90b670f80294'),(50,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:20:32','2025-06-25 13:17:41',NULL,NULL,NULL,'50404194-72db-4eba-96ba-249ad6d3c817'),(51,50,NULL,18,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:21:04','2025-06-23 08:21:04',NULL,NULL,NULL,'46525164-dc48-4b1d-9ae1-bff054c4cede'),(52,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:15','2025-06-25 13:38:52',NULL,NULL,NULL,'e92ba4b5-78ee-48bc-8515-7bfbfd8c6928'),(53,52,NULL,19,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:15','2025-06-23 08:24:15',NULL,NULL,NULL,'31b2c930-fe2f-4ebb-8417-a716294c3cd7'),(54,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:15','2025-06-25 13:38:53',NULL,NULL,NULL,'21096baf-9c65-48cf-854c-f138de57c844'),(55,54,NULL,20,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:15','2025-06-23 08:24:15',NULL,NULL,NULL,'d126e0fb-7fcd-4bdf-89b8-79fd6f893dc3'),(56,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:15','2025-06-25 13:39:21',NULL,NULL,NULL,'f2d9e789-a9e9-47c4-b21f-f83cfb20d9f9'),(57,56,NULL,21,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:15','2025-06-23 08:24:15',NULL,NULL,NULL,'1e4a9d38-a9eb-4407-9421-3633448efabb'),(58,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:15','2025-06-25 13:39:09',NULL,NULL,NULL,'956090fc-257a-475a-ab6b-67b3bf6ec0b0'),(59,58,NULL,22,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:15','2025-06-23 08:24:15',NULL,NULL,NULL,'a4bade73-3bd8-47f8-9c3d-cf31cc1277e8'),(60,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:15','2025-06-25 13:39:27',NULL,NULL,NULL,'b8c7927a-bccb-4b5c-97b6-2d71bc13a16f'),(61,60,NULL,23,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:15','2025-06-23 08:24:15',NULL,NULL,NULL,'9e64001b-c33c-476a-92ab-9d32c600ab0a'),(62,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:15','2025-06-25 13:39:43',NULL,NULL,NULL,'f9b82374-5d19-4207-b20d-319c9b132cab'),(63,62,NULL,24,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:15','2025-06-23 08:24:15',NULL,NULL,NULL,'098f5175-6c52-4320-b0c4-eb2d98d6323f'),(64,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:16','2025-06-25 13:39:46',NULL,NULL,NULL,'ab3c6181-7c08-4444-9759-20624f8b1433'),(65,64,NULL,25,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:16','2025-06-23 08:24:16',NULL,NULL,NULL,'ff929941-5f8a-4ab1-b5f9-3409fbe9bd40'),(66,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:16','2025-06-25 13:39:48',NULL,NULL,NULL,'e0fdbc90-6e03-46f2-9fc1-d57644c18a32'),(67,66,NULL,26,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:16','2025-06-23 08:24:16',NULL,NULL,NULL,'8caa2d69-e3d8-4f7e-bd9a-6dead8a38ff4'),(68,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:16','2025-06-25 13:38:53',NULL,NULL,NULL,'b5342364-03e4-4393-ad70-ceccee13fef1'),(69,68,NULL,27,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:16','2025-06-23 08:24:16',NULL,NULL,NULL,'fb6e7eb0-eb80-41b0-88e3-57f9478fa91a'),(70,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:16','2025-06-25 13:38:54',NULL,NULL,NULL,'2bd4dab8-ff6b-4341-964d-a7a7b342bdf2'),(71,70,NULL,28,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:16','2025-06-23 08:24:16',NULL,NULL,NULL,'c0a7d316-9890-4085-8b62-c0ebdd1fd631'),(72,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:16','2025-06-25 13:39:23',NULL,NULL,NULL,'ea8741d1-be2d-4ca1-ac55-55dafd2a1f15'),(73,72,NULL,29,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:16','2025-06-23 08:24:16',NULL,NULL,NULL,'2285b5a0-972f-4269-aeac-a6115c4c920a'),(74,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:16','2025-06-25 13:39:24',NULL,NULL,NULL,'84e3c9f2-9fc0-494e-847f-cdeb0894d146'),(75,74,NULL,30,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:16','2025-06-23 08:24:16',NULL,NULL,NULL,'9a350b9c-882c-4608-a492-055eca1d9579'),(76,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:16','2025-06-25 13:39:31',NULL,NULL,NULL,'1b16dc2b-2f34-4ff7-993c-59f8fc905507'),(77,76,NULL,31,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:16','2025-06-23 08:24:16',NULL,NULL,NULL,'9824cb81-6665-4484-bd29-3bdab9763a95'),(78,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:16','2025-06-25 13:39:44',NULL,NULL,NULL,'1aa47858-5793-4151-9579-1fe02126e280'),(79,78,NULL,32,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:16','2025-06-23 08:24:16',NULL,NULL,NULL,'9540d814-2952-4388-9dc8-58503a439650'),(80,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:16','2025-06-25 13:39:54',NULL,NULL,NULL,'122cff80-919c-4a2c-9d1d-1f7c424a7d7c'),(81,80,NULL,33,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:16','2025-06-23 08:24:16',NULL,NULL,NULL,'50568b24-b968-4798-83f5-f29d00b4036a'),(82,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:16','2025-06-25 13:39:48',NULL,NULL,NULL,'15e14a14-4ee7-4db8-a140-d37f9699089e'),(83,82,NULL,34,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:16','2025-06-23 08:24:16',NULL,NULL,NULL,'818508e0-e623-4db4-ae9d-50ee47030311'),(84,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:16','2025-06-25 11:47:02',NULL,NULL,NULL,'2ed2929a-3ede-44e8-8fa3-791e7509a7e6'),(85,84,NULL,35,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:24:16','2025-06-23 08:24:16',NULL,NULL,NULL,'1fbc6d19-f257-46e9-a532-ab6fed22588c'),(87,84,NULL,36,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:25:10','2025-06-23 08:25:10',NULL,NULL,NULL,'0590975d-75dc-47b2-b706-deb1414b4b5a'),(88,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:25:42','2025-06-25 11:47:03',NULL,NULL,NULL,'b8213745-d39c-4cb5-a625-eb2d32ca4958'),(89,88,NULL,37,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:26:31','2025-06-23 08:26:31',NULL,NULL,NULL,'32b96df1-98ba-4336-8441-8e1f8cf092e2'),(90,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:26:31','2025-06-25 11:47:05',NULL,NULL,NULL,'69117736-c040-4ce8-9159-634693c9994e'),(91,90,NULL,38,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:26:35','2025-06-23 08:26:35',NULL,NULL,NULL,'d364b44e-0c0b-4545-bcf4-2e9b52654aa3'),(92,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:26:35','2025-06-25 11:47:06',NULL,NULL,NULL,'4de647dd-654d-4e08-9d3b-85733a93986e'),(93,92,NULL,39,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:26:44','2025-06-23 08:26:44',NULL,NULL,NULL,'79fdfad2-820c-45ca-8f64-77ed861e6e4c'),(94,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:26:44','2025-06-25 11:47:07',NULL,NULL,NULL,'b64ad081-9026-4d3a-ab99-747469257168'),(95,94,NULL,40,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:26:55','2025-06-23 08:26:55',NULL,NULL,NULL,'6ac3a5c3-81ae-42a0-85cd-ed746b6bf635'),(96,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:26:55','2025-06-25 11:47:20',NULL,NULL,NULL,'b7f5392a-89d6-42e0-a81a-99d1e8a1609b'),(97,96,NULL,41,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:27:24','2025-06-23 08:27:24',NULL,NULL,NULL,'59b5d3c9-0242-4e9c-9359-17ba94027524'),(98,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:27:24','2025-06-25 11:47:21',NULL,NULL,NULL,'175f0542-b8c7-4929-b43d-689a1db48765'),(99,98,NULL,42,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:27:30','2025-06-23 08:27:31',NULL,NULL,NULL,'b5f9392d-c65e-4279-9c6b-9a8a8487f82a'),(100,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:27:31','2025-06-25 11:47:26',NULL,NULL,NULL,'765672e7-a13b-4a08-b814-d45a3f413185'),(101,100,NULL,43,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:27:35','2025-06-23 08:27:35',NULL,NULL,NULL,'4dbc03c3-265b-401f-aaca-3ff40c3bb0ef'),(102,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:27:35','2025-06-25 11:47:04',NULL,NULL,NULL,'ee832fb8-73df-4413-bc09-086f05680fe1'),(103,102,NULL,44,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:30:24','2025-06-23 08:30:24',NULL,NULL,NULL,'0dfc3876-5416-4bcd-9bc9-488a6841d34b'),(104,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:30:24','2025-06-25 11:47:05',NULL,NULL,NULL,'60ba95ab-40de-4c2f-b200-cd5022dcbc67'),(105,104,NULL,45,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:30:32','2025-06-23 08:30:32',NULL,NULL,NULL,'0c777bab-6325-4840-b002-eb136845aee4'),(106,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:30:32','2025-06-25 11:47:06',NULL,NULL,NULL,'a39d9801-0fc2-4af5-b168-d4b9e277b98b'),(107,106,NULL,46,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:30:42','2025-06-23 08:30:42',NULL,NULL,NULL,'3bff24be-6756-4a6c-9af9-d425bf39f34f'),(108,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:30:42','2025-06-25 11:47:07',NULL,NULL,NULL,'77da4375-33cf-4850-b13e-3957c4e2be7d'),(109,108,NULL,47,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:30:51','2025-06-23 08:30:51',NULL,NULL,NULL,'e08518b4-63c2-49b0-9b47-5ec65a438cdf'),(110,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:30:51','2025-06-25 11:47:21',NULL,NULL,NULL,'f3e4aa13-619b-4fbc-aac1-d1f1322ccd1c'),(111,110,NULL,48,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:31:00','2025-06-23 08:31:00',NULL,NULL,NULL,'81b2ee98-0c69-406c-97f8-01e857963d25'),(112,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:31:00','2025-06-25 11:47:23',NULL,NULL,NULL,'1e563a81-afcb-4758-99d9-2a65f5a70491'),(113,112,NULL,49,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:31:08','2025-06-23 08:31:08',NULL,NULL,NULL,'37c09011-9b11-477c-81fa-071c5928e9ed'),(114,NULL,37,NULL,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:31:08','2025-06-23 08:50:41',NULL,'2025-06-23 08:50:41',NULL,'8c18737f-6b75-4899-89b5-ea847bbb7dc7'),(115,52,NULL,50,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:32:44','2025-06-23 08:32:44',NULL,NULL,NULL,'650c8a97-8f48-4bf1-95d8-d1540bcee8d9'),(116,68,NULL,51,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:32:44','2025-06-23 08:32:44',NULL,NULL,NULL,'cdf931e7-3141-4739-9ef2-44f93c249fd9'),(117,54,NULL,52,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:32:44','2025-06-23 08:32:44',NULL,NULL,NULL,'1470a60f-c8a6-4425-ba2b-072752b446d1'),(118,70,NULL,53,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:32:44','2025-06-23 08:32:44',NULL,NULL,NULL,'bcb2c635-1bfc-4e67-8159-465444e43242'),(119,56,NULL,54,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:32:44','2025-06-23 08:32:44',NULL,NULL,NULL,'223704f0-6dad-4e5f-82b7-51d09f52b563'),(120,72,NULL,55,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:32:44','2025-06-23 08:32:44',NULL,NULL,NULL,'9283ddf0-202b-4bae-b9a7-7e76eea671ef'),(121,58,NULL,56,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:32:44','2025-06-23 08:32:44',NULL,NULL,NULL,'3da8b7d8-477c-43d6-966c-ad1f01a60a67'),(122,74,NULL,57,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:32:44','2025-06-23 08:32:44',NULL,NULL,NULL,'4fd05112-775b-4513-9cea-49194b48a8ac'),(123,60,NULL,58,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:32:44','2025-06-23 08:32:44',NULL,NULL,NULL,'6f94a494-53e0-4c1c-9d7c-4e4f08a56700'),(124,76,NULL,59,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:32:44','2025-06-23 08:32:44',NULL,NULL,NULL,'0eda3fc0-bf50-4474-8103-6af8258dc839'),(125,62,NULL,60,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:32:44','2025-06-23 08:32:44',NULL,NULL,NULL,'7d624f33-41b9-4c02-904d-d6fb70a65adc'),(126,78,NULL,61,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:32:44','2025-06-23 08:32:44',NULL,NULL,NULL,'742c4f9f-6e54-439c-ba5a-a517b85d9293'),(127,64,NULL,62,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:32:44','2025-06-23 08:32:44',NULL,NULL,NULL,'7ba44fb8-d27e-4190-a2ec-4b289e777467'),(128,80,NULL,63,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:32:44','2025-06-23 08:32:44',NULL,NULL,NULL,'d1adae91-c239-4cad-9e91-c9d25ac3716d'),(129,66,NULL,64,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:32:44','2025-06-23 08:32:44',NULL,NULL,NULL,'c01f7895-431e-40d9-b5a3-32ab2a4dfe55'),(130,82,NULL,65,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:32:44','2025-06-23 08:32:44',NULL,NULL,NULL,'d01df79c-85aa-414f-85f2-2bb32a8f51da'),(131,84,NULL,66,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:32:44','2025-06-23 08:32:44',NULL,NULL,NULL,'5f494043-48a9-48ea-9187-6c13d61cacf0'),(132,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-23 08:37:10','2025-06-25 11:47:28',NULL,NULL,NULL,'21f9af3e-3c28-4d2b-97ad-8f4ac7d7a51e'),(133,132,NULL,67,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:37:44','2025-06-23 08:37:44',NULL,NULL,NULL,'3a1084b5-0810-471b-9e09-cf5e9a68b2ae'),(134,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:48:33','2025-06-23 08:49:18',NULL,'2025-06-23 08:49:18',NULL,'e1975d2f-4931-433c-a9cb-d32532250ea0'),(135,134,NULL,68,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:48:48','2025-06-23 08:48:48',NULL,'2025-06-23 08:49:18',NULL,'a51c503e-498c-4a64-9a5a-e6da5411a608'),(137,82,NULL,69,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:50:11','2025-06-23 08:50:11',NULL,NULL,NULL,'21c1afd6-73d5-4d0b-a2fa-69e7018a305b'),(138,82,NULL,70,3,'craft\\elements\\Entry',1,0,'2025-06-23 08:50:36','2025-06-23 08:50:36',NULL,NULL,NULL,'ab2ebb9f-86b9-4932-885b-78071ac179d6'),(139,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-06-23 10:16:52','2025-06-24 13:01:26',NULL,'2025-06-24 13:01:26',NULL,'e05bbee2-4208-428e-9c2c-802b63a6a8f8'),(140,NULL,42,NULL,2,'craft\\elements\\Entry',1,0,'2025-06-23 10:17:00','2025-06-23 10:17:00',NULL,NULL,NULL,'5e265f02-98c2-4f79-984d-e3e38d1b3a81'),(141,139,NULL,71,3,'craft\\elements\\Entry',1,0,'2025-06-23 10:17:06','2025-06-23 10:17:06',NULL,'2025-06-24 13:01:26',NULL,'519d51bd-11c1-4fc6-a56b-947bc799364e'),(142,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-06-23 10:17:10','2025-06-23 10:17:19',NULL,NULL,NULL,'33607704-1fb0-42fa-8cbf-c003f28ecc5d'),(143,142,NULL,72,3,'craft\\elements\\Entry',1,0,'2025-06-23 10:17:19','2025-06-23 10:17:19',NULL,NULL,NULL,'e1726d58-08ed-4d13-a171-f78b7d913cb9'),(144,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-06-23 10:17:21','2025-06-23 10:17:35',NULL,NULL,NULL,'298c9824-0316-4872-a8b4-a089e3d92f38'),(145,144,NULL,73,3,'craft\\elements\\Entry',1,0,'2025-06-23 10:17:35','2025-06-23 10:17:35',NULL,NULL,NULL,'975a37d5-51b6-4ea6-8b99-8e0b6042c5e6'),(146,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-06-23 10:17:36','2025-06-23 10:17:46',NULL,NULL,NULL,'09db9891-ee61-4f6f-8a21-b333a26890ab'),(147,146,NULL,74,3,'craft\\elements\\Entry',1,0,'2025-06-23 10:17:46','2025-06-23 10:17:46',NULL,NULL,NULL,'5a63e6ad-51bf-460c-a073-ac18ce136ee1'),(148,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-06-23 10:17:46','2025-06-23 10:17:53',NULL,NULL,NULL,'db62dff7-482b-4368-a785-770b9a60330e'),(149,148,NULL,75,3,'craft\\elements\\Entry',1,0,'2025-06-23 10:17:53','2025-06-23 10:17:53',NULL,NULL,NULL,'7d7fd113-f702-4333-a41a-4456625ae6fc'),(157,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2025-06-23 10:21:29','2025-06-23 10:21:29',NULL,NULL,NULL,'e6c33a3b-d3ed-4948-8eba-820c39d5b049'),(159,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-06-23 11:20:06','2025-06-23 11:20:09',NULL,'2025-06-23 11:20:09',NULL,'01b2d5ec-cbdb-4f6f-932a-4c65038f2bf9'),(160,NULL,NULL,NULL,8,'craft\\elements\\Asset',1,0,'2025-06-23 11:24:50','2025-06-23 11:25:22',NULL,'2025-06-23 11:25:22',NULL,'87e47004-7d36-4258-b6c0-caa4f5071bf4'),(161,NULL,NULL,NULL,8,'craft\\elements\\Asset',1,0,'2025-06-23 11:25:04','2025-06-23 11:25:22',NULL,'2025-06-23 11:25:22',NULL,'9919d38d-ec50-4a61-9c09-bbb6e4fdf500'),(162,NULL,NULL,NULL,8,'craft\\elements\\Asset',1,0,'2025-06-23 11:25:33','2025-06-23 11:26:19',NULL,'2025-06-23 11:26:19',NULL,'ba07a717-39bd-4481-9cc7-4562bc5b623f'),(163,NULL,NULL,NULL,8,'craft\\elements\\Asset',1,0,'2025-06-23 11:28:40','2025-06-23 11:28:40',NULL,NULL,NULL,'14feb15c-a6e8-4593-a68f-542051459f7b'),(166,NULL,NULL,NULL,8,'craft\\elements\\Asset',1,0,'2025-06-24 10:04:27','2025-06-24 10:04:27',NULL,NULL,NULL,'2c997144-5cd7-41da-801d-445d66bd7c2f'),(167,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2025-06-24 10:04:35','2025-06-24 10:53:57',NULL,NULL,NULL,'94b1e405-812b-4434-9379-73b093788e33'),(168,1,NULL,76,3,'craft\\elements\\Entry',1,0,'2025-06-24 10:04:35','2025-06-24 10:04:36',NULL,NULL,NULL,'3d226790-bd23-4423-899e-ee7b0a62bf55'),(169,167,NULL,77,2,'craft\\elements\\Entry',1,0,'2025-06-24 10:04:35','2025-06-24 10:04:36',NULL,NULL,NULL,'b62932dc-3934-453f-b3c3-119f78d6cbc5'),(172,NULL,59,NULL,2,'craft\\elements\\Entry',1,0,'2025-06-24 10:53:54','2025-06-24 10:53:54',NULL,NULL,NULL,'56176508-7afe-4a78-aad6-61c866f76566'),(173,167,NULL,78,2,'craft\\elements\\Entry',1,0,'2025-06-24 10:53:57','2025-06-24 10:53:57',NULL,NULL,NULL,'462154b6-2d89-456b-92b2-6532b5cf721b'),(174,1,NULL,79,3,'craft\\elements\\Entry',1,0,'2025-06-24 10:53:57','2025-06-24 10:53:57',NULL,NULL,NULL,'887601c1-38ee-46a7-8939-3810c360692b'),(179,NULL,NULL,NULL,8,'craft\\elements\\Asset',1,0,'2025-06-24 11:07:42','2025-06-24 11:08:23',NULL,NULL,NULL,'6412c217-2c16-4c39-9106-d9dd06e45e76'),(180,NULL,NULL,NULL,8,'craft\\elements\\Asset',1,0,'2025-06-24 11:07:43','2025-06-24 11:08:14',NULL,NULL,NULL,'ff38d8e4-a8ec-4976-986e-fdf798c76bd5'),(181,NULL,NULL,NULL,8,'craft\\elements\\Asset',1,0,'2025-06-24 11:09:04','2025-06-24 11:09:04',NULL,NULL,NULL,'61749a0c-f32f-4371-b0a6-96e3fb553a38'),(182,NULL,NULL,NULL,8,'craft\\elements\\Asset',1,0,'2025-06-24 11:09:04','2025-06-24 11:09:04',NULL,NULL,NULL,'79ee2dff-fb76-4503-a96e-2ea7745c9e46'),(186,NULL,NULL,NULL,10,'craft\\elements\\Entry',1,0,'2025-06-24 11:10:10','2025-06-24 14:55:14',NULL,NULL,NULL,'b86816d9-0052-44cb-b8b8-7fefde82ddcc'),(187,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2025-06-24 11:10:10','2025-06-24 11:10:10',NULL,NULL,NULL,'d3e1a237-4ce7-427a-93a5-8a600cc5837d'),(188,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2025-06-24 11:10:10','2025-06-24 11:10:10',NULL,NULL,NULL,'6cf3d009-72eb-4858-8cb4-eac4166c6c22'),(189,186,NULL,83,10,'craft\\elements\\Entry',1,0,'2025-06-24 11:10:10','2025-06-24 11:10:10',NULL,NULL,NULL,'1305fec5-9abd-46dc-9aaa-af291e5f3f88'),(190,187,NULL,84,9,'craft\\elements\\Entry',1,0,'2025-06-24 11:10:10','2025-06-24 11:10:10',NULL,NULL,NULL,'0f38ef81-be3a-4784-9fc8-300460134094'),(191,188,NULL,85,9,'craft\\elements\\Entry',1,0,'2025-06-24 11:10:10','2025-06-24 11:10:10',NULL,NULL,NULL,'6881449c-818e-4809-8664-56ad5e45eddf'),(192,1,NULL,86,3,'craft\\elements\\Entry',1,0,'2025-06-24 11:10:10','2025-06-24 11:10:10',NULL,NULL,NULL,'795de930-acc7-4e50-9c27-56e43a66dd27'),(193,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-24 13:00:45','2025-06-25 11:43:50',NULL,NULL,NULL,'994e3c48-2087-4039-bb02-f5eca9069c25'),(194,193,NULL,87,3,'craft\\elements\\Entry',1,0,'2025-06-24 13:00:53','2025-06-24 13:00:53',NULL,NULL,NULL,'b1b53006-409b-46a4-8200-77d37a03be75'),(195,NULL,65,NULL,3,'craft\\elements\\Entry',1,0,'2025-06-24 13:01:27','2025-06-24 13:01:27',NULL,NULL,NULL,'a22842cd-a80d-45a0-9eb4-dfb00f18f40b'),(197,1,NULL,88,3,'craft\\elements\\Entry',1,0,'2025-06-24 14:20:53','2025-06-24 14:20:53',NULL,NULL,NULL,'7c64e2d3-b2af-4991-b24c-b127168afd2c'),(201,186,NULL,90,10,'craft\\elements\\Entry',1,0,'2025-06-24 14:55:14','2025-06-24 14:55:14',NULL,NULL,NULL,'eea8c356-75fb-433a-b6bb-d5739848f949'),(202,1,NULL,91,3,'craft\\elements\\Entry',1,0,'2025-06-24 14:55:14','2025-06-24 14:55:15',NULL,NULL,NULL,'fd12ed43-a270-4fe8-a7ee-7b880fe1de07'),(206,NULL,NULL,NULL,8,'craft\\elements\\Asset',1,0,'2025-06-24 15:22:57','2025-06-24 15:22:57',NULL,NULL,NULL,'175d9114-2049-46c7-b26d-834f8c53f8eb'),(211,NULL,NULL,NULL,12,'craft\\elements\\Entry',1,0,'2025-06-24 15:25:47','2025-06-24 16:01:12',NULL,NULL,NULL,'49b14480-06f5-44a8-b09d-3870534be924'),(212,NULL,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2025-06-24 15:25:47','2025-06-24 15:31:09',NULL,NULL,NULL,'3fdb9f14-0e1c-40b9-be4d-597f08d7e4c0'),(213,NULL,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2025-06-24 15:25:47','2025-06-24 16:01:12',NULL,NULL,NULL,'59945305-1b28-45aa-8389-c5e327c759cf'),(214,211,NULL,95,12,'craft\\elements\\Entry',1,0,'2025-06-24 15:25:47','2025-06-24 15:25:47',NULL,NULL,NULL,'795efa05-30ea-400b-b367-97774fa9b837'),(215,212,NULL,96,11,'craft\\elements\\Entry',1,0,'2025-06-24 15:25:47','2025-06-24 15:25:47',NULL,NULL,NULL,'7f9325af-381f-4bb5-ac7e-9cc196cee0ca'),(216,213,NULL,97,11,'craft\\elements\\Entry',1,0,'2025-06-24 15:25:47','2025-06-24 15:25:47',NULL,NULL,NULL,'c23981a0-445c-4d4e-b7ae-84d582e0842d'),(217,1,NULL,98,3,'craft\\elements\\Entry',1,0,'2025-06-24 15:25:47','2025-06-24 15:25:47',NULL,NULL,NULL,'0ffb05c5-116e-4f71-a22b-9dcf6832a293'),(218,NULL,NULL,NULL,8,'craft\\elements\\Asset',1,0,'2025-06-24 15:27:54','2025-06-24 15:27:54',NULL,NULL,NULL,'4f7fd705-5eab-4f78-b2cd-523abc410d98'),(224,211,NULL,101,12,'craft\\elements\\Entry',1,0,'2025-06-24 15:28:00','2025-06-24 15:28:00',NULL,NULL,NULL,'d533f362-a55b-4967-9395-024498c99b2a'),(225,213,NULL,102,11,'craft\\elements\\Entry',1,0,'2025-06-24 15:28:00','2025-06-24 15:28:00',NULL,NULL,NULL,'d6f7baa7-7956-4961-9454-fe3c95e6ec92'),(226,1,NULL,103,3,'craft\\elements\\Entry',1,0,'2025-06-24 15:28:00','2025-06-24 15:28:00',NULL,NULL,NULL,'5c58e0d2-c7ae-4d57-8c40-31bc7a86e6bd'),(234,211,NULL,107,12,'craft\\elements\\Entry',1,0,'2025-06-24 15:31:09','2025-06-24 15:31:09',NULL,NULL,NULL,'943e469a-4f22-4f2d-98f2-91c5c4ac8bcf'),(235,212,NULL,108,11,'craft\\elements\\Entry',1,0,'2025-06-24 15:31:09','2025-06-24 15:31:09',NULL,NULL,NULL,'c4161504-da3f-4b2a-b72d-636c52bcbeaf'),(236,213,NULL,109,11,'craft\\elements\\Entry',1,0,'2025-06-24 15:31:09','2025-06-24 15:31:09',NULL,NULL,NULL,'e4402f27-779f-4853-a1cd-ed36c2490313'),(237,1,NULL,110,3,'craft\\elements\\Entry',1,0,'2025-06-24 15:31:09','2025-06-24 15:31:09',NULL,NULL,NULL,'321f33c3-e6c2-483b-91a2-c80fcc841c04'),(243,211,NULL,113,12,'craft\\elements\\Entry',1,0,'2025-06-24 16:01:12','2025-06-24 16:01:12',NULL,NULL,NULL,'3a999ccf-f168-4f33-8c17-1fa186d49516'),(244,213,NULL,114,11,'craft\\elements\\Entry',1,0,'2025-06-24 16:01:12','2025-06-24 16:01:12',NULL,NULL,NULL,'8a0c0e15-cbeb-4d8a-ae79-f1434c0033c0'),(245,1,NULL,115,3,'craft\\elements\\Entry',1,0,'2025-06-24 16:01:12','2025-06-24 16:01:12',NULL,NULL,NULL,'d77f73ab-135a-4e2a-a93c-f8fba0a9471b'),(249,NULL,NULL,NULL,13,'craft\\elements\\Entry',1,0,'2025-06-25 09:15:33','2025-06-25 09:15:33',NULL,NULL,NULL,'7665174f-ce02-453a-8abe-2a2d39700ade'),(250,249,NULL,117,13,'craft\\elements\\Entry',1,0,'2025-06-25 09:15:33','2025-06-25 09:15:33',NULL,NULL,NULL,'26939bd5-523c-433e-b178-d471962efc0c'),(251,1,NULL,118,3,'craft\\elements\\Entry',1,0,'2025-06-25 09:15:32','2025-06-25 09:15:33',NULL,NULL,NULL,'3cb273f4-6979-4c90-92b4-e67f3100358f'),(252,NULL,NULL,NULL,14,'craft\\elements\\GlobalSet',1,0,'2025-06-25 10:23:27','2025-06-25 10:33:40',NULL,NULL,NULL,'114e0eaa-67db-473a-a450-04a4a53bba35'),(253,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-06-25 10:31:58','2025-06-25 10:32:04',NULL,NULL,NULL,'9071cfe8-4676-4488-ad90-309c1aa6771c'),(254,253,NULL,119,3,'craft\\elements\\Entry',1,0,'2025-06-25 10:32:04','2025-06-25 10:32:04',NULL,NULL,NULL,'b1b58d49-2da8-4902-a4d7-c386924c416e'),(255,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-06-25 10:32:06','2025-06-25 10:32:18',NULL,NULL,NULL,'ef31b3c4-f3ae-449b-b503-547d870bfa84'),(256,255,NULL,120,3,'craft\\elements\\Entry',1,0,'2025-06-25 10:32:18','2025-06-25 10:32:18',NULL,NULL,NULL,'7383b76e-f41c-4299-b281-a44495da5696'),(259,50,NULL,121,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:43:40','2025-06-25 11:43:40',NULL,NULL,NULL,'185bc1ba-efdd-40b1-924c-30a55a68dfed'),(261,193,NULL,122,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:43:50','2025-06-25 11:43:50',NULL,NULL,NULL,'aad6f8b1-2911-49e0-9fcb-5ce5d6acad3b'),(278,82,NULL,123,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:45:12','2025-06-25 11:45:12',NULL,NULL,NULL,'d493675a-ad50-465f-b591-f7d360e0619a'),(279,52,NULL,124,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:45:15','2025-06-25 11:45:15',NULL,NULL,NULL,'e0199685-f213-4ee9-aeac-1cdcbe7814db'),(280,68,NULL,125,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:45:16','2025-06-25 11:45:16',NULL,NULL,NULL,'748f73f3-0956-49ed-b326-1562c2a05d5a'),(281,54,NULL,126,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:45:16','2025-06-25 11:45:16',NULL,NULL,NULL,'7875f426-8ace-442f-8aec-25455e15e9d8'),(282,70,NULL,127,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:45:17','2025-06-25 11:45:17',NULL,NULL,NULL,'45b9f742-cdaa-4f52-bc10-a55e0b2ddd00'),(283,56,NULL,128,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:45:18','2025-06-25 11:45:18',NULL,NULL,NULL,'eb6f0521-9135-4a34-9a15-2388921354b0'),(284,72,NULL,129,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:45:18','2025-06-25 11:45:18',NULL,NULL,NULL,'61347ef5-ab17-4ac8-8938-97f032492a97'),(285,58,NULL,130,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:45:20','2025-06-25 11:45:20',NULL,NULL,NULL,'9b83b451-7b05-493f-9ab9-956593c2c4b4'),(286,74,NULL,131,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:45:20','2025-06-25 11:45:20',NULL,NULL,NULL,'cf2e7207-8e3d-4c62-bcb7-e95c785eec82'),(287,60,NULL,132,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:45:20','2025-06-25 11:45:20',NULL,NULL,NULL,'91328086-d6ed-4e03-ae84-4fcc7d8165f0'),(288,76,NULL,133,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:45:20','2025-06-25 11:45:20',NULL,NULL,NULL,'46fef600-5176-4ff6-9024-fe36fb94f7de'),(289,62,NULL,134,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:45:23','2025-06-25 11:45:23',NULL,NULL,NULL,'47f9542e-4f6a-4126-b8cf-054c6dd7bfdd'),(290,78,NULL,135,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:45:23','2025-06-25 11:45:23',NULL,NULL,NULL,'b9093d13-9f64-4860-a2d0-70bcce866ab0'),(291,64,NULL,136,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:45:23','2025-06-25 11:45:23',NULL,NULL,NULL,'f7b4139e-a8a0-4118-95f0-d0403ccd6734'),(292,80,NULL,137,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:45:24','2025-06-25 11:45:24',NULL,NULL,NULL,'18d8400b-6891-4023-94b8-25454b1d0d8a'),(293,66,NULL,138,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:45:24','2025-06-25 11:45:24',NULL,NULL,NULL,'5a91c109-6ad3-4ad2-80ee-53b186e9d5e3'),(294,NULL,105,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:45:25','2025-06-25 11:45:25',NULL,NULL,NULL,'77f68158-31c5-4a82-b2ba-071965169d07'),(295,82,NULL,139,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:46:04','2025-06-25 11:46:04',NULL,NULL,NULL,'94216312-f116-4aa6-8bc9-e56198860b98'),(311,84,NULL,140,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:47:02','2025-06-25 11:47:02',NULL,NULL,NULL,'ab0fb941-9656-44de-8e41-485e0611d64f'),(312,88,NULL,141,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:47:03','2025-06-25 11:47:04',NULL,NULL,NULL,'bfa86fab-0020-458f-911a-f17a3ac467db'),(313,102,NULL,142,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:47:04','2025-06-25 11:47:04',NULL,NULL,NULL,'804545e2-d6e9-48b2-86ad-2492d78c9451'),(314,90,NULL,143,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:47:05','2025-06-25 11:47:05',NULL,NULL,NULL,'4e82a429-dd1c-4f58-b83e-fab9f8026ac8'),(315,104,NULL,144,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:47:05','2025-06-25 11:47:05',NULL,NULL,NULL,'f64ce97e-1247-4c15-93f4-a9a45660c4d7'),(316,92,NULL,145,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:47:06','2025-06-25 11:47:06',NULL,NULL,NULL,'2071e32b-72ec-4fdb-9142-a5dd0c4395d0'),(317,106,NULL,146,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:47:06','2025-06-25 11:47:06',NULL,NULL,NULL,'df227a1b-d597-4a52-a5fa-24e495372db6'),(318,94,NULL,147,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:47:07','2025-06-25 11:47:07',NULL,NULL,NULL,'5b2c2f31-e731-4329-85b3-3942e847bae3'),(319,108,NULL,148,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:47:07','2025-06-25 11:47:07',NULL,NULL,NULL,'7b761d07-a0a2-43b4-ab2e-5a4922f76f86'),(320,96,NULL,149,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:47:09','2025-06-25 11:47:09',NULL,NULL,NULL,'472c8ccf-498a-4bc5-92e2-7e88d9f06874'),(321,110,NULL,150,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:47:09','2025-06-25 11:47:09',NULL,NULL,NULL,'5525adc3-1f7d-403f-92b1-96e2132c3e91'),(322,98,NULL,151,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:47:09','2025-06-25 11:47:09',NULL,NULL,NULL,'0241c3f6-227d-47ca-bb84-c303004a1bbe'),(323,112,NULL,152,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:47:09','2025-06-25 11:47:09',NULL,NULL,NULL,'11b4589c-5cd3-4a6c-a84f-8813cacf1b54'),(324,100,NULL,153,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:47:09','2025-06-25 11:47:09',NULL,NULL,NULL,'85af6f42-10c2-48ee-82f7-981f3940c0d3'),(325,132,NULL,154,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:47:10','2025-06-25 11:47:10',NULL,NULL,NULL,'6411c75d-daa5-4e13-9d35-ccd9b0ac31cf'),(326,96,NULL,155,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:47:20','2025-06-25 11:47:20',NULL,NULL,NULL,'1d6f039b-3494-4cd0-9913-9bcb842052f0'),(327,110,NULL,156,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:47:21','2025-06-25 11:47:21',NULL,NULL,NULL,'20f1e743-375d-4687-a254-f10043d1d44b'),(328,98,NULL,157,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:47:21','2025-06-25 11:47:21',NULL,NULL,NULL,'3808b7d2-c84f-4c54-a43d-8282e751c8ec'),(329,112,NULL,158,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:47:23','2025-06-25 11:47:23',NULL,NULL,NULL,'4e175993-63ae-4fd7-9305-8dca44fecdfa'),(330,100,NULL,159,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:47:26','2025-06-25 11:47:26',NULL,NULL,NULL,'402874cc-6c34-4d43-914d-5972de470083'),(331,132,NULL,160,17,'craft\\elements\\Entry',1,0,'2025-06-25 11:47:28','2025-06-25 11:47:28',NULL,NULL,NULL,'99451702-68b8-4416-883f-6825dadb2878'),(335,NULL,NULL,NULL,15,'craft\\elements\\Entry',1,0,'2025-06-25 13:17:41','2025-06-25 13:17:41',NULL,NULL,NULL,'912c88aa-8d84-43f8-9441-55a23cf4050b'),(336,335,NULL,162,15,'craft\\elements\\Entry',1,0,'2025-06-25 13:17:41','2025-06-25 13:17:41',NULL,NULL,NULL,'d333874e-5fb7-47b5-b181-8a3234db49e5'),(337,50,NULL,163,17,'craft\\elements\\Entry',1,0,'2025-06-25 13:17:41','2025-06-25 13:17:41',NULL,NULL,NULL,'f8bcdeba-6a38-4d7c-9606-95e7b0b1f5be'),(338,NULL,123,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 13:19:13','2025-06-25 13:19:13',NULL,NULL,NULL,'f2e82014-c2ad-48ef-8ee2-2b87dca860dc'),(339,NULL,124,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 13:25:26','2025-06-25 13:25:26',NULL,NULL,NULL,'4325a93c-8562-4151-84fb-fc23305589cd'),(340,NULL,NULL,NULL,8,'craft\\elements\\Asset',1,0,'2025-06-25 13:31:51','2025-06-25 13:31:51',NULL,NULL,NULL,'272676ae-f1ba-4b1e-b547-2c18bff79eb7'),(341,NULL,NULL,NULL,8,'craft\\elements\\Asset',1,0,'2025-06-25 13:31:51','2025-06-25 13:31:51',NULL,NULL,NULL,'d1d4edf0-65ec-4026-80de-71ce11b6bcd3'),(342,NULL,NULL,NULL,8,'craft\\elements\\Asset',1,0,'2025-06-25 13:31:51','2025-06-25 13:31:51',NULL,NULL,NULL,'bb12a591-45d9-45f1-9562-ce4ee042000b'),(343,NULL,NULL,NULL,8,'craft\\elements\\Asset',1,0,'2025-06-25 13:31:52','2025-06-25 13:31:52',NULL,NULL,NULL,'9db1d1a3-c35f-464b-88bd-76fa4a2c3d82'),(344,NULL,NULL,NULL,8,'craft\\elements\\Asset',1,0,'2025-06-25 13:31:52','2025-06-25 13:31:52',NULL,NULL,NULL,'68cbb3a7-cfef-4b78-aaeb-c96270888c1f'),(345,NULL,NULL,NULL,8,'craft\\elements\\Asset',1,0,'2025-06-25 13:31:52','2025-06-25 13:31:52',NULL,NULL,NULL,'4fcb7a0f-8dfd-45b3-ac3e-368e3e1e97f8'),(346,NULL,NULL,NULL,8,'craft\\elements\\Asset',1,0,'2025-06-25 13:31:52','2025-06-25 13:31:52',NULL,NULL,NULL,'18ad72df-2305-462e-a42b-4f66e6ef54f3'),(347,NULL,NULL,NULL,8,'craft\\elements\\Asset',1,0,'2025-06-25 13:31:52','2025-06-25 13:31:52',NULL,NULL,NULL,'d591a4da-485a-444a-a895-989f7bbc64b5'),(348,NULL,NULL,NULL,8,'craft\\elements\\Asset',1,0,'2025-06-25 13:31:52','2025-06-25 13:31:52',NULL,NULL,NULL,'ef5f868b-2dc5-4785-8d6d-b568ac11a4a9'),(349,NULL,NULL,NULL,8,'craft\\elements\\Asset',1,0,'2025-06-25 13:31:52','2025-06-25 13:31:52',NULL,NULL,NULL,'a4b728e7-0ee8-4574-9899-10389a838c6a'),(350,NULL,NULL,NULL,8,'craft\\elements\\Asset',1,0,'2025-06-25 13:31:52','2025-06-25 13:31:52',NULL,NULL,NULL,'feed3ad8-4585-411e-9d50-a3f104ba24ae'),(351,NULL,NULL,NULL,8,'craft\\elements\\Asset',1,0,'2025-06-25 13:31:52','2025-06-25 13:31:52',NULL,NULL,NULL,'ba2f2a64-0035-4963-a02c-3a58bc102240'),(352,NULL,NULL,NULL,8,'craft\\elements\\Asset',1,0,'2025-06-25 13:31:53','2025-06-25 13:31:53',NULL,NULL,NULL,'795a48bc-3435-4b82-98a2-6e8c94ea186e'),(353,NULL,NULL,NULL,8,'craft\\elements\\Asset',1,0,'2025-06-25 13:31:53','2025-06-25 13:31:53',NULL,NULL,NULL,'8a54da3c-93b3-42ca-b7e3-f06c1aa40c2b'),(354,NULL,NULL,NULL,8,'craft\\elements\\Asset',1,0,'2025-06-25 13:31:53','2025-06-25 13:31:53',NULL,NULL,NULL,'e5c844d4-0a70-444f-8ef0-b394a4a2f15a'),(355,NULL,NULL,NULL,8,'craft\\elements\\Asset',1,0,'2025-06-25 13:31:53','2025-06-25 13:31:53',NULL,NULL,NULL,'12878c54-be48-4d33-b231-937295e73edc'),(357,52,NULL,164,17,'craft\\elements\\Entry',1,0,'2025-06-25 13:32:11','2025-06-25 13:32:11',NULL,NULL,NULL,'1ba7c840-3940-4e5d-acd4-4586bb34d41c'),(364,52,NULL,165,17,'craft\\elements\\Entry',1,0,'2025-06-25 13:38:52','2025-06-25 13:38:52',NULL,NULL,NULL,'40b903a7-cb53-406d-96c4-252dba3c3573'),(365,68,NULL,166,17,'craft\\elements\\Entry',1,0,'2025-06-25 13:38:53','2025-06-25 13:38:53',NULL,NULL,NULL,'e782510f-3233-4a78-8111-46078be94737'),(366,54,NULL,167,17,'craft\\elements\\Entry',1,0,'2025-06-25 13:38:53','2025-06-25 13:38:53',NULL,NULL,NULL,'a7d66c80-9a90-4272-ab7b-c710849576d5'),(367,70,NULL,168,17,'craft\\elements\\Entry',1,0,'2025-06-25 13:38:54','2025-06-25 13:38:54',NULL,NULL,NULL,'15a7eb06-07b7-47ac-8354-c5e29caf47e3'),(370,58,NULL,169,17,'craft\\elements\\Entry',1,0,'2025-06-25 13:39:09','2025-06-25 13:39:09',NULL,NULL,NULL,'067f1ff8-a388-49da-a4ff-2b9b803df6da'),(373,56,NULL,170,17,'craft\\elements\\Entry',1,0,'2025-06-25 13:39:21','2025-06-25 13:39:21',NULL,NULL,NULL,'2da9a275-f549-4b69-b11e-5857f0d79514'),(374,72,NULL,171,17,'craft\\elements\\Entry',1,0,'2025-06-25 13:39:23','2025-06-25 13:39:23',NULL,NULL,NULL,'cc23376c-4eff-442b-927e-6a5c1283206e'),(375,74,NULL,172,17,'craft\\elements\\Entry',1,0,'2025-06-25 13:39:24','2025-06-25 13:39:24',NULL,NULL,NULL,'5cafb7d6-e9e5-4cab-8177-e5b3068515ec'),(377,60,NULL,173,17,'craft\\elements\\Entry',1,0,'2025-06-25 13:39:27','2025-06-25 13:39:27',NULL,NULL,NULL,'cc62a066-4ada-4a6e-a01e-ead95c423ff9'),(379,76,NULL,174,17,'craft\\elements\\Entry',1,0,'2025-06-25 13:39:31','2025-06-25 13:39:31',NULL,NULL,NULL,'4c5cd815-1eb7-4846-8ee5-e3a22e774ec9'),(383,62,NULL,175,17,'craft\\elements\\Entry',1,0,'2025-06-25 13:39:43','2025-06-25 13:39:43',NULL,NULL,NULL,'9106b218-3944-4318-b069-684e594b405d'),(384,78,NULL,176,17,'craft\\elements\\Entry',1,0,'2025-06-25 13:39:44','2025-06-25 13:39:44',NULL,NULL,NULL,'a03f9cc4-e340-43f8-b342-725af7e328bf'),(385,64,NULL,177,17,'craft\\elements\\Entry',1,0,'2025-06-25 13:39:46','2025-06-25 13:39:46',NULL,NULL,NULL,'2746be69-ae76-4ea7-b1ab-ce605f163705'),(386,80,NULL,178,17,'craft\\elements\\Entry',1,0,'2025-06-25 13:39:46','2025-06-25 13:39:46',NULL,NULL,NULL,'27e259c4-0994-46fc-a17e-9ebb34b16331'),(387,66,NULL,179,17,'craft\\elements\\Entry',1,0,'2025-06-25 13:39:48','2025-06-25 13:39:48',NULL,NULL,NULL,'ca2b761c-1fbf-4762-aead-d941cf234bbc'),(388,82,NULL,180,17,'craft\\elements\\Entry',1,0,'2025-06-25 13:39:48','2025-06-25 13:39:48',NULL,NULL,NULL,'f0945caa-19a3-489e-b066-c5c0f4bf2e52'),(389,80,NULL,181,17,'craft\\elements\\Entry',1,0,'2025-06-25 13:39:54','2025-06-25 13:39:54',NULL,NULL,NULL,'c001fa3a-f087-4879-af60-faf79377c02c'),(390,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:00:16','2025-06-25 14:48:01',NULL,NULL,NULL,'6b7367a0-b1f8-4c7d-a23d-71e41437c02d'),(391,390,NULL,182,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:00:43','2025-06-25 14:00:43',NULL,NULL,NULL,'059d8bfe-f59f-4380-b426-843cf022c55a'),(392,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:15:58','2025-06-25 14:16:46',NULL,NULL,NULL,'5f6472a8-d480-41bf-82ca-4855702a7c0f'),(393,392,NULL,183,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:15:58','2025-06-25 14:15:58',NULL,NULL,NULL,'a407906b-c3b5-463e-9b77-c2d03b14b608'),(394,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:16:05','2025-06-25 14:16:39',NULL,NULL,NULL,'19138de2-d5ac-47a1-8706-7be9f7e102f8'),(395,394,NULL,184,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:16:05','2025-06-25 14:16:05',NULL,NULL,NULL,'f3d0c462-e9d0-4184-b662-ccfc883a56a8'),(396,394,NULL,185,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:16:29','2025-06-25 14:16:29',NULL,NULL,NULL,'50bad348-c42b-40c3-9466-c3e07e2e484f'),(397,392,NULL,186,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:16:29','2025-06-25 14:16:29',NULL,NULL,NULL,'b9f743e7-9706-4973-b5ee-e35c5b581a9e'),(399,394,NULL,187,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:16:39','2025-06-25 14:16:39',NULL,NULL,NULL,'a8012ace-2b24-4f30-ae9e-247930609c3e'),(401,392,NULL,188,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:16:46','2025-06-25 14:16:46',NULL,NULL,NULL,'b326c49d-b1be-4931-aa30-999455e77583'),(402,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:17:01','2025-06-25 14:26:25',NULL,NULL,NULL,'218cc535-06af-4b7b-b96f-459ee181f920'),(403,402,NULL,189,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:17:22','2025-06-25 14:17:22',NULL,NULL,NULL,'425921da-0c4a-4138-bccd-eb69dca9207a'),(404,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:17:23','2025-06-25 14:26:23',NULL,NULL,NULL,'f139cb2f-f4b6-4adc-9e65-d5620a9e3123'),(405,404,NULL,190,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:17:31','2025-06-25 14:17:31',NULL,NULL,NULL,'e9f16401-b5a8-406c-baba-45fed24fc23e'),(406,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:17:31','2025-06-25 14:17:44',NULL,NULL,NULL,'fb9f8a16-f979-433e-b4a3-3bf88ab5513a'),(407,406,NULL,191,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:17:44','2025-06-25 14:17:44',NULL,NULL,NULL,'13b53dd2-f449-41f1-a99c-040f421db6e8'),(408,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:17:44','2025-06-25 14:17:58',NULL,NULL,NULL,'1310e9ff-cec5-4408-9e6d-48298db42aaa'),(409,408,NULL,192,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:17:58','2025-06-25 14:17:58',NULL,NULL,NULL,'afa0ebac-2730-4bb4-8266-19bcc95c5632'),(410,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:17:58','2025-06-25 14:18:19',NULL,NULL,NULL,'11e8bed1-1266-437d-b94a-89c42feadf6e'),(411,410,NULL,193,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:18:19','2025-06-25 14:18:19',NULL,NULL,NULL,'8b84d3ba-1d68-4f07-8c37-1c5f75b2b1be'),(412,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:18:19','2025-06-25 14:18:28',NULL,NULL,NULL,'7ddc8262-2a69-4b86-9900-c789f2134d0e'),(413,412,NULL,194,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:18:28','2025-06-25 14:18:28',NULL,NULL,NULL,'a033428c-ecda-4b41-91cc-c6dc82ff6f26'),(414,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:18:28','2025-06-25 14:18:39',NULL,NULL,NULL,'1794d2e3-04ce-404c-a1a9-a93b595533a0'),(415,414,NULL,195,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:18:39','2025-06-25 14:18:39',NULL,NULL,NULL,'13bc5537-ccec-4293-85d0-f6d84131169e'),(416,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:18:39','2025-06-25 14:18:54',NULL,NULL,NULL,'0db6dc0b-f39e-4238-83b2-4a61deddf29f'),(417,416,NULL,196,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:18:54','2025-06-25 14:18:54',NULL,NULL,NULL,'84e5c81b-26e5-40cd-98be-3da8b4032923'),(418,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:18:54','2025-06-25 14:18:58',NULL,NULL,NULL,'342fbb78-c599-46c1-a006-24919384ae2f'),(419,418,NULL,197,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:18:58','2025-06-25 14:18:58',NULL,NULL,NULL,'4acba477-0878-4f45-b6b9-4b48c7e95f21'),(420,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:18:58','2025-06-25 14:19:22',NULL,NULL,NULL,'10ec5eda-c396-467c-94d4-3c15058652ec'),(421,420,NULL,198,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:19:22','2025-06-25 14:19:22',NULL,NULL,NULL,'860d3619-822f-4983-8f5b-42f82d64bd0e'),(422,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:19:22','2025-06-25 14:19:29',NULL,NULL,NULL,'38df24a4-dcc7-4dcf-8dcf-dbe99257c5e3'),(423,422,NULL,199,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:19:29','2025-06-25 14:19:29',NULL,NULL,NULL,'0547e65a-b80d-40bc-a8ad-f60fcd4171ab'),(424,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:19:29','2025-06-25 14:20:31',NULL,NULL,NULL,'4ac8b716-59b8-4325-a261-770f0a288521'),(425,424,NULL,200,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:20:31','2025-06-25 14:20:31',NULL,NULL,NULL,'d23c2390-fee5-4662-adf8-34bca5bac6ae'),(426,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:20:31','2025-06-25 14:20:34',NULL,NULL,NULL,'3a868ebe-5dbc-439e-a25c-b0167f4e67b6'),(427,426,NULL,201,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:20:34','2025-06-25 14:20:34',NULL,NULL,NULL,'6851a543-8042-485f-a4ed-fe7409ed72f9'),(428,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:20:34','2025-06-25 14:20:39',NULL,NULL,NULL,'1152a82d-552c-4408-95bb-41140b7b5e5c'),(429,428,NULL,202,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:20:39','2025-06-25 14:20:39',NULL,NULL,NULL,'2b47a3c5-eaf7-45a7-9400-1d6cb9775525'),(430,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:20:39','2025-06-25 14:20:43',NULL,NULL,NULL,'ebf5364d-72c0-4fec-a4ce-7502c3075f52'),(431,430,NULL,203,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:20:43','2025-06-25 14:20:43',NULL,NULL,NULL,'a0413082-c67c-4c85-bbf6-a04c0170eff5'),(432,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:20:43','2025-06-25 14:20:50',NULL,NULL,NULL,'6833b6ee-b5c2-40c6-a5f4-6aebcc379f0b'),(433,432,NULL,204,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:20:50','2025-06-25 14:20:50',NULL,NULL,NULL,'2dc55198-8c8f-4d1f-8f7a-842e30c17abc'),(434,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:20:50','2025-06-25 14:21:13',NULL,NULL,NULL,'4eb6246c-c89e-40f7-9355-c633a31c9515'),(435,434,NULL,205,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:21:13','2025-06-25 14:21:13',NULL,NULL,NULL,'f11ce754-04e6-40c2-af7e-91dcc9f71b94'),(436,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:21:13','2025-06-25 14:21:18',NULL,NULL,NULL,'c60e2bde-13fd-4351-a9b1-2cc18b1d2ebe'),(437,436,NULL,206,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:21:18','2025-06-25 14:21:18',NULL,NULL,NULL,'135dc453-cde6-43a5-bd1e-fa2c1497814b'),(438,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:21:18','2025-06-25 14:22:31',NULL,NULL,NULL,'9e9665e5-c95f-485b-b71e-e7c0666dcf31'),(439,438,NULL,207,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:22:31','2025-06-25 14:22:31',NULL,NULL,NULL,'76ebfbf9-be0b-48c5-a240-747bdd1b5209'),(440,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:22:31','2025-06-25 14:22:36',NULL,NULL,NULL,'ec036e7f-5907-415d-8cb8-b50085502e51'),(441,440,NULL,208,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:22:36','2025-06-25 14:22:36',NULL,NULL,NULL,'00d796d9-ca34-4754-b578-904d756aefc3'),(442,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:22:36','2025-06-25 14:22:55',NULL,NULL,NULL,'81843b28-3bfa-4785-aa09-7f920ff2d12b'),(443,442,NULL,209,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:22:55','2025-06-25 14:22:55',NULL,NULL,NULL,'74314aa6-9b28-4bb2-a47c-af1783adeda8'),(444,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:22:56','2025-06-25 14:23:01',NULL,NULL,NULL,'2040d436-5cf8-400c-a644-ec96eaed357f'),(445,444,NULL,210,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:23:01','2025-06-25 14:23:01',NULL,NULL,NULL,'8ca2c53a-529c-47fd-966e-3261711220ca'),(446,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:23:01','2025-06-25 14:23:08',NULL,NULL,NULL,'a88b7545-2d98-402b-8551-9f3b2381dc72'),(447,446,NULL,211,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:23:08','2025-06-25 14:23:08',NULL,NULL,NULL,'fc8acd32-6f78-4162-9497-0f1bc6a3f7d6'),(448,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:23:08','2025-06-25 14:23:13',NULL,NULL,NULL,'c57d9bfc-a1c6-46d7-910b-32c32eb41add'),(449,448,NULL,212,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:23:13','2025-06-25 14:23:13',NULL,NULL,NULL,'e3a3ad9e-0b2b-4f60-93d6-5454f46bbbe6'),(450,NULL,168,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:23:13','2025-06-25 14:23:40',NULL,NULL,NULL,'3afec680-d5ab-4905-a538-3aedec5ded40'),(453,404,NULL,213,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:26:23','2025-06-25 14:26:23',NULL,NULL,NULL,'5ddb7d16-21dc-455c-9a1d-1deba8041b73'),(454,402,NULL,214,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:26:25','2025-06-25 14:26:25',NULL,NULL,NULL,'10c7be7b-a7ff-41bb-b26f-4dd74bcff804'),(456,390,NULL,215,17,'craft\\elements\\Entry',1,0,'2025-06-25 14:48:01','2025-06-25 14:48:01',NULL,NULL,NULL,'146c707e-cd6a-469c-9d14-ae835692de6d'),(457,NULL,172,NULL,17,'craft\\elements\\Entry',1,0,'2025-06-26 08:23:24','2025-06-26 08:23:31',NULL,NULL,NULL,'74905f6f-e389-4ca3-917b-f7df52f8af24');
/*!40000 ALTER TABLE `sub41_elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_elements_bulkops`
--

LOCK TABLES `sub41_elements_bulkops` WRITE;
/*!40000 ALTER TABLE `sub41_elements_bulkops` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_elements_bulkops` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_elements_owners`
--

LOCK TABLES `sub41_elements_owners` WRITE;
/*!40000 ALTER TABLE `sub41_elements_owners` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_elements_owners` VALUES (11,5,3),(13,5,2),(14,5,5),(15,5,4),(16,5,1),(17,16,1),(140,139,1),(157,16,2),(167,1,1),(169,168,1),(173,1,1),(173,174,1),(173,192,1),(173,197,1),(173,202,1),(173,217,1),(173,226,1),(173,237,1),(173,245,1),(173,251,1),(186,1,2),(187,186,1),(188,186,2),(189,1,2),(189,192,2),(189,197,2),(190,189,1),(190,201,1),(191,189,2),(191,201,2),(201,1,2),(201,202,2),(201,217,2),(201,226,2),(201,237,2),(201,245,2),(201,251,2),(211,1,3),(212,211,1),(213,211,2),(214,1,3),(214,217,3),(215,214,1),(215,224,1),(216,214,2),(224,1,3),(224,226,3),(225,224,2),(234,1,3),(234,237,3),(235,234,1),(235,243,1),(236,234,2),(243,1,3),(243,245,3),(243,251,3),(244,243,2),(249,1,4),(250,1,4),(250,251,4),(335,50,1),(336,50,1),(336,337,1);
/*!40000 ALTER TABLE `sub41_elements_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_elements_sites`
--

LOCK TABLES `sub41_elements_sites` WRITE;
/*!40000 ALTER TABLE `sub41_elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_elements_sites` VALUES (1,1,1,'Homepage','homepage','__home__',NULL,1,'2025-06-20 15:02:44','2025-06-20 15:02:44','e41c965b-cc21-4d37-93d4-bd5e1cb6e62f'),(2,2,1,'Homepage','homepage','__home__',NULL,1,'2025-06-20 15:02:44','2025-06-20 15:02:44','0f0e86f5-472b-4234-9d9e-be3a8b5a227d'),(3,3,1,NULL,NULL,NULL,NULL,1,'2025-06-20 15:02:44','2025-06-20 15:02:44','67858646-fb61-473a-9d6a-30603cdc73da'),(4,4,1,NULL,'__temp_cwigbrbwnkysnszcmyaicbvllcwcfengpoow','__temp_cwigbrbwnkysnszcmyaicbvllcwcfengpoow',NULL,1,'2025-06-20 15:05:33','2025-06-20 15:05:33','8660eef3-b5b2-405a-9b85-9f1563b14c01'),(5,5,1,NULL,NULL,NULL,'{\"71fa6bbf-4472-405d-94d2-78883692d9a3\": [163]}',1,'2025-06-20 15:57:13','2025-06-23 11:28:44','823442f1-ffb3-4a5b-a657-19cfe0cf5b22'),(6,6,1,'Group 16',NULL,NULL,NULL,1,'2025-06-20 15:59:33','2025-06-20 15:59:33','1f5651dd-2c3c-47bf-98c9-470e51957c75'),(7,7,1,'Group 16',NULL,NULL,NULL,1,'2025-06-20 15:59:50','2025-06-20 15:59:50','cc15586a-7ed5-41f5-a58c-4a24c6681ec8'),(8,8,1,'Group 16',NULL,NULL,NULL,1,'2025-06-20 16:06:17','2025-06-20 16:06:17','3e98d746-fd59-4323-b8df-b0bb9999839e'),(9,9,1,'Group 16',NULL,NULL,NULL,1,'2025-06-20 16:08:37','2025-06-20 16:08:37','e9e005d2-489e-4b4f-b36a-acef0f6826da'),(10,10,1,'Group 16',NULL,NULL,NULL,1,'2025-06-20 16:08:55','2025-06-20 16:08:55','61822f57-6859-4a6a-8d37-b87524b6f9fe'),(11,11,1,NULL,'__temp_ufhvumvagatwnwthqzaaylpktonbimelmdai',NULL,'{\"907b0b2d-32ac-4a0b-a932-267eb2efe235\": {\"type\": \"entry\", \"value\": \"{entry:144@1:url}\"}}',1,'2025-06-20 16:20:37','2025-06-23 10:19:37','e4de7c06-4fba-45b9-833c-353c299ee670'),(13,13,1,NULL,'__temp_nujruocopgccfyfifkmfvmxkmpzwnjscefcd',NULL,'{\"907b0b2d-32ac-4a0b-a932-267eb2efe235\": {\"type\": \"entry\", \"label\": \"Equipment Wanted\", \"value\": \"{entry:142@1:url}\"}}',1,'2025-06-23 08:09:32','2025-06-23 10:19:23','7fd75e97-f022-4795-95f9-d240b4aa1a97'),(14,14,1,NULL,'__temp_xmvpqgbpkfskrwwuippotrcbgwcpcgcoixnt',NULL,'{\"907b0b2d-32ac-4a0b-a932-267eb2efe235\": {\"type\": \"entry\", \"value\": \"{entry:148@1:url}\"}}',1,'2025-06-23 08:09:36','2025-06-23 10:20:09','bb236f30-8add-4def-9b14-4995b27f5498'),(15,15,1,NULL,'__temp_wmrcruettaasmruqhnxhcujhlbvnrcjlwaka',NULL,'{\"907b0b2d-32ac-4a0b-a932-267eb2efe235\": {\"type\": \"entry\", \"value\": \"{entry:146@1:url}\"}}',1,'2025-06-23 08:09:39','2025-06-23 10:19:48','30f821c6-216c-432b-833b-bc695b0eadf0'),(16,16,1,NULL,'__temp_eqmnzaicsozvftiyzizpjzlszcairgevssxw',NULL,'{\"83e91fbf-b380-46f8-82ff-2d8c80358adb\": {\"type\": \"entry\", \"value\": \"{entry:193@1:url}\"}}',1,'2025-06-23 08:09:44','2025-06-24 13:01:49','4866d243-8dd7-4199-8283-25f708089cfe'),(17,17,1,'DEEPSEARCH','deepsearch',NULL,'{\"67d0b562-a644-4f8f-9703-8d0165c2e534\": [52, 68, 54, 70, 56, 72, 58, 74, 60, 76, 62, 78, 64, 80, 66, 82]}',1,'2025-06-23 08:10:41','2025-06-23 10:21:29','07584502-e6fd-4165-ae3b-24b3ced07f4a'),(18,18,1,'Workclass ROVs','workclass-rovs','equipment-list/workclass-rovs',NULL,1,'2025-06-23 08:17:22','2025-06-23 08:21:12','c33d840b-e215-401c-9787-e67fd77724d4'),(19,19,1,'Workclass ROVs','workclass-rovs','equipment-list/workclass-rovs',NULL,1,'2025-06-23 08:17:34','2025-06-23 08:17:34','44b76273-30a4-4c15-b7bd-04f854502f3b'),(20,20,1,'Eyeball / Inspection ROVs','eyeball-inspection-rovs','equipment-list/eyeball-inspection-rovs',NULL,1,'2025-06-23 08:17:35','2025-06-23 08:21:26','1a519e7a-8ba5-4759-b412-8e0878287bff'),(21,21,1,'Eyeball / Inspection ROVs','eyeball-inspection-rovs','equipment-list/eyeball-inspection-rovs',NULL,1,'2025-06-23 08:17:41','2025-06-23 08:17:41','34f24a9e-af3f-4d89-8222-48dea4089b70'),(22,22,1,'Miscellaneous Vehicles and Equipment','miscellaneous-vehicles-and-equipment','equipment-list/miscellaneous-vehicles-and-equipment',NULL,1,'2025-06-23 08:17:50','2025-06-23 08:21:46','45c288ff-0027-4bd5-97b1-97a6f14e2007'),(23,23,1,'Miscellaneous Vehicles and Equipment','miscellaneous-vehicles-and-equipment','equipment-list/miscellaneous-vehicles-and-equipment',NULL,1,'2025-06-23 08:17:52','2025-06-23 08:17:52','607b479b-7170-4e81-9955-fe84e3da5409'),(24,24,1,'Miscellaneous ROVs','miscellaneous-rovs','equipment-list/miscellaneous-rovs',NULL,1,'2025-06-23 08:17:57','2025-06-23 08:22:10','1d21ef28-aa08-4921-9799-a896246ada1c'),(25,25,1,'Miscellaneous ROVs','miscellaneous-rovs','equipment-list/miscellaneous-rovs',NULL,1,'2025-06-23 08:18:03','2025-06-23 08:18:03','74137796-0197-4db6-815a-ac9603c17705'),(26,26,1,'Thrusters','thrusters','equipment-list/thrusters',NULL,1,'2025-06-23 08:18:07','2025-06-23 08:22:18','b43323d1-f3f8-4e00-b4fa-f784babd5fdf'),(27,27,1,'Thrusters','thrusters','equipment-list/thrusters',NULL,1,'2025-06-23 08:18:12','2025-06-23 08:18:12','d3ea4e57-4efe-4e81-98dd-d21e31ef0561'),(28,28,1,'Containers','containers','equipment-list/containers',NULL,1,'2025-06-23 08:18:14','2025-06-23 08:22:35','f98c1022-0dc3-4247-87cc-4b12432051ad'),(29,29,1,'Containers','containers','equipment-list/containers',NULL,1,'2025-06-23 08:18:22','2025-06-23 08:18:22','657b6ebb-bb33-47a0-a4dd-3b40fa11fdfb'),(30,30,1,'Tether Management Systems','tether-management-systems','equipment-list/tether-management-systems',NULL,1,'2025-06-23 08:18:30','2025-06-23 08:22:43','419a7494-0f12-4a42-84a9-0d214934b743'),(31,31,1,'Tether Management Systems','tether-management-systems','equipment-list/tether-management-systems',NULL,1,'2025-06-23 08:18:33','2025-06-23 08:18:33','774546de-72e8-4270-8d7e-3097954ca7be'),(32,32,1,'Winches, A-Frames and Cranes','winches-a-frames-and-cranes','equipment-list/winches-a-frames-and-cranes',NULL,1,'2025-06-23 08:18:47','2025-06-23 08:22:46','dade1291-f1e2-4590-8c74-56145efabf95'),(33,33,1,'Winches, A-Frames and Cranes','winches-a-frames-and-cranes','equipment-list/winches-a-frames-and-cranes',NULL,1,'2025-06-23 08:18:49','2025-06-23 08:18:49','a909e6a5-52b6-4aa9-90fc-67f1ad5ffc0b'),(34,34,1,'Sliprings','sliprings','equipment-list/sliprings',NULL,1,'2025-06-23 08:18:52','2025-06-23 08:21:21','18e4b976-d0e5-4a40-b70b-01a15705e2e6'),(35,35,1,'Sliprings','sliprings','equipment-list/sliprings',NULL,1,'2025-06-23 08:18:58','2025-06-23 08:18:58','ee9c4f0b-fdf4-4bc5-922f-224ae11738b5'),(36,36,1,'Manipulators','manipulators','equipment-list/manipulators',NULL,1,'2025-06-23 08:19:01','2025-06-23 08:21:40','a3db2ff7-f853-4ac6-95f9-77cab61213ab'),(37,37,1,'Manipulators','manipulators','equipment-list/manipulators',NULL,1,'2025-06-23 08:19:07','2025-06-23 08:19:07','67e73799-95b4-4714-b8e3-698934e8f972'),(38,38,1,'ROV Tooling','rov-tooling','equipment-list/rov-tooling',NULL,1,'2025-06-23 08:19:07','2025-06-23 08:22:04','e12c08f1-3ce9-4730-9eb0-92189bc6c501'),(39,39,1,'ROV Tooling','rov-tooling','equipment-list/rov-tooling',NULL,1,'2025-06-23 08:19:15','2025-06-23 08:19:15','488f1e60-2136-4caf-8b4e-60dea2f99429'),(40,40,1,'ROV Sensors','rov-sensors','equipment-list/rov-sensors',NULL,1,'2025-06-23 08:19:22','2025-06-23 08:22:15','9eac7cfd-27ca-4af5-8faf-b650a3404544'),(41,41,1,'ROV Sensors','rov-sensors','equipment-list/rov-sensors',NULL,1,'2025-06-23 08:19:24','2025-06-23 08:19:24','63b61291-85ba-4dbc-9cfc-d8230480f68e'),(42,42,1,'Umbilicals','umbilicals','equipment-list/umbilicals',NULL,1,'2025-06-23 08:19:25','2025-06-23 08:22:32','c62deebf-6faf-4e17-b6b4-ebddb73c2b85'),(43,43,1,'Umbilicals','umbilicals','equipment-list/umbilicals',NULL,1,'2025-06-23 08:19:31','2025-06-23 08:19:31','0ae77b47-2335-467c-a851-687bc78ac0f4'),(44,44,1,'Cameras and lights','cameras-and-lights','equipment-list/cameras-and-lights',NULL,1,'2025-06-23 08:19:34','2025-06-23 08:22:41','5eab2ec7-ba2b-4b38-9666-ed1577c59602'),(45,45,1,'Cameras and lights','cameras-and-lights','equipment-list/cameras-and-lights',NULL,1,'2025-06-23 08:19:40','2025-06-23 08:19:40','3a527f11-e177-432f-a7c1-faca2fbc3c99'),(46,46,1,'Sonars','sonars','equipment-list/sonars',NULL,1,'2025-06-23 08:19:42','2025-06-23 08:22:44','0d67a716-cd7e-4e04-9a7b-6b6f4a41bd29'),(47,47,1,'Sonars','sonars','equipment-list/sonars',NULL,1,'2025-06-23 08:19:49','2025-06-23 08:19:49','f01b1be7-0336-48e9-b7e8-fd8598a95374'),(48,48,1,'Miscellaneous','miscellaneous','equipment-list/miscellaneous',NULL,1,'2025-06-23 08:19:49','2025-06-23 08:22:48','b38e65d7-388d-41a5-98bf-475fe79a89e1'),(49,49,1,'Miscellaneous','miscellaneous','equipment-list/miscellaneous',NULL,1,'2025-06-23 08:20:30','2025-06-23 08:20:30','3626d871-320f-42ee-98d2-7516fb4cf787'),(50,50,1,'ROV Equipment','rov-equipment','equipment-list/rov-equipment','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"categoryListingPage\"}',1,'2025-06-23 08:20:32','2025-06-25 11:43:40','527acec3-f8e9-4bb6-9d26-8ac800211d8a'),(51,51,1,'ROV Equipment','rov-equipment','equipment-list/rov-equipment',NULL,1,'2025-06-23 08:21:04','2025-06-23 08:21:04','c304c8af-71f6-4940-955e-078fde2f45aa'),(52,52,1,'Workclass ROVs','workclass-rovs','equipment-list/rov-equipment/workclass-rovs','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [355], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-23 08:24:15','2025-06-25 13:32:11','c090fbde-9fe4-41a6-96bf-88b79bc0e209'),(53,53,1,'Workclass ROVs','workclass-rovs-2','equipment-list/workclass-rovs-2',NULL,1,'2025-06-23 08:24:15','2025-06-23 08:24:15','cc879ed3-8102-4615-88ef-4173301ce1d7'),(54,54,1,'Eyeball / Inspection ROVs','eyeball-inspection-rovs','equipment-list/rov-equipment/eyeball-inspection-rovs','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [342], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-23 08:24:15','2025-06-25 13:38:53','d61b9bc7-4b16-485a-a710-566ec3926d36'),(55,55,1,'Eyeball / Inspection ROVs','eyeball-inspection-rovs-2','equipment-list/eyeball-inspection-rovs-2',NULL,1,'2025-06-23 08:24:15','2025-06-23 08:24:15','0664d359-aa10-486e-aaa5-7a02181694d2'),(56,56,1,'Miscellaneous Vehicles and Equipment','miscellaneous-vehicles-and-equipment','equipment-list/rov-equipment/miscellaneous-vehicles-and-equipment','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [345], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-23 08:24:15','2025-06-25 13:39:21','58d701c6-a4fa-4c94-8611-08fbafc49da8'),(57,57,1,'Miscellaneous Vehicles and Equipment','miscellaneous-vehicles-and-equipment-2','equipment-list/miscellaneous-vehicles-and-equipment-2',NULL,1,'2025-06-23 08:24:15','2025-06-23 08:24:15','0fe5018f-d3c0-4438-8733-307866e6195b'),(58,58,1,'Miscellaneous ROVs','miscellaneous-rovs','equipment-list/rov-equipment/miscellaneous-rovs','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [348], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-23 08:24:15','2025-06-25 13:39:09','77e71a50-6708-4926-9bed-5e3873f3312c'),(59,59,1,'Miscellaneous ROVs','miscellaneous-rovs-2','equipment-list/miscellaneous-rovs-2',NULL,1,'2025-06-23 08:24:15','2025-06-23 08:24:15','a2112199-e644-4cee-ae7c-74eb52c150ca'),(60,60,1,'Thrusters','thrusters','equipment-list/rov-equipment/thrusters','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [351], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-23 08:24:15','2025-06-25 13:39:27','26c5c916-90b1-4455-a20b-3461280a164d'),(61,61,1,'Thrusters','thrusters-2','equipment-list/thrusters-2',NULL,1,'2025-06-23 08:24:15','2025-06-23 08:24:15','370d51de-8438-4146-a0bf-33425ea0b96c'),(62,62,1,'Containers','containers','equipment-list/rov-equipment/containers','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [341], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-23 08:24:15','2025-06-25 13:39:43','14a48c24-9d3d-4c40-b87a-2c94771fec76'),(63,63,1,'Containers','containers-2','equipment-list/containers-2',NULL,1,'2025-06-23 08:24:15','2025-06-23 08:24:15','224892b5-6463-470d-9efa-73f14c6b1914'),(64,64,1,'Tether Management Systems','tether-management-systems','equipment-list/rov-equipment/tether-management-systems','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [352], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-23 08:24:16','2025-06-25 13:39:46','ebd70ecf-5e0d-4806-93b4-b2f8e2c4fd31'),(65,65,1,'Tether Management Systems','tether-management-systems-2','equipment-list/tether-management-systems-2',NULL,1,'2025-06-23 08:24:16','2025-06-23 08:24:16','32d425e8-f3b1-4970-a4b1-3f4959ad6a4c'),(66,66,1,'Winches, A-Frames and Cranes','winches-a-frames-and-cranes','equipment-list/rov-equipment/winches-a-frames-and-cranes','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [354], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-23 08:24:16','2025-06-25 13:39:48','975715a8-e788-4aa5-b373-ebedf2b6063b'),(67,67,1,'Winches, A-Frames and Cranes','winches-a-frames-and-cranes-2','equipment-list/winches-a-frames-and-cranes-2',NULL,1,'2025-06-23 08:24:16','2025-06-23 08:24:16','b2b45fb9-6c9d-4ed6-a264-44173e4bae96'),(68,68,1,'Sliprings','sliprings','equipment-list/rov-equipment/sliprings','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [350], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-23 08:24:16','2025-06-25 13:38:53','9661d645-236d-4636-8291-44e13706ce05'),(69,69,1,'Sliprings','sliprings-2','equipment-list/sliprings-2',NULL,1,'2025-06-23 08:24:16','2025-06-23 08:24:16','37bbc293-33f8-49eb-b659-592d1d0a31e7'),(70,70,1,'Manipulators','manipulators','equipment-list/rov-equipment/manipulators','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [344], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-23 08:24:16','2025-06-25 13:38:54','d1a17d07-11b7-4b53-abfd-290398c15285'),(71,71,1,'Manipulators','manipulators-2','equipment-list/manipulators-2',NULL,1,'2025-06-23 08:24:16','2025-06-23 08:24:16','5491f368-d869-433e-b11e-b605bb975e32'),(72,72,1,'ROV Tooling','rov-tooling','equipment-list/rov-equipment/rov-tooling','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [347], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-23 08:24:16','2025-06-25 13:39:23','8a1c075f-ca80-440e-97af-9f06229fa945'),(73,73,1,'ROV Tooling','rov-tooling-2','equipment-list/rov-tooling-2',NULL,1,'2025-06-23 08:24:16','2025-06-23 08:24:16','bf77caee-5da6-414f-9551-f2c6b310578a'),(74,74,1,'ROV Sensors','rov-sensors','equipment-list/rov-equipment/rov-sensors','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [346], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-23 08:24:16','2025-06-25 13:39:24','02ac5649-da17-4161-be1a-fb525b3b26d6'),(75,75,1,'ROV Sensors','rov-sensors-2','equipment-list/rov-sensors-2',NULL,1,'2025-06-23 08:24:16','2025-06-23 08:24:16','ffb6d0d7-5bcd-4f6b-82a8-45bb4f57aa1c'),(76,76,1,'Umbilicals','umbilicals','equipment-list/rov-equipment/umbilicals','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [353], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-23 08:24:16','2025-06-25 13:39:31','664ce798-262e-4656-a747-623eb6f2c81b'),(77,77,1,'Umbilicals','umbilicals-2','equipment-list/umbilicals-2',NULL,1,'2025-06-23 08:24:16','2025-06-23 08:24:16','c614403c-55f2-4bc1-a13c-c92f0172daec'),(78,78,1,'Cameras and lights','cameras-and-lights','equipment-list/rov-equipment/cameras-and-lights','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [340], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-23 08:24:16','2025-06-25 13:39:44','9bb180d3-b30c-4b0f-aa7d-da2589cb5ad1'),(79,79,1,'Cameras and lights','cameras-and-lights-2','equipment-list/cameras-and-lights-2',NULL,1,'2025-06-23 08:24:16','2025-06-23 08:24:16','63bef24c-8600-43a9-b609-f9a83aca6bdb'),(80,80,1,'Sonars','sonars','equipment-list/rov-equipment/sonars','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [349], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-23 08:24:16','2025-06-25 13:39:46','2a4de5cf-d441-41a8-a1c0-5f927425b3da'),(81,81,1,'Sonars','sonars-2','equipment-list/sonars-2',NULL,1,'2025-06-23 08:24:16','2025-06-23 08:24:16','37ce7d0b-7aff-4326-aa2b-1c07ad0d0f7e'),(82,82,1,'Miscellaneous','miscellaneous','equipment-list/rov-equipment/miscellaneous','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [343], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-23 08:24:16','2025-06-25 13:39:48','3deec873-0aaf-4831-a6a7-98bec922a4ad'),(83,83,1,'Miscellaneous','miscellaneous-2','equipment-list/miscellaneous-2',NULL,1,'2025-06-23 08:24:16','2025-06-23 08:24:16','a3e7b19e-b49a-4e68-afd1-ae362b883192'),(84,84,1,'Survey Equipment','survey-equipment','equipment-list/survey-equipment','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"categoryListingPage\"}',1,'2025-06-23 08:24:16','2025-06-25 11:47:02','db2f2163-1655-45e1-98a8-baf7a5b3cbef'),(85,85,1,'ROV Equipment','rov-equipment-2','equipment-list/rov-equipment-2',NULL,1,'2025-06-23 08:24:16','2025-06-23 08:24:16','280eada3-fa7e-4128-8880-1caf31ddc725'),(87,87,1,'Survey Equipment','rov-equipment-2','equipment-list/rov-equipment-2',NULL,1,'2025-06-23 08:25:10','2025-06-23 08:25:10','aaee0176-0ac0-4671-aeca-ab1f7fb35fe5'),(88,88,1,'Geophysical','geophysical','equipment-list/survey-equipment/geophysical','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-23 08:25:42','2025-06-25 11:47:03','bdf7e31d-04ae-4e58-9729-be8903ab239f'),(89,89,1,'Geophysical','geophysical','equipment-list/geophysical',NULL,1,'2025-06-23 08:26:31','2025-06-23 08:26:31','a736fdde-6ccb-40a8-a26c-858382300d4c'),(90,90,1,'Multibeam Sonars','multibeam-sonars','equipment-list/survey-equipment/multibeam-sonars','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-23 08:26:31','2025-06-25 11:47:05','fbef9fe3-d838-4131-b85e-44dfa9ffa604'),(91,91,1,'Multibeam Sonars','multibeam-sonars','equipment-list/multibeam-sonars',NULL,1,'2025-06-23 08:26:35','2025-06-23 08:26:35','58546b3f-1b10-4ce0-870b-8f78320f77e8'),(92,92,1,'Gauges, Probes and Sensors','gauges-probes-and-sensors','equipment-list/survey-equipment/gauges-probes-and-sensors','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-23 08:26:35','2025-06-25 11:47:06','d21cde34-829b-4f47-b6c7-c67c8662b36e'),(93,93,1,'Gauges, Probes and Sensors','gauges-probes-and-sensors','equipment-list/gauges-probes-and-sensors',NULL,1,'2025-06-23 08:26:44','2025-06-23 08:26:44','c5a6bb49-2fad-44ec-b786-d794b3f1a641'),(94,94,1,'Handling Systems','handling-systems','equipment-list/survey-equipment/handling-systems','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-23 08:26:44','2025-06-25 11:47:07','5ad10435-2c95-4909-9f10-f23db7ef1ff3'),(95,95,1,'Handling Systems','handling-systems','equipment-list/handling-systems',NULL,1,'2025-06-23 08:26:55','2025-06-23 08:26:55','61bebe6e-6d54-4d36-826b-72de15c43a82'),(96,96,1,'Deployment Frames, Floatation and Buoys','deployment-frames-floatation-and-buoys','equipment-list/survey-equipment/deployment-frames-floatation-and-buoys','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-23 08:26:55','2025-06-25 11:47:09','32604132-6fcd-417c-9c42-c909f0cdff06'),(97,97,1,'Deployment Frames, Floatation and Buoys','deployment-frames-floatation-and-buoys','equipment-list/deployment-frames-floatation-and-buoys',NULL,1,'2025-06-23 08:27:24','2025-06-23 08:27:24','b01d256f-e728-4308-9dcd-86694ad7f1cf'),(98,98,1,'Cable, Wires and Umbilical','cable-wires-and-umbilical','equipment-list/survey-equipment/cable-wires-and-umbilical','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-23 08:27:24','2025-06-25 11:47:09','872133da-23ef-48df-8173-bc6cbf382632'),(99,99,1,'Cable, Wires and Umbilical','cable-wires-and-umbilical','equipment-list/cable-wires-and-umbilical',NULL,1,'2025-06-23 08:27:31','2025-06-23 08:27:31','80bbec95-6110-429e-8712-b64ffe1a49d7'),(100,100,1,'Surface Positioning','surface-positioning','equipment-list/survey-equipment/surface-positioning','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-23 08:27:31','2025-06-25 11:47:09','31deb4b0-8384-466f-8ee2-51a2f3118b4d'),(101,101,1,'Surface Positioning','surface-positioning','equipment-list/surface-positioning',NULL,1,'2025-06-23 08:27:35','2025-06-23 08:27:35','b58c5596-3223-4754-819d-11d87c4b99ed'),(102,102,1,'Unmanned Survey Vehicles','unmanned-survey-vehicles','equipment-list/survey-equipment/unmanned-survey-vehicles','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-23 08:27:35','2025-06-25 11:47:04','6aa39a30-575f-41cf-99ce-8e52dd56321b'),(103,103,1,'Unmanned Survey Vehicles','unmanned-survey-vehicles','equipment-list/unmanned-survey-vehicles',NULL,1,'2025-06-23 08:30:24','2025-06-23 08:30:24','091887b0-9192-4eb3-aab0-3323e76e3f37'),(104,104,1,'Gyro, Motion and Attitude Sensors','gyro-motion-and-attitude-sensors','equipment-list/survey-equipment/gyro-motion-and-attitude-sensors','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-23 08:30:24','2025-06-25 11:47:05','c725a693-cab2-4a2e-b69e-26e4a4609682'),(105,105,1,'Gyro, Motion and Attitude Sensors','gyro-motion-and-attitude-sensors','equipment-list/gyro-motion-and-attitude-sensors',NULL,1,'2025-06-23 08:30:32','2025-06-23 08:30:32','151b56bb-8b53-4c36-99fa-5d70bc60d0d8'),(106,106,1,'DVL and ADCP Systems','dvl-and-adcp-systems','equipment-list/survey-equipment/dvl-and-adcp-systems','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-23 08:30:32','2025-06-25 11:47:06','230bb7a2-ded4-461d-8867-153fe560ebe8'),(107,107,1,'DVL and ADCP Systems','dvl-and-adcp-systems','equipment-list/dvl-and-adcp-systems',NULL,1,'2025-06-23 08:30:42','2025-06-23 08:30:42','1a6dd7b6-ac74-4f26-b1db-975e5e834417'),(108,108,1,'Geotechnical','geotechnical','equipment-list/survey-equipment/geotechnical','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-23 08:30:42','2025-06-25 11:47:07','e9f13b7b-b3d1-4f42-858b-32c5bc4aa665'),(109,109,1,'Geotechnical','geotechnical','equipment-list/geotechnical',NULL,1,'2025-06-23 08:30:51','2025-06-23 08:30:51','5809f4d0-8a6e-47e8-ba41-1cd695c72d61'),(110,110,1,'Environmental','environmental','equipment-list/survey-equipment/environmental','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-23 08:30:51','2025-06-25 11:47:09','d9a089b5-2eb1-406d-8093-592f777292b4'),(111,111,1,'Environmental','environmental','equipment-list/environmental',NULL,1,'2025-06-23 08:31:00','2025-06-23 08:31:00','58cf1ea2-15dc-4131-9c03-5f0ee774674c'),(112,112,1,'Miscellaneous','miscellaneous','equipment-list/survey-equipment/miscellaneous','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-23 08:31:00','2025-06-25 11:47:09','32b1298e-5854-4fdc-91ba-cd945f0d8591'),(113,113,1,'Miscellaneous','miscellaneous','equipment-list/miscellaneous',NULL,1,'2025-06-23 08:31:08','2025-06-23 08:31:08','107e2d79-4f0c-42cb-b720-8084c8c5a11c'),(114,114,1,NULL,'__temp_awvfyjjcgcrglhytnlhvagktsoauevsabvhq','equipment-list/__temp_awvfyjjcgcrglhytnlhvagktsoauevsabvhq',NULL,1,'2025-06-23 08:31:08','2025-06-23 08:50:36','8469d6fb-0cb7-4c3e-913c-a022245f2a70'),(115,115,1,'Workclass ROVs','workclass-rovs','equipment-list/workclass-rovs',NULL,1,'2025-06-23 08:32:44','2025-06-23 08:32:44','4aa328c6-959d-45db-8a4d-83da2b955d0e'),(116,116,1,'Sliprings','sliprings','equipment-list/sliprings',NULL,1,'2025-06-23 08:32:44','2025-06-23 08:32:44','dfa03bb6-45d7-4492-b778-47178f751e19'),(117,117,1,'Eyeball / Inspection ROVs','eyeball-inspection-rovs','equipment-list/eyeball-inspection-rovs',NULL,1,'2025-06-23 08:32:44','2025-06-23 08:32:44','4ad8d93f-b1d4-4f5a-98fa-a5a0baf098be'),(118,118,1,'Manipulators','manipulators','equipment-list/manipulators',NULL,1,'2025-06-23 08:32:44','2025-06-23 08:32:44','c1bafb2a-d5e3-4cf0-821d-07a433e6e1dd'),(119,119,1,'Miscellaneous Vehicles and Equipment','miscellaneous-vehicles-and-equipment','equipment-list/miscellaneous-vehicles-and-equipment',NULL,1,'2025-06-23 08:32:44','2025-06-23 08:32:44','119d6573-b56c-4b6e-8650-dfe80a11a952'),(120,120,1,'ROV Tooling','rov-tooling','equipment-list/rov-tooling',NULL,1,'2025-06-23 08:32:44','2025-06-23 08:32:44','27d93aab-092a-4848-9dea-4080b76132ae'),(121,121,1,'Miscellaneous ROVs','miscellaneous-rovs','equipment-list/miscellaneous-rovs',NULL,1,'2025-06-23 08:32:44','2025-06-23 08:32:44','d22d0468-b322-4443-85ed-85985385f770'),(122,122,1,'ROV Sensors','rov-sensors','equipment-list/rov-sensors',NULL,1,'2025-06-23 08:32:44','2025-06-23 08:32:44','83a389e2-cd59-4bb1-b329-cdb843446394'),(123,123,1,'Thrusters','thrusters','equipment-list/thrusters',NULL,1,'2025-06-23 08:32:44','2025-06-23 08:32:44','813ebb2d-50a6-4e35-a6a8-6b3b7369355c'),(124,124,1,'Umbilicals','umbilicals','equipment-list/umbilicals',NULL,1,'2025-06-23 08:32:44','2025-06-23 08:32:44','1b64c461-f5b5-4e89-be61-0b68f453726f'),(125,125,1,'Containers','containers','equipment-list/containers',NULL,1,'2025-06-23 08:32:44','2025-06-23 08:32:44','04fbee24-6413-47fd-8767-b9c06e620441'),(126,126,1,'Cameras and lights','cameras-and-lights','equipment-list/cameras-and-lights',NULL,1,'2025-06-23 08:32:44','2025-06-23 08:32:44','dd23f5d9-79dd-4fa6-9a40-898fa442cc88'),(127,127,1,'Tether Management Systems','tether-management-systems','equipment-list/tether-management-systems',NULL,1,'2025-06-23 08:32:44','2025-06-23 08:32:44','ab30bd39-df19-4af0-9e3d-df5bbfd9cdd1'),(128,128,1,'Sonars','sonars','equipment-list/sonars',NULL,1,'2025-06-23 08:32:44','2025-06-23 08:32:44','ceef9fd7-f189-4dfb-9372-c316afed6cd3'),(129,129,1,'Winches, A-Frames and Cranes','winches-a-frames-and-cranes','equipment-list/winches-a-frames-and-cranes',NULL,1,'2025-06-23 08:32:44','2025-06-23 08:32:44','8e0cb218-0538-4a87-9ac0-44bc86946677'),(130,130,1,'Miscellaneous','miscellaneous-2','equipment-list/miscellaneous-2',NULL,1,'2025-06-23 08:32:44','2025-06-23 08:32:44','30836ab3-effa-4774-87dd-2f0b4746c4fb'),(131,131,1,'Survey Equipment','survey-equipment','equipment-list/survey-equipment',NULL,1,'2025-06-23 08:32:44','2025-06-23 08:32:44','faafbc4f-5e97-4b84-aa0c-6eaedfe184e6'),(132,132,1,'Subsea Positioning','subsea-positioning','equipment-list/survey-equipment/subsea-positioning','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-23 08:37:10','2025-06-25 11:47:10','054e6f46-7c0b-40f4-8659-fe19c8ae22ee'),(133,133,1,'Subsea Positioning','subsea-positioning','equipment-list/subsea-positioning',NULL,1,'2025-06-23 08:37:44','2025-06-23 08:37:44','69bf2de1-3592-4795-9ba9-8c821cbde196'),(134,134,1,'test','test','equipment-list/test',NULL,1,'2025-06-23 08:48:33','2025-06-23 08:48:49','ea71c948-5d8c-4658-b3a5-6a8bcc97302e'),(135,135,1,'test','test','equipment-list/test',NULL,1,'2025-06-23 08:48:48','2025-06-23 08:48:48','814462fa-cb07-4c35-9bdc-f8740d888a5e'),(137,137,1,'Miscellaneous','rov-equipment-miscellaneous','equipment-list/rov-equipment-miscellaneous',NULL,1,'2025-06-23 08:50:11','2025-06-23 08:50:11','72b67e1f-0196-40d1-89e1-aef4ff8bb429'),(138,138,1,'Miscellaneous','miscellaneous-2','equipment-list/miscellaneous-2',NULL,1,'2025-06-23 08:50:36','2025-06-23 08:50:36','bd882aef-3ab9-4c24-9787-6e0f74ba7e43'),(139,139,1,'Equipment List','equipment-list','equipment-list',NULL,1,'2025-06-23 10:16:52','2025-06-23 10:16:59','b0e37f3d-bfb5-4e59-be37-e219ff2b2c11'),(140,140,1,NULL,'__temp_fiykpmkevjrdysqaaulhhqsuxpohlagbmgai',NULL,NULL,1,'2025-06-23 10:17:00','2025-06-23 10:17:00','394269a7-fa2b-47c3-853a-2227b114d21d'),(141,141,1,'Equipment List','equipment-list','equipment-list',NULL,1,'2025-06-23 10:17:06','2025-06-23 10:17:06','8d16da7c-3787-46ce-b561-6a786bbf8de4'),(142,142,1,'Equipment Wanted','equipment-wanted','equipment-wanted',NULL,1,'2025-06-23 10:17:10','2025-06-23 10:17:19','7963e235-5584-4988-92ea-e65e4ed5e554'),(143,143,1,'Equipment Wanted','equipment-wanted','equipment-wanted',NULL,1,'2025-06-23 10:17:19','2025-06-23 10:17:19','291541f2-8886-43ac-8fa1-d8fd2aeedbdf'),(144,144,1,'Services','services','services',NULL,1,'2025-06-23 10:17:21','2025-06-23 10:17:35','d19e5f6e-3028-4daf-97ce-c65251f44b9f'),(145,145,1,'Services','services','services',NULL,1,'2025-06-23 10:17:35','2025-06-23 10:17:35','349db000-2ca1-48e3-8eb3-09550c66cf50'),(146,146,1,'About','about','about',NULL,1,'2025-06-23 10:17:36','2025-06-23 10:17:43','bbbedf82-9855-4b43-a9ad-bf6e3b4a7b16'),(147,147,1,'About','about','about',NULL,1,'2025-06-23 10:17:46','2025-06-23 10:17:46','831546d4-9458-405e-8270-6c6fcbc968e9'),(148,148,1,'Contact','contact','contact',NULL,1,'2025-06-23 10:17:46','2025-06-23 10:17:52','28d46792-8735-42d0-a338-f5750cdc2bf5'),(149,149,1,'Contact','contact','contact',NULL,1,'2025-06-23 10:17:53','2025-06-23 10:17:53','f9fde0b3-622d-47c3-ad2d-ade23628b410'),(157,157,1,'SURVEYSEARCH','surveysearch',NULL,'{\"67d0b562-a644-4f8f-9703-8d0165c2e534\": [88, 102, 90, 104, 92, 106, 94, 108, 96, 110, 98, 112, 100, 132]}',1,'2025-06-23 10:21:29','2025-06-23 10:21:29','9082c0aa-4c05-409b-8981-55c4077917ce'),(159,159,1,'Group 16',NULL,NULL,NULL,1,'2025-06-23 11:20:06','2025-06-23 11:20:06','bba0beb8-3dc2-484a-9c24-a124162d499f'),(160,160,1,'Group 16',NULL,NULL,NULL,1,'2025-06-23 11:24:50','2025-06-23 11:24:50','99f89667-bd9c-4558-84ad-39efd43bc5f9'),(161,161,1,'Group 16',NULL,NULL,NULL,1,'2025-06-23 11:25:04','2025-06-23 11:25:04','ba481ee5-4d26-40ae-a390-7ff80fde7518'),(162,162,1,'Group 16',NULL,NULL,NULL,1,'2025-06-23 11:25:33','2025-06-23 11:25:33','2b23c47b-f30a-4d33-b1a1-3404d065a0d2'),(163,163,1,'Site logo',NULL,NULL,NULL,1,'2025-06-23 11:28:40','2025-06-23 11:28:40','a901607e-1791-4ccf-ae63-b66354c2bc95'),(166,166,1,'Header image main twi',NULL,NULL,NULL,1,'2025-06-24 10:04:27','2025-06-24 10:04:27','937689b1-3803-4674-a83b-af8cfbe978b7'),(167,167,1,NULL,'__temp_ecilgedgwxwgkcrvmfdzsnlhgtusvdvjgypi',NULL,'{\"30e3f980-7c9d-4871-a5d3-137315080327\": {\"type\": \"entry\", \"label\": \"View Equipment\", \"value\": \"{entry:139@1:url}\"}, \"4b6fba43-00e6-42e9-bd5d-df5a7c0e6d77\": \"<h6>Specialist Underwater Brokerage</h6>\", \"64bbab36-2b23-4734-a7c5-f9c3f950dc5c\": \"<h1>Global specialists in used ROV and survey equipment</h1><p>Provision of high-quality subsea equipment from trusted sellers worldwide.</p>\", \"ecbc199d-cba2-4043-96f9-babcda7e9d8f\": [166]}',1,'2025-06-24 10:04:35','2025-06-24 10:53:57','c2d3d515-12b8-457c-b755-11cafe8e3ff4'),(168,168,1,'Homepage','homepage','__home__',NULL,1,'2025-06-24 10:04:36','2025-06-24 10:04:36','1e1ee75b-69c4-403d-bf69-3190c10833e4'),(169,169,1,NULL,'__temp_hrgqarbjowveqdnasweatlodrehmsuovlpbk',NULL,'{\"30e3f980-7c9d-4871-a5d3-137315080327\": {\"type\": \"entry\", \"label\": \"View Equipment\", \"value\": \"{entry:139@1:url}\"}, \"4b6fba43-00e6-42e9-bd5d-df5a7c0e6d77\": \"<p>Specialist Underwater Brokerage</p>\", \"64bbab36-2b23-4734-a7c5-f9c3f950dc5c\": \"<h1>Global specialists in used ROV and survey equipment</h1><p>Provision of high-quality subsea equipment from trusted sellers worldwide.</p>\", \"ecbc199d-cba2-4043-96f9-babcda7e9d8f\": [166]}',1,'2025-06-24 10:04:36','2025-06-24 10:04:36','449d3475-8ef7-49d2-902c-6fa62e49fc87'),(172,172,1,NULL,'__temp_drxojzjguziiuritslnvjykmoqoossvnltcl',NULL,NULL,1,'2025-06-24 10:53:54','2025-06-24 10:53:54','651926a0-80ee-4c5c-919e-aef26b36ec80'),(173,173,1,NULL,'__temp_ecilgedgwxwgkcrvmfdzsnlhgtusvdvjgypi',NULL,'{\"30e3f980-7c9d-4871-a5d3-137315080327\": {\"type\": \"entry\", \"label\": \"View Equipment\", \"value\": \"{entry:139@1:url}\"}, \"4b6fba43-00e6-42e9-bd5d-df5a7c0e6d77\": \"<h6>Specialist Underwater Brokerage</h6>\", \"64bbab36-2b23-4734-a7c5-f9c3f950dc5c\": \"<h1>Global specialists in used ROV and survey equipment</h1><p>Provision of high-quality subsea equipment from trusted sellers worldwide.</p>\", \"ecbc199d-cba2-4043-96f9-babcda7e9d8f\": [166]}',1,'2025-06-24 10:53:57','2025-06-24 10:53:57','9f308284-d591-4249-af9c-d483b011bfc5'),(174,174,1,'Homepage','homepage','__home__',NULL,1,'2025-06-24 10:53:57','2025-06-24 10:53:57','3e6d3bf1-71ab-446b-a96d-4ff73a171214'),(179,179,1,'Survey Search Logo',NULL,NULL,NULL,1,'2025-06-24 11:07:42','2025-06-24 11:08:23','438f9ebe-5e96-4f4e-a9a3-2dc5c719d1ab'),(180,180,1,'Deep Search Logo',NULL,NULL,NULL,1,'2025-06-24 11:07:43','2025-06-24 11:08:14','823f00d2-5271-478b-ab03-1d9d5130348a'),(181,181,1,'On deck Flat Holm SURVEYSEARCH Cover',NULL,NULL,NULL,1,'2025-06-24 11:09:04','2025-06-24 11:09:04','88827ae8-3aef-4943-a44f-3776914cf4eb'),(182,182,1,'IMG 5182 cleaned',NULL,NULL,NULL,1,'2025-06-24 11:09:04','2025-06-24 11:09:04','37ad3da1-012c-4ec5-ad9d-789079dc66d0'),(186,186,1,NULL,'__temp_vppljthoycypbgzhbldwcfackxtqaetandju',NULL,'{\"aa3ffb32-22c5-462f-9335-8dd735a45e07\": \"<p>Explore our extensive inventory designed to meet your operational needs and elevate your projects.</p>\", \"d8701d55-4e96-4975-8a83-ca39387151dd\": \"<h2>Browse. Enquire. Purchase. Deploy.</h2>\"}',1,'2025-06-24 11:10:10','2025-06-24 14:55:14','e800325b-0781-4022-9113-94e8cef45a9f'),(187,187,1,NULL,'__temp_gucwcgecjpuhxctdqckvzswiofvhavbmyclz',NULL,'{\"455e3759-a800-4724-9708-7c9be2a69c23\": [180], \"9f00ec96-6c2a-4c18-8826-cf60eaae44fb\": {\"type\": \"entry\", \"label\": \"View ROV equipment\", \"value\": \"{entry:50@1:url}\"}, \"ce108292-a428-4690-8c1a-18857f118010\": [182]}',1,'2025-06-24 11:10:10','2025-06-24 11:10:10','afe1caaf-13f2-4bfd-8717-56bbbc279a9e'),(188,188,1,NULL,'__temp_bubkzdiwipelipoeudogwrhhqgdpstgzsjob',NULL,'{\"455e3759-a800-4724-9708-7c9be2a69c23\": [179], \"9f00ec96-6c2a-4c18-8826-cf60eaae44fb\": {\"type\": \"entry\", \"label\": \"View survey equipment\", \"value\": \"{entry:84@1:url}\"}, \"ce108292-a428-4690-8c1a-18857f118010\": [181]}',1,'2025-06-24 11:10:10','2025-06-24 11:10:10','0a78ff5b-3a04-4919-8f74-c1063da37914'),(189,189,1,NULL,'__temp_oyrqhrdbbbefwklujmeboowhmgsujdbtccyj',NULL,'{\"aa3ffb32-22c5-462f-9335-8dd735a45e07\": \"<p>Explore our extensive inventory designed to meet your operational needs and elevate your projects.</p>\", \"d8701d55-4e96-4975-8a83-ca39387151dd\": \"<h2>Browse. Enquire. Purchase. Deploy.</h2>\"}',1,'2025-06-24 11:10:10','2025-06-24 11:10:10','e50b3443-776f-40b3-b6bd-5668ca930642'),(190,190,1,NULL,'__temp_gucwcgecjpuhxctdqckvzswiofvhavbmyclz',NULL,'{\"455e3759-a800-4724-9708-7c9be2a69c23\": [180], \"9f00ec96-6c2a-4c18-8826-cf60eaae44fb\": {\"type\": \"entry\", \"label\": \"View ROV equipment\", \"value\": \"{entry:50@1:url}\"}, \"ce108292-a428-4690-8c1a-18857f118010\": [182]}',1,'2025-06-24 11:10:10','2025-06-24 11:10:10','295f1960-b72d-4264-9e3c-281ce9d01f0c'),(191,191,1,NULL,'__temp_bubkzdiwipelipoeudogwrhhqgdpstgzsjob',NULL,'{\"455e3759-a800-4724-9708-7c9be2a69c23\": [179], \"9f00ec96-6c2a-4c18-8826-cf60eaae44fb\": {\"type\": \"entry\", \"label\": \"View survey equipment\", \"value\": \"{entry:84@1:url}\"}, \"ce108292-a428-4690-8c1a-18857f118010\": [181]}',1,'2025-06-24 11:10:10','2025-06-24 11:10:10','644a1c6d-69e3-4b82-8576-ee2fd6cce7da'),(192,192,1,'Homepage','homepage','__home__',NULL,1,'2025-06-24 11:10:10','2025-06-24 11:10:10','618b4a18-8890-4e9b-bc1f-14b59d0e9b52'),(193,193,1,'Equipment List','equipment-list','equipment-list','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"mainParent\"}',1,'2025-06-24 13:00:45','2025-06-25 11:43:50','ffe35e22-157e-438d-857b-4e6fb4db67a6'),(194,194,1,'Equipment List','equipment-list','equipment-list/equipment-list',NULL,1,'2025-06-24 13:00:53','2025-06-24 13:00:53','63f380cf-863b-4cb4-9857-90c8b2888129'),(195,195,1,NULL,'__temp_rtivngbnfjlospvgmslxuezbjjshqvgbdwzd','__temp_rtivngbnfjlospvgmslxuezbjjshqvgbdwzd',NULL,1,'2025-06-24 13:01:27','2025-06-24 13:01:27','64769be2-5858-490c-ac22-9e01e7d26f28'),(197,197,1,'Homepage','homepage','__home__',NULL,1,'2025-06-24 14:20:53','2025-06-24 14:20:53','ff78d09b-9797-4b20-b199-3bfc817c2fe6'),(201,201,1,NULL,'__temp_vppljthoycypbgzhbldwcfackxtqaetandju',NULL,'{\"aa3ffb32-22c5-462f-9335-8dd735a45e07\": \"<p>Explore our extensive inventory designed to meet your operational needs and elevate your projects.</p>\", \"d8701d55-4e96-4975-8a83-ca39387151dd\": \"<h2>Browse. Enquire. Purchase. Deploy.</h2>\"}',1,'2025-06-24 14:55:14','2025-06-24 14:55:14','701ff0c5-3ee6-42ae-85d8-124de5f59d02'),(202,202,1,'Homepage','homepage','__home__',NULL,1,'2025-06-24 14:55:15','2025-06-24 14:55:15','291e726d-07e9-476b-8674-11944515ac7b'),(206,206,1,'ROV lifted out of the sea',NULL,NULL,NULL,1,'2025-06-24 15:22:57','2025-06-24 15:22:57','5c7aaf7e-5944-4dbf-90d6-8a326e8b977c'),(211,211,1,NULL,'__temp_sqoitbxksnsxawmfmaanlywdkubehqqdgztz',NULL,NULL,1,'2025-06-24 15:25:47','2025-06-24 16:01:12','1bc9b1d3-17ca-452f-a8c3-a44691d47b89'),(212,212,1,NULL,'__temp_oulyfjxuwbxgxapdnknhyxuktxigrcyyhgcn',NULL,'{\"115b6113-df2d-45fb-ba86-d52c1d7796d0\": [206], \"1410e061-f3a6-4c61-ac0a-88c4559a2caf\": {\"type\": \"entry\", \"label\": \"View equipment\", \"value\": \"{entry:193@1:url}\"}, \"6c5af9fb-885b-4a4a-8994-f75bb36d71bf\": false, \"f20db730-adb1-464a-a81d-a7b1f4561641\": \"<h6><span style=\\\"color:hsl(19,89%,48%);\\\"><strong>How it works</strong></span></h6><h3>The smarter way to source</h3><ul><li><strong>Effortless multi-item enquiries</strong><br />Streamline your purchasing process with our multi-item enquiry feature.</li><li><strong>Intuitive searchable database</strong><br />Easily navigate our user-friendly database to find equipment.</li><li><strong>Your equipment, just a click away</strong><br />Access detailed listings with photos and specifications effortlessly.</li></ul>\"}',1,'2025-06-24 15:25:47','2025-06-24 15:31:09','59f208c1-6828-4116-9bc6-4b3e811dcf79'),(213,213,1,NULL,'__temp_xulizreymmumdmhringljqjuxxqfdvyhxtaz',NULL,'{\"115b6113-df2d-45fb-ba86-d52c1d7796d0\": [218], \"1410e061-f3a6-4c61-ac0a-88c4559a2caf\": {\"type\": \"entry\", \"label\": \"About us\", \"value\": \"{entry:146@1:url}\"}, \"6c5af9fb-885b-4a4a-8994-f75bb36d71bf\": true, \"f20db730-adb1-464a-a81d-a7b1f4561641\": \"<h6><span style=\\\"color:hsl(19,89%,48%);\\\"><strong>Why choose Specialist Underwater Brokerage?</strong></span></h6><h3>Trusted experts in ROV and survey equipment</h3><ul><li><strong>Immediate availability - no long lead times</strong></li><li><strong>Access to hard-to-source subsea equipment</strong></li><li><strong>Trusted brokerage with over 20 years of experience</strong></li><li><strong>Personal, expert advice tailored to your project needs</strong></li></ul>\"}',1,'2025-06-24 15:25:47','2025-06-24 16:01:12','7e3ca62d-cf9b-41a3-95b0-a62da8a267e9'),(214,214,1,NULL,'__temp_zpqhcjptoeufqdbsysrudifrsvkliybivmdr',NULL,NULL,1,'2025-06-24 15:25:47','2025-06-24 15:25:47','18b3c373-9c8a-435f-9d1d-8af4731b8d50'),(215,215,1,NULL,'__temp_oulyfjxuwbxgxapdnknhyxuktxigrcyyhgcn',NULL,'{\"115b6113-df2d-45fb-ba86-d52c1d7796d0\": [206], \"1410e061-f3a6-4c61-ac0a-88c4559a2caf\": {\"type\": \"entry\", \"label\": \"View equipment\", \"value\": \"{entry:193@1:url}\"}, \"6c5af9fb-885b-4a4a-8994-f75bb36d71bf\": false, \"f20db730-adb1-464a-a81d-a7b1f4561641\": \"<h6><span style=\\\"color:hsl(19,89%,48%);\\\"><strong>How it works</strong></span></h6><h3>The smarter<br />way to source</h3><ul><li><strong>Effortless multi-item enquiries</strong><br />Streamline your purchasing process with our multi-item enquiry feature.</li><li><strong>Intuitive searchable database</strong><br />Easily navigate our user-friendly database to find equipment.</li><li><strong>Your equipment, just a click away</strong><br />Access detailed listings with photos and specifications effortlessly.</li></ul>\"}',1,'2025-06-24 15:25:47','2025-06-24 15:25:47','27ac560e-2a74-4191-95ec-0987189ab6b5'),(216,216,1,NULL,'__temp_xulizreymmumdmhringljqjuxxqfdvyhxtaz',NULL,'{\"115b6113-df2d-45fb-ba86-d52c1d7796d0\": [206], \"1410e061-f3a6-4c61-ac0a-88c4559a2caf\": {\"type\": \"entry\", \"label\": \"About us\", \"value\": \"{entry:146@1:url}\"}, \"6c5af9fb-885b-4a4a-8994-f75bb36d71bf\": false, \"f20db730-adb1-464a-a81d-a7b1f4561641\": \"<h6><span style=\\\"color:hsl(19,89%,48%);\\\"><strong>Why choose Specialist Underwater Brokerage?</strong></span></h6><h3>Trusted experts in<br />ROV and survey<br />equipment</h3><ul><li><strong>Immediate availability - no long lead times</strong></li><li><strong>Access to hard-to-source subsea equipment</strong></li><li><strong>Trusted brokerage with over 20 years of experience</strong></li><li><strong>Personal, expert advice tailored to your project needs</strong></li></ul>\"}',1,'2025-06-24 15:25:47','2025-06-24 15:25:47','d75c7873-ee95-4567-add9-12ee5b446a0b'),(217,217,1,'Homepage','homepage','__home__',NULL,1,'2025-06-24 15:25:47','2025-06-24 15:25:47','5b880d84-66f1-4b06-a8b3-ffc31e58c34d'),(218,218,1,'Adobe Stock 832269854 Preview',NULL,NULL,NULL,1,'2025-06-24 15:27:54','2025-06-24 15:27:54','d25a7575-874e-41ec-bd22-db881dba713d'),(224,224,1,NULL,'__temp_ivhxotloxhfpkxzjmjchtyzvblezdmesgtaw',NULL,NULL,1,'2025-06-24 15:28:00','2025-06-24 15:28:00','2026d774-3f43-4414-b540-4151db9f7824'),(225,225,1,NULL,'__temp_xulizreymmumdmhringljqjuxxqfdvyhxtaz',NULL,'{\"115b6113-df2d-45fb-ba86-d52c1d7796d0\": [218], \"1410e061-f3a6-4c61-ac0a-88c4559a2caf\": {\"type\": \"entry\", \"label\": \"About us\", \"value\": \"{entry:146@1:url}\"}, \"6c5af9fb-885b-4a4a-8994-f75bb36d71bf\": false, \"f20db730-adb1-464a-a81d-a7b1f4561641\": \"<h6><span style=\\\"color:hsl(19,89%,48%);\\\"><strong>Why choose Specialist Underwater Brokerage?</strong></span></h6><h3>Trusted experts in<br />ROV and survey<br />equipment</h3><ul><li><strong>Immediate availability - no long lead times</strong></li><li><strong>Access to hard-to-source subsea equipment</strong></li><li><strong>Trusted brokerage with over 20 years of experience</strong></li><li><strong>Personal, expert advice tailored to your project needs</strong></li></ul>\"}',1,'2025-06-24 15:28:00','2025-06-24 15:28:00','07c66278-4d05-44f6-93d6-9f5fbad6fac2'),(226,226,1,'Homepage','homepage','__home__',NULL,1,'2025-06-24 15:28:00','2025-06-24 15:28:00','095ba743-26d8-4a34-9e52-61f0b76b9871'),(234,234,1,NULL,'__temp_hjtzbmxmwhwmwffvyxwwwjyqyfsllhkoxtwt',NULL,NULL,1,'2025-06-24 15:31:09','2025-06-24 15:31:09','83d6165b-0cf6-4dcf-9cb3-27c33ba0c62a'),(235,235,1,NULL,'__temp_oulyfjxuwbxgxapdnknhyxuktxigrcyyhgcn',NULL,'{\"115b6113-df2d-45fb-ba86-d52c1d7796d0\": [206], \"1410e061-f3a6-4c61-ac0a-88c4559a2caf\": {\"type\": \"entry\", \"label\": \"View equipment\", \"value\": \"{entry:193@1:url}\"}, \"6c5af9fb-885b-4a4a-8994-f75bb36d71bf\": false, \"f20db730-adb1-464a-a81d-a7b1f4561641\": \"<h6><span style=\\\"color:hsl(19,89%,48%);\\\"><strong>How it works</strong></span></h6><h3>The smarter way to source</h3><ul><li><strong>Effortless multi-item enquiries</strong><br />Streamline your purchasing process with our multi-item enquiry feature.</li><li><strong>Intuitive searchable database</strong><br />Easily navigate our user-friendly database to find equipment.</li><li><strong>Your equipment, just a click away</strong><br />Access detailed listings with photos and specifications effortlessly.</li></ul>\"}',1,'2025-06-24 15:31:09','2025-06-24 15:31:09','a9b0f41e-a1e1-47af-b136-371ad7f519a1'),(236,236,1,NULL,'__temp_xulizreymmumdmhringljqjuxxqfdvyhxtaz',NULL,'{\"115b6113-df2d-45fb-ba86-d52c1d7796d0\": [218], \"1410e061-f3a6-4c61-ac0a-88c4559a2caf\": {\"type\": \"entry\", \"label\": \"About us\", \"value\": \"{entry:146@1:url}\"}, \"6c5af9fb-885b-4a4a-8994-f75bb36d71bf\": false, \"f20db730-adb1-464a-a81d-a7b1f4561641\": \"<h6><span style=\\\"color:hsl(19,89%,48%);\\\"><strong>Why choose Specialist Underwater Brokerage?</strong></span></h6><h3>Trusted experts in ROV and survey equipment</h3><ul><li><strong>Immediate availability - no long lead times</strong></li><li><strong>Access to hard-to-source subsea equipment</strong></li><li><strong>Trusted brokerage with over 20 years of experience</strong></li><li><strong>Personal, expert advice tailored to your project needs</strong></li></ul>\"}',1,'2025-06-24 15:31:09','2025-06-24 15:31:09','dc9457e6-65ce-43dd-b6c8-ec550925abb4'),(237,237,1,'Homepage','homepage','__home__',NULL,1,'2025-06-24 15:31:09','2025-06-24 15:31:09','f09d52b4-8d40-4897-bdd0-1fe5ca747f9d'),(243,243,1,NULL,'__temp_sqoitbxksnsxawmfmaanlywdkubehqqdgztz',NULL,NULL,1,'2025-06-24 16:01:12','2025-06-24 16:01:12','91ecb538-26d5-4465-af4d-6e99bdca89ba'),(244,244,1,NULL,'__temp_xulizreymmumdmhringljqjuxxqfdvyhxtaz',NULL,'{\"115b6113-df2d-45fb-ba86-d52c1d7796d0\": [218], \"1410e061-f3a6-4c61-ac0a-88c4559a2caf\": {\"type\": \"entry\", \"label\": \"About us\", \"value\": \"{entry:146@1:url}\"}, \"6c5af9fb-885b-4a4a-8994-f75bb36d71bf\": true, \"f20db730-adb1-464a-a81d-a7b1f4561641\": \"<h6><span style=\\\"color:hsl(19,89%,48%);\\\"><strong>Why choose Specialist Underwater Brokerage?</strong></span></h6><h3>Trusted experts in ROV and survey equipment</h3><ul><li><strong>Immediate availability - no long lead times</strong></li><li><strong>Access to hard-to-source subsea equipment</strong></li><li><strong>Trusted brokerage with over 20 years of experience</strong></li><li><strong>Personal, expert advice tailored to your project needs</strong></li></ul>\"}',1,'2025-06-24 16:01:12','2025-06-24 16:01:12','f0ae63dc-4f72-4eef-a205-96f161f3a9c9'),(245,245,1,'Homepage','homepage','__home__',NULL,1,'2025-06-24 16:01:12','2025-06-24 16:01:12','69292cdd-a602-44bd-8131-10a20f59cdc2'),(249,249,1,NULL,'__temp_ujqpkhcdcrlqzkhzgkqluxkmvfwyaefuarcs',NULL,'{\"7eb799bd-8348-499e-a883-7fbf7837d421\": \"<h4>Get our lists straight to your inbox</h4><p>Stay informed with a monthly round-up of available ROV and Survey equipment. No spam – just one issue of both DEEPSEARCH and SURVEYSEARCH each month.</p>\"}',1,'2025-06-25 09:15:33','2025-06-25 09:15:33','ba12532d-6a88-47b1-8560-99e585445ede'),(250,250,1,NULL,'__temp_ujqpkhcdcrlqzkhzgkqluxkmvfwyaefuarcs',NULL,'{\"7eb799bd-8348-499e-a883-7fbf7837d421\": \"<h4>Get our lists straight to your inbox</h4><p>Stay informed with a monthly round-up of available ROV and Survey equipment. No spam – just one issue of both DEEPSEARCH and SURVEYSEARCH each month.</p>\"}',1,'2025-06-25 09:15:33','2025-06-25 09:15:33','0808512b-d8d9-4b72-a26d-290b129f50a5'),(251,251,1,'Homepage','homepage','__home__',NULL,1,'2025-06-25 09:15:33','2025-06-25 09:15:33','ef9b1571-c4a7-49ba-b9a0-ae4603451ce8'),(252,252,1,NULL,NULL,NULL,'{\"29bba45c-c45c-474a-838b-7a067938dbfc\": \"<h6><span style=\\\"color:hsl(19,89%,48%);\\\"><strong>Specialist Underwater Brokerage</strong></span></h6><h5>Global specialists in the brokerage of used ROV and survey equipment. </h5>\", \"4d1fcd6b-bb05-4628-b5fc-8c9eaa417c7e\": [255, 253], \"6c6ef557-332f-4c2a-bea1-e778ea21504a\": {\"type\": \"url\", \"label\": \"LinkedIn\", \"value\": \"https://uk.linkedin.com/company/specialist-underwater-brokerage\", \"target\": \"_blank\"}, \"b1908e11-e036-4f70-a023-67f5f10e0f9b\": \"<p>Broomfield<br />Ellon<br />Aberdeenshire<br />Scotland<br />AB41 8QY</p>\", \"e291860f-f448-434b-8f78-bc0e1c17df7e\": \"+44 (0) 1224 471013\", \"e2d85da6-ced2-45aa-b62a-7d9b0e4fadaa\": \"sales@sub-ltd.com\"}',1,'2025-06-25 10:23:27','2025-06-25 10:33:30','2d087d29-d4be-42b3-9a44-7c1b39d2150d'),(253,253,1,'Privacy Policy','privacy-policy','privacy-policy',NULL,1,'2025-06-25 10:31:58','2025-06-25 10:32:34','938b4492-9ad0-426b-b16a-a485d0ca0d67'),(254,254,1,'Privacy Policy','privacy-policy','privacy-policy',NULL,1,'2025-06-25 10:32:04','2025-06-25 10:32:04','d1f9991e-c5cb-4a80-a683-ddcde0adf817'),(255,255,1,'Terms and Conditions','terms-and-conditions','terms-and-conditions',NULL,1,'2025-06-25 10:32:06','2025-06-25 10:32:34','929da334-da22-4c6d-9e27-bec6eb18af3a'),(256,256,1,'Terms and Conditions','terms-and-conditions','terms-and-conditions',NULL,1,'2025-06-25 10:32:18','2025-06-25 10:32:18','05aca94b-fc8c-42b0-9caa-f3473f4ee71c'),(259,259,1,'ROV Equipment','rov-equipment','equipment-list/rov-equipment','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"categoryListingPage\"}',1,'2025-06-25 11:43:40','2025-06-25 11:43:40','9bcec74c-2307-43fa-ace6-86a7522ca28c'),(261,261,1,'Equipment List','equipment-list','equipment-list','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"mainParent\"}',1,'2025-06-25 11:43:50','2025-06-25 11:43:50','a9fbb815-dae9-45d2-a2ea-f4521dff9224'),(278,278,1,'Miscellaneous','miscellaneous-2','equipment-list/rov-equipment/miscellaneous-2','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:45:12','2025-06-25 11:45:12','fec16895-c688-4530-8d32-18b9176ecebd'),(279,279,1,'Workclass ROVs','workclass-rovs','equipment-list/rov-equipment/workclass-rovs','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:45:15','2025-06-25 11:45:15','cca1a5c7-b215-46ac-b36a-f042b0a9c66f'),(280,280,1,'Sliprings','sliprings','equipment-list/rov-equipment/sliprings','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:45:16','2025-06-25 11:45:16','8072cb95-221e-405a-9449-f6dc8215594c'),(281,281,1,'Eyeball / Inspection ROVs','eyeball-inspection-rovs','equipment-list/rov-equipment/eyeball-inspection-rovs','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:45:16','2025-06-25 11:45:16','bfd5896e-508c-49b2-bd12-3a1c7fcae54b'),(282,282,1,'Manipulators','manipulators','equipment-list/rov-equipment/manipulators','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:45:17','2025-06-25 11:45:17','60c4dc59-1a90-429b-b19a-27b0dc47d1e7'),(283,283,1,'Miscellaneous Vehicles and Equipment','miscellaneous-vehicles-and-equipment','equipment-list/rov-equipment/miscellaneous-vehicles-and-equipment','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:45:18','2025-06-25 11:45:18','23c14509-b713-4a21-9b16-6500dc3df718'),(284,284,1,'ROV Tooling','rov-tooling','equipment-list/rov-equipment/rov-tooling','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:45:18','2025-06-25 11:45:18','2c532471-70aa-407a-84c7-de1b45f0dac3'),(285,285,1,'Miscellaneous ROVs','miscellaneous-rovs','equipment-list/rov-equipment/miscellaneous-rovs','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:45:20','2025-06-25 11:45:20','c7abee90-1feb-4182-adfe-74a26313e9cb'),(286,286,1,'ROV Sensors','rov-sensors','equipment-list/rov-equipment/rov-sensors','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:45:20','2025-06-25 11:45:20','528c61e8-74e2-41c7-b447-790c2a2b585b'),(287,287,1,'Thrusters','thrusters','equipment-list/rov-equipment/thrusters','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:45:20','2025-06-25 11:45:20','a306ff4d-83c0-4772-9fe2-b435312c6817'),(288,288,1,'Umbilicals','umbilicals','equipment-list/rov-equipment/umbilicals','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:45:20','2025-06-25 11:45:20','49e08327-46bf-46d1-a227-2f4833294378'),(289,289,1,'Containers','containers','equipment-list/rov-equipment/containers','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:45:23','2025-06-25 11:45:23','aba27b99-73d8-47e0-98f5-63ae8c53a1ce'),(290,290,1,'Cameras and lights','cameras-and-lights','equipment-list/rov-equipment/cameras-and-lights','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:45:23','2025-06-25 11:45:23','fd216be8-e9e3-4b76-a288-f3e5fab99498'),(291,291,1,'Tether Management Systems','tether-management-systems','equipment-list/rov-equipment/tether-management-systems','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:45:23','2025-06-25 11:45:23','ab92b427-2097-419f-a333-711091095495'),(292,292,1,'Sonars','sonars','equipment-list/rov-equipment/sonars','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:45:24','2025-06-25 11:45:24','c7986bee-2e2f-45ea-9a6d-f5a5562eb5a0'),(293,293,1,'Winches, A-Frames and Cranes','winches-a-frames-and-cranes','equipment-list/rov-equipment/winches-a-frames-and-cranes','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:45:24','2025-06-25 11:45:24','b4920bd0-58e3-4020-8668-75ef34fbbf5e'),(294,294,1,NULL,'__temp_goreoigebdiekmlxkmhuubqytbxgqzqhmmlu','__temp_goreoigebdiekmlxkmhuubqytbxgqzqhmmlu','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:45:25','2025-06-25 11:45:25','9f650218-0c05-4ba9-9d37-aac32b61b1ef'),(295,295,1,'Miscellaneous','miscellaneous','equipment-list/rov-equipment/miscellaneous','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:46:04','2025-06-25 11:46:04','280f0064-ea86-40e0-9a4b-d50c3fc85d97'),(311,311,1,'Survey Equipment','survey-equipment','equipment-list/survey-equipment','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"categoryListingPage\"}',1,'2025-06-25 11:47:02','2025-06-25 11:47:02','23d945bb-ad8e-41be-a2e3-cca946f4d118'),(312,312,1,'Geophysical','geophysical','equipment-list/survey-equipment/geophysical','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:47:04','2025-06-25 11:47:04','5d68d4b9-94e4-48e5-b944-78be98f43695'),(313,313,1,'Unmanned Survey Vehicles','unmanned-survey-vehicles','equipment-list/survey-equipment/unmanned-survey-vehicles','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:47:04','2025-06-25 11:47:04','6087fa1c-ba49-4bfb-ab84-c39ca00c3ef7'),(314,314,1,'Multibeam Sonars','multibeam-sonars','equipment-list/survey-equipment/multibeam-sonars','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:47:05','2025-06-25 11:47:05','2f13de76-3ec6-483a-bf0e-0be1a9f7d399'),(315,315,1,'Gyro, Motion and Attitude Sensors','gyro-motion-and-attitude-sensors','equipment-list/survey-equipment/gyro-motion-and-attitude-sensors','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:47:05','2025-06-25 11:47:05','fc4f85c5-6d1e-46f4-94a5-3c4e035acba0'),(316,316,1,'Gauges, Probes and Sensors','gauges-probes-and-sensors','equipment-list/survey-equipment/gauges-probes-and-sensors','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:47:06','2025-06-25 11:47:06','a1739fde-6917-4256-b58c-f39004b8011b'),(317,317,1,'DVL and ADCP Systems','dvl-and-adcp-systems','equipment-list/survey-equipment/dvl-and-adcp-systems','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:47:06','2025-06-25 11:47:06','c96dedb1-ed16-42ca-9eb5-c705ce1581e0'),(318,318,1,'Handling Systems','handling-systems','equipment-list/survey-equipment/handling-systems','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:47:07','2025-06-25 11:47:07','ab000ed8-d2f4-4dd8-b481-244750155927'),(319,319,1,'Geotechnical','geotechnical','equipment-list/survey-equipment/geotechnical','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:47:07','2025-06-25 11:47:07','964554f6-3d88-4620-8c5a-217dd8aa6ccb'),(320,320,1,'Deployment Frames, Floatation and Buoys','deployment-frames-floatation-and-buoys','equipment-list/survey-equipment/deployment-frames-floatation-and-buoys','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:47:09','2025-06-25 11:47:09','d21f00a9-0884-486d-89fc-a0e90b2023d7'),(321,321,1,'Environmental','environmental','equipment-list/survey-equipment/environmental','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:47:09','2025-06-25 11:47:09','7cb0c75d-8c4b-42d2-9a01-2009986fadcd'),(322,322,1,'Cable, Wires and Umbilical','cable-wires-and-umbilical','equipment-list/survey-equipment/cable-wires-and-umbilical','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:47:09','2025-06-25 11:47:09','79d83e70-b66b-4e84-ac3d-855f3eb6de70'),(323,323,1,'Miscellaneous','miscellaneous','equipment-list/survey-equipment/miscellaneous','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:47:09','2025-06-25 11:47:09','21cf2de4-f870-4dc7-930a-4352a917b97c'),(324,324,1,'Surface Positioning','surface-positioning','equipment-list/survey-equipment/surface-positioning','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:47:09','2025-06-25 11:47:09','f984667b-b520-4e30-8516-ab1069713514'),(325,325,1,'Subsea Positioning','subsea-positioning','equipment-list/survey-equipment/subsea-positioning','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:47:10','2025-06-25 11:47:10','d9db5681-2ed6-413a-924a-42b120626d18'),(326,326,1,'Deployment Frames, Floatation and Buoys','deployment-frames-floatation-and-buoys','equipment-list/survey-equipment/deployment-frames-floatation-and-buoys','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:47:20','2025-06-25 11:47:20','93a10b58-bd44-4180-97f1-8c85a929a85d'),(327,327,1,'Environmental','environmental','equipment-list/survey-equipment/environmental','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:47:21','2025-06-25 11:47:21','47638ec1-9c9f-49c5-a37c-9ab7a1c6c449'),(328,328,1,'Cable, Wires and Umbilical','cable-wires-and-umbilical','equipment-list/survey-equipment/cable-wires-and-umbilical','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:47:21','2025-06-25 11:47:21','09393195-12eb-4580-9dba-15dc17bd440c'),(329,329,1,'Miscellaneous','miscellaneous','equipment-list/survey-equipment/miscellaneous','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:47:23','2025-06-25 11:47:23','be3bac8f-683e-4f1b-9b00-99a657c2b3af'),(330,330,1,'Surface Positioning','surface-positioning','equipment-list/survey-equipment/surface-positioning','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:47:26','2025-06-25 11:47:26','69806769-dce8-48db-aa1a-af643de42517'),(331,331,1,'Subsea Positioning','subsea-positioning','equipment-list/survey-equipment/subsea-positioning','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 11:47:28','2025-06-25 11:47:28','2ddd5552-9ca2-40b1-9a9e-d7a46e3b94bd'),(335,335,1,NULL,'__temp_vjgaespxtbsiuqwvqptktycorfywhxgcqtlb',NULL,NULL,1,'2025-06-25 13:17:41','2025-06-25 13:17:41','b539def8-1674-4d19-8505-1a2a6524a27c'),(336,336,1,NULL,'__temp_vjgaespxtbsiuqwvqptktycorfywhxgcqtlb',NULL,NULL,1,'2025-06-25 13:17:41','2025-06-25 13:17:41','6dca1c05-7b2e-4b51-93f9-9fd5016bf50c'),(337,337,1,'ROV Equipment','rov-equipment','equipment-list/rov-equipment','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"categoryListingPage\"}',1,'2025-06-25 13:17:41','2025-06-25 13:17:41','0ee9a060-3b82-44d8-8b33-d269100963a2'),(338,338,1,NULL,'__temp_eibxljseymicrlpzzsyfosqkvxbwmmrkumao','__temp_eibxljseymicrlpzzsyfosqkvxbwmmrkumao','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 13:19:13','2025-06-25 13:19:13','c95836bd-06f3-45eb-a8db-b455dc47ff41'),(339,339,1,NULL,'__temp_kwkujvuxndriuggoabkdydztsoupsbzxbhzn','__temp_kwkujvuxndriuggoabkdydztsoupsbzxbhzn','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 13:25:26','2025-06-25 13:25:26','7489ab0b-16c3-4374-ab35-d44962d76a5a'),(340,340,1,'CAM',NULL,NULL,NULL,1,'2025-06-25 13:31:51','2025-06-25 13:31:51','3a4a6be9-63bf-461e-818b-fb011c741e62'),(341,341,1,'CTR',NULL,NULL,NULL,1,'2025-06-25 13:31:51','2025-06-25 13:31:51','6d333703-55d1-4e2c-840e-ada18ea7003f'),(342,342,1,'ERS',NULL,NULL,NULL,1,'2025-06-25 13:31:51','2025-06-25 13:31:51','91548627-aa5f-4677-8923-889fd78a316c'),(343,343,1,'MIS',NULL,NULL,NULL,1,'2025-06-25 13:31:52','2025-06-25 13:31:52','e3dcb6ac-9aef-407c-8da4-a9fa4876b4a3'),(344,344,1,'MNP',NULL,NULL,NULL,1,'2025-06-25 13:31:52','2025-06-25 13:31:52','94f96bb2-7377-4c46-a99e-bf759610977a'),(345,345,1,'MVE',NULL,NULL,NULL,1,'2025-06-25 13:31:52','2025-06-25 13:31:52','6bb1e1bd-945d-444f-b8e0-7daf1288ca70'),(346,346,1,'ROS',NULL,NULL,NULL,1,'2025-06-25 13:31:52','2025-06-25 13:31:52','709f6c33-763f-46ba-b43e-b46baa6a08c7'),(347,347,1,'RTG',NULL,NULL,NULL,1,'2025-06-25 13:31:52','2025-06-25 13:31:52','38e8596c-1574-4dd1-b0b5-cf4570b23ac8'),(348,348,1,'RVM',NULL,NULL,NULL,1,'2025-06-25 13:31:52','2025-06-25 13:31:52','3a42b24d-ee2d-4b1f-80b5-d7deb954e338'),(349,349,1,'SNR',NULL,NULL,NULL,1,'2025-06-25 13:31:52','2025-06-25 13:31:52','b13b0a3b-b0fc-4a3a-8c83-847e5a3bd1e2'),(350,350,1,'SPG',NULL,NULL,NULL,1,'2025-06-25 13:31:52','2025-06-25 13:31:52','afb79b9f-d5fd-487a-9b86-a10d58dc8d92'),(351,351,1,'THR',NULL,NULL,NULL,1,'2025-06-25 13:31:52','2025-06-25 13:31:52','d1bf43b8-c10d-4d78-8a8e-d6bc21cd6ddb'),(352,352,1,'TMS',NULL,NULL,NULL,1,'2025-06-25 13:31:53','2025-06-25 13:31:53','d0156c42-fdd8-40ea-a3ee-01c23ff0efb6'),(353,353,1,'UMB',NULL,NULL,NULL,1,'2025-06-25 13:31:53','2025-06-25 13:31:53','4decd0ba-325c-43d7-b4e1-ec528d358a94'),(354,354,1,'WCH',NULL,NULL,NULL,1,'2025-06-25 13:31:53','2025-06-25 13:31:53','7adcbcaa-2903-4b7c-8856-42f6d8e8426b'),(355,355,1,'WRS',NULL,NULL,NULL,1,'2025-06-25 13:31:53','2025-06-25 13:31:53','38a7e60c-e6c3-494b-9253-f685993039c9'),(357,357,1,'Workclass ROVs','workclass-rovs','equipment-list/rov-equipment/workclass-rovs','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [355], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 13:32:11','2025-06-25 13:32:11','8530aeac-3f2b-4432-abdc-ccff49cc728b'),(364,364,1,'Workclass ROVs','workclass-rovs','equipment-list/rov-equipment/workclass-rovs','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [355], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 13:38:52','2025-06-25 13:38:52','7693271e-62db-404b-bec7-5fec55d42327'),(365,365,1,'Sliprings','sliprings','equipment-list/rov-equipment/sliprings','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [350], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 13:38:53','2025-06-25 13:38:53','4a0f010e-643d-477b-aae2-c17b83405f4c'),(366,366,1,'Eyeball / Inspection ROVs','eyeball-inspection-rovs','equipment-list/rov-equipment/eyeball-inspection-rovs','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [342], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 13:38:53','2025-06-25 13:38:53','052d3b31-f783-4474-abb0-24667cdc69de'),(367,367,1,'Manipulators','manipulators','equipment-list/rov-equipment/manipulators','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [344], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 13:38:54','2025-06-25 13:38:54','b4f4d207-ba66-4bd6-a32c-0554fcfb6bf3'),(370,370,1,'Miscellaneous ROVs','miscellaneous-rovs','equipment-list/rov-equipment/miscellaneous-rovs','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [348], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 13:39:09','2025-06-25 13:39:09','3b9d28ad-696d-41b7-80cb-8ca836193c7f'),(373,373,1,'Miscellaneous Vehicles and Equipment','miscellaneous-vehicles-and-equipment','equipment-list/rov-equipment/miscellaneous-vehicles-and-equipment','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [345], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 13:39:21','2025-06-25 13:39:21','7eee00e8-4b71-4f58-9b22-a90679dd925c'),(374,374,1,'ROV Tooling','rov-tooling','equipment-list/rov-equipment/rov-tooling','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [347], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 13:39:23','2025-06-25 13:39:23','be2fa11e-7959-42b8-8a13-91880624add7'),(375,375,1,'ROV Sensors','rov-sensors','equipment-list/rov-equipment/rov-sensors','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [346], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 13:39:24','2025-06-25 13:39:24','ff7e4d3e-4a6b-4aef-9960-34715141fc03'),(377,377,1,'Thrusters','thrusters','equipment-list/rov-equipment/thrusters','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [351], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 13:39:27','2025-06-25 13:39:27','915a0207-1547-458c-86eb-50e07ab321c4'),(379,379,1,'Umbilicals','umbilicals','equipment-list/rov-equipment/umbilicals','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [353], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 13:39:31','2025-06-25 13:39:31','2e5f6240-5560-4523-b548-dd2a7439247f'),(383,383,1,'Containers','containers','equipment-list/rov-equipment/containers','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [341], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 13:39:43','2025-06-25 13:39:43','f21140c9-f619-41cf-ac38-7f3959490999'),(384,384,1,'Cameras and lights','cameras-and-lights','equipment-list/rov-equipment/cameras-and-lights','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [340], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 13:39:44','2025-06-25 13:39:44','814207e9-a170-48d2-8419-864d297f3e7a'),(385,385,1,'Tether Management Systems','tether-management-systems','equipment-list/rov-equipment/tether-management-systems','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [352], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 13:39:46','2025-06-25 13:39:46','bab7cd54-3231-4319-a773-ab5297c99429'),(386,386,1,'Sonars','sonars','equipment-list/rov-equipment/sonars','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [349], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 13:39:46','2025-06-25 13:39:46','9a9aa7be-5283-43ee-ab81-2c53000778e0'),(387,387,1,'Winches, A-Frames and Cranes','winches-a-frames-and-cranes','equipment-list/rov-equipment/winches-a-frames-and-cranes','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [354], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 13:39:48','2025-06-25 13:39:48','078f5b0d-61b2-4e42-8df2-20d4c6032e45'),(388,388,1,'Miscellaneous','miscellaneous','equipment-list/rov-equipment/miscellaneous','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [343], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 13:39:48','2025-06-25 13:39:48','6384ef5e-c3a6-456f-80af-10f456e11f3e'),(389,389,1,'Sonars','sonars','equipment-list/rov-equipment/sonars','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [349], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 13:39:54','2025-06-25 13:39:54','271b6b4d-1605-4f59-aa44-ed45b0ccf70f'),(390,390,1,'Micro','micro','equipment-list/rov-equipment/eyeball-inspection-rovs/micro','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:00:16','2025-06-25 14:48:01','1f7a6d3a-a3a0-4c63-8ad7-06eb50b803fe'),(391,391,1,'Micro','micro','equipment-list/rov-equipment/eyeball-inspection-rovs/micro','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:00:43','2025-06-25 14:00:43','613b696f-b5d6-49aa-bccc-d0020c69da49'),(392,392,1,'Large','large','equipment-list/rov-equipment/eyeball-inspection-rovs/large','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:15:58','2025-06-25 14:16:46','96ac5bc5-e428-4744-9722-7119b6f98444'),(393,393,1,'Micro','micro','micro','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:15:58','2025-06-25 14:15:58','1928c913-8f45-4e5d-b482-505b635a6b4d'),(394,394,1,'Medium','medium','equipment-list/rov-equipment/eyeball-inspection-rovs/medium','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:16:05','2025-06-25 14:16:39','bfa5be3e-ae21-46af-95d7-52f1c4933dbc'),(395,395,1,'Micro','micro','micro','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:16:05','2025-06-25 14:16:05','7796e212-4852-49ec-95ea-56040156adae'),(396,396,1,'Micro','medium','equipment-list/rov-equipment/eyeball-inspection-rovs/medium','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:16:29','2025-06-25 14:16:29','d2199518-c16e-4899-bcaa-4bd81f6790bc'),(397,397,1,'Micro','large','equipment-list/rov-equipment/eyeball-inspection-rovs/large','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:16:29','2025-06-25 14:16:29','f6dbb711-ba5c-451e-b5af-e17a6b132109'),(399,399,1,'Medium','medium','equipment-list/rov-equipment/eyeball-inspection-rovs/medium','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:16:39','2025-06-25 14:16:39','0998bd11-104e-40b3-acc9-277ef48c128c'),(401,401,1,'Large','large','equipment-list/rov-equipment/eyeball-inspection-rovs/large','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:16:46','2025-06-25 14:16:46','74b4070f-2465-443d-80f2-421263f53bcd'),(402,402,1,'Trenchers','trenchers','equipment-list/rov-equipment/miscellaneous-vehicles-and-equipment/trenchers','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:17:01','2025-06-25 14:26:25','046c36e0-f2cc-4685-a786-280b4f66902e'),(403,403,1,'Trenchers','trenchers','equipment-list/rov-equipment/miscellaneous-vehicles-and-equipment/trenchers','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productIndividualPage\"}',1,'2025-06-25 14:17:23','2025-06-25 14:17:23','77b64d6d-6590-495a-bb0b-b6875472bbe9'),(404,404,1,'Grabs','grabs','equipment-list/rov-equipment/miscellaneous-vehicles-and-equipment/grabs','{\"4da7212b-b18b-4781-897d-15da4c3d2e9b\": [], \"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:17:23','2025-06-25 14:26:23','61568c0c-174c-4518-b4f4-e59046c9d92e'),(405,405,1,'Grabs','grabs','equipment-list/rov-equipment/miscellaneous-vehicles-and-equipment/grabs','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productIndividualPage\"}',1,'2025-06-25 14:17:31','2025-06-25 14:17:31','f191643f-a3e5-4840-abcf-0e8cca31f2b3'),(406,406,1,'Ploughs','ploughs','equipment-list/rov-equipment/miscellaneous-vehicles-and-equipment/ploughs','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:17:31','2025-06-25 14:17:37','85e868a5-d326-44d4-bffa-93d280a3fe08'),(407,407,1,'Ploughs','ploughs','equipment-list/rov-equipment/miscellaneous-vehicles-and-equipment/ploughs','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:17:44','2025-06-25 14:17:44','c278069d-80c6-4a6e-a5be-e99115b6ec8e'),(408,408,1,'Cable Equipment','cable-equipment','equipment-list/rov-equipment/miscellaneous-vehicles-and-equipment/cable-equipment','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:17:44','2025-06-25 14:17:55','d081a797-a773-4179-a1c7-a183f2d0a34a'),(409,409,1,'Cable Equipment','cable-equipment','equipment-list/rov-equipment/miscellaneous-vehicles-and-equipment/cable-equipment','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:17:58','2025-06-25 14:17:58','feb0c4db-ae7d-46b3-ba0e-65a5dde7d94e'),(410,410,1,'ROV Motors','rov-motors','equipment-list/rov-equipment/miscellaneous-rovs/rov-motors','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:17:58','2025-06-25 14:18:20','1c3ebe65-5d55-4edc-9be3-5a3fbd5dde39'),(411,411,1,'ROV Motors','rov-motors','equipment-list/rov-equipment/miscellaneous-rovs/rov-motors','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:18:19','2025-06-25 14:18:19','801b1f9f-7769-4e89-bf4f-320c25dcf7d3'),(412,412,1,'Look Latches','look-latches','equipment-list/rov-equipment/miscellaneous-rovs/look-latches','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:18:19','2025-06-25 14:18:24','bde462d3-56ff-45e8-b07a-e47eec6bafdd'),(413,413,1,'Look Latches','look-latches','equipment-list/rov-equipment/miscellaneous-rovs/look-latches','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:18:28','2025-06-25 14:18:28','6a31b8cc-6269-40bd-9a63-295e9f2e9fae'),(414,414,1,'Transformers / PDUs','transformers-pdus','equipment-list/rov-equipment/miscellaneous-rovs/transformers-pdus','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:18:28','2025-06-25 14:18:38','96633862-761d-40c7-bdc3-a825b33ada90'),(415,415,1,'Transformers / PDUs','transformers-pdus','equipment-list/rov-equipment/miscellaneous-rovs/transformers-pdus','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:18:39','2025-06-25 14:18:39','400bc0a3-8bf5-456e-8f74-c14a234bc83a'),(416,416,1,'Buoyancy','buoyancy','equipment-list/rov-equipment/miscellaneous-rovs/buoyancy','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:18:39','2025-06-25 14:18:52','a12d92c1-0955-4550-af5b-39cc844d5e94'),(417,417,1,'Buoyancy','buoyancy','equipment-list/rov-equipment/miscellaneous-rovs/buoyancy','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:18:54','2025-06-25 14:18:54','6303911f-962f-4bd4-aa15-bde7913fca88'),(418,418,1,'PCBs','pcbs','equipment-list/rov-equipment/miscellaneous-rovs/pcbs','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:18:54','2025-06-25 14:18:57','68637f8f-1ccc-4fbe-9016-ca844caaed5e'),(419,419,1,'PCBs','pcbs','equipment-list/rov-equipment/miscellaneous-rovs/pcbs','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:18:58','2025-06-25 14:18:58','23922747-9274-4a25-a7f4-0e68e91884b7'),(420,420,1,'Electric Thrusters','electric-thrusters','equipment-list/rov-equipment/thrusters/electric-thrusters','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:18:58','2025-06-25 14:19:23','2cb004fa-25d8-4288-972d-fe75efbe5574'),(421,421,1,'Electric Thrusters','electric-thrusters','equipment-list/rov-equipment/thrusters/electric-thrusters','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:19:22','2025-06-25 14:19:22','9b7c0c1a-89a2-4ff0-a5d2-4a56f38d5a9b'),(422,422,1,'Hydraulic Thrusters','hydraulic-thrusters','equipment-list/rov-equipment/thrusters/hydraulic-thrusters','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:19:22','2025-06-25 14:19:28','10bee687-2dbd-4d7f-a9c2-5839914242ab'),(423,423,1,'Hydraulic Thrusters','hydraulic-thrusters','equipment-list/rov-equipment/thrusters/hydraulic-thrusters','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:19:29','2025-06-25 14:19:29','a44bbae1-63e7-4b7f-9da9-69d5f734b8a4'),(424,424,1,'Launch & Recovery Systems','launch-recovery-systems','equipment-list/rov-equipment/winches-a-frames-and-cranes/launch-recovery-systems','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:19:29','2025-06-25 14:20:31','5c82d065-a913-4edd-adc2-6fb1b4f4b052'),(425,425,1,'Launch & Recovery Systems','launch-recovery-systems','equipment-list/rov-equipment/winches-a-frames-and-cranes/launch-recovery-systems','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:20:31','2025-06-25 14:20:31','599f618f-c608-4f3c-82f5-10fdf13af09c'),(426,426,1,'Cranes','cranes','equipment-list/rov-equipment/winches-a-frames-and-cranes/cranes','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:20:31','2025-06-25 14:20:33','8e95546b-dc5a-4a89-bc06-211b7032577e'),(427,427,1,'Cranes','cranes','equipment-list/rov-equipment/winches-a-frames-and-cranes/cranes','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:20:34','2025-06-25 14:20:34','0d876d0b-e29d-4c89-97a5-80089b7c19c9'),(428,428,1,'Winches','winches','equipment-list/rov-equipment/winches-a-frames-and-cranes/winches','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:20:34','2025-06-25 14:20:38','f1bcdbb7-6047-4879-b0a4-f33c82269d8a'),(429,429,1,'Winches','winches','equipment-list/rov-equipment/winches-a-frames-and-cranes/winches','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:20:39','2025-06-25 14:20:39','ca821778-b30f-4c1b-9cc5-e3ac87e914aa'),(430,430,1,'Deck HPUs','deck-hpus','equipment-list/rov-equipment/winches-a-frames-and-cranes/deck-hpus','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:20:39','2025-06-25 14:20:43','9fdd41ed-d3c2-41b1-86d4-569498c29aa3'),(431,431,1,'Deck HPUs','deck-hpus','equipment-list/rov-equipment/winches-a-frames-and-cranes/deck-hpus','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:20:43','2025-06-25 14:20:43','8cc0a9fa-a4d7-4c0f-a743-a0be777d0e50'),(432,432,1,'A-Frames','a-frames','equipment-list/rov-equipment/winches-a-frames-and-cranes/a-frames','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:20:43','2025-06-25 14:20:50','8bfe7748-500c-4701-a209-16b84f9f52be'),(433,433,1,'A-Frames','a-frames','equipment-list/rov-equipment/winches-a-frames-and-cranes/a-frames','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:20:50','2025-06-25 14:20:50','62ab4ad8-d6be-43c3-a488-080b1311a7e2'),(434,434,1,'Manipulators','manipulators','equipment-list/rov-equipment/manipulators/manipulators','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:20:50','2025-06-25 14:21:13','e63429d8-41b7-477d-9ae4-6defde1214db'),(435,435,1,'Manipulators','manipulators','equipment-list/rov-equipment/manipulators/manipulators','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:21:13','2025-06-25 14:21:13','c976f026-14a1-4898-8357-cf6fa720bdbc'),(436,436,1,'Parts & Spares','parts-spares','equipment-list/rov-equipment/manipulators/parts-spares','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:21:13','2025-06-25 14:21:18','72fdd8e9-14f8-45c8-a015-e04c941e81f7'),(437,437,1,'Parts & Spares','parts-spares','equipment-list/rov-equipment/manipulators/parts-spares','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:21:18','2025-06-25 14:21:18','6015dbd4-9880-4b7a-b991-64ce8d7a46ba'),(438,438,1,'Pipe/Cable Trackers','pipe-cable-trackers','equipment-list/rov-equipment/rov-sensors/pipe-cable-trackers','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:21:18','2025-06-25 14:22:31','9187887d-79c5-47bb-be18-c4d90fd6bae4'),(439,439,1,'Pipe/Cable Trackers','pipe-cable-trackers','equipment-list/rov-equipment/rov-sensors/pipe-cable-trackers','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:22:31','2025-06-25 14:22:31','1eafd438-b0b2-42cc-bc39-ffae7aa07074'),(440,440,1,'Altimeters / Depth Sensors','altimeters-depth-sensors','equipment-list/rov-equipment/rov-sensors/altimeters-depth-sensors','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:22:31','2025-06-25 14:22:36','916636e0-96ee-4f22-92c0-abdb48c61f77'),(441,441,1,'Altimeters / Depth Sensors','altimeters-depth-sensors','equipment-list/rov-equipment/rov-sensors/altimeters-depth-sensors','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:22:36','2025-06-25 14:22:36','352398f4-8a18-43c3-9f45-02d2fd98f8b5'),(442,442,1,'Multiplexers (Muxes)','multiplexers-muxes','equipment-list/rov-equipment/rov-sensors/multiplexers-muxes','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:22:36','2025-06-25 14:22:55','daff177d-5da7-4e4f-8883-64d2177801fb'),(443,443,1,'Multiplexers (Muxes)','multiplexers-muxes','equipment-list/rov-equipment/rov-sensors/multiplexers-muxes','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:22:55','2025-06-25 14:22:55','7a500600-cf91-494e-92b9-942439b42e3a'),(444,444,1,'Doppler Velocity Log (DVL)','doppler-velocity-log-dvl','equipment-list/rov-equipment/rov-sensors/doppler-velocity-log-dvl','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:22:56','2025-06-25 14:23:01','e1379245-aaed-47e5-8f7d-119f9dce2deb'),(445,445,1,'Doppler Velocity Log (DVL)','doppler-velocity-log-dvl','equipment-list/rov-equipment/rov-sensors/doppler-velocity-log-dvl','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:23:01','2025-06-25 14:23:01','d6594bbd-6712-41c5-9458-70917d6aee7b'),(446,446,1,'Subsea Gyros','subsea-gyros','equipment-list/rov-equipment/rov-sensors/subsea-gyros','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:23:01','2025-06-25 14:23:08','1fc2191e-1a71-4219-8900-dc2620aa5997'),(447,447,1,'Subsea Gyros','subsea-gyros','equipment-list/rov-equipment/rov-sensors/subsea-gyros','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:23:08','2025-06-25 14:23:08','d9c9d4d5-d5b5-4418-b43b-d2fb3f7e8bdc'),(448,448,1,'Lasers','lasers','equipment-list/rov-equipment/rov-sensors/lasers','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:23:08','2025-06-25 14:23:11','8ea9f8cb-f56f-4139-815c-8ff7bfa5a658'),(449,449,1,'Lasers','lasers','equipment-list/rov-equipment/rov-sensors/lasers','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:23:13','2025-06-25 14:23:13','dbff148a-78a9-4487-bc0b-815cf9a24bc4'),(450,450,1,NULL,'__temp_hduihjcfiftdtbeoufsotfjhisluquvvtzhu','equipment-list/rov-equipment/umbilicals/__temp_hduihjcfiftdtbeoufsotfjhisluquvvtzhu','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:23:13','2025-06-25 14:23:40','ca89d935-6b3f-4fe2-a268-f2dae321f14f'),(453,453,1,'Grabs','grabs','equipment-list/rov-equipment/miscellaneous-vehicles-and-equipment/grabs','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:26:23','2025-06-25 14:26:23','75692981-4a58-4871-8a7c-5182b657b6be'),(454,454,1,'Trenchers','trenchers','equipment-list/rov-equipment/miscellaneous-vehicles-and-equipment/trenchers','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:26:25','2025-06-25 14:26:25','0ed9a27d-7953-49ee-ba4a-c4fb8abf57c0'),(456,456,1,'Micro','micro','equipment-list/rov-equipment/eyeball-inspection-rovs/micro','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productListingPage\"}',1,'2025-06-25 14:48:01','2025-06-25 14:48:01','967cadb7-5584-47d9-a81b-ad2d6315b9ed'),(457,457,1,NULL,'__temp_xyntawzovxbzwrmxeawxntffveespxxhpukr','equipment-list/rov-equipment/eyeball-inspection-rovs/micro/__temp_xyntawzovxbzwrmxeawxntffveespxxhpukr','{\"9a743120-33d4-4879-96fd-896218a7bd14\": \"productIndividualPage\"}',1,'2025-06-26 08:23:24','2025-06-26 08:23:31','a24b838e-60e7-4ea7-a3f2-f785c4925595');
/*!40000 ALTER TABLE `sub41_elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_entries`
--

LOCK TABLES `sub41_entries` WRITE;
/*!40000 ALTER TABLE `sub41_entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_entries` VALUES (1,2,NULL,NULL,NULL,2,'2025-06-20 15:02:00',NULL,'live',NULL,NULL,'2025-06-20 15:02:44','2025-06-20 15:02:44'),(2,2,NULL,NULL,NULL,2,'2025-06-20 15:02:00',NULL,'live',NULL,NULL,'2025-06-20 15:02:44','2025-06-20 15:02:44'),(4,1,NULL,NULL,NULL,2,'2025-06-20 15:05:33',NULL,'live',NULL,NULL,'2025-06-20 15:05:33','2025-06-20 15:05:33'),(11,NULL,NULL,5,7,3,'2025-06-23 08:09:00',NULL,'live',NULL,NULL,'2025-06-20 16:20:37','2025-06-23 08:09:06'),(13,NULL,NULL,5,7,3,'2025-06-23 08:09:00',NULL,'live',NULL,NULL,'2025-06-23 08:09:32','2025-06-23 08:09:32'),(14,NULL,NULL,5,7,3,'2025-06-23 08:09:00',NULL,'live',NULL,NULL,'2025-06-23 08:09:36','2025-06-23 08:09:36'),(15,NULL,NULL,5,7,3,'2025-06-23 08:09:00',NULL,'live',NULL,NULL,'2025-06-23 08:09:39','2025-06-23 08:09:39'),(16,NULL,NULL,5,7,5,'2025-06-23 08:11:00',NULL,'live',NULL,NULL,'2025-06-23 08:09:44','2025-06-23 08:11:09'),(17,NULL,NULL,16,6,4,'2025-06-23 08:11:00',NULL,'live',NULL,NULL,'2025-06-23 08:10:41','2025-06-23 08:11:08'),(18,3,50,NULL,NULL,2,'2025-06-23 08:17:00',NULL,'live',0,0,'2025-06-23 08:17:22','2025-06-23 08:17:34'),(19,3,NULL,NULL,NULL,2,'2025-06-23 08:17:00',NULL,'live',NULL,NULL,'2025-06-23 08:17:34','2025-06-23 08:17:34'),(20,3,50,NULL,NULL,2,'2025-06-23 08:17:00',NULL,'live',0,0,'2025-06-23 08:17:35','2025-06-23 08:17:41'),(21,3,NULL,NULL,NULL,2,'2025-06-23 08:17:00',NULL,'live',NULL,NULL,'2025-06-23 08:17:41','2025-06-23 08:17:41'),(22,3,50,NULL,NULL,2,'2025-06-23 08:17:00',NULL,'live',0,0,'2025-06-23 08:17:50','2025-06-23 08:17:52'),(23,3,NULL,NULL,NULL,2,'2025-06-23 08:17:00',NULL,'live',NULL,NULL,'2025-06-23 08:17:52','2025-06-23 08:17:52'),(24,3,50,NULL,NULL,2,'2025-06-23 08:18:00',NULL,'live',0,0,'2025-06-23 08:17:57','2025-06-23 08:18:03'),(25,3,NULL,NULL,NULL,2,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-23 08:18:03','2025-06-23 08:18:03'),(26,3,50,NULL,NULL,2,'2025-06-23 08:18:00',NULL,'live',0,0,'2025-06-23 08:18:07','2025-06-23 08:18:12'),(27,3,NULL,NULL,NULL,2,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-23 08:18:12','2025-06-23 08:18:12'),(28,3,50,NULL,NULL,2,'2025-06-23 08:18:00',NULL,'live',0,0,'2025-06-23 08:18:14','2025-06-23 08:18:22'),(29,3,NULL,NULL,NULL,2,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-23 08:18:22','2025-06-23 08:18:22'),(30,3,50,NULL,NULL,2,'2025-06-23 08:18:00',NULL,'live',0,0,'2025-06-23 08:18:30','2025-06-23 08:18:33'),(31,3,NULL,NULL,NULL,2,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-23 08:18:33','2025-06-23 08:18:33'),(32,3,NULL,NULL,NULL,2,'2025-06-23 08:18:00',NULL,'live',0,0,'2025-06-23 08:18:47','2025-06-23 08:18:49'),(33,3,NULL,NULL,NULL,2,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-23 08:18:49','2025-06-23 08:18:49'),(34,3,50,NULL,NULL,2,'2025-06-23 08:18:00',NULL,'live',0,0,'2025-06-23 08:18:52','2025-06-23 08:18:58'),(35,3,NULL,NULL,NULL,2,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-23 08:18:58','2025-06-23 08:18:58'),(36,3,50,NULL,NULL,2,'2025-06-23 08:19:00',NULL,'live',0,0,'2025-06-23 08:19:01','2025-06-23 08:19:07'),(37,3,NULL,NULL,NULL,2,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-23 08:19:07','2025-06-23 08:19:07'),(38,3,50,NULL,NULL,2,'2025-06-23 08:19:00',NULL,'live',0,0,'2025-06-23 08:19:07','2025-06-23 08:19:15'),(39,3,NULL,NULL,NULL,2,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-23 08:19:15','2025-06-23 08:19:15'),(40,3,50,NULL,NULL,2,'2025-06-23 08:19:00',NULL,'live',0,0,'2025-06-23 08:19:22','2025-06-23 08:19:24'),(41,3,NULL,NULL,NULL,2,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-23 08:19:24','2025-06-23 08:19:24'),(42,3,50,NULL,NULL,2,'2025-06-23 08:19:00',NULL,'live',0,0,'2025-06-23 08:19:25','2025-06-23 08:19:31'),(43,3,NULL,NULL,NULL,2,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-23 08:19:31','2025-06-23 08:19:31'),(44,3,NULL,NULL,NULL,2,'2025-06-23 08:19:00',NULL,'live',0,0,'2025-06-23 08:19:34','2025-06-23 08:19:40'),(45,3,NULL,NULL,NULL,2,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-23 08:19:40','2025-06-23 08:19:40'),(46,3,NULL,NULL,NULL,2,'2025-06-23 08:19:00',NULL,'live',0,0,'2025-06-23 08:19:42','2025-06-23 08:19:49'),(47,3,NULL,NULL,NULL,2,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-23 08:19:49','2025-06-23 08:19:49'),(48,3,NULL,NULL,NULL,2,'2025-06-23 08:20:00',NULL,'live',0,0,'2025-06-23 08:19:49','2025-06-23 08:20:30'),(49,3,NULL,NULL,NULL,2,'2025-06-23 08:20:00',NULL,'live',NULL,NULL,'2025-06-23 08:20:30','2025-06-23 08:20:30'),(50,3,NULL,NULL,NULL,13,'2025-06-23 08:21:00',NULL,'live',NULL,NULL,'2025-06-23 08:20:32','2025-06-25 11:43:40'),(51,3,NULL,NULL,NULL,2,'2025-06-23 08:21:00',NULL,'live',NULL,NULL,'2025-06-23 08:21:04','2025-06-23 08:21:04'),(52,3,NULL,NULL,NULL,13,'2025-06-23 08:17:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:15','2025-06-25 11:45:15'),(53,3,NULL,NULL,NULL,2,'2025-06-23 08:17:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:15','2025-06-23 08:24:15'),(54,3,NULL,NULL,NULL,13,'2025-06-23 08:17:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:15','2025-06-25 11:45:16'),(55,3,NULL,NULL,NULL,2,'2025-06-23 08:17:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:15','2025-06-23 08:24:15'),(56,3,NULL,NULL,NULL,13,'2025-06-23 08:17:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:15','2025-06-25 11:45:18'),(57,3,NULL,NULL,NULL,2,'2025-06-23 08:17:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:15','2025-06-23 08:24:15'),(58,3,NULL,NULL,NULL,13,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:15','2025-06-25 11:45:20'),(59,3,NULL,NULL,NULL,2,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:15','2025-06-23 08:24:15'),(60,3,NULL,NULL,NULL,13,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:15','2025-06-25 11:45:20'),(61,3,NULL,NULL,NULL,2,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:15','2025-06-23 08:24:15'),(62,3,NULL,NULL,NULL,13,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:15','2025-06-25 11:45:23'),(63,3,NULL,NULL,NULL,2,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:15','2025-06-23 08:24:15'),(64,3,NULL,NULL,NULL,13,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:16','2025-06-25 11:45:23'),(65,3,NULL,NULL,NULL,2,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:16','2025-06-23 08:24:16'),(66,3,NULL,NULL,NULL,13,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:16','2025-06-25 11:45:24'),(67,3,NULL,NULL,NULL,2,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:16','2025-06-23 08:24:16'),(68,3,NULL,NULL,NULL,13,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:16','2025-06-25 11:45:16'),(69,3,NULL,NULL,NULL,2,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:16','2025-06-23 08:24:16'),(70,3,NULL,NULL,NULL,13,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:16','2025-06-25 11:45:17'),(71,3,NULL,NULL,NULL,2,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:16','2025-06-23 08:24:16'),(72,3,NULL,NULL,NULL,13,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:16','2025-06-25 11:45:18'),(73,3,NULL,NULL,NULL,2,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:16','2025-06-23 08:24:16'),(74,3,NULL,NULL,NULL,13,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:16','2025-06-25 11:45:20'),(75,3,NULL,NULL,NULL,2,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:16','2025-06-23 08:24:16'),(76,3,NULL,NULL,NULL,13,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:16','2025-06-25 11:45:20'),(77,3,NULL,NULL,NULL,2,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:16','2025-06-23 08:24:16'),(78,3,NULL,NULL,NULL,13,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:16','2025-06-25 11:45:23'),(79,3,NULL,NULL,NULL,2,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:16','2025-06-23 08:24:16'),(80,3,NULL,NULL,NULL,13,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:16','2025-06-25 11:45:24'),(81,3,NULL,NULL,NULL,2,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:16','2025-06-23 08:24:16'),(82,3,NULL,NULL,NULL,13,'2025-06-23 08:20:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:16','2025-06-25 11:45:12'),(83,3,NULL,NULL,NULL,2,'2025-06-23 08:20:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:16','2025-06-23 08:24:16'),(84,3,NULL,NULL,NULL,13,'2025-06-23 08:21:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:16','2025-06-25 11:47:02'),(85,3,NULL,NULL,NULL,2,'2025-06-23 08:21:00',NULL,'live',NULL,NULL,'2025-06-23 08:24:16','2025-06-23 08:24:16'),(87,3,NULL,NULL,NULL,2,'2025-06-23 08:21:00',NULL,'live',NULL,NULL,'2025-06-23 08:25:10','2025-06-23 08:25:10'),(88,3,NULL,NULL,NULL,13,'2025-06-23 08:26:00',NULL,'live',NULL,NULL,'2025-06-23 08:25:42','2025-06-25 11:47:03'),(89,3,NULL,NULL,NULL,2,'2025-06-23 08:26:00',NULL,'live',NULL,NULL,'2025-06-23 08:26:31','2025-06-23 08:26:31'),(90,3,NULL,NULL,NULL,13,'2025-06-23 08:26:00',NULL,'live',NULL,NULL,'2025-06-23 08:26:31','2025-06-25 11:47:05'),(91,3,NULL,NULL,NULL,2,'2025-06-23 08:26:00',NULL,'live',NULL,NULL,'2025-06-23 08:26:35','2025-06-23 08:26:35'),(92,3,NULL,NULL,NULL,13,'2025-06-23 08:26:00',NULL,'live',NULL,NULL,'2025-06-23 08:26:35','2025-06-25 11:47:06'),(93,3,NULL,NULL,NULL,2,'2025-06-23 08:26:00',NULL,'live',NULL,NULL,'2025-06-23 08:26:44','2025-06-23 08:26:44'),(94,3,NULL,NULL,NULL,13,'2025-06-23 08:26:00',NULL,'live',NULL,NULL,'2025-06-23 08:26:44','2025-06-25 11:47:07'),(95,3,NULL,NULL,NULL,2,'2025-06-23 08:26:00',NULL,'live',NULL,NULL,'2025-06-23 08:26:55','2025-06-23 08:26:55'),(96,3,NULL,NULL,NULL,13,'2025-06-23 08:27:00',NULL,'live',NULL,NULL,'2025-06-23 08:26:55','2025-06-25 11:47:09'),(97,3,NULL,NULL,NULL,2,'2025-06-23 08:27:00',NULL,'live',NULL,NULL,'2025-06-23 08:27:24','2025-06-23 08:27:24'),(98,3,NULL,NULL,NULL,13,'2025-06-23 08:27:00',NULL,'live',NULL,NULL,'2025-06-23 08:27:24','2025-06-25 11:47:09'),(99,3,NULL,NULL,NULL,2,'2025-06-23 08:27:00',NULL,'live',NULL,NULL,'2025-06-23 08:27:31','2025-06-23 08:27:31'),(100,3,NULL,NULL,NULL,13,'2025-06-23 08:27:00',NULL,'live',NULL,NULL,'2025-06-23 08:27:31','2025-06-25 11:47:09'),(101,3,NULL,NULL,NULL,2,'2025-06-23 08:27:00',NULL,'live',NULL,NULL,'2025-06-23 08:27:35','2025-06-23 08:27:35'),(102,3,NULL,NULL,NULL,13,'2025-06-23 08:30:00',NULL,'live',NULL,NULL,'2025-06-23 08:27:35','2025-06-25 11:47:04'),(103,3,NULL,NULL,NULL,2,'2025-06-23 08:30:00',NULL,'live',NULL,NULL,'2025-06-23 08:30:24','2025-06-23 08:30:24'),(104,3,NULL,NULL,NULL,13,'2025-06-23 08:30:00',NULL,'live',NULL,NULL,'2025-06-23 08:30:24','2025-06-25 11:47:05'),(105,3,NULL,NULL,NULL,2,'2025-06-23 08:30:00',NULL,'live',NULL,NULL,'2025-06-23 08:30:32','2025-06-23 08:30:32'),(106,3,NULL,NULL,NULL,13,'2025-06-23 08:30:00',NULL,'live',NULL,NULL,'2025-06-23 08:30:32','2025-06-25 11:47:06'),(107,3,NULL,NULL,NULL,2,'2025-06-23 08:30:00',NULL,'live',NULL,NULL,'2025-06-23 08:30:42','2025-06-23 08:30:42'),(108,3,NULL,NULL,NULL,13,'2025-06-23 08:30:00',NULL,'live',NULL,NULL,'2025-06-23 08:30:42','2025-06-25 11:47:07'),(109,3,NULL,NULL,NULL,2,'2025-06-23 08:30:00',NULL,'live',NULL,NULL,'2025-06-23 08:30:51','2025-06-23 08:30:51'),(110,3,NULL,NULL,NULL,13,'2025-06-23 08:31:00',NULL,'live',NULL,NULL,'2025-06-23 08:30:51','2025-06-25 11:47:09'),(111,3,NULL,NULL,NULL,2,'2025-06-23 08:31:00',NULL,'live',NULL,NULL,'2025-06-23 08:31:00','2025-06-23 08:31:00'),(112,3,NULL,NULL,NULL,13,'2025-06-23 08:31:00',NULL,'live',NULL,NULL,'2025-06-23 08:31:00','2025-06-25 11:47:09'),(113,3,NULL,NULL,NULL,2,'2025-06-23 08:31:00',NULL,'live',NULL,NULL,'2025-06-23 08:31:08','2025-06-23 08:31:08'),(114,3,84,NULL,NULL,2,NULL,NULL,'pending',0,0,'2025-06-23 08:31:08','2025-06-23 08:31:08'),(115,3,NULL,NULL,NULL,2,'2025-06-23 08:17:00',NULL,'live',NULL,NULL,'2025-06-23 08:32:44','2025-06-23 08:32:44'),(116,3,NULL,NULL,NULL,2,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-23 08:32:44','2025-06-23 08:32:44'),(117,3,NULL,NULL,NULL,2,'2025-06-23 08:17:00',NULL,'live',NULL,NULL,'2025-06-23 08:32:44','2025-06-23 08:32:44'),(118,3,NULL,NULL,NULL,2,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-23 08:32:44','2025-06-23 08:32:44'),(119,3,NULL,NULL,NULL,2,'2025-06-23 08:17:00',NULL,'live',NULL,NULL,'2025-06-23 08:32:44','2025-06-23 08:32:44'),(120,3,NULL,NULL,NULL,2,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-23 08:32:44','2025-06-23 08:32:44'),(121,3,NULL,NULL,NULL,2,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-23 08:32:44','2025-06-23 08:32:44'),(122,3,NULL,NULL,NULL,2,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-23 08:32:44','2025-06-23 08:32:44'),(123,3,NULL,NULL,NULL,2,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-23 08:32:44','2025-06-23 08:32:44'),(124,3,NULL,NULL,NULL,2,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-23 08:32:44','2025-06-23 08:32:44'),(125,3,NULL,NULL,NULL,2,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-23 08:32:44','2025-06-23 08:32:44'),(126,3,NULL,NULL,NULL,2,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-23 08:32:44','2025-06-23 08:32:44'),(127,3,NULL,NULL,NULL,2,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-23 08:32:44','2025-06-23 08:32:44'),(128,3,NULL,NULL,NULL,2,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-23 08:32:44','2025-06-23 08:32:44'),(129,3,NULL,NULL,NULL,2,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-23 08:32:44','2025-06-23 08:32:44'),(130,3,NULL,NULL,NULL,2,'2025-06-23 08:20:00',NULL,'live',NULL,NULL,'2025-06-23 08:32:44','2025-06-23 08:32:44'),(131,3,NULL,NULL,NULL,2,'2025-06-23 08:21:00',NULL,'live',NULL,NULL,'2025-06-23 08:32:44','2025-06-23 08:32:44'),(132,3,NULL,NULL,NULL,13,'2025-06-23 08:37:00',NULL,'live',NULL,NULL,'2025-06-23 08:37:10','2025-06-25 11:47:10'),(133,3,NULL,NULL,NULL,2,'2025-06-23 08:37:00',NULL,'live',NULL,NULL,'2025-06-23 08:37:44','2025-06-23 08:37:44'),(134,3,90,NULL,NULL,2,'2025-06-23 08:48:00',NULL,'live',0,0,'2025-06-23 08:48:33','2025-06-23 08:48:48'),(135,3,NULL,NULL,NULL,2,'2025-06-23 08:48:00',NULL,'live',NULL,NULL,'2025-06-23 08:48:48','2025-06-23 08:48:48'),(137,3,NULL,NULL,NULL,2,'2025-06-23 08:20:00',NULL,'live',NULL,NULL,'2025-06-23 08:50:11','2025-06-23 08:50:11'),(138,3,NULL,NULL,NULL,2,'2025-06-23 08:20:00',NULL,'live',NULL,NULL,'2025-06-23 08:50:36','2025-06-23 08:50:36'),(139,1,NULL,NULL,NULL,2,'2025-06-23 10:17:00',NULL,'live',0,0,'2025-06-23 10:16:52','2025-06-23 10:17:06'),(140,NULL,NULL,139,1,1,NULL,NULL,'pending',NULL,NULL,'2025-06-23 10:17:00','2025-06-23 10:17:00'),(141,1,NULL,NULL,NULL,2,'2025-06-23 10:17:00',NULL,'live',NULL,NULL,'2025-06-23 10:17:06','2025-06-23 10:17:06'),(142,1,NULL,NULL,NULL,2,'2025-06-23 10:17:00',NULL,'live',NULL,NULL,'2025-06-23 10:17:10','2025-06-23 10:17:19'),(143,1,NULL,NULL,NULL,2,'2025-06-23 10:17:00',NULL,'live',NULL,NULL,'2025-06-23 10:17:19','2025-06-23 10:17:19'),(144,1,NULL,NULL,NULL,2,'2025-06-23 10:17:00',NULL,'live',NULL,NULL,'2025-06-23 10:17:21','2025-06-23 10:17:35'),(145,1,NULL,NULL,NULL,2,'2025-06-23 10:17:00',NULL,'live',NULL,NULL,'2025-06-23 10:17:35','2025-06-23 10:17:35'),(146,1,NULL,NULL,NULL,2,'2025-06-23 10:17:00',NULL,'live',NULL,NULL,'2025-06-23 10:17:36','2025-06-23 10:17:46'),(147,1,NULL,NULL,NULL,2,'2025-06-23 10:17:00',NULL,'live',NULL,NULL,'2025-06-23 10:17:46','2025-06-23 10:17:46'),(148,1,NULL,NULL,NULL,2,'2025-06-23 10:17:00',NULL,'live',NULL,NULL,'2025-06-23 10:17:46','2025-06-23 10:17:52'),(149,1,NULL,NULL,NULL,2,'2025-06-23 10:17:00',NULL,'live',NULL,NULL,'2025-06-23 10:17:53','2025-06-23 10:17:53'),(157,NULL,NULL,16,6,4,'2025-06-23 10:21:00',NULL,'live',NULL,NULL,'2025-06-23 10:21:29','2025-06-23 10:21:29'),(167,NULL,NULL,1,1,1,'2025-06-24 10:04:00',NULL,'live',NULL,NULL,'2025-06-24 10:04:35','2025-06-24 10:04:35'),(168,2,NULL,NULL,NULL,2,'2025-06-20 15:02:00',NULL,'live',NULL,NULL,'2025-06-24 10:04:36','2025-06-24 10:04:36'),(169,NULL,NULL,168,1,1,'2025-06-24 10:04:00',NULL,'live',NULL,NULL,'2025-06-24 10:04:36','2025-06-24 10:04:36'),(173,NULL,NULL,1,1,1,'2025-06-24 10:04:00',NULL,'live',NULL,NULL,'2025-06-24 10:53:57','2025-06-24 10:53:57'),(174,2,NULL,NULL,NULL,2,'2025-06-20 15:02:00',NULL,'live',NULL,NULL,'2025-06-24 10:53:57','2025-06-24 10:53:57'),(186,NULL,NULL,1,1,7,'2025-06-24 11:10:00',NULL,'live',NULL,NULL,'2025-06-24 11:10:10','2025-06-24 11:10:10'),(187,NULL,NULL,186,10,6,'2025-06-24 10:54:00',NULL,'live',NULL,NULL,'2025-06-24 11:10:10','2025-06-24 11:10:10'),(188,NULL,NULL,186,10,6,'2025-06-24 10:54:00',NULL,'live',NULL,NULL,'2025-06-24 11:10:10','2025-06-24 11:10:10'),(189,NULL,NULL,1,1,7,'2025-06-24 11:10:00',NULL,'live',NULL,NULL,'2025-06-24 11:10:10','2025-06-24 11:10:10'),(190,NULL,NULL,189,10,6,'2025-06-24 10:54:00',NULL,'live',NULL,NULL,'2025-06-24 11:10:10','2025-06-24 11:10:10'),(191,NULL,NULL,189,10,6,'2025-06-24 10:54:00',NULL,'live',NULL,NULL,'2025-06-24 11:10:10','2025-06-24 11:10:10'),(192,2,NULL,NULL,NULL,2,'2025-06-20 15:02:00',NULL,'live',NULL,NULL,'2025-06-24 11:10:10','2025-06-24 11:10:10'),(193,3,NULL,NULL,NULL,13,'2025-06-24 13:00:00',NULL,'live',NULL,NULL,'2025-06-24 13:00:45','2025-06-25 11:43:50'),(194,3,NULL,NULL,NULL,2,'2025-06-24 13:00:00',NULL,'live',NULL,NULL,'2025-06-24 13:00:53','2025-06-24 13:00:53'),(195,1,NULL,NULL,NULL,2,'2025-06-24 13:01:27',NULL,'live',NULL,NULL,'2025-06-24 13:01:27','2025-06-24 13:01:27'),(197,2,NULL,NULL,NULL,2,'2025-06-20 15:02:00',NULL,'live',NULL,NULL,'2025-06-24 14:20:53','2025-06-24 14:20:53'),(201,NULL,NULL,1,1,7,'2025-06-24 11:10:00',NULL,'live',NULL,NULL,'2025-06-24 14:55:14','2025-06-24 14:55:14'),(202,2,NULL,NULL,NULL,2,'2025-06-20 15:02:00',NULL,'live',NULL,NULL,'2025-06-24 14:55:15','2025-06-24 14:55:15'),(211,NULL,NULL,1,1,9,'2025-06-24 15:25:00',NULL,'live',NULL,NULL,'2025-06-24 15:25:47','2025-06-24 15:25:47'),(212,NULL,NULL,211,12,8,'2025-06-24 14:55:00',NULL,'live',NULL,NULL,'2025-06-24 15:25:47','2025-06-24 15:25:47'),(213,NULL,NULL,211,12,8,'2025-06-24 14:55:00',NULL,'live',NULL,NULL,'2025-06-24 15:25:47','2025-06-24 15:25:47'),(214,NULL,NULL,1,1,9,'2025-06-24 15:25:00',NULL,'live',NULL,NULL,'2025-06-24 15:25:47','2025-06-24 15:25:47'),(215,NULL,NULL,214,12,8,'2025-06-24 14:55:00',NULL,'live',NULL,NULL,'2025-06-24 15:25:47','2025-06-24 15:25:47'),(216,NULL,NULL,214,12,8,'2025-06-24 14:55:00',NULL,'live',NULL,NULL,'2025-06-24 15:25:47','2025-06-24 15:25:47'),(217,2,NULL,NULL,NULL,2,'2025-06-20 15:02:00',NULL,'live',NULL,NULL,'2025-06-24 15:25:47','2025-06-24 15:25:47'),(224,NULL,NULL,1,1,9,'2025-06-24 15:25:00',NULL,'live',NULL,NULL,'2025-06-24 15:28:00','2025-06-24 15:28:00'),(225,NULL,NULL,224,12,8,'2025-06-24 14:55:00',NULL,'live',NULL,NULL,'2025-06-24 15:28:00','2025-06-24 15:28:00'),(226,2,NULL,NULL,NULL,2,'2025-06-20 15:02:00',NULL,'live',NULL,NULL,'2025-06-24 15:28:00','2025-06-24 15:28:00'),(234,NULL,NULL,1,1,9,'2025-06-24 15:25:00',NULL,'live',NULL,NULL,'2025-06-24 15:31:09','2025-06-24 15:31:09'),(235,NULL,NULL,234,12,8,'2025-06-24 14:55:00',NULL,'live',NULL,NULL,'2025-06-24 15:31:09','2025-06-24 15:31:09'),(236,NULL,NULL,234,12,8,'2025-06-24 14:55:00',NULL,'live',NULL,NULL,'2025-06-24 15:31:09','2025-06-24 15:31:09'),(237,2,NULL,NULL,NULL,2,'2025-06-20 15:02:00',NULL,'live',NULL,NULL,'2025-06-24 15:31:09','2025-06-24 15:31:09'),(243,NULL,NULL,1,1,9,'2025-06-24 15:25:00',NULL,'live',NULL,NULL,'2025-06-24 16:01:12','2025-06-24 16:01:12'),(244,NULL,NULL,243,12,8,'2025-06-24 14:55:00',NULL,'live',NULL,NULL,'2025-06-24 16:01:12','2025-06-24 16:01:12'),(245,2,NULL,NULL,NULL,2,'2025-06-20 15:02:00',NULL,'live',NULL,NULL,'2025-06-24 16:01:12','2025-06-24 16:01:12'),(249,NULL,NULL,1,1,10,'2025-06-25 09:15:00',NULL,'live',NULL,NULL,'2025-06-25 09:15:33','2025-06-25 09:15:33'),(250,NULL,NULL,1,1,10,'2025-06-25 09:15:00',NULL,'live',NULL,NULL,'2025-06-25 09:15:33','2025-06-25 09:15:33'),(251,2,NULL,NULL,NULL,2,'2025-06-20 15:02:00',NULL,'live',NULL,NULL,'2025-06-25 09:15:33','2025-06-25 09:15:33'),(253,1,NULL,NULL,NULL,2,'2025-06-25 10:32:00',NULL,'live',NULL,NULL,'2025-06-25 10:31:58','2025-06-25 10:32:04'),(254,1,NULL,NULL,NULL,2,'2025-06-25 10:32:00',NULL,'live',NULL,NULL,'2025-06-25 10:32:04','2025-06-25 10:32:04'),(255,1,NULL,NULL,NULL,2,'2025-06-25 10:32:00',NULL,'live',NULL,NULL,'2025-06-25 10:32:06','2025-06-25 10:32:18'),(256,1,NULL,NULL,NULL,2,'2025-06-25 10:32:00',NULL,'live',NULL,NULL,'2025-06-25 10:32:18','2025-06-25 10:32:18'),(259,3,NULL,NULL,NULL,13,'2025-06-23 08:21:00',NULL,'live',NULL,NULL,'2025-06-25 11:43:40','2025-06-25 11:43:40'),(261,3,NULL,NULL,NULL,13,'2025-06-24 13:00:00',NULL,'live',NULL,NULL,'2025-06-25 11:43:50','2025-06-25 11:43:50'),(278,3,NULL,NULL,NULL,13,'2025-06-23 08:20:00',NULL,'live',NULL,NULL,'2025-06-25 11:45:12','2025-06-25 11:45:12'),(279,3,NULL,NULL,NULL,13,'2025-06-23 08:17:00',NULL,'live',NULL,NULL,'2025-06-25 11:45:15','2025-06-25 11:45:15'),(280,3,NULL,NULL,NULL,13,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-25 11:45:16','2025-06-25 11:45:16'),(281,3,NULL,NULL,NULL,13,'2025-06-23 08:17:00',NULL,'live',NULL,NULL,'2025-06-25 11:45:16','2025-06-25 11:45:16'),(282,3,NULL,NULL,NULL,13,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-25 11:45:17','2025-06-25 11:45:17'),(283,3,NULL,NULL,NULL,13,'2025-06-23 08:17:00',NULL,'live',NULL,NULL,'2025-06-25 11:45:18','2025-06-25 11:45:18'),(284,3,NULL,NULL,NULL,13,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-25 11:45:18','2025-06-25 11:45:18'),(285,3,NULL,NULL,NULL,13,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-25 11:45:20','2025-06-25 11:45:20'),(286,3,NULL,NULL,NULL,13,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-25 11:45:20','2025-06-25 11:45:20'),(287,3,NULL,NULL,NULL,13,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-25 11:45:20','2025-06-25 11:45:20'),(288,3,NULL,NULL,NULL,13,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-25 11:45:20','2025-06-25 11:45:20'),(289,3,NULL,NULL,NULL,13,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-25 11:45:23','2025-06-25 11:45:23'),(290,3,NULL,NULL,NULL,13,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-25 11:45:23','2025-06-25 11:45:23'),(291,3,NULL,NULL,NULL,13,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-25 11:45:23','2025-06-25 11:45:23'),(292,3,NULL,NULL,NULL,13,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-25 11:45:24','2025-06-25 11:45:24'),(293,3,NULL,NULL,NULL,13,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-25 11:45:24','2025-06-25 11:45:24'),(294,3,NULL,NULL,NULL,13,'2025-06-25 11:45:25',NULL,'live',NULL,NULL,'2025-06-25 11:45:25','2025-06-25 11:45:25'),(295,3,NULL,NULL,NULL,13,'2025-06-23 08:20:00',NULL,'live',NULL,NULL,'2025-06-25 11:46:04','2025-06-25 11:46:04'),(311,3,NULL,NULL,NULL,13,'2025-06-23 08:21:00',NULL,'live',NULL,NULL,'2025-06-25 11:47:02','2025-06-25 11:47:02'),(312,3,NULL,NULL,NULL,13,'2025-06-23 08:26:00',NULL,'live',NULL,NULL,'2025-06-25 11:47:04','2025-06-25 11:47:04'),(313,3,NULL,NULL,NULL,13,'2025-06-23 08:30:00',NULL,'live',NULL,NULL,'2025-06-25 11:47:04','2025-06-25 11:47:04'),(314,3,NULL,NULL,NULL,13,'2025-06-23 08:26:00',NULL,'live',NULL,NULL,'2025-06-25 11:47:05','2025-06-25 11:47:05'),(315,3,NULL,NULL,NULL,13,'2025-06-23 08:30:00',NULL,'live',NULL,NULL,'2025-06-25 11:47:05','2025-06-25 11:47:05'),(316,3,NULL,NULL,NULL,13,'2025-06-23 08:26:00',NULL,'live',NULL,NULL,'2025-06-25 11:47:06','2025-06-25 11:47:06'),(317,3,NULL,NULL,NULL,13,'2025-06-23 08:30:00',NULL,'live',NULL,NULL,'2025-06-25 11:47:06','2025-06-25 11:47:06'),(318,3,NULL,NULL,NULL,13,'2025-06-23 08:26:00',NULL,'live',NULL,NULL,'2025-06-25 11:47:07','2025-06-25 11:47:07'),(319,3,NULL,NULL,NULL,13,'2025-06-23 08:30:00',NULL,'live',NULL,NULL,'2025-06-25 11:47:07','2025-06-25 11:47:07'),(320,3,NULL,NULL,NULL,13,'2025-06-23 08:27:00',NULL,'live',NULL,NULL,'2025-06-25 11:47:09','2025-06-25 11:47:09'),(321,3,NULL,NULL,NULL,13,'2025-06-23 08:31:00',NULL,'live',NULL,NULL,'2025-06-25 11:47:09','2025-06-25 11:47:09'),(322,3,NULL,NULL,NULL,13,'2025-06-23 08:27:00',NULL,'live',NULL,NULL,'2025-06-25 11:47:09','2025-06-25 11:47:09'),(323,3,NULL,NULL,NULL,13,'2025-06-23 08:31:00',NULL,'live',NULL,NULL,'2025-06-25 11:47:09','2025-06-25 11:47:09'),(324,3,NULL,NULL,NULL,13,'2025-06-23 08:27:00',NULL,'live',NULL,NULL,'2025-06-25 11:47:09','2025-06-25 11:47:09'),(325,3,NULL,NULL,NULL,13,'2025-06-23 08:37:00',NULL,'live',NULL,NULL,'2025-06-25 11:47:10','2025-06-25 11:47:10'),(326,3,NULL,NULL,NULL,13,'2025-06-23 08:27:00',NULL,'live',NULL,NULL,'2025-06-25 11:47:20','2025-06-25 11:47:20'),(327,3,NULL,NULL,NULL,13,'2025-06-23 08:31:00',NULL,'live',NULL,NULL,'2025-06-25 11:47:21','2025-06-25 11:47:21'),(328,3,NULL,NULL,NULL,13,'2025-06-23 08:27:00',NULL,'live',NULL,NULL,'2025-06-25 11:47:21','2025-06-25 11:47:21'),(329,3,NULL,NULL,NULL,13,'2025-06-23 08:31:00',NULL,'live',NULL,NULL,'2025-06-25 11:47:23','2025-06-25 11:47:23'),(330,3,NULL,NULL,NULL,13,'2025-06-23 08:27:00',NULL,'live',NULL,NULL,'2025-06-25 11:47:26','2025-06-25 11:47:26'),(331,3,NULL,NULL,NULL,13,'2025-06-23 08:37:00',NULL,'live',NULL,NULL,'2025-06-25 11:47:28','2025-06-25 11:47:28'),(335,NULL,NULL,50,1,11,'2025-06-25 13:17:00',NULL,'live',NULL,NULL,'2025-06-25 13:17:41','2025-06-25 13:17:41'),(336,NULL,NULL,50,1,11,'2025-06-25 13:17:00',NULL,'live',NULL,NULL,'2025-06-25 13:17:41','2025-06-25 13:17:41'),(337,3,NULL,NULL,NULL,13,'2025-06-23 08:21:00',NULL,'live',NULL,NULL,'2025-06-25 13:17:41','2025-06-25 13:17:41'),(338,3,NULL,NULL,NULL,13,'2025-06-25 13:19:13',NULL,'live',NULL,NULL,'2025-06-25 13:19:13','2025-06-25 13:19:13'),(339,3,NULL,NULL,NULL,13,'2025-06-25 13:25:26',NULL,'live',NULL,NULL,'2025-06-25 13:25:26','2025-06-25 13:25:26'),(357,3,NULL,NULL,NULL,13,'2025-06-23 08:17:00',NULL,'live',NULL,NULL,'2025-06-25 13:32:11','2025-06-25 13:32:11'),(364,3,NULL,NULL,NULL,13,'2025-06-23 08:17:00',NULL,'live',NULL,NULL,'2025-06-25 13:38:52','2025-06-25 13:38:52'),(365,3,NULL,NULL,NULL,13,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-25 13:38:53','2025-06-25 13:38:53'),(366,3,NULL,NULL,NULL,13,'2025-06-23 08:17:00',NULL,'live',NULL,NULL,'2025-06-25 13:38:53','2025-06-25 13:38:53'),(367,3,NULL,NULL,NULL,13,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-25 13:38:54','2025-06-25 13:38:54'),(370,3,NULL,NULL,NULL,13,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-25 13:39:09','2025-06-25 13:39:09'),(373,3,NULL,NULL,NULL,13,'2025-06-23 08:17:00',NULL,'live',NULL,NULL,'2025-06-25 13:39:21','2025-06-25 13:39:21'),(374,3,NULL,NULL,NULL,13,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-25 13:39:23','2025-06-25 13:39:23'),(375,3,NULL,NULL,NULL,13,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-25 13:39:24','2025-06-25 13:39:24'),(377,3,NULL,NULL,NULL,13,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-25 13:39:27','2025-06-25 13:39:27'),(379,3,NULL,NULL,NULL,13,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-25 13:39:31','2025-06-25 13:39:31'),(383,3,NULL,NULL,NULL,13,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-25 13:39:43','2025-06-25 13:39:43'),(384,3,NULL,NULL,NULL,13,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-25 13:39:44','2025-06-25 13:39:44'),(385,3,NULL,NULL,NULL,13,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-25 13:39:46','2025-06-25 13:39:46'),(386,3,NULL,NULL,NULL,13,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-25 13:39:46','2025-06-25 13:39:46'),(387,3,NULL,NULL,NULL,13,'2025-06-23 08:18:00',NULL,'live',NULL,NULL,'2025-06-25 13:39:48','2025-06-25 13:39:48'),(388,3,NULL,NULL,NULL,13,'2025-06-23 08:20:00',NULL,'live',NULL,NULL,'2025-06-25 13:39:48','2025-06-25 13:39:48'),(389,3,NULL,NULL,NULL,13,'2025-06-23 08:19:00',NULL,'live',NULL,NULL,'2025-06-25 13:39:54','2025-06-25 13:39:54'),(390,3,NULL,NULL,NULL,13,'2025-06-25 14:00:00',NULL,'live',NULL,NULL,'2025-06-25 14:00:16','2025-06-25 14:00:43'),(391,3,NULL,NULL,NULL,13,'2025-06-25 14:00:00',NULL,'live',NULL,NULL,'2025-06-25 14:00:43','2025-06-25 14:00:43'),(392,3,NULL,NULL,NULL,13,'2025-06-25 14:00:00',NULL,'live',NULL,NULL,'2025-06-25 14:15:58','2025-06-25 14:15:58'),(393,3,NULL,NULL,NULL,13,'2025-06-25 14:00:00',NULL,'live',NULL,NULL,'2025-06-25 14:15:58','2025-06-25 14:15:58'),(394,3,NULL,NULL,NULL,13,'2025-06-25 14:00:00',NULL,'live',NULL,NULL,'2025-06-25 14:16:05','2025-06-25 14:16:05'),(395,3,NULL,NULL,NULL,13,'2025-06-25 14:00:00',NULL,'live',NULL,NULL,'2025-06-25 14:16:05','2025-06-25 14:16:05'),(396,3,NULL,NULL,NULL,13,'2025-06-25 14:00:00',NULL,'live',NULL,NULL,'2025-06-25 14:16:29','2025-06-25 14:16:29'),(397,3,NULL,NULL,NULL,13,'2025-06-25 14:00:00',NULL,'live',NULL,NULL,'2025-06-25 14:16:29','2025-06-25 14:16:29'),(399,3,NULL,NULL,NULL,13,'2025-06-25 14:00:00',NULL,'live',NULL,NULL,'2025-06-25 14:16:39','2025-06-25 14:16:39'),(401,3,NULL,NULL,NULL,13,'2025-06-25 14:00:00',NULL,'live',NULL,NULL,'2025-06-25 14:16:46','2025-06-25 14:16:46'),(402,3,NULL,NULL,NULL,13,'2025-06-25 14:17:00',NULL,'live',NULL,NULL,'2025-06-25 14:17:01','2025-06-25 14:17:22'),(403,3,NULL,NULL,NULL,13,'2025-06-25 14:17:00',NULL,'live',NULL,NULL,'2025-06-25 14:17:23','2025-06-25 14:17:23'),(404,3,NULL,NULL,NULL,13,'2025-06-25 14:17:00',NULL,'live',NULL,NULL,'2025-06-25 14:17:23','2025-06-25 14:17:31'),(405,3,NULL,NULL,NULL,13,'2025-06-25 14:17:00',NULL,'live',NULL,NULL,'2025-06-25 14:17:31','2025-06-25 14:17:31'),(406,3,NULL,NULL,NULL,13,'2025-06-25 14:17:00',NULL,'live',NULL,NULL,'2025-06-25 14:17:31','2025-06-25 14:17:44'),(407,3,NULL,NULL,NULL,13,'2025-06-25 14:17:00',NULL,'live',NULL,NULL,'2025-06-25 14:17:44','2025-06-25 14:17:44'),(408,3,NULL,NULL,NULL,13,'2025-06-25 14:17:00',NULL,'live',NULL,NULL,'2025-06-25 14:17:44','2025-06-25 14:17:58'),(409,3,NULL,NULL,NULL,13,'2025-06-25 14:17:00',NULL,'live',NULL,NULL,'2025-06-25 14:17:58','2025-06-25 14:17:58'),(410,3,NULL,NULL,NULL,13,'2025-06-25 14:18:00',NULL,'live',NULL,NULL,'2025-06-25 14:17:58','2025-06-25 14:18:19'),(411,3,NULL,NULL,NULL,13,'2025-06-25 14:18:00',NULL,'live',NULL,NULL,'2025-06-25 14:18:19','2025-06-25 14:18:19'),(412,3,NULL,NULL,NULL,13,'2025-06-25 14:18:00',NULL,'live',NULL,NULL,'2025-06-25 14:18:19','2025-06-25 14:18:28'),(413,3,NULL,NULL,NULL,13,'2025-06-25 14:18:00',NULL,'live',NULL,NULL,'2025-06-25 14:18:28','2025-06-25 14:18:28'),(414,3,NULL,NULL,NULL,13,'2025-06-25 14:18:00',NULL,'live',NULL,NULL,'2025-06-25 14:18:28','2025-06-25 14:18:39'),(415,3,NULL,NULL,NULL,13,'2025-06-25 14:18:00',NULL,'live',NULL,NULL,'2025-06-25 14:18:39','2025-06-25 14:18:39'),(416,3,NULL,NULL,NULL,13,'2025-06-25 14:18:00',NULL,'live',NULL,NULL,'2025-06-25 14:18:39','2025-06-25 14:18:54'),(417,3,NULL,NULL,NULL,13,'2025-06-25 14:18:00',NULL,'live',NULL,NULL,'2025-06-25 14:18:54','2025-06-25 14:18:54'),(418,3,NULL,NULL,NULL,13,'2025-06-25 14:18:00',NULL,'live',NULL,NULL,'2025-06-25 14:18:54','2025-06-25 14:18:57'),(419,3,NULL,NULL,NULL,13,'2025-06-25 14:18:00',NULL,'live',NULL,NULL,'2025-06-25 14:18:58','2025-06-25 14:18:58'),(420,3,NULL,NULL,NULL,13,'2025-06-25 14:19:00',NULL,'live',NULL,NULL,'2025-06-25 14:18:58','2025-06-25 14:19:22'),(421,3,NULL,NULL,NULL,13,'2025-06-25 14:19:00',NULL,'live',NULL,NULL,'2025-06-25 14:19:22','2025-06-25 14:19:22'),(422,3,NULL,NULL,NULL,13,'2025-06-25 14:19:00',NULL,'live',NULL,NULL,'2025-06-25 14:19:22','2025-06-25 14:19:29'),(423,3,NULL,NULL,NULL,13,'2025-06-25 14:19:00',NULL,'live',NULL,NULL,'2025-06-25 14:19:29','2025-06-25 14:19:29'),(424,3,NULL,NULL,NULL,13,'2025-06-25 14:20:00',NULL,'live',NULL,NULL,'2025-06-25 14:19:29','2025-06-25 14:20:31'),(425,3,NULL,NULL,NULL,13,'2025-06-25 14:20:00',NULL,'live',NULL,NULL,'2025-06-25 14:20:31','2025-06-25 14:20:31'),(426,3,NULL,NULL,NULL,13,'2025-06-25 14:20:00',NULL,'live',NULL,NULL,'2025-06-25 14:20:31','2025-06-25 14:20:34'),(427,3,NULL,NULL,NULL,13,'2025-06-25 14:20:00',NULL,'live',NULL,NULL,'2025-06-25 14:20:34','2025-06-25 14:20:34'),(428,3,NULL,NULL,NULL,13,'2025-06-25 14:20:00',NULL,'live',NULL,NULL,'2025-06-25 14:20:34','2025-06-25 14:20:39'),(429,3,NULL,NULL,NULL,13,'2025-06-25 14:20:00',NULL,'live',NULL,NULL,'2025-06-25 14:20:39','2025-06-25 14:20:39'),(430,3,NULL,NULL,NULL,13,'2025-06-25 14:20:00',NULL,'live',NULL,NULL,'2025-06-25 14:20:39','2025-06-25 14:20:43'),(431,3,NULL,NULL,NULL,13,'2025-06-25 14:20:00',NULL,'live',NULL,NULL,'2025-06-25 14:20:43','2025-06-25 14:20:43'),(432,3,NULL,NULL,NULL,13,'2025-06-25 14:20:00',NULL,'live',NULL,NULL,'2025-06-25 14:20:43','2025-06-25 14:20:50'),(433,3,NULL,NULL,NULL,13,'2025-06-25 14:20:00',NULL,'live',NULL,NULL,'2025-06-25 14:20:50','2025-06-25 14:20:50'),(434,3,NULL,NULL,NULL,13,'2025-06-25 14:21:00',NULL,'live',NULL,NULL,'2025-06-25 14:20:50','2025-06-25 14:21:13'),(435,3,NULL,NULL,NULL,13,'2025-06-25 14:21:00',NULL,'live',NULL,NULL,'2025-06-25 14:21:13','2025-06-25 14:21:13'),(436,3,NULL,NULL,NULL,13,'2025-06-25 14:21:00',NULL,'live',NULL,NULL,'2025-06-25 14:21:13','2025-06-25 14:21:18'),(437,3,NULL,NULL,NULL,13,'2025-06-25 14:21:00',NULL,'live',NULL,NULL,'2025-06-25 14:21:18','2025-06-25 14:21:18'),(438,3,NULL,NULL,NULL,13,'2025-06-25 14:22:00',NULL,'live',NULL,NULL,'2025-06-25 14:21:18','2025-06-25 14:22:31'),(439,3,NULL,NULL,NULL,13,'2025-06-25 14:22:00',NULL,'live',NULL,NULL,'2025-06-25 14:22:31','2025-06-25 14:22:31'),(440,3,NULL,NULL,NULL,13,'2025-06-25 14:22:00',NULL,'live',NULL,NULL,'2025-06-25 14:22:31','2025-06-25 14:22:36'),(441,3,NULL,NULL,NULL,13,'2025-06-25 14:22:00',NULL,'live',NULL,NULL,'2025-06-25 14:22:36','2025-06-25 14:22:36'),(442,3,NULL,NULL,NULL,13,'2025-06-25 14:22:00',NULL,'live',NULL,NULL,'2025-06-25 14:22:36','2025-06-25 14:22:55'),(443,3,NULL,NULL,NULL,13,'2025-06-25 14:22:00',NULL,'live',NULL,NULL,'2025-06-25 14:22:55','2025-06-25 14:22:55'),(444,3,NULL,NULL,NULL,13,'2025-06-25 14:23:00',NULL,'live',NULL,NULL,'2025-06-25 14:22:56','2025-06-25 14:23:01'),(445,3,NULL,NULL,NULL,13,'2025-06-25 14:23:00',NULL,'live',NULL,NULL,'2025-06-25 14:23:01','2025-06-25 14:23:01'),(446,3,NULL,NULL,NULL,13,'2025-06-25 14:23:00',NULL,'live',NULL,NULL,'2025-06-25 14:23:01','2025-06-25 14:23:08'),(447,3,NULL,NULL,NULL,13,'2025-06-25 14:23:00',NULL,'live',NULL,NULL,'2025-06-25 14:23:08','2025-06-25 14:23:08'),(448,3,NULL,NULL,NULL,13,'2025-06-25 14:23:00',NULL,'live',NULL,NULL,'2025-06-25 14:23:08','2025-06-25 14:23:13'),(449,3,NULL,NULL,NULL,13,'2025-06-25 14:23:00',NULL,'live',NULL,NULL,'2025-06-25 14:23:13','2025-06-25 14:23:13'),(450,3,NULL,NULL,NULL,13,NULL,NULL,'pending',NULL,NULL,'2025-06-25 14:23:13','2025-06-25 14:23:13'),(453,3,NULL,NULL,NULL,13,'2025-06-25 14:17:00',NULL,'live',NULL,NULL,'2025-06-25 14:26:23','2025-06-25 14:26:23'),(454,3,NULL,NULL,NULL,13,'2025-06-25 14:17:00',NULL,'live',NULL,NULL,'2025-06-25 14:26:25','2025-06-25 14:26:25'),(456,3,NULL,NULL,NULL,13,'2025-06-25 14:00:00',NULL,'live',NULL,NULL,'2025-06-25 14:48:01','2025-06-25 14:48:01'),(457,3,NULL,NULL,NULL,13,'2025-06-26 08:23:24',NULL,'live',NULL,NULL,'2025-06-26 08:23:24','2025-06-26 08:23:24');
/*!40000 ALTER TABLE `sub41_entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_entries_authors`
--

LOCK TABLES `sub41_entries_authors` WRITE;
/*!40000 ALTER TABLE `sub41_entries_authors` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_entries_authors` VALUES (4,3,1),(18,3,1),(19,3,1),(20,3,1),(21,3,1),(22,3,1),(23,3,1),(24,3,1),(25,3,1),(26,3,1),(27,3,1),(28,3,1),(29,3,1),(30,3,1),(31,3,1),(32,3,1),(33,3,1),(34,3,1),(35,3,1),(36,3,1),(37,3,1),(38,3,1),(39,3,1),(40,3,1),(41,3,1),(42,3,1),(43,3,1),(44,3,1),(45,3,1),(46,3,1),(47,3,1),(48,3,1),(49,3,1),(50,3,1),(51,3,1),(52,3,1),(53,3,1),(54,3,1),(55,3,1),(56,3,1),(57,3,1),(58,3,1),(59,3,1),(60,3,1),(61,3,1),(62,3,1),(63,3,1),(64,3,1),(65,3,1),(66,3,1),(67,3,1),(68,3,1),(69,3,1),(70,3,1),(71,3,1),(72,3,1),(73,3,1),(74,3,1),(75,3,1),(76,3,1),(77,3,1),(78,3,1),(79,3,1),(80,3,1),(81,3,1),(82,3,1),(83,3,1),(84,3,1),(85,3,1),(87,3,1),(88,3,1),(89,3,1),(90,3,1),(91,3,1),(92,3,1),(93,3,1),(94,3,1),(95,3,1),(96,3,1),(97,3,1),(98,3,1),(99,3,1),(100,3,1),(101,3,1),(102,3,1),(103,3,1),(104,3,1),(105,3,1),(106,3,1),(107,3,1),(108,3,1),(109,3,1),(110,3,1),(111,3,1),(112,3,1),(113,3,1),(114,3,1),(115,3,1),(116,3,1),(117,3,1),(118,3,1),(119,3,1),(120,3,1),(121,3,1),(122,3,1),(123,3,1),(124,3,1),(125,3,1),(126,3,1),(127,3,1),(128,3,1),(129,3,1),(130,3,1),(131,3,1),(132,3,1),(133,3,1),(134,3,1),(135,3,1),(137,3,1),(138,3,1),(139,3,1),(141,3,1),(142,3,1),(143,3,1),(144,3,1),(145,3,1),(146,3,1),(147,3,1),(148,3,1),(149,3,1),(193,3,1),(194,3,1),(195,3,1),(253,3,1),(254,3,1),(255,3,1),(256,3,1),(259,3,1),(261,3,1),(278,3,1),(279,3,1),(280,3,1),(281,3,1),(282,3,1),(283,3,1),(284,3,1),(285,3,1),(286,3,1),(287,3,1),(288,3,1),(289,3,1),(290,3,1),(291,3,1),(292,3,1),(293,3,1),(294,3,1),(295,3,1),(311,3,1),(312,3,1),(313,3,1),(314,3,1),(315,3,1),(316,3,1),(317,3,1),(318,3,1),(319,3,1),(320,3,1),(321,3,1),(322,3,1),(323,3,1),(324,3,1),(325,3,1),(326,3,1),(327,3,1),(328,3,1),(329,3,1),(330,3,1),(331,3,1),(337,3,1),(338,3,1),(339,3,1),(357,3,1),(364,3,1),(365,3,1),(366,3,1),(367,3,1),(370,3,1),(373,3,1),(374,3,1),(375,3,1),(377,3,1),(379,3,1),(383,3,1),(384,3,1),(385,3,1),(386,3,1),(387,3,1),(388,3,1),(389,3,1),(390,3,1),(391,3,1),(392,3,1),(393,3,1),(394,3,1),(395,3,1),(396,3,1),(397,3,1),(399,3,1),(401,3,1),(402,3,1),(403,3,1),(404,3,1),(405,3,1),(406,3,1),(407,3,1),(408,3,1),(409,3,1),(410,3,1),(411,3,1),(412,3,1),(413,3,1),(414,3,1),(415,3,1),(416,3,1),(417,3,1),(418,3,1),(419,3,1),(420,3,1),(421,3,1),(422,3,1),(423,3,1),(424,3,1),(425,3,1),(426,3,1),(427,3,1),(428,3,1),(429,3,1),(430,3,1),(431,3,1),(432,3,1),(433,3,1),(434,3,1),(435,3,1),(436,3,1),(437,3,1),(438,3,1),(439,3,1),(440,3,1),(441,3,1),(442,3,1),(443,3,1),(444,3,1),(445,3,1),(446,3,1),(447,3,1),(448,3,1),(449,3,1),(450,3,1),(453,3,1),(454,3,1),(456,3,1),(457,3,1);
/*!40000 ALTER TABLE `sub41_entries_authors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_entrytypes`
--

LOCK TABLES `sub41_entrytypes` WRITE;
/*!40000 ALTER TABLE `sub41_entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_entrytypes` VALUES (1,2,'CTA With Background','ctaWithBackground','address-card',NULL,0,'site',NULL,NULL,1,'site',NULL,1,'2025-06-20 15:02:43','2025-06-24 10:00:21',NULL,'20033fea-bd0d-4a3e-ad47-9f84788a37db'),(2,3,'Page Content','pageContent','page',NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-06-20 15:02:43','2025-06-20 15:02:43',NULL,'37bcb295-e211-4822-b8ef-9119df20f58e'),(3,4,'Single Link','singleLink','link',NULL,0,'site',NULL,NULL,1,'site',NULL,1,'2025-06-20 15:49:11','2025-06-20 15:49:11',NULL,'efb6f34c-41f5-4d47-bda7-2f96b491d19c'),(4,5,'Megamenu List','megamenuList',NULL,NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-06-20 15:55:11','2025-06-20 15:55:11',NULL,'a92e5168-e1b1-4553-88ea-8b38892b8c65'),(5,6,'Megamenu Item','megamenuItem',NULL,NULL,0,'site',NULL,NULL,1,'site',NULL,1,'2025-06-20 15:56:59','2025-06-20 15:56:59',NULL,'cb061430-787b-48ea-8a9b-c7980d0134b9'),(6,9,'Equipment Card','equipmentCard','screwdriver-wrench',NULL,0,'site',NULL,NULL,1,'site',NULL,1,'2025-06-24 10:50:53','2025-06-24 10:51:29',NULL,'f0170a2a-3987-4b96-a0b8-e2f4c9b4f177'),(7,10,'Two Column Card Block','twoColumnCardBlock','table-columns',NULL,0,'site',NULL,NULL,1,'site',NULL,1,'2025-06-24 10:52:01','2025-06-24 10:52:01',NULL,'674fb744-b160-444b-af35-72f3a327afbf'),(8,11,'Fifty Fifty Card','fiftyFiftyCard','align-left',NULL,0,'site',NULL,NULL,1,'site',NULL,1,'2025-06-24 14:51:37','2025-06-24 14:51:37',NULL,'0de456be-e57c-491d-b5e9-2a48c94a73cf'),(9,12,'50/50 Image Text Repeater','fiftyFiftyImageTextRepeater','credit-card-front',NULL,0,'site',NULL,NULL,1,'site',NULL,1,'2025-06-24 14:55:04','2025-06-24 14:55:04',NULL,'cdb88818-0242-4279-92e9-21a22e0931cb'),(10,13,'Newsletter Signup Banner','newsletterSignupBanner','envelope-open-text',NULL,0,'site',NULL,NULL,1,'site',NULL,1,'2025-06-25 09:14:52','2025-06-25 09:14:52',NULL,'f9651f2a-e0c5-420e-bcd0-60892652fbcd'),(11,15,'Equipment Category Grid','equipmentCategoryGrid','grid-2',NULL,0,'site',NULL,NULL,1,'site',NULL,1,'2025-06-25 11:31:02','2025-06-25 11:31:02',NULL,'e1d477b7-f94e-41e1-94f9-0a657534d3eb'),(12,16,'Equipment Page Type','equipmentPageType',NULL,NULL,0,'site',NULL,NULL,1,'site',NULL,1,'2025-06-25 11:33:43','2025-06-25 11:33:43',NULL,'efe6c18d-5435-400c-92da-48306d6a6da9'),(13,17,'Equipment Page Content','equipmentPageContent','anchor',NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-06-25 11:37:41','2025-06-25 11:39:33',NULL,'e6ecaa86-d570-4965-b85f-62c9ff23b0d7');
/*!40000 ALTER TABLE `sub41_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_fieldlayouts`
--

LOCK TABLES `sub41_fieldlayouts` WRITE;
/*!40000 ALTER TABLE `sub41_fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_fieldlayouts` VALUES (1,'craft\\elements\\Asset','{\"tabs\": [{\"uid\": \"ac3c7ed4-1d9b-475c-a3b8-ea20ab4bee29\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"5ed9b8ab-aa4e-4cb5-961e-8357e4bec625\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2025-06-20T10:02:20+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [\"filename\", \"link\", \"location\", \"kind\"]}','2025-06-20 15:02:43','2025-06-23 10:49:59','2025-06-23 11:23:09','eb51f3f7-2d1d-4ae8-832a-73165a7e2c25'),(2,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"933b5979-c167-4cb3-805e-500465ee69cc\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"4b6fba43-00e6-42e9-bd5d-df5a7c0e6d77\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"46e91064-492e-4832-8b32-9ea816047e2d\", \"required\": false, \"dateAdded\": \"2025-06-24T09:36:30+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"64bbab36-2b23-4734-a7c5-f9c3f950dc5c\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"31515169-58e5-4fdf-b1f0-0060aba7da2f\", \"required\": false, \"dateAdded\": \"2025-06-24T09:36:30+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"30e3f980-7c9d-4871-a5d3-137315080327\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Button\", \"width\": 100, \"handle\": \"btn\", \"warning\": null, \"fieldUid\": \"208b59dc-efeb-404c-98f2-6ec660879ee1\", \"required\": false, \"dateAdded\": \"2025-06-24T09:36:30+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}, {\"uid\": \"a8418181-87cc-46c6-8d5c-472b46a37826\", \"name\": \"Block Options\", \"elements\": [{\"tip\": null, \"uid\": \"ecbc199d-cba2-4043-96f9-babcda7e9d8f\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"62534679-40fc-45ab-9544-cbced2386fe8\", \"required\": false, \"dateAdded\": \"2025-06-24T09:36:30+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [\"layoutElement:64bbab36-2b23-4734-a7c5-f9c3f950dc5c\"]}','2025-06-20 15:02:43','2025-06-24 10:52:34',NULL,'a0302802-ac4a-406f-8196-59d50a1fee9b'),(3,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"72031785-e515-43ab-a68a-07dcf0873f6e\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"bc0898df-829d-4823-8d11-0fea8c90cd65\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-06-20T10:08:58+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"8a6e64f9-321d-4af7-a127-8f93a0f10602\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"ca7c778b-1c9d-4e2a-83a5-984c98a48619\", \"required\": false, \"dateAdded\": \"2025-06-20T10:12:18+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-06-20 15:02:43','2025-06-20 15:02:43',NULL,'63361e12-6664-4483-9c6a-d55ea6c19473'),(4,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"78ec9a6e-495c-4ee1-926c-b6af4ec2a03a\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"907b0b2d-32ac-4a0b-a932-267eb2efe235\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"208b59dc-efeb-404c-98f2-6ec660879ee1\", \"required\": false, \"dateAdded\": \"2025-06-20T15:49:11+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-06-20 15:49:11','2025-06-20 15:49:11',NULL,'2de2ddc7-407b-467a-a709-14e3f6125078'),(5,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"d29532a6-05eb-4df0-8134-cb33775c55ed\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"74347a8e-2aa2-47d7-a77d-bdd9012c07fb\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": \"Heading\", \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-06-20T15:51:35+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"67d0b562-a644-4f8f-9703-8d0165c2e534\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"0b7df609-3386-44d6-8dec-9236996e999a\", \"required\": false, \"dateAdded\": \"2025-06-20T15:55:11+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-06-20 15:55:11','2025-06-20 15:55:11',NULL,'5332d3ff-8966-4ff4-8317-526d67bf924d'),(6,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"638a2d33-78e2-497d-a596-37e41ba4c249\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"83e91fbf-b380-46f8-82ff-2d8c80358adb\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Menu Link\", \"width\": 100, \"handle\": \"menuLink\", \"warning\": null, \"fieldUid\": \"208b59dc-efeb-404c-98f2-6ec660879ee1\", \"required\": false, \"dateAdded\": \"2025-06-23T10:24:37+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"b58cf50d-0130-48e0-8993-4270d9cb20b4\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"69332d09-4481-4eaf-9f75-241fbd7f5211\", \"required\": false, \"dateAdded\": \"2025-06-20T15:56:59+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [\"layoutElement:83e91fbf-b380-46f8-82ff-2d8c80358adb\"]}','2025-06-20 15:56:59','2025-06-23 10:24:37',NULL,'1f03596e-310a-46ef-a0e6-84311287c787'),(7,'craft\\elements\\GlobalSet','{\"tabs\": [{\"uid\": \"d94c5a2b-6ee4-40d9-b980-8f6611e80d48\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"71fa6bbf-4472-405d-94d2-78883692d9a3\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Logo\", \"width\": 100, \"handle\": \"logo\", \"warning\": null, \"fieldUid\": \"62534679-40fc-45ab-9544-cbced2386fe8\", \"required\": false, \"dateAdded\": \"2025-06-20T15:57:13+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"c0f591d0-8f83-4afe-b408-85d5b5c4cb92\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"75c37449-5a52-49a5-9e4a-f3533695f300\", \"required\": false, \"dateAdded\": \"2025-06-20T15:57:13+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-06-20 15:57:13','2025-06-20 15:57:13',NULL,'61008989-da97-4806-9a00-51c78967a3f9'),(8,'craft\\elements\\Asset','{\"tabs\": [{\"uid\": \"dce090d3-b05d-4ef4-88b5-deb47c5a44a5\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"b58cdce2-9236-43ec-807d-02938fec9cde\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2025-06-23T11:22:10+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [\"dateUpdated\", \"dateCreated\", \"filename\", \"link\", \"kind\"]}','2025-06-23 11:24:17','2025-06-23 11:24:17',NULL,'97e0fb0c-a10d-43ac-9edf-f973c1f55421'),(9,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"5d324fa7-833e-4b79-8563-ecab4ce6b961\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"ce108292-a428-4690-8c1a-18857f118010\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Background Image\", \"width\": 100, \"handle\": \"backgroundImage\", \"warning\": null, \"fieldUid\": \"62534679-40fc-45ab-9544-cbced2386fe8\", \"required\": false, \"dateAdded\": \"2025-06-24T10:50:53+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"455e3759-a800-4724-9708-7c9be2a69c23\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Logo\", \"width\": 100, \"handle\": \"logo\", \"warning\": null, \"fieldUid\": \"62534679-40fc-45ab-9544-cbced2386fe8\", \"required\": false, \"dateAdded\": \"2025-06-24T10:50:53+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"9f00ec96-6c2a-4c18-8826-cf60eaae44fb\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Link\", \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"208b59dc-efeb-404c-98f2-6ec660879ee1\", \"required\": false, \"dateAdded\": \"2025-06-24T10:50:53+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-06-24 10:50:53','2025-06-24 10:50:53',NULL,'c544b1c1-a22d-4262-9987-b89dc498ff14'),(10,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"ce15fc4d-4671-47a8-8476-d4ae78279148\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"d8701d55-4e96-4975-8a83-ca39387151dd\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"46e91064-492e-4832-8b32-9ea816047e2d\", \"required\": false, \"dateAdded\": \"2025-06-24T10:52:01+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"aa3ffb32-22c5-462f-9335-8dd735a45e07\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"31515169-58e5-4fdf-b1f0-0060aba7da2f\", \"required\": false, \"dateAdded\": \"2025-06-24T10:52:01+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"46c34e0e-9ed3-4c44-b48d-11be0ac69af6\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"bcded55c-424c-4973-b666-df8c107909d2\", \"required\": false, \"dateAdded\": \"2025-06-24T10:52:01+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-06-24 10:52:01','2025-06-24 10:52:01',NULL,'d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951'),(11,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"13513093-6ebb-4768-a358-8bdc4518ee56\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"115b6113-df2d-45fb-ba86-d52c1d7796d0\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Image/Video\", \"width\": 100, \"handle\": \"imageVideo\", \"warning\": null, \"fieldUid\": \"62534679-40fc-45ab-9544-cbced2386fe8\", \"required\": false, \"dateAdded\": \"2025-06-24T14:51:37+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"f20db730-adb1-464a-a81d-a7b1f4561641\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"31515169-58e5-4fdf-b1f0-0060aba7da2f\", \"required\": false, \"dateAdded\": \"2025-06-24T14:51:37+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"1410e061-f3a6-4c61-ac0a-88c4559a2caf\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Button\", \"width\": 100, \"handle\": \"button\", \"warning\": null, \"fieldUid\": \"208b59dc-efeb-404c-98f2-6ec660879ee1\", \"required\": false, \"dateAdded\": \"2025-06-24T14:51:37+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}, {\"uid\": \"b4e1f01a-4465-4d6f-918c-d7ceb7b226aa\", \"name\": \"Options\", \"elements\": [{\"tip\": null, \"uid\": \"6c5af9fb-885b-4a4a-8994-f75bb36d71bf\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Flip Option\", \"width\": 100, \"handle\": \"flip\", \"warning\": null, \"fieldUid\": \"fab0c052-2ecc-4fb3-b50c-072289e0957f\", \"required\": false, \"dateAdded\": \"2025-06-24T14:51:37+00:00\", \"instructions\": \"Toggle between showing the image on the left and text on the right, to image on the right and text on the left.\", \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [\"layoutElement:f20db730-adb1-464a-a81d-a7b1f4561641\"]}','2025-06-24 14:51:37','2025-06-24 14:54:29',NULL,'b801ff03-6c29-460d-81ef-1a77bc941a3a'),(12,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"0722613a-bae3-4c08-ab5e-29f9ee36252c\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"b52e2eda-b831-4172-a8b4-7e3a035063c1\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"741d13d8-7c1b-4440-a507-1b6478eb6736\", \"required\": false, \"dateAdded\": \"2025-06-24T14:55:04+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-06-24 14:55:04','2025-06-24 14:55:04',NULL,'fb6b36de-9001-450e-85b4-e0194f0ee43f'),(13,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"e9315285-489c-4511-aab3-8b7a252046ee\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"7eb799bd-8348-499e-a883-7fbf7837d421\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"31515169-58e5-4fdf-b1f0-0060aba7da2f\", \"required\": false, \"dateAdded\": \"2025-06-25T09:14:52+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-06-25 09:14:52','2025-06-25 09:14:52',NULL,'afd1c876-bda0-441a-83f6-4af85c23cc16'),(14,'craft\\elements\\GlobalSet','{\"tabs\": [{\"uid\": \"4ebd74a0-2ef1-4f04-987c-15c10f7c3e77\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"29bba45c-c45c-474a-838b-7a067938dbfc\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"31515169-58e5-4fdf-b1f0-0060aba7da2f\", \"required\": false, \"dateAdded\": \"2025-06-25T10:23:27+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"e291860f-f448-434b-8f78-bc0e1c17df7e\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Phone Number\", \"width\": 100, \"handle\": \"phone\", \"warning\": null, \"fieldUid\": \"e7076da7-39d5-4fe9-bca1-588f96d22b04\", \"required\": false, \"dateAdded\": \"2025-06-25T10:23:27+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"e2d85da6-ced2-45aa-b62a-7d9b0e4fadaa\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Email Address\", \"width\": 100, \"handle\": \"email\", \"warning\": null, \"fieldUid\": \"e7076da7-39d5-4fe9-bca1-588f96d22b04\", \"required\": false, \"dateAdded\": \"2025-06-25T10:23:27+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"6c6ef557-332f-4c2a-bea1-e778ea21504a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Linkedin Link\", \"width\": 100, \"handle\": \"linkedin\", \"warning\": null, \"fieldUid\": \"208b59dc-efeb-404c-98f2-6ec660879ee1\", \"required\": false, \"dateAdded\": \"2025-06-25T10:23:27+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"b1908e11-e036-4f70-a023-67f5f10e0f9b\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Address\", \"width\": 100, \"handle\": \"address\", \"warning\": null, \"fieldUid\": \"31515169-58e5-4fdf-b1f0-0060aba7da2f\", \"required\": false, \"dateAdded\": \"2025-06-25T10:26:18+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"4d1fcd6b-bb05-4628-b5fc-8c9eaa417c7e\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Policies Menu\", \"width\": 100, \"handle\": \"policies\", \"warning\": null, \"fieldUid\": \"0b7df609-3386-44d6-8dec-9236996e999a\", \"required\": false, \"dateAdded\": \"2025-06-25T10:23:27+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-06-25 10:23:27','2025-06-25 10:33:40',NULL,'6ab3f5b4-a069-448c-9b20-3466fc9c8c52'),(15,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"e299e312-9824-463f-bcc5-9a5a7ac72f8c\", \"name\": \"Content\", \"elements\": [], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-06-25 11:31:02','2025-06-25 11:31:02',NULL,'78273fc3-2482-4451-975e-d9d390d2b9a1'),(16,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"4a662de5-1fc0-42a3-ae45-c68ca31626ce\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"929d512f-14b2-4a4b-81bb-b58c7fd2e5dd\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"27b88dbb-5275-488c-8cb3-86e8daa4b84f\", \"required\": false, \"dateAdded\": \"2025-06-25T11:33:43+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-06-25 11:33:43','2025-06-25 11:33:43',NULL,'a3bde020-da74-47bc-8944-80b00a7e9b6d'),(17,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"10660604-256e-4d24-8d61-fe82fc1abc6d\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"3072ce11-1aee-4e6d-91f0-61fbe833f89f\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-06-25T11:36:20+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"9a743120-33d4-4879-96fd-896218a7bd14\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"27b88dbb-5275-488c-8cb3-86e8daa4b84f\", \"required\": false, \"dateAdded\": \"2025-06-25T11:37:41+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"4da7212b-b18b-4781-897d-15da4c3d2e9b\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Category List Thumbnail\", \"width\": 100, \"handle\": \"catThumbnail\", \"warning\": null, \"fieldUid\": \"62534679-40fc-45ab-9544-cbced2386fe8\", \"required\": false, \"dateAdded\": \"2025-06-25T13:30:06+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": {\"class\": \"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\", \"elementType\": \"craft\\\\elements\\\\Entry\", \"fieldContext\": \"global\", \"conditionRules\": [{\"uid\": \"30ef45c1-f5b5-44b9-b938-f66d265f7579\", \"step\": 1, \"class\": \"craft\\\\elements\\\\conditions\\\\LevelConditionRule\", \"value\": \"3\", \"maxValue\": \"\", \"operator\": \"=\"}]}}, {\"tip\": null, \"uid\": \"ae048562-06fd-49b7-9e60-b3c9bb5b6a39\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"ca7c778b-1c9d-4e2a-83a5-984c98a48619\", \"required\": false, \"dateAdded\": \"2025-06-25T11:37:41+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-06-25 11:37:41','2025-06-25 13:30:06',NULL,'a5fa8273-9c26-4652-a2dc-7fc9c7ee4168');
/*!40000 ALTER TABLE `sub41_fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_fields`
--

LOCK TABLES `sub41_fields` WRITE;
/*!40000 ALTER TABLE `sub41_fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_fields` VALUES (1,'Main Content','mainContent','global',NULL,NULL,1,'site',NULL,'craft\\fields\\Matrix','{\"createButtonLabel\":null,\"defaultIndexViewMode\":\"cards\",\"enableVersioning\":true,\"entryTypes\":[{\"uid\":\"20033fea-bd0d-4a3e-ad47-9f84788a37db\"},{\"uid\":\"674fb744-b160-444b-af35-72f3a327afbf\"},{\"uid\":\"cdb88818-0242-4279-92e9-21a22e0931cb\"},{\"uid\":\"f9651f2a-e0c5-420e-bcd0-60892652fbcd\"},{\"uid\":\"e1d477b7-f94e-41e1-94f9-0a657534d3eb\"}],\"includeTableView\":false,\"maxEntries\":null,\"minEntries\":null,\"pageSize\":50,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"cards\"}','2025-06-20 15:02:43','2025-06-25 11:31:42',NULL,'ca7c778b-1c9d-4e2a-83a5-984c98a48619'),(2,'Media','media','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\",\"video\"],\"branchLimit\":null,\"defaultPlacement\":\"end\",\"defaultUploadLocationSource\":\"volume:f455cfbd-b7d8-4140-a7d2-4121bb10fbbd\",\"defaultUploadLocationSubpath\":null,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":1,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:f455cfbd-b7d8-4140-a7d2-4121bb10fbbd\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2025-06-20 15:42:38','2025-06-24 14:55:48',NULL,'62534679-40fc-45ab-9544-cbced2386fe8'),(3,'Single Link','singleLink','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Link','{\"advancedFields\":[\"target\",\"class\"],\"fullGraphqlData\":false,\"maxLength\":255,\"showLabelField\":true,\"typeSettings\":{\"entry\":{\"sources\":\"*\",\"showUnpermittedSections\":\"\",\"showUnpermittedEntries\":\"\"},\"url\":{\"allowRootRelativeUrls\":\"\",\"allowAnchors\":\"\",\"allowCustomSchemes\":\"\"}},\"types\":[\"entry\",\"url\",\"email\",\"tel\"]}','2025-06-20 15:48:59','2025-06-20 15:56:44',NULL,'208b59dc-efeb-404c-98f2-6ec660879ee1'),(4,'Label','label','global',NULL,NULL,1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2025-06-20 15:49:55','2025-06-24 10:53:10',NULL,'e7076da7-39d5-4fe9-bca1-588f96d22b04'),(5,'Link List','linkList','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"branchLimit\":null,\"defaultPlacement\":\"end\",\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":1,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":false,\"showUnpermittedEntries\":false,\"showUnpermittedSections\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2025-06-20 15:54:29','2025-06-20 15:54:29',NULL,'0b7df609-3386-44d6-8dec-9236996e999a'),(6,'Megamenu Content','megamenuContent','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"createButtonLabel\":\"New Column\",\"defaultIndexViewMode\":\"cards\",\"enableVersioning\":false,\"entryTypes\":[{\"uid\":\"a92e5168-e1b1-4553-88ea-8b38892b8c65\"}],\"includeTableView\":false,\"maxEntries\":null,\"minEntries\":1,\"pageSize\":50,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"cards\"}','2025-06-20 15:55:29','2025-06-20 15:55:29',NULL,'69332d09-4481-4eaf-9f75-241fbd7f5211'),(7,'Navigation','navigation','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"createButtonLabel\":null,\"defaultIndexViewMode\":\"cards\",\"enableVersioning\":false,\"entryTypes\":[{\"uid\":\"efb6f34c-41f5-4d47-bda7-2f96b491d19c\"},{\"uid\":\"cb061430-787b-48ea-8a9b-c7980d0134b9\"}],\"includeTableView\":false,\"maxEntries\":null,\"minEntries\":null,\"pageSize\":50,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"cards\"}','2025-06-20 15:57:06','2025-06-20 15:57:06',NULL,'75c37449-5a52-49a5-9e4a-f3533695f300'),(8,'Heading','heading','global',NULL,NULL,1,'none',NULL,'craft\\ckeditor\\Field','{\"availableTransforms\":\"\",\"availableVolumes\":\"*\",\"characterLimit\":null,\"ckeConfig\":\"26919202-5503-4b47-913f-a7b707940ad8\",\"createButtonLabel\":null,\"defaultTransform\":null,\"expandEntryButtons\":false,\"fullGraphqlData\":false,\"parseEmbeds\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"sourceEditingGroups\":[\"__ADMINS__\"],\"wordLimit\":null}','2025-06-24 09:31:56','2025-06-24 10:52:59',NULL,'46e91064-492e-4832-8b32-9ea816047e2d'),(9,'Subtext','subtext','global',NULL,NULL,1,'none',NULL,'craft\\ckeditor\\Field','{\"availableTransforms\":\"\",\"availableVolumes\":\"*\",\"characterLimit\":null,\"ckeConfig\":\"09043f1e-ea69-4028-8ca3-5f75660d3d3d\",\"createButtonLabel\":null,\"defaultTransform\":null,\"expandEntryButtons\":false,\"fullGraphqlData\":true,\"parseEmbeds\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"sourceEditingGroups\":[\"__ADMINS__\"],\"wordLimit\":null}','2025-06-24 09:34:55','2025-06-24 09:34:55',NULL,'31515169-58e5-4fdf-b1f0-0060aba7da2f'),(10,'Equipment Cards','equipmentCards','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"createButtonLabel\":null,\"defaultIndexViewMode\":\"cards\",\"enableVersioning\":false,\"entryTypes\":[{\"uid\":\"f0170a2a-3987-4b96-a0b8-e2f4c9b4f177\"}],\"includeTableView\":false,\"maxEntries\":2,\"minEntries\":2,\"pageSize\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"blocks\"}','2025-06-24 10:51:32','2025-06-24 10:51:32',NULL,'bcded55c-424c-4973-b666-df8c107909d2'),(11,'True/False','trueFalse','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":false,\"offLabel\":null,\"onLabel\":null}','2025-06-24 14:46:46','2025-06-24 14:46:46',NULL,'fab0c052-2ecc-4fb3-b50c-072289e0957f'),(12,'Fifty Fifty Repeater','fiftyFiftyRepeater','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"createButtonLabel\":null,\"defaultIndexViewMode\":\"cards\",\"enableVersioning\":false,\"entryTypes\":[{\"uid\":\"0de456be-e57c-491d-b5e9-2a48c94a73cf\"}],\"includeTableView\":false,\"maxEntries\":null,\"minEntries\":1,\"pageSize\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"blocks\"}','2025-06-24 14:54:34','2025-06-24 14:55:55',NULL,'741d13d8-7c1b-4440-a507-1b6478eb6736'),(13,'Equipment Page Type','equipmentPageType','global',NULL,NULL,0,'none',NULL,'craft\\fields\\ButtonGroup','{\"customOptions\":false,\"iconsOnly\":false,\"options\":[{\"label\":\"Main Parent (Equipment List Page)\",\"value\":\"mainParent\",\"icon\":\"\",\"default\":\"\"},{\"label\":\"Category Listing Page\",\"value\":\"categoryListingPage\",\"icon\":\"\",\"default\":\"\"},{\"label\":\"Product Listing Page\",\"value\":\"productListingPage\",\"icon\":\"\",\"default\":\"1\"},{\"label\":\"Product Individual Page\",\"value\":\"productIndividualPage\",\"icon\":\"\",\"default\":\"\"}]}','2025-06-25 11:33:40','2025-06-25 11:33:40',NULL,'27b88dbb-5275-488c-8cb3-86e8daa4b84f');
/*!40000 ALTER TABLE `sub41_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_crm_fields`
--

LOCK TABLES `sub41_freeform_crm_fields` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_crm_fields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_crm_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_email_marketing_fields`
--

LOCK TABLES `sub41_freeform_email_marketing_fields` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_email_marketing_fields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_email_marketing_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_email_marketing_lists`
--

LOCK TABLES `sub41_freeform_email_marketing_lists` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_email_marketing_lists` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_email_marketing_lists` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_export_notifications`
--

LOCK TABLES `sub41_freeform_export_notifications` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_export_notifications` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_export_notifications` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_export_profiles`
--

LOCK TABLES `sub41_freeform_export_profiles` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_export_profiles` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_export_profiles` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_export_settings`
--

LOCK TABLES `sub41_freeform_export_settings` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_export_settings` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_export_settings` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_favorite_fields`
--

LOCK TABLES `sub41_freeform_favorite_fields` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_favorite_fields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_favorite_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_feed_messages`
--

LOCK TABLES `sub41_freeform_feed_messages` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_feed_messages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_feed_messages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_feeds`
--

LOCK TABLES `sub41_freeform_feeds` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_feeds` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_feeds` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_fields_type_groups`
--

LOCK TABLES `sub41_freeform_fields_type_groups` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_fields_type_groups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_freeform_fields_type_groups` VALUES (1,'#007add','Text','[\"Solspace\\\\Freeform\\\\Fields\\\\Implementations\\\\TextField\",\"Solspace\\\\Freeform\\\\Fields\\\\Implementations\\\\TextareaField\",\"Solspace\\\\Freeform\\\\Fields\\\\Implementations\\\\EmailField\",\"Solspace\\\\Freeform\\\\Fields\\\\Implementations\\\\NumberField\",\"Solspace\\\\Freeform\\\\Fields\\\\Implementations\\\\Pro\\\\PhoneField\",\"Solspace\\\\Freeform\\\\Fields\\\\Implementations\\\\Pro\\\\DatetimeField\",\"Solspace\\\\Freeform\\\\Fields\\\\Implementations\\\\Pro\\\\WebsiteField\",\"Solspace\\\\Freeform\\\\Fields\\\\Implementations\\\\Pro\\\\RegexField\"]','2025-06-20 15:23:40','2025-06-20 15:23:40','c25fb62e-ebf4-485a-9d3a-c0971d85db57'),(2,'#9013fe','Options','[\"Solspace\\\\Freeform\\\\Fields\\\\Implementations\\\\DropdownField\",\"Solspace\\\\Freeform\\\\Fields\\\\Implementations\\\\MultipleSelectField\",\"Solspace\\\\Freeform\\\\Fields\\\\Implementations\\\\CheckboxField\",\"Solspace\\\\Freeform\\\\Fields\\\\Implementations\\\\CheckboxesField\",\"Solspace\\\\Freeform\\\\Fields\\\\Implementations\\\\RadiosField\",\"Solspace\\\\Freeform\\\\Fields\\\\Implementations\\\\Pro\\\\OpinionScaleField\",\"Solspace\\\\Freeform\\\\Fields\\\\Implementations\\\\Pro\\\\RatingField\"]','2025-06-20 15:23:40','2025-06-20 15:23:40','1e6b76fb-4b06-4606-814f-9c22b5f5873a'),(3,'#f5a623','Files','[\"Solspace\\\\Freeform\\\\Fields\\\\Implementations\\\\FileUploadField\",\"Solspace\\\\Freeform\\\\Fields\\\\Implementations\\\\Pro\\\\FileDragAndDropField\"]','2025-06-20 15:23:40','2025-06-20 15:23:40','4d196ee1-3a26-4cff-8e5c-b541ef399f6e'),(4,'#5d9901','Special','[\"Solspace\\\\Freeform\\\\Fields\\\\Implementations\\\\Pro\\\\GroupField\",\"Solspace\\\\Freeform\\\\Fields\\\\Implementations\\\\Pro\\\\TableField\",\"Solspace\\\\Freeform\\\\Fields\\\\Implementations\\\\Pro\\\\ConfirmationField\",\"Solspace\\\\Freeform\\\\Fields\\\\Implementations\\\\Pro\\\\PasswordField\",\"Solspace\\\\Freeform\\\\Fields\\\\Implementations\\\\Pro\\\\CalculationField\",\"Solspace\\\\Freeform\\\\Fields\\\\Implementations\\\\Pro\\\\SignatureField\"]','2025-06-20 15:23:40','2025-06-20 15:23:40','f06409f2-10bc-4677-b5b4-89ce54425642'),(5,'#000000','Content','[\"Solspace\\\\Freeform\\\\Fields\\\\Implementations\\\\HtmlField\",\"Solspace\\\\Freeform\\\\Fields\\\\Implementations\\\\Pro\\\\RichTextField\"]','2025-06-20 15:23:40','2025-06-20 15:23:40','f08d0c03-6ba2-433d-b896-609e166428e3'),(6,'#9b9b9b','Hidden','[\"Solspace\\\\Freeform\\\\Fields\\\\Implementations\\\\HiddenField\",\"Solspace\\\\Freeform\\\\Fields\\\\Implementations\\\\Pro\\\\InvisibleField\"]','2025-06-20 15:23:40','2025-06-20 15:23:40','789687de-be35-4865-9210-e225429dc8ee');
/*!40000 ALTER TABLE `sub41_freeform_fields_type_groups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_forms`
--

LOCK TABLES `sub41_freeform_forms` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_forms` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_freeform_forms` VALUES (1,'Solspace\\Freeform\\Form\\Types\\Regular','Newsletter Form','newsletterForm',0,'{\"behavior\":{\"ajax\":true,\"successBehavior\":\"reload\",\"duplicateCheck\":\"no_limit\",\"showProcessingSpinner\":true,\"successTemplate\":null,\"stopSubmissionsAfter\":null,\"showProcessingText\":true,\"returnUrl\":\"\",\"processingText\":\"Processing...\",\"successMessage\":\"Form has been submitted successfully!\",\"errorMessage\":\"Sorry, there was an error submitting the form. Please try again.\"},\"general\":{\"name\":\"Newsletter Form\",\"storeData\":true,\"handle\":\"newsletterForm\",\"defaultStatus\":2,\"type\":\"Solspace\\\\Freeform\\\\Form\\\\Types\\\\Regular\",\"collectIpAddresses\":true,\"sites\":[\"1\"],\"allowUsersToOptIn\":false,\"translations\":false,\"optInCheckbox\":null,\"submissionTitle\":\"Newsletter Signup - {{ dateCreated|date(\\\"Y-m-d H:i:s\\\") }}\",\"formattingTemplate\":\"basic-light\\/index.twig\",\"description\":\"\",\"color\":\"#0AC0B1\",\"attributes\":{\"form\":{},\"row\":{},\"success\":{},\"errors\":{}}}}',NULL,3,3,NULL,'2025-06-25 09:01:37','2025-06-25 09:23:08','8c211761-7be9-4316-a574-debfea3fb76d');
/*!40000 ALTER TABLE `sub41_freeform_forms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_forms_fields`
--

LOCK TABLES `sub41_freeform_forms_fields` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_forms_fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_freeform_forms_fields` VALUES (1,1,'Solspace\\Freeform\\Fields\\Implementations\\EmailField','{\"label\":\"Email\",\"encrypted\":false,\"handle\":\"email\",\"fieldType\":null,\"instructions\":\"\",\"attributes\":{\"input\":{},\"label\":{},\"instructions\":{},\"container\":{},\"error\":{},\"option\":{},\"optionLabel\":{}},\"placeholder\":\"Enter your email\",\"required\":true,\"requiredMessage\":null,\"defaultValue\":null,\"maxLength\":null}',1,0,'2025-06-25 09:11:27','2025-06-25 09:23:08','13d9bf3a-1d7f-4ade-ad11-993f90d54afa'),(2,1,'Solspace\\Freeform\\Fields\\Implementations\\CheckboxField','{\"label\":\"<p>I agree to Specialist Underwater Brokerage processing my personal data in accordance with their <a href=\\\"..\\/..\\/privacy-policy\\\">Privacy Policy<\\/a><\\/p>\",\"checkedByDefault\":false,\"handle\":\"checkbox\",\"fieldType\":null,\"instructions\":\"\",\"attributes\":{\"input\":{},\"label\":{},\"instructions\":{},\"container\":{},\"error\":{},\"option\":{},\"optionLabel\":{}},\"required\":true,\"requiredMessage\":null,\"defaultValue\":null}',2,0,'2025-06-25 09:11:27','2025-06-25 09:23:08','cc3c92f7-3f3f-46e2-806c-88081d8e2b6c');
/*!40000 ALTER TABLE `sub41_freeform_forms_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_forms_groups`
--

LOCK TABLES `sub41_freeform_forms_groups` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_forms_groups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_forms_groups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_forms_groups_entries`
--

LOCK TABLES `sub41_freeform_forms_groups_entries` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_forms_groups_entries` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_forms_groups_entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_forms_integrations`
--

LOCK TABLES `sub41_freeform_forms_integrations` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_forms_integrations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_forms_integrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_forms_layouts`
--

LOCK TABLES `sub41_freeform_forms_layouts` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_forms_layouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_freeform_forms_layouts` VALUES (1,1,'2025-06-25 09:11:27','2025-06-25 09:11:27','e3db241f-5b81-4c8d-b013-4b6dc4d5e6dc');
/*!40000 ALTER TABLE `sub41_freeform_forms_layouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_forms_notifications`
--

LOCK TABLES `sub41_freeform_forms_notifications` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_forms_notifications` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_forms_notifications` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_forms_pages`
--

LOCK TABLES `sub41_freeform_forms_pages` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_forms_pages` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_freeform_forms_pages` VALUES (1,1,1,'Page 1',0,'{\"buttons\":{\"layout\":\"save back|submit\",\"attributes\":{\"container\":{},\"column\":{},\"submit\":{},\"back\":{},\"save\":{}},\"submitLabel\":\"Subscribe\",\"back\":true,\"backLabel\":\"Back\",\"save\":false,\"saveLabel\":\"Save\"}}','2025-06-25 09:11:27','2025-06-25 09:23:08','d8d184cc-a308-4d20-a660-e12e2c25e764');
/*!40000 ALTER TABLE `sub41_freeform_forms_pages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_forms_rows`
--

LOCK TABLES `sub41_freeform_forms_rows` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_forms_rows` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_freeform_forms_rows` VALUES (1,1,1,0,'2025-06-25 09:11:27','2025-06-25 09:11:27','17900dc2-f4aa-4f1e-b998-22e36a250020'),(2,1,1,1,'2025-06-25 09:11:27','2025-06-25 09:11:27','75ad1a99-ae05-4793-b283-4d14d9a0c0e9');
/*!40000 ALTER TABLE `sub41_freeform_forms_rows` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_forms_sites`
--

LOCK TABLES `sub41_freeform_forms_sites` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_forms_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_freeform_forms_sites` VALUES (1,1,1,'2025-06-25 09:01:37','2025-06-25 09:01:37','2af5d198-3dd1-49aa-8eac-6acb6516b9bc');
/*!40000 ALTER TABLE `sub41_freeform_forms_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_forms_translations`
--

LOCK TABLES `sub41_freeform_forms_translations` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_forms_translations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_forms_translations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_integrations`
--

LOCK TABLES `sub41_freeform_integrations` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_integrations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_integrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_integrations_queue`
--

LOCK TABLES `sub41_freeform_integrations_queue` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_integrations_queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_integrations_queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_limited_users`
--

LOCK TABLES `sub41_freeform_limited_users` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_limited_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_limited_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_notification_log`
--

LOCK TABLES `sub41_freeform_notification_log` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_notification_log` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_notification_log` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_notification_templates`
--

LOCK TABLES `sub41_freeform_notification_templates` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_notification_templates` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_notification_templates` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_payments`
--

LOCK TABLES `sub41_freeform_payments` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_payments` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_payments` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_pdf_templates`
--

LOCK TABLES `sub41_freeform_pdf_templates` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_pdf_templates` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_pdf_templates` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_rules`
--

LOCK TABLES `sub41_freeform_rules` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_rules` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_rules` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_rules_buttons`
--

LOCK TABLES `sub41_freeform_rules_buttons` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_rules_buttons` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_rules_buttons` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_rules_conditions`
--

LOCK TABLES `sub41_freeform_rules_conditions` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_rules_conditions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_rules_conditions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_rules_fields`
--

LOCK TABLES `sub41_freeform_rules_fields` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_rules_fields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_rules_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_rules_notifications`
--

LOCK TABLES `sub41_freeform_rules_notifications` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_rules_notifications` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_rules_notifications` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_rules_pages`
--

LOCK TABLES `sub41_freeform_rules_pages` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_rules_pages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_rules_pages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_rules_submit_form`
--

LOCK TABLES `sub41_freeform_rules_submit_form` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_rules_submit_form` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_rules_submit_form` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_saved_forms`
--

LOCK TABLES `sub41_freeform_saved_forms` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_saved_forms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_saved_forms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_session_context`
--

LOCK TABLES `sub41_freeform_session_context` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_session_context` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_session_context` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_spam_reason`
--

LOCK TABLES `sub41_freeform_spam_reason` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_spam_reason` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_spam_reason` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_statuses`
--

LOCK TABLES `sub41_freeform_statuses` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_statuses` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_freeform_statuses` VALUES (1,'Pending','pending','orange',1,'2025-06-20 15:23:40','2025-06-20 15:23:40','dfcea00c-db4b-41a3-8463-6e7a9973b551'),(2,'Open','open','teal',2,'2025-06-20 15:23:40','2025-06-20 15:23:40','4e1b23d2-2982-4436-a059-4e0eea89ee96'),(3,'Closed','closed','red',3,'2025-06-20 15:23:40','2025-06-20 15:23:40','7034b349-2cdc-49ab-bd29-804ded989799');
/*!40000 ALTER TABLE `sub41_freeform_statuses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_submission_notes`
--

LOCK TABLES `sub41_freeform_submission_notes` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_submission_notes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_submission_notes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_submissions`
--

LOCK TABLES `sub41_freeform_submissions` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_submissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_submissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_submissions_newsletter_form_1`
--

LOCK TABLES `sub41_freeform_submissions_newsletter_form_1` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_submissions_newsletter_form_1` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_submissions_newsletter_form_1` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_survey_preferences`
--

LOCK TABLES `sub41_freeform_survey_preferences` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_survey_preferences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_survey_preferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_freeform_unfinalized_files`
--

LOCK TABLES `sub41_freeform_unfinalized_files` WRITE;
/*!40000 ALTER TABLE `sub41_freeform_unfinalized_files` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_freeform_unfinalized_files` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_globalsets`
--

LOCK TABLES `sub41_globalsets` WRITE;
/*!40000 ALTER TABLE `sub41_globalsets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_globalsets` VALUES (5,'Header','header',7,1,'2025-06-20 15:57:13','2025-06-20 15:57:13','861d3103-01e5-446c-b19c-8357db15e40d'),(252,'Footer','footer',14,2,'2025-06-25 10:23:27','2025-06-25 10:23:27','114e0eaa-67db-473a-a450-04a4a53bba35');
/*!40000 ALTER TABLE `sub41_globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_gqlschemas`
--

LOCK TABLES `sub41_gqlschemas` WRITE;
/*!40000 ALTER TABLE `sub41_gqlschemas` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_gqltokens`
--

LOCK TABLES `sub41_gqltokens` WRITE;
/*!40000 ALTER TABLE `sub41_gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_imagetransforms`
--

LOCK TABLES `sub41_imagetransforms` WRITE;
/*!40000 ALTER TABLE `sub41_imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_info`
--

LOCK TABLES `sub41_info` WRITE;
/*!40000 ALTER TABLE `sub41_info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_info` VALUES (1,'5.7.11','5.7.0.3',1,'rnhlxbdnfzgj','3@cqustykdfb','2025-06-20 15:02:43','2025-06-26 09:06:05','e1887278-296c-4177-ac70-73b4da07ca79');
/*!40000 ALTER TABLE `sub41_info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_migrations`
--

LOCK TABLES `sub41_migrations` WRITE;
/*!40000 ALTER TABLE `sub41_migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_migrations` VALUES (1,'plugin:ckeditor','Install','2025-06-20 15:02:43','2025-06-20 15:02:43','2025-06-20 15:02:43','b30a2cac-b096-4741-97ba-a35ce73669b3'),(2,'plugin:ckeditor','m230408_163704_v3_upgrade','2025-06-20 15:02:43','2025-06-20 15:02:43','2025-06-20 15:02:43','1cdc950d-d516-4316-a148-19c728dffeea'),(3,'craft','Install','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','437a88f1-1c45-448c-a60e-13c7268ef197'),(4,'craft','m221101_115859_create_entries_authors_table','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','7b380487-eed1-4949-a532-ddba31d3adf9'),(5,'craft','m221107_112121_add_max_authors_to_sections','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','f7a3ea5d-18c2-4ec8-81d8-f06893a7abbe'),(6,'craft','m221205_082005_translatable_asset_alt_text','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','67b7b52b-01f2-4bc1-b9e1-0a7c7176e0a9'),(7,'craft','m230314_110309_add_authenticator_table','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','b91e06bc-e9d7-4b7e-8b68-dd840f78e9ed'),(8,'craft','m230314_111234_add_webauthn_table','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','d39f4333-25ed-4976-8641-185a52badf16'),(9,'craft','m230503_120303_add_recoverycodes_table','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','a7f3e7b3-b25b-41f3-8211-8719965267f5'),(10,'craft','m230511_000000_field_layout_configs','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','ee34a4f4-a916-4f4c-8954-4e9bf5b20285'),(11,'craft','m230511_215903_content_refactor','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','227259f5-6108-4d67-b9f9-3c4a82894404'),(12,'craft','m230524_000000_add_entry_type_show_slug_field','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','bd7d0fc0-bf3e-4cd8-9bd6-89fbe3edce33'),(13,'craft','m230524_000001_entry_type_icons','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','1eb4ce9b-46f5-4de2-b7e4-8782d81abbbb'),(14,'craft','m230524_000002_entry_type_colors','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','e3ddfd80-9c6c-4e6d-b491-f876b1dc16bb'),(15,'craft','m230524_220029_global_entry_types','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','7003e116-e093-4f12-8b9b-70258f6fbd6e'),(16,'craft','m230531_123004_add_entry_type_show_status_field','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','95dc9db9-f4d4-4476-bb37-1f98b72dd1c2'),(17,'craft','m230607_102049_add_entrytype_slug_translation_columns','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','2dc53289-9cac-4802-9336-fb515e529ce1'),(18,'craft','m230616_173810_kill_field_groups','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','29b14926-ff6d-4e70-8717-a50a59242c16'),(19,'craft','m230616_183820_remove_field_name_limit','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','d1c7ac01-fe00-4458-8da5-0a61da891197'),(20,'craft','m230617_070415_entrify_matrix_blocks','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','fec871ff-cb37-4384-bcc6-0c8505d7b04a'),(21,'craft','m230710_162700_element_activity','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','247541c4-a19e-41d3-bac8-1463d0e28931'),(22,'craft','m230820_162023_fix_cache_id_type','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','608600b9-e7ac-4aad-965a-eb42010dfea1'),(23,'craft','m230826_094050_fix_session_id_type','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','308eb889-a0ef-44b2-beae-cda5836ae53e'),(24,'craft','m230904_190356_address_fields','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','ebf9875f-209d-46ec-b5fb-fd68113a6ae4'),(25,'craft','m230928_144045_add_subpath_to_volumes','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','cf70df23-6316-463f-9964-aadb571e1c63'),(26,'craft','m231013_185640_changedfields_amend_primary_key','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','d0f20c3f-6864-4214-8c38-9a81436ab76e'),(27,'craft','m231213_030600_element_bulk_ops','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','e5dc3ef8-b0e3-433c-817b-1ec73ec117e3'),(28,'craft','m240129_150719_sites_language_amend_length','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','1eb7829f-b2ce-4910-aece-15176bce1362'),(29,'craft','m240206_035135_convert_json_columns','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','ce9ccad5-18bf-4a4d-ab8b-60de429a8a39'),(30,'craft','m240207_182452_address_line_3','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','68920cfb-e3fd-4239-814a-59c33ca84bd4'),(31,'craft','m240302_212719_solo_preview_targets','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','e3792ed1-6520-4db2-9508-5f7ac6296684'),(32,'craft','m240619_091352_add_auth_2fa_timestamp','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','9a079861-d0fe-4920-a414-7f5ff0b520a2'),(33,'craft','m240723_214330_drop_bulkop_fk','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','5332c4cd-c4ab-4d3d-b484-17b8f5fd8ec7'),(34,'craft','m240731_053543_soft_delete_fields','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','f0b31c1f-41b2-450c-bbde-b3293705dd0e'),(35,'craft','m240805_154041_sso_identities','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','52433f3d-7622-4693-8999-0a8dfb2ddcec'),(36,'craft','m240926_202248_track_entries_deleted_with_section','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','98223e00-680c-4e6d-a9cf-a01ff6b8dd77'),(37,'craft','m241120_190905_user_affiliated_sites','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','63ca149c-b600-4ebf-9478-f4803f1e4908'),(38,'craft','m241125_122914_add_viewUsers_permission','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','cf4c9d42-aa5d-436f-9356-cc2104e18f60'),(39,'craft','m250119_135304_entry_type_overrides','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','8e7743b6-b533-4ccc-96ec-ecb8c32ca9b0'),(40,'craft','m250206_135036_search_index_queue','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','5874b8af-235b-4710-9671-f84d5e7be453'),(41,'craft','m250207_172349_bulkop_events','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','3fde07e9-9550-4291-ac76-323e18faa0d8'),(42,'craft','m250315_131608_unlimited_authors','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','56adb2f1-ba65-436d-9851-4bff39a7d9b0'),(43,'craft','m250403_171253_static_statuses','2025-06-20 15:02:44','2025-06-20 15:02:44','2025-06-20 15:02:44','d73c62cc-49b8-4682-88e2-3bcfec758369'),(44,'plugin:freeform','Install','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','45e64ea8-24c9-4369-9960-dd97b0e139e7'),(45,'plugin:freeform','m180120_140521_CraftUpgrade','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','e40e3fbf-b2b0-4671-9d9e-450dba7dcebe'),(46,'plugin:freeform','m180125_124339_UpdateForeignKeyNames','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','ec1faa3b-3e29-4830-9e7b-204fe69a50ef'),(47,'plugin:freeform','m180214_094247_AddUniqueTokenToSubmissionsAndForms','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','3a6fe441-6a36-4196-b940-10c878d9e666'),(48,'plugin:freeform','m180220_072652_ChangeFileUploadFieldColumnType','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','3b4466f1-694b-4dc4-b8b5-70ad03111615'),(49,'plugin:freeform','m180326_094124_AddIsSpamToSubmissions','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','d5bc0343-82e4-4b7f-b417-5c21395e02bb'),(50,'plugin:freeform','m180405_101920_AddIpAddressToSubmissions','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','65bb609f-a4a7-41b4-ad40-abd347112080'),(51,'plugin:freeform','m180410_131206_CreateIntegrationsQueue','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','0833be52-06c0-4490-934d-ee670d216f9e'),(52,'plugin:freeform','m180417_134527_AddMultipleSelectTypeToFields','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','8273e13c-ebed-4397-a362-8bbaf206f46b'),(53,'plugin:freeform','m180430_151626_PaymentGateways','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','27a5728c-acfb-4433-8691-4e5ea4e9b928'),(54,'plugin:freeform','m180508_095131_CreatePaymentGatewayFieldsTable','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','c4591ab6-a92e-438b-91b9-67b16fafb5ba'),(55,'plugin:freeform','m180606_141402_AddConnectionsToFormProperties','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','4b506e61-2ae9-4a1a-a7f8-abed1d5ca455'),(56,'plugin:freeform','m180730_171628_AddCcDetailsFieldType','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','615c04b1-2236-4488-adf2-d703a2738b6a'),(57,'plugin:freeform','m180817_091801_AddRulesToFormProperties','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','b9232c23-05de-465a-a60d-75b1efa1fe34'),(58,'plugin:freeform','m181112_152751_ChangeTypeEnumColumnsToIndexedText','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','5de39667-5ccb-456a-8dd8-44b2e3955696'),(59,'plugin:freeform','m181129_083939_ChangeIntegrationFieldTypeColumnTypeToString','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','8d852c73-b036-425d-b384-a3bf749ddd7a'),(60,'plugin:freeform','m190501_124050_MergingEditionsMigration','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','1a45b02e-67c3-437d-ae73-2eda14aa8fdf'),(61,'plugin:freeform','m190502_155557_AddCCAndBCCToEmailNotifications','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','593ede9b-8625-4f97-9fa3-6ab0ca77784f'),(62,'plugin:freeform','m190516_085150_AddPresetAssetsToNotifications','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','56b966d4-1f25-4cfc-8ecb-fd1d19a81f62'),(63,'plugin:freeform','m190529_135307_AddWebhookTables','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','1a9b9e4a-ac77-40b7-851d-d361de542ef3'),(64,'plugin:freeform','m190604_125112_AddFormLimitSubmissionProperty','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','6d553f9e-c99c-483c-951d-76a9776de541'),(65,'plugin:freeform','m190610_074840_MigrateScriptInsertLocation','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','0f2accd0-9629-4501-8648-f643354c2202'),(66,'plugin:freeform','m190614_103420_AddMissingMetaColumnsToProAndPaymentTables','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','2c772023-4284-408f-b354-05caebfd059a'),(67,'plugin:freeform','m190617_122427_RemoveBrokenForeignKeys','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','2b3c163d-ae5f-4bf6-b91b-a47e96dd8ca4'),(68,'plugin:freeform','m190618_142759_AddFixedForeignKeys','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','290c6c4c-52aa-42bc-aaad-7f5b82c56552'),(69,'plugin:freeform','m190812_125059_AddNotesTable','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','567f52ff-3bfa-4e6f-9bac-b3d66d8457e2'),(70,'plugin:freeform','m190905_113428_FixIntervalCountNotNullColumn','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','f34d93ca-2258-4c91-9fef-b4848ad4e2a8'),(71,'plugin:freeform','m191214_093453_AddExtraPostUrlColumnToForm','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','215c7c04-482c-440c-aeb8-15ca21ec5987'),(72,'plugin:freeform','m200203_180318_AddSpamReasonTable','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','a849d2e7-6ac9-41e1-b76a-add911b6a956'),(73,'plugin:freeform','m200214_083115_FixIntegrationQueueIndex','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','1e0623af-299a-46af-bf0b-e36bef342958'),(74,'plugin:freeform','m200616_143808_FormPermissionsUpdate','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','2e47da11-b3f6-4d5e-87c8-dc82b804c785'),(75,'plugin:freeform','m200630_103347_IncreaseExportProfileSettingSize','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','0ab2e134-4eb9-4713-bb9b-24f711f98e90'),(76,'plugin:freeform','m200825_124009_SplitPipedriveIntegrationIntoDealsAndLeads','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','3459d768-795a-4be2-8841-f223c9a970b9'),(77,'plugin:freeform','m200907_081059_AddValidationToFormProperties','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','8c7a9c86-312f-4806-8c83-98c4c0b0af6e'),(78,'plugin:freeform','m200911_130215_AddReplyToNameToNotifications','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','40afea23-add6-46e8-a056-251e57772997'),(79,'plugin:freeform','m201006_065315_AddFeedTables','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','e38a6373-15a3-49ea-ae32-d00b62bf26d2'),(80,'plugin:freeform','m201014_161213_AddFormSortOrder','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','fce9ab94-015d-494d-ba3d-d3f5992ad20d'),(81,'plugin:freeform','m201027_103933_AddExportProfileDateRanges','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','60ca0f44-e767-4c52-a2df-4a58b3453eef'),(82,'plugin:freeform','m201209_162655_AddAutoTextColumnToNotifications','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','33bfc503-fb5b-42bc-b945-cbfa62e9ad0d'),(83,'plugin:freeform','m210105_145259_AddGoogleTagManagerColumnsToForms','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','0d258a47-423d-40a6-95b4-f576c677bf01'),(84,'plugin:freeform','m210527_071651_AddDbSessionStorage','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','7801d550-20c2-4cea-a836-a4ad28a9679f'),(85,'plugin:freeform','m210609_183655_AddContextToUnfinalizedFiles','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','cba87ff8-5878-4e5c-b8a6-93fbf9e56d83'),(86,'plugin:freeform','m210629_172132_AddDateIndexToLockTable','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','281773ee-11ce-499c-9a21-5f11851800cd'),(87,'plugin:freeform','m210923_110033_AddSavedFormsTable','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','73b8ad27-60d7-4bb0-a24f-8bd1d921ff37'),(88,'plugin:freeform','m211109_144235_RemoveContextFromUnfinalizedAssets','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','00cc7906-13be-4c97-800b-78f04623a82a'),(89,'plugin:freeform','m211227_140312_AddFormTypes','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','a3e0253c-c152-461e-9da6-a7827e76d648'),(90,'plugin:freeform','m220121_091429_AddUserIdToSubmissions','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','7e97498e-e415-400b-b105-8d9ad904e67c'),(91,'plugin:freeform','m220304_101448_ChangeAccessTokenColumnType','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','28e77bf0-1e7a-4bd5-b3b0-3037e953c9c1'),(92,'plugin:freeform','m220316_060248_SwitchFormSuccessBehaviourToRedirectReturnUrl','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','3cabb5a5-57db-495a-b2ee-2144b8fe0ca0'),(93,'plugin:freeform','m220322_070819_RenameFormattingTemplates','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','8f046d68-fae2-4b1a-a3a0-b6552b23a321'),(94,'plugin:freeform','m220323_113852_MigrateEmailValuesToString','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','f60d6df4-4630-4eb1-9af6-fb9a16a87132'),(95,'plugin:freeform','m220330_111857_SplitSubmissionsTable','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','8e4a0177-665f-4b80-8a5f-b33112813ea2'),(96,'plugin:freeform','m220422_065929_AddExportNotificationsTable','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','e35f7d44-0009-4bce-85fd-3010378ec9b1'),(97,'plugin:freeform','m220527_055207_ExpandIntegrationAccessTokenSize','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','1827db02-5cde-427c-94e0-df37c520086c'),(98,'plugin:freeform','m220530_052327_MigrateFormContentTableNamesToSnakeCase','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','f7d4d61f-3fae-4c20-aef1-756901e3eaa7'),(99,'plugin:freeform','m230101_100000_ConvertJsonToLongTextColumns','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','d8de0602-5e0d-4d9d-9411-32cea3b9d24a'),(100,'plugin:freeform','m230101_100010_FF4to5_MigrateForms','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','219d0b06-7647-4d03-8292-745f04494000'),(101,'plugin:freeform','m230101_100020_FF4to5_MigrateLayout','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','6b0c11e9-69cb-4615-ba72-13d1a85f6c6c'),(102,'plugin:freeform','m230101_100030_FF4to5_MigrateNotifications','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','e1f2b346-3680-4c7a-a336-12e810b7fb80'),(103,'plugin:freeform','m230101_100050_FF4to5_MigrateIntegrations','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','166bf817-beb3-4c99-a20a-3eea85363759'),(104,'plugin:freeform','m230101_100060_FF4to5_MigrateConditionalRules','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','b732d4ce-0646-4a89-8af2-75efbccaa48d'),(105,'plugin:freeform','m230101_200000_FF4to5_MigrateData','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','2fcd2807-f90c-4462-b0c7-0f6a4f0d3e6f'),(106,'plugin:freeform','m230101_300100_FF4RemoveOldTables','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','a86fc199-c092-49a0-beed-863358fd06c0'),(107,'plugin:freeform','m230224_141036_RemoveRedundantFieldsFromIntegrationsTable','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','8b77a628-c4aa-4acb-9111-f1c95a0408c3'),(108,'plugin:freeform','m230224_141037_RenameIntegrationTableColumns','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','cb057af8-ff87-464e-bac4-3042f3226584'),(109,'plugin:freeform','m230227_102619_MoveCRMIntegrationClasses','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','805c4b6a-6f9c-4c8d-a11a-1fc58a44e843'),(110,'plugin:freeform','m230301_124411_MoveMailingListIntegrationClasses','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','811768e1-d6f9-4b93-be5a-c7f158805a8f'),(111,'plugin:freeform','m230424_010101_announcement_4_0_23','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','43ad154a-3499-4269-a9b5-6509f646cfbe'),(112,'plugin:freeform','m230516_010101_announcement_4_0_24','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','899e8455-17cd-4fdc-a7da-3587628fa68d'),(113,'plugin:freeform','m230613_010101_announcement_4_1_0','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','a6fd4bc5-2474-4105-bfb2-d4bf58fd0bb6'),(114,'plugin:freeform','m230712_120518_RemoveIntegrationsQueueMailingListFieldIndex','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','ff392a54-d63b-4911-a8ec-d92175a06d7a'),(115,'plugin:freeform','m230725_124256_AddCategoryToCrmFields','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','a60929b6-ea57-485c-9897-9085b12522fc'),(116,'plugin:freeform','m230809_081815_AddCategoryToMailingListFields','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','0ac09213-837d-48fd-a356-79b808b319f7'),(117,'plugin:freeform','m230824_111101_ChangeMailingListsToEmailMarketing','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','be53a673-c7d3-47e4-9f48-21a7e9bbe6ca'),(118,'plugin:freeform','m230824_163145_RemoveWebhooksTable','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','fe957651-cc99-43fb-a416-55be2de25b20'),(119,'plugin:freeform','m230901_143430_ChangeLabelFieldColumnType','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','a23f1dbc-25c2-4502-a2bc-dcd9232b2389'),(120,'plugin:freeform','m230920_103014_RemoveLastUpdateFromIntegrations','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','96d49e35-900b-4023-87c4-7e5929d167e6'),(121,'plugin:freeform','m230925_162351_AddEnabledToIntegrations','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','ba31879c-914c-4776-b490-046957adee21'),(122,'plugin:freeform','m231020_115409_MigrateIntegrationNamespaces','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','fdec67e1-2718-4b76-a821-873578b21014'),(123,'plugin:freeform','m231116_104621_AlterPaymentTables','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','a48e6553-47e9-4f8d-9a0f-d59f5f243aae'),(124,'plugin:freeform','m231128_142144_AddLinkToPaymentsTable','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','e0f9805d-b7fe-4c07-bad2-be8be2a07b92'),(125,'plugin:freeform','m231206_132139_RemoveLockTable','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','fec2b4c5-0efd-4f1f-b3e9-bc3f22567834'),(126,'plugin:freeform','m231219_105754_AddUsersToFormsTable','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','84563758-f06e-4864-a09c-c8363ce84cc8'),(127,'plugin:freeform','m231229_155623_CreateSurveysPreferencesTable','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','209fa1ec-2eff-4891-b182-3243643f8cb2'),(128,'plugin:freeform','m231230_074448_CreateFieldsTypeGroupsTable','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','0fc18dcb-f6e4-47c4-9362-ac92b4f1d422'),(129,'plugin:freeform','m240109_142124_UpdatePageButtonMetadata','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','cf3e2654-7cca-41f6-abe3-2467303cbe59'),(130,'plugin:freeform','m240110_111258_ChangeFormFieldRowForeignKey','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','49e02fa1-cc45-49f6-9e0a-656be0a49930'),(131,'plugin:freeform','m240111_162954_RemoveStatisticsWidgetFromWidgetsTable','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','63d719da-b96a-4b8f-afe7-c2f04efb7c77'),(132,'plugin:freeform','m240315_100655_UserIntegrationMultiGroupChoice','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','0c45996d-41be-4cdf-868b-a0b703960173'),(133,'plugin:freeform','m240405_151009_MigrateEntryIntegrations','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','2a3e7889-d54e-4975-b545-c9b253201dec'),(134,'plugin:freeform','m240415_150746_CreateSubmitFormRuleTable','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','827cec55-daaa-46a0-b549-473085ef8877'),(135,'plugin:freeform','m240425_062916_CreateButtonRuleTable','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','5ea21824-9f0f-4e1b-9a54-64189fe91b36'),(136,'plugin:freeform','m240429_120039_CreateFormSitesMapTable','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','93f70c24-654b-48fc-b604-1dd650b313c7'),(137,'plugin:freeform','m240501_091330_AddHiddenFieldToGroupsTable','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','bc5eb1aa-0544-417e-94eb-461f55d2d622'),(138,'plugin:freeform','m240507_073204_DropStatusDefaultColumn','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','3f25dba2-0366-4b18-9a33-29eedc51b44e'),(139,'plugin:freeform','m240521_110910_CreateLimitedUsersTable','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','bc90e262-740c-4b83-a356-6728232e1484'),(140,'plugin:freeform','m240619_111214_GenerateSpamBlockIntegrations','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','ead65c51-e152-4216-84af-ca7f7224c08a'),(141,'plugin:freeform','m240624_113811_AddArchivedDateToFormsTable','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','aefa13ce-7f87-4148-9ea0-5ac0cb8c5895'),(142,'plugin:freeform','m240813_161214_UpdateStatusColors','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','2378694e-10fb-45c0-bf19-35848fb037e6'),(143,'plugin:freeform','m240814_120443_RefactorGridAndFlexboxFormattingTemplatePaths','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','246747fa-b07f-46cf-906d-d1377a4d7676'),(144,'plugin:freeform','m240819_104209_AddTranslationTable','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','b75d1e2a-d39e-4174-943a-780a5c1c3799'),(145,'plugin:freeform','m240903_145017_CreateFormGroupsTable','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','589c672c-46db-4abe-b96d-3f3aff9dd569'),(146,'plugin:freeform','m240903_145034_CreateFormGroupsEntriesTable','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','06fe74d4-7203-45cc-9f2e-3fd921aae9d5'),(147,'plugin:freeform','m241023_080038_AddPdfTemplateTable','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','f7dbf0c6-abca-44d4-9352-4f763100cd6b'),(148,'plugin:freeform','m241104_091432_AddOptionsToIntegrationFields','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','7b1a4e14-9a2b-41a7-8c68-780d3e806921'),(149,'plugin:freeform','m241126_113656_UpdateTableLayoutProperties','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','011707e0-5945-45f1-addf-e718663ec32b'),(150,'plugin:freeform','m241210_054218_AddOptionColumnFixForIntegrations','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','40ee55a5-0998-421c-8a70-50f8bed6df4f'),(151,'plugin:freeform','m250121_085946_AddForeignKeyToAssetsInUnfinalizedAssets','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','f05d35bd-bece-419f-9083-03234f522dba'),(152,'plugin:freeform','m250121_163320_UpdateCRMFieldOptionsColumnType','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','5786759d-b26f-46e6-b163-e23801f1bcdd'),(153,'plugin:freeform','m250121_163956_UpdateEmailMarketingFieldOptionsColumnType','2025-06-20 15:23:40','2025-06-20 15:23:40','2025-06-20 15:23:40','be7ffe22-9680-4bee-b264-338fad3e29b1');
/*!40000 ALTER TABLE `sub41_migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_plugins`
--

LOCK TABLES `sub41_plugins` WRITE;
/*!40000 ALTER TABLE `sub41_plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_plugins` VALUES (1,'assetrev','8.0.0','1.0.0','2025-06-20 15:02:43','2025-06-20 15:02:43','2025-06-20 15:02:43','f09fa63c-7605-49fd-8e52-3f2c0d9d69f7'),(2,'ckeditor','4.9.0','3.0.0.0','2025-06-20 15:02:43','2025-06-20 15:02:43','2025-06-20 15:02:43','a9b35236-bec5-482b-b574-95e034e984f9'),(3,'breadcrumb','3.0.0','1.1.1','2025-06-20 15:22:26','2025-06-20 15:22:26','2025-06-20 15:22:26','a8c9563e-1e27-4d07-b9df-4a57a506ffc5'),(4,'vite','5.0.1','1.0.0','2025-06-20 15:23:17','2025-06-20 15:23:17','2025-06-20 15:23:17','5d6ec234-80ce-40ea-80b7-bdad23382f97'),(5,'templatecomments','5.0.4','1.0.0','2025-06-20 15:23:33','2025-06-20 15:23:33','2025-06-20 15:23:33','9663a8cd-3143-4ecb-883f-8b902e11295d'),(6,'freeform','5.10.17','5.4.2','2025-06-20 15:23:37','2025-06-20 15:23:37','2025-06-20 15:23:37','ebc0146e-df24-4fbb-8c27-0d918a118698');
/*!40000 ALTER TABLE `sub41_plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_projectconfig`
--

LOCK TABLES `sub41_projectconfig` WRITE;
/*!40000 ALTER TABLE `sub41_projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_projectconfig` VALUES ('ckeditor.configs.09043f1e-ea69-4028-8ca3-5f75660d3d3d.headingLevels.0','1'),('ckeditor.configs.09043f1e-ea69-4028-8ca3-5f75660d3d3d.headingLevels.1','2'),('ckeditor.configs.09043f1e-ea69-4028-8ca3-5f75660d3d3d.headingLevels.2','3'),('ckeditor.configs.09043f1e-ea69-4028-8ca3-5f75660d3d3d.headingLevels.3','4'),('ckeditor.configs.09043f1e-ea69-4028-8ca3-5f75660d3d3d.headingLevels.4','5'),('ckeditor.configs.09043f1e-ea69-4028-8ca3-5f75660d3d3d.headingLevels.5','6'),('ckeditor.configs.09043f1e-ea69-4028-8ca3-5f75660d3d3d.name','\"Subtext\"'),('ckeditor.configs.09043f1e-ea69-4028-8ca3-5f75660d3d3d.toolbar.0','\"heading\"'),('ckeditor.configs.09043f1e-ea69-4028-8ca3-5f75660d3d3d.toolbar.1','\"|\"'),('ckeditor.configs.09043f1e-ea69-4028-8ca3-5f75660d3d3d.toolbar.2','\"underline\"'),('ckeditor.configs.09043f1e-ea69-4028-8ca3-5f75660d3d3d.toolbar.3','\"bulletedList\"'),('ckeditor.configs.09043f1e-ea69-4028-8ca3-5f75660d3d3d.toolbar.4','\"numberedList\"'),('ckeditor.configs.09043f1e-ea69-4028-8ca3-5f75660d3d3d.toolbar.5','\"bold\"'),('ckeditor.configs.09043f1e-ea69-4028-8ca3-5f75660d3d3d.toolbar.6','\"italic\"'),('ckeditor.configs.09043f1e-ea69-4028-8ca3-5f75660d3d3d.toolbar.7','\"link\"'),('ckeditor.configs.09043f1e-ea69-4028-8ca3-5f75660d3d3d.toolbar.8','\"fontColor\"'),('ckeditor.configs.26919202-5503-4b47-913f-a7b707940ad8.headingLevels.0','1'),('ckeditor.configs.26919202-5503-4b47-913f-a7b707940ad8.headingLevels.1','2'),('ckeditor.configs.26919202-5503-4b47-913f-a7b707940ad8.headingLevels.2','3'),('ckeditor.configs.26919202-5503-4b47-913f-a7b707940ad8.headingLevels.3','4'),('ckeditor.configs.26919202-5503-4b47-913f-a7b707940ad8.headingLevels.4','5'),('ckeditor.configs.26919202-5503-4b47-913f-a7b707940ad8.headingLevels.5','6'),('ckeditor.configs.26919202-5503-4b47-913f-a7b707940ad8.name','\"Headings\"'),('ckeditor.configs.26919202-5503-4b47-913f-a7b707940ad8.toolbar.0','\"heading\"'),('ckeditor.configs.26919202-5503-4b47-913f-a7b707940ad8.toolbar.1','\"|\"'),('ckeditor.configs.26919202-5503-4b47-913f-a7b707940ad8.toolbar.2','\"underline\"'),('ckeditor.configs.26919202-5503-4b47-913f-a7b707940ad8.toolbar.3','\"bold\"'),('ckeditor.configs.26919202-5503-4b47-913f-a7b707940ad8.toolbar.4','\"italic\"'),('ckeditor.configs.c190d294-d2f4-4f8b-a3f9-bbc414f9e870.headingLevels.0','1'),('ckeditor.configs.c190d294-d2f4-4f8b-a3f9-bbc414f9e870.headingLevels.1','2'),('ckeditor.configs.c190d294-d2f4-4f8b-a3f9-bbc414f9e870.headingLevels.2','3'),('ckeditor.configs.c190d294-d2f4-4f8b-a3f9-bbc414f9e870.headingLevels.3','4'),('ckeditor.configs.c190d294-d2f4-4f8b-a3f9-bbc414f9e870.headingLevels.4','5'),('ckeditor.configs.c190d294-d2f4-4f8b-a3f9-bbc414f9e870.headingLevels.5','6'),('ckeditor.configs.c190d294-d2f4-4f8b-a3f9-bbc414f9e870.name','\"Simple\"'),('ckeditor.configs.c190d294-d2f4-4f8b-a3f9-bbc414f9e870.toolbar.0','\"heading\"'),('ckeditor.configs.c190d294-d2f4-4f8b-a3f9-bbc414f9e870.toolbar.1','\"|\"'),('ckeditor.configs.c190d294-d2f4-4f8b-a3f9-bbc414f9e870.toolbar.2','\"bold\"'),('ckeditor.configs.c190d294-d2f4-4f8b-a3f9-bbc414f9e870.toolbar.3','\"italic\"'),('ckeditor.configs.c190d294-d2f4-4f8b-a3f9-bbc414f9e870.toolbar.4','\"link\"'),('dateModified','1750858206'),('email.fromEmail','\"dev@in-testing.co.uk\"'),('email.fromName','\"Sub\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.color','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.cardView.0','\"layoutElement:f20db730-adb1-464a-a81d-a7b1f4561641\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elementCondition','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.0.dateAdded','\"2025-06-24T14:51:37+00:00\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.0.editCondition','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.0.elementCondition','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.0.fieldUid','\"62534679-40fc-45ab-9544-cbced2386fe8\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.0.handle','\"imageVideo\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.0.includeInCards','false'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.0.instructions','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.0.label','\"Image/Video\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.0.providesThumbs','false'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.0.required','false'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.0.tip','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.0.uid','\"115b6113-df2d-45fb-ba86-d52c1d7796d0\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.0.userCondition','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.0.warning','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.0.width','100'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.1.dateAdded','\"2025-06-24T14:51:37+00:00\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.1.editCondition','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.1.elementCondition','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.1.fieldUid','\"31515169-58e5-4fdf-b1f0-0060aba7da2f\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.1.handle','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.1.includeInCards','true'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.1.instructions','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.1.label','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.1.providesThumbs','false'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.1.required','false'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.1.tip','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.1.uid','\"f20db730-adb1-464a-a81d-a7b1f4561641\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.1.userCondition','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.1.warning','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.1.width','100'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.2.dateAdded','\"2025-06-24T14:51:37+00:00\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.2.editCondition','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.2.elementCondition','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.2.fieldUid','\"208b59dc-efeb-404c-98f2-6ec660879ee1\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.2.handle','\"button\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.2.includeInCards','false'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.2.instructions','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.2.label','\"Button\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.2.providesThumbs','false'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.2.required','false'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.2.tip','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.2.uid','\"1410e061-f3a6-4c61-ac0a-88c4559a2caf\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.2.userCondition','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.2.warning','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.elements.2.width','100'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.name','\"Content\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.uid','\"13513093-6ebb-4768-a358-8bdc4518ee56\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.0.userCondition','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.1.elementCondition','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.1.elements.0.dateAdded','\"2025-06-24T14:51:37+00:00\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.1.elements.0.editCondition','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.1.elements.0.elementCondition','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.1.elements.0.fieldUid','\"fab0c052-2ecc-4fb3-b50c-072289e0957f\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.1.elements.0.handle','\"flip\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.1.elements.0.includeInCards','false'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.1.elements.0.instructions','\"Toggle between showing the image on the left and text on the right, to image on the right and text on the left.\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.1.elements.0.label','\"Flip Option\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.1.elements.0.providesThumbs','false'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.1.elements.0.required','false'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.1.elements.0.tip','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.1.elements.0.uid','\"6c5af9fb-885b-4a4a-8994-f75bb36d71bf\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.1.elements.0.userCondition','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.1.elements.0.warning','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.1.elements.0.width','100'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.1.name','\"Options\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.1.uid','\"b4e1f01a-4465-4d6f-918c-d7ceb7b226aa\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.fieldLayouts.b801ff03-6c29-460d-81ef-1a77bc941a3a.tabs.1.userCondition','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.handle','\"fiftyFiftyCard\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.hasTitleField','false'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.icon','\"align-left\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.name','\"Fifty Fifty Card\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.showSlugField','true'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.showStatusField','true'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.slugTranslationKeyFormat','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.slugTranslationMethod','\"site\"'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.titleFormat','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.titleTranslationKeyFormat','null'),('entryTypes.0de456be-e57c-491d-b5e9-2a48c94a73cf.titleTranslationMethod','\"site\"'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.color','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.cardView.0','\"layoutElement:64bbab36-2b23-4734-a7c5-f9c3f950dc5c\"'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elementCondition','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.0.dateAdded','\"2025-06-24T09:36:30+00:00\"'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.0.editCondition','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.0.elementCondition','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.0.fieldUid','\"46e91064-492e-4832-8b32-9ea816047e2d\"'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.0.handle','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.0.includeInCards','false'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.0.instructions','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.0.label','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.0.providesThumbs','false'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.0.required','false'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.0.tip','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.0.uid','\"4b6fba43-00e6-42e9-bd5d-df5a7c0e6d77\"'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.0.userCondition','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.0.warning','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.0.width','100'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.1.dateAdded','\"2025-06-24T09:36:30+00:00\"'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.1.editCondition','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.1.elementCondition','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.1.fieldUid','\"31515169-58e5-4fdf-b1f0-0060aba7da2f\"'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.1.handle','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.1.includeInCards','true'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.1.instructions','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.1.label','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.1.providesThumbs','false'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.1.required','false'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.1.tip','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.1.uid','\"64bbab36-2b23-4734-a7c5-f9c3f950dc5c\"'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.1.userCondition','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.1.warning','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.1.width','100'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.2.dateAdded','\"2025-06-24T09:36:30+00:00\"'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.2.editCondition','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.2.elementCondition','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.2.fieldUid','\"208b59dc-efeb-404c-98f2-6ec660879ee1\"'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.2.handle','\"btn\"'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.2.includeInCards','false'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.2.instructions','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.2.label','\"Button\"'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.2.providesThumbs','false'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.2.required','false'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.2.tip','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.2.uid','\"30e3f980-7c9d-4871-a5d3-137315080327\"'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.2.userCondition','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.2.warning','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.elements.2.width','100'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.name','\"Content\"'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.uid','\"933b5979-c167-4cb3-805e-500465ee69cc\"'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.0.userCondition','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.1.elementCondition','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.1.elements.0.dateAdded','\"2025-06-24T09:36:30+00:00\"'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.1.elements.0.editCondition','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.1.elements.0.elementCondition','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.1.elements.0.fieldUid','\"62534679-40fc-45ab-9544-cbced2386fe8\"'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.1.elements.0.handle','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.1.elements.0.includeInCards','false'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.1.elements.0.instructions','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.1.elements.0.label','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.1.elements.0.providesThumbs','false'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.1.elements.0.required','false'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.1.elements.0.tip','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.1.elements.0.uid','\"ecbc199d-cba2-4043-96f9-babcda7e9d8f\"'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.1.elements.0.userCondition','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.1.elements.0.warning','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.1.elements.0.width','100'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.1.name','\"Block Options\"'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.1.uid','\"a8418181-87cc-46c6-8d5c-472b46a37826\"'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.fieldLayouts.a0302802-ac4a-406f-8196-59d50a1fee9b.tabs.1.userCondition','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.handle','\"ctaWithBackground\"'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.hasTitleField','false'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.icon','\"address-card\"'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.name','\"CTA With Background\"'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.showSlugField','true'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.showStatusField','true'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.slugTranslationKeyFormat','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.slugTranslationMethod','\"site\"'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.titleFormat','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.titleTranslationKeyFormat','null'),('entryTypes.20033fea-bd0d-4a3e-ad47-9f84788a37db.titleTranslationMethod','\"site\"'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.color','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elementCondition','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.0.autocapitalize','true'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.0.autocomplete','false'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.0.autocorrect','true'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.0.class','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.0.dateAdded','\"2025-06-20T10:08:58+00:00\"'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.0.disabled','false'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.0.elementCondition','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.0.id','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.0.includeInCards','false'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.0.inputType','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.0.instructions','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.0.label','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.0.max','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.0.min','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.0.name','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.0.orientation','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.0.placeholder','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.0.providesThumbs','false'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.0.readonly','false'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.0.required','true'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.0.size','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.0.step','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.0.tip','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.0.title','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.0.uid','\"bc0898df-829d-4823-8d11-0fea8c90cd65\"'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.0.userCondition','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.0.warning','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.0.width','100'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.1.dateAdded','\"2025-06-20T10:12:18+00:00\"'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.1.editCondition','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.1.elementCondition','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.1.fieldUid','\"ca7c778b-1c9d-4e2a-83a5-984c98a48619\"'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.1.handle','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.1.includeInCards','false'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.1.instructions','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.1.label','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.1.providesThumbs','false'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.1.required','false'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.1.tip','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.1.uid','\"8a6e64f9-321d-4af7-a127-8f93a0f10602\"'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.1.userCondition','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.1.warning','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.elements.1.width','100'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.name','\"Content\"'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.uid','\"72031785-e515-43ab-a68a-07dcf0873f6e\"'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.fieldLayouts.63361e12-6664-4483-9c6a-d55ea6c19473.tabs.0.userCondition','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.handle','\"pageContent\"'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.hasTitleField','true'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.icon','\"page\"'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.name','\"Page Content\"'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.showSlugField','true'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.showStatusField','true'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.slugTranslationKeyFormat','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.slugTranslationMethod','\"site\"'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.titleFormat','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.titleTranslationKeyFormat','null'),('entryTypes.37bcb295-e211-4822-b8ef-9119df20f58e.titleTranslationMethod','\"site\"'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.color','null'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elementCondition','null'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.0.dateAdded','\"2025-06-24T10:52:01+00:00\"'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.0.editCondition','null'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.0.elementCondition','null'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.0.fieldUid','\"46e91064-492e-4832-8b32-9ea816047e2d\"'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.0.handle','null'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.0.includeInCards','true'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.0.instructions','null'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.0.label','null'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.0.providesThumbs','false'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.0.required','false'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.0.tip','null'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.0.uid','\"d8701d55-4e96-4975-8a83-ca39387151dd\"'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.0.userCondition','null'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.0.warning','null'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.0.width','100'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.1.dateAdded','\"2025-06-24T10:52:01+00:00\"'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.1.editCondition','null'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.1.elementCondition','null'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.1.fieldUid','\"31515169-58e5-4fdf-b1f0-0060aba7da2f\"'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.1.handle','null'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.1.includeInCards','false'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.1.instructions','null'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.1.label','null'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.1.providesThumbs','false'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.1.required','false'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.1.tip','null'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.1.uid','\"aa3ffb32-22c5-462f-9335-8dd735a45e07\"'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.1.userCondition','null'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.1.warning','null'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.1.width','100'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.2.dateAdded','\"2025-06-24T10:52:01+00:00\"'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.2.editCondition','null'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.2.elementCondition','null'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.2.fieldUid','\"bcded55c-424c-4973-b666-df8c107909d2\"'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.2.handle','null'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.2.includeInCards','false'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.2.instructions','null'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.2.label','null'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.2.providesThumbs','false'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.2.required','false'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.2.tip','null'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.2.uid','\"46c34e0e-9ed3-4c44-b48d-11be0ac69af6\"'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.2.userCondition','null'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.2.warning','null'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.elements.2.width','100'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.name','\"Content\"'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.uid','\"ce15fc4d-4671-47a8-8476-d4ae78279148\"'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.fieldLayouts.d25bc3cd-c8d5-42ea-8f97-43a5ac4ea951.tabs.0.userCondition','null'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.handle','\"twoColumnCardBlock\"'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.hasTitleField','false'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.icon','\"table-columns\"'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.name','\"Two Column Card Block\"'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.showSlugField','true'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.showStatusField','true'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.slugTranslationKeyFormat','null'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.slugTranslationMethod','\"site\"'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.titleFormat','null'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.titleTranslationKeyFormat','null'),('entryTypes.674fb744-b160-444b-af35-72f3a327afbf.titleTranslationMethod','\"site\"'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.color','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elementCondition','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.0.autocapitalize','true'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.0.autocomplete','false'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.0.autocorrect','true'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.0.class','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.0.dateAdded','\"2025-06-20T15:51:35+00:00\"'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.0.disabled','false'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.0.elementCondition','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.0.id','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.0.includeInCards','false'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.0.inputType','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.0.instructions','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.0.label','\"Heading\"'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.0.max','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.0.min','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.0.name','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.0.orientation','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.0.placeholder','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.0.providesThumbs','false'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.0.readonly','false'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.0.required','true'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.0.size','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.0.step','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.0.tip','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.0.title','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.0.uid','\"74347a8e-2aa2-47d7-a77d-bdd9012c07fb\"'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.0.userCondition','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.0.warning','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.0.width','100'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.1.dateAdded','\"2025-06-20T15:55:11+00:00\"'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.1.editCondition','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.1.elementCondition','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.1.fieldUid','\"0b7df609-3386-44d6-8dec-9236996e999a\"'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.1.handle','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.1.includeInCards','true'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.1.instructions','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.1.label','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.1.providesThumbs','false'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.1.required','false'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.1.tip','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.1.uid','\"67d0b562-a644-4f8f-9703-8d0165c2e534\"'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.1.userCondition','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.1.warning','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.elements.1.width','100'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.name','\"Content\"'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.uid','\"d29532a6-05eb-4df0-8134-cb33775c55ed\"'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.fieldLayouts.5332d3ff-8966-4ff4-8317-526d67bf924d.tabs.0.userCondition','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.handle','\"megamenuList\"'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.hasTitleField','true'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.icon','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.name','\"Megamenu List\"'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.showSlugField','true'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.showStatusField','true'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.slugTranslationKeyFormat','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.slugTranslationMethod','\"site\"'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.titleFormat','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.titleTranslationKeyFormat','null'),('entryTypes.a92e5168-e1b1-4553-88ea-8b38892b8c65.titleTranslationMethod','\"site\"'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.color','null'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.cardView.0','\"layoutElement:83e91fbf-b380-46f8-82ff-2d8c80358adb\"'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elementCondition','null'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.0.dateAdded','\"2025-06-23T10:24:37+00:00\"'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.0.editCondition','null'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.0.elementCondition','null'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.0.fieldUid','\"208b59dc-efeb-404c-98f2-6ec660879ee1\"'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.0.handle','\"menuLink\"'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.0.includeInCards','true'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.0.instructions','null'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.0.label','\"Menu Link\"'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.0.providesThumbs','false'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.0.required','false'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.0.tip','null'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.0.uid','\"83e91fbf-b380-46f8-82ff-2d8c80358adb\"'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.0.userCondition','null'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.0.warning','null'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.0.width','100'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.1.dateAdded','\"2025-06-20T15:56:59+00:00\"'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.1.editCondition','null'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.1.elementCondition','null'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.1.fieldUid','\"69332d09-4481-4eaf-9f75-241fbd7f5211\"'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.1.handle','null'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.1.includeInCards','false'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.1.instructions','null'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.1.label','null'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.1.providesThumbs','false'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.1.required','false'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.1.tip','null'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.1.uid','\"b58cf50d-0130-48e0-8993-4270d9cb20b4\"'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.1.userCondition','null'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.1.warning','null'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.elements.1.width','100'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.name','\"Content\"'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.uid','\"638a2d33-78e2-497d-a596-37e41ba4c249\"'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.fieldLayouts.1f03596e-310a-46ef-a0e6-84311287c787.tabs.0.userCondition','null'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.handle','\"megamenuItem\"'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.hasTitleField','false'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.icon','null'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.name','\"Megamenu Item\"'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.showSlugField','true'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.showStatusField','true'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.slugTranslationKeyFormat','null'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.slugTranslationMethod','\"site\"'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.titleFormat','null'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.titleTranslationKeyFormat','null'),('entryTypes.cb061430-787b-48ea-8a9b-c7980d0134b9.titleTranslationMethod','\"site\"'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.color','null'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.fieldLayouts.fb6b36de-9001-450e-85b4-e0194f0ee43f.tabs.0.elementCondition','null'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.fieldLayouts.fb6b36de-9001-450e-85b4-e0194f0ee43f.tabs.0.elements.0.dateAdded','\"2025-06-24T14:55:04+00:00\"'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.fieldLayouts.fb6b36de-9001-450e-85b4-e0194f0ee43f.tabs.0.elements.0.editCondition','null'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.fieldLayouts.fb6b36de-9001-450e-85b4-e0194f0ee43f.tabs.0.elements.0.elementCondition','null'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.fieldLayouts.fb6b36de-9001-450e-85b4-e0194f0ee43f.tabs.0.elements.0.fieldUid','\"741d13d8-7c1b-4440-a507-1b6478eb6736\"'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.fieldLayouts.fb6b36de-9001-450e-85b4-e0194f0ee43f.tabs.0.elements.0.handle','null'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.fieldLayouts.fb6b36de-9001-450e-85b4-e0194f0ee43f.tabs.0.elements.0.includeInCards','false'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.fieldLayouts.fb6b36de-9001-450e-85b4-e0194f0ee43f.tabs.0.elements.0.instructions','null'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.fieldLayouts.fb6b36de-9001-450e-85b4-e0194f0ee43f.tabs.0.elements.0.label','null'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.fieldLayouts.fb6b36de-9001-450e-85b4-e0194f0ee43f.tabs.0.elements.0.providesThumbs','false'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.fieldLayouts.fb6b36de-9001-450e-85b4-e0194f0ee43f.tabs.0.elements.0.required','false'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.fieldLayouts.fb6b36de-9001-450e-85b4-e0194f0ee43f.tabs.0.elements.0.tip','null'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.fieldLayouts.fb6b36de-9001-450e-85b4-e0194f0ee43f.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.fieldLayouts.fb6b36de-9001-450e-85b4-e0194f0ee43f.tabs.0.elements.0.uid','\"b52e2eda-b831-4172-a8b4-7e3a035063c1\"'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.fieldLayouts.fb6b36de-9001-450e-85b4-e0194f0ee43f.tabs.0.elements.0.userCondition','null'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.fieldLayouts.fb6b36de-9001-450e-85b4-e0194f0ee43f.tabs.0.elements.0.warning','null'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.fieldLayouts.fb6b36de-9001-450e-85b4-e0194f0ee43f.tabs.0.elements.0.width','100'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.fieldLayouts.fb6b36de-9001-450e-85b4-e0194f0ee43f.tabs.0.name','\"Content\"'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.fieldLayouts.fb6b36de-9001-450e-85b4-e0194f0ee43f.tabs.0.uid','\"0722613a-bae3-4c08-ab5e-29f9ee36252c\"'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.fieldLayouts.fb6b36de-9001-450e-85b4-e0194f0ee43f.tabs.0.userCondition','null'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.handle','\"fiftyFiftyImageTextRepeater\"'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.hasTitleField','false'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.icon','\"credit-card-front\"'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.name','\"50/50 Image Text Repeater\"'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.showSlugField','true'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.showStatusField','true'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.slugTranslationKeyFormat','null'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.slugTranslationMethod','\"site\"'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.titleFormat','null'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.titleTranslationKeyFormat','null'),('entryTypes.cdb88818-0242-4279-92e9-21a22e0931cb.titleTranslationMethod','\"site\"'),('entryTypes.e1d477b7-f94e-41e1-94f9-0a657534d3eb.color','null'),('entryTypes.e1d477b7-f94e-41e1-94f9-0a657534d3eb.fieldLayouts.78273fc3-2482-4451-975e-d9d390d2b9a1.tabs.0.elementCondition','null'),('entryTypes.e1d477b7-f94e-41e1-94f9-0a657534d3eb.fieldLayouts.78273fc3-2482-4451-975e-d9d390d2b9a1.tabs.0.name','\"Content\"'),('entryTypes.e1d477b7-f94e-41e1-94f9-0a657534d3eb.fieldLayouts.78273fc3-2482-4451-975e-d9d390d2b9a1.tabs.0.uid','\"e299e312-9824-463f-bcc5-9a5a7ac72f8c\"'),('entryTypes.e1d477b7-f94e-41e1-94f9-0a657534d3eb.fieldLayouts.78273fc3-2482-4451-975e-d9d390d2b9a1.tabs.0.userCondition','null'),('entryTypes.e1d477b7-f94e-41e1-94f9-0a657534d3eb.handle','\"equipmentCategoryGrid\"'),('entryTypes.e1d477b7-f94e-41e1-94f9-0a657534d3eb.hasTitleField','false'),('entryTypes.e1d477b7-f94e-41e1-94f9-0a657534d3eb.icon','\"grid-2\"'),('entryTypes.e1d477b7-f94e-41e1-94f9-0a657534d3eb.name','\"Equipment Category Grid\"'),('entryTypes.e1d477b7-f94e-41e1-94f9-0a657534d3eb.showSlugField','true'),('entryTypes.e1d477b7-f94e-41e1-94f9-0a657534d3eb.showStatusField','true'),('entryTypes.e1d477b7-f94e-41e1-94f9-0a657534d3eb.slugTranslationKeyFormat','null'),('entryTypes.e1d477b7-f94e-41e1-94f9-0a657534d3eb.slugTranslationMethod','\"site\"'),('entryTypes.e1d477b7-f94e-41e1-94f9-0a657534d3eb.titleFormat','null'),('entryTypes.e1d477b7-f94e-41e1-94f9-0a657534d3eb.titleTranslationKeyFormat','null'),('entryTypes.e1d477b7-f94e-41e1-94f9-0a657534d3eb.titleTranslationMethod','\"site\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.color','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elementCondition','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.0.autocapitalize','true'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.0.autocomplete','false'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.0.autocorrect','true'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.0.class','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.0.dateAdded','\"2025-06-25T11:36:20+00:00\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.0.disabled','false'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.0.elementCondition','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.0.id','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.0.includeInCards','false'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.0.inputType','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.0.instructions','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.0.label','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.0.max','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.0.min','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.0.name','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.0.orientation','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.0.placeholder','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.0.providesThumbs','false'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.0.readonly','false'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.0.required','true'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.0.size','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.0.step','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.0.tip','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.0.title','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.0.uid','\"3072ce11-1aee-4e6d-91f0-61fbe833f89f\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.0.userCondition','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.0.warning','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.0.width','100'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.1.dateAdded','\"2025-06-25T11:37:41+00:00\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.1.editCondition','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.1.elementCondition','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.1.fieldUid','\"27b88dbb-5275-488c-8cb3-86e8daa4b84f\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.1.handle','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.1.includeInCards','false'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.1.instructions','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.1.label','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.1.providesThumbs','false'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.1.required','false'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.1.tip','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.1.uid','\"9a743120-33d4-4879-96fd-896218a7bd14\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.1.userCondition','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.1.warning','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.1.width','100'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.2.dateAdded','\"2025-06-25T13:30:06+00:00\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.2.editCondition','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.2.elementCondition.class','\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.2.elementCondition.conditionRules.0.class','\"craft\\\\elements\\\\conditions\\\\LevelConditionRule\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.2.elementCondition.conditionRules.0.maxValue','\"\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.2.elementCondition.conditionRules.0.operator','\"=\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.2.elementCondition.conditionRules.0.step','1'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.2.elementCondition.conditionRules.0.uid','\"30ef45c1-f5b5-44b9-b938-f66d265f7579\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.2.elementCondition.conditionRules.0.value','\"3\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.2.elementCondition.elementType','\"craft\\\\elements\\\\Entry\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.2.elementCondition.fieldContext','\"global\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.2.fieldUid','\"62534679-40fc-45ab-9544-cbced2386fe8\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.2.handle','\"catThumbnail\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.2.includeInCards','false'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.2.instructions','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.2.label','\"Category List Thumbnail\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.2.providesThumbs','false'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.2.required','false'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.2.tip','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.2.uid','\"4da7212b-b18b-4781-897d-15da4c3d2e9b\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.2.userCondition','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.2.warning','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.2.width','100'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.3.dateAdded','\"2025-06-25T11:37:41+00:00\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.3.editCondition','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.3.elementCondition','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.3.fieldUid','\"ca7c778b-1c9d-4e2a-83a5-984c98a48619\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.3.handle','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.3.includeInCards','false'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.3.instructions','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.3.label','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.3.providesThumbs','false'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.3.required','false'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.3.tip','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.3.uid','\"ae048562-06fd-49b7-9e60-b3c9bb5b6a39\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.3.userCondition','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.3.warning','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.elements.3.width','100'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.name','\"Content\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.uid','\"10660604-256e-4d24-8d61-fe82fc1abc6d\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.fieldLayouts.a5fa8273-9c26-4652-a2dc-7fc9c7ee4168.tabs.0.userCondition','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.handle','\"equipmentPageContent\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.hasTitleField','true'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.icon','\"anchor\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.name','\"Equipment Page Content\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.showSlugField','true'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.showStatusField','true'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.slugTranslationKeyFormat','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.slugTranslationMethod','\"site\"'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.titleFormat','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.titleTranslationKeyFormat','null'),('entryTypes.e6ecaa86-d570-4965-b85f-62c9ff23b0d7.titleTranslationMethod','\"site\"'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.color','null'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.fieldLayouts.2de2ddc7-407b-467a-a709-14e3f6125078.tabs.0.elementCondition','null'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.fieldLayouts.2de2ddc7-407b-467a-a709-14e3f6125078.tabs.0.elements.0.dateAdded','\"2025-06-20T15:49:11+00:00\"'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.fieldLayouts.2de2ddc7-407b-467a-a709-14e3f6125078.tabs.0.elements.0.editCondition','null'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.fieldLayouts.2de2ddc7-407b-467a-a709-14e3f6125078.tabs.0.elements.0.elementCondition','null'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.fieldLayouts.2de2ddc7-407b-467a-a709-14e3f6125078.tabs.0.elements.0.fieldUid','\"208b59dc-efeb-404c-98f2-6ec660879ee1\"'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.fieldLayouts.2de2ddc7-407b-467a-a709-14e3f6125078.tabs.0.elements.0.handle','null'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.fieldLayouts.2de2ddc7-407b-467a-a709-14e3f6125078.tabs.0.elements.0.includeInCards','true'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.fieldLayouts.2de2ddc7-407b-467a-a709-14e3f6125078.tabs.0.elements.0.instructions','null'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.fieldLayouts.2de2ddc7-407b-467a-a709-14e3f6125078.tabs.0.elements.0.label','null'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.fieldLayouts.2de2ddc7-407b-467a-a709-14e3f6125078.tabs.0.elements.0.providesThumbs','false'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.fieldLayouts.2de2ddc7-407b-467a-a709-14e3f6125078.tabs.0.elements.0.required','false'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.fieldLayouts.2de2ddc7-407b-467a-a709-14e3f6125078.tabs.0.elements.0.tip','null'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.fieldLayouts.2de2ddc7-407b-467a-a709-14e3f6125078.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.fieldLayouts.2de2ddc7-407b-467a-a709-14e3f6125078.tabs.0.elements.0.uid','\"907b0b2d-32ac-4a0b-a932-267eb2efe235\"'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.fieldLayouts.2de2ddc7-407b-467a-a709-14e3f6125078.tabs.0.elements.0.userCondition','null'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.fieldLayouts.2de2ddc7-407b-467a-a709-14e3f6125078.tabs.0.elements.0.warning','null'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.fieldLayouts.2de2ddc7-407b-467a-a709-14e3f6125078.tabs.0.elements.0.width','100'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.fieldLayouts.2de2ddc7-407b-467a-a709-14e3f6125078.tabs.0.name','\"Content\"'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.fieldLayouts.2de2ddc7-407b-467a-a709-14e3f6125078.tabs.0.uid','\"78ec9a6e-495c-4ee1-926c-b6af4ec2a03a\"'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.fieldLayouts.2de2ddc7-407b-467a-a709-14e3f6125078.tabs.0.userCondition','null'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.handle','\"singleLink\"'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.hasTitleField','false'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.icon','\"link\"'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.name','\"Single Link\"'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.showSlugField','true'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.showStatusField','true'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.slugTranslationKeyFormat','null'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.slugTranslationMethod','\"site\"'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.titleFormat','null'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.titleTranslationKeyFormat','null'),('entryTypes.efb6f34c-41f5-4d47-bda7-2f96b491d19c.titleTranslationMethod','\"site\"'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.color','null'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.fieldLayouts.a3bde020-da74-47bc-8944-80b00a7e9b6d.tabs.0.elementCondition','null'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.fieldLayouts.a3bde020-da74-47bc-8944-80b00a7e9b6d.tabs.0.elements.0.dateAdded','\"2025-06-25T11:33:43+00:00\"'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.fieldLayouts.a3bde020-da74-47bc-8944-80b00a7e9b6d.tabs.0.elements.0.editCondition','null'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.fieldLayouts.a3bde020-da74-47bc-8944-80b00a7e9b6d.tabs.0.elements.0.elementCondition','null'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.fieldLayouts.a3bde020-da74-47bc-8944-80b00a7e9b6d.tabs.0.elements.0.fieldUid','\"27b88dbb-5275-488c-8cb3-86e8daa4b84f\"'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.fieldLayouts.a3bde020-da74-47bc-8944-80b00a7e9b6d.tabs.0.elements.0.handle','null'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.fieldLayouts.a3bde020-da74-47bc-8944-80b00a7e9b6d.tabs.0.elements.0.includeInCards','false'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.fieldLayouts.a3bde020-da74-47bc-8944-80b00a7e9b6d.tabs.0.elements.0.instructions','null'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.fieldLayouts.a3bde020-da74-47bc-8944-80b00a7e9b6d.tabs.0.elements.0.label','null'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.fieldLayouts.a3bde020-da74-47bc-8944-80b00a7e9b6d.tabs.0.elements.0.providesThumbs','false'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.fieldLayouts.a3bde020-da74-47bc-8944-80b00a7e9b6d.tabs.0.elements.0.required','false'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.fieldLayouts.a3bde020-da74-47bc-8944-80b00a7e9b6d.tabs.0.elements.0.tip','null'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.fieldLayouts.a3bde020-da74-47bc-8944-80b00a7e9b6d.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.fieldLayouts.a3bde020-da74-47bc-8944-80b00a7e9b6d.tabs.0.elements.0.uid','\"929d512f-14b2-4a4b-81bb-b58c7fd2e5dd\"'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.fieldLayouts.a3bde020-da74-47bc-8944-80b00a7e9b6d.tabs.0.elements.0.userCondition','null'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.fieldLayouts.a3bde020-da74-47bc-8944-80b00a7e9b6d.tabs.0.elements.0.warning','null'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.fieldLayouts.a3bde020-da74-47bc-8944-80b00a7e9b6d.tabs.0.elements.0.width','100'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.fieldLayouts.a3bde020-da74-47bc-8944-80b00a7e9b6d.tabs.0.name','\"Content\"'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.fieldLayouts.a3bde020-da74-47bc-8944-80b00a7e9b6d.tabs.0.uid','\"4a662de5-1fc0-42a3-ae45-c68ca31626ce\"'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.fieldLayouts.a3bde020-da74-47bc-8944-80b00a7e9b6d.tabs.0.userCondition','null'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.handle','\"equipmentPageType\"'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.hasTitleField','false'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.icon','null'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.name','\"Equipment Page Type\"'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.showSlugField','true'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.showStatusField','true'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.slugTranslationKeyFormat','null'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.slugTranslationMethod','\"site\"'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.titleFormat','null'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.titleTranslationKeyFormat','null'),('entryTypes.efe6c18d-5435-400c-92da-48306d6a6da9.titleTranslationMethod','\"site\"'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.color','null'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elementCondition','null'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.0.dateAdded','\"2025-06-24T10:50:53+00:00\"'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.0.editCondition','null'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.0.elementCondition','null'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.0.fieldUid','\"62534679-40fc-45ab-9544-cbced2386fe8\"'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.0.handle','\"backgroundImage\"'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.0.includeInCards','false'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.0.instructions','null'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.0.label','\"Background Image\"'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.0.providesThumbs','false'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.0.required','false'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.0.tip','null'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.0.uid','\"ce108292-a428-4690-8c1a-18857f118010\"'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.0.userCondition','null'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.0.warning','null'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.0.width','100'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.1.dateAdded','\"2025-06-24T10:50:53+00:00\"'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.1.editCondition','null'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.1.elementCondition','null'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.1.fieldUid','\"62534679-40fc-45ab-9544-cbced2386fe8\"'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.1.handle','\"logo\"'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.1.includeInCards','false'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.1.instructions','null'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.1.label','\"Logo\"'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.1.providesThumbs','false'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.1.required','false'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.1.tip','null'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.1.uid','\"455e3759-a800-4724-9708-7c9be2a69c23\"'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.1.userCondition','null'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.1.warning','null'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.1.width','100'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.2.dateAdded','\"2025-06-24T10:50:53+00:00\"'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.2.editCondition','null'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.2.elementCondition','null'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.2.fieldUid','\"208b59dc-efeb-404c-98f2-6ec660879ee1\"'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.2.handle','null'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.2.includeInCards','false'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.2.instructions','null'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.2.label','\"Link\"'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.2.providesThumbs','false'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.2.required','false'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.2.tip','null'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.2.uid','\"9f00ec96-6c2a-4c18-8826-cf60eaae44fb\"'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.2.userCondition','null'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.2.warning','null'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.elements.2.width','100'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.name','\"Content\"'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.uid','\"5d324fa7-833e-4b79-8563-ecab4ce6b961\"'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.fieldLayouts.c544b1c1-a22d-4262-9987-b89dc498ff14.tabs.0.userCondition','null'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.handle','\"equipmentCard\"'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.hasTitleField','false'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.icon','\"screwdriver-wrench\"'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.name','\"Equipment Card\"'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.showSlugField','true'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.showStatusField','true'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.slugTranslationKeyFormat','null'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.slugTranslationMethod','\"site\"'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.titleFormat','null'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.titleTranslationKeyFormat','null'),('entryTypes.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177.titleTranslationMethod','\"site\"'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.color','null'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.fieldLayouts.afd1c876-bda0-441a-83f6-4af85c23cc16.tabs.0.elementCondition','null'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.fieldLayouts.afd1c876-bda0-441a-83f6-4af85c23cc16.tabs.0.elements.0.dateAdded','\"2025-06-25T09:14:52+00:00\"'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.fieldLayouts.afd1c876-bda0-441a-83f6-4af85c23cc16.tabs.0.elements.0.editCondition','null'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.fieldLayouts.afd1c876-bda0-441a-83f6-4af85c23cc16.tabs.0.elements.0.elementCondition','null'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.fieldLayouts.afd1c876-bda0-441a-83f6-4af85c23cc16.tabs.0.elements.0.fieldUid','\"31515169-58e5-4fdf-b1f0-0060aba7da2f\"'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.fieldLayouts.afd1c876-bda0-441a-83f6-4af85c23cc16.tabs.0.elements.0.handle','null'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.fieldLayouts.afd1c876-bda0-441a-83f6-4af85c23cc16.tabs.0.elements.0.includeInCards','false'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.fieldLayouts.afd1c876-bda0-441a-83f6-4af85c23cc16.tabs.0.elements.0.instructions','null'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.fieldLayouts.afd1c876-bda0-441a-83f6-4af85c23cc16.tabs.0.elements.0.label','null'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.fieldLayouts.afd1c876-bda0-441a-83f6-4af85c23cc16.tabs.0.elements.0.providesThumbs','false'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.fieldLayouts.afd1c876-bda0-441a-83f6-4af85c23cc16.tabs.0.elements.0.required','false'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.fieldLayouts.afd1c876-bda0-441a-83f6-4af85c23cc16.tabs.0.elements.0.tip','null'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.fieldLayouts.afd1c876-bda0-441a-83f6-4af85c23cc16.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.fieldLayouts.afd1c876-bda0-441a-83f6-4af85c23cc16.tabs.0.elements.0.uid','\"7eb799bd-8348-499e-a883-7fbf7837d421\"'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.fieldLayouts.afd1c876-bda0-441a-83f6-4af85c23cc16.tabs.0.elements.0.userCondition','null'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.fieldLayouts.afd1c876-bda0-441a-83f6-4af85c23cc16.tabs.0.elements.0.warning','null'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.fieldLayouts.afd1c876-bda0-441a-83f6-4af85c23cc16.tabs.0.elements.0.width','100'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.fieldLayouts.afd1c876-bda0-441a-83f6-4af85c23cc16.tabs.0.name','\"Content\"'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.fieldLayouts.afd1c876-bda0-441a-83f6-4af85c23cc16.tabs.0.uid','\"e9315285-489c-4511-aab3-8b7a252046ee\"'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.fieldLayouts.afd1c876-bda0-441a-83f6-4af85c23cc16.tabs.0.userCondition','null'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.handle','\"newsletterSignupBanner\"'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.hasTitleField','false'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.icon','\"envelope-open-text\"'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.name','\"Newsletter Signup Banner\"'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.showSlugField','true'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.showStatusField','true'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.slugTranslationKeyFormat','null'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.slugTranslationMethod','\"site\"'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.titleFormat','null'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.titleTranslationKeyFormat','null'),('entryTypes.f9651f2a-e0c5-420e-bcd0-60892652fbcd.titleTranslationMethod','\"site\"'),('fields.0b7df609-3386-44d6-8dec-9236996e999a.columnSuffix','null'),('fields.0b7df609-3386-44d6-8dec-9236996e999a.handle','\"linkList\"'),('fields.0b7df609-3386-44d6-8dec-9236996e999a.instructions','null'),('fields.0b7df609-3386-44d6-8dec-9236996e999a.name','\"Link List\"'),('fields.0b7df609-3386-44d6-8dec-9236996e999a.searchable','false'),('fields.0b7df609-3386-44d6-8dec-9236996e999a.settings.allowSelfRelations','false'),('fields.0b7df609-3386-44d6-8dec-9236996e999a.settings.branchLimit','null'),('fields.0b7df609-3386-44d6-8dec-9236996e999a.settings.defaultPlacement','\"end\"'),('fields.0b7df609-3386-44d6-8dec-9236996e999a.settings.maintainHierarchy','false'),('fields.0b7df609-3386-44d6-8dec-9236996e999a.settings.maxRelations','null'),('fields.0b7df609-3386-44d6-8dec-9236996e999a.settings.minRelations','1'),('fields.0b7df609-3386-44d6-8dec-9236996e999a.settings.selectionLabel','null'),('fields.0b7df609-3386-44d6-8dec-9236996e999a.settings.showCardsInGrid','false'),('fields.0b7df609-3386-44d6-8dec-9236996e999a.settings.showSiteMenu','false'),('fields.0b7df609-3386-44d6-8dec-9236996e999a.settings.showUnpermittedEntries','false'),('fields.0b7df609-3386-44d6-8dec-9236996e999a.settings.showUnpermittedSections','false'),('fields.0b7df609-3386-44d6-8dec-9236996e999a.settings.sources','\"*\"'),('fields.0b7df609-3386-44d6-8dec-9236996e999a.settings.targetSiteId','null'),('fields.0b7df609-3386-44d6-8dec-9236996e999a.settings.validateRelatedElements','false'),('fields.0b7df609-3386-44d6-8dec-9236996e999a.settings.viewMode','\"list\"'),('fields.0b7df609-3386-44d6-8dec-9236996e999a.translationKeyFormat','null'),('fields.0b7df609-3386-44d6-8dec-9236996e999a.translationMethod','\"none\"'),('fields.0b7df609-3386-44d6-8dec-9236996e999a.type','\"craft\\\\fields\\\\Entries\"'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.columnSuffix','null'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.handle','\"singleLink\"'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.instructions','null'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.name','\"Single Link\"'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.searchable','false'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.settings.advancedFields.0','\"target\"'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.settings.advancedFields.1','\"class\"'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.settings.fullGraphqlData','false'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.settings.maxLength','255'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.settings.showLabelField','true'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.settings.types.0','\"entry\"'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.settings.types.1','\"url\"'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.settings.types.2','\"email\"'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.settings.types.3','\"tel\"'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.settings.typeSettings.__assoc__.0.0','\"entry\"'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.settings.typeSettings.__assoc__.0.1.__assoc__.0.0','\"sources\"'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.settings.typeSettings.__assoc__.0.1.__assoc__.0.1','\"*\"'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.settings.typeSettings.__assoc__.0.1.__assoc__.1.0','\"showUnpermittedSections\"'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.settings.typeSettings.__assoc__.0.1.__assoc__.1.1','\"\"'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.settings.typeSettings.__assoc__.0.1.__assoc__.2.0','\"showUnpermittedEntries\"'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.settings.typeSettings.__assoc__.0.1.__assoc__.2.1','\"\"'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.settings.typeSettings.__assoc__.1.0','\"url\"'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.settings.typeSettings.__assoc__.1.1.__assoc__.0.0','\"allowRootRelativeUrls\"'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.settings.typeSettings.__assoc__.1.1.__assoc__.0.1','\"\"'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.settings.typeSettings.__assoc__.1.1.__assoc__.1.0','\"allowAnchors\"'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.settings.typeSettings.__assoc__.1.1.__assoc__.1.1','\"\"'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.settings.typeSettings.__assoc__.1.1.__assoc__.2.0','\"allowCustomSchemes\"'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.settings.typeSettings.__assoc__.1.1.__assoc__.2.1','\"\"'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.translationKeyFormat','null'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.translationMethod','\"none\"'),('fields.208b59dc-efeb-404c-98f2-6ec660879ee1.type','\"craft\\\\fields\\\\Link\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.columnSuffix','null'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.handle','\"equipmentPageType\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.instructions','null'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.name','\"Equipment Page Type\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.searchable','false'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.customOptions','false'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.iconsOnly','false'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.0.__assoc__.0.0','\"label\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.0.__assoc__.0.1','\"Main Parent (Equipment List Page)\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.0.__assoc__.1.0','\"value\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.0.__assoc__.1.1','\"mainParent\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.0.__assoc__.2.0','\"icon\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.0.__assoc__.2.1','\"\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.0.__assoc__.3.0','\"default\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.0.__assoc__.3.1','\"\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.1.__assoc__.0.0','\"label\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.1.__assoc__.0.1','\"Category Listing Page\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.1.__assoc__.1.0','\"value\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.1.__assoc__.1.1','\"categoryListingPage\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.1.__assoc__.2.0','\"icon\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.1.__assoc__.2.1','\"\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.1.__assoc__.3.0','\"default\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.1.__assoc__.3.1','\"\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.2.__assoc__.0.0','\"label\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.2.__assoc__.0.1','\"Product Listing Page\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.2.__assoc__.1.0','\"value\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.2.__assoc__.1.1','\"productListingPage\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.2.__assoc__.2.0','\"icon\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.2.__assoc__.2.1','\"\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.2.__assoc__.3.0','\"default\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.2.__assoc__.3.1','\"1\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.3.__assoc__.0.0','\"label\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.3.__assoc__.0.1','\"Product Individual Page\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.3.__assoc__.1.0','\"value\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.3.__assoc__.1.1','\"productIndividualPage\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.3.__assoc__.2.0','\"icon\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.3.__assoc__.2.1','\"\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.3.__assoc__.3.0','\"default\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.settings.options.3.__assoc__.3.1','\"\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.translationKeyFormat','null'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.translationMethod','\"none\"'),('fields.27b88dbb-5275-488c-8cb3-86e8daa4b84f.type','\"craft\\\\fields\\\\ButtonGroup\"'),('fields.31515169-58e5-4fdf-b1f0-0060aba7da2f.columnSuffix','null'),('fields.31515169-58e5-4fdf-b1f0-0060aba7da2f.handle','\"subtext\"'),('fields.31515169-58e5-4fdf-b1f0-0060aba7da2f.instructions','null'),('fields.31515169-58e5-4fdf-b1f0-0060aba7da2f.name','\"Subtext\"'),('fields.31515169-58e5-4fdf-b1f0-0060aba7da2f.searchable','true'),('fields.31515169-58e5-4fdf-b1f0-0060aba7da2f.settings.availableTransforms','\"\"'),('fields.31515169-58e5-4fdf-b1f0-0060aba7da2f.settings.availableVolumes','\"*\"'),('fields.31515169-58e5-4fdf-b1f0-0060aba7da2f.settings.characterLimit','null'),('fields.31515169-58e5-4fdf-b1f0-0060aba7da2f.settings.ckeConfig','\"09043f1e-ea69-4028-8ca3-5f75660d3d3d\"'),('fields.31515169-58e5-4fdf-b1f0-0060aba7da2f.settings.createButtonLabel','null'),('fields.31515169-58e5-4fdf-b1f0-0060aba7da2f.settings.defaultTransform','null'),('fields.31515169-58e5-4fdf-b1f0-0060aba7da2f.settings.expandEntryButtons','false'),('fields.31515169-58e5-4fdf-b1f0-0060aba7da2f.settings.fullGraphqlData','true'),('fields.31515169-58e5-4fdf-b1f0-0060aba7da2f.settings.parseEmbeds','false'),('fields.31515169-58e5-4fdf-b1f0-0060aba7da2f.settings.purifierConfig','null'),('fields.31515169-58e5-4fdf-b1f0-0060aba7da2f.settings.purifyHtml','true'),('fields.31515169-58e5-4fdf-b1f0-0060aba7da2f.settings.showUnpermittedFiles','false'),('fields.31515169-58e5-4fdf-b1f0-0060aba7da2f.settings.showUnpermittedVolumes','false'),('fields.31515169-58e5-4fdf-b1f0-0060aba7da2f.settings.showWordCount','false'),('fields.31515169-58e5-4fdf-b1f0-0060aba7da2f.settings.sourceEditingGroups.0','\"__ADMINS__\"'),('fields.31515169-58e5-4fdf-b1f0-0060aba7da2f.settings.wordLimit','null'),('fields.31515169-58e5-4fdf-b1f0-0060aba7da2f.translationKeyFormat','null'),('fields.31515169-58e5-4fdf-b1f0-0060aba7da2f.translationMethod','\"none\"'),('fields.31515169-58e5-4fdf-b1f0-0060aba7da2f.type','\"craft\\\\ckeditor\\\\Field\"'),('fields.46e91064-492e-4832-8b32-9ea816047e2d.columnSuffix','null'),('fields.46e91064-492e-4832-8b32-9ea816047e2d.handle','\"heading\"'),('fields.46e91064-492e-4832-8b32-9ea816047e2d.instructions','null'),('fields.46e91064-492e-4832-8b32-9ea816047e2d.name','\"Heading\"'),('fields.46e91064-492e-4832-8b32-9ea816047e2d.searchable','true'),('fields.46e91064-492e-4832-8b32-9ea816047e2d.settings.availableTransforms','\"\"'),('fields.46e91064-492e-4832-8b32-9ea816047e2d.settings.availableVolumes','\"*\"'),('fields.46e91064-492e-4832-8b32-9ea816047e2d.settings.characterLimit','null'),('fields.46e91064-492e-4832-8b32-9ea816047e2d.settings.ckeConfig','\"26919202-5503-4b47-913f-a7b707940ad8\"'),('fields.46e91064-492e-4832-8b32-9ea816047e2d.settings.createButtonLabel','null'),('fields.46e91064-492e-4832-8b32-9ea816047e2d.settings.defaultTransform','null'),('fields.46e91064-492e-4832-8b32-9ea816047e2d.settings.expandEntryButtons','false'),('fields.46e91064-492e-4832-8b32-9ea816047e2d.settings.fullGraphqlData','false'),('fields.46e91064-492e-4832-8b32-9ea816047e2d.settings.parseEmbeds','false'),('fields.46e91064-492e-4832-8b32-9ea816047e2d.settings.purifierConfig','null'),('fields.46e91064-492e-4832-8b32-9ea816047e2d.settings.purifyHtml','true'),('fields.46e91064-492e-4832-8b32-9ea816047e2d.settings.showUnpermittedFiles','false'),('fields.46e91064-492e-4832-8b32-9ea816047e2d.settings.showUnpermittedVolumes','false'),('fields.46e91064-492e-4832-8b32-9ea816047e2d.settings.showWordCount','false'),('fields.46e91064-492e-4832-8b32-9ea816047e2d.settings.sourceEditingGroups.0','\"__ADMINS__\"'),('fields.46e91064-492e-4832-8b32-9ea816047e2d.settings.wordLimit','null'),('fields.46e91064-492e-4832-8b32-9ea816047e2d.translationKeyFormat','null'),('fields.46e91064-492e-4832-8b32-9ea816047e2d.translationMethod','\"none\"'),('fields.46e91064-492e-4832-8b32-9ea816047e2d.type','\"craft\\\\ckeditor\\\\Field\"'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.columnSuffix','null'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.handle','\"media\"'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.instructions','null'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.name','\"Media\"'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.searchable','false'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.settings.allowedKinds.0','\"image\"'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.settings.allowedKinds.1','\"video\"'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.settings.allowSelfRelations','false'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.settings.allowSubfolders','false'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.settings.allowUploads','true'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.settings.branchLimit','null'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.settings.defaultPlacement','\"end\"'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.settings.defaultUploadLocationSource','\"volume:f455cfbd-b7d8-4140-a7d2-4121bb10fbbd\"'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.settings.defaultUploadLocationSubpath','null'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.settings.maintainHierarchy','false'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.settings.maxRelations','1'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.settings.minRelations','1'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.settings.previewMode','\"full\"'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.settings.restrictedDefaultUploadSubpath','null'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.settings.restrictedLocationSource','\"volume:f455cfbd-b7d8-4140-a7d2-4121bb10fbbd\"'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.settings.restrictedLocationSubpath','null'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.settings.restrictFiles','true'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.settings.restrictLocation','false'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.settings.selectionLabel','null'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.settings.showCardsInGrid','false'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.settings.showSiteMenu','true'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.settings.showUnpermittedFiles','false'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.settings.showUnpermittedVolumes','false'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.settings.sources','\"*\"'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.settings.targetSiteId','null'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.settings.validateRelatedElements','false'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.settings.viewMode','\"list\"'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.translationKeyFormat','null'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.translationMethod','\"none\"'),('fields.62534679-40fc-45ab-9544-cbced2386fe8.type','\"craft\\\\fields\\\\Assets\"'),('fields.69332d09-4481-4eaf-9f75-241fbd7f5211.columnSuffix','null'),('fields.69332d09-4481-4eaf-9f75-241fbd7f5211.handle','\"megamenuContent\"'),('fields.69332d09-4481-4eaf-9f75-241fbd7f5211.instructions','null'),('fields.69332d09-4481-4eaf-9f75-241fbd7f5211.name','\"Megamenu Content\"'),('fields.69332d09-4481-4eaf-9f75-241fbd7f5211.searchable','false'),('fields.69332d09-4481-4eaf-9f75-241fbd7f5211.settings.createButtonLabel','\"New Column\"'),('fields.69332d09-4481-4eaf-9f75-241fbd7f5211.settings.defaultIndexViewMode','\"cards\"'),('fields.69332d09-4481-4eaf-9f75-241fbd7f5211.settings.enableVersioning','false'),('fields.69332d09-4481-4eaf-9f75-241fbd7f5211.settings.entryTypes.0.__assoc__.0.0','\"uid\"'),('fields.69332d09-4481-4eaf-9f75-241fbd7f5211.settings.entryTypes.0.__assoc__.0.1','\"a92e5168-e1b1-4553-88ea-8b38892b8c65\"'),('fields.69332d09-4481-4eaf-9f75-241fbd7f5211.settings.includeTableView','false'),('fields.69332d09-4481-4eaf-9f75-241fbd7f5211.settings.maxEntries','null'),('fields.69332d09-4481-4eaf-9f75-241fbd7f5211.settings.minEntries','1'),('fields.69332d09-4481-4eaf-9f75-241fbd7f5211.settings.pageSize','50'),('fields.69332d09-4481-4eaf-9f75-241fbd7f5211.settings.propagationKeyFormat','null'),('fields.69332d09-4481-4eaf-9f75-241fbd7f5211.settings.propagationMethod','\"all\"'),('fields.69332d09-4481-4eaf-9f75-241fbd7f5211.settings.showCardsInGrid','false'),('fields.69332d09-4481-4eaf-9f75-241fbd7f5211.settings.viewMode','\"cards\"'),('fields.69332d09-4481-4eaf-9f75-241fbd7f5211.translationKeyFormat','null'),('fields.69332d09-4481-4eaf-9f75-241fbd7f5211.translationMethod','\"site\"'),('fields.69332d09-4481-4eaf-9f75-241fbd7f5211.type','\"craft\\\\fields\\\\Matrix\"'),('fields.741d13d8-7c1b-4440-a507-1b6478eb6736.columnSuffix','null'),('fields.741d13d8-7c1b-4440-a507-1b6478eb6736.handle','\"fiftyFiftyRepeater\"'),('fields.741d13d8-7c1b-4440-a507-1b6478eb6736.instructions','null'),('fields.741d13d8-7c1b-4440-a507-1b6478eb6736.name','\"Fifty Fifty Repeater\"'),('fields.741d13d8-7c1b-4440-a507-1b6478eb6736.searchable','false'),('fields.741d13d8-7c1b-4440-a507-1b6478eb6736.settings.createButtonLabel','null'),('fields.741d13d8-7c1b-4440-a507-1b6478eb6736.settings.defaultIndexViewMode','\"cards\"'),('fields.741d13d8-7c1b-4440-a507-1b6478eb6736.settings.enableVersioning','false'),('fields.741d13d8-7c1b-4440-a507-1b6478eb6736.settings.entryTypes.0.__assoc__.0.0','\"uid\"'),('fields.741d13d8-7c1b-4440-a507-1b6478eb6736.settings.entryTypes.0.__assoc__.0.1','\"0de456be-e57c-491d-b5e9-2a48c94a73cf\"'),('fields.741d13d8-7c1b-4440-a507-1b6478eb6736.settings.includeTableView','false'),('fields.741d13d8-7c1b-4440-a507-1b6478eb6736.settings.maxEntries','null'),('fields.741d13d8-7c1b-4440-a507-1b6478eb6736.settings.minEntries','1'),('fields.741d13d8-7c1b-4440-a507-1b6478eb6736.settings.pageSize','null'),('fields.741d13d8-7c1b-4440-a507-1b6478eb6736.settings.propagationKeyFormat','null'),('fields.741d13d8-7c1b-4440-a507-1b6478eb6736.settings.propagationMethod','\"all\"'),('fields.741d13d8-7c1b-4440-a507-1b6478eb6736.settings.showCardsInGrid','false'),('fields.741d13d8-7c1b-4440-a507-1b6478eb6736.settings.viewMode','\"blocks\"'),('fields.741d13d8-7c1b-4440-a507-1b6478eb6736.translationKeyFormat','null'),('fields.741d13d8-7c1b-4440-a507-1b6478eb6736.translationMethod','\"site\"'),('fields.741d13d8-7c1b-4440-a507-1b6478eb6736.type','\"craft\\\\fields\\\\Matrix\"'),('fields.75c37449-5a52-49a5-9e4a-f3533695f300.columnSuffix','null'),('fields.75c37449-5a52-49a5-9e4a-f3533695f300.handle','\"navigation\"'),('fields.75c37449-5a52-49a5-9e4a-f3533695f300.instructions','null'),('fields.75c37449-5a52-49a5-9e4a-f3533695f300.name','\"Navigation\"'),('fields.75c37449-5a52-49a5-9e4a-f3533695f300.searchable','false'),('fields.75c37449-5a52-49a5-9e4a-f3533695f300.settings.createButtonLabel','null'),('fields.75c37449-5a52-49a5-9e4a-f3533695f300.settings.defaultIndexViewMode','\"cards\"'),('fields.75c37449-5a52-49a5-9e4a-f3533695f300.settings.enableVersioning','false'),('fields.75c37449-5a52-49a5-9e4a-f3533695f300.settings.entryTypes.0.__assoc__.0.0','\"uid\"'),('fields.75c37449-5a52-49a5-9e4a-f3533695f300.settings.entryTypes.0.__assoc__.0.1','\"efb6f34c-41f5-4d47-bda7-2f96b491d19c\"'),('fields.75c37449-5a52-49a5-9e4a-f3533695f300.settings.entryTypes.1.__assoc__.0.0','\"uid\"'),('fields.75c37449-5a52-49a5-9e4a-f3533695f300.settings.entryTypes.1.__assoc__.0.1','\"cb061430-787b-48ea-8a9b-c7980d0134b9\"'),('fields.75c37449-5a52-49a5-9e4a-f3533695f300.settings.includeTableView','false'),('fields.75c37449-5a52-49a5-9e4a-f3533695f300.settings.maxEntries','null'),('fields.75c37449-5a52-49a5-9e4a-f3533695f300.settings.minEntries','null'),('fields.75c37449-5a52-49a5-9e4a-f3533695f300.settings.pageSize','50'),('fields.75c37449-5a52-49a5-9e4a-f3533695f300.settings.propagationKeyFormat','null'),('fields.75c37449-5a52-49a5-9e4a-f3533695f300.settings.propagationMethod','\"all\"'),('fields.75c37449-5a52-49a5-9e4a-f3533695f300.settings.showCardsInGrid','false'),('fields.75c37449-5a52-49a5-9e4a-f3533695f300.settings.viewMode','\"cards\"'),('fields.75c37449-5a52-49a5-9e4a-f3533695f300.translationKeyFormat','null'),('fields.75c37449-5a52-49a5-9e4a-f3533695f300.translationMethod','\"site\"'),('fields.75c37449-5a52-49a5-9e4a-f3533695f300.type','\"craft\\\\fields\\\\Matrix\"'),('fields.bcded55c-424c-4973-b666-df8c107909d2.columnSuffix','null'),('fields.bcded55c-424c-4973-b666-df8c107909d2.handle','\"equipmentCards\"'),('fields.bcded55c-424c-4973-b666-df8c107909d2.instructions','null'),('fields.bcded55c-424c-4973-b666-df8c107909d2.name','\"Equipment Cards\"'),('fields.bcded55c-424c-4973-b666-df8c107909d2.searchable','false'),('fields.bcded55c-424c-4973-b666-df8c107909d2.settings.createButtonLabel','null'),('fields.bcded55c-424c-4973-b666-df8c107909d2.settings.defaultIndexViewMode','\"cards\"'),('fields.bcded55c-424c-4973-b666-df8c107909d2.settings.enableVersioning','false'),('fields.bcded55c-424c-4973-b666-df8c107909d2.settings.entryTypes.0.__assoc__.0.0','\"uid\"'),('fields.bcded55c-424c-4973-b666-df8c107909d2.settings.entryTypes.0.__assoc__.0.1','\"f0170a2a-3987-4b96-a0b8-e2f4c9b4f177\"'),('fields.bcded55c-424c-4973-b666-df8c107909d2.settings.includeTableView','false'),('fields.bcded55c-424c-4973-b666-df8c107909d2.settings.maxEntries','2'),('fields.bcded55c-424c-4973-b666-df8c107909d2.settings.minEntries','2'),('fields.bcded55c-424c-4973-b666-df8c107909d2.settings.pageSize','null'),('fields.bcded55c-424c-4973-b666-df8c107909d2.settings.propagationKeyFormat','null'),('fields.bcded55c-424c-4973-b666-df8c107909d2.settings.propagationMethod','\"all\"'),('fields.bcded55c-424c-4973-b666-df8c107909d2.settings.showCardsInGrid','false'),('fields.bcded55c-424c-4973-b666-df8c107909d2.settings.viewMode','\"blocks\"'),('fields.bcded55c-424c-4973-b666-df8c107909d2.translationKeyFormat','null'),('fields.bcded55c-424c-4973-b666-df8c107909d2.translationMethod','\"site\"'),('fields.bcded55c-424c-4973-b666-df8c107909d2.type','\"craft\\\\fields\\\\Matrix\"'),('fields.ca7c778b-1c9d-4e2a-83a5-984c98a48619.columnSuffix','null'),('fields.ca7c778b-1c9d-4e2a-83a5-984c98a48619.handle','\"mainContent\"'),('fields.ca7c778b-1c9d-4e2a-83a5-984c98a48619.instructions','null'),('fields.ca7c778b-1c9d-4e2a-83a5-984c98a48619.name','\"Main Content\"'),('fields.ca7c778b-1c9d-4e2a-83a5-984c98a48619.searchable','true'),('fields.ca7c778b-1c9d-4e2a-83a5-984c98a48619.settings.createButtonLabel','null'),('fields.ca7c778b-1c9d-4e2a-83a5-984c98a48619.settings.defaultIndexViewMode','\"cards\"'),('fields.ca7c778b-1c9d-4e2a-83a5-984c98a48619.settings.enableVersioning','true'),('fields.ca7c778b-1c9d-4e2a-83a5-984c98a48619.settings.entryTypes.0.__assoc__.0.0','\"uid\"'),('fields.ca7c778b-1c9d-4e2a-83a5-984c98a48619.settings.entryTypes.0.__assoc__.0.1','\"20033fea-bd0d-4a3e-ad47-9f84788a37db\"'),('fields.ca7c778b-1c9d-4e2a-83a5-984c98a48619.settings.entryTypes.1.__assoc__.0.0','\"uid\"'),('fields.ca7c778b-1c9d-4e2a-83a5-984c98a48619.settings.entryTypes.1.__assoc__.0.1','\"674fb744-b160-444b-af35-72f3a327afbf\"'),('fields.ca7c778b-1c9d-4e2a-83a5-984c98a48619.settings.entryTypes.2.__assoc__.0.0','\"uid\"'),('fields.ca7c778b-1c9d-4e2a-83a5-984c98a48619.settings.entryTypes.2.__assoc__.0.1','\"cdb88818-0242-4279-92e9-21a22e0931cb\"'),('fields.ca7c778b-1c9d-4e2a-83a5-984c98a48619.settings.entryTypes.3.__assoc__.0.0','\"uid\"'),('fields.ca7c778b-1c9d-4e2a-83a5-984c98a48619.settings.entryTypes.3.__assoc__.0.1','\"f9651f2a-e0c5-420e-bcd0-60892652fbcd\"'),('fields.ca7c778b-1c9d-4e2a-83a5-984c98a48619.settings.entryTypes.4.__assoc__.0.0','\"uid\"'),('fields.ca7c778b-1c9d-4e2a-83a5-984c98a48619.settings.entryTypes.4.__assoc__.0.1','\"e1d477b7-f94e-41e1-94f9-0a657534d3eb\"'),('fields.ca7c778b-1c9d-4e2a-83a5-984c98a48619.settings.includeTableView','false'),('fields.ca7c778b-1c9d-4e2a-83a5-984c98a48619.settings.maxEntries','null'),('fields.ca7c778b-1c9d-4e2a-83a5-984c98a48619.settings.minEntries','null'),('fields.ca7c778b-1c9d-4e2a-83a5-984c98a48619.settings.pageSize','50'),('fields.ca7c778b-1c9d-4e2a-83a5-984c98a48619.settings.propagationKeyFormat','null'),('fields.ca7c778b-1c9d-4e2a-83a5-984c98a48619.settings.propagationMethod','\"all\"'),('fields.ca7c778b-1c9d-4e2a-83a5-984c98a48619.settings.showCardsInGrid','false'),('fields.ca7c778b-1c9d-4e2a-83a5-984c98a48619.settings.viewMode','\"cards\"'),('fields.ca7c778b-1c9d-4e2a-83a5-984c98a48619.translationKeyFormat','null'),('fields.ca7c778b-1c9d-4e2a-83a5-984c98a48619.translationMethod','\"site\"'),('fields.ca7c778b-1c9d-4e2a-83a5-984c98a48619.type','\"craft\\\\fields\\\\Matrix\"'),('fields.e7076da7-39d5-4fe9-bca1-588f96d22b04.columnSuffix','null'),('fields.e7076da7-39d5-4fe9-bca1-588f96d22b04.handle','\"label\"'),('fields.e7076da7-39d5-4fe9-bca1-588f96d22b04.instructions','null'),('fields.e7076da7-39d5-4fe9-bca1-588f96d22b04.name','\"Label\"'),('fields.e7076da7-39d5-4fe9-bca1-588f96d22b04.searchable','true'),('fields.e7076da7-39d5-4fe9-bca1-588f96d22b04.settings.byteLimit','null'),('fields.e7076da7-39d5-4fe9-bca1-588f96d22b04.settings.charLimit','null'),('fields.e7076da7-39d5-4fe9-bca1-588f96d22b04.settings.code','false'),('fields.e7076da7-39d5-4fe9-bca1-588f96d22b04.settings.initialRows','4'),('fields.e7076da7-39d5-4fe9-bca1-588f96d22b04.settings.multiline','false'),('fields.e7076da7-39d5-4fe9-bca1-588f96d22b04.settings.placeholder','null'),('fields.e7076da7-39d5-4fe9-bca1-588f96d22b04.settings.uiMode','\"normal\"'),('fields.e7076da7-39d5-4fe9-bca1-588f96d22b04.translationKeyFormat','null'),('fields.e7076da7-39d5-4fe9-bca1-588f96d22b04.translationMethod','\"none\"'),('fields.e7076da7-39d5-4fe9-bca1-588f96d22b04.type','\"craft\\\\fields\\\\PlainText\"'),('fields.fab0c052-2ecc-4fb3-b50c-072289e0957f.columnSuffix','null'),('fields.fab0c052-2ecc-4fb3-b50c-072289e0957f.handle','\"trueFalse\"'),('fields.fab0c052-2ecc-4fb3-b50c-072289e0957f.instructions','null'),('fields.fab0c052-2ecc-4fb3-b50c-072289e0957f.name','\"True/False\"'),('fields.fab0c052-2ecc-4fb3-b50c-072289e0957f.searchable','false'),('fields.fab0c052-2ecc-4fb3-b50c-072289e0957f.settings.default','false'),('fields.fab0c052-2ecc-4fb3-b50c-072289e0957f.settings.offLabel','null'),('fields.fab0c052-2ecc-4fb3-b50c-072289e0957f.settings.onLabel','null'),('fields.fab0c052-2ecc-4fb3-b50c-072289e0957f.translationKeyFormat','null'),('fields.fab0c052-2ecc-4fb3-b50c-072289e0957f.translationMethod','\"none\"'),('fields.fab0c052-2ecc-4fb3-b50c-072289e0957f.type','\"craft\\\\fields\\\\Lightswitch\"'),('fs.hardDisk.hasUrls','true'),('fs.hardDisk.name','\"Hard Disk\"'),('fs.hardDisk.settings.path','\"@webroot/uploads\"'),('fs.hardDisk.type','\"craft\\\\fs\\\\Local\"'),('fs.hardDisk.url','\"@uploads\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elementCondition','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.0.dateAdded','\"2025-06-25T10:23:27+00:00\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.0.editCondition','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.0.elementCondition','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.0.fieldUid','\"31515169-58e5-4fdf-b1f0-0060aba7da2f\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.0.handle','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.0.includeInCards','false'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.0.instructions','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.0.label','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.0.providesThumbs','false'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.0.required','false'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.0.tip','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.0.uid','\"29bba45c-c45c-474a-838b-7a067938dbfc\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.0.userCondition','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.0.warning','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.0.width','100'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.1.dateAdded','\"2025-06-25T10:23:27+00:00\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.1.editCondition','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.1.elementCondition','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.1.fieldUid','\"e7076da7-39d5-4fe9-bca1-588f96d22b04\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.1.handle','\"phone\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.1.includeInCards','false'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.1.instructions','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.1.label','\"Phone Number\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.1.providesThumbs','false'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.1.required','false'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.1.tip','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.1.uid','\"e291860f-f448-434b-8f78-bc0e1c17df7e\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.1.userCondition','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.1.warning','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.1.width','100'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.2.dateAdded','\"2025-06-25T10:23:27+00:00\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.2.editCondition','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.2.elementCondition','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.2.fieldUid','\"e7076da7-39d5-4fe9-bca1-588f96d22b04\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.2.handle','\"email\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.2.includeInCards','false'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.2.instructions','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.2.label','\"Email Address\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.2.providesThumbs','false'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.2.required','false'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.2.tip','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.2.uid','\"e2d85da6-ced2-45aa-b62a-7d9b0e4fadaa\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.2.userCondition','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.2.warning','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.2.width','100'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.3.dateAdded','\"2025-06-25T10:23:27+00:00\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.3.editCondition','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.3.elementCondition','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.3.fieldUid','\"208b59dc-efeb-404c-98f2-6ec660879ee1\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.3.handle','\"linkedin\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.3.includeInCards','false'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.3.instructions','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.3.label','\"Linkedin Link\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.3.providesThumbs','false'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.3.required','false'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.3.tip','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.3.uid','\"6c6ef557-332f-4c2a-bea1-e778ea21504a\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.3.userCondition','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.3.warning','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.3.width','100'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.4.dateAdded','\"2025-06-25T10:26:18+00:00\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.4.editCondition','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.4.elementCondition','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.4.fieldUid','\"31515169-58e5-4fdf-b1f0-0060aba7da2f\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.4.handle','\"address\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.4.includeInCards','false'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.4.instructions','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.4.label','\"Address\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.4.providesThumbs','false'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.4.required','false'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.4.tip','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.4.uid','\"b1908e11-e036-4f70-a023-67f5f10e0f9b\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.4.userCondition','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.4.warning','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.4.width','100'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.5.dateAdded','\"2025-06-25T10:23:27+00:00\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.5.editCondition','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.5.elementCondition','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.5.fieldUid','\"0b7df609-3386-44d6-8dec-9236996e999a\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.5.handle','\"policies\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.5.includeInCards','false'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.5.instructions','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.5.label','\"Policies Menu\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.5.providesThumbs','false'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.5.required','false'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.5.tip','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.5.uid','\"4d1fcd6b-bb05-4628-b5fc-8c9eaa417c7e\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.5.userCondition','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.5.warning','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.elements.5.width','100'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.name','\"Content\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.uid','\"4ebd74a0-2ef1-4f04-987c-15c10f7c3e77\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.fieldLayouts.6ab3f5b4-a069-448c-9b20-3466fc9c8c52.tabs.0.userCondition','null'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.handle','\"footer\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.name','\"Footer\"'),('globalSets.114e0eaa-67db-473a-a450-04a4a53bba35.sortOrder','2'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elementCondition','null'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.0.dateAdded','\"2025-06-20T15:57:13+00:00\"'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.0.editCondition','null'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.0.elementCondition','null'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.0.fieldUid','\"62534679-40fc-45ab-9544-cbced2386fe8\"'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.0.handle','\"logo\"'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.0.includeInCards','false'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.0.instructions','null'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.0.label','\"Logo\"'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.0.providesThumbs','false'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.0.required','false'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.0.tip','null'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.0.uid','\"71fa6bbf-4472-405d-94d2-78883692d9a3\"'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.0.userCondition','null'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.0.warning','null'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.0.width','100'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.1.dateAdded','\"2025-06-20T15:57:13+00:00\"'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.1.editCondition','null'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.1.elementCondition','null'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.1.fieldUid','\"75c37449-5a52-49a5-9e4a-f3533695f300\"'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.1.handle','null'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.1.includeInCards','false'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.1.instructions','null'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.1.label','null'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.1.providesThumbs','false'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.1.required','false'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.1.tip','null'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.1.uid','\"c0f591d0-8f83-4afe-b408-85d5b5c4cb92\"'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.1.userCondition','null'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.1.warning','null'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.elements.1.width','100'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.name','\"Content\"'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.uid','\"d94c5a2b-6ee4-40d9-b980-8f6611e80d48\"'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.fieldLayouts.61008989-da97-4806-9a00-51c78967a3f9.tabs.0.userCondition','null'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.handle','\"header\"'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.name','\"Header\"'),('globalSets.861d3103-01e5-446c-b19c-8357db15e40d.sortOrder','1'),('meta.__names__.09043f1e-ea69-4028-8ca3-5f75660d3d3d','\"Subtext\"'),('meta.__names__.0b7df609-3386-44d6-8dec-9236996e999a','\"Link List\"'),('meta.__names__.0de456be-e57c-491d-b5e9-2a48c94a73cf','\"Fifty Fifty Card\"'),('meta.__names__.114e0eaa-67db-473a-a450-04a4a53bba35','\"Footer\"'),('meta.__names__.1ed4c77a-2163-41cd-a3b4-dac5650b0ea3','\"Equipment List Pages\"'),('meta.__names__.20033fea-bd0d-4a3e-ad47-9f84788a37db','\"CTA With Background\"'),('meta.__names__.208b59dc-efeb-404c-98f2-6ec660879ee1','\"Single Link\"'),('meta.__names__.26919202-5503-4b47-913f-a7b707940ad8','\"Headings\"'),('meta.__names__.27b88dbb-5275-488c-8cb3-86e8daa4b84f','\"Equipment Page Type\"'),('meta.__names__.31515169-58e5-4fdf-b1f0-0060aba7da2f','\"Subtext\"'),('meta.__names__.37bcb295-e211-4822-b8ef-9119df20f58e','\"Page Content\"'),('meta.__names__.409531c9-59ff-4658-9ca0-41d34bc7bc30','\"Homepage\"'),('meta.__names__.4494340c-3b4f-4bb8-a887-fa3b6f110dc1','\"Sub\"'),('meta.__names__.46e91064-492e-4832-8b32-9ea816047e2d','\"Heading\"'),('meta.__names__.62534679-40fc-45ab-9544-cbced2386fe8','\"Media\"'),('meta.__names__.674fb744-b160-444b-af35-72f3a327afbf','\"Two Column Card Block\"'),('meta.__names__.69332d09-4481-4eaf-9f75-241fbd7f5211','\"Megamenu Content\"'),('meta.__names__.741d13d8-7c1b-4440-a507-1b6478eb6736','\"Fifty Fifty Repeater\"'),('meta.__names__.75c37449-5a52-49a5-9e4a-f3533695f300','\"Navigation\"'),('meta.__names__.861d3103-01e5-446c-b19c-8357db15e40d','\"Header\"'),('meta.__names__.8c5c2d88-d621-448b-81ae-1f21849e4f56','\"Sub\"'),('meta.__names__.a92e5168-e1b1-4553-88ea-8b38892b8c65','\"Megamenu List\"'),('meta.__names__.bcded55c-424c-4973-b666-df8c107909d2','\"Equipment Cards\"'),('meta.__names__.c190d294-d2f4-4f8b-a3f9-bbc414f9e870','\"Simple\"'),('meta.__names__.ca7c778b-1c9d-4e2a-83a5-984c98a48619','\"Main Content\"'),('meta.__names__.cb061430-787b-48ea-8a9b-c7980d0134b9','\"Megamenu Item\"'),('meta.__names__.cdb88818-0242-4279-92e9-21a22e0931cb','\"50/50 Image Text Repeater\"'),('meta.__names__.e1d477b7-f94e-41e1-94f9-0a657534d3eb','\"Equipment Category Grid\"'),('meta.__names__.e6ecaa86-d570-4965-b85f-62c9ff23b0d7','\"Equipment Page Content\"'),('meta.__names__.e7076da7-39d5-4fe9-bca1-588f96d22b04','\"Label\"'),('meta.__names__.efb6f34c-41f5-4d47-bda7-2f96b491d19c','\"Single Link\"'),('meta.__names__.efe6c18d-5435-400c-92da-48306d6a6da9','\"Equipment Page Type\"'),('meta.__names__.f0170a2a-3987-4b96-a0b8-e2f4c9b4f177','\"Equipment Card\"'),('meta.__names__.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd','\"Images\"'),('meta.__names__.f5a66dd0-a9c7-408c-b28f-6409042afd08','\"Pages\"'),('meta.__names__.f9651f2a-e0c5-420e-bcd0-60892652fbcd','\"Newsletter Signup Banner\"'),('meta.__names__.fab0c052-2ecc-4fb3-b50c-072289e0957f','\"True/False\"'),('plugins.assetrev.edition','\"standard\"'),('plugins.assetrev.enabled','true'),('plugins.assetrev.schemaVersion','\"1.0.0\"'),('plugins.breadcrumb.edition','\"standard\"'),('plugins.breadcrumb.enabled','true'),('plugins.breadcrumb.schemaVersion','\"1.1.1\"'),('plugins.ckeditor.edition','\"standard\"'),('plugins.ckeditor.enabled','true'),('plugins.ckeditor.schemaVersion','\"3.0.0.0\"'),('plugins.freeform.edition','\"express\"'),('plugins.freeform.enabled','true'),('plugins.freeform.schemaVersion','\"5.4.2\"'),('plugins.templatecomments.edition','\"standard\"'),('plugins.templatecomments.enabled','false'),('plugins.templatecomments.schemaVersion','\"1.0.0\"'),('plugins.vite.edition','\"standard\"'),('plugins.vite.enabled','true'),('plugins.vite.schemaVersion','\"1.0.0\"'),('sections.1ed4c77a-2163-41cd-a3b4-dac5650b0ea3.defaultPlacement','\"end\"'),('sections.1ed4c77a-2163-41cd-a3b4-dac5650b0ea3.enableVersioning','true'),('sections.1ed4c77a-2163-41cd-a3b4-dac5650b0ea3.entryTypes.0.uid','\"e6ecaa86-d570-4965-b85f-62c9ff23b0d7\"'),('sections.1ed4c77a-2163-41cd-a3b4-dac5650b0ea3.handle','\"equipmentListPages\"'),('sections.1ed4c77a-2163-41cd-a3b4-dac5650b0ea3.maxAuthors','1'),('sections.1ed4c77a-2163-41cd-a3b4-dac5650b0ea3.name','\"Equipment List Pages\"'),('sections.1ed4c77a-2163-41cd-a3b4-dac5650b0ea3.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.1ed4c77a-2163-41cd-a3b4-dac5650b0ea3.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.1ed4c77a-2163-41cd-a3b4-dac5650b0ea3.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.1ed4c77a-2163-41cd-a3b4-dac5650b0ea3.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.1ed4c77a-2163-41cd-a3b4-dac5650b0ea3.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.1ed4c77a-2163-41cd-a3b4-dac5650b0ea3.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.1ed4c77a-2163-41cd-a3b4-dac5650b0ea3.propagationMethod','\"all\"'),('sections.1ed4c77a-2163-41cd-a3b4-dac5650b0ea3.siteSettings.8c5c2d88-d621-448b-81ae-1f21849e4f56.enabledByDefault','true'),('sections.1ed4c77a-2163-41cd-a3b4-dac5650b0ea3.siteSettings.8c5c2d88-d621-448b-81ae-1f21849e4f56.hasUrls','true'),('sections.1ed4c77a-2163-41cd-a3b4-dac5650b0ea3.siteSettings.8c5c2d88-d621-448b-81ae-1f21849e4f56.template','\"equipment-list/_entry.twig\"'),('sections.1ed4c77a-2163-41cd-a3b4-dac5650b0ea3.siteSettings.8c5c2d88-d621-448b-81ae-1f21849e4f56.uriFormat','\"{parent.uri}/{slug}\"'),('sections.1ed4c77a-2163-41cd-a3b4-dac5650b0ea3.structure.maxLevels','null'),('sections.1ed4c77a-2163-41cd-a3b4-dac5650b0ea3.structure.uid','\"c20f52ad-af4e-477b-937d-cb457c3c7108\"'),('sections.1ed4c77a-2163-41cd-a3b4-dac5650b0ea3.type','\"structure\"'),('sections.409531c9-59ff-4658-9ca0-41d34bc7bc30.defaultPlacement','\"end\"'),('sections.409531c9-59ff-4658-9ca0-41d34bc7bc30.enableVersioning','true'),('sections.409531c9-59ff-4658-9ca0-41d34bc7bc30.entryTypes.0.uid','\"37bcb295-e211-4822-b8ef-9119df20f58e\"'),('sections.409531c9-59ff-4658-9ca0-41d34bc7bc30.handle','\"homepage\"'),('sections.409531c9-59ff-4658-9ca0-41d34bc7bc30.maxAuthors','1'),('sections.409531c9-59ff-4658-9ca0-41d34bc7bc30.name','\"Homepage\"'),('sections.409531c9-59ff-4658-9ca0-41d34bc7bc30.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.409531c9-59ff-4658-9ca0-41d34bc7bc30.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.409531c9-59ff-4658-9ca0-41d34bc7bc30.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.409531c9-59ff-4658-9ca0-41d34bc7bc30.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.409531c9-59ff-4658-9ca0-41d34bc7bc30.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.409531c9-59ff-4658-9ca0-41d34bc7bc30.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.409531c9-59ff-4658-9ca0-41d34bc7bc30.propagationMethod','\"all\"'),('sections.409531c9-59ff-4658-9ca0-41d34bc7bc30.siteSettings.8c5c2d88-d621-448b-81ae-1f21849e4f56.enabledByDefault','true'),('sections.409531c9-59ff-4658-9ca0-41d34bc7bc30.siteSettings.8c5c2d88-d621-448b-81ae-1f21849e4f56.hasUrls','true'),('sections.409531c9-59ff-4658-9ca0-41d34bc7bc30.siteSettings.8c5c2d88-d621-448b-81ae-1f21849e4f56.template','\"pages/_homepage.twig\"'),('sections.409531c9-59ff-4658-9ca0-41d34bc7bc30.siteSettings.8c5c2d88-d621-448b-81ae-1f21849e4f56.uriFormat','\"__home__\"'),('sections.409531c9-59ff-4658-9ca0-41d34bc7bc30.type','\"single\"'),('sections.f5a66dd0-a9c7-408c-b28f-6409042afd08.defaultPlacement','\"end\"'),('sections.f5a66dd0-a9c7-408c-b28f-6409042afd08.enableVersioning','true'),('sections.f5a66dd0-a9c7-408c-b28f-6409042afd08.entryTypes.0.uid','\"37bcb295-e211-4822-b8ef-9119df20f58e\"'),('sections.f5a66dd0-a9c7-408c-b28f-6409042afd08.handle','\"pages\"'),('sections.f5a66dd0-a9c7-408c-b28f-6409042afd08.maxAuthors','1'),('sections.f5a66dd0-a9c7-408c-b28f-6409042afd08.name','\"Pages\"'),('sections.f5a66dd0-a9c7-408c-b28f-6409042afd08.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.f5a66dd0-a9c7-408c-b28f-6409042afd08.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.f5a66dd0-a9c7-408c-b28f-6409042afd08.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.f5a66dd0-a9c7-408c-b28f-6409042afd08.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.f5a66dd0-a9c7-408c-b28f-6409042afd08.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.f5a66dd0-a9c7-408c-b28f-6409042afd08.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.f5a66dd0-a9c7-408c-b28f-6409042afd08.propagationMethod','\"all\"'),('sections.f5a66dd0-a9c7-408c-b28f-6409042afd08.siteSettings.8c5c2d88-d621-448b-81ae-1f21849e4f56.enabledByDefault','true'),('sections.f5a66dd0-a9c7-408c-b28f-6409042afd08.siteSettings.8c5c2d88-d621-448b-81ae-1f21849e4f56.hasUrls','true'),('sections.f5a66dd0-a9c7-408c-b28f-6409042afd08.siteSettings.8c5c2d88-d621-448b-81ae-1f21849e4f56.template','\"pages/_entry.twig\"'),('sections.f5a66dd0-a9c7-408c-b28f-6409042afd08.siteSettings.8c5c2d88-d621-448b-81ae-1f21849e4f56.uriFormat','\"{slug}\"'),('sections.f5a66dd0-a9c7-408c-b28f-6409042afd08.structure.maxLevels','null'),('sections.f5a66dd0-a9c7-408c-b28f-6409042afd08.structure.uid','\"51e8ef33-d244-49d5-9d79-5cf401a2f73b\"'),('sections.f5a66dd0-a9c7-408c-b28f-6409042afd08.type','\"structure\"'),('siteGroups.4494340c-3b4f-4bb8-a887-fa3b6f110dc1.name','\"Sub\"'),('sites.8c5c2d88-d621-448b-81ae-1f21849e4f56.baseUrl','\"http://sub.ddev.site/\"'),('sites.8c5c2d88-d621-448b-81ae-1f21849e4f56.enabled','true'),('sites.8c5c2d88-d621-448b-81ae-1f21849e4f56.handle','\"default\"'),('sites.8c5c2d88-d621-448b-81ae-1f21849e4f56.hasUrls','true'),('sites.8c5c2d88-d621-448b-81ae-1f21849e4f56.language','\"en\"'),('sites.8c5c2d88-d621-448b-81ae-1f21849e4f56.name','\"Sub\"'),('sites.8c5c2d88-d621-448b-81ae-1f21849e4f56.primary','true'),('sites.8c5c2d88-d621-448b-81ae-1f21849e4f56.siteGroup','\"4494340c-3b4f-4bb8-a887-fa3b6f110dc1\"'),('sites.8c5c2d88-d621-448b-81ae-1f21849e4f56.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Sub\"'),('system.schemaVersion','\"5.7.0.3\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.require2fa','false'),('users.requireEmailVerification','true'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.altTranslationKeyFormat','null'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.altTranslationMethod','\"none\"'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.cardView.0','\"dateUpdated\"'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.cardView.1','\"dateCreated\"'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.cardView.2','\"filename\"'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.cardView.3','\"link\"'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.cardView.4','\"kind\"'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.elementCondition','null'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.elements.0.autocapitalize','true'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.elements.0.autocomplete','false'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.elements.0.autocorrect','true'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.elements.0.class','null'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.elements.0.dateAdded','\"2025-06-23T11:22:10+00:00\"'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.elements.0.disabled','false'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.elements.0.elementCondition','null'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.elements.0.id','null'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.elements.0.includeInCards','false'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.elements.0.inputType','null'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.elements.0.instructions','null'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.elements.0.label','null'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.elements.0.max','null'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.elements.0.min','null'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.elements.0.name','null'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.elements.0.orientation','null'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.elements.0.placeholder','null'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.elements.0.providesThumbs','false'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.elements.0.readonly','false'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.elements.0.requirable','false'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.elements.0.size','null'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.elements.0.step','null'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.elements.0.tip','null'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.elements.0.title','null'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.elements.0.uid','\"b58cdce2-9236-43ec-807d-02938fec9cde\"'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.elements.0.userCondition','null'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.elements.0.warning','null'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.elements.0.width','100'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.name','\"Content\"'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.uid','\"dce090d3-b05d-4ef4-88b5-deb47c5a44a5\"'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fieldLayouts.97e0fb0c-a10d-43ac-9edf-f973c1f55421.tabs.0.userCondition','null'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.fs','\"hardDisk\"'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.handle','\"images\"'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.name','\"Images\"'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.sortOrder','2'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.subpath','\"images\"'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.titleTranslationKeyFormat','null'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.titleTranslationMethod','\"site\"'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.transformFs','\"\"'),('volumes.f455cfbd-b7d8-4140-a7d2-4121bb10fbbd.transformSubpath','\"images\"');
/*!40000 ALTER TABLE `sub41_projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_queue`
--

LOCK TABLES `sub41_queue` WRITE;
/*!40000 ALTER TABLE `sub41_queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_recoverycodes`
--

LOCK TABLES `sub41_recoverycodes` WRITE;
/*!40000 ALTER TABLE `sub41_recoverycodes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_recoverycodes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_relations`
--

LOCK TABLES `sub41_relations` WRITE;
/*!40000 ALTER TABLE `sub41_relations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_relations` VALUES (5,3,13,1,142,1,'2025-06-23 10:19:23','2025-06-23 10:19:23','4a2872de-7612-4048-971f-73ce0f2d8e7c'),(7,3,11,1,144,1,'2025-06-23 10:19:37','2025-06-23 10:19:37','72f7d7ed-fc6d-4149-a112-ee3da1e5b55b'),(9,3,15,1,146,1,'2025-06-23 10:19:48','2025-06-23 10:19:48','4e8b9af5-418a-463d-9993-8b719e82ffe2'),(12,3,14,1,148,1,'2025-06-23 10:20:09','2025-06-23 10:20:09','3514d0dc-97e4-4afe-b0fe-d2434924dc72'),(44,5,17,NULL,52,1,'2025-06-23 10:21:29','2025-06-23 10:21:29','3b1419aa-8c1f-40ca-8c8a-a632c0481f8c'),(45,5,17,NULL,68,2,'2025-06-23 10:21:29','2025-06-23 10:21:29','c6eeb224-eb4e-455b-8bd0-3c4d2cdde653'),(46,5,17,NULL,54,3,'2025-06-23 10:21:29','2025-06-23 10:21:29','b3ef272f-b182-4874-8290-3e984a899994'),(47,5,17,NULL,70,4,'2025-06-23 10:21:29','2025-06-23 10:21:29','cb2de53d-c7ee-4e34-bf90-e20bbaf210de'),(48,5,17,NULL,56,5,'2025-06-23 10:21:29','2025-06-23 10:21:29','b03a996c-4155-4d31-a031-8744eaf26673'),(49,5,17,NULL,72,6,'2025-06-23 10:21:29','2025-06-23 10:21:29','9c8d8e27-8e7f-4679-828e-5ae9e3035a3e'),(50,5,17,NULL,58,7,'2025-06-23 10:21:29','2025-06-23 10:21:29','854f84bd-84f5-4e6f-8626-1e311f06f426'),(51,5,17,NULL,74,8,'2025-06-23 10:21:29','2025-06-23 10:21:29','98d27c51-4875-4b60-85ad-a504b15aca7d'),(52,5,17,NULL,60,9,'2025-06-23 10:21:29','2025-06-23 10:21:29','ae62be11-9e44-4993-9beb-942dd0c935a3'),(53,5,17,NULL,76,10,'2025-06-23 10:21:29','2025-06-23 10:21:29','2c35a42b-21d7-475b-8cc9-3594c34ad55e'),(54,5,17,NULL,62,11,'2025-06-23 10:21:29','2025-06-23 10:21:29','52e79d6d-b4b8-49f3-ac45-ee5e523f0d66'),(55,5,17,NULL,78,12,'2025-06-23 10:21:29','2025-06-23 10:21:29','979d6f95-5846-4d9d-82ff-8001c635d161'),(56,5,17,NULL,64,13,'2025-06-23 10:21:29','2025-06-23 10:21:29','8fb1cb4f-6931-4096-ae8c-b0f125395e42'),(57,5,17,NULL,80,14,'2025-06-23 10:21:29','2025-06-23 10:21:29','70c724b7-0eb4-4e9e-97a9-4affdb01a263'),(58,5,17,NULL,66,15,'2025-06-23 10:21:29','2025-06-23 10:21:29','4ea36380-9f3e-486a-858e-2790bea8ac17'),(59,5,17,NULL,82,16,'2025-06-23 10:21:29','2025-06-23 10:21:29','8aa9a393-c721-47db-9769-3993852d5321'),(60,5,157,NULL,88,1,'2025-06-23 10:21:29','2025-06-23 10:21:29','66629e66-0e8a-42c6-b9c3-2fbb93e0adf3'),(61,5,157,NULL,102,2,'2025-06-23 10:21:29','2025-06-23 10:21:29','e136e007-d7b5-4bde-8a0a-f7023f5d1d5a'),(62,5,157,NULL,90,3,'2025-06-23 10:21:29','2025-06-23 10:21:29','59743918-1967-467e-ae86-884bff5178bf'),(63,5,157,NULL,104,4,'2025-06-23 10:21:29','2025-06-23 10:21:29','70667aca-ae04-40a7-b192-40eef18669d8'),(64,5,157,NULL,92,5,'2025-06-23 10:21:29','2025-06-23 10:21:29','6ef77192-7bac-4cf0-a01c-e01dbc0bcd45'),(65,5,157,NULL,106,6,'2025-06-23 10:21:29','2025-06-23 10:21:29','c54aa858-1db1-435e-8b7d-22918bf3d3f7'),(66,5,157,NULL,94,7,'2025-06-23 10:21:29','2025-06-23 10:21:29','242f1fdf-0e70-4fbc-8f9b-5cc55dc22d35'),(67,5,157,NULL,108,8,'2025-06-23 10:21:29','2025-06-23 10:21:29','dc44c7ec-cd05-40a6-9a0c-85caf618763b'),(68,5,157,NULL,96,9,'2025-06-23 10:21:29','2025-06-23 10:21:29','79b74e13-50cf-4ff8-8980-def0df596196'),(69,5,157,NULL,110,10,'2025-06-23 10:21:29','2025-06-23 10:21:29','6a943b11-ff8b-4a95-a597-72dfc1036501'),(70,5,157,NULL,98,11,'2025-06-23 10:21:29','2025-06-23 10:21:29','36aba270-2222-47a5-8c8b-55b43156a5f9'),(71,5,157,NULL,112,12,'2025-06-23 10:21:29','2025-06-23 10:21:29','74de6125-21af-4c9a-b469-54056f0b8714'),(72,5,157,NULL,100,13,'2025-06-23 10:21:29','2025-06-23 10:21:29','d9a4d41f-4631-456f-9b53-5710654fc217'),(73,5,157,NULL,132,14,'2025-06-23 10:21:29','2025-06-23 10:21:29','dcb485e7-4766-4484-9737-164bebc52510'),(76,2,5,NULL,163,1,'2025-06-23 11:28:44','2025-06-23 11:28:44','ea65f4c2-96cf-4764-99f6-5186a56a977a'),(79,3,167,1,139,1,'2025-06-24 10:04:35','2025-06-24 10:04:35','121d0115-84fa-414f-99ef-48dd8e16b52b'),(80,2,167,NULL,166,1,'2025-06-24 10:04:35','2025-06-24 10:04:35','6f0016e9-651f-4bd7-9c8b-2438d91d049c'),(81,3,169,1,139,1,'2025-06-24 10:04:36','2025-06-24 10:04:36','ff84d81a-8677-4925-8050-8323e778ec48'),(82,2,169,NULL,166,1,'2025-06-24 10:04:36','2025-06-24 10:04:36','1e262fa3-3b07-4fd4-b2c2-d7f36aab9ed4'),(85,3,173,1,139,1,'2025-06-24 10:53:57','2025-06-24 10:53:57','88a2cd6b-8217-4af3-9f8d-7a5de32cde9a'),(86,2,173,NULL,166,1,'2025-06-24 10:53:57','2025-06-24 10:53:57','58a7c604-4042-4398-a30e-b487120c7090'),(103,2,187,NULL,182,1,'2025-06-24 11:10:10','2025-06-24 11:10:10','3d8c6630-f29b-46c3-a518-34bc6dd2b97d'),(104,2,187,NULL,180,2,'2025-06-24 11:10:10','2025-06-24 11:10:10','84a1cc1b-1165-41cf-9d62-b895f086c16e'),(105,3,187,1,50,1,'2025-06-24 11:10:10','2025-06-24 11:10:10','836e4d56-163c-458a-865e-902e324cc54a'),(106,2,188,NULL,181,1,'2025-06-24 11:10:10','2025-06-24 11:10:10','53a881bc-8376-4d4b-99ac-a5bd4afb6f56'),(107,2,188,NULL,179,2,'2025-06-24 11:10:10','2025-06-24 11:10:10','e3caf856-3470-4b0f-b387-5a75ab0dd945'),(108,3,188,1,84,1,'2025-06-24 11:10:10','2025-06-24 11:10:10','4065f7b6-55b8-412a-99e0-2695c00056c3'),(109,2,190,NULL,182,1,'2025-06-24 11:10:10','2025-06-24 11:10:10','8bf3ad75-661d-437f-a63a-2f6664f8c428'),(110,2,190,NULL,180,2,'2025-06-24 11:10:10','2025-06-24 11:10:10','2c94cf5c-90a7-4844-a3aa-d70c178b9713'),(111,3,190,1,50,1,'2025-06-24 11:10:10','2025-06-24 11:10:10','ab124e47-b659-4622-80f1-0fba4ef1f27f'),(112,2,191,NULL,181,1,'2025-06-24 11:10:10','2025-06-24 11:10:10','5a35c32e-c552-46a4-8dc9-d287c4d8bdf7'),(113,2,191,NULL,179,2,'2025-06-24 11:10:10','2025-06-24 11:10:10','d4bb46d1-8935-4451-af17-96f9ed01eb63'),(114,3,191,1,84,1,'2025-06-24 11:10:10','2025-06-24 11:10:10','8d7bc03f-a067-4e79-8739-cfc8d6229118'),(116,3,16,1,193,1,'2025-06-24 13:01:49','2025-06-24 13:01:49','d180a22f-1bce-43dc-8b48-3fff92c79d8f'),(126,2,212,NULL,206,1,'2025-06-24 15:25:47','2025-06-24 15:25:47','6eaf1ae1-5b5e-4fa1-af9a-b6346685f21c'),(127,3,212,1,193,1,'2025-06-24 15:25:47','2025-06-24 15:25:47','e323e126-9ad3-41b2-84f6-7c3231448170'),(129,3,213,1,146,1,'2025-06-24 15:25:47','2025-06-24 15:25:47','a3cf6d1e-b953-40fa-8844-f5a69efb44aa'),(130,2,215,NULL,206,1,'2025-06-24 15:25:47','2025-06-24 15:25:47','bec169a9-e15f-43c7-9938-6ff948d87e99'),(131,3,215,1,193,1,'2025-06-24 15:25:47','2025-06-24 15:25:47','f8b51696-748a-4c75-a9fc-422b9d4ea5e1'),(132,2,216,NULL,206,1,'2025-06-24 15:25:47','2025-06-24 15:25:47','c33871b6-2f2c-453e-9cda-13200216a84d'),(133,3,216,1,146,1,'2025-06-24 15:25:47','2025-06-24 15:25:47','f6575f95-a547-4cdb-b936-6b726ff7318e'),(139,2,213,NULL,218,1,'2025-06-24 15:28:00','2025-06-24 15:28:00','03c94aee-177b-4e6c-bd0c-332f696f0094'),(140,2,225,NULL,218,1,'2025-06-24 15:28:00','2025-06-24 15:28:00','f184360c-dcc3-4b6a-a23e-a8d90c45c057'),(141,3,225,1,146,1,'2025-06-24 15:28:00','2025-06-24 15:28:00','9eec182c-cb1d-41a6-88bc-5737b9c2925e'),(150,2,235,NULL,206,1,'2025-06-24 15:31:09','2025-06-24 15:31:09','32ab79e6-3248-4c23-9078-08f0c6567d58'),(151,3,235,1,193,1,'2025-06-24 15:31:09','2025-06-24 15:31:09','521ed9ce-74fc-49ff-bdab-2a3de4df6d71'),(152,2,236,NULL,218,1,'2025-06-24 15:31:09','2025-06-24 15:31:09','ba89cd39-e6ed-4c46-a857-050c257927e1'),(153,3,236,1,146,1,'2025-06-24 15:31:09','2025-06-24 15:31:09','2577cbed-03c9-4214-9726-22926021b8e7'),(158,2,244,NULL,218,1,'2025-06-24 16:01:12','2025-06-24 16:01:12','6059505a-8a22-4be4-a00c-c2611c829d13'),(159,3,244,1,146,1,'2025-06-24 16:01:12','2025-06-24 16:01:12','733bbd39-8bf7-4762-9778-e7328d377040'),(160,5,252,NULL,255,1,'2025-06-25 10:32:33','2025-06-25 10:32:33','d6e4066c-e147-45e8-bb3b-fb8399608364'),(161,5,252,NULL,253,2,'2025-06-25 10:32:33','2025-06-25 10:32:33','1a0564ff-a5fa-4e4e-80c1-af2b5f20cc47'),(163,2,52,NULL,355,1,'2025-06-25 13:32:11','2025-06-25 13:32:11','4fd87ee7-c9cc-4c2b-9ef1-0268ef9d3ceb'),(164,2,357,NULL,355,1,'2025-06-25 13:32:11','2025-06-25 13:32:11','75c65fda-4d35-4fac-bb09-91ba1010e0d4'),(171,2,364,NULL,355,1,'2025-06-25 13:38:52','2025-06-25 13:38:52','bc405a0c-db13-4a3a-bf8d-a06aa6a9f56f'),(172,2,68,NULL,350,1,'2025-06-25 13:38:53','2025-06-25 13:38:53','7713ab0e-2d06-4d65-afb5-f64df7c3f6ab'),(173,2,365,NULL,350,1,'2025-06-25 13:38:53','2025-06-25 13:38:53','c0aad6f3-69f4-4157-b298-e0ce67228ae8'),(174,2,54,NULL,342,1,'2025-06-25 13:38:53','2025-06-25 13:38:53','68d0624d-1308-4532-be1c-db6ef43714e6'),(175,2,366,NULL,342,1,'2025-06-25 13:38:53','2025-06-25 13:38:53','5a939aff-759e-4a5b-95fb-d81b676cf495'),(176,2,70,NULL,344,1,'2025-06-25 13:38:54','2025-06-25 13:38:54','1a67830b-d809-4e2b-ae6a-4b9bf4de1458'),(177,2,367,NULL,344,1,'2025-06-25 13:38:54','2025-06-25 13:38:54','af4d6232-cbb6-478a-893f-7cbb8ecb30b9'),(180,2,58,NULL,348,1,'2025-06-25 13:39:09','2025-06-25 13:39:09','27f43ef9-2051-4f83-a3de-607f472f693b'),(181,2,370,NULL,348,1,'2025-06-25 13:39:09','2025-06-25 13:39:09','61920780-11b9-4f20-b525-806a2406e56f'),(184,2,56,NULL,345,1,'2025-06-25 13:39:21','2025-06-25 13:39:21','b5f5d70b-a00c-4917-8344-e6f335769cf7'),(185,2,373,NULL,345,1,'2025-06-25 13:39:21','2025-06-25 13:39:21','f5964b12-8cbd-4003-83a7-04d6361df670'),(186,2,72,NULL,347,1,'2025-06-25 13:39:23','2025-06-25 13:39:23','995d658e-0700-4bea-b81d-c0262d1e2c54'),(187,2,374,NULL,347,1,'2025-06-25 13:39:23','2025-06-25 13:39:23','115882df-63a9-4261-bb29-fc57331d442c'),(188,2,74,NULL,346,1,'2025-06-25 13:39:24','2025-06-25 13:39:24','3a354454-059d-4d3b-87a1-e44327dca78a'),(189,2,375,NULL,346,1,'2025-06-25 13:39:24','2025-06-25 13:39:24','f3ebe471-4784-492a-900f-be2ebe79df0b'),(191,2,60,NULL,351,1,'2025-06-25 13:39:27','2025-06-25 13:39:27','2ce960ac-b0f3-4231-87d3-a528603fc43a'),(192,2,377,NULL,351,1,'2025-06-25 13:39:27','2025-06-25 13:39:27','9f672e5f-4bc7-41bf-8d2d-40a8636816a1'),(194,2,76,NULL,353,1,'2025-06-25 13:39:31','2025-06-25 13:39:31','9b1ffa5d-fbec-43b0-a680-564df73c8b0b'),(195,2,379,NULL,353,1,'2025-06-25 13:39:31','2025-06-25 13:39:31','c42a026a-d5fb-435f-ac19-847eb0c0b215'),(199,2,62,NULL,341,1,'2025-06-25 13:39:43','2025-06-25 13:39:43','145ef3ed-cbb2-4279-8c9b-265eea8d68f1'),(200,2,383,NULL,341,1,'2025-06-25 13:39:43','2025-06-25 13:39:43','d8533d92-1ee5-445d-b27a-03e81bc99142'),(201,2,78,NULL,340,1,'2025-06-25 13:39:44','2025-06-25 13:39:44','5404772e-4371-4b42-b980-2321d6f36d19'),(202,2,384,NULL,340,1,'2025-06-25 13:39:44','2025-06-25 13:39:44','94c0901b-3014-4253-8949-c4e0949ad33e'),(203,2,64,NULL,352,1,'2025-06-25 13:39:46','2025-06-25 13:39:46','7d1bbb1a-2e5e-4a0a-a681-19193a44c327'),(204,2,385,NULL,352,1,'2025-06-25 13:39:46','2025-06-25 13:39:46','6eea04b9-17fa-4c7a-af11-52e372c5ef89'),(205,2,80,NULL,349,1,'2025-06-25 13:39:46','2025-06-25 13:39:46','ed091d67-19e0-4c7c-9789-f28f8ef0d96c'),(206,2,386,NULL,349,1,'2025-06-25 13:39:46','2025-06-25 13:39:46','c87d9501-2721-4d9b-a58f-773e09b227ed'),(207,2,66,NULL,354,1,'2025-06-25 13:39:48','2025-06-25 13:39:48','82e7c438-0110-499f-869d-ed829796b4e2'),(208,2,387,NULL,354,1,'2025-06-25 13:39:48','2025-06-25 13:39:48','5e4e80c6-e13c-4c36-89e4-6d8bcc1c3abb'),(209,2,82,NULL,343,1,'2025-06-25 13:39:48','2025-06-25 13:39:48','4fcbb6a2-75f0-4d9e-844f-5207435d3b98'),(210,2,388,NULL,343,1,'2025-06-25 13:39:48','2025-06-25 13:39:48','0611053c-6307-4076-8a94-4cc40e83aaa5'),(211,2,389,NULL,349,1,'2025-06-25 13:39:54','2025-06-25 13:39:54','e4114930-3fb2-4f96-b00f-074b7b728dc5');
/*!40000 ALTER TABLE `sub41_relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_revisions`
--

LOCK TABLES `sub41_revisions` WRITE;
/*!40000 ALTER TABLE `sub41_revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_revisions` VALUES (1,1,NULL,1,NULL),(2,18,3,1,''),(3,20,3,1,''),(4,22,3,1,''),(5,24,3,1,''),(6,26,3,1,''),(7,28,3,1,''),(8,30,3,1,''),(9,32,3,1,''),(10,34,3,1,''),(11,36,3,1,''),(12,38,3,1,''),(13,40,3,1,''),(14,42,3,1,''),(15,44,3,1,''),(16,46,3,1,''),(17,48,3,1,''),(18,50,3,1,''),(19,52,3,1,NULL),(20,54,3,1,NULL),(21,56,3,1,NULL),(22,58,3,1,NULL),(23,60,3,1,NULL),(24,62,3,1,NULL),(25,64,3,1,NULL),(26,66,3,1,NULL),(27,68,3,1,NULL),(28,70,3,1,NULL),(29,72,3,1,NULL),(30,74,3,1,NULL),(31,76,3,1,NULL),(32,78,3,1,NULL),(33,80,3,1,NULL),(34,82,3,1,NULL),(35,84,3,1,NULL),(36,84,3,2,'Applied “Draft 1”'),(37,88,3,1,''),(38,90,3,1,''),(39,92,3,1,''),(40,94,3,1,''),(41,96,3,1,''),(42,98,3,1,''),(43,100,3,1,''),(44,102,3,1,''),(45,104,3,1,''),(46,106,3,1,''),(47,108,3,1,''),(48,110,3,1,''),(49,112,3,1,''),(50,52,3,2,NULL),(51,68,3,2,NULL),(52,54,3,2,NULL),(53,70,3,2,NULL),(54,56,3,2,NULL),(55,72,3,2,NULL),(56,58,3,2,NULL),(57,74,3,2,NULL),(58,60,3,2,NULL),(59,76,3,2,NULL),(60,62,3,2,NULL),(61,78,3,2,NULL),(62,64,3,2,NULL),(63,80,3,2,NULL),(64,66,3,2,NULL),(65,82,3,2,NULL),(66,84,3,3,NULL),(67,132,3,1,''),(68,134,3,1,''),(69,82,3,3,'Applied “Draft 1”'),(70,82,3,4,NULL),(71,139,3,1,''),(72,142,3,1,''),(73,144,3,1,''),(74,146,3,1,''),(75,148,3,1,''),(76,1,3,2,'Applied “Draft 1”'),(77,167,3,1,NULL),(78,167,3,2,NULL),(79,1,3,3,'Applied “Draft 1”'),(83,186,3,1,NULL),(84,187,3,1,NULL),(85,188,3,1,NULL),(86,1,3,4,'Applied “Draft 1”'),(87,193,3,1,''),(88,1,3,5,''),(90,186,3,2,NULL),(91,1,3,6,'Applied “Draft 1”'),(95,211,3,1,NULL),(96,212,3,1,NULL),(97,213,3,1,NULL),(98,1,3,7,'Applied “Draft 1”'),(101,211,3,2,NULL),(102,213,3,2,NULL),(103,1,3,8,'Applied “Draft 1”'),(107,211,3,3,NULL),(108,212,3,2,NULL),(109,213,3,3,NULL),(110,1,3,9,'Applied “Draft 1”'),(113,211,3,4,NULL),(114,213,3,4,NULL),(115,1,3,10,'Applied “Draft 1”'),(117,249,3,1,NULL),(118,1,3,11,'Applied “Draft 1”'),(119,253,3,1,''),(120,255,3,1,''),(121,50,3,2,'Applied “Draft 1”'),(122,193,3,2,'Applied “Draft 1”'),(123,82,3,5,'Applied “Draft 1”'),(124,52,3,3,'Applied “Draft 1”'),(125,68,3,3,'Applied “Draft 1”'),(126,54,3,3,'Applied “Draft 1”'),(127,70,3,3,'Applied “Draft 1”'),(128,56,3,3,'Applied “Draft 1”'),(129,72,3,3,'Applied “Draft 1”'),(130,58,3,3,'Applied “Draft 1”'),(131,74,3,3,'Applied “Draft 1”'),(132,60,3,3,'Applied “Draft 1”'),(133,76,3,3,'Applied “Draft 1”'),(134,62,3,3,'Applied “Draft 1”'),(135,78,3,3,'Applied “Draft 1”'),(136,64,3,3,'Applied “Draft 1”'),(137,80,3,3,'Applied “Draft 1”'),(138,66,3,3,'Applied “Draft 1”'),(139,82,3,6,NULL),(140,84,3,4,'Applied “Draft 1”'),(141,88,3,2,'Applied “Draft 1”'),(142,102,3,2,'Applied “Draft 1”'),(143,90,3,2,'Applied “Draft 1”'),(144,104,3,2,'Applied “Draft 1”'),(145,92,3,2,'Applied “Draft 1”'),(146,106,3,2,'Applied “Draft 1”'),(147,94,3,2,'Applied “Draft 1”'),(148,108,3,2,'Applied “Draft 1”'),(149,96,3,2,'Applied “Draft 1”'),(150,110,3,2,'Applied “Draft 1”'),(151,98,3,2,'Applied “Draft 1”'),(152,112,3,2,'Applied “Draft 1”'),(153,100,3,2,'Applied “Draft 1”'),(154,132,3,2,'Applied “Draft 1”'),(155,96,3,3,''),(156,110,3,3,''),(157,98,3,3,''),(158,112,3,3,''),(159,100,3,3,''),(160,132,3,3,''),(162,335,3,1,NULL),(163,50,3,3,'Applied “Draft 1”'),(164,52,3,4,'Applied “Draft 1”'),(165,52,3,5,''),(166,68,3,4,'Applied “Draft 1”'),(167,54,3,4,'Applied “Draft 1”'),(168,70,3,4,'Applied “Draft 1”'),(169,58,3,4,'Applied “Draft 1”'),(170,56,3,4,'Applied “Draft 1”'),(171,72,3,4,'Applied “Draft 1”'),(172,74,3,4,'Applied “Draft 1”'),(173,60,3,4,'Applied “Draft 1”'),(174,76,3,4,'Applied “Draft 1”'),(175,62,3,4,'Applied “Draft 1”'),(176,78,3,4,'Applied “Draft 1”'),(177,64,3,4,'Applied “Draft 1”'),(178,80,3,4,'Applied “Draft 1”'),(179,66,3,4,'Applied “Draft 1”'),(180,82,3,7,'Applied “Draft 1”'),(181,80,3,5,''),(182,390,3,1,''),(183,392,3,1,NULL),(184,394,3,1,NULL),(185,394,3,2,NULL),(186,392,3,2,NULL),(187,394,3,3,'Applied “Draft 1”'),(188,392,3,3,'Applied “Draft 1”'),(189,402,3,1,''),(190,404,3,1,''),(191,406,3,1,''),(192,408,3,1,''),(193,410,3,1,''),(194,412,3,1,''),(195,414,3,1,''),(196,416,3,1,''),(197,418,3,1,''),(198,420,3,1,''),(199,422,3,1,''),(200,424,3,1,''),(201,426,3,1,''),(202,428,3,1,''),(203,430,3,1,''),(204,432,3,1,''),(205,434,3,1,''),(206,436,3,1,''),(207,438,3,1,''),(208,440,3,1,''),(209,442,3,1,''),(210,444,3,1,''),(211,446,3,1,''),(212,448,3,1,''),(213,404,3,2,'Applied “Draft 1”'),(214,402,3,2,'Applied “Draft 1”'),(215,390,3,2,'Applied “Draft 1”');
/*!40000 ALTER TABLE `sub41_revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_searchindex`
--

LOCK TABLES `sub41_searchindex` WRITE;
/*!40000 ALTER TABLE `sub41_searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_searchindex` VALUES (1,'field',1,1,' specialist underwater brokerage global specialists in used rov and survey equipment provision of high quality subsea equipment from trusted sellers worldwide browse enquire purchase deploy explore our extensive inventory designed to meet your operational needs and elevate your projects get our lists straight to your inbox stay informed with a monthly round up of available rov and survey equipment no spam just one issue of both deepsearch and surveysearch each month '),(1,'slug',0,1,' homepage '),(1,'title',0,1,' homepage '),(3,'email',0,1,' dev in testing co uk '),(3,'firstname',0,1,''),(3,'fullname',0,1,''),(3,'lastname',0,1,''),(3,'slug',0,1,''),(3,'username',0,1,' dev in testing co uk '),(4,'slug',0,1,' temp cwigbrbwnkysnszcmyaicbvllcwcfengpoow '),(4,'title',0,1,''),(5,'slug',0,1,''),(6,'alt',0,1,''),(6,'extension',0,1,' png '),(6,'filename',0,1,' group 16 png '),(6,'kind',0,1,' image '),(6,'slug',0,1,''),(6,'title',0,1,' group 16 '),(7,'alt',0,1,''),(7,'extension',0,1,' svg '),(7,'filename',0,1,' group 16 svg '),(7,'kind',0,1,' image '),(7,'slug',0,1,''),(7,'title',0,1,' group 16 '),(8,'alt',0,1,''),(8,'extension',0,1,' svg '),(8,'filename',0,1,' group 16 svg '),(8,'kind',0,1,' image '),(8,'slug',0,1,''),(8,'title',0,1,' group 16 '),(9,'alt',0,1,''),(9,'extension',0,1,' svg '),(9,'filename',0,1,' group 16 svg '),(9,'kind',0,1,' image '),(9,'slug',0,1,''),(9,'title',0,1,' group 16 '),(10,'alt',0,1,''),(10,'extension',0,1,' png '),(10,'filename',0,1,' group 16 png '),(10,'kind',0,1,' image '),(10,'slug',0,1,''),(10,'title',0,1,' group 16 '),(11,'slug',0,1,' temp ufhvumvagatwnwthqzaaylpktonbimelmdai '),(11,'title',0,1,''),(13,'slug',0,1,' temp nujruocopgccfyfifkmfvmxkmpzwnjscefcd '),(13,'title',0,1,''),(14,'slug',0,1,' temp xmvpqgbpkfskrwwuippotrcbgwcpcgcoixnt '),(14,'title',0,1,''),(15,'slug',0,1,' temp wmrcruettaasmruqhnxhcujhlbvnrcjlwaka '),(15,'title',0,1,''),(16,'slug',0,1,' temp eqmnzaicsozvftiyzizpjzlszcairgevssxw '),(16,'title',0,1,''),(17,'slug',0,1,' deepsearch '),(17,'title',0,1,' deepsearch '),(18,'slug',0,1,' workclass rovs '),(18,'title',0,1,' workclass rovs '),(20,'slug',0,1,' eyeball inspection rovs '),(20,'title',0,1,' eyeball inspection rovs '),(22,'slug',0,1,' miscellaneous vehicles and equipment '),(22,'title',0,1,' miscellaneous vehicles and equipment '),(24,'slug',0,1,' miscellaneous rovs '),(24,'title',0,1,' miscellaneous rovs '),(26,'slug',0,1,' thrusters '),(26,'title',0,1,' thrusters '),(28,'slug',0,1,' containers '),(28,'title',0,1,' containers '),(30,'slug',0,1,' tether management systems '),(30,'title',0,1,' tether management systems '),(32,'slug',0,1,' winches a frames and cranes '),(32,'title',0,1,' winches a frames and cranes '),(34,'slug',0,1,' sliprings '),(34,'title',0,1,' sliprings '),(36,'slug',0,1,' manipulators '),(36,'title',0,1,' manipulators '),(38,'slug',0,1,' rov tooling '),(38,'title',0,1,' rov tooling '),(40,'slug',0,1,' rov sensors '),(40,'title',0,1,' rov sensors '),(42,'slug',0,1,' umbilicals '),(42,'title',0,1,' umbilicals '),(44,'slug',0,1,' cameras and lights '),(44,'title',0,1,' cameras and lights '),(46,'slug',0,1,' sonars '),(46,'title',0,1,' sonars '),(48,'slug',0,1,' miscellaneous '),(48,'title',0,1,' miscellaneous '),(50,'field',1,1,''),(50,'slug',0,1,' rov equipment '),(50,'title',0,1,' rov equipment '),(52,'field',1,1,''),(52,'slug',0,1,' workclass rovs '),(52,'title',0,1,' workclass rovs '),(54,'field',1,1,''),(54,'slug',0,1,' eyeball inspection rovs '),(54,'title',0,1,' eyeball inspection rovs '),(56,'field',1,1,''),(56,'slug',0,1,' miscellaneous vehicles and equipment '),(56,'title',0,1,' miscellaneous vehicles and equipment '),(58,'field',1,1,''),(58,'slug',0,1,' miscellaneous rovs '),(58,'title',0,1,' miscellaneous rovs '),(60,'field',1,1,''),(60,'slug',0,1,' thrusters '),(60,'title',0,1,' thrusters '),(62,'field',1,1,''),(62,'slug',0,1,' containers '),(62,'title',0,1,' containers '),(64,'field',1,1,''),(64,'slug',0,1,' tether management systems '),(64,'title',0,1,' tether management systems '),(66,'field',1,1,''),(66,'slug',0,1,' winches a frames and cranes '),(66,'title',0,1,' winches a frames and cranes '),(68,'field',1,1,''),(68,'slug',0,1,' sliprings '),(68,'title',0,1,' sliprings '),(70,'field',1,1,''),(70,'slug',0,1,' manipulators '),(70,'title',0,1,' manipulators '),(72,'field',1,1,''),(72,'slug',0,1,' rov tooling '),(72,'title',0,1,' rov tooling '),(74,'field',1,1,''),(74,'slug',0,1,' rov sensors '),(74,'title',0,1,' rov sensors '),(76,'field',1,1,''),(76,'slug',0,1,' umbilicals '),(76,'title',0,1,' umbilicals '),(78,'field',1,1,''),(78,'slug',0,1,' cameras and lights '),(78,'title',0,1,' cameras and lights '),(80,'field',1,1,''),(80,'slug',0,1,' sonars '),(80,'title',0,1,' sonars '),(82,'field',1,1,''),(82,'slug',0,1,' miscellaneous '),(82,'title',0,1,' miscellaneous '),(84,'field',1,1,''),(84,'slug',0,1,' survey equipment '),(84,'title',0,1,' survey equipment '),(88,'slug',0,1,' geophysical '),(88,'title',0,1,' geophysical '),(90,'slug',0,1,' multibeam sonars '),(90,'title',0,1,' multibeam sonars '),(92,'slug',0,1,' gauges probes and sensors '),(92,'title',0,1,' gauges probes and sensors '),(94,'slug',0,1,' handling systems '),(94,'title',0,1,' handling systems '),(96,'slug',0,1,' deployment frames floatation and buoys '),(96,'title',0,1,' deployment frames floatation and buoys '),(98,'slug',0,1,' cable wires and umbilical '),(98,'title',0,1,' cable wires and umbilical '),(100,'slug',0,1,' surface positioning '),(100,'title',0,1,' surface positioning '),(102,'slug',0,1,' unmanned survey vehicles '),(102,'title',0,1,' unmanned survey vehicles '),(104,'slug',0,1,' gyro motion and attitude sensors '),(104,'title',0,1,' gyro motion and attitude sensors '),(106,'slug',0,1,' dvl and adcp systems '),(106,'title',0,1,' dvl and adcp systems '),(108,'slug',0,1,' geotechnical '),(108,'title',0,1,' geotechnical '),(110,'slug',0,1,' environmental '),(110,'title',0,1,' environmental '),(112,'slug',0,1,' miscellaneous '),(112,'title',0,1,' miscellaneous '),(114,'slug',0,1,' temp iedbxeeryfkmpezifcgwlnnjmaboaklbhvim '),(114,'title',0,1,''),(132,'slug',0,1,' subsea positioning '),(132,'title',0,1,' subsea positioning '),(134,'slug',0,1,' test '),(134,'title',0,1,' test '),(139,'field',1,1,''),(139,'slug',0,1,' equipment list '),(139,'title',0,1,' equipment list '),(140,'slug',0,1,' temp fiykpmkevjrdysqaaulhhqsuxpohlagbmgai '),(140,'title',0,1,''),(142,'slug',0,1,' equipment wanted '),(142,'title',0,1,' equipment wanted '),(144,'slug',0,1,' services '),(144,'title',0,1,' services '),(146,'slug',0,1,' about '),(146,'title',0,1,' about '),(148,'slug',0,1,' contact '),(148,'title',0,1,' contact '),(157,'slug',0,1,' surveysearch '),(157,'title',0,1,' surveysearch '),(159,'alt',0,1,''),(159,'extension',0,1,' svg '),(159,'filename',0,1,' group 16 2025 06 23 112006 jwgf svg '),(159,'kind',0,1,' image '),(159,'slug',0,1,''),(159,'title',0,1,' group 16 '),(160,'alt',0,1,''),(160,'extension',0,1,' svg '),(160,'filename',0,1,' group 16 svg '),(160,'kind',0,1,' image '),(160,'slug',0,1,''),(160,'title',0,1,' group 16 '),(161,'alt',0,1,''),(161,'extension',0,1,' png '),(161,'filename',0,1,' group 16 png '),(161,'kind',0,1,' image '),(161,'slug',0,1,''),(161,'title',0,1,' group 16 '),(162,'alt',0,1,''),(162,'extension',0,1,' png '),(162,'filename',0,1,' group 16 png '),(162,'kind',0,1,' image '),(162,'slug',0,1,''),(162,'title',0,1,' group 16 '),(163,'alt',0,1,''),(163,'extension',0,1,' svg '),(163,'filename',0,1,' site logo svg '),(163,'kind',0,1,' image '),(163,'slug',0,1,''),(163,'title',0,1,' site logo '),(166,'alt',0,1,''),(166,'extension',0,1,' png '),(166,'filename',0,1,' header image main twi png '),(166,'kind',0,1,' image '),(166,'slug',0,1,''),(166,'title',0,1,' header image main twi '),(167,'field',8,1,' specialist underwater brokerage '),(167,'field',9,1,' global specialists in used rov and survey equipment provision of high quality subsea equipment from trusted sellers worldwide '),(167,'slug',0,1,' temp ecilgedgwxwgkcrvmfdzsnlhgtusvdvjgypi '),(167,'title',0,1,''),(179,'alt',0,1,''),(179,'extension',0,1,' svg '),(179,'filename',0,1,' group 76 svg '),(179,'kind',0,1,' image '),(179,'slug',0,1,''),(179,'title',0,1,' survey search logo '),(180,'alt',0,1,''),(180,'extension',0,1,' svg '),(180,'filename',0,1,' group 77 svg '),(180,'kind',0,1,' image '),(180,'slug',0,1,''),(180,'title',0,1,' deep search logo '),(181,'alt',0,1,''),(181,'extension',0,1,' png '),(181,'filename',0,1,' on deck flatholm surveysearch cover png '),(181,'kind',0,1,' image '),(181,'slug',0,1,''),(181,'title',0,1,' on deck flat holm surveysearch cover '),(182,'alt',0,1,''),(182,'extension',0,1,' png '),(182,'filename',0,1,' img 5182 cleaned png '),(182,'kind',0,1,' image '),(182,'slug',0,1,''),(182,'title',0,1,' img 5182 cleaned '),(186,'field',8,1,' browse enquire purchase deploy '),(186,'field',9,1,' explore our extensive inventory designed to meet your operational needs and elevate your projects '),(186,'slug',0,1,' temp vppljthoycypbgzhbldwcfackxtqaetandju '),(186,'title',0,1,''),(187,'slug',0,1,' temp gucwcgecjpuhxctdqckvzswiofvhavbmyclz '),(187,'title',0,1,''),(188,'slug',0,1,' temp bubkzdiwipelipoeudogwrhhqgdpstgzsjob '),(188,'title',0,1,''),(193,'slug',0,1,' equipment list '),(193,'title',0,1,' equipment list '),(195,'slug',0,1,' temp rtivngbnfjlospvgmslxuezbjjshqvgbdwzd '),(195,'title',0,1,''),(206,'alt',0,1,''),(206,'extension',0,1,' png '),(206,'filename',0,1,' rov lifted out of the sea png '),(206,'kind',0,1,' image '),(206,'slug',0,1,''),(206,'title',0,1,' rov lifted out of the sea '),(211,'slug',0,1,' temp sqoitbxksnsxawmfmaanlywdkubehqqdgztz '),(211,'title',0,1,''),(212,'field',9,1,' how it works the smarter way to source effortless multi item enquiries streamline your purchasing process with our multi item enquiry feature intuitive searchable database easily navigate our user friendly database to find equipment your equipment just a click away access detailed listings with photos and specifications effortlessly '),(212,'slug',0,1,' temp oulyfjxuwbxgxapdnknhyxuktxigrcyyhgcn '),(212,'title',0,1,''),(213,'field',9,1,' why choose specialist underwater brokerage trusted experts in rov and survey equipment immediate availability no long lead times access to hard to source subsea equipment trusted brokerage with over 20 years of experience personal expert advice tailored to your project needs '),(213,'slug',0,1,' temp xulizreymmumdmhringljqjuxxqfdvyhxtaz '),(213,'title',0,1,''),(218,'alt',0,1,''),(218,'extension',0,1,' png '),(218,'filename',0,1,' adobestock 832269854 preview png '),(218,'kind',0,1,' image '),(218,'slug',0,1,''),(218,'title',0,1,' adobe stock 832269854 preview '),(249,'field',9,1,' get our lists straight to your inbox stay informed with a monthly round up of available rov and survey equipment no spam just one issue of both deepsearch and surveysearch each month '),(249,'slug',0,1,' temp ujqpkhcdcrlqzkhzgkqluxkmvfwyaefuarcs '),(249,'title',0,1,''),(252,'field',4,1,' sales sub ltd com 44 0 1224 471013 '),(252,'field',9,1,' specialist underwater brokerage global specialists in the brokerage of used rov and survey equipment broomfield ellon aberdeenshire scotland ab41 8qy '),(252,'slug',0,1,''),(253,'slug',0,1,' privacy policy '),(253,'title',0,1,' privacy policy '),(255,'slug',0,1,' terms and conditions '),(255,'title',0,1,' terms and conditions '),(294,'slug',0,1,' temp goreoigebdiekmlxkmhuubqytbxgqzqhmmlu '),(294,'title',0,1,''),(335,'slug',0,1,' temp vjgaespxtbsiuqwvqptktycorfywhxgcqtlb '),(335,'title',0,1,''),(338,'slug',0,1,' temp eibxljseymicrlpzzsyfosqkvxbwmmrkumao '),(338,'title',0,1,''),(339,'slug',0,1,' temp kwkujvuxndriuggoabkdydztsoupsbzxbhzn '),(339,'title',0,1,''),(340,'alt',0,1,''),(340,'extension',0,1,' png '),(340,'filename',0,1,' cam png '),(340,'kind',0,1,' image '),(340,'slug',0,1,''),(340,'title',0,1,' cam '),(341,'alt',0,1,''),(341,'extension',0,1,' png '),(341,'filename',0,1,' ctr png '),(341,'kind',0,1,' image '),(341,'slug',0,1,''),(341,'title',0,1,' ctr '),(342,'alt',0,1,''),(342,'extension',0,1,' png '),(342,'filename',0,1,' ers png '),(342,'kind',0,1,' image '),(342,'slug',0,1,''),(342,'title',0,1,' ers '),(343,'alt',0,1,''),(343,'extension',0,1,' png '),(343,'filename',0,1,' mis png '),(343,'kind',0,1,' image '),(343,'slug',0,1,''),(343,'title',0,1,' mis '),(344,'alt',0,1,''),(344,'extension',0,1,' png '),(344,'filename',0,1,' mnp png '),(344,'kind',0,1,' image '),(344,'slug',0,1,''),(344,'title',0,1,' mnp '),(345,'alt',0,1,''),(345,'extension',0,1,' png '),(345,'filename',0,1,' mve png '),(345,'kind',0,1,' image '),(345,'slug',0,1,''),(345,'title',0,1,' mve '),(346,'alt',0,1,''),(346,'extension',0,1,' png '),(346,'filename',0,1,' ros png '),(346,'kind',0,1,' image '),(346,'slug',0,1,''),(346,'title',0,1,' ros '),(347,'alt',0,1,''),(347,'extension',0,1,' png '),(347,'filename',0,1,' rtg png '),(347,'kind',0,1,' image '),(347,'slug',0,1,''),(347,'title',0,1,' rtg '),(348,'alt',0,1,''),(348,'extension',0,1,' png '),(348,'filename',0,1,' rvm png '),(348,'kind',0,1,' image '),(348,'slug',0,1,''),(348,'title',0,1,' rvm '),(349,'alt',0,1,''),(349,'extension',0,1,' png '),(349,'filename',0,1,' snr png '),(349,'kind',0,1,' image '),(349,'slug',0,1,''),(349,'title',0,1,' snr '),(350,'alt',0,1,''),(350,'extension',0,1,' png '),(350,'filename',0,1,' spg png '),(350,'kind',0,1,' image '),(350,'slug',0,1,''),(350,'title',0,1,' spg '),(351,'alt',0,1,''),(351,'extension',0,1,' png '),(351,'filename',0,1,' thr png '),(351,'kind',0,1,' image '),(351,'slug',0,1,''),(351,'title',0,1,' thr '),(352,'alt',0,1,''),(352,'extension',0,1,' png '),(352,'filename',0,1,' tms png '),(352,'kind',0,1,' image '),(352,'slug',0,1,''),(352,'title',0,1,' tms '),(353,'alt',0,1,''),(353,'extension',0,1,' png '),(353,'filename',0,1,' umb png '),(353,'kind',0,1,' image '),(353,'slug',0,1,''),(353,'title',0,1,' umb '),(354,'alt',0,1,''),(354,'extension',0,1,' png '),(354,'filename',0,1,' wch png '),(354,'kind',0,1,' image '),(354,'slug',0,1,''),(354,'title',0,1,' wch '),(355,'alt',0,1,''),(355,'extension',0,1,' png '),(355,'filename',0,1,' wrs png '),(355,'kind',0,1,' image '),(355,'slug',0,1,''),(355,'title',0,1,' wrs '),(390,'slug',0,1,' micro '),(390,'title',0,1,' micro '),(392,'field',1,1,''),(392,'slug',0,1,' large '),(392,'title',0,1,' large '),(394,'field',1,1,''),(394,'slug',0,1,' medium '),(394,'title',0,1,' medium '),(402,'slug',0,1,' trenchers '),(402,'title',0,1,' trenchers '),(404,'slug',0,1,' grabs '),(404,'title',0,1,' grabs '),(406,'slug',0,1,' ploughs '),(406,'title',0,1,' ploughs '),(408,'slug',0,1,' cable equipment '),(408,'title',0,1,' cable equipment '),(410,'slug',0,1,' rov motors '),(410,'title',0,1,' rov motors '),(412,'slug',0,1,' look latches '),(412,'title',0,1,' look latches '),(414,'slug',0,1,' transformers pdus '),(414,'title',0,1,' transformers pdus '),(416,'slug',0,1,' buoyancy '),(416,'title',0,1,' buoyancy '),(418,'slug',0,1,' pcbs '),(418,'title',0,1,' pcbs '),(420,'slug',0,1,' electric thrusters '),(420,'title',0,1,' electric thrusters '),(422,'slug',0,1,' hydraulic thrusters '),(422,'title',0,1,' hydraulic thrusters '),(424,'slug',0,1,' launch recovery systems '),(424,'title',0,1,' launch recovery systems '),(426,'slug',0,1,' cranes '),(426,'title',0,1,' cranes '),(428,'slug',0,1,' winches '),(428,'title',0,1,' winches '),(430,'slug',0,1,' deck hpus '),(430,'title',0,1,' deck hpus '),(432,'slug',0,1,' a frames '),(432,'title',0,1,' a frames '),(434,'slug',0,1,' manipulators '),(434,'title',0,1,' manipulators '),(436,'slug',0,1,' parts spares '),(436,'title',0,1,' parts spares '),(438,'slug',0,1,' pipe cable trackers '),(438,'title',0,1,' pipe cable trackers '),(440,'slug',0,1,' altimeters depth sensors '),(440,'title',0,1,' altimeters depth sensors '),(442,'slug',0,1,' multiplexers muxes '),(442,'title',0,1,' multiplexers muxes '),(444,'slug',0,1,' doppler velocity log dvl '),(444,'title',0,1,' doppler velocity log dvl '),(446,'slug',0,1,' subsea gyros '),(446,'title',0,1,' subsea gyros '),(448,'slug',0,1,' lasers '),(448,'title',0,1,' lasers '),(450,'slug',0,1,' temp hduihjcfiftdtbeoufsotfjhisluquvvtzhu '),(450,'title',0,1,''),(457,'slug',0,1,' temp xyntawzovxbzwrmxeawxntffveespxxhpukr '),(457,'title',0,1,'');
/*!40000 ALTER TABLE `sub41_searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_searchindexqueue`
--

LOCK TABLES `sub41_searchindexqueue` WRITE;
/*!40000 ALTER TABLE `sub41_searchindexqueue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_searchindexqueue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_searchindexqueue_fields`
--

LOCK TABLES `sub41_searchindexqueue_fields` WRITE;
/*!40000 ALTER TABLE `sub41_searchindexqueue_fields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_searchindexqueue_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_sections`
--

LOCK TABLES `sub41_sections` WRITE;
/*!40000 ALTER TABLE `sub41_sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_sections` VALUES (1,1,'Pages','pages','structure',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-06-20 15:02:43','2025-06-20 15:02:43',NULL,'f5a66dd0-a9c7-408c-b28f-6409042afd08'),(2,NULL,'Homepage','homepage','single',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-06-20 15:02:44','2025-06-20 15:02:44',NULL,'409531c9-59ff-4658-9ca0-41d34bc7bc30'),(3,2,'Equipment List Pages','equipmentListPages','structure',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-06-23 08:15:53','2025-06-23 08:15:53',NULL,'1ed4c77a-2163-41cd-a3b4-dac5650b0ea3');
/*!40000 ALTER TABLE `sub41_sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_sections_entrytypes`
--

LOCK TABLES `sub41_sections_entrytypes` WRITE;
/*!40000 ALTER TABLE `sub41_sections_entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_sections_entrytypes` VALUES (1,2,1,NULL,NULL),(2,2,1,NULL,NULL),(3,13,1,NULL,NULL);
/*!40000 ALTER TABLE `sub41_sections_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_sections_sites`
--

LOCK TABLES `sub41_sections_sites` WRITE;
/*!40000 ALTER TABLE `sub41_sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_sections_sites` VALUES (1,1,1,1,'{slug}','pages/_entry.twig',1,'2025-06-20 15:02:43','2025-06-20 15:02:43','cccad64a-6048-4437-9e34-d20609319c95'),(2,2,1,1,'__home__','pages/_homepage.twig',1,'2025-06-20 15:02:44','2025-06-20 15:02:44','2c60485e-1900-4c7d-96ba-318571c0aa8b'),(3,3,1,1,'{parent.uri}/{slug}','equipment-list/_entry.twig',1,'2025-06-23 08:15:53','2025-06-24 13:02:15','96c7a4b1-db59-4422-ad1e-21243d12d905');
/*!40000 ALTER TABLE `sub41_sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_sequences`
--

LOCK TABLES `sub41_sequences` WRITE;
/*!40000 ALTER TABLE `sub41_sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_shunnedmessages`
--

LOCK TABLES `sub41_shunnedmessages` WRITE;
/*!40000 ALTER TABLE `sub41_shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_sitegroups`
--

LOCK TABLES `sub41_sitegroups` WRITE;
/*!40000 ALTER TABLE `sub41_sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_sitegroups` VALUES (1,'Sub','2025-06-20 15:02:43','2025-06-20 15:02:43',NULL,'4494340c-3b4f-4bb8-a887-fa3b6f110dc1');
/*!40000 ALTER TABLE `sub41_sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_sites`
--

LOCK TABLES `sub41_sites` WRITE;
/*!40000 ALTER TABLE `sub41_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_sites` VALUES (1,1,1,'1','Sub','default','en',1,'http://sub.ddev.site/',1,'2025-06-20 15:02:43','2025-06-20 15:02:44',NULL,'8c5c2d88-d621-448b-81ae-1f21849e4f56');
/*!40000 ALTER TABLE `sub41_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_sso_identities`
--

LOCK TABLES `sub41_sso_identities` WRITE;
/*!40000 ALTER TABLE `sub41_sso_identities` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_sso_identities` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_structureelements`
--

LOCK TABLES `sub41_structureelements` WRITE;
/*!40000 ALTER TABLE `sub41_structureelements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_structureelements` VALUES (1,1,NULL,1,1,18,0,'2025-06-20 15:05:33','2025-06-25 10:32:06','0edb3116-4370-4976-9a82-c869d45006ad'),(2,1,4,1,2,3,1,'2025-06-20 15:05:33','2025-06-20 15:05:33','56f1ffd9-0e8c-4586-bfc3-fff773893148'),(3,2,NULL,3,1,132,0,'2025-06-23 08:17:22','2025-06-26 08:23:31','4680a086-49f8-45e5-a714-8ed25883d6db'),(20,2,50,3,3,94,2,'2025-06-23 08:20:32','2025-06-26 08:23:31','8b94aec8-626d-4973-92c6-3d2873373048'),(21,2,52,3,4,5,3,'2025-06-23 08:24:15','2025-06-25 13:32:17','4593cec2-b206-4fbd-ad04-d68de24dd007'),(22,2,54,3,8,17,3,'2025-06-23 08:24:15','2025-06-26 08:23:31','43d3d6d5-3a35-4d9d-9fad-d8248a5bc9a2'),(23,2,56,3,24,33,3,'2025-06-23 08:24:15','2025-06-26 08:23:31','f68ed5c8-8d8a-4300-99e1-0c42e911984d'),(24,2,58,3,36,47,3,'2025-06-23 08:24:15','2025-06-26 08:23:31','8f308359-937d-42ac-bbc1-5893f152f0c6'),(25,2,60,3,62,67,3,'2025-06-23 08:24:15','2025-06-26 08:23:31','9e9fd612-350c-4ec0-af07-4e385db392d5'),(26,2,62,3,72,73,3,'2025-06-23 08:24:15','2025-06-26 08:23:31','58e96640-d6f3-4869-a1c0-a2bee68f469a'),(27,2,64,3,76,77,3,'2025-06-23 08:24:16','2025-06-26 08:23:31','167c7d75-704e-4c43-ba32-7aa2ea6e1b43'),(28,2,66,3,80,91,3,'2025-06-23 08:24:16','2025-06-26 08:23:31','0dbd4bf8-8b11-4b20-9e3f-fa10f6a088df'),(29,2,68,3,6,7,3,'2025-06-23 08:24:16','2025-06-25 13:32:17','8df8bba5-c31f-4eed-b74e-e6f68fc57f0e'),(30,2,70,3,18,23,3,'2025-06-23 08:24:16','2025-06-26 08:23:31','418a40c5-e645-4c29-a790-ff8a07b91077'),(31,2,72,3,34,35,3,'2025-06-23 08:24:16','2025-06-26 08:23:31','b486a663-4626-4138-9086-dea6f124af34'),(32,2,74,3,48,61,3,'2025-06-23 08:24:16','2025-06-26 08:23:31','8159cf49-27e1-47b9-81cd-c91337cbf19a'),(33,2,76,3,68,71,3,'2025-06-23 08:24:16','2025-06-26 08:23:31','2c51b13e-6702-4c39-af42-0fe787e88211'),(34,2,78,3,74,75,3,'2025-06-23 08:24:16','2025-06-26 08:23:31','315ea7e9-cb3a-49bf-b2cf-bcff7d5a71c9'),(35,2,80,3,78,79,3,'2025-06-23 08:24:16','2025-06-26 08:23:31','18b1b415-82f1-4a80-a764-454d1f6868f0'),(36,2,82,3,92,93,3,'2025-06-23 08:24:16','2025-06-26 08:23:31','016bf6e3-7691-4591-92e1-27f0be6a2b9b'),(37,2,84,3,95,124,2,'2025-06-23 08:24:16','2025-06-26 08:23:31','3b8211c6-346d-4bef-940e-d11a6317db93'),(38,2,88,3,96,97,3,'2025-06-23 08:25:42','2025-06-26 08:23:31','1c3f2221-8866-4b82-9af9-319178c39bc9'),(39,2,90,3,100,101,3,'2025-06-23 08:26:31','2025-06-26 08:23:31','bdda84cf-e1ae-4609-a233-b260fada2206'),(40,2,92,3,104,105,3,'2025-06-23 08:26:35','2025-06-26 08:23:31','edf0a065-15f4-4524-8769-2330246ffcd9'),(41,2,94,3,108,109,3,'2025-06-23 08:26:44','2025-06-26 08:23:31','e67f5ad1-77c4-464c-9248-30496bba6a85'),(42,2,96,3,112,113,3,'2025-06-23 08:26:55','2025-06-26 08:23:31','e93c90ee-35f9-40fa-a9dc-e7a517c3d8bf'),(43,2,98,3,116,117,3,'2025-06-23 08:27:24','2025-06-26 08:23:31','fcf520e2-425a-477d-8247-f85171cd8937'),(44,2,100,3,120,121,3,'2025-06-23 08:27:31','2025-06-26 08:23:31','baf0cdeb-5d6a-4040-85be-abcc306221c2'),(45,2,102,3,98,99,3,'2025-06-23 08:27:35','2025-06-26 08:23:31','8f18ff26-da46-4c8e-a129-9a489b46cfd6'),(46,2,104,3,102,103,3,'2025-06-23 08:30:24','2025-06-26 08:23:31','d7cafdf2-1db3-46ce-b03d-130f9410290f'),(47,2,106,3,106,107,3,'2025-06-23 08:30:32','2025-06-26 08:23:31','60e05b1c-0f05-44e8-a85d-b078bc14318e'),(48,2,108,3,110,111,3,'2025-06-23 08:30:42','2025-06-26 08:23:31','793323d4-88fd-4fd2-9095-a19dc6952d46'),(49,2,110,3,114,115,3,'2025-06-23 08:30:51','2025-06-26 08:23:31','72b0d81c-46b9-481f-a3c5-6155fa3ab160'),(50,2,112,3,118,119,3,'2025-06-23 08:31:00','2025-06-26 08:23:31','c54fae20-b43a-4393-8a53-8c8557e83e4e'),(52,2,132,3,122,123,3,'2025-06-23 08:37:10','2025-06-26 08:23:31','8f1ddb14-d045-433e-9bcc-6c064f2c52e6'),(55,1,142,1,4,5,1,'2025-06-23 10:17:10','2025-06-24 13:01:26','8c8b81fc-b813-4f57-8dc8-511acbfe6842'),(56,1,144,1,6,7,1,'2025-06-23 10:17:21','2025-06-24 13:01:26','0c62758b-a375-4f07-8277-a0f2ad4c83e2'),(57,1,146,1,8,9,1,'2025-06-23 10:17:36','2025-06-24 13:01:26','5847acb7-a918-4726-a12f-600932044b50'),(58,1,148,1,10,11,1,'2025-06-23 10:17:46','2025-06-24 13:01:26','84d9132f-8f46-4aae-861e-5992a1b15fbd'),(59,2,193,3,2,125,1,'2025-06-24 13:00:45','2025-06-26 08:23:31','14a5827d-4608-4c44-83d0-a59671c248ce'),(60,1,195,1,12,13,1,'2025-06-24 13:01:27','2025-06-24 13:01:27','e7c79293-bdab-474a-aa33-5b699b3281d8'),(61,1,253,1,14,15,1,'2025-06-25 10:31:58','2025-06-25 10:31:58','3204d9ec-f63f-4bbc-9d71-5fd7f659257f'),(62,1,255,1,16,17,1,'2025-06-25 10:32:06','2025-06-25 10:32:06','ccabe56f-a098-4819-a0c1-36e79a3f047f'),(63,2,294,3,126,127,1,'2025-06-25 11:45:25','2025-06-26 08:23:31','756520cb-9196-4a03-8a5c-c035c788ace5'),(64,2,338,3,128,129,1,'2025-06-25 13:19:13','2025-06-26 08:23:31','e81cee8f-fb80-4c7b-8207-0dcdfc982d7a'),(65,2,339,3,130,131,1,'2025-06-25 13:25:26','2025-06-26 08:23:31','f0ea29f1-c6b4-41fc-9e0e-63b99b874137'),(66,2,390,3,9,12,4,'2025-06-25 14:00:16','2025-06-26 08:23:31','d0a06b56-44d1-497a-a23a-9341e1ec73de'),(67,2,392,3,15,16,4,'2025-06-25 14:15:58','2025-06-26 08:23:31','a9b0cf48-fb3b-41a9-98c5-de7f28da7b56'),(68,2,394,3,13,14,4,'2025-06-25 14:16:05','2025-06-26 08:23:31','b27d99e5-ad61-4b3e-bac4-b571c5ce2a0b'),(69,2,402,3,25,26,4,'2025-06-25 14:17:01','2025-06-26 08:23:31','922030c2-8d1e-496a-8912-281339a0b4fa'),(70,2,404,3,27,28,4,'2025-06-25 14:17:23','2025-06-26 08:23:31','949979d2-9732-4920-ae22-7602f4e9a615'),(71,2,406,3,29,30,4,'2025-06-25 14:17:31','2025-06-26 08:23:31','502df9e1-633e-44b4-8a12-b8940e192972'),(72,2,408,3,31,32,4,'2025-06-25 14:17:44','2025-06-26 08:23:31','222722fd-279f-4681-8617-573c1d49e795'),(73,2,410,3,37,38,4,'2025-06-25 14:17:58','2025-06-26 08:23:31','efba6bf3-a558-4d5e-9b03-3a78b071738d'),(74,2,412,3,39,40,4,'2025-06-25 14:18:19','2025-06-26 08:23:31','78ca31a9-76df-4157-8796-91c73dd70d37'),(75,2,414,3,41,42,4,'2025-06-25 14:18:28','2025-06-26 08:23:31','a7708bd0-4718-4bce-8d8a-b11ffb9ca4ef'),(76,2,416,3,43,44,4,'2025-06-25 14:18:39','2025-06-26 08:23:31','e4c94a5c-e85b-4bf0-9996-0dfa90cc9425'),(77,2,418,3,45,46,4,'2025-06-25 14:18:54','2025-06-26 08:23:31','2292d617-1f7e-4e3e-a91d-a066bef01bcd'),(78,2,420,3,63,64,4,'2025-06-25 14:18:58','2025-06-26 08:23:31','52247d55-c8a5-4d71-97d8-a4e6a01e0db0'),(79,2,422,3,65,66,4,'2025-06-25 14:19:22','2025-06-26 08:23:31','507a9559-1359-40f0-9099-98924b8a3944'),(80,2,424,3,81,82,4,'2025-06-25 14:19:29','2025-06-26 08:23:31','4d229578-1944-451e-ae51-0cd2048c1964'),(81,2,426,3,83,84,4,'2025-06-25 14:20:31','2025-06-26 08:23:31','3865be6a-a32a-4ee6-80ef-eae3d968b17e'),(82,2,428,3,85,86,4,'2025-06-25 14:20:34','2025-06-26 08:23:31','450928e9-ee9a-4a69-9bc2-19cf5c48cb9b'),(83,2,430,3,87,88,4,'2025-06-25 14:20:39','2025-06-26 08:23:31','ed0106ab-5c8f-4fe8-a64f-06a1925f5107'),(84,2,432,3,89,90,4,'2025-06-25 14:20:43','2025-06-26 08:23:31','ee18be9e-a072-4c06-9b7f-c86dd824a105'),(85,2,434,3,19,20,4,'2025-06-25 14:20:50','2025-06-26 08:23:31','a1365682-c00d-4986-af7a-70b8d1c1780f'),(86,2,436,3,21,22,4,'2025-06-25 14:21:13','2025-06-26 08:23:31','ecaea2bb-c909-4ab1-8dfe-a2d060d55cc3'),(87,2,438,3,49,50,4,'2025-06-25 14:21:18','2025-06-26 08:23:31','769af515-26fd-42da-a03f-bdb8a1ab4550'),(88,2,440,3,51,52,4,'2025-06-25 14:22:31','2025-06-26 08:23:31','92d6fb2e-abec-42cc-84f6-fb49f9fbb3f8'),(89,2,442,3,53,54,4,'2025-06-25 14:22:36','2025-06-26 08:23:31','39fc4f40-e419-4da2-a997-f1384a8d4834'),(90,2,444,3,55,56,4,'2025-06-25 14:22:56','2025-06-26 08:23:31','35df972f-c2f4-4545-a2fb-0fce03f22cb4'),(91,2,446,3,57,58,4,'2025-06-25 14:23:01','2025-06-26 08:23:31','6243042c-526c-436a-816e-e1d50dae6245'),(92,2,448,3,59,60,4,'2025-06-25 14:23:08','2025-06-26 08:23:31','ed44b66c-2c1c-4c02-a9c5-bfdc9b7d6e47'),(93,2,450,3,69,70,4,'2025-06-25 14:23:13','2025-06-26 08:23:31','1f476543-3027-4c17-a81c-5470fda6ad0a'),(94,2,457,3,10,11,5,'2025-06-26 08:23:24','2025-06-26 08:23:31','b3005375-2bfb-4f0c-bb6b-aed4998fca59');
/*!40000 ALTER TABLE `sub41_structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_structures`
--

LOCK TABLES `sub41_structures` WRITE;
/*!40000 ALTER TABLE `sub41_structures` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_structures` VALUES (1,NULL,'2025-06-20 15:02:43','2025-06-20 15:02:43',NULL,'51e8ef33-d244-49d5-9d79-5cf401a2f73b'),(2,NULL,'2025-06-23 08:15:53','2025-06-23 08:15:53',NULL,'c20f52ad-af4e-477b-937d-cb457c3c7108');
/*!40000 ALTER TABLE `sub41_structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_systemmessages`
--

LOCK TABLES `sub41_systemmessages` WRITE;
/*!40000 ALTER TABLE `sub41_systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_taggroups`
--

LOCK TABLES `sub41_taggroups` WRITE;
/*!40000 ALTER TABLE `sub41_taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_tags`
--

LOCK TABLES `sub41_tags` WRITE;
/*!40000 ALTER TABLE `sub41_tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_tokens`
--

LOCK TABLES `sub41_tokens` WRITE;
/*!40000 ALTER TABLE `sub41_tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_usergroups`
--

LOCK TABLES `sub41_usergroups` WRITE;
/*!40000 ALTER TABLE `sub41_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_usergroups_users`
--

LOCK TABLES `sub41_usergroups_users` WRITE;
/*!40000 ALTER TABLE `sub41_usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_userpermissions`
--

LOCK TABLES `sub41_userpermissions` WRITE;
/*!40000 ALTER TABLE `sub41_userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_userpermissions_usergroups`
--

LOCK TABLES `sub41_userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `sub41_userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_userpermissions_users`
--

LOCK TABLES `sub41_userpermissions_users` WRITE;
/*!40000 ALTER TABLE `sub41_userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_userpreferences`
--

LOCK TABLES `sub41_userpreferences` WRITE;
/*!40000 ALTER TABLE `sub41_userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_userpreferences` VALUES (3,'{\"language\": \"en\"}');
/*!40000 ALTER TABLE `sub41_userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_users`
--

LOCK TABLES `sub41_users` WRITE;
/*!40000 ALTER TABLE `sub41_users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_users` VALUES (3,NULL,NULL,1,0,0,0,1,'dev@in-testing.co.uk',NULL,NULL,NULL,'dev@in-testing.co.uk','$2y$13$6AT84sAnPmikFRnImj92JumcL6goE89MnRcnaNH3/8uHZPFjAWqdK','2025-06-26 08:20:42',NULL,NULL,NULL,'2025-06-23 11:35:07',NULL,1,NULL,NULL,NULL,0,'2025-06-23 11:39:37','2025-06-20 15:02:44','2025-06-26 08:20:42');
/*!40000 ALTER TABLE `sub41_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_volumefolders`
--

LOCK TABLES `sub41_volumefolders` WRITE;
/*!40000 ALTER TABLE `sub41_volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_volumefolders` VALUES (1,NULL,1,'Images',NULL,'2025-06-20 15:02:43','2025-06-20 15:02:43','a11d6b7a-95a4-492e-9104-71d3a23665c3'),(2,NULL,NULL,'Temporary Uploads',NULL,'2025-06-20 15:48:48','2025-06-20 15:48:48','ea75e88f-1048-4224-a25b-2fea112f4114'),(3,2,NULL,'user_3','user_3/','2025-06-20 15:48:48','2025-06-20 15:48:48','a0863162-d030-4465-a28a-36a0eb07940d'),(4,NULL,2,'Images','','2025-06-23 11:24:17','2025-06-23 11:24:17','8ba28de8-eed6-46cc-9512-bc5fe066d628');
/*!40000 ALTER TABLE `sub41_volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_volumes`
--

LOCK TABLES `sub41_volumes` WRITE;
/*!40000 ALTER TABLE `sub41_volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_volumes` VALUES (1,1,'Images','images','hardDisk','images','hardDisk','images','site',NULL,'none',NULL,1,'2025-06-20 15:02:43','2025-06-23 10:49:59','2025-06-23 11:23:09','d7f59e0c-7ed8-4d30-9158-d2c7e9c97d42'),(2,8,'Images','images','hardDisk','images','','images','site',NULL,'none',NULL,2,'2025-06-23 11:24:17','2025-06-23 11:24:17',NULL,'f455cfbd-b7d8-4140-a7d2-4121bb10fbbd');
/*!40000 ALTER TABLE `sub41_volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_webauthn`
--

LOCK TABLES `sub41_webauthn` WRITE;
/*!40000 ALTER TABLE `sub41_webauthn` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sub41_webauthn` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sub41_widgets`
--

LOCK TABLES `sub41_widgets` WRITE;
/*!40000 ALTER TABLE `sub41_widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sub41_widgets` VALUES (1,3,'craft\\widgets\\RecentEntries',1,NULL,'{\"limit\": 10, \"siteId\": 1, \"section\": \"*\"}',1,'2025-06-20 15:05:12','2025-06-20 15:05:12','ebec3e5f-1261-4586-ad5a-5c506cf85e41'),(2,3,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2025-06-20 15:05:12','2025-06-20 15:05:12','206af08d-5b40-49a7-8824-aa3f2ae86bf9'),(3,3,'craft\\widgets\\Updates',3,NULL,'[]',1,'2025-06-20 15:05:12','2025-06-20 15:05:12','24fe6591-b1be-4ee5-af3c-7edd9bba02f6'),(4,3,'craft\\widgets\\Feed',4,NULL,'{\"url\": \"https://craftcms.com/news.rss\", \"limit\": 5, \"title\": \"Craft News\"}',1,'2025-06-20 15:05:12','2025-06-20 15:05:12','3de7498a-8d8d-4e93-8953-1a90771404c5');
/*!40000 ALTER TABLE `sub41_widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-26  9:06:09
