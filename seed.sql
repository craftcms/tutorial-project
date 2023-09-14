-- MariaDB dump 10.19  Distrib 10.5.19-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.20.04.2

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `ownerId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
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
  KEY `fk_pxedcfodnxhcakifamjsxlxyqrrioijzetjr` (`ownerId`),
  CONSTRAINT `fk_pxedcfodnxhcakifamjsxlxyqrrioijzetjr` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tvzrvrxgrqitxjuhpsegukaaqifkkbxeykfs` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_xsgzdfbsgnyiuclvoeptssdctlipdiifipuo` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_piczlwdzcdehbvjoyjiowzlsvmnhbihwmkes` (`dateRead`),
  KEY `fk_bfopnatqbqveufooxehsptbieqitexvoorss` (`pluginId`),
  CONSTRAINT `fk_bfopnatqbqveufooxehsptbieqitexvoorss` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rnngklugnmbtfoziclaeptuzstkntahkzgik` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
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
  KEY `idx_qizttamknjfxvsxtipsrbowlvrghcvwguceq` (`sessionId`,`volumeId`),
  KEY `idx_ankfubtqzlkysxijuvwcufjmhjskaxbdnsai` (`volumeId`),
  CONSTRAINT `fk_amcefuacvrtxvvyvkwfnzkcthhiwjmlqncse` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uouipqkazrtfwfwrnlqewvvmbmyjrqcvbjip` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexingsessions` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
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
  KEY `idx_cltjpgvmofburqfvuqnukzifzmkjzvdifdzo` (`filename`,`folderId`),
  KEY `idx_btwtuoyhzhzfnhjatrrldfrtwssjvqduzyph` (`folderId`),
  KEY `idx_duuftvrxrukjoekrjtyiwzocbxvrjbmswvwx` (`volumeId`),
  KEY `fk_tfxaxdsgdtlbknaojfcwwnswhbtuudfoacac` (`uploaderId`),
  CONSTRAINT `fk_apwfskcovzgovzucdcxirmkgkrcykoqwosli` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mcqcwrsgxfhrxebhdgtbynnsyxirfwsjkdzm` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tfxaxdsgdtlbknaojfcwwnswhbtuudfoacac` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_uzwmjgqkseomqjelvtodomqaaitbsolwqxvq` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aeftpakodqnbfstqlabqraugrzddktrbxwik` (`groupId`),
  KEY `fk_hispinkmzguohpmhvuaxreksbwjzwbkapitg` (`parentId`),
  CONSTRAINT `fk_hispinkmzguohpmhvuaxreksbwjzwbkapitg` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_rddquctjkwduscswjczpmzdfognnyhfmdayu` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sapormpgldlatfxrntwfwyfimhkjcgdcqckq` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
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
  KEY `idx_senzpdrbfnwcckgphqvxbtcmfznxttfnmact` (`name`),
  KEY `idx_pthxdcltxuamakipkajbznmdewubiriwbdmb` (`handle`),
  KEY `idx_cmrxiyjdeeqwdiosjgdiigyonvnaewfzwppt` (`structureId`),
  KEY `idx_ujkhbneqjigffgoteyqymhacmycvcrbxirtn` (`fieldLayoutId`),
  KEY `idx_wpuhqpmnphrdllxfpghfrfmzymmqecyifizh` (`dateDeleted`),
  CONSTRAINT `fk_dvczyrmthftvdevzrhpfaaobtwmfvissugqj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_rvfduazrgupjrsgeldfslljxssatrwfmcwmd` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
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
  UNIQUE KEY `idx_gyibctepmbplpcrzurtillkepqtdvjwhbald` (`groupId`,`siteId`),
  KEY `idx_zcharmrlearnysxytivbpmpwfskrcqmgdqck` (`siteId`),
  CONSTRAINT `fk_bvxiuhierzhxihxljipmxiqsjmnqdohevorf` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_uuncgqmepumfsiiekqeboobpgwigvxqgawyw` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_cplyuqzkobssuqbazycbrlqenljszxxsffkw` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_bullmmgymhdplncleyrbxpuntpufkuuuzlej` (`siteId`),
  KEY `fk_hquzoywmxzixyfbzvpvgrloerdbmozjqgxjz` (`userId`),
  CONSTRAINT `fk_bullmmgymhdplncleyrbxpuntpufkuuuzlej` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_hquzoywmxzixyfbzvpvgrloerdbmozjqgxjz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_lxgmdrzkcbtuhguqveoepsrizvweoiodqoqd` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_qxswahfusfzjlaypmccyznkhgyxwfydyppbp` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_nosfxmqgglpxcuktlhhcsmovphuufttwwvrg` (`siteId`),
  KEY `fk_urzdltxzvfzygdxalkslcaqnupeevfipybbz` (`fieldId`),
  KEY `fk_zkudfsfgtpaxljcfoljzxkglnoeuqeilywxl` (`userId`),
  CONSTRAINT `fk_nosfxmqgglpxcuktlhhcsmovphuufttwwvrg` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_qjgceopvauzgjzxbejlvqpdddmxswxbhfhlw` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_urzdltxzvfzygdxalkslcaqnupeevfipybbz` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zkudfsfgtpaxljcfoljzxkglnoeuqeilywxl` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_summary_kxpmnqno` text,
  `field_description_cyaftqpy` text,
  `field_bio_ikcydbdr` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cqnqglybqqtzlgrsrwjppmnypitawbmeqtia` (`elementId`,`siteId`),
  KEY `idx_gzssnrwztklevzujsqvsuzztwioilrnarlae` (`siteId`),
  KEY `idx_nytqjfjboxuffphtiztvbrmyppgkuyeuilhc` (`title`),
  CONSTRAINT `fk_cmuzwlrqfbtnkxteztcbgzypmmosulcfrvdd` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vouhlbbcawcbimpcyhfdwcalzlmosgkntwcl` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_ddqipnxhlyturknzmabvdmakpfsyvdqgqetf` (`userId`),
  CONSTRAINT `fk_ddqipnxhlyturknzmabvdmakpfsyvdqgqetf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uzxxdyqmjqqghnmwtpjycytvwdgvbmlbxxtl` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
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
  KEY `idx_wobsgzmbgdtlmruhtnomkrzzoskzoraphkhc` (`creatorId`,`provisional`),
  KEY `idx_stnwknphninhjwqghktjudlnomijnfyclalo` (`saved`),
  KEY `fk_fzzphkliwtkyntorpdnuupjcmdjypcwbkprt` (`canonicalId`),
  CONSTRAINT `fk_bbxwyrwbumaytwettewniuncklmceetnhxog` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_fzzphkliwtkyntorpdnuupjcmdjypcwbkprt` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_eppuyvpycggmxfrlirhwrqstwfziqdprcpyw` (`elementId`,`timestamp`,`userId`),
  KEY `fk_cliqanhzthrkzdykwsnlpzydwzolpuuyzhmq` (`userId`),
  KEY `fk_cyyviolhzvfinpbddasfjbulsgugfycsnnbd` (`siteId`),
  KEY `fk_tsoctyazunjzsypanyroamckmkswsfeahxkf` (`draftId`),
  CONSTRAINT `fk_cliqanhzthrkzdykwsnlpzydwzolpuuyzhmq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cyyviolhzvfinpbddasfjbulsgugfycsnnbd` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_enzbijrasxnkrlpsibrxpstikuhkhvnjiwle` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tsoctyazunjzsypanyroamckmkswsfeahxkf` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
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
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_clfdmvkeljujxyrotmxkzkbvmsttndtvayej` (`dateDeleted`),
  KEY `idx_rfqdhudvhdilrvahcjelgkscdrfxyeplevph` (`fieldLayoutId`),
  KEY `idx_gmtedjmegyverejrfxxolqliirahrmwhqfwp` (`type`),
  KEY `idx_voymrvjfwjipbnvqklbmuuaomdmlsvugrguh` (`enabled`),
  KEY `idx_pqwibbcovofqgqbrckrfrnwxugalaxkzjyni` (`archived`,`dateCreated`),
  KEY `idx_djcudzegowwvpyoipdcyfmflqaccekaswhqf` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_gvfpxavggmswzjqxprjylhejnciviwvzmmje` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_unsdrejedchspzznwkrixxgetplehuynjkvw` (`canonicalId`),
  KEY `fk_tleryzhyxmksjiwnxkyyjzxvkehdxhgbxchj` (`draftId`),
  KEY `fk_cyinlrhurdjsmnbbcidxauaovqmkhlffpxhi` (`revisionId`),
  CONSTRAINT `fk_cyinlrhurdjsmnbbcidxauaovqmkhlffpxhi` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_imwqtsmtuxddixdqhflkkrdrxbtaremvcpqq` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tleryzhyxmksjiwnxkyyjzxvkehdxhgbxchj` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_unsdrejedchspzznwkrixxgetplehuynjkvw` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_okvofbhlvfmrfvtgifuhyxagkmeazlxmpuci` (`elementId`,`siteId`),
  KEY `idx_sqbjqromwgqmmusxzrkqoumdgoonppoavefh` (`siteId`),
  KEY `idx_swxcnzhjveaqyfdlevgxzdqhhqdvimcljnoi` (`slug`,`siteId`),
  KEY `idx_hrafmyyhbkvzeemaoofwvpxtldvgozmeidqv` (`enabled`),
  KEY `idx_vzvrzibrjvadcabhpgkhyzqadswfywdhqjmh` (`uri`,`siteId`),
  CONSTRAINT `fk_gcdqmxnkbrzcwjlhxurtbkpdsigsqonwxtdx` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pnzjrnarhrmqwdawqbnonbyavampxobihucl` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `authorId` int DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_thmnvpawozqmtxwmmtqpkwumsvktoutthmlz` (`postDate`),
  KEY `idx_vvfsxnfdetcvfdtuqqkulluxweqevgfracxd` (`expiryDate`),
  KEY `idx_ydqfoycjesjlucsyzipuzvrekiucbdgkhboe` (`authorId`),
  KEY `idx_hqfoxgicswnwsbzdlxdcuumjpatzrmmyhiua` (`sectionId`),
  KEY `idx_bweqgbxricrwcffoedqalzzgtulwbnznwuuc` (`typeId`),
  KEY `fk_bnararrdirsfxqazttvioadjnqpknmwnfpjp` (`parentId`),
  CONSTRAINT `fk_bnararrdirsfxqazttvioadjnqpknmwnfpjp` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_chdoixijhpeuoeansgjriaideafiouvzssaj` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ghkazrowjqaugylhrqegvoktcvjqvizhpibk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kphjkgqpdraukedkfrlpfkojlsluvoeownhv` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mdghgfqujrpbbagdttyllnbjzkehuolwljvi` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text,
  `showStatusField` tinyint(1) DEFAULT '1',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_huuorvyfxlgcpcmiszdtomatkjhyvfosjfar` (`name`,`sectionId`),
  KEY `idx_nkgdibfwfcfkdkunvdvzmrdhcqoxderktice` (`handle`,`sectionId`),
  KEY `idx_ppdyxipekvkaujunfjyvysaxxxmfojwakkbp` (`sectionId`),
  KEY `idx_sfafmwgbiztjbmijlkzgudvbtysibagvmtqg` (`fieldLayoutId`),
  KEY `idx_gdrhhrqrpzfdglpvdkpnjghalynipqvjqavt` (`dateDeleted`),
  CONSTRAINT `fk_bbygqhyotfkfggyozchjimcuxenpcndplcyc` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zpgtppydpsotyaqivnvqggvafsqnjdegctgc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xtmtqrblskcwcummfvhpysisybzysruwekal` (`name`),
  KEY `idx_szplomegfwzqcpsiqhipoaeqfrtxwemrgell` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `tabId` int NOT NULL,
  `fieldId` int NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_eiqxwenvijokhgpmczwvvniyftxjmgursnkx` (`layoutId`,`fieldId`),
  KEY `idx_ngxzzxiwxowoykowujyflhxshatwtrqoflug` (`sortOrder`),
  KEY `idx_wlkvgryfgugrimadzicodxcapmnhbsyuvogu` (`tabId`),
  KEY `idx_olutjcvqdjdesstxkdfkixjqeedjukdaqctp` (`fieldId`),
  CONSTRAINT `fk_mvzjwyynfvzhghknuugejpwuxjrhwuqtnhdq` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oudqevqxgjztvognxdvjwsvbdnaurwavpeos` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pcznrvatxlcwraagttthiyashjxwdfvsbxmu` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_porfuxkhioydaegqpkvwzrhbjqdlymnptiaj` (`dateDeleted`),
  KEY `idx_dvvsllmctrsflpsdbyfsllbxegavqfulsaol` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `settings` text,
  `elements` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_njvijoydkdsnogececqenzauzbqtjbwvhdml` (`sortOrder`),
  KEY `idx_rhjwmvpzsxpkdhdctfjrvbqmlicqtwjesgzw` (`layoutId`),
  CONSTRAINT `fk_aasthmbprmjmrrlwfjtftwepxkndijyyiaeg` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
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
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bzxqktywhppxguxwldqclascwbcdmvalwvcn` (`handle`,`context`),
  KEY `idx_ojocdnqkxvxmwijtmhwsunpyqmeuelpmcndk` (`groupId`),
  KEY `idx_wohsenuzghysnjltitigfhukxtuvilturqdb` (`context`),
  CONSTRAINT `fk_klvvyyxtgeppszupgmdkhbhmxoxzyhzpchua` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bfoekarpodoqswgqyvvizmyfmlefdezryjxx` (`name`),
  KEY `idx_aviaykqeiqkrlograhlpeeaevbmqjylcjbvd` (`handle`),
  KEY `idx_ignptgisyiwphtlevbueyszhgbzttyetjrom` (`fieldLayoutId`),
  KEY `idx_fahadesqaeaudbslshxmywalccwfvcalirmn` (`sortOrder`),
  CONSTRAINT `fk_kucpdegkyrtvwqchcbfclvkxrmfyimduxbyj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ulnriqzneggdyobhjjzodnclkcgokarenpnl` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
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
  UNIQUE KEY `idx_cahzehtldzkotkdbwzdhkeztzgkizfxyyuyn` (`accessToken`),
  UNIQUE KEY `idx_oonphygxndnjvnyaezgkeffewuamobrxoysu` (`name`),
  KEY `fk_gyhoemdpdmnrktwjbayauwpykjemmhilubqs` (`schemaId`),
  CONSTRAINT `fk_gyhoemdpdmnrktwjbayauwpykjemmhilubqs` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransformindex` (
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
  KEY `idx_bytpygkkkfmzbkkbelegknimsthkxsdjdbgf` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransforms` (
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
  KEY `idx_hztctdhplzawfintenhbovmahvborbxstvgu` (`name`),
  KEY `idx_mtdkurvrdzhuiylvurmemzigppquniwbqkga` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int NOT NULL,
  `primaryOwnerId` int NOT NULL,
  `fieldId` int NOT NULL,
  `typeId` int NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_iozgjqwacxepqoikmcqutsylhidvomzfzvjv` (`primaryOwnerId`),
  KEY `idx_enddhdtwzhysosrwbaukzwiflooemfrpphmk` (`fieldId`),
  KEY `idx_nwftbmbyjofeonlcvvslcwjzrmxauogyrnsg` (`typeId`),
  CONSTRAINT `fk_atzhxcfhlfvdeczhjxbmbkloijrsytzwqyjg` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kjhqrobspkpqvbhdqyeidaluftnqqcnwgmvj` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oqdbtepwqaskenuyblkgcnakptyubcqumfbi` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tkwpgtvorwkdqqklexteownhhacvvshwddux` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks_owners`
--

DROP TABLE IF EXISTS `matrixblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks_owners` (
  `blockId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_fsifbndqzlivwbsvxicbkpggfqwwhjwchxwe` (`ownerId`),
  CONSTRAINT `fk_fsifbndqzlivwbsvxicbkpggfqwwhjwchxwe` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wadajxnmuxrgfqvyjvrnvnnyfmrjdmjdynga` FOREIGN KEY (`blockId`) REFERENCES `matrixblocks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_arbfnubxmctsgnhgrhbcxrubuwmsbgldlkho` (`name`,`fieldId`),
  KEY `idx_twhmubnqjqeszdntnmlttqzabqhegasixqxo` (`handle`,`fieldId`),
  KEY `idx_wevymolizruxllheisohbycasvdnpgrbeldz` (`fieldId`),
  KEY `idx_tnqnnxnlfqvomxegotbvpxdaolchzinodole` (`fieldLayoutId`),
  CONSTRAINT `fk_abtzlnkwopwgckpbgzbphteezzsqiytkoezs` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cfgqiamzmqxzdbcvatbpyfpmrxittvianpvu` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixcontent_postcontent`
--

DROP TABLE IF EXISTS `matrixcontent_postcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_postcontent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_text_text_acuemsza` text,
  `field_quote_quote_xghluocz` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bxrwnltdyjsztcjuwrfergzjliaxdtgaualv` (`elementId`,`siteId`),
  KEY `fk_lhubzvxstpbcnkbifbwwmgaixoigigyzqvjd` (`siteId`),
  CONSTRAINT `fk_lhubzvxstpbcnkbifbwwmgaixoigigyzqvjd` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wsmbckodmsnbfjvrexetxzkpegcnurbzplnt` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zcxnewffjbqwogotdarqjewhcngzwhzcmjqp` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hhpkijzyhmldfgykzxjlesdudzuteomigaqd` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
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
  KEY `idx_hogpmjbnwtxftatqbyrtttydjzeytcgxucsp` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_lmxprwvgbidzhhnqlvcquutuocasrbpzwasw` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=366 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
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
  UNIQUE KEY `idx_xnzterrdthzmtqccmzyeuulljdgxjkbylmli` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_mexnrdemqniwcvizfigvokyadjparpwgauph` (`sourceId`),
  KEY `idx_znaihwcxurbwpwoldrtlisnreasltfkvutkh` (`targetId`),
  KEY `idx_ibambrinutivjdyehitrrzdyqpdmunyppwzj` (`sourceSiteId`),
  CONSTRAINT `fk_apxxkbvionlazxyfcglrnyaxaasxyvcrngcb` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jowpxzlyfidivyscgfijrprdbnouzzziwmhw` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wtsbcykpbljddtcorpevogyteitjccyyqlao` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dusrarvlizmcppfbngtcmblhaarmgdzccvxt` (`canonicalId`,`num`),
  KEY `fk_kadadcekqwaujkyeugrbhuxhmzsfknyiggbx` (`creatorId`),
  CONSTRAINT `fk_kadadcekqwaujkyeugrbhuxhmzsfknyiggbx` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ubrslactsidqfxideivlavdzafdbcaqbszei` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_wpzrsvzwwjqghuxtainqvwtqcgtzqexszzfj` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aimbervhbvoclxuqtpzygbjqnknezfuedpfq` (`handle`),
  KEY `idx_wfgsrhbxxbbzghqajknuxtdcgnsigfxdxiyg` (`name`),
  KEY `idx_jkrarfnznrulepbnklikybtozvhuaczeeyan` (`structureId`),
  KEY `idx_vemdfoxxzsxunbfkyoyxvtromexugmttdpjl` (`dateDeleted`),
  CONSTRAINT `fk_otbcbmzcyqepfnbbuxsrbecedhkcyqjpbvku` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
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
  UNIQUE KEY `idx_lcpugohxhqtizyheaeroayoqpnnoolwlcujk` (`sectionId`,`siteId`),
  KEY `idx_yhzktybgdxaldiywlywazolvxdbejothbvnb` (`siteId`),
  CONSTRAINT `fk_abikejsejamwcvsyjqtbuznuxwvlxxcarmvt` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xjsxzxkiqmmoewapzxqtpuqhcdvatpoqgmns` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ajsystszhfpszdrtgjgiatvkmygkcysoedvo` (`uid`),
  KEY `idx_ltrkubirqzumphhbkulifgfswccxjacrnvql` (`token`),
  KEY `idx_mqfuikohbrrjqwvnwntriimdbqavnisbpmbj` (`dateUpdated`),
  KEY `idx_fsdqquymjdkmaizpmpakksxlgqcbeaechcbd` (`userId`),
  CONSTRAINT `fk_segypwkrmmuleufxofbxinikkhnnzdybnmqh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ubxkyjqrabvsiaqirznjuuhncbblmyfokvxw` (`userId`,`message`),
  CONSTRAINT `fk_fdjwjwwxevubghjwqqdaaspsnfcyafozwzpj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gnhxgsgdvtmnjhucucvjyfijhtukbzhlrtdy` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qgazsszapdiupkofftsodcdjcudkznnqxkuo` (`dateDeleted`),
  KEY `idx_wcpkgysbzpslsiotfjllgffqkqbgutiuhjcz` (`handle`),
  KEY `idx_ppmcryuavkfbbzpiynfvfumhdckezicqdivh` (`sortOrder`),
  KEY `fk_hrnrhpmcrzibzwqbrqfsxbhokadzlgijbspa` (`groupId`),
  CONSTRAINT `fk_hrnrhpmcrzibzwqbrqfsxbhokadzlgijbspa` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
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
  UNIQUE KEY `idx_ewlycccoaugkfyanapvhavovchhqogvedvil` (`structureId`,`elementId`),
  KEY `idx_bgwibkfwjsqmaztovrouidsaolguzvnusilu` (`root`),
  KEY `idx_gwscayjujzovfryveooczcwdbfaaykmzdqcv` (`lft`),
  KEY `idx_wgzpafiqovkavlgzjoophtgfgwbtbkviqswh` (`rgt`),
  KEY `idx_gryaajikqdavatbsachxlgttaqydmbpglssa` (`level`),
  KEY `idx_eoujlhblrqcvsviepvvkmpwlekevjvytuywk` (`elementId`),
  CONSTRAINT `fk_nfnyyapxydkjuuzwvnuczaoxazgnyrselxez` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hkrgcefhrkgwufjfflvwnjzdrgjtyoblqfbe` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hconmjxnhbkkgmltpyvbevvpodtmnuigmzab` (`key`,`language`),
  KEY `idx_aiyuypneonmoyznuxtcoaxbyapzgvnfzvzgn` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dbplsqxnfvbxjppfsssraqojpuhjkmikiadr` (`name`),
  KEY `idx_tyrizotjmvjdmdqsnnxccjsdmfcxwidrggvt` (`handle`),
  KEY `idx_qoezompvqajvjrlqsrxyrpfyrijalytsgqch` (`dateDeleted`),
  KEY `fk_qnnqctyrqvccipqmknhrgliahnpxjnzoktee` (`fieldLayoutId`),
  CONSTRAINT `fk_qnnqctyrqvccipqmknhrgliahnpxjnzoktee` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rvkwhmjxgtiskbhnyvydffslgxsctawrbgpn` (`groupId`),
  CONSTRAINT `fk_amysrqolgfmpmhpbslbiwpkowqzlxdicjtgk` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sbalfrjftqvhpteljajwirsnjdjvzybjqqbd` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
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
  UNIQUE KEY `idx_lfzygozgbqrvpsttpynxigrtevhrhbkrvele` (`token`),
  KEY `idx_yiyjdauouivmxyawzlpbahccfojaskrquhrw` (`expiryDate`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_doeixetolnohdwggwpvfmkehojurmepyeqlz` (`handle`),
  KEY `idx_vpjlyvioasgmnmiczyhaznkvtdvtroneyjwd` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mhxghrrtqiglrztmjyqulebtxlslmhdtyaaf` (`groupId`,`userId`),
  KEY `idx_zkozpzkyyxdvnqwdojaientbejhkjujkgbvi` (`userId`),
  CONSTRAINT `fk_lkgchycinlugsuvevozmjhqftsrawxpatiwo` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yoztflbnxrcxcvfuujtdwkfrmfbebxdlyofg` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rfsaffcxuqmrxhqoudlkwvteunbseofwdpuj` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fxuhcahwftquynslymowjyolcxsdcueykeog` (`permissionId`,`groupId`),
  KEY `idx_gcucssitncgbqctcpznumzsixgruduhsdhqw` (`groupId`),
  CONSTRAINT `fk_avmmpvvyzcgkcjauubafdtklgatsqulthsgx` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ennkhrkhpyrkjmgqbdeadsgklxqdytgvncay` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zwzyskembgngbeglpkzsbczaazgazeofudqb` (`permissionId`,`userId`),
  KEY `idx_arvrfzynilbccacznegckvrehnqgwbozglbo` (`userId`),
  CONSTRAINT `fk_mhgvjgwvcsnvkphazdgcvnnhncfqjlbgqaue` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_txksrmrwszltjoeevqyvmbxcsmzdhofvadoy` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_ssxkzopriiaurfkfbcrhgllvrbzqgbhfgnbs` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
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
  KEY `idx_vvtactpqsywgwcqlusvekiurumcdhafqgxzm` (`active`),
  KEY `idx_qvqjwhfwfktjsyxycnwayrakupryarpcbyrh` (`locked`),
  KEY `idx_beispakuvldozpzvxysgzsfxnwyaqfccuoee` (`pending`),
  KEY `idx_aaakvbgdbapduzveuqgmrpmwkadzcorysexj` (`suspended`),
  KEY `idx_uanuybhdgkqqfzndgqklcscqqrxuxhxoieao` (`verificationCode`),
  KEY `idx_srybzhvrrbxxfigzlrwmojwmmkflhfqdvwqo` (`email`),
  KEY `idx_rzmdvgxdnpavwulmkirvwigarcwaskmzmttv` (`username`),
  KEY `fk_jawwrvhdefcatyiryhybcmwvxqqkqkvtylgo` (`photoId`),
  CONSTRAINT `fk_jawwrvhdefcatyiryhybcmwvxqqkqkvtylgo` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mjirdtcretvqynhwuyhfxgcnhsrivcwjfkgt` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fikikqjwnwluogofbkpjxzaebzyekjtznnkc` (`name`,`parentId`,`volumeId`),
  KEY `idx_ewwvhfqifqctjvqdlvgxcmmykddsphdsyvvx` (`parentId`),
  KEY `idx_cutqtzfwfwcujppcfcmkcrxsjwxwhaswvkdd` (`volumeId`),
  CONSTRAINT `fk_muxajjqeoychvccqmfugcnqfcvembyyunoet` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qcwptisozdmiygxmlzvuvebpudnsmjmwtjvd` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_sjahjorygbkusxxhtfeuezqvswstlqhyobqa` (`name`),
  KEY `idx_eztxukbirvdopmifebnavpopcrjxxthleqxw` (`handle`),
  KEY `idx_lwvqbhkefjlssadnqahwdonjrwxsthvtnjqp` (`fieldLayoutId`),
  KEY `idx_ibchiojlylsyhwezuwwdjjqjhcitfqzdrzzx` (`dateDeleted`),
  CONSTRAINT `fk_wflbcsnrdszwelhtmnagnxajzwxgkvcjwhvj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dcncaebcjyntybljozgcaukgwsqxvaoqpkze` (`userId`),
  CONSTRAINT `fk_hkidofpseharsjuatrekesehrkzgpurvixxl` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
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

-- Dump completed on 2023-09-14 21:16:54
-- MariaDB dump 10.19  Distrib 10.5.19-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets` VALUES (3,1,1,1,'highway-26.JPG','image','Winter scene South of Warm Springs, on OR26.',6000,4000,16388459,NULL,NULL,NULL,'2023-02-24 22:21:26','2023-02-24 22:21:27','2023-03-16 19:50:51'),(8,1,1,1,'warm-springs.JPG','image','Looking South at a plateau, across OR26.',6000,4000,13698671,NULL,NULL,NULL,'2023-02-25 04:14:39','2023-02-25 04:14:39','2023-03-16 19:50:56'),(50,1,1,1,'lake-billy-chinook.jpeg','image','Hiker looking out over Lake Billy Chinook from trail on canyon wall.',4000,6000,7954421,'0.6730;0.7480',NULL,NULL,'2023-05-23 19:07:27','2023-05-23 19:07:27','2023-05-25 16:20:25');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `categories` VALUES (11,1,NULL,NULL,'2023-02-25 04:15:03','2023-02-25 04:15:03'),(39,1,NULL,NULL,'2023-05-19 16:30:29','2023-05-19 16:30:29'),(40,1,NULL,NULL,'2023-05-22 21:41:46','2023-05-22 21:41:46');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `categorygroups` VALUES (1,1,4,'Topics','topics','end','2023-02-23 21:50:05','2023-02-23 21:50:05',NULL,'5243d9e9-fe81-41ef-a875-69941c782a8e');
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `categorygroups_sites` VALUES (1,1,1,1,'blog/topics/{slug}','blog/_topic','2023-02-23 21:50:05','2023-02-23 21:50:05','2b042071-e78e-4be1-8f85-e7f5116d6c02');
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (2,1,1,'2023-02-25 04:13:33',0,1),(2,1,2,'2023-05-24 17:21:42',0,1),(2,1,3,'2023-02-25 04:15:10',0,1),(2,1,4,'2023-05-25 16:17:26',0,1),(9,1,5,'2023-05-25 16:17:26',0,1),(20,1,1,'2023-05-17 20:03:08',0,1),(20,1,2,'2023-02-25 04:23:33',0,1),(20,1,3,'2023-05-24 23:21:16',0,1),(20,1,4,'2023-05-25 16:16:41',0,1),(26,1,5,'2023-05-25 16:16:32',0,1),(46,1,9,'2023-05-23 19:08:16',0,1),(46,1,10,'2023-05-23 19:08:16',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,1,1,NULL,'2023-02-21 22:21:32','2023-02-21 23:51:58','d692a3a0-73e4-40ee-8496-128f3ba4816f',NULL,NULL,NULL),(2,2,1,'Over the Mountain','2023-02-24 22:05:46','2023-05-25 16:17:26','0a7c303c-347e-426f-89d3-250e38e30175','Vestibulum id ligula porta felis euismod semper. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',NULL,NULL),(3,3,1,'Highway 26','2023-02-24 22:21:23','2023-03-16 19:50:51','3241e753-14f9-455e-aba4-df7f12bae48c',NULL,NULL,NULL),(4,8,1,'Warm Springs','2023-02-25 04:14:37','2023-03-16 19:50:56','fb13644e-acfb-46e1-bd19-9ec1fc5741c8',NULL,NULL,NULL),(5,11,1,'Road Trips','2023-02-25 04:15:03','2023-02-25 04:15:08','18f8a7d1-9a45-4639-bf09-c3e03f3cb321',NULL,NULL,NULL),(10,20,1,'My Trip to Bend','2023-02-25 04:23:24','2023-05-25 16:16:41','31dab63f-ce91-4b9a-a62e-7ce2b79ccf1d','Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Curabitur blandit tempus porttitor.',NULL,NULL),(11,28,1,NULL,'2023-03-10 21:21:11','2023-05-24 00:24:37','fd0ede1e-4045-4586-a923-c3a0908c18a7',NULL,'Photos and stories from around the Pacific Northwest.',NULL),(16,39,1,NULL,'2023-05-19 16:30:29','2023-05-19 16:30:29','453344b3-52c2-4a0c-94fd-3d8bb03ab569',NULL,NULL,NULL),(17,40,1,'Hikes','2023-05-22 21:41:46','2023-05-25 16:19:11','4427e9d6-c2a4-4fa3-868a-3765eade0c1c',NULL,NULL,NULL),(21,46,1,'About','2023-05-23 17:15:24','2023-05-23 19:08:16','9e59c7c5-6f22-4ff1-aae4-a807de2c4094',NULL,NULL,'Nullam id dolor id nibh ultricies vehicula ut id elit. Nullam quis risus eget urna mollis ornare vel eu leo. Nullam id dolor id nibh ultricies vehicula ut id elit. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Sed posuere consectetur est at lobortis.\n\nNulla vitae elit libero, a pharetra augue. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. Donec sed odio dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),(25,50,1,'Lake Billy Chinook','2023-05-23 19:07:22','2023-05-25 16:20:25','e87e1c95-0fee-4af2-92b3-992762181e22',NULL,NULL,NULL);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `drafts` VALUES (7,NULL,1,0,'First draft',NULL,0,NULL,0);
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2023-02-21 22:21:32','2023-02-21 23:51:58',NULL,NULL,'a2d10826-d3bc-4e1a-8f74-94b8df9296cc'),(2,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-02-24 22:05:46','2023-05-25 16:17:26',NULL,NULL,'568a8705-7f51-46f1-96a4-f433b618c5ab'),(3,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-24 22:21:23','2023-03-16 19:50:51',NULL,NULL,'8ebfdf16-8eb3-4add-9206-979a8cb12082'),(8,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-25 04:14:37','2023-03-16 19:50:56',NULL,NULL,'a818af93-517d-45c2-9a23-2139055ab5b4'),(9,NULL,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2023-02-25 04:14:42','2023-05-25 16:17:26',NULL,NULL,'aa6d49ff-2a78-4926-899d-d920fa89e653'),(10,NULL,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2023-02-25 04:14:42','2023-02-25 04:14:42',NULL,NULL,'2b9352b3-c128-4624-8e83-b85758582b70'),(11,NULL,NULL,NULL,4,'craft\\elements\\Category',1,0,'2023-02-25 04:15:03','2023-02-25 04:15:08',NULL,NULL,'32503973-af5b-45b3-8a69-0bf72e40fe64'),(20,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-02-25 04:23:24','2023-05-25 16:16:41',NULL,NULL,'700220c3-2da0-4f23-b9a5-27de696f694b'),(26,NULL,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2023-02-25 04:23:49','2023-05-25 16:16:32',NULL,NULL,'639db885-9f0e-45ce-a22b-1ec0858d3dbf'),(27,NULL,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2023-02-25 04:23:49','2023-05-17 21:07:04',NULL,NULL,'4b3fe7c0-8f8d-4707-89b4-2d01a576262f'),(28,NULL,NULL,NULL,7,'craft\\elements\\GlobalSet',1,0,'2023-03-10 21:21:11','2023-05-24 00:24:37',NULL,NULL,'3d59750a-8ed6-43ef-9a60-460cfcc12832'),(39,NULL,7,NULL,4,'craft\\elements\\Category',1,0,'2023-05-19 16:30:29','2023-05-19 16:30:29',NULL,NULL,'59452412-0675-43a7-9344-c31b94f5700c'),(40,NULL,NULL,NULL,4,'craft\\elements\\Category',1,0,'2023-05-22 21:41:46','2023-05-25 16:19:11',NULL,NULL,'6d7bbd4d-6ea1-4107-af05-6ec06b35d8dc'),(46,NULL,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2023-05-23 17:15:24','2023-05-23 19:08:16',NULL,NULL,'4a1534ba-cb0b-4acd-840b-12e190c4f892'),(50,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-05-23 19:07:22','2023-05-25 16:20:25',NULL,NULL,'ee342c84-4245-4e08-9180-6d2f086a08c0'),(64,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-05-24 18:04:06','2023-05-24 18:04:06',NULL,NULL,'640f8de7-2622-44a9-aeb6-33dd5dfbd0f0'),(88,NULL,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2023-05-25 16:16:41','2023-05-25 16:16:41',NULL,NULL,'4f395f9c-2dbe-4fee-80f3-7bf14ae37b28'),(101,NULL,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2023-05-25 16:17:26','2023-05-25 16:17:26',NULL,NULL,'daece09f-a3b6-4190-9b9e-d7f390a2307c');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2023-02-21 22:21:32','2023-02-21 22:21:32','bf23b468-fb71-4b10-bf86-55cf92935ef5'),(2,2,1,'over-the-mountain','blog/over-the-mountain',1,'2023-02-24 22:05:46','2023-05-25 16:17:26','a217bf11-03a8-41e7-81ac-e5478a604cd9'),(3,3,1,NULL,NULL,1,'2023-02-24 22:21:23','2023-02-24 22:21:23','cc0d2102-b7a9-4a76-a1f0-e70b03bb35b8'),(8,8,1,NULL,NULL,1,'2023-02-25 04:14:37','2023-02-25 04:14:37','891bf0b1-535e-4cf4-95d7-a4621616f4fa'),(9,9,1,NULL,NULL,1,'2023-02-25 04:14:42','2023-02-25 04:14:42','eebc6653-022a-471c-b332-e9bc47ce119f'),(10,10,1,NULL,NULL,1,'2023-02-25 04:14:42','2023-02-25 04:14:42','80ef2f40-1a96-4aed-8e86-1e688cc0160b'),(11,11,1,'road-trips','blog/topics/road-trips',1,'2023-02-25 04:15:03','2023-02-25 04:18:52','38141c33-fc40-44ba-8859-1babe6a78d52'),(20,20,1,'my-trip-to-bend','blog/my-trip-to-bend',1,'2023-02-25 04:23:24','2023-02-25 04:23:29','b88787ef-1939-4379-a0bf-337d7839345a'),(26,26,1,NULL,NULL,1,'2023-02-25 04:23:49','2023-02-25 04:23:49','ce96352e-df1e-4518-8a96-e0ff35ba59ac'),(27,27,1,NULL,NULL,1,'2023-02-25 04:23:49','2023-02-25 04:23:49','e754aac3-d34b-4e63-9bd7-b182afa0c38d'),(28,28,1,NULL,NULL,1,'2023-03-10 21:21:11','2023-03-10 21:21:11','4392eee1-7331-4a17-94f0-a55b5516486d'),(39,39,1,'__temp_tgqlcgmjdqtdolujgrfgkiyplvaqiptxkqbi','blog/topics/__temp_tgqlcgmjdqtdolujgrfgkiyplvaqiptxkqbi',1,'2023-05-19 16:30:29','2023-05-19 16:30:29','9bf20957-7317-43aa-aa28-069804459ff6'),(40,40,1,'hikes','blog/topics/hikes',1,'2023-05-22 21:41:46','2023-05-25 16:19:11','06d9f35d-85c5-455f-abdd-02e2f4ea1f6b'),(46,46,1,'about','about',1,'2023-05-23 17:15:24','2023-05-23 17:15:24','408e60ff-638b-482c-a6d6-e40b4220540a'),(50,50,1,NULL,NULL,1,'2023-05-23 19:07:22','2023-05-23 19:07:22','bb088111-b27d-4b1e-b435-a0e5dc6c3b56'),(64,64,1,NULL,NULL,1,'2023-05-24 18:04:06','2023-05-24 18:04:06','af786ca0-c254-43ee-abed-2dadbba341b5'),(88,88,1,NULL,NULL,1,'2023-05-25 16:16:41','2023-05-25 16:16:41','c906387b-5513-4e96-8913-8bd3a1f7d3c3'),(101,101,1,NULL,NULL,1,'2023-05-25 16:17:26','2023-05-25 16:17:26','3cbb429d-985d-4762-a0d7-8dba871f456b');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,2,NULL,2,1,'2023-01-27 00:00:00',NULL,NULL,'2023-02-24 22:05:46','2023-02-25 04:19:13'),(20,2,NULL,2,1,'2023-03-15 01:41:00',NULL,NULL,'2023-02-25 04:23:24','2023-03-15 01:41:44'),(46,3,NULL,3,NULL,'2023-05-23 17:15:00',NULL,NULL,'2023-05-23 17:15:24','2023-05-23 17:15:24');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (2,2,2,'Post','post',1,'site',NULL,NULL,'site',NULL,1,1,'2023-02-23 01:51:37','2023-02-24 22:05:01',NULL,'c3785700-c808-470f-bb7f-2ae46d6731e8'),(3,3,8,'About','about',0,'site',NULL,'{section.name|raw}','site',NULL,1,1,'2023-05-23 17:15:24','2023-05-23 17:15:24',NULL,'228d4acb-c42e-4d3d-ad21-8dc3d1ea0027');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldgroups` VALUES (1,'Common','2023-02-21 22:21:32','2023-02-21 22:21:32',NULL,'50bd58d3-3f59-4d28-b958-5f7fbfa30fd5'),(2,'Blog','2023-02-24 01:22:37','2023-02-24 01:22:37',NULL,'bd585f47-3b6d-4f10-b8ea-30c76f0863f3'),(3,'Global','2023-03-10 21:22:05','2023-03-10 21:22:05',NULL,'2e7d47d3-0ff1-4e7d-bd97-776d26709501'),(4,'About','2023-05-23 17:16:01','2023-05-23 17:16:01',NULL,'d9caefb2-0f98-44ed-9348-d6e5ecd7640f');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayoutfields` VALUES (7,7,8,7,0,0,'2023-03-10 21:22:29','2023-03-10 21:22:29','0b3d1125-d5af-4e4b-82ec-afdb529cb227'),(8,2,10,2,0,1,'2023-03-20 20:22:33','2023-03-20 20:22:33','d802ad55-bfd7-4ae2-9ff7-1aed163eaa98'),(9,2,10,1,0,2,'2023-03-20 20:22:33','2023-03-20 20:22:33','985473c5-b3c8-4b7d-836c-e1f47c58a51c'),(10,2,10,4,0,3,'2023-03-20 20:22:33','2023-03-20 20:22:33','def9bf15-0c77-4d81-a046-23bd0f0423ff'),(11,2,10,3,0,4,'2023-03-20 20:22:33','2023-03-20 20:22:33','b2f46935-7620-44e9-93aa-7e54503d6aef'),(13,8,12,10,0,1,'2023-05-23 18:01:30','2023-05-23 18:01:30','53f2ca9f-fe32-4766-a8b1-5cf2a4184004'),(14,8,12,9,0,2,'2023-05-23 18:01:30','2023-05-23 18:01:30','01b7edf7-86d4-41b5-8e7a-e1f9215e0515'),(15,5,13,5,1,0,'2023-05-24 17:50:48','2023-05-24 17:50:48','03925b40-ed7b-4992-8d7a-c8b101e87288'),(16,6,14,6,1,0,'2023-05-24 17:50:48','2023-05-24 17:50:48','903ab75c-3d56-4b2f-b5cb-fa02798f478c'),(17,9,15,11,1,0,'2023-05-24 17:50:48','2023-05-24 17:50:48','f4710e88-8901-45af-854a-d33f33db821f');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (2,'craft\\elements\\Entry','2023-02-23 01:51:37','2023-02-23 01:51:37',NULL,'0c53c2d2-6cec-48f6-a492-d8e8d403eb82'),(3,'craft\\elements\\Asset','2023-02-23 21:39:38','2023-02-23 21:39:38',NULL,'6da532a1-b67d-49ad-81fa-ae7397933c9b'),(4,'craft\\elements\\Category','2023-02-23 21:50:05','2023-02-23 21:50:05',NULL,'e34fc8d5-ae42-4ed2-aa81-b45e2764b28a'),(5,'craft\\elements\\MatrixBlock','2023-02-24 21:08:59','2023-02-24 21:08:59',NULL,'3f024f9c-c06a-49c6-9224-4180d6b5aaf0'),(6,'craft\\elements\\MatrixBlock','2023-02-24 21:08:59','2023-02-24 21:08:59',NULL,'51f32229-5de2-4ec0-bcac-c4bc9c1df0f0'),(7,'craft\\elements\\GlobalSet','2023-03-10 21:22:29','2023-03-10 21:22:29',NULL,'1f531920-6cc5-45b4-9c04-aa537594c1b5'),(8,'craft\\elements\\Entry','2023-05-23 17:15:24','2023-05-23 17:15:24',NULL,'ddebd0c2-f431-409c-b6f0-0c95dc61bc4c'),(9,'craft\\elements\\MatrixBlock','2023-05-24 17:50:48','2023-05-24 17:50:48',NULL,'18fdfbda-ae57-4895-b63c-2350f1292b48');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouttabs` VALUES (4,4,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\TitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"7517edb7-b46f-496b-81b6-ad9fb6d26738\",\"userCondition\":null,\"elementCondition\":null}]',1,'2023-02-23 21:50:05','2023-02-23 21:50:05','4370ffcd-91c6-4f51-baf9-17d74e05f513'),(8,7,'Metadata','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"d2bb067d-0a8d-4460-b51d-d32e41eb86bd\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"de9aba82-dcb8-47b5-b085-64ed1eb4dd6e\"}]',1,'2023-03-10 21:22:29','2023-03-10 21:22:29','0400ac59-ff4f-4dc4-acac-f9f53ab06fa5'),(9,3,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"4f0f398d-5460-4c95-adc2-4bc8ec6a9588\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AltField\",\"attribute\":\"alt\",\"requirable\":true,\"class\":null,\"rows\":null,\"cols\":null,\"name\":null,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"6ca79624-0b37-49a6-8b84-a53162135fd2\",\"userCondition\":null,\"elementCondition\":null}]',1,'2023-03-16 19:48:35','2023-03-16 19:48:35','07f0e1f1-164b-4631-bb26-47a22deb0628'),(10,2,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"577aac9f-b0fd-4e6d-a6b2-82e26cc5f05a\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"fa97269d-162a-48c4-afc9-cd140bbd697f\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d8695b13-9305-4f11-b758-937e573eb1e2\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"18fd64a6-5a30-419f-ba41-9e7b184ac2b1\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"6359420f-e650-4b13-a5a5-01ac0d5c1a72\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"83da71e4-eb92-4b65-a747-52c479527f4f\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"ad503b1a-8fdf-4a3b-a93c-6bdb2c823285\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"c3a858a5-c56b-4c9f-ae38-989c7bb00c5c\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"342e9393-8067-4c94-9386-e1c541273ddb\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"602f8f6e-5696-433b-90c2-4e597be90483\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"0ceb2d7a-7218-4ca6-838a-e98a58cc379b\"}]',1,'2023-03-20 20:22:33','2023-03-20 20:22:33','d79c3649-544d-4d4a-b795-45a8182cb5fd'),(12,8,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"24ed461b-8ca8-4318-a547-c580ae6b9b24\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"37e26aa5-a64a-4c2d-8fbf-4d4265f7e557\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"22c82593-5c3e-471a-a75c-af46ba3b9dfc\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"dd4a35ca-3b59-42b1-a33e-31d3da663989\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"11606301-cb30-4c50-b455-5ead656bbcee\"}]',1,'2023-05-23 18:01:30','2023-05-23 18:01:30','24404a1e-a8e5-4a64-95aa-638b0cfd12cd'),(13,5,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"9e7445e8-3c36-4e88-aea6-b0e41ed192dd\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"782938c4-8296-4285-825e-8a68c0a0899b\"}]',1,'2023-05-24 17:50:48','2023-05-24 17:50:48','d3468b10-a164-459b-b2c4-e25312ada2fc'),(14,6,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"4e34bf66-1913-40f6-af3a-d1527923058b\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"473ce54c-06f8-45af-a737-7aaeabffbfde\"}]',1,'2023-05-24 17:50:48','2023-05-24 17:50:48','c1acae64-7b7b-4d5d-bd90-a06e7a092563'),(15,9,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"0030abb3-10fe-4e1d-b60c-12ab8ab3a459\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"711e542a-7869-410a-ab6c-83fc8c36a5b6\"}]',1,'2023-05-24 17:50:48','2023-05-24 17:50:48','6492b6a0-f2b8-4a93-be48-20fad5e1d497');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,2,'Summary','summary','global','kxpmnqno',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":1,\"multiline\":true,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-02-24 01:33:33','2023-02-24 01:33:33','6359420f-e650-4b13-a5a5-01ac0d5c1a72'),(2,2,'Feature Image','featureImage','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":true,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:ec1487e2-3e09-4e17-85de-151fb21bf341\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":true,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:ec1487e2-3e09-4e17-85de-151fb21bf341\",\"restrictedLocationSubpath\":null,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Asset\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"},\"selectionLabel\":null,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"large\"}','2023-02-24 19:19:35','2023-02-24 19:19:35','d8695b13-9305-4f11-b758-937e573eb1e2'),(3,2,'Topics','topics','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Categories','{\"allowLimit\":false,\"allowMultipleSources\":false,\"allowSelfRelations\":false,\"branchLimit\":null,\"localizeRelations\":false,\"maxRelations\":null,\"minRelations\":null,\"selectionLabel\":null,\"showSiteMenu\":false,\"source\":\"group:5243d9e9-fe81-41ef-a875-69941c782a8e\",\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2023-02-24 19:24:51','2023-02-24 19:24:51','342e9393-8067-4c94-9386-e1c541273ddb'),(4,2,'Post Content','postContent','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"minBlocks\":null,\"maxBlocks\":null,\"contentTable\":\"{{%matrixcontent_postcontent}}\",\"propagationMethod\":\"all\",\"propagationKeyFormat\":null}','2023-02-24 21:08:59','2023-05-24 17:50:48','ad503b1a-8fdf-4a3b-a93c-6bdb2c823285'),(5,NULL,'Text','text','matrixBlockType:2633adaf-c526-44c9-885e-a6272d8f0a26','acuemsza',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":10,\"multiline\":true,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-02-24 21:08:59','2023-05-24 17:50:48','782938c4-8296-4285-825e-8a68c0a0899b'),(6,NULL,'Image','image','matrixBlockType:5e86add9-56fa-4012-a62c-15a24415e5e0',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":true,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:ec1487e2-3e09-4e17-85de-151fb21bf341\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":true,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:ec1487e2-3e09-4e17-85de-151fb21bf341\",\"restrictedLocationSubpath\":null,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Asset\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"},\"selectionLabel\":null,\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:ec1487e2-3e09-4e17-85de-151fb21bf341\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2023-02-24 21:08:59','2023-05-24 17:50:48','473ce54c-06f8-45af-a737-7aaeabffbfde'),(7,3,'Description','description','global','cyaftqpy',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":true,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-03-10 21:22:15','2023-05-23 23:42:37','de9aba82-dcb8-47b5-b085-64ed1eb4dd6e'),(9,4,'Bio','bio','global','ikcydbdr',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":8,\"multiline\":true,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-05-23 17:41:54','2023-05-23 17:42:01','11606301-cb30-4c50-b455-5ead656bbcee'),(10,4,'Profile Photo','profilePhoto','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":true,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:ec1487e2-3e09-4e17-85de-151fb21bf341\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:ec1487e2-3e09-4e17-85de-151fb21bf341\",\"restrictedLocationSubpath\":null,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Asset\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"},\"selectionLabel\":null,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:ec1487e2-3e09-4e17-85de-151fb21bf341\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"large\"}','2023-05-23 17:58:48','2023-05-23 17:58:48','22c82593-5c3e-471a-a75c-af46ba3b9dfc'),(11,NULL,'Quote','quote','matrixBlockType:423216e9-be60-4b68-a48f-32690ba804dc','xghluocz',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":6,\"multiline\":true,\"placeholder\":null,\"uiMode\":\"enlarged\"}','2023-05-24 17:50:48','2023-05-24 17:50:48','711e542a-7869-410a-ab6c-83fc8c36a5b6');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `globalsets` VALUES (28,'Site Info','siteInfo',7,1,'2023-03-10 21:21:11','2023-03-10 21:22:29','3d59750a-8ed6-43ef-9a60-460cfcc12832');
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gqlschemas` VALUES (1,'Public Schema','[]',1,'2023-03-10 19:39:07','2023-03-10 19:39:07','a3430119-c9d8-45be-8833-73170b536844');
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `imagetransforms` VALUES (2,'Thumbnail','thumbnail','fit','center-center',1200,NULL,NULL,NULL,'none',NULL,0,'2023-05-25 01:01:11','2023-05-25 01:01:11','2023-05-25 01:01:11','9a47f63c-c5d8-43bd-be5e-5c4a045dce41');
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'4.5.4','4.5.3.0',0,'kfxwhgezelxf','3@gycguyzmqu','2023-02-21 22:21:32','2023-09-14 21:11:07','22a2e5f5-2035-442e-a171-7f6a96746f01');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixblocks` VALUES (9,2,4,1,NULL,'2023-02-25 04:14:42','2023-02-25 04:14:42'),(10,2,4,2,NULL,'2023-02-25 04:14:42','2023-02-25 04:14:42'),(26,20,4,1,NULL,'2023-02-25 04:23:49','2023-02-25 04:23:49'),(27,20,4,2,NULL,'2023-02-25 04:23:49','2023-02-25 04:23:49'),(64,20,4,3,NULL,'2023-05-24 18:04:06','2023-05-24 18:04:06'),(88,20,4,1,NULL,'2023-05-25 16:16:41','2023-05-25 16:16:41'),(101,2,4,1,NULL,'2023-05-25 16:17:26','2023-05-25 16:17:26');
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks_owners`
--

LOCK TABLES `matrixblocks_owners` WRITE;
/*!40000 ALTER TABLE `matrixblocks_owners` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixblocks_owners` VALUES (9,2,1),(10,2,2),(26,20,1),(27,20,2),(64,20,3),(88,20,4),(101,2,3);
/*!40000 ALTER TABLE `matrixblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixblocktypes` VALUES (1,4,5,'Text','text',1,'2023-02-24 21:08:59','2023-02-24 21:08:59','2633adaf-c526-44c9-885e-a6272d8f0a26'),(2,4,6,'Image','image',2,'2023-02-24 21:08:59','2023-02-24 21:08:59','5e86add9-56fa-4012-a62c-15a24415e5e0'),(3,4,9,'Quote','quote',3,'2023-05-24 17:50:48','2023-05-24 17:50:48','423216e9-be60-4b68-a48f-32690ba804dc');
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixcontent_postcontent`
--

LOCK TABLES `matrixcontent_postcontent` WRITE;
/*!40000 ALTER TABLE `matrixcontent_postcontent` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixcontent_postcontent` VALUES (5,9,1,'2023-02-25 04:14:42','2023-05-25 16:17:26','40155dc7-58ea-4c48-ba30-dec4320862de','Nullam id dolor id nibh ultricies vehicula ut id elit. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.\n\nFusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Nulla vitae elit libero, a pharetra augue. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.',NULL),(6,10,1,'2023-02-25 04:14:42','2023-02-25 04:14:42','aa79157d-1375-49b8-85a1-73e5a59da6e4',NULL,NULL),(16,26,1,'2023-02-25 04:23:49','2023-05-25 16:16:32','8ebee3ab-4f11-4213-8e54-144615623c5c','Nulla vitae elit libero, a pharetra augue. Donec id elit non mi porta gravida at eget metus. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.\n\nNulla vitae elit libero, a pharetra augue. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec sed odio dui. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.',NULL),(17,27,1,'2023-02-25 04:23:49','2023-05-17 21:07:04','3142eb46-3a08-424c-8139-809dca9947ff',NULL,NULL),(32,64,1,'2023-05-24 18:04:06','2023-05-24 18:04:06','33a738c9-996a-4e7a-bdef-406490e8be0d',NULL,'Nullam quis risus eget urna mollis ornare vel eu leo. Maecenas sed diam eget risus varius blandit sit amet non magna.'),(49,88,1,'2023-05-25 16:16:41','2023-05-25 16:16:41','10683092-4571-4726-b5bf-588bc0379a25','Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit. Nullam quis risus eget urna mollis ornare vel eu leo. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Nulla vitae elit libero, a pharetra augue. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.\n\nNulla vitae elit libero, a pharetra augue. Maecenas sed diam eget risus varius blandit sit amet non magna. Donec id elit non mi porta gravida at eget metus. Etiam porta sem malesuada magna mollis euismod. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.',NULL),(59,101,1,'2023-05-25 16:17:26','2023-05-25 16:17:26','d60aec7d-0039-4b15-95c3-08b28667f18a','Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.\n\nAenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec id elit non mi porta gravida at eget metus. Maecenas faucibus mollis interdum. Donec sed odio dui. Sed posuere consectetur est at lobortis.',NULL);
/*!40000 ALTER TABLE `matrixcontent_postcontent` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2023-02-21 22:21:32','2023-02-21 22:21:32','2023-02-21 22:21:32','a8344387-b9d1-42be-a709-5510fc2754d7'),(2,'craft','m210121_145800_asset_indexing_changes','2023-02-21 22:21:32','2023-02-21 22:21:32','2023-02-21 22:21:32','0ac8c4c0-3422-426e-917f-491872ae55e5'),(3,'craft','m210624_222934_drop_deprecated_tables','2023-02-21 22:21:32','2023-02-21 22:21:32','2023-02-21 22:21:32','14f900de-a0a2-48b8-855a-30ab4ac9977a'),(4,'craft','m210724_180756_rename_source_cols','2023-02-21 22:21:32','2023-02-21 22:21:32','2023-02-21 22:21:32','4b02d666-1477-42b8-99be-1070d5221126'),(5,'craft','m210809_124211_remove_superfluous_uids','2023-02-21 22:21:32','2023-02-21 22:21:32','2023-02-21 22:21:32','eb816743-06ed-4ff2-864f-24e3b1fd83be'),(6,'craft','m210817_014201_universal_users','2023-02-21 22:21:32','2023-02-21 22:21:32','2023-02-21 22:21:32','047ab65b-6581-4684-b5e3-11b939c8ca3a'),(7,'craft','m210904_132612_store_element_source_settings_in_project_config','2023-02-21 22:21:32','2023-02-21 22:21:32','2023-02-21 22:21:32','01507865-1718-49c7-be6c-edb9bad1c2e2'),(8,'craft','m211115_135500_image_transformers','2023-02-21 22:21:32','2023-02-21 22:21:32','2023-02-21 22:21:32','4acaf206-7e91-400a-8651-9748c0ed547f'),(9,'craft','m211201_131000_filesystems','2023-02-21 22:21:32','2023-02-21 22:21:32','2023-02-21 22:21:32','c3107b03-96b5-4862-88ae-e03e834ab5ea'),(10,'craft','m220103_043103_tab_conditions','2023-02-21 22:21:32','2023-02-21 22:21:32','2023-02-21 22:21:32','7e0f1900-ea91-4021-ba6e-102ae6a85725'),(11,'craft','m220104_003433_asset_alt_text','2023-02-21 22:21:32','2023-02-21 22:21:32','2023-02-21 22:21:32','896868ee-66b4-4d11-9598-58788e963195'),(12,'craft','m220123_213619_update_permissions','2023-02-21 22:21:32','2023-02-21 22:21:32','2023-02-21 22:21:32','1d972080-aa0c-4f20-a91c-461dfe2653b3'),(13,'craft','m220126_003432_addresses','2023-02-21 22:21:32','2023-02-21 22:21:32','2023-02-21 22:21:32','9ea9b61c-c605-44c4-812b-26c7cd1dcb5e'),(14,'craft','m220209_095604_add_indexes','2023-02-21 22:21:32','2023-02-21 22:21:32','2023-02-21 22:21:32','5cf89bea-0cbd-48ca-ad06-2d816ded511c'),(15,'craft','m220213_015220_matrixblocks_owners_table','2023-02-21 22:21:32','2023-02-21 22:21:32','2023-02-21 22:21:32','fb71f764-09ac-4ef5-8754-22f152674485'),(16,'craft','m220214_000000_truncate_sessions','2023-02-21 22:21:32','2023-02-21 22:21:32','2023-02-21 22:21:32','4d67afaa-a471-462e-a85c-00418109a437'),(17,'craft','m220222_122159_full_names','2023-02-21 22:21:32','2023-02-21 22:21:32','2023-02-21 22:21:32','a6ec79d6-ae58-4049-9fb5-27f715add9f3'),(18,'craft','m220223_180559_nullable_address_owner','2023-02-21 22:21:32','2023-02-21 22:21:32','2023-02-21 22:21:32','1f65eeb6-35b1-4263-a3cb-6d400b269952'),(19,'craft','m220225_165000_transform_filesystems','2023-02-21 22:21:32','2023-02-21 22:21:32','2023-02-21 22:21:32','cc6caa90-a5da-4cc2-9f18-95c26aee7822'),(20,'craft','m220309_152006_rename_field_layout_elements','2023-02-21 22:21:32','2023-02-21 22:21:32','2023-02-21 22:21:32','0c301e77-0e54-49a2-9752-0e4269d0cc79'),(21,'craft','m220314_211928_field_layout_element_uids','2023-02-21 22:21:32','2023-02-21 22:21:32','2023-02-21 22:21:32','20101c00-c59c-4dd8-80bb-b97500e24256'),(22,'craft','m220316_123800_transform_fs_subpath','2023-02-21 22:21:32','2023-02-21 22:21:32','2023-02-21 22:21:32','07fec3eb-d273-4fbb-8f83-86044455c361'),(23,'craft','m220317_174250_release_all_jobs','2023-02-21 22:21:32','2023-02-21 22:21:32','2023-02-21 22:21:32','491b7e8c-c97e-4f0c-85d4-80660944354d'),(24,'craft','m220330_150000_add_site_gql_schema_components','2023-02-21 22:21:32','2023-02-21 22:21:32','2023-02-21 22:21:32','2cf27292-8304-4194-a1f7-21387fc7c352'),(25,'craft','m220413_024536_site_enabled_string','2023-02-21 22:21:32','2023-02-21 22:21:32','2023-02-21 22:21:32','55ac819e-e3ff-4902-848f-63cde9e6e179'),(26,'craft','m221027_160703_add_image_transform_fill','2023-03-10 19:13:32','2023-03-10 19:13:32','2023-03-10 19:13:32','2e6a7e2e-26c5-434b-b14c-0ff34193cfd1'),(27,'craft','m221028_130548_add_canonical_id_index','2023-03-10 19:13:32','2023-03-10 19:13:32','2023-03-10 19:13:32','a5cbc2e2-8cfa-4863-a1b5-795552662444'),(28,'craft','m221118_003031_drop_element_fks','2023-03-10 19:13:32','2023-03-10 19:13:32','2023-03-10 19:13:32','6dc52ffa-920c-4491-9190-afb71ea00415'),(29,'craft','m230131_120713_asset_indexing_session_new_options','2023-03-10 19:13:32','2023-03-10 19:13:32','2023-03-10 19:13:32','c479a2d0-607c-4f3b-a8e6-7dafc9def633'),(30,'craft','m230226_013114_drop_plugin_license_columns','2023-03-10 19:13:32','2023-03-10 19:13:32','2023-03-10 19:13:32','2d557732-68b2-424e-94ce-32fe2e17c508'),(31,'craft','m230531_123004_add_entry_type_show_status_field','2023-09-14 21:11:07','2023-09-14 21:11:07','2023-09-14 21:11:07','bdeffb20-cfbc-41a5-8a35-bcedfbb56acb'),(32,'craft','m230607_102049_add_entrytype_slug_translation_columns','2023-09-14 21:11:07','2023-09-14 21:11:07','2023-09-14 21:11:07','bb78322b-0081-404f-9ec3-72784f2986e8'),(33,'craft','m230710_162700_element_activity','2023-09-14 21:11:07','2023-09-14 21:11:07','2023-09-14 21:11:07','9552739d-6dc5-4956-8308-4ed4f840a8e7'),(34,'craft','m230820_162023_fix_cache_id_type','2023-09-14 21:11:07','2023-09-14 21:11:07','2023-09-14 21:11:07','511ec5eb-afdb-4cdf-8301-e72e758e4475'),(35,'craft','m230826_094050_fix_session_id_type','2023-09-14 21:11:07','2023-09-14 21:11:07','2023-09-14 21:11:07','55887e06-253a-4d72-b6c1-7c149806ae61');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.defaultPlacement','\"end\"'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.fieldLayouts.e34fc8d5-ae42-4ed2-aa81-b45e2764b28a.tabs.0.elementCondition','null'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.fieldLayouts.e34fc8d5-ae42-4ed2-aa81-b45e2764b28a.tabs.0.elements.0.autocapitalize','true'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.fieldLayouts.e34fc8d5-ae42-4ed2-aa81-b45e2764b28a.tabs.0.elements.0.autocomplete','false'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.fieldLayouts.e34fc8d5-ae42-4ed2-aa81-b45e2764b28a.tabs.0.elements.0.autocorrect','true'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.fieldLayouts.e34fc8d5-ae42-4ed2-aa81-b45e2764b28a.tabs.0.elements.0.class','null'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.fieldLayouts.e34fc8d5-ae42-4ed2-aa81-b45e2764b28a.tabs.0.elements.0.disabled','false'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.fieldLayouts.e34fc8d5-ae42-4ed2-aa81-b45e2764b28a.tabs.0.elements.0.elementCondition','null'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.fieldLayouts.e34fc8d5-ae42-4ed2-aa81-b45e2764b28a.tabs.0.elements.0.id','null'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.fieldLayouts.e34fc8d5-ae42-4ed2-aa81-b45e2764b28a.tabs.0.elements.0.instructions','null'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.fieldLayouts.e34fc8d5-ae42-4ed2-aa81-b45e2764b28a.tabs.0.elements.0.label','null'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.fieldLayouts.e34fc8d5-ae42-4ed2-aa81-b45e2764b28a.tabs.0.elements.0.max','null'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.fieldLayouts.e34fc8d5-ae42-4ed2-aa81-b45e2764b28a.tabs.0.elements.0.min','null'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.fieldLayouts.e34fc8d5-ae42-4ed2-aa81-b45e2764b28a.tabs.0.elements.0.name','null'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.fieldLayouts.e34fc8d5-ae42-4ed2-aa81-b45e2764b28a.tabs.0.elements.0.orientation','null'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.fieldLayouts.e34fc8d5-ae42-4ed2-aa81-b45e2764b28a.tabs.0.elements.0.placeholder','null'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.fieldLayouts.e34fc8d5-ae42-4ed2-aa81-b45e2764b28a.tabs.0.elements.0.readonly','false'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.fieldLayouts.e34fc8d5-ae42-4ed2-aa81-b45e2764b28a.tabs.0.elements.0.requirable','false'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.fieldLayouts.e34fc8d5-ae42-4ed2-aa81-b45e2764b28a.tabs.0.elements.0.size','null'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.fieldLayouts.e34fc8d5-ae42-4ed2-aa81-b45e2764b28a.tabs.0.elements.0.step','null'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.fieldLayouts.e34fc8d5-ae42-4ed2-aa81-b45e2764b28a.tabs.0.elements.0.tip','null'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.fieldLayouts.e34fc8d5-ae42-4ed2-aa81-b45e2764b28a.tabs.0.elements.0.title','null'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.fieldLayouts.e34fc8d5-ae42-4ed2-aa81-b45e2764b28a.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\TitleField\"'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.fieldLayouts.e34fc8d5-ae42-4ed2-aa81-b45e2764b28a.tabs.0.elements.0.uid','\"7517edb7-b46f-496b-81b6-ad9fb6d26738\"'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.fieldLayouts.e34fc8d5-ae42-4ed2-aa81-b45e2764b28a.tabs.0.elements.0.userCondition','null'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.fieldLayouts.e34fc8d5-ae42-4ed2-aa81-b45e2764b28a.tabs.0.elements.0.warning','null'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.fieldLayouts.e34fc8d5-ae42-4ed2-aa81-b45e2764b28a.tabs.0.elements.0.width','100'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.fieldLayouts.e34fc8d5-ae42-4ed2-aa81-b45e2764b28a.tabs.0.name','\"Content\"'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.fieldLayouts.e34fc8d5-ae42-4ed2-aa81-b45e2764b28a.tabs.0.uid','\"4370ffcd-91c6-4f51-baf9-17d74e05f513\"'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.fieldLayouts.e34fc8d5-ae42-4ed2-aa81-b45e2764b28a.tabs.0.userCondition','null'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.handle','\"topics\"'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.name','\"Topics\"'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.siteSettings.6fe7500a-704e-4c0f-94ef-a868e4251578.hasUrls','true'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.siteSettings.6fe7500a-704e-4c0f-94ef-a868e4251578.template','\"blog/_topic\"'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.siteSettings.6fe7500a-704e-4c0f-94ef-a868e4251578.uriFormat','\"blog/topics/{slug}\"'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.structure.maxLevels','1'),('categoryGroups.5243d9e9-fe81-41ef-a875-69941c782a8e.structure.uid','\"7219e5f2-ab7a-4fa6-b30b-efb984970862\"'),('dateModified','1694725867'),('email.fromEmail','\"hello@craftcms.com\"'),('email.fromName','\"Tutorial\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elementCondition','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.0.autocapitalize','true'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.0.autocomplete','false'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.0.autocorrect','true'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.0.class','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.0.disabled','false'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.0.elementCondition','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.0.id','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.0.instructions','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.0.label','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.0.max','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.0.min','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.0.name','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.0.orientation','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.0.placeholder','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.0.readonly','false'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.0.requirable','false'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.0.size','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.0.step','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.0.tip','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.0.title','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.0.uid','\"24ed461b-8ca8-4318-a547-c580ae6b9b24\"'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.0.userCondition','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.0.warning','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.0.width','100'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.1.elementCondition','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.1.fieldUid','\"22c82593-5c3e-471a-a75c-af46ba3b9dfc\"'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.1.instructions','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.1.label','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.1.required','false'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.1.tip','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.1.uid','\"37e26aa5-a64a-4c2d-8fbf-4d4265f7e557\"'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.1.userCondition','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.1.warning','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.1.width','100'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.2.elementCondition','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.2.fieldUid','\"11606301-cb30-4c50-b455-5ead656bbcee\"'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.2.instructions','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.2.label','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.2.required','false'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.2.tip','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.2.uid','\"dd4a35ca-3b59-42b1-a33e-31d3da663989\"'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.2.userCondition','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.2.warning','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.elements.2.width','100'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.name','\"Content\"'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.uid','\"24404a1e-a8e5-4a64-95aa-638b0cfd12cd\"'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.fieldLayouts.ddebd0c2-f431-409c-b6f0-0c95dc61bc4c.tabs.0.userCondition','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.handle','\"about\"'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.hasTitleField','false'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.name','\"About\"'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.section','\"9ef9856c-d50d-49d9-bd1e-e029956e2342\"'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.sortOrder','1'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.titleFormat','\"{section.name|raw}\"'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.titleTranslationKeyFormat','null'),('entryTypes.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027.titleTranslationMethod','\"site\"'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elementCondition','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.0.autocapitalize','true'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.0.autocomplete','false'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.0.autocorrect','true'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.0.class','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.0.disabled','false'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.0.elementCondition','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.0.id','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.0.instructions','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.0.label','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.0.max','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.0.min','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.0.name','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.0.orientation','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.0.placeholder','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.0.readonly','false'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.0.requirable','false'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.0.size','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.0.step','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.0.tip','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.0.title','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.0.uid','\"577aac9f-b0fd-4e6d-a6b2-82e26cc5f05a\"'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.0.userCondition','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.0.warning','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.0.width','100'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.1.elementCondition','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.1.fieldUid','\"d8695b13-9305-4f11-b758-937e573eb1e2\"'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.1.instructions','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.1.label','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.1.required','false'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.1.tip','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.1.uid','\"fa97269d-162a-48c4-afc9-cd140bbd697f\"'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.1.userCondition','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.1.warning','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.1.width','100'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.2.elementCondition','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.2.fieldUid','\"6359420f-e650-4b13-a5a5-01ac0d5c1a72\"'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.2.instructions','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.2.label','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.2.required','false'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.2.tip','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.2.uid','\"18fd64a6-5a30-419f-ba41-9e7b184ac2b1\"'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.2.userCondition','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.2.warning','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.2.width','100'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.3.elementCondition','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.3.fieldUid','\"ad503b1a-8fdf-4a3b-a93c-6bdb2c823285\"'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.3.instructions','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.3.label','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.3.required','false'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.3.tip','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.3.uid','\"83da71e4-eb92-4b65-a747-52c479527f4f\"'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.3.userCondition','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.3.warning','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.3.width','100'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.4.elementCondition','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.4.fieldUid','\"342e9393-8067-4c94-9386-e1c541273ddb\"'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.4.instructions','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.4.label','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.4.required','false'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.4.tip','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.4.uid','\"c3a858a5-c56b-4c9f-ae38-989c7bb00c5c\"'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.4.userCondition','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.4.warning','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.4.width','100'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.5.elementCondition','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.5.fieldUid','\"0ceb2d7a-7218-4ca6-838a-e98a58cc379b\"'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.5.instructions','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.5.label','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.5.required','false'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.5.tip','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.5.uid','\"602f8f6e-5696-433b-90c2-4e597be90483\"'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.5.userCondition','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.5.warning','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.elements.5.width','100'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.name','\"Content\"'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.uid','\"d79c3649-544d-4d4a-b795-45a8182cb5fd\"'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.fieldLayouts.0c53c2d2-6cec-48f6-a492-d8e8d403eb82.tabs.0.userCondition','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.handle','\"post\"'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.hasTitleField','true'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.name','\"Post\"'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.section','\"9420faf5-3e37-4758-8c52-354bedac7414\"'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.sortOrder','1'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.titleFormat','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.titleTranslationKeyFormat','null'),('entryTypes.c3785700-c808-470f-bb7f-2ae46d6731e8.titleTranslationMethod','\"site\"'),('fieldGroups.2e7d47d3-0ff1-4e7d-bd97-776d26709501.name','\"Global\"'),('fieldGroups.50bd58d3-3f59-4d28-b958-5f7fbfa30fd5.name','\"Common\"'),('fieldGroups.bd585f47-3b6d-4f10-b8ea-30c76f0863f3.name','\"Blog\"'),('fieldGroups.d9caefb2-0f98-44ed-9348-d6e5ecd7640f.name','\"About\"'),('fields.11606301-cb30-4c50-b455-5ead656bbcee.columnSuffix','\"ikcydbdr\"'),('fields.11606301-cb30-4c50-b455-5ead656bbcee.contentColumnType','\"text\"'),('fields.11606301-cb30-4c50-b455-5ead656bbcee.fieldGroup','\"d9caefb2-0f98-44ed-9348-d6e5ecd7640f\"'),('fields.11606301-cb30-4c50-b455-5ead656bbcee.handle','\"bio\"'),('fields.11606301-cb30-4c50-b455-5ead656bbcee.instructions','null'),('fields.11606301-cb30-4c50-b455-5ead656bbcee.name','\"Bio\"'),('fields.11606301-cb30-4c50-b455-5ead656bbcee.searchable','false'),('fields.11606301-cb30-4c50-b455-5ead656bbcee.settings.byteLimit','null'),('fields.11606301-cb30-4c50-b455-5ead656bbcee.settings.charLimit','null'),('fields.11606301-cb30-4c50-b455-5ead656bbcee.settings.code','false'),('fields.11606301-cb30-4c50-b455-5ead656bbcee.settings.columnType','null'),('fields.11606301-cb30-4c50-b455-5ead656bbcee.settings.initialRows','8'),('fields.11606301-cb30-4c50-b455-5ead656bbcee.settings.multiline','true'),('fields.11606301-cb30-4c50-b455-5ead656bbcee.settings.placeholder','null'),('fields.11606301-cb30-4c50-b455-5ead656bbcee.settings.uiMode','\"normal\"'),('fields.11606301-cb30-4c50-b455-5ead656bbcee.translationKeyFormat','null'),('fields.11606301-cb30-4c50-b455-5ead656bbcee.translationMethod','\"none\"'),('fields.11606301-cb30-4c50-b455-5ead656bbcee.type','\"craft\\\\fields\\\\PlainText\"'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.columnSuffix','null'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.contentColumnType','\"string\"'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.fieldGroup','\"d9caefb2-0f98-44ed-9348-d6e5ecd7640f\"'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.handle','\"profilePhoto\"'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.instructions','null'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.name','\"Profile Photo\"'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.searchable','false'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.allowedKinds','null'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.allowSelfRelations','false'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.allowSubfolders','true'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.allowUploads','true'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.branchLimit','null'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.defaultUploadLocationSource','\"volume:ec1487e2-3e09-4e17-85de-151fb21bf341\"'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.defaultUploadLocationSubpath','null'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.localizeRelations','false'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.maintainHierarchy','false'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.maxRelations','null'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.minRelations','null'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.previewMode','\"full\"'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.restrictedDefaultUploadSubpath','null'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.restrictedLocationSource','\"volume:ec1487e2-3e09-4e17-85de-151fb21bf341\"'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.restrictedLocationSubpath','null'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.restrictFiles','false'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.restrictLocation','false'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.selectionCondition.__assoc__.0.0','\"elementType\"'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.selectionCondition.__assoc__.0.1','\"craft\\\\elements\\\\Asset\"'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.selectionCondition.__assoc__.1.0','\"fieldContext\"'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.selectionCondition.__assoc__.1.1','\"global\"'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.selectionCondition.__assoc__.2.0','\"class\"'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.selectionCondition.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.selectionLabel','null'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.showSiteMenu','false'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.showUnpermittedFiles','false'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.showUnpermittedVolumes','false'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.sources.0','\"volume:ec1487e2-3e09-4e17-85de-151fb21bf341\"'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.targetSiteId','null'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.validateRelatedElements','false'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.settings.viewMode','\"large\"'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.translationKeyFormat','null'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.translationMethod','\"site\"'),('fields.22c82593-5c3e-471a-a75c-af46ba3b9dfc.type','\"craft\\\\fields\\\\Assets\"'),('fields.342e9393-8067-4c94-9386-e1c541273ddb.columnSuffix','null'),('fields.342e9393-8067-4c94-9386-e1c541273ddb.contentColumnType','\"string\"'),('fields.342e9393-8067-4c94-9386-e1c541273ddb.fieldGroup','\"bd585f47-3b6d-4f10-b8ea-30c76f0863f3\"'),('fields.342e9393-8067-4c94-9386-e1c541273ddb.handle','\"topics\"'),('fields.342e9393-8067-4c94-9386-e1c541273ddb.instructions','null'),('fields.342e9393-8067-4c94-9386-e1c541273ddb.name','\"Topics\"'),('fields.342e9393-8067-4c94-9386-e1c541273ddb.searchable','false'),('fields.342e9393-8067-4c94-9386-e1c541273ddb.settings.allowLimit','false'),('fields.342e9393-8067-4c94-9386-e1c541273ddb.settings.allowMultipleSources','false'),('fields.342e9393-8067-4c94-9386-e1c541273ddb.settings.allowSelfRelations','false'),('fields.342e9393-8067-4c94-9386-e1c541273ddb.settings.branchLimit','null'),('fields.342e9393-8067-4c94-9386-e1c541273ddb.settings.localizeRelations','false'),('fields.342e9393-8067-4c94-9386-e1c541273ddb.settings.maxRelations','null'),('fields.342e9393-8067-4c94-9386-e1c541273ddb.settings.minRelations','null'),('fields.342e9393-8067-4c94-9386-e1c541273ddb.settings.selectionLabel','null'),('fields.342e9393-8067-4c94-9386-e1c541273ddb.settings.showSiteMenu','false'),('fields.342e9393-8067-4c94-9386-e1c541273ddb.settings.source','\"group:5243d9e9-fe81-41ef-a875-69941c782a8e\"'),('fields.342e9393-8067-4c94-9386-e1c541273ddb.settings.sources','\"*\"'),('fields.342e9393-8067-4c94-9386-e1c541273ddb.settings.targetSiteId','null'),('fields.342e9393-8067-4c94-9386-e1c541273ddb.settings.validateRelatedElements','false'),('fields.342e9393-8067-4c94-9386-e1c541273ddb.settings.viewMode','null'),('fields.342e9393-8067-4c94-9386-e1c541273ddb.translationKeyFormat','null'),('fields.342e9393-8067-4c94-9386-e1c541273ddb.translationMethod','\"site\"'),('fields.342e9393-8067-4c94-9386-e1c541273ddb.type','\"craft\\\\fields\\\\Categories\"'),('fields.6359420f-e650-4b13-a5a5-01ac0d5c1a72.columnSuffix','\"kxpmnqno\"'),('fields.6359420f-e650-4b13-a5a5-01ac0d5c1a72.contentColumnType','\"text\"'),('fields.6359420f-e650-4b13-a5a5-01ac0d5c1a72.fieldGroup','\"bd585f47-3b6d-4f10-b8ea-30c76f0863f3\"'),('fields.6359420f-e650-4b13-a5a5-01ac0d5c1a72.handle','\"summary\"'),('fields.6359420f-e650-4b13-a5a5-01ac0d5c1a72.instructions','null'),('fields.6359420f-e650-4b13-a5a5-01ac0d5c1a72.name','\"Summary\"'),('fields.6359420f-e650-4b13-a5a5-01ac0d5c1a72.searchable','false'),('fields.6359420f-e650-4b13-a5a5-01ac0d5c1a72.settings.byteLimit','null'),('fields.6359420f-e650-4b13-a5a5-01ac0d5c1a72.settings.charLimit','null'),('fields.6359420f-e650-4b13-a5a5-01ac0d5c1a72.settings.code','false'),('fields.6359420f-e650-4b13-a5a5-01ac0d5c1a72.settings.columnType','null'),('fields.6359420f-e650-4b13-a5a5-01ac0d5c1a72.settings.initialRows','1'),('fields.6359420f-e650-4b13-a5a5-01ac0d5c1a72.settings.multiline','true'),('fields.6359420f-e650-4b13-a5a5-01ac0d5c1a72.settings.placeholder','null'),('fields.6359420f-e650-4b13-a5a5-01ac0d5c1a72.settings.uiMode','\"normal\"'),('fields.6359420f-e650-4b13-a5a5-01ac0d5c1a72.translationKeyFormat','null'),('fields.6359420f-e650-4b13-a5a5-01ac0d5c1a72.translationMethod','\"none\"'),('fields.6359420f-e650-4b13-a5a5-01ac0d5c1a72.type','\"craft\\\\fields\\\\PlainText\"'),('fields.ad503b1a-8fdf-4a3b-a93c-6bdb2c823285.columnSuffix','null'),('fields.ad503b1a-8fdf-4a3b-a93c-6bdb2c823285.contentColumnType','\"string\"'),('fields.ad503b1a-8fdf-4a3b-a93c-6bdb2c823285.fieldGroup','\"bd585f47-3b6d-4f10-b8ea-30c76f0863f3\"'),('fields.ad503b1a-8fdf-4a3b-a93c-6bdb2c823285.handle','\"postContent\"'),('fields.ad503b1a-8fdf-4a3b-a93c-6bdb2c823285.instructions','null'),('fields.ad503b1a-8fdf-4a3b-a93c-6bdb2c823285.name','\"Post Content\"'),('fields.ad503b1a-8fdf-4a3b-a93c-6bdb2c823285.searchable','false'),('fields.ad503b1a-8fdf-4a3b-a93c-6bdb2c823285.settings.contentTable','\"{{%matrixcontent_postcontent}}\"'),('fields.ad503b1a-8fdf-4a3b-a93c-6bdb2c823285.settings.maxBlocks','null'),('fields.ad503b1a-8fdf-4a3b-a93c-6bdb2c823285.settings.minBlocks','null'),('fields.ad503b1a-8fdf-4a3b-a93c-6bdb2c823285.settings.propagationKeyFormat','null'),('fields.ad503b1a-8fdf-4a3b-a93c-6bdb2c823285.settings.propagationMethod','\"all\"'),('fields.ad503b1a-8fdf-4a3b-a93c-6bdb2c823285.translationKeyFormat','null'),('fields.ad503b1a-8fdf-4a3b-a93c-6bdb2c823285.translationMethod','\"site\"'),('fields.ad503b1a-8fdf-4a3b-a93c-6bdb2c823285.type','\"craft\\\\fields\\\\Matrix\"'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.columnSuffix','null'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.contentColumnType','\"string\"'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.fieldGroup','\"bd585f47-3b6d-4f10-b8ea-30c76f0863f3\"'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.handle','\"featureImage\"'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.instructions','null'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.name','\"Feature Image\"'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.searchable','false'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.settings.allowedKinds.0','\"image\"'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.settings.allowSelfRelations','false'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.settings.allowSubfolders','true'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.settings.allowUploads','true'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.settings.defaultUploadLocationSource','\"volume:ec1487e2-3e09-4e17-85de-151fb21bf341\"'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.settings.defaultUploadLocationSubpath','null'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.settings.localizeRelations','false'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.settings.maxRelations','1'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.settings.minRelations','null'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.settings.previewMode','\"full\"'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.settings.restrictedDefaultUploadSubpath','null'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.settings.restrictedLocationSource','\"volume:ec1487e2-3e09-4e17-85de-151fb21bf341\"'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.settings.restrictedLocationSubpath','null'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.settings.restrictFiles','true'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.settings.restrictLocation','true'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.settings.selectionCondition.__assoc__.0.0','\"elementType\"'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.settings.selectionCondition.__assoc__.0.1','\"craft\\\\elements\\\\Asset\"'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.settings.selectionCondition.__assoc__.1.0','\"fieldContext\"'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.settings.selectionCondition.__assoc__.1.1','\"global\"'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.settings.selectionCondition.__assoc__.2.0','\"class\"'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.settings.selectionCondition.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.settings.selectionLabel','null'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.settings.showSiteMenu','false'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.settings.showUnpermittedFiles','false'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.settings.showUnpermittedVolumes','false'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.settings.source','null'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.settings.sources','\"*\"'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.settings.targetSiteId','null'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.settings.validateRelatedElements','false'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.settings.viewMode','\"large\"'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.translationKeyFormat','null'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.translationMethod','\"site\"'),('fields.d8695b13-9305-4f11-b758-937e573eb1e2.type','\"craft\\\\fields\\\\Assets\"'),('fields.de9aba82-dcb8-47b5-b085-64ed1eb4dd6e.columnSuffix','\"cyaftqpy\"'),('fields.de9aba82-dcb8-47b5-b085-64ed1eb4dd6e.contentColumnType','\"text\"'),('fields.de9aba82-dcb8-47b5-b085-64ed1eb4dd6e.fieldGroup','\"2e7d47d3-0ff1-4e7d-bd97-776d26709501\"'),('fields.de9aba82-dcb8-47b5-b085-64ed1eb4dd6e.handle','\"description\"'),('fields.de9aba82-dcb8-47b5-b085-64ed1eb4dd6e.instructions','null'),('fields.de9aba82-dcb8-47b5-b085-64ed1eb4dd6e.name','\"Description\"'),('fields.de9aba82-dcb8-47b5-b085-64ed1eb4dd6e.searchable','false'),('fields.de9aba82-dcb8-47b5-b085-64ed1eb4dd6e.settings.byteLimit','null'),('fields.de9aba82-dcb8-47b5-b085-64ed1eb4dd6e.settings.charLimit','null'),('fields.de9aba82-dcb8-47b5-b085-64ed1eb4dd6e.settings.code','false'),('fields.de9aba82-dcb8-47b5-b085-64ed1eb4dd6e.settings.columnType','null'),('fields.de9aba82-dcb8-47b5-b085-64ed1eb4dd6e.settings.initialRows','4'),('fields.de9aba82-dcb8-47b5-b085-64ed1eb4dd6e.settings.multiline','true'),('fields.de9aba82-dcb8-47b5-b085-64ed1eb4dd6e.settings.placeholder','null'),('fields.de9aba82-dcb8-47b5-b085-64ed1eb4dd6e.settings.uiMode','\"normal\"'),('fields.de9aba82-dcb8-47b5-b085-64ed1eb4dd6e.translationKeyFormat','null'),('fields.de9aba82-dcb8-47b5-b085-64ed1eb4dd6e.translationMethod','\"none\"'),('fields.de9aba82-dcb8-47b5-b085-64ed1eb4dd6e.type','\"craft\\\\fields\\\\PlainText\"'),('fs.hardDisk.hasUrls','true'),('fs.hardDisk.name','\"Hard Disk\"'),('fs.hardDisk.settings.path','\"@webroot/uploads/images\"'),('fs.hardDisk.type','\"craft\\\\fs\\\\Local\"'),('fs.hardDisk.url','\"@web/uploads/images\"'),('globalSets.3d59750a-8ed6-43ef-9a60-460cfcc12832.fieldLayouts.1f531920-6cc5-45b4-9c04-aa537594c1b5.tabs.0.elementCondition','null'),('globalSets.3d59750a-8ed6-43ef-9a60-460cfcc12832.fieldLayouts.1f531920-6cc5-45b4-9c04-aa537594c1b5.tabs.0.elements.0.elementCondition','null'),('globalSets.3d59750a-8ed6-43ef-9a60-460cfcc12832.fieldLayouts.1f531920-6cc5-45b4-9c04-aa537594c1b5.tabs.0.elements.0.fieldUid','\"de9aba82-dcb8-47b5-b085-64ed1eb4dd6e\"'),('globalSets.3d59750a-8ed6-43ef-9a60-460cfcc12832.fieldLayouts.1f531920-6cc5-45b4-9c04-aa537594c1b5.tabs.0.elements.0.instructions','null'),('globalSets.3d59750a-8ed6-43ef-9a60-460cfcc12832.fieldLayouts.1f531920-6cc5-45b4-9c04-aa537594c1b5.tabs.0.elements.0.label','null'),('globalSets.3d59750a-8ed6-43ef-9a60-460cfcc12832.fieldLayouts.1f531920-6cc5-45b4-9c04-aa537594c1b5.tabs.0.elements.0.required','false'),('globalSets.3d59750a-8ed6-43ef-9a60-460cfcc12832.fieldLayouts.1f531920-6cc5-45b4-9c04-aa537594c1b5.tabs.0.elements.0.tip','null'),('globalSets.3d59750a-8ed6-43ef-9a60-460cfcc12832.fieldLayouts.1f531920-6cc5-45b4-9c04-aa537594c1b5.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.3d59750a-8ed6-43ef-9a60-460cfcc12832.fieldLayouts.1f531920-6cc5-45b4-9c04-aa537594c1b5.tabs.0.elements.0.uid','\"d2bb067d-0a8d-4460-b51d-d32e41eb86bd\"'),('globalSets.3d59750a-8ed6-43ef-9a60-460cfcc12832.fieldLayouts.1f531920-6cc5-45b4-9c04-aa537594c1b5.tabs.0.elements.0.userCondition','null'),('globalSets.3d59750a-8ed6-43ef-9a60-460cfcc12832.fieldLayouts.1f531920-6cc5-45b4-9c04-aa537594c1b5.tabs.0.elements.0.warning','null'),('globalSets.3d59750a-8ed6-43ef-9a60-460cfcc12832.fieldLayouts.1f531920-6cc5-45b4-9c04-aa537594c1b5.tabs.0.elements.0.width','100'),('globalSets.3d59750a-8ed6-43ef-9a60-460cfcc12832.fieldLayouts.1f531920-6cc5-45b4-9c04-aa537594c1b5.tabs.0.name','\"Metadata\"'),('globalSets.3d59750a-8ed6-43ef-9a60-460cfcc12832.fieldLayouts.1f531920-6cc5-45b4-9c04-aa537594c1b5.tabs.0.uid','\"0400ac59-ff4f-4dc4-acac-f9f53ab06fa5\"'),('globalSets.3d59750a-8ed6-43ef-9a60-460cfcc12832.fieldLayouts.1f531920-6cc5-45b4-9c04-aa537594c1b5.tabs.0.userCondition','null'),('globalSets.3d59750a-8ed6-43ef-9a60-460cfcc12832.handle','\"siteInfo\"'),('globalSets.3d59750a-8ed6-43ef-9a60-460cfcc12832.name','\"Site Info\"'),('globalSets.3d59750a-8ed6-43ef-9a60-460cfcc12832.sortOrder','1'),('graphql.schemas.a3430119-c9d8-45be-8833-73170b536844.isPublic','true'),('graphql.schemas.a3430119-c9d8-45be-8833-73170b536844.name','\"Public Schema\"'),('imageTransforms.9a47f63c-c5d8-43bd-be5e-5c4a045dce41.fill','null'),('imageTransforms.9a47f63c-c5d8-43bd-be5e-5c4a045dce41.format','null'),('imageTransforms.9a47f63c-c5d8-43bd-be5e-5c4a045dce41.handle','\"thumbnail\"'),('imageTransforms.9a47f63c-c5d8-43bd-be5e-5c4a045dce41.height','null'),('imageTransforms.9a47f63c-c5d8-43bd-be5e-5c4a045dce41.interlace','\"none\"'),('imageTransforms.9a47f63c-c5d8-43bd-be5e-5c4a045dce41.mode','\"fit\"'),('imageTransforms.9a47f63c-c5d8-43bd-be5e-5c4a045dce41.name','\"Thumbnail\"'),('imageTransforms.9a47f63c-c5d8-43bd-be5e-5c4a045dce41.position','\"center-center\"'),('imageTransforms.9a47f63c-c5d8-43bd-be5e-5c4a045dce41.quality','null'),('imageTransforms.9a47f63c-c5d8-43bd-be5e-5c4a045dce41.upscale','false'),('imageTransforms.9a47f63c-c5d8-43bd-be5e-5c4a045dce41.width','1200'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.field','\"ad503b1a-8fdf-4a3b-a93c-6bdb2c823285\"'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fieldLayouts.3f024f9c-c06a-49c6-9224-4180d6b5aaf0.tabs.0.elementCondition','null'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fieldLayouts.3f024f9c-c06a-49c6-9224-4180d6b5aaf0.tabs.0.elements.0.elementCondition','null'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fieldLayouts.3f024f9c-c06a-49c6-9224-4180d6b5aaf0.tabs.0.elements.0.fieldUid','\"782938c4-8296-4285-825e-8a68c0a0899b\"'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fieldLayouts.3f024f9c-c06a-49c6-9224-4180d6b5aaf0.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fieldLayouts.3f024f9c-c06a-49c6-9224-4180d6b5aaf0.tabs.0.elements.0.label','null'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fieldLayouts.3f024f9c-c06a-49c6-9224-4180d6b5aaf0.tabs.0.elements.0.required','true'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fieldLayouts.3f024f9c-c06a-49c6-9224-4180d6b5aaf0.tabs.0.elements.0.tip','null'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fieldLayouts.3f024f9c-c06a-49c6-9224-4180d6b5aaf0.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fieldLayouts.3f024f9c-c06a-49c6-9224-4180d6b5aaf0.tabs.0.elements.0.uid','\"9e7445e8-3c36-4e88-aea6-b0e41ed192dd\"'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fieldLayouts.3f024f9c-c06a-49c6-9224-4180d6b5aaf0.tabs.0.elements.0.userCondition','null'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fieldLayouts.3f024f9c-c06a-49c6-9224-4180d6b5aaf0.tabs.0.elements.0.warning','null'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fieldLayouts.3f024f9c-c06a-49c6-9224-4180d6b5aaf0.tabs.0.elements.0.width','100'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fieldLayouts.3f024f9c-c06a-49c6-9224-4180d6b5aaf0.tabs.0.name','\"Content\"'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fieldLayouts.3f024f9c-c06a-49c6-9224-4180d6b5aaf0.tabs.0.uid','\"d3468b10-a164-459b-b2c4-e25312ada2fc\"'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fieldLayouts.3f024f9c-c06a-49c6-9224-4180d6b5aaf0.tabs.0.userCondition','null'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fields.782938c4-8296-4285-825e-8a68c0a0899b.columnSuffix','\"acuemsza\"'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fields.782938c4-8296-4285-825e-8a68c0a0899b.contentColumnType','\"text\"'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fields.782938c4-8296-4285-825e-8a68c0a0899b.fieldGroup','null'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fields.782938c4-8296-4285-825e-8a68c0a0899b.handle','\"text\"'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fields.782938c4-8296-4285-825e-8a68c0a0899b.instructions','null'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fields.782938c4-8296-4285-825e-8a68c0a0899b.name','\"Text\"'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fields.782938c4-8296-4285-825e-8a68c0a0899b.searchable','false'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fields.782938c4-8296-4285-825e-8a68c0a0899b.settings.byteLimit','null'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fields.782938c4-8296-4285-825e-8a68c0a0899b.settings.charLimit','null'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fields.782938c4-8296-4285-825e-8a68c0a0899b.settings.code','false'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fields.782938c4-8296-4285-825e-8a68c0a0899b.settings.columnType','null'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fields.782938c4-8296-4285-825e-8a68c0a0899b.settings.initialRows','10'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fields.782938c4-8296-4285-825e-8a68c0a0899b.settings.multiline','true'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fields.782938c4-8296-4285-825e-8a68c0a0899b.settings.placeholder','null'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fields.782938c4-8296-4285-825e-8a68c0a0899b.settings.uiMode','\"normal\"'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fields.782938c4-8296-4285-825e-8a68c0a0899b.translationKeyFormat','null'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fields.782938c4-8296-4285-825e-8a68c0a0899b.translationMethod','\"none\"'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.fields.782938c4-8296-4285-825e-8a68c0a0899b.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.handle','\"text\"'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.name','\"Text\"'),('matrixBlockTypes.2633adaf-c526-44c9-885e-a6272d8f0a26.sortOrder','1'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.field','\"ad503b1a-8fdf-4a3b-a93c-6bdb2c823285\"'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fieldLayouts.18fdfbda-ae57-4895-b63c-2350f1292b48.tabs.0.elementCondition','null'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fieldLayouts.18fdfbda-ae57-4895-b63c-2350f1292b48.tabs.0.elements.0.elementCondition','null'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fieldLayouts.18fdfbda-ae57-4895-b63c-2350f1292b48.tabs.0.elements.0.fieldUid','\"711e542a-7869-410a-ab6c-83fc8c36a5b6\"'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fieldLayouts.18fdfbda-ae57-4895-b63c-2350f1292b48.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fieldLayouts.18fdfbda-ae57-4895-b63c-2350f1292b48.tabs.0.elements.0.label','null'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fieldLayouts.18fdfbda-ae57-4895-b63c-2350f1292b48.tabs.0.elements.0.required','true'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fieldLayouts.18fdfbda-ae57-4895-b63c-2350f1292b48.tabs.0.elements.0.tip','null'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fieldLayouts.18fdfbda-ae57-4895-b63c-2350f1292b48.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fieldLayouts.18fdfbda-ae57-4895-b63c-2350f1292b48.tabs.0.elements.0.uid','\"0030abb3-10fe-4e1d-b60c-12ab8ab3a459\"'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fieldLayouts.18fdfbda-ae57-4895-b63c-2350f1292b48.tabs.0.elements.0.userCondition','null'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fieldLayouts.18fdfbda-ae57-4895-b63c-2350f1292b48.tabs.0.elements.0.warning','null'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fieldLayouts.18fdfbda-ae57-4895-b63c-2350f1292b48.tabs.0.elements.0.width','100'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fieldLayouts.18fdfbda-ae57-4895-b63c-2350f1292b48.tabs.0.name','\"Content\"'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fieldLayouts.18fdfbda-ae57-4895-b63c-2350f1292b48.tabs.0.uid','\"6492b6a0-f2b8-4a93-be48-20fad5e1d497\"'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fieldLayouts.18fdfbda-ae57-4895-b63c-2350f1292b48.tabs.0.userCondition','null'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fields.711e542a-7869-410a-ab6c-83fc8c36a5b6.columnSuffix','\"xghluocz\"'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fields.711e542a-7869-410a-ab6c-83fc8c36a5b6.contentColumnType','\"text\"'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fields.711e542a-7869-410a-ab6c-83fc8c36a5b6.fieldGroup','null'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fields.711e542a-7869-410a-ab6c-83fc8c36a5b6.handle','\"quote\"'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fields.711e542a-7869-410a-ab6c-83fc8c36a5b6.instructions','null'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fields.711e542a-7869-410a-ab6c-83fc8c36a5b6.name','\"Quote\"'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fields.711e542a-7869-410a-ab6c-83fc8c36a5b6.searchable','false'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fields.711e542a-7869-410a-ab6c-83fc8c36a5b6.settings.byteLimit','null'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fields.711e542a-7869-410a-ab6c-83fc8c36a5b6.settings.charLimit','null'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fields.711e542a-7869-410a-ab6c-83fc8c36a5b6.settings.code','false'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fields.711e542a-7869-410a-ab6c-83fc8c36a5b6.settings.columnType','null'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fields.711e542a-7869-410a-ab6c-83fc8c36a5b6.settings.initialRows','6'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fields.711e542a-7869-410a-ab6c-83fc8c36a5b6.settings.multiline','true'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fields.711e542a-7869-410a-ab6c-83fc8c36a5b6.settings.placeholder','null'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fields.711e542a-7869-410a-ab6c-83fc8c36a5b6.settings.uiMode','\"enlarged\"'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fields.711e542a-7869-410a-ab6c-83fc8c36a5b6.translationKeyFormat','null'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fields.711e542a-7869-410a-ab6c-83fc8c36a5b6.translationMethod','\"none\"'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.fields.711e542a-7869-410a-ab6c-83fc8c36a5b6.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.handle','\"quote\"'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.name','\"Quote\"'),('matrixBlockTypes.423216e9-be60-4b68-a48f-32690ba804dc.sortOrder','3'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.field','\"ad503b1a-8fdf-4a3b-a93c-6bdb2c823285\"'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fieldLayouts.51f32229-5de2-4ec0-bcac-c4bc9c1df0f0.tabs.0.elementCondition','null'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fieldLayouts.51f32229-5de2-4ec0-bcac-c4bc9c1df0f0.tabs.0.elements.0.elementCondition','null'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fieldLayouts.51f32229-5de2-4ec0-bcac-c4bc9c1df0f0.tabs.0.elements.0.fieldUid','\"473ce54c-06f8-45af-a737-7aaeabffbfde\"'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fieldLayouts.51f32229-5de2-4ec0-bcac-c4bc9c1df0f0.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fieldLayouts.51f32229-5de2-4ec0-bcac-c4bc9c1df0f0.tabs.0.elements.0.label','null'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fieldLayouts.51f32229-5de2-4ec0-bcac-c4bc9c1df0f0.tabs.0.elements.0.required','true'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fieldLayouts.51f32229-5de2-4ec0-bcac-c4bc9c1df0f0.tabs.0.elements.0.tip','null'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fieldLayouts.51f32229-5de2-4ec0-bcac-c4bc9c1df0f0.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fieldLayouts.51f32229-5de2-4ec0-bcac-c4bc9c1df0f0.tabs.0.elements.0.uid','\"4e34bf66-1913-40f6-af3a-d1527923058b\"'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fieldLayouts.51f32229-5de2-4ec0-bcac-c4bc9c1df0f0.tabs.0.elements.0.userCondition','null'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fieldLayouts.51f32229-5de2-4ec0-bcac-c4bc9c1df0f0.tabs.0.elements.0.warning','null'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fieldLayouts.51f32229-5de2-4ec0-bcac-c4bc9c1df0f0.tabs.0.elements.0.width','100'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fieldLayouts.51f32229-5de2-4ec0-bcac-c4bc9c1df0f0.tabs.0.name','\"Content\"'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fieldLayouts.51f32229-5de2-4ec0-bcac-c4bc9c1df0f0.tabs.0.uid','\"c1acae64-7b7b-4d5d-bd90-a06e7a092563\"'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fieldLayouts.51f32229-5de2-4ec0-bcac-c4bc9c1df0f0.tabs.0.userCondition','null'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.columnSuffix','null'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.contentColumnType','\"string\"'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.fieldGroup','null'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.handle','\"image\"'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.instructions','null'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.name','\"Image\"'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.searchable','false'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.allowedKinds.0','\"image\"'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.allowSelfRelations','false'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.allowSubfolders','true'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.allowUploads','true'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.branchLimit','null'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.defaultUploadLocationSource','\"volume:ec1487e2-3e09-4e17-85de-151fb21bf341\"'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.defaultUploadLocationSubpath','null'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.localizeRelations','false'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.maintainHierarchy','false'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.maxRelations','1'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.minRelations','null'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.previewMode','\"full\"'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.restrictedDefaultUploadSubpath','null'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.restrictedLocationSource','\"volume:ec1487e2-3e09-4e17-85de-151fb21bf341\"'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.restrictedLocationSubpath','null'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.restrictFiles','true'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.restrictLocation','true'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.selectionCondition.__assoc__.0.0','\"elementType\"'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.selectionCondition.__assoc__.0.1','\"craft\\\\elements\\\\Asset\"'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.selectionCondition.__assoc__.1.0','\"fieldContext\"'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.selectionCondition.__assoc__.1.1','\"global\"'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.selectionCondition.__assoc__.2.0','\"class\"'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.selectionCondition.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.selectionLabel','null'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.showSiteMenu','true'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.showUnpermittedFiles','false'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.sources.0','\"volume:ec1487e2-3e09-4e17-85de-151fb21bf341\"'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.targetSiteId','null'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.validateRelatedElements','false'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.settings.viewMode','\"list\"'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.translationKeyFormat','null'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.translationMethod','\"site\"'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.fields.473ce54c-06f8-45af-a737-7aaeabffbfde.type','\"craft\\\\fields\\\\Assets\"'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.handle','\"image\"'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.name','\"Image\"'),('matrixBlockTypes.5e86add9-56fa-4012-a62c-15a24415e5e0.sortOrder','2'),('meta.__names__.11606301-cb30-4c50-b455-5ead656bbcee','\"Bio\"'),('meta.__names__.228d4acb-c42e-4d3d-ad21-8dc3d1ea0027','\"About\"'),('meta.__names__.22c82593-5c3e-471a-a75c-af46ba3b9dfc','\"Profile Photo\"'),('meta.__names__.2633adaf-c526-44c9-885e-a6272d8f0a26','\"Text\"'),('meta.__names__.2e7d47d3-0ff1-4e7d-bd97-776d26709501','\"Global\"'),('meta.__names__.342e9393-8067-4c94-9386-e1c541273ddb','\"Topics\"'),('meta.__names__.3d59750a-8ed6-43ef-9a60-460cfcc12832','\"Site Info\"'),('meta.__names__.423216e9-be60-4b68-a48f-32690ba804dc','\"Quote\"'),('meta.__names__.473ce54c-06f8-45af-a737-7aaeabffbfde','\"Image\"'),('meta.__names__.50bd58d3-3f59-4d28-b958-5f7fbfa30fd5','\"Common\"'),('meta.__names__.5243d9e9-fe81-41ef-a875-69941c782a8e','\"Topics\"'),('meta.__names__.5e86add9-56fa-4012-a62c-15a24415e5e0','\"Image\"'),('meta.__names__.6359420f-e650-4b13-a5a5-01ac0d5c1a72','\"Summary\"'),('meta.__names__.6fe7500a-704e-4c0f-94ef-a868e4251578','\"Tutorial\"'),('meta.__names__.711e542a-7869-410a-ab6c-83fc8c36a5b6','\"Quote\"'),('meta.__names__.782938c4-8296-4285-825e-8a68c0a0899b','\"Text\"'),('meta.__names__.9420faf5-3e37-4758-8c52-354bedac7414','\"Blog\"'),('meta.__names__.9a47f63c-c5d8-43bd-be5e-5c4a045dce41','\"Thumbnail\"'),('meta.__names__.9ef9856c-d50d-49d9-bd1e-e029956e2342','\"About\"'),('meta.__names__.a3430119-c9d8-45be-8833-73170b536844','\"Public Schema\"'),('meta.__names__.ad503b1a-8fdf-4a3b-a93c-6bdb2c823285','\"Post Content\"'),('meta.__names__.bd585f47-3b6d-4f10-b8ea-30c76f0863f3','\"Blog\"'),('meta.__names__.c3785700-c808-470f-bb7f-2ae46d6731e8','\"Post\"'),('meta.__names__.d8695b13-9305-4f11-b758-937e573eb1e2','\"Feature Image\"'),('meta.__names__.d9caefb2-0f98-44ed-9348-d6e5ecd7640f','\"About\"'),('meta.__names__.de9aba82-dcb8-47b5-b085-64ed1eb4dd6e','\"Description\"'),('meta.__names__.ec1487e2-3e09-4e17-85de-151fb21bf341','\"Images\"'),('meta.__names__.f702ad74-9616-44d5-a062-62d8e7ef2b2d','\"Tutorial\"'),('sections.9420faf5-3e37-4758-8c52-354bedac7414.defaultPlacement','\"end\"'),('sections.9420faf5-3e37-4758-8c52-354bedac7414.enableVersioning','true'),('sections.9420faf5-3e37-4758-8c52-354bedac7414.handle','\"blog\"'),('sections.9420faf5-3e37-4758-8c52-354bedac7414.name','\"Blog\"'),('sections.9420faf5-3e37-4758-8c52-354bedac7414.propagationMethod','\"all\"'),('sections.9420faf5-3e37-4758-8c52-354bedac7414.siteSettings.6fe7500a-704e-4c0f-94ef-a868e4251578.enabledByDefault','true'),('sections.9420faf5-3e37-4758-8c52-354bedac7414.siteSettings.6fe7500a-704e-4c0f-94ef-a868e4251578.hasUrls','true'),('sections.9420faf5-3e37-4758-8c52-354bedac7414.siteSettings.6fe7500a-704e-4c0f-94ef-a868e4251578.template','\"blog/_entry\"'),('sections.9420faf5-3e37-4758-8c52-354bedac7414.siteSettings.6fe7500a-704e-4c0f-94ef-a868e4251578.uriFormat','\"blog/{slug}\"'),('sections.9420faf5-3e37-4758-8c52-354bedac7414.type','\"channel\"'),('sections.9ef9856c-d50d-49d9-bd1e-e029956e2342.defaultPlacement','\"end\"'),('sections.9ef9856c-d50d-49d9-bd1e-e029956e2342.enableVersioning','true'),('sections.9ef9856c-d50d-49d9-bd1e-e029956e2342.handle','\"about\"'),('sections.9ef9856c-d50d-49d9-bd1e-e029956e2342.name','\"About\"'),('sections.9ef9856c-d50d-49d9-bd1e-e029956e2342.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.9ef9856c-d50d-49d9-bd1e-e029956e2342.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.9ef9856c-d50d-49d9-bd1e-e029956e2342.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.9ef9856c-d50d-49d9-bd1e-e029956e2342.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.9ef9856c-d50d-49d9-bd1e-e029956e2342.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.9ef9856c-d50d-49d9-bd1e-e029956e2342.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.9ef9856c-d50d-49d9-bd1e-e029956e2342.propagationMethod','\"all\"'),('sections.9ef9856c-d50d-49d9-bd1e-e029956e2342.siteSettings.6fe7500a-704e-4c0f-94ef-a868e4251578.enabledByDefault','true'),('sections.9ef9856c-d50d-49d9-bd1e-e029956e2342.siteSettings.6fe7500a-704e-4c0f-94ef-a868e4251578.hasUrls','true'),('sections.9ef9856c-d50d-49d9-bd1e-e029956e2342.siteSettings.6fe7500a-704e-4c0f-94ef-a868e4251578.template','\"_singles/about\"'),('sections.9ef9856c-d50d-49d9-bd1e-e029956e2342.siteSettings.6fe7500a-704e-4c0f-94ef-a868e4251578.uriFormat','\"about\"'),('sections.9ef9856c-d50d-49d9-bd1e-e029956e2342.type','\"single\"'),('siteGroups.f702ad74-9616-44d5-a062-62d8e7ef2b2d.name','\"Tutorial\"'),('sites.6fe7500a-704e-4c0f-94ef-a868e4251578.baseUrl','\"@web\"'),('sites.6fe7500a-704e-4c0f-94ef-a868e4251578.enabled','true'),('sites.6fe7500a-704e-4c0f-94ef-a868e4251578.handle','\"default\"'),('sites.6fe7500a-704e-4c0f-94ef-a868e4251578.hasUrls','true'),('sites.6fe7500a-704e-4c0f-94ef-a868e4251578.language','\"en-US\"'),('sites.6fe7500a-704e-4c0f-94ef-a868e4251578.name','\"Tutorial\"'),('sites.6fe7500a-704e-4c0f-94ef-a868e4251578.primary','true'),('sites.6fe7500a-704e-4c0f-94ef-a868e4251578.siteGroup','\"f702ad74-9616-44d5-a062-62d8e7ef2b2d\"'),('sites.6fe7500a-704e-4c0f-94ef-a868e4251578.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Tutorial\"'),('system.schemaVersion','\"4.5.3.0\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elementCondition','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.0.autocapitalize','true'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.0.autocomplete','false'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.0.autocorrect','true'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.0.class','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.0.disabled','false'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.0.elementCondition','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.0.id','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.0.instructions','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.0.label','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.0.max','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.0.min','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.0.name','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.0.orientation','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.0.placeholder','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.0.readonly','false'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.0.requirable','false'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.0.size','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.0.step','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.0.tip','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.0.title','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.0.uid','\"4f0f398d-5460-4c95-adc2-4bc8ec6a9588\"'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.0.userCondition','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.0.warning','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.0.width','100'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.1.attribute','\"alt\"'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.1.class','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.1.cols','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.1.disabled','false'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.1.elementCondition','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.1.id','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.1.instructions','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.1.label','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.1.name','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.1.orientation','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.1.placeholder','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.1.readonly','false'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.1.requirable','true'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.1.required','false'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.1.rows','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.1.tip','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.1.title','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AltField\"'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.1.uid','\"6ca79624-0b37-49a6-8b84-a53162135fd2\"'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.1.userCondition','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.1.warning','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.elements.1.width','100'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.name','\"Content\"'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.uid','\"07f0e1f1-164b-4631-bb26-47a22deb0628\"'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fieldLayouts.6da532a1-b67d-49ad-81fa-ae7397933c9b.tabs.0.userCondition','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.fs','\"hardDisk\"'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.handle','\"images\"'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.name','\"Images\"'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.sortOrder','1'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.titleTranslationKeyFormat','null'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.titleTranslationMethod','\"site\"'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.transformFs','\"\"'),('volumes.ec1487e2-3e09-4e17-85de-151fb21bf341.transformSubpath','\"\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `relations` VALUES (2,6,10,NULL,8,1,'2023-02-25 04:14:42','2023-02-25 04:14:42','51a553a2-c5aa-43d7-819a-cebf5cda7607'),(3,3,2,NULL,11,1,'2023-02-25 04:15:10','2023-02-25 04:15:10','318e12b3-cae0-4a07-b0ed-a94599dda187'),(14,2,20,NULL,3,1,'2023-02-25 04:23:33','2023-02-25 04:23:33','e644a318-b9bd-4c34-b580-d42af28d3498'),(15,6,27,NULL,8,1,'2023-02-25 04:23:49','2023-02-25 04:23:49','f7a523c2-ccc3-487d-931e-c97f457b9352'),(16,3,20,NULL,11,1,'2023-02-25 04:23:53','2023-02-25 04:23:53','e4dbf00e-e427-450f-bd4e-b6c6f0b0d682'),(40,10,46,NULL,50,1,'2023-05-23 19:08:16','2023-05-23 19:08:16','876add01-ad71-4bb6-962e-7a559d7710ba'),(52,2,2,NULL,8,1,'2023-05-24 17:21:42','2023-05-24 17:21:42','844f05c2-d8f8-433b-b5a0-51ce022b7051');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' hello craftcms com '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'slug',0,1,' over the mountain '),(2,'title',0,1,' over the mountain '),(3,'alt',0,1,' winter scene south of warm springs on or26 '),(3,'extension',0,1,' jpg '),(3,'filename',0,1,' highway 26 jpg '),(3,'kind',0,1,' image '),(3,'slug',0,1,''),(3,'title',0,1,' highway 26 '),(8,'alt',0,1,' looking south at a plateau across or26 '),(8,'extension',0,1,' jpg '),(8,'filename',0,1,' warm springs jpg '),(8,'kind',0,1,' image '),(8,'slug',0,1,''),(8,'title',0,1,' warm springs '),(9,'slug',0,1,''),(10,'slug',0,1,''),(11,'slug',0,1,' road trips '),(11,'title',0,1,' road trips '),(20,'slug',0,1,' my trip to bend '),(20,'title',0,1,' my trip to bend '),(26,'slug',0,1,''),(27,'slug',0,1,''),(28,'slug',0,1,''),(39,'slug',0,1,' temp tgqlcgmjdqtdolujgrfgkiyplvaqiptxkqbi '),(39,'title',0,1,''),(40,'slug',0,1,' hikes '),(40,'title',0,1,' hikes '),(46,'slug',0,1,' about '),(46,'title',0,1,' about '),(50,'alt',0,1,' hiker looking out over lake billy chinook from trail on canyon wall '),(50,'extension',0,1,' jpeg '),(50,'filename',0,1,' lake billy chinook jpeg '),(50,'kind',0,1,' image '),(50,'slug',0,1,''),(50,'title',0,1,' lake billy chinook '),(64,'slug',0,1,''),(88,'slug',0,1,''),(101,'slug',0,1,'');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (2,NULL,'Blog','blog','channel',1,'all','end',NULL,'2023-02-23 01:51:37','2023-02-23 01:51:37',NULL,'9420faf5-3e37-4758-8c52-354bedac7414'),(3,NULL,'About','about','single',1,'all','end','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2023-05-23 17:15:24','2023-05-23 17:15:24',NULL,'9ef9856c-d50d-49d9-bd1e-e029956e2342');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (2,2,1,1,'blog/{slug}','blog/_entry',1,'2023-02-23 01:51:37','2023-02-23 01:51:37','2715d693-db4b-4460-8c04-005bc2862230'),(3,3,1,1,'about','_singles/about',1,'2023-05-23 17:15:24','2023-05-23 17:15:24','54d3cf9c-7061-479b-9983-58d0b8b8eb2d');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'Tutorial','2023-02-21 22:21:32','2023-02-21 22:21:32',NULL,'f702ad74-9616-44d5-a062-62d8e7ef2b2d');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'1','Tutorial','default','en-US',1,'@web',1,'2023-02-21 22:21:32','2023-05-22 20:02:27',NULL,'6fe7500a-704e-4c0f-94ef-a868e4251578');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structureelements` VALUES (1,1,NULL,1,1,8,0,'2023-02-25 04:15:03','2023-05-22 21:41:46','176d1b29-6246-4ad4-9806-4565277e87c7'),(2,1,11,1,2,3,1,'2023-02-25 04:15:03','2023-02-25 04:15:03','686ecc96-ce22-457a-b061-e3294caa866c'),(3,1,39,1,4,5,1,'2023-05-19 16:30:29','2023-05-19 16:30:29','718bff42-eca9-4ef9-bfae-d9389d12e64f'),(4,1,40,1,6,7,1,'2023-05-22 21:41:46','2023-05-22 21:41:46','e1f9bb30-6341-4f17-bea0-6dd890f8c258');
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structures` VALUES (1,1,'2023-02-23 21:50:05','2023-02-23 21:50:05',NULL,'7219e5f2-ab7a-4fa6-b30b-efb984970862');
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `tokens` VALUES (2,'TDPXAMEx0ZiDsFRVW_p5LCStDkSHnxpH','[\"preview\\/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"canonicalId\":20,\"siteId\":1,\"draftId\":null,\"revisionId\":null,\"userId\":1}]',NULL,NULL,'2023-05-25 19:55:44','2023-05-24 19:55:44','2023-05-24 19:55:44','99dac5ba-808a-4464-83a0-6918a9617123');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'hello@craftcms.com','$2y$13$GrmBArH7eYNwpdDwtKcHvuHzDGHZU0efye31agyJCI4UjempmEyRK','2023-05-25 16:16:01',NULL,NULL,NULL,'2023-05-17 20:02:48',NULL,1,NULL,NULL,NULL,0,'2023-02-21 23:51:58','2023-02-21 22:21:32','2023-05-25 16:16:01');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Images',NULL,'2023-02-23 21:39:38','2023-03-16 19:48:35','c0bb1159-1bad-456d-bc8c-d3142028c436'),(2,NULL,NULL,'Temporary filesystem',NULL,'2023-02-24 22:05:46','2023-02-24 22:05:46','8cabf1dd-8adc-4b39-8e1d-1e7d4bcd5313'),(6,2,NULL,'user_1','user_1/','2023-05-25 16:19:52','2023-05-25 16:19:52','17035421-48bd-4672-86eb-abdb1d78a865');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES (1,3,'Images','images','hardDisk','','','site',NULL,1,'2023-02-23 21:39:38','2023-02-23 21:39:38',NULL,'ec1487e2-3e09-4e17-85de-151fb21bf341');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2023-02-21 22:21:44','2023-02-21 22:21:44','6dd75d48-8800-46db-bd6e-a0fead75c558'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2023-02-21 22:21:44','2023-02-21 22:21:44','f1c79c8e-389b-4be9-9c50-74cd06b2cfe2'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2023-02-21 22:21:44','2023-02-21 22:21:44','896f6cac-56a1-48ce-92eb-cedd2a60ceb0'),(5,1,'craft\\widgets\\CraftSupport',5,NULL,'[]',1,'2023-02-21 23:56:05','2023-02-21 23:56:05','61d0b746-4443-4428-8316-3e35e3fab6ee');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-14 21:16:54
