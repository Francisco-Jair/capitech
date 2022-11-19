-- --------------------------------------------------------
-- Servidor:                     10.0.0.1
-- Versão do servidor:           5.5.49-0+deb7u1 - (Debian)
-- OS do Servidor:               debian-linux-gnu
-- HeidiSQL Versão:              9.3.0.5104
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para capacitacoes
CREATE DATABASE IF NOT EXISTS `capacitacoes` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `capacitacoes`;

-- Copiando estrutura para tabela capacitacoes.mdl_assign
CREATE TABLE IF NOT EXISTS `mdl_assign` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alwaysshowdescription` tinyint(2) NOT NULL DEFAULT '0',
  `nosubmissions` tinyint(2) NOT NULL DEFAULT '0',
  `submissiondrafts` tinyint(2) NOT NULL DEFAULT '0',
  `sendnotifications` tinyint(2) NOT NULL DEFAULT '0',
  `sendlatenotifications` tinyint(2) NOT NULL DEFAULT '0',
  `duedate` bigint(10) NOT NULL DEFAULT '0',
  `allowsubmissionsfromdate` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requiresubmissionstatement` tinyint(2) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(2) NOT NULL DEFAULT '0',
  `cutoffdate` bigint(10) NOT NULL DEFAULT '0',
  `teamsubmission` tinyint(2) NOT NULL DEFAULT '0',
  `requireallteammemberssubmit` tinyint(2) NOT NULL DEFAULT '0',
  `teamsubmissiongroupingid` bigint(10) NOT NULL DEFAULT '0',
  `blindmarking` tinyint(2) NOT NULL DEFAULT '0',
  `revealidentities` tinyint(2) NOT NULL DEFAULT '0',
  `attemptreopenmethod` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `maxattempts` mediumint(6) NOT NULL DEFAULT '-1',
  `markingworkflow` tinyint(2) NOT NULL DEFAULT '0',
  `markingallocation` tinyint(2) NOT NULL DEFAULT '0',
  `sendstudentnotifications` tinyint(2) NOT NULL DEFAULT '1',
  `preventsubmissionnotingroup` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou_ix` (`course`),
  KEY `mdl_assi_tea_ix` (`teamsubmissiongroupingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table saves information about an instance of mod_assign';

-- Copiando dados para a tabela capacitacoes.mdl_assign: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_assign` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_assignfeedback_comments
CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `commenttext` longtext COLLATE utf8_unicode_ci,
  `commentformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assicomm_ass_ix` (`assignment`),
  KEY `mdl_assicomm_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Text feedback for submitted assignments';

-- Copiando dados para a tabela capacitacoes.mdl_assignfeedback_comments: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_assignfeedback_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_comments` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_assignfeedback_editpdf_annot
CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_editpdf_annot` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `pageno` bigint(10) NOT NULL DEFAULT '0',
  `x` bigint(10) DEFAULT '0',
  `y` bigint(10) DEFAULT '0',
  `endx` bigint(10) DEFAULT '0',
  `endy` bigint(10) DEFAULT '0',
  `path` longtext COLLATE utf8_unicode_ci,
  `type` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'line',
  `colour` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'black',
  `draft` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditanno_grapag_ix` (`gradeid`,`pageno`),
  KEY `mdl_assieditanno_gra_ix` (`gradeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='stores annotations added to pdfs submitted by students';

-- Copiando dados para a tabela capacitacoes.mdl_assignfeedback_editpdf_annot: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_annot` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_annot` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_assignfeedback_editpdf_cmnt
CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_editpdf_cmnt` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `x` bigint(10) DEFAULT '0',
  `y` bigint(10) DEFAULT '0',
  `width` bigint(10) DEFAULT '120',
  `rawtext` longtext COLLATE utf8_unicode_ci,
  `pageno` bigint(10) NOT NULL DEFAULT '0',
  `colour` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'black',
  `draft` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditcmnt_grapag_ix` (`gradeid`,`pageno`),
  KEY `mdl_assieditcmnt_gra_ix` (`gradeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores comments added to pdfs';

-- Copiando dados para a tabela capacitacoes.mdl_assignfeedback_editpdf_cmnt: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_cmnt` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_cmnt` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_assignfeedback_editpdf_queue
CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_editpdf_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `submissionid` bigint(10) NOT NULL,
  `submissionattempt` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Queue for processing.';

-- Copiando dados para a tabela capacitacoes.mdl_assignfeedback_editpdf_queue: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_queue` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_assignfeedback_editpdf_quick
CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_editpdf_quick` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `rawtext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `width` bigint(10) NOT NULL DEFAULT '120',
  `colour` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'yellow',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditquic_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores teacher specified quicklist comments';

-- Copiando dados para a tabela capacitacoes.mdl_assignfeedback_editpdf_quick: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_quick` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_quick` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_assignfeedback_file
CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_file` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass2_ix` (`assignment`),
  KEY `mdl_assifile_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores info about the number of files submitted by a student';

-- Copiando dados para a tabela capacitacoes.mdl_assignfeedback_file: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_assignfeedback_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_file` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_assignment
CREATE TABLE IF NOT EXISTS `mdl_assignment` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assignmenttype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `preventlate` tinyint(2) NOT NULL DEFAULT '0',
  `emailteachers` tinyint(2) NOT NULL DEFAULT '0',
  `var1` bigint(10) DEFAULT '0',
  `var2` bigint(10) DEFAULT '0',
  `var3` bigint(10) DEFAULT '0',
  `var4` bigint(10) DEFAULT '0',
  `var5` bigint(10) DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `timedue` bigint(10) NOT NULL DEFAULT '0',
  `timeavailable` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou2_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines assignments';

-- Copiando dados para a tabela capacitacoes.mdl_assignment: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignment` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_assignment_submissions
CREATE TABLE IF NOT EXISTS `mdl_assignment_submissions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  `data1` longtext COLLATE utf8_unicode_ci,
  `data2` longtext COLLATE utf8_unicode_ci,
  `grade` bigint(11) NOT NULL DEFAULT '0',
  `submissioncomment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `teacher` bigint(10) NOT NULL DEFAULT '0',
  `timemarked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assisubm_use2_ix` (`userid`),
  KEY `mdl_assisubm_mai_ix` (`mailed`),
  KEY `mdl_assisubm_tim_ix` (`timemarked`),
  KEY `mdl_assisubm_ass2_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about submitted assignments';

-- Copiando dados para a tabela capacitacoes.mdl_assignment_submissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_assignment_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignment_submissions` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_assignment_upgrade
CREATE TABLE IF NOT EXISTS `mdl_assignment_upgrade` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `oldcmid` bigint(10) NOT NULL DEFAULT '0',
  `oldinstance` bigint(10) NOT NULL DEFAULT '0',
  `newcmid` bigint(10) NOT NULL DEFAULT '0',
  `newinstance` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiupgr_old_ix` (`oldcmid`),
  KEY `mdl_assiupgr_old2_ix` (`oldinstance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about upgraded assignments';

-- Copiando dados para a tabela capacitacoes.mdl_assignment_upgrade: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_assignment_upgrade` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignment_upgrade` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_assignsubmission_file
CREATE TABLE IF NOT EXISTS `mdl_assignsubmission_file` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass_ix` (`assignment`),
  KEY `mdl_assifile_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about file submissions for assignments';

-- Copiando dados para a tabela capacitacoes.mdl_assignsubmission_file: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_assignsubmission_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignsubmission_file` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_assignsubmission_onlinetext
CREATE TABLE IF NOT EXISTS `mdl_assignsubmission_onlinetext` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `onlinetext` longtext COLLATE utf8_unicode_ci,
  `onlineformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assionli_ass_ix` (`assignment`),
  KEY `mdl_assionli_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about onlinetext submission';

-- Copiando dados para a tabela capacitacoes.mdl_assignsubmission_onlinetext: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_assignsubmission_onlinetext` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignsubmission_onlinetext` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_assign_grades
CREATE TABLE IF NOT EXISTS `mdl_assign_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `grader` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '0.00000',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_assigrad_assuseatt_uix` (`assignment`,`userid`,`attemptnumber`),
  KEY `mdl_assigrad_use_ix` (`userid`),
  KEY `mdl_assigrad_att_ix` (`attemptnumber`),
  KEY `mdl_assigrad_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Grading information about a single assignment submission.';

-- Copiando dados para a tabela capacitacoes.mdl_assign_grades: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_assign_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_grades` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_assign_plugin_config
CREATE TABLE IF NOT EXISTS `mdl_assign_plugin_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `plugin` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subtype` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_assiplugconf_plu_ix` (`plugin`),
  KEY `mdl_assiplugconf_sub_ix` (`subtype`),
  KEY `mdl_assiplugconf_nam_ix` (`name`),
  KEY `mdl_assiplugconf_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Config data for an instance of a plugin in an assignment.';

-- Copiando dados para a tabela capacitacoes.mdl_assign_plugin_config: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_assign_plugin_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_plugin_config` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_assign_submission
CREATE TABLE IF NOT EXISTS `mdl_assign_submission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0',
  `latest` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_assisubm_assusegroatt_uix` (`assignment`,`userid`,`groupid`,`attemptnumber`),
  KEY `mdl_assisubm_use_ix` (`userid`),
  KEY `mdl_assisubm_att_ix` (`attemptnumber`),
  KEY `mdl_assisubm_assusegrolat_ix` (`assignment`,`userid`,`groupid`,`latest`),
  KEY `mdl_assisubm_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about student interactions with';

-- Copiando dados para a tabela capacitacoes.mdl_assign_submission: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_assign_submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_submission` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_assign_user_flags
CREATE TABLE IF NOT EXISTS `mdl_assign_user_flags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` smallint(4) NOT NULL DEFAULT '0',
  `extensionduedate` bigint(10) NOT NULL DEFAULT '0',
  `workflowstate` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `allocatedmarker` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiuserflag_mai_ix` (`mailed`),
  KEY `mdl_assiuserflag_use_ix` (`userid`),
  KEY `mdl_assiuserflag_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of flags that can be set for a single user in a single ';

-- Copiando dados para a tabela capacitacoes.mdl_assign_user_flags: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_assign_user_flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_user_flags` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_assign_user_mapping
CREATE TABLE IF NOT EXISTS `mdl_assign_user_mapping` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiusermapp_ass_ix` (`assignment`),
  KEY `mdl_assiusermapp_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Map an assignment specific id number to a user';

-- Copiando dados para a tabela capacitacoes.mdl_assign_user_mapping: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_assign_user_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_user_mapping` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_backup_controllers
CREATE TABLE IF NOT EXISTS `mdl_backup_controllers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `operation` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'backup',
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `format` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `interactive` smallint(4) NOT NULL,
  `purpose` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `status` smallint(4) NOT NULL,
  `execution` smallint(4) NOT NULL,
  `executiontime` bigint(10) NOT NULL,
  `checksum` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `controller` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcont_bac_uix` (`backupid`),
  KEY `mdl_backcont_typite_ix` (`type`,`itemid`),
  KEY `mdl_backcont_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store the backup_controllers as they are used';

-- Copiando dados para a tabela capacitacoes.mdl_backup_controllers: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_backup_controllers` DISABLE KEYS */;
INSERT INTO `mdl_backup_controllers` (`id`, `backupid`, `operation`, `type`, `itemid`, `format`, `interactive`, `purpose`, `userid`, `status`, `execution`, `executiontime`, `checksum`, `timecreated`, `timemodified`, `controller`) VALUES
	(1, 'd171f3a422d6cf5584e64218864eed8b', 'backup', 'activity', 1, 'moodle2', 0, 10, 2, 1000, 1, 0, 'dbe6ea628e6121db600c9a4f42cc31ac', 1475527700, 1475527701, '');
/*!40000 ALTER TABLE `mdl_backup_controllers` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_backup_courses
CREATE TABLE IF NOT EXISTS `mdl_backup_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `laststarttime` bigint(10) NOT NULL DEFAULT '0',
  `lastendtime` bigint(10) NOT NULL DEFAULT '0',
  `laststatus` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '5',
  `nextstarttime` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcour_cou_uix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store every course backup status';

-- Copiando dados para a tabela capacitacoes.mdl_backup_courses: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_backup_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_backup_courses` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_backup_logs
CREATE TABLE IF NOT EXISTS `mdl_backup_logs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `loglevel` smallint(4) NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backlogs_bacid_uix` (`backupid`,`id`),
  KEY `mdl_backlogs_bac_ix` (`backupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store all the logs from backup and restore operations (by';

-- Copiando dados para a tabela capacitacoes.mdl_backup_logs: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_backup_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_backup_logs` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_badge
CREATE TABLE IF NOT EXISTS `mdl_badge` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usercreated` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `issuername` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `issuerurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `issuercontact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiredate` bigint(10) DEFAULT NULL,
  `expireperiod` bigint(10) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `courseid` bigint(10) DEFAULT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `messagesubject` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attachment` tinyint(1) NOT NULL DEFAULT '1',
  `notification` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `nextcron` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badg_typ_ix` (`type`),
  KEY `mdl_badg_cou_ix` (`courseid`),
  KEY `mdl_badg_use_ix` (`usermodified`),
  KEY `mdl_badg_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines badge';

-- Copiando dados para a tabela capacitacoes.mdl_badge: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_badge` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_badge_backpack
CREATE TABLE IF NOT EXISTS `mdl_badge_backpack` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backpackurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backpackuid` bigint(10) NOT NULL,
  `autosync` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgback_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines settings for connecting external backpack';

-- Copiando dados para a tabela capacitacoes.mdl_badge_backpack: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_badge_backpack` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_backpack` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_badge_criteria
CREATE TABLE IF NOT EXISTS `mdl_badge_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '1',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgcrit_badcri_uix` (`badgeid`,`criteriatype`),
  KEY `mdl_badgcrit_cri_ix` (`criteriatype`),
  KEY `mdl_badgcrit_bad_ix` (`badgeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines criteria for issuing badges';

-- Copiando dados para a tabela capacitacoes.mdl_badge_criteria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_badge_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_criteria` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_badge_criteria_met
CREATE TABLE IF NOT EXISTS `mdl_badge_criteria_met` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `issuedid` bigint(10) DEFAULT NULL,
  `critid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgcritmet_cri_ix` (`critid`),
  KEY `mdl_badgcritmet_use_ix` (`userid`),
  KEY `mdl_badgcritmet_iss_ix` (`issuedid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines criteria that were met for an issued badge';

-- Copiando dados para a tabela capacitacoes.mdl_badge_criteria_met: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_badge_criteria_met` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_criteria_met` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_badge_criteria_param
CREATE TABLE IF NOT EXISTS `mdl_badge_criteria_param` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `critid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgcritpara_cri_ix` (`critid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines parameters for badges criteria';

-- Copiando dados para a tabela capacitacoes.mdl_badge_criteria_param: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_badge_criteria_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_criteria_param` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_badge_external
CREATE TABLE IF NOT EXISTS `mdl_badge_external` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backpackid` bigint(10) NOT NULL,
  `collectionid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgexte_bac_ix` (`backpackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Setting for external badges display';

-- Copiando dados para a tabela capacitacoes.mdl_badge_external: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_badge_external` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_external` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_badge_issued
CREATE TABLE IF NOT EXISTS `mdl_badge_issued` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `uniquehash` longtext COLLATE utf8_unicode_ci NOT NULL,
  `dateissued` bigint(10) NOT NULL DEFAULT '0',
  `dateexpire` bigint(10) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `issuernotified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgissu_baduse_uix` (`badgeid`,`userid`),
  KEY `mdl_badgissu_bad_ix` (`badgeid`),
  KEY `mdl_badgissu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines issued badges';

-- Copiando dados para a tabela capacitacoes.mdl_badge_issued: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_badge_issued` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_issued` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_badge_manual_award
CREATE TABLE IF NOT EXISTS `mdl_badge_manual_award` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL,
  `recipientid` bigint(10) NOT NULL,
  `issuerid` bigint(10) NOT NULL,
  `issuerrole` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgmanuawar_bad_ix` (`badgeid`),
  KEY `mdl_badgmanuawar_rec_ix` (`recipientid`),
  KEY `mdl_badgmanuawar_iss_ix` (`issuerid`),
  KEY `mdl_badgmanuawar_iss2_ix` (`issuerrole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Track manual award criteria for badges';

-- Copiando dados para a tabela capacitacoes.mdl_badge_manual_award: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_badge_manual_award` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_manual_award` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_block
CREATE TABLE IF NOT EXISTS `mdl_block` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_bloc_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='contains all installed blocks';

-- Copiando dados para a tabela capacitacoes.mdl_block: ~42 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_block` DISABLE KEYS */;
INSERT INTO `mdl_block` (`id`, `name`, `cron`, `lastcron`, `visible`) VALUES
	(1, 'activity_modules', 0, 0, 1),
	(2, 'activity_results', 0, 0, 1),
	(3, 'admin_bookmarks', 0, 0, 1),
	(4, 'badges', 0, 0, 1),
	(5, 'blog_menu', 0, 0, 1),
	(6, 'blog_recent', 0, 0, 1),
	(7, 'blog_tags', 0, 0, 1),
	(8, 'calendar_month', 0, 0, 1),
	(9, 'calendar_upcoming', 0, 0, 1),
	(10, 'comments', 0, 0, 1),
	(11, 'community', 0, 0, 1),
	(12, 'completionstatus', 0, 0, 1),
	(13, 'course_list', 0, 0, 1),
	(14, 'course_overview', 0, 0, 1),
	(15, 'course_summary', 0, 0, 1),
	(16, 'feedback', 0, 0, 1),
	(17, 'globalsearch', 0, 0, 1),
	(18, 'glossary_random', 0, 0, 1),
	(19, 'html', 0, 0, 1),
	(20, 'login', 0, 0, 1),
	(21, 'lp', 0, 0, 1),
	(22, 'mentees', 0, 0, 1),
	(23, 'messages', 0, 0, 1),
	(24, 'mnet_hosts', 0, 0, 1),
	(25, 'myprofile', 0, 0, 1),
	(26, 'navigation', 0, 0, 1),
	(27, 'news_items', 0, 0, 1),
	(28, 'online_users', 0, 0, 1),
	(29, 'participants', 0, 0, 1),
	(30, 'private_files', 0, 0, 1),
	(31, 'quiz_results', 0, 0, 0),
	(32, 'recent_activity', 86400, 0, 1),
	(33, 'rss_client', 300, 0, 1),
	(34, 'search_forums', 0, 0, 1),
	(35, 'section_links', 0, 0, 1),
	(36, 'selfcompletion', 0, 0, 1),
	(37, 'settings', 0, 0, 1),
	(38, 'site_main_menu', 0, 0, 1),
	(39, 'social_activities', 0, 0, 1),
	(40, 'tag_flickr', 0, 0, 1),
	(41, 'tag_youtube', 0, 0, 0),
	(42, 'tags', 0, 0, 1);
/*!40000 ALTER TABLE `mdl_block` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_block_community
CREATE TABLE IF NOT EXISTS `mdl_block_community` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `coursename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `coursedescription` longtext COLLATE utf8_unicode_ci,
  `courseurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `imageurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Community block';

-- Copiando dados para a tabela capacitacoes.mdl_block_community: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_block_community` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_community` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_block_instances
CREATE TABLE IF NOT EXISTS `mdl_block_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `blockname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parentcontextid` bigint(10) NOT NULL,
  `showinsubcontexts` smallint(4) NOT NULL,
  `pagetypepattern` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subpagepattern` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `defaultregion` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `defaultweight` bigint(10) NOT NULL,
  `configdata` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_blocinst_parshopagsub_ix` (`parentcontextid`,`showinsubcontexts`,`pagetypepattern`,`subpagepattern`),
  KEY `mdl_blocinst_par_ix` (`parentcontextid`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores block instances. The type of block this is';

-- Copiando dados para a tabela capacitacoes.mdl_block_instances: ~30 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_block_instances` DISABLE KEYS */;
INSERT INTO `mdl_block_instances` (`id`, `blockname`, `parentcontextid`, `showinsubcontexts`, `pagetypepattern`, `subpagepattern`, `defaultregion`, `defaultweight`, `configdata`) VALUES
	(1, 'site_main_menu', 3, 0, 'site-index', NULL, 'side-pre', 0, ''),
	(2, 'course_summary', 3, 0, 'site-index', NULL, 'side-post', 0, ''),
	(3, 'calendar_month', 3, 0, 'site-index', NULL, 'side-post', 1, ''),
	(4, 'navigation', 2, 1, '*', NULL, 'side-pre', 0, ''),
	(5, 'settings', 2, 1, '*', NULL, 'side-pre', 1, ''),
	(6, 'admin_bookmarks', 2, 0, 'admin-*', NULL, 'side-pre', 2, ''),
	(7, 'private_files', 2, 0, 'my-index', '2', 'side-post', 0, ''),
	(8, 'online_users', 2, 0, 'my-index', '2', 'side-post', 1, ''),
	(9, 'badges', 2, 0, 'my-index', '2', 'side-post', 2, ''),
	(10, 'calendar_month', 2, 0, 'my-index', '2', 'side-post', 3, ''),
	(11, 'calendar_upcoming', 2, 0, 'my-index', '2', 'side-post', 4, ''),
	(12, 'lp', 2, 0, 'my-index', '2', 'content', 0, ''),
	(13, 'course_overview', 2, 0, 'my-index', '2', 'content', 1, ''),
	(21, 'messages', 2, 0, 'my-index', '2', 'content', 2, ''),
	(22, 'search_forums', 31, 0, 'course-view-*', NULL, 'side-post', 0, ''),
	(23, 'news_items', 31, 0, 'course-view-*', NULL, 'side-post', 1, ''),
	(24, 'calendar_upcoming', 31, 0, 'course-view-*', NULL, 'side-post', 2, ''),
	(25, 'recent_activity', 31, 0, 'course-view-*', NULL, 'side-post', 3, ''),
	(26, 'search_forums', 36, 0, 'course-view-*', NULL, 'side-post', 0, ''),
	(27, 'news_items', 36, 0, 'course-view-*', NULL, 'side-post', 1, ''),
	(28, 'calendar_upcoming', 36, 0, 'course-view-*', NULL, 'side-post', 2, ''),
	(29, 'recent_activity', 36, 0, 'course-view-*', NULL, 'side-post', 3, ''),
	(30, 'search_forums', 41, 0, 'course-view-*', NULL, 'side-post', 0, ''),
	(31, 'news_items', 41, 0, 'course-view-*', NULL, 'side-post', 1, ''),
	(32, 'calendar_upcoming', 41, 0, 'course-view-*', NULL, 'side-post', 2, ''),
	(33, 'recent_activity', 41, 0, 'course-view-*', NULL, 'side-post', 3, ''),
	(34, 'search_forums', 46, 0, 'course-view-*', NULL, 'side-post', 0, ''),
	(35, 'news_items', 46, 0, 'course-view-*', NULL, 'side-post', 1, ''),
	(36, 'calendar_upcoming', 46, 0, 'course-view-*', NULL, 'side-post', 2, ''),
	(37, 'recent_activity', 46, 0, 'course-view-*', NULL, 'side-post', 3, '');
/*!40000 ALTER TABLE `mdl_block_instances` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_block_positions
CREATE TABLE IF NOT EXISTS `mdl_block_positions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `blockinstanceid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `pagetype` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subpage` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` smallint(4) NOT NULL,
  `region` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `weight` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_blocposi_bloconpagsub_uix` (`blockinstanceid`,`contextid`,`pagetype`,`subpage`),
  KEY `mdl_blocposi_blo_ix` (`blockinstanceid`),
  KEY `mdl_blocposi_con_ix` (`contextid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the position of a sticky block_instance on a another ';

-- Copiando dados para a tabela capacitacoes.mdl_block_positions: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_block_positions` DISABLE KEYS */;
INSERT INTO `mdl_block_positions` (`id`, `blockinstanceid`, `contextid`, `pagetype`, `subpage`, `visible`, `region`, `weight`) VALUES
	(1, 13, 2, 'my-index', '2', 0, 'content', 1),
	(2, 12, 2, 'my-index', '2', 0, 'content', 0);
/*!40000 ALTER TABLE `mdl_block_positions` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_block_recent_activity
CREATE TABLE IF NOT EXISTS `mdl_block_recent_activity` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `cmid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `action` tinyint(1) NOT NULL,
  `modname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blocreceacti_coutim_ix` (`courseid`,`timecreated`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Recent activity block';

-- Copiando dados para a tabela capacitacoes.mdl_block_recent_activity: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_block_recent_activity` DISABLE KEYS */;
INSERT INTO `mdl_block_recent_activity` (`id`, `courseid`, `cmid`, `timecreated`, `userid`, `action`, `modname`) VALUES
	(1, 3, 4, 1475527533, 2, 0, NULL),
	(2, 3, 5, 1475527593, 2, 0, NULL),
	(3, 3, 6, 1475527634, 2, 0, NULL),
	(4, 3, 7, 1475527655, 2, 0, NULL),
	(5, 3, 8, 1475527682, 2, 0, NULL),
	(6, 3, 1, 1475527701, 2, 2, 'forum');
/*!40000 ALTER TABLE `mdl_block_recent_activity` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_block_rss_client
CREATE TABLE IF NOT EXISTS `mdl_block_rss_client` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `preferredtitle` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `shared` tinyint(2) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `skiptime` bigint(10) NOT NULL DEFAULT '0',
  `skipuntil` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Remote news feed information. Contains the news feed id, the';

-- Copiando dados para a tabela capacitacoes.mdl_block_rss_client: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_block_rss_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_rss_client` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_blog_association
CREATE TABLE IF NOT EXISTS `mdl_blog_association` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `blogid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blogasso_con_ix` (`contextid`),
  KEY `mdl_blogasso_blo_ix` (`blogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Associations of blog entries with courses and module instanc';

-- Copiando dados para a tabela capacitacoes.mdl_blog_association: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_blog_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_blog_association` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_blog_external
CREATE TABLE IF NOT EXISTS `mdl_blog_external` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `url` longtext COLLATE utf8_unicode_ci NOT NULL,
  `filtertags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `failedlastsync` tinyint(1) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  `timefetched` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_blogexte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='External blog links used for RSS copying of blog entries to ';

-- Copiando dados para a tabela capacitacoes.mdl_blog_external: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_blog_external` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_blog_external` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_book
CREATE TABLE IF NOT EXISTS `mdl_book` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `numbering` smallint(4) NOT NULL DEFAULT '0',
  `navstyle` smallint(4) NOT NULL DEFAULT '1',
  `customtitles` tinyint(2) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines book';

-- Copiando dados para a tabela capacitacoes.mdl_book: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_book` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_book_chapters
CREATE TABLE IF NOT EXISTS `mdl_book_chapters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `bookid` bigint(10) NOT NULL DEFAULT '0',
  `pagenum` bigint(10) NOT NULL DEFAULT '0',
  `subchapter` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `hidden` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `importsrc` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines book_chapters';

-- Copiando dados para a tabela capacitacoes.mdl_book_chapters: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_book_chapters` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_book_chapters` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_cache_filters
CREATE TABLE IF NOT EXISTS `mdl_cache_filters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `md5key` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rawtext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cachfilt_filmd5_ix` (`filter`,`md5key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For keeping information about cached data';

-- Copiando dados para a tabela capacitacoes.mdl_cache_filters: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_cache_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_cache_filters` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_cache_flags
CREATE TABLE IF NOT EXISTS `mdl_cache_flags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `flagtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expiry` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_cachflag_fla_ix` (`flagtype`),
  KEY `mdl_cachflag_nam_ix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Cache of time-sensitive flags';

-- Copiando dados para a tabela capacitacoes.mdl_cache_flags: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_cache_flags` DISABLE KEYS */;
INSERT INTO `mdl_cache_flags` (`id`, `flagtype`, `name`, `timemodified`, `value`, `expiry`) VALUES
	(1, 'userpreferenceschanged', '2', 1475527786, '1', 1475534986),
	(2, 'userpreferenceschanged', '3', 1475527269, '1', 1475534469),
	(3, 'userpreferenceschanged', '4', 1475526763, '1', 1475533963),
	(4, 'accesslib/dirtycontexts', '/2/6/20', 1475526986, '1', 1475534186),
	(5, 'accesslib/dirtycontexts', '/2/6/21', 1475526986, '1', 1475534186),
	(6, 'accesslib/dirtycontexts', '/2/6/22', 1475526986, '1', 1475534186),
	(7, 'accesslib/dirtycontexts', '/2/6/23', 1475526986, '1', 1475534186),
	(8, 'accesslib/dirtycontexts', '/2/6/24', 1475526986, '1', 1475534186),
	(9, 'accesslib/dirtycontexts', '/2/6/25', 1475526986, '1', 1475534186),
	(10, 'accesslib/dirtycontexts', '/2/6/26', 1475526986, '1', 1475534186),
	(11, 'accesslib/dirtycontexts', '/2/30', 1475527087, '1', 1475534287),
	(12, 'accesslib/dirtycontexts', '/2/4/31', 1475527315, '1', 1475534515),
	(13, 'accesslib/dirtycontexts', '/2/30/36', 1475527352, '1', 1475534552),
	(14, 'accesslib/dirtycontexts', '/2/30/41', 1475527372, '1', 1475534572),
	(15, 'accesslib/dirtycontexts', '/2/30/46', 1475527251, '1', 1475534451),
	(16, 'accesslib/dirtycontexts', '/2/30/36/51', 1475527701, '1', 1475534901);
/*!40000 ALTER TABLE `mdl_cache_flags` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_capabilities
CREATE TABLE IF NOT EXISTS `mdl_capabilities` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `captype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `riskbitmask` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_capa_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=573 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines all capabilities';

-- Copiando dados para a tabela capacitacoes.mdl_capabilities: ~510 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_capabilities` DISABLE KEYS */;
INSERT INTO `mdl_capabilities` (`id`, `name`, `captype`, `contextlevel`, `component`, `riskbitmask`) VALUES
	(1, 'moodle/site:config', 'write', 10, 'moodle', 62),
	(2, 'moodle/site:readallmessages', 'read', 10, 'moodle', 8),
	(3, 'moodle/site:deleteanymessage', 'write', 10, 'moodle', 32),
	(4, 'moodle/site:sendmessage', 'write', 10, 'moodle', 16),
	(5, 'moodle/site:deleteownmessage', 'write', 10, 'moodle', 0),
	(6, 'moodle/site:approvecourse', 'write', 10, 'moodle', 4),
	(7, 'moodle/backup:backupcourse', 'write', 50, 'moodle', 28),
	(8, 'moodle/backup:backupsection', 'write', 50, 'moodle', 28),
	(9, 'moodle/backup:backupactivity', 'write', 70, 'moodle', 28),
	(10, 'moodle/backup:backuptargethub', 'write', 50, 'moodle', 28),
	(11, 'moodle/backup:backuptargetimport', 'write', 50, 'moodle', 28),
	(12, 'moodle/backup:downloadfile', 'write', 50, 'moodle', 28),
	(13, 'moodle/backup:configure', 'write', 50, 'moodle', 28),
	(14, 'moodle/backup:userinfo', 'read', 50, 'moodle', 8),
	(15, 'moodle/backup:anonymise', 'read', 50, 'moodle', 8),
	(16, 'moodle/restore:restorecourse', 'write', 50, 'moodle', 28),
	(17, 'moodle/restore:restoresection', 'write', 50, 'moodle', 28),
	(18, 'moodle/restore:restoreactivity', 'write', 50, 'moodle', 28),
	(19, 'moodle/restore:viewautomatedfilearea', 'write', 50, 'moodle', 28),
	(20, 'moodle/restore:restoretargethub', 'write', 50, 'moodle', 28),
	(21, 'moodle/restore:restoretargetimport', 'write', 50, 'moodle', 28),
	(22, 'moodle/restore:uploadfile', 'write', 50, 'moodle', 28),
	(23, 'moodle/restore:configure', 'write', 50, 'moodle', 28),
	(24, 'moodle/restore:rolldates', 'write', 50, 'moodle', 0),
	(25, 'moodle/restore:userinfo', 'write', 50, 'moodle', 30),
	(26, 'moodle/restore:createuser', 'write', 10, 'moodle', 24),
	(27, 'moodle/site:manageblocks', 'write', 80, 'moodle', 20),
	(28, 'moodle/site:accessallgroups', 'read', 50, 'moodle', 0),
	(29, 'moodle/site:viewfullnames', 'read', 50, 'moodle', 0),
	(30, 'moodle/site:viewuseridentity', 'read', 50, 'moodle', 0),
	(31, 'moodle/site:viewreports', 'read', 50, 'moodle', 8),
	(32, 'moodle/site:trustcontent', 'write', 50, 'moodle', 4),
	(33, 'moodle/site:uploadusers', 'write', 10, 'moodle', 24),
	(34, 'moodle/filter:manage', 'write', 50, 'moodle', 0),
	(35, 'moodle/user:create', 'write', 10, 'moodle', 24),
	(36, 'moodle/user:delete', 'write', 10, 'moodle', 8),
	(37, 'moodle/user:update', 'write', 10, 'moodle', 24),
	(38, 'moodle/user:viewdetails', 'read', 50, 'moodle', 0),
	(39, 'moodle/user:viewalldetails', 'read', 30, 'moodle', 8),
	(40, 'moodle/user:viewlastip', 'read', 30, 'moodle', 8),
	(41, 'moodle/user:viewhiddendetails', 'read', 50, 'moodle', 8),
	(42, 'moodle/user:loginas', 'write', 50, 'moodle', 30),
	(43, 'moodle/user:managesyspages', 'write', 10, 'moodle', 0),
	(44, 'moodle/user:manageblocks', 'write', 30, 'moodle', 0),
	(45, 'moodle/user:manageownblocks', 'write', 10, 'moodle', 0),
	(46, 'moodle/user:manageownfiles', 'write', 10, 'moodle', 0),
	(47, 'moodle/user:ignoreuserquota', 'write', 10, 'moodle', 0),
	(48, 'moodle/my:configsyspages', 'write', 10, 'moodle', 0),
	(49, 'moodle/role:assign', 'write', 50, 'moodle', 28),
	(50, 'moodle/role:review', 'read', 50, 'moodle', 8),
	(51, 'moodle/role:override', 'write', 50, 'moodle', 28),
	(52, 'moodle/role:safeoverride', 'write', 50, 'moodle', 16),
	(53, 'moodle/role:manage', 'write', 10, 'moodle', 28),
	(54, 'moodle/role:switchroles', 'read', 50, 'moodle', 12),
	(55, 'moodle/category:manage', 'write', 40, 'moodle', 4),
	(56, 'moodle/category:viewhiddencategories', 'read', 40, 'moodle', 0),
	(57, 'moodle/cohort:manage', 'write', 40, 'moodle', 0),
	(58, 'moodle/cohort:assign', 'write', 40, 'moodle', 0),
	(59, 'moodle/cohort:view', 'read', 50, 'moodle', 0),
	(60, 'moodle/course:create', 'write', 40, 'moodle', 4),
	(61, 'moodle/course:request', 'write', 10, 'moodle', 0),
	(62, 'moodle/course:delete', 'write', 50, 'moodle', 32),
	(63, 'moodle/course:update', 'write', 50, 'moodle', 4),
	(64, 'moodle/course:view', 'read', 50, 'moodle', 0),
	(65, 'moodle/course:enrolreview', 'read', 50, 'moodle', 8),
	(66, 'moodle/course:enrolconfig', 'write', 50, 'moodle', 8),
	(67, 'moodle/course:reviewotherusers', 'read', 50, 'moodle', 0),
	(68, 'moodle/course:bulkmessaging', 'write', 50, 'moodle', 16),
	(69, 'moodle/course:viewhiddenuserfields', 'read', 50, 'moodle', 8),
	(70, 'moodle/course:viewhiddencourses', 'read', 50, 'moodle', 0),
	(71, 'moodle/course:visibility', 'write', 50, 'moodle', 0),
	(72, 'moodle/course:managefiles', 'write', 50, 'moodle', 4),
	(73, 'moodle/course:ignorefilesizelimits', 'write', 50, 'moodle', 0),
	(74, 'moodle/course:manageactivities', 'write', 70, 'moodle', 4),
	(75, 'moodle/course:activityvisibility', 'write', 70, 'moodle', 0),
	(76, 'moodle/course:viewhiddenactivities', 'write', 70, 'moodle', 0),
	(77, 'moodle/course:viewparticipants', 'read', 50, 'moodle', 0),
	(78, 'moodle/course:changefullname', 'write', 50, 'moodle', 4),
	(79, 'moodle/course:changeshortname', 'write', 50, 'moodle', 4),
	(80, 'moodle/course:renameroles', 'write', 50, 'moodle', 0),
	(81, 'moodle/course:changeidnumber', 'write', 50, 'moodle', 4),
	(82, 'moodle/course:changecategory', 'write', 50, 'moodle', 4),
	(83, 'moodle/course:changesummary', 'write', 50, 'moodle', 4),
	(84, 'moodle/site:viewparticipants', 'read', 10, 'moodle', 0),
	(85, 'moodle/course:isincompletionreports', 'read', 50, 'moodle', 0),
	(86, 'moodle/course:viewscales', 'read', 50, 'moodle', 0),
	(87, 'moodle/course:managescales', 'write', 50, 'moodle', 0),
	(88, 'moodle/course:managegroups', 'write', 50, 'moodle', 0),
	(89, 'moodle/course:reset', 'write', 50, 'moodle', 32),
	(90, 'moodle/course:viewsuspendedusers', 'read', 10, 'moodle', 0),
	(91, 'moodle/course:tag', 'write', 50, 'moodle', 16),
	(92, 'moodle/blog:view', 'read', 10, 'moodle', 0),
	(93, 'moodle/blog:search', 'read', 10, 'moodle', 0),
	(94, 'moodle/blog:viewdrafts', 'read', 10, 'moodle', 8),
	(95, 'moodle/blog:create', 'write', 10, 'moodle', 16),
	(96, 'moodle/blog:manageentries', 'write', 10, 'moodle', 16),
	(97, 'moodle/blog:manageexternal', 'write', 10, 'moodle', 16),
	(98, 'moodle/calendar:manageownentries', 'write', 50, 'moodle', 16),
	(99, 'moodle/calendar:managegroupentries', 'write', 50, 'moodle', 16),
	(100, 'moodle/calendar:manageentries', 'write', 50, 'moodle', 16),
	(101, 'moodle/user:editprofile', 'write', 30, 'moodle', 24),
	(102, 'moodle/user:editownprofile', 'write', 10, 'moodle', 16),
	(103, 'moodle/user:changeownpassword', 'write', 10, 'moodle', 0),
	(104, 'moodle/user:readuserposts', 'read', 30, 'moodle', 0),
	(105, 'moodle/user:readuserblogs', 'read', 30, 'moodle', 0),
	(106, 'moodle/user:viewuseractivitiesreport', 'read', 30, 'moodle', 8),
	(107, 'moodle/user:editmessageprofile', 'write', 30, 'moodle', 16),
	(108, 'moodle/user:editownmessageprofile', 'write', 10, 'moodle', 0),
	(109, 'moodle/question:managecategory', 'write', 50, 'moodle', 20),
	(110, 'moodle/question:add', 'write', 50, 'moodle', 20),
	(111, 'moodle/question:editmine', 'write', 50, 'moodle', 20),
	(112, 'moodle/question:editall', 'write', 50, 'moodle', 20),
	(113, 'moodle/question:viewmine', 'read', 50, 'moodle', 0),
	(114, 'moodle/question:viewall', 'read', 50, 'moodle', 0),
	(115, 'moodle/question:usemine', 'read', 50, 'moodle', 0),
	(116, 'moodle/question:useall', 'read', 50, 'moodle', 0),
	(117, 'moodle/question:movemine', 'write', 50, 'moodle', 0),
	(118, 'moodle/question:moveall', 'write', 50, 'moodle', 0),
	(119, 'moodle/question:config', 'write', 10, 'moodle', 2),
	(120, 'moodle/question:flag', 'write', 50, 'moodle', 0),
	(121, 'moodle/site:doclinks', 'read', 10, 'moodle', 0),
	(122, 'moodle/course:sectionvisibility', 'write', 50, 'moodle', 0),
	(123, 'moodle/course:useremail', 'write', 50, 'moodle', 0),
	(124, 'moodle/course:viewhiddensections', 'write', 50, 'moodle', 0),
	(125, 'moodle/course:setcurrentsection', 'write', 50, 'moodle', 0),
	(126, 'moodle/course:movesections', 'write', 50, 'moodle', 0),
	(127, 'moodle/site:mnetlogintoremote', 'read', 10, 'moodle', 0),
	(128, 'moodle/grade:viewall', 'read', 50, 'moodle', 8),
	(129, 'moodle/grade:view', 'read', 50, 'moodle', 0),
	(130, 'moodle/grade:viewhidden', 'read', 50, 'moodle', 8),
	(131, 'moodle/grade:import', 'write', 50, 'moodle', 12),
	(132, 'moodle/grade:export', 'read', 50, 'moodle', 8),
	(133, 'moodle/grade:manage', 'write', 50, 'moodle', 12),
	(134, 'moodle/grade:edit', 'write', 50, 'moodle', 12),
	(135, 'moodle/grade:managegradingforms', 'write', 50, 'moodle', 12),
	(136, 'moodle/grade:sharegradingforms', 'write', 10, 'moodle', 4),
	(137, 'moodle/grade:managesharedforms', 'write', 10, 'moodle', 4),
	(138, 'moodle/grade:manageoutcomes', 'write', 50, 'moodle', 0),
	(139, 'moodle/grade:manageletters', 'write', 50, 'moodle', 0),
	(140, 'moodle/grade:hide', 'write', 50, 'moodle', 0),
	(141, 'moodle/grade:lock', 'write', 50, 'moodle', 0),
	(142, 'moodle/grade:unlock', 'write', 50, 'moodle', 0),
	(143, 'moodle/my:manageblocks', 'write', 10, 'moodle', 0),
	(144, 'moodle/notes:view', 'read', 50, 'moodle', 0),
	(145, 'moodle/notes:manage', 'write', 50, 'moodle', 16),
	(146, 'moodle/tag:manage', 'write', 10, 'moodle', 16),
	(147, 'moodle/tag:edit', 'write', 10, 'moodle', 16),
	(148, 'moodle/tag:flag', 'write', 10, 'moodle', 16),
	(149, 'moodle/tag:editblocks', 'write', 10, 'moodle', 0),
	(150, 'moodle/block:view', 'read', 80, 'moodle', 0),
	(151, 'moodle/block:edit', 'write', 80, 'moodle', 20),
	(152, 'moodle/portfolio:export', 'read', 10, 'moodle', 0),
	(153, 'moodle/comment:view', 'read', 50, 'moodle', 0),
	(154, 'moodle/comment:post', 'write', 50, 'moodle', 24),
	(155, 'moodle/comment:delete', 'write', 50, 'moodle', 32),
	(156, 'moodle/webservice:createtoken', 'write', 10, 'moodle', 62),
	(157, 'moodle/webservice:createmobiletoken', 'write', 10, 'moodle', 24),
	(158, 'moodle/rating:view', 'read', 50, 'moodle', 0),
	(159, 'moodle/rating:viewany', 'read', 50, 'moodle', 8),
	(160, 'moodle/rating:viewall', 'read', 50, 'moodle', 8),
	(161, 'moodle/rating:rate', 'write', 50, 'moodle', 0),
	(162, 'moodle/course:publish', 'write', 10, 'moodle', 24),
	(163, 'moodle/course:markcomplete', 'write', 50, 'moodle', 0),
	(164, 'moodle/community:add', 'write', 10, 'moodle', 0),
	(165, 'moodle/community:download', 'write', 10, 'moodle', 0),
	(166, 'moodle/badges:manageglobalsettings', 'write', 10, 'moodle', 34),
	(167, 'moodle/badges:viewbadges', 'read', 50, 'moodle', 0),
	(168, 'moodle/badges:manageownbadges', 'write', 30, 'moodle', 0),
	(169, 'moodle/badges:viewotherbadges', 'read', 30, 'moodle', 0),
	(170, 'moodle/badges:earnbadge', 'write', 50, 'moodle', 0),
	(171, 'moodle/badges:createbadge', 'write', 50, 'moodle', 16),
	(172, 'moodle/badges:deletebadge', 'write', 50, 'moodle', 32),
	(173, 'moodle/badges:configuredetails', 'write', 50, 'moodle', 16),
	(174, 'moodle/badges:configurecriteria', 'write', 50, 'moodle', 4),
	(175, 'moodle/badges:configuremessages', 'write', 50, 'moodle', 16),
	(176, 'moodle/badges:awardbadge', 'write', 50, 'moodle', 16),
	(177, 'moodle/badges:viewawarded', 'read', 50, 'moodle', 8),
	(178, 'moodle/site:forcelanguage', 'read', 10, 'moodle', 0),
	(179, 'moodle/search:query', 'read', 10, 'moodle', 0),
	(180, 'moodle/competency:competencymanage', 'write', 40, 'moodle', 0),
	(181, 'moodle/competency:competencyview', 'read', 40, 'moodle', 0),
	(182, 'moodle/competency:competencygrade', 'write', 50, 'moodle', 0),
	(183, 'moodle/competency:coursecompetencymanage', 'write', 50, 'moodle', 0),
	(184, 'moodle/competency:coursecompetencyconfigure', 'write', 70, 'moodle', 0),
	(185, 'moodle/competency:coursecompetencygradable', 'read', 50, 'moodle', 0),
	(186, 'moodle/competency:coursecompetencyview', 'read', 50, 'moodle', 0),
	(187, 'moodle/competency:evidencedelete', 'write', 30, 'moodle', 0),
	(188, 'moodle/competency:planmanage', 'write', 30, 'moodle', 0),
	(189, 'moodle/competency:planmanagedraft', 'write', 30, 'moodle', 0),
	(190, 'moodle/competency:planmanageown', 'write', 30, 'moodle', 0),
	(191, 'moodle/competency:planmanageowndraft', 'write', 30, 'moodle', 0),
	(192, 'moodle/competency:planview', 'read', 30, 'moodle', 0),
	(193, 'moodle/competency:planviewdraft', 'read', 30, 'moodle', 0),
	(194, 'moodle/competency:planviewown', 'read', 30, 'moodle', 0),
	(195, 'moodle/competency:planviewowndraft', 'read', 30, 'moodle', 0),
	(196, 'moodle/competency:planrequestreview', 'write', 30, 'moodle', 0),
	(197, 'moodle/competency:planrequestreviewown', 'write', 30, 'moodle', 0),
	(198, 'moodle/competency:planreview', 'write', 30, 'moodle', 0),
	(199, 'moodle/competency:plancomment', 'write', 30, 'moodle', 0),
	(200, 'moodle/competency:plancommentown', 'write', 30, 'moodle', 0),
	(201, 'moodle/competency:usercompetencyview', 'read', 30, 'moodle', 0),
	(202, 'moodle/competency:usercompetencyrequestreview', 'write', 30, 'moodle', 0),
	(203, 'moodle/competency:usercompetencyrequestreviewown', 'write', 30, 'moodle', 0),
	(204, 'moodle/competency:usercompetencyreview', 'write', 30, 'moodle', 0),
	(205, 'moodle/competency:usercompetencycomment', 'write', 30, 'moodle', 0),
	(206, 'moodle/competency:usercompetencycommentown', 'write', 30, 'moodle', 0),
	(207, 'moodle/competency:templatemanage', 'write', 40, 'moodle', 0),
	(208, 'moodle/competency:templateview', 'read', 40, 'moodle', 0),
	(209, 'moodle/competency:userevidencemanage', 'write', 30, 'moodle', 0),
	(210, 'moodle/competency:userevidencemanageown', 'write', 30, 'moodle', 0),
	(211, 'moodle/competency:userevidenceview', 'read', 30, 'moodle', 0),
	(212, 'mod/assign:view', 'read', 70, 'mod_assign', 0),
	(213, 'mod/assign:submit', 'write', 70, 'mod_assign', 0),
	(214, 'mod/assign:grade', 'write', 70, 'mod_assign', 4),
	(215, 'mod/assign:exportownsubmission', 'read', 70, 'mod_assign', 0),
	(216, 'mod/assign:addinstance', 'write', 50, 'mod_assign', 4),
	(217, 'mod/assign:editothersubmission', 'write', 70, 'mod_assign', 41),
	(218, 'mod/assign:grantextension', 'write', 70, 'mod_assign', 0),
	(219, 'mod/assign:revealidentities', 'write', 70, 'mod_assign', 0),
	(220, 'mod/assign:reviewgrades', 'write', 70, 'mod_assign', 0),
	(221, 'mod/assign:releasegrades', 'write', 70, 'mod_assign', 0),
	(222, 'mod/assign:managegrades', 'write', 70, 'mod_assign', 0),
	(223, 'mod/assign:manageallocations', 'write', 70, 'mod_assign', 0),
	(224, 'mod/assign:viewgrades', 'read', 70, 'mod_assign', 0),
	(225, 'mod/assign:viewblinddetails', 'write', 70, 'mod_assign', 8),
	(226, 'mod/assign:receivegradernotifications', 'read', 70, 'mod_assign', 0),
	(227, 'mod/assignment:view', 'read', 70, 'mod_assignment', 0),
	(228, 'mod/assignment:addinstance', 'write', 50, 'mod_assignment', 4),
	(229, 'mod/assignment:submit', 'write', 70, 'mod_assignment', 0),
	(230, 'mod/assignment:grade', 'write', 70, 'mod_assignment', 4),
	(231, 'mod/assignment:exportownsubmission', 'read', 70, 'mod_assignment', 0),
	(232, 'mod/book:addinstance', 'write', 50, 'mod_book', 4),
	(233, 'mod/book:read', 'read', 70, 'mod_book', 0),
	(234, 'mod/book:viewhiddenchapters', 'read', 70, 'mod_book', 0),
	(235, 'mod/book:edit', 'write', 70, 'mod_book', 4),
	(236, 'mod/chat:addinstance', 'write', 50, 'mod_chat', 4),
	(237, 'mod/chat:chat', 'write', 70, 'mod_chat', 16),
	(238, 'mod/chat:readlog', 'read', 70, 'mod_chat', 0),
	(239, 'mod/chat:deletelog', 'write', 70, 'mod_chat', 0),
	(240, 'mod/chat:exportparticipatedsession', 'read', 70, 'mod_chat', 8),
	(241, 'mod/chat:exportsession', 'read', 70, 'mod_chat', 8),
	(242, 'mod/choice:addinstance', 'write', 50, 'mod_choice', 4),
	(243, 'mod/choice:choose', 'write', 70, 'mod_choice', 0),
	(244, 'mod/choice:readresponses', 'read', 70, 'mod_choice', 0),
	(245, 'mod/choice:deleteresponses', 'write', 70, 'mod_choice', 0),
	(246, 'mod/choice:downloadresponses', 'read', 70, 'mod_choice', 0),
	(247, 'mod/data:addinstance', 'write', 50, 'mod_data', 4),
	(248, 'mod/data:viewentry', 'read', 70, 'mod_data', 0),
	(249, 'mod/data:writeentry', 'write', 70, 'mod_data', 16),
	(250, 'mod/data:comment', 'write', 70, 'mod_data', 16),
	(251, 'mod/data:rate', 'write', 70, 'mod_data', 0),
	(252, 'mod/data:viewrating', 'read', 70, 'mod_data', 0),
	(253, 'mod/data:viewanyrating', 'read', 70, 'mod_data', 8),
	(254, 'mod/data:viewallratings', 'read', 70, 'mod_data', 8),
	(255, 'mod/data:approve', 'write', 70, 'mod_data', 16),
	(256, 'mod/data:manageentries', 'write', 70, 'mod_data', 16),
	(257, 'mod/data:managecomments', 'write', 70, 'mod_data', 16),
	(258, 'mod/data:managetemplates', 'write', 70, 'mod_data', 20),
	(259, 'mod/data:viewalluserpresets', 'read', 70, 'mod_data', 0),
	(260, 'mod/data:manageuserpresets', 'write', 70, 'mod_data', 20),
	(261, 'mod/data:exportentry', 'read', 70, 'mod_data', 8),
	(262, 'mod/data:exportownentry', 'read', 70, 'mod_data', 0),
	(263, 'mod/data:exportallentries', 'read', 70, 'mod_data', 8),
	(264, 'mod/data:exportuserinfo', 'read', 70, 'mod_data', 8),
	(265, 'mod/feedback:addinstance', 'write', 50, 'mod_feedback', 4),
	(266, 'mod/feedback:view', 'read', 70, 'mod_feedback', 0),
	(267, 'mod/feedback:complete', 'write', 70, 'mod_feedback', 16),
	(268, 'mod/feedback:viewanalysepage', 'read', 70, 'mod_feedback', 8),
	(269, 'mod/feedback:deletesubmissions', 'write', 70, 'mod_feedback', 0),
	(270, 'mod/feedback:mapcourse', 'write', 70, 'mod_feedback', 0),
	(271, 'mod/feedback:edititems', 'write', 70, 'mod_feedback', 20),
	(272, 'mod/feedback:createprivatetemplate', 'write', 70, 'mod_feedback', 16),
	(273, 'mod/feedback:createpublictemplate', 'write', 70, 'mod_feedback', 16),
	(274, 'mod/feedback:deletetemplate', 'write', 70, 'mod_feedback', 0),
	(275, 'mod/feedback:viewreports', 'read', 70, 'mod_feedback', 8),
	(276, 'mod/feedback:receivemail', 'read', 70, 'mod_feedback', 8),
	(277, 'mod/folder:addinstance', 'write', 50, 'mod_folder', 4),
	(278, 'mod/folder:view', 'read', 70, 'mod_folder', 0),
	(279, 'mod/folder:managefiles', 'write', 70, 'mod_folder', 16),
	(280, 'mod/forum:addinstance', 'write', 50, 'mod_forum', 4),
	(281, 'mod/forum:viewdiscussion', 'read', 70, 'mod_forum', 0),
	(282, 'mod/forum:viewhiddentimedposts', 'read', 70, 'mod_forum', 0),
	(283, 'mod/forum:startdiscussion', 'write', 70, 'mod_forum', 16),
	(284, 'mod/forum:replypost', 'write', 70, 'mod_forum', 16),
	(285, 'mod/forum:addnews', 'write', 70, 'mod_forum', 16),
	(286, 'mod/forum:replynews', 'write', 70, 'mod_forum', 16),
	(287, 'mod/forum:viewrating', 'read', 70, 'mod_forum', 0),
	(288, 'mod/forum:viewanyrating', 'read', 70, 'mod_forum', 8),
	(289, 'mod/forum:viewallratings', 'read', 70, 'mod_forum', 8),
	(290, 'mod/forum:rate', 'write', 70, 'mod_forum', 0),
	(291, 'mod/forum:createattachment', 'write', 70, 'mod_forum', 16),
	(292, 'mod/forum:deleteownpost', 'read', 70, 'mod_forum', 0),
	(293, 'mod/forum:deleteanypost', 'read', 70, 'mod_forum', 0),
	(294, 'mod/forum:splitdiscussions', 'read', 70, 'mod_forum', 0),
	(295, 'mod/forum:movediscussions', 'read', 70, 'mod_forum', 0),
	(296, 'mod/forum:pindiscussions', 'write', 70, 'mod_forum', 0),
	(297, 'mod/forum:editanypost', 'write', 70, 'mod_forum', 16),
	(298, 'mod/forum:viewqandawithoutposting', 'read', 70, 'mod_forum', 0),
	(299, 'mod/forum:viewsubscribers', 'read', 70, 'mod_forum', 0),
	(300, 'mod/forum:managesubscriptions', 'read', 70, 'mod_forum', 16),
	(301, 'mod/forum:postwithoutthrottling', 'write', 70, 'mod_forum', 16),
	(302, 'mod/forum:exportdiscussion', 'read', 70, 'mod_forum', 8),
	(303, 'mod/forum:exportpost', 'read', 70, 'mod_forum', 8),
	(304, 'mod/forum:exportownpost', 'read', 70, 'mod_forum', 8),
	(305, 'mod/forum:addquestion', 'write', 70, 'mod_forum', 16),
	(306, 'mod/forum:allowforcesubscribe', 'read', 70, 'mod_forum', 0),
	(307, 'mod/forum:canposttomygroups', 'write', 70, 'mod_forum', 0),
	(308, 'mod/glossary:addinstance', 'write', 50, 'mod_glossary', 4),
	(309, 'mod/glossary:view', 'read', 70, 'mod_glossary', 0),
	(310, 'mod/glossary:write', 'write', 70, 'mod_glossary', 16),
	(311, 'mod/glossary:manageentries', 'write', 70, 'mod_glossary', 16),
	(312, 'mod/glossary:managecategories', 'write', 70, 'mod_glossary', 16),
	(313, 'mod/glossary:comment', 'write', 70, 'mod_glossary', 16),
	(314, 'mod/glossary:managecomments', 'write', 70, 'mod_glossary', 16),
	(315, 'mod/glossary:import', 'write', 70, 'mod_glossary', 16),
	(316, 'mod/glossary:export', 'read', 70, 'mod_glossary', 0),
	(317, 'mod/glossary:approve', 'write', 70, 'mod_glossary', 16),
	(318, 'mod/glossary:rate', 'write', 70, 'mod_glossary', 0),
	(319, 'mod/glossary:viewrating', 'read', 70, 'mod_glossary', 0),
	(320, 'mod/glossary:viewanyrating', 'read', 70, 'mod_glossary', 8),
	(321, 'mod/glossary:viewallratings', 'read', 70, 'mod_glossary', 8),
	(322, 'mod/glossary:exportentry', 'read', 70, 'mod_glossary', 8),
	(323, 'mod/glossary:exportownentry', 'read', 70, 'mod_glossary', 0),
	(324, 'mod/imscp:view', 'read', 70, 'mod_imscp', 0),
	(325, 'mod/imscp:addinstance', 'write', 50, 'mod_imscp', 4),
	(326, 'mod/label:addinstance', 'write', 50, 'mod_label', 4),
	(327, 'mod/lesson:addinstance', 'write', 50, 'mod_lesson', 4),
	(328, 'mod/lesson:edit', 'write', 70, 'mod_lesson', 4),
	(329, 'mod/lesson:grade', 'write', 70, 'mod_lesson', 20),
	(330, 'mod/lesson:viewreports', 'read', 70, 'mod_lesson', 8),
	(331, 'mod/lesson:manage', 'write', 70, 'mod_lesson', 0),
	(332, 'mod/lesson:manageoverrides', 'write', 70, 'mod_lesson', 0),
	(333, 'mod/lti:view', 'read', 70, 'mod_lti', 0),
	(334, 'mod/lti:addinstance', 'write', 50, 'mod_lti', 4),
	(335, 'mod/lti:manage', 'write', 70, 'mod_lti', 8),
	(336, 'mod/lti:addcoursetool', 'write', 50, 'mod_lti', 0),
	(337, 'mod/lti:requesttooladd', 'write', 50, 'mod_lti', 0),
	(338, 'mod/page:view', 'read', 70, 'mod_page', 0),
	(339, 'mod/page:addinstance', 'write', 50, 'mod_page', 4),
	(340, 'mod/quiz:view', 'read', 70, 'mod_quiz', 0),
	(341, 'mod/quiz:addinstance', 'write', 50, 'mod_quiz', 4),
	(342, 'mod/quiz:attempt', 'write', 70, 'mod_quiz', 16),
	(343, 'mod/quiz:reviewmyattempts', 'read', 70, 'mod_quiz', 0),
	(344, 'mod/quiz:manage', 'write', 70, 'mod_quiz', 16),
	(345, 'mod/quiz:manageoverrides', 'write', 70, 'mod_quiz', 0),
	(346, 'mod/quiz:preview', 'write', 70, 'mod_quiz', 0),
	(347, 'mod/quiz:grade', 'write', 70, 'mod_quiz', 20),
	(348, 'mod/quiz:regrade', 'write', 70, 'mod_quiz', 16),
	(349, 'mod/quiz:viewreports', 'read', 70, 'mod_quiz', 8),
	(350, 'mod/quiz:deleteattempts', 'write', 70, 'mod_quiz', 32),
	(351, 'mod/quiz:ignoretimelimits', 'read', 70, 'mod_quiz', 0),
	(352, 'mod/quiz:emailconfirmsubmission', 'read', 70, 'mod_quiz', 0),
	(353, 'mod/quiz:emailnotifysubmission', 'read', 70, 'mod_quiz', 0),
	(354, 'mod/quiz:emailwarnoverdue', 'read', 70, 'mod_quiz', 0),
	(355, 'mod/resource:view', 'read', 70, 'mod_resource', 0),
	(356, 'mod/resource:addinstance', 'write', 50, 'mod_resource', 4),
	(357, 'mod/scorm:addinstance', 'write', 50, 'mod_scorm', 4),
	(358, 'mod/scorm:viewreport', 'read', 70, 'mod_scorm', 0),
	(359, 'mod/scorm:skipview', 'read', 70, 'mod_scorm', 0),
	(360, 'mod/scorm:savetrack', 'write', 70, 'mod_scorm', 0),
	(361, 'mod/scorm:viewscores', 'read', 70, 'mod_scorm', 0),
	(362, 'mod/scorm:deleteresponses', 'write', 70, 'mod_scorm', 0),
	(363, 'mod/scorm:deleteownresponses', 'write', 70, 'mod_scorm', 0),
	(364, 'mod/survey:addinstance', 'write', 50, 'mod_survey', 4),
	(365, 'mod/survey:participate', 'read', 70, 'mod_survey', 0),
	(366, 'mod/survey:readresponses', 'read', 70, 'mod_survey', 0),
	(367, 'mod/survey:download', 'read', 70, 'mod_survey', 0),
	(368, 'mod/url:view', 'read', 70, 'mod_url', 0),
	(369, 'mod/url:addinstance', 'write', 50, 'mod_url', 4),
	(370, 'mod/wiki:addinstance', 'write', 50, 'mod_wiki', 4),
	(371, 'mod/wiki:viewpage', 'read', 70, 'mod_wiki', 0),
	(372, 'mod/wiki:editpage', 'write', 70, 'mod_wiki', 16),
	(373, 'mod/wiki:createpage', 'write', 70, 'mod_wiki', 16),
	(374, 'mod/wiki:viewcomment', 'read', 70, 'mod_wiki', 0),
	(375, 'mod/wiki:editcomment', 'write', 70, 'mod_wiki', 16),
	(376, 'mod/wiki:managecomment', 'write', 70, 'mod_wiki', 0),
	(377, 'mod/wiki:managefiles', 'write', 70, 'mod_wiki', 0),
	(378, 'mod/wiki:overridelock', 'write', 70, 'mod_wiki', 0),
	(379, 'mod/wiki:managewiki', 'write', 70, 'mod_wiki', 0),
	(380, 'mod/workshop:view', 'read', 70, 'mod_workshop', 0),
	(381, 'mod/workshop:addinstance', 'write', 50, 'mod_workshop', 4),
	(382, 'mod/workshop:switchphase', 'write', 70, 'mod_workshop', 0),
	(383, 'mod/workshop:editdimensions', 'write', 70, 'mod_workshop', 4),
	(384, 'mod/workshop:submit', 'write', 70, 'mod_workshop', 0),
	(385, 'mod/workshop:peerassess', 'write', 70, 'mod_workshop', 0),
	(386, 'mod/workshop:manageexamples', 'write', 70, 'mod_workshop', 0),
	(387, 'mod/workshop:allocate', 'write', 70, 'mod_workshop', 0),
	(388, 'mod/workshop:publishsubmissions', 'write', 70, 'mod_workshop', 0),
	(389, 'mod/workshop:viewauthornames', 'read', 70, 'mod_workshop', 0),
	(390, 'mod/workshop:viewreviewernames', 'read', 70, 'mod_workshop', 0),
	(391, 'mod/workshop:viewallsubmissions', 'read', 70, 'mod_workshop', 0),
	(392, 'mod/workshop:viewpublishedsubmissions', 'read', 70, 'mod_workshop', 0),
	(393, 'mod/workshop:viewauthorpublished', 'read', 70, 'mod_workshop', 0),
	(394, 'mod/workshop:viewallassessments', 'read', 70, 'mod_workshop', 0),
	(395, 'mod/workshop:overridegrades', 'write', 70, 'mod_workshop', 0),
	(396, 'mod/workshop:ignoredeadlines', 'write', 70, 'mod_workshop', 0),
	(397, 'mod/workshop:deletesubmissions', 'write', 70, 'mod_workshop', 0),
	(398, 'enrol/category:synchronised', 'write', 10, 'enrol_category', 0),
	(399, 'enrol/category:config', 'write', 50, 'enrol_category', 0),
	(400, 'enrol/cohort:config', 'write', 50, 'enrol_cohort', 0),
	(401, 'enrol/cohort:unenrol', 'write', 50, 'enrol_cohort', 0),
	(402, 'enrol/database:unenrol', 'write', 50, 'enrol_database', 0),
	(403, 'enrol/database:config', 'write', 50, 'enrol_database', 0),
	(404, 'enrol/flatfile:manage', 'write', 50, 'enrol_flatfile', 0),
	(405, 'enrol/flatfile:unenrol', 'write', 50, 'enrol_flatfile', 0),
	(406, 'enrol/guest:config', 'write', 50, 'enrol_guest', 0),
	(407, 'enrol/imsenterprise:config', 'write', 50, 'enrol_imsenterprise', 0),
	(408, 'enrol/ldap:manage', 'write', 50, 'enrol_ldap', 0),
	(409, 'enrol/lti:config', 'write', 50, 'enrol_lti', 0),
	(410, 'enrol/lti:unenrol', 'write', 50, 'enrol_lti', 0),
	(411, 'enrol/manual:config', 'write', 50, 'enrol_manual', 0),
	(412, 'enrol/manual:enrol', 'write', 50, 'enrol_manual', 0),
	(413, 'enrol/manual:manage', 'write', 50, 'enrol_manual', 0),
	(414, 'enrol/manual:unenrol', 'write', 50, 'enrol_manual', 0),
	(415, 'enrol/manual:unenrolself', 'write', 50, 'enrol_manual', 0),
	(416, 'enrol/meta:config', 'write', 50, 'enrol_meta', 0),
	(417, 'enrol/meta:selectaslinked', 'read', 50, 'enrol_meta', 0),
	(418, 'enrol/meta:unenrol', 'write', 50, 'enrol_meta', 0),
	(419, 'enrol/mnet:config', 'write', 50, 'enrol_mnet', 0),
	(420, 'enrol/paypal:config', 'write', 50, 'enrol_paypal', 0),
	(421, 'enrol/paypal:manage', 'write', 50, 'enrol_paypal', 0),
	(422, 'enrol/paypal:unenrol', 'write', 50, 'enrol_paypal', 0),
	(423, 'enrol/paypal:unenrolself', 'write', 50, 'enrol_paypal', 0),
	(424, 'enrol/self:config', 'write', 50, 'enrol_self', 0),
	(425, 'enrol/self:manage', 'write', 50, 'enrol_self', 0),
	(426, 'enrol/self:holdkey', 'write', 50, 'enrol_self', 0),
	(427, 'enrol/self:unenrolself', 'write', 50, 'enrol_self', 0),
	(428, 'enrol/self:unenrol', 'write', 50, 'enrol_self', 0),
	(429, 'message/airnotifier:managedevice', 'write', 10, 'message_airnotifier', 0),
	(430, 'block/activity_modules:addinstance', 'write', 80, 'block_activity_modules', 20),
	(431, 'block/activity_results:addinstance', 'write', 80, 'block_activity_results', 20),
	(432, 'block/admin_bookmarks:myaddinstance', 'write', 10, 'block_admin_bookmarks', 0),
	(433, 'block/admin_bookmarks:addinstance', 'write', 80, 'block_admin_bookmarks', 20),
	(434, 'block/badges:addinstance', 'read', 80, 'block_badges', 0),
	(435, 'block/badges:myaddinstance', 'read', 10, 'block_badges', 8),
	(436, 'block/blog_menu:addinstance', 'write', 80, 'block_blog_menu', 20),
	(437, 'block/blog_recent:addinstance', 'write', 80, 'block_blog_recent', 20),
	(438, 'block/blog_tags:addinstance', 'write', 80, 'block_blog_tags', 20),
	(439, 'block/calendar_month:myaddinstance', 'write', 10, 'block_calendar_month', 0),
	(440, 'block/calendar_month:addinstance', 'write', 80, 'block_calendar_month', 20),
	(441, 'block/calendar_upcoming:myaddinstance', 'write', 10, 'block_calendar_upcoming', 0),
	(442, 'block/calendar_upcoming:addinstance', 'write', 80, 'block_calendar_upcoming', 20),
	(443, 'block/comments:myaddinstance', 'write', 10, 'block_comments', 0),
	(444, 'block/comments:addinstance', 'write', 80, 'block_comments', 20),
	(445, 'block/community:myaddinstance', 'write', 10, 'block_community', 0),
	(446, 'block/community:addinstance', 'write', 80, 'block_community', 20),
	(447, 'block/completionstatus:addinstance', 'write', 80, 'block_completionstatus', 20),
	(448, 'block/course_list:myaddinstance', 'write', 10, 'block_course_list', 0),
	(449, 'block/course_list:addinstance', 'write', 80, 'block_course_list', 20),
	(450, 'block/course_overview:myaddinstance', 'write', 10, 'block_course_overview', 0),
	(451, 'block/course_overview:addinstance', 'write', 80, 'block_course_overview', 20),
	(452, 'block/course_summary:addinstance', 'write', 80, 'block_course_summary', 20),
	(453, 'block/feedback:addinstance', 'write', 80, 'block_feedback', 20),
	(454, 'block/globalsearch:myaddinstance', 'write', 10, 'block_globalsearch', 0),
	(455, 'block/globalsearch:addinstance', 'write', 80, 'block_globalsearch', 0),
	(456, 'block/glossary_random:myaddinstance', 'write', 10, 'block_glossary_random', 0),
	(457, 'block/glossary_random:addinstance', 'write', 80, 'block_glossary_random', 20),
	(458, 'block/html:myaddinstance', 'write', 10, 'block_html', 0),
	(459, 'block/html:addinstance', 'write', 80, 'block_html', 20),
	(460, 'block/login:addinstance', 'write', 80, 'block_login', 20),
	(461, 'block/lp:addinstance', 'write', 10, 'block_lp', 0),
	(462, 'block/lp:myaddinstance', 'write', 10, 'block_lp', 0),
	(463, 'block/lp:view', 'read', 10, 'block_lp', 0),
	(464, 'block/mentees:myaddinstance', 'write', 10, 'block_mentees', 0),
	(465, 'block/mentees:addinstance', 'write', 80, 'block_mentees', 20),
	(466, 'block/messages:myaddinstance', 'write', 10, 'block_messages', 0),
	(467, 'block/messages:addinstance', 'write', 80, 'block_messages', 20),
	(468, 'block/mnet_hosts:myaddinstance', 'write', 10, 'block_mnet_hosts', 0),
	(469, 'block/mnet_hosts:addinstance', 'write', 80, 'block_mnet_hosts', 20),
	(470, 'block/myprofile:myaddinstance', 'write', 10, 'block_myprofile', 0),
	(471, 'block/myprofile:addinstance', 'write', 80, 'block_myprofile', 20),
	(472, 'block/navigation:myaddinstance', 'write', 10, 'block_navigation', 0),
	(473, 'block/navigation:addinstance', 'write', 80, 'block_navigation', 20),
	(474, 'block/news_items:myaddinstance', 'write', 10, 'block_news_items', 0),
	(475, 'block/news_items:addinstance', 'write', 80, 'block_news_items', 20),
	(476, 'block/online_users:myaddinstance', 'write', 10, 'block_online_users', 0),
	(477, 'block/online_users:addinstance', 'write', 80, 'block_online_users', 20),
	(478, 'block/online_users:viewlist', 'read', 80, 'block_online_users', 0),
	(479, 'block/participants:addinstance', 'write', 80, 'block_participants', 20),
	(480, 'block/private_files:myaddinstance', 'write', 10, 'block_private_files', 0),
	(481, 'block/private_files:addinstance', 'write', 80, 'block_private_files', 20),
	(482, 'block/quiz_results:addinstance', 'write', 80, 'block_quiz_results', 20),
	(483, 'block/recent_activity:addinstance', 'write', 80, 'block_recent_activity', 20),
	(484, 'block/recent_activity:viewaddupdatemodule', 'read', 50, 'block_recent_activity', 0),
	(485, 'block/recent_activity:viewdeletemodule', 'read', 50, 'block_recent_activity', 0),
	(486, 'block/rss_client:myaddinstance', 'write', 10, 'block_rss_client', 0),
	(487, 'block/rss_client:addinstance', 'write', 80, 'block_rss_client', 20),
	(488, 'block/rss_client:manageownfeeds', 'write', 80, 'block_rss_client', 0),
	(489, 'block/rss_client:manageanyfeeds', 'write', 80, 'block_rss_client', 16),
	(490, 'block/search_forums:addinstance', 'write', 80, 'block_search_forums', 20),
	(491, 'block/section_links:addinstance', 'write', 80, 'block_section_links', 20),
	(492, 'block/selfcompletion:addinstance', 'write', 80, 'block_selfcompletion', 20),
	(493, 'block/settings:myaddinstance', 'write', 10, 'block_settings', 0),
	(494, 'block/settings:addinstance', 'write', 80, 'block_settings', 20),
	(495, 'block/site_main_menu:addinstance', 'write', 80, 'block_site_main_menu', 20),
	(496, 'block/social_activities:addinstance', 'write', 80, 'block_social_activities', 20),
	(497, 'block/tag_flickr:addinstance', 'write', 80, 'block_tag_flickr', 20),
	(498, 'block/tag_youtube:addinstance', 'write', 80, 'block_tag_youtube', 20),
	(499, 'block/tags:myaddinstance', 'write', 10, 'block_tags', 0),
	(500, 'block/tags:addinstance', 'write', 80, 'block_tags', 20),
	(501, 'report/completion:view', 'read', 50, 'report_completion', 8),
	(502, 'report/courseoverview:view', 'read', 10, 'report_courseoverview', 8),
	(503, 'report/log:view', 'read', 50, 'report_log', 8),
	(504, 'report/log:viewtoday', 'read', 50, 'report_log', 8),
	(505, 'report/loglive:view', 'read', 50, 'report_loglive', 8),
	(506, 'report/outline:view', 'read', 50, 'report_outline', 8),
	(507, 'report/participation:view', 'read', 50, 'report_participation', 8),
	(508, 'report/performance:view', 'read', 10, 'report_performance', 2),
	(509, 'report/progress:view', 'read', 50, 'report_progress', 8),
	(510, 'report/questioninstances:view', 'read', 10, 'report_questioninstances', 0),
	(511, 'report/security:view', 'read', 10, 'report_security', 2),
	(512, 'report/stats:view', 'read', 50, 'report_stats', 8),
	(513, 'report/usersessions:manageownsessions', 'write', 30, 'report_usersessions', 0),
	(514, 'gradeexport/ods:view', 'read', 50, 'gradeexport_ods', 8),
	(515, 'gradeexport/ods:publish', 'read', 50, 'gradeexport_ods', 8),
	(516, 'gradeexport/txt:view', 'read', 50, 'gradeexport_txt', 8),
	(517, 'gradeexport/txt:publish', 'read', 50, 'gradeexport_txt', 8),
	(518, 'gradeexport/xls:view', 'read', 50, 'gradeexport_xls', 8),
	(519, 'gradeexport/xls:publish', 'read', 50, 'gradeexport_xls', 8),
	(520, 'gradeexport/xml:view', 'read', 50, 'gradeexport_xml', 8),
	(521, 'gradeexport/xml:publish', 'read', 50, 'gradeexport_xml', 8),
	(522, 'gradeimport/csv:view', 'write', 50, 'gradeimport_csv', 0),
	(523, 'gradeimport/direct:view', 'write', 50, 'gradeimport_direct', 0),
	(524, 'gradeimport/xml:view', 'write', 50, 'gradeimport_xml', 0),
	(525, 'gradeimport/xml:publish', 'write', 50, 'gradeimport_xml', 0),
	(526, 'gradereport/grader:view', 'read', 50, 'gradereport_grader', 8),
	(527, 'gradereport/history:view', 'read', 50, 'gradereport_history', 8),
	(528, 'gradereport/outcomes:view', 'read', 50, 'gradereport_outcomes', 8),
	(529, 'gradereport/overview:view', 'read', 50, 'gradereport_overview', 8),
	(530, 'gradereport/singleview:view', 'read', 50, 'gradereport_singleview', 8),
	(531, 'gradereport/user:view', 'read', 50, 'gradereport_user', 8),
	(532, 'webservice/rest:use', 'read', 50, 'webservice_rest', 0),
	(533, 'webservice/soap:use', 'read', 50, 'webservice_soap', 0),
	(534, 'webservice/xmlrpc:use', 'read', 50, 'webservice_xmlrpc', 0),
	(535, 'repository/alfresco:view', 'read', 70, 'repository_alfresco', 0),
	(536, 'repository/areafiles:view', 'read', 70, 'repository_areafiles', 0),
	(537, 'repository/boxnet:view', 'read', 70, 'repository_boxnet', 0),
	(538, 'repository/coursefiles:view', 'read', 70, 'repository_coursefiles', 0),
	(539, 'repository/dropbox:view', 'read', 70, 'repository_dropbox', 0),
	(540, 'repository/equella:view', 'read', 70, 'repository_equella', 0),
	(541, 'repository/filesystem:view', 'read', 70, 'repository_filesystem', 0),
	(542, 'repository/flickr:view', 'read', 70, 'repository_flickr', 0),
	(543, 'repository/flickr_public:view', 'read', 70, 'repository_flickr_public', 0),
	(544, 'repository/googledocs:view', 'read', 70, 'repository_googledocs', 0),
	(545, 'repository/local:view', 'read', 70, 'repository_local', 0),
	(546, 'repository/merlot:view', 'read', 70, 'repository_merlot', 0),
	(547, 'repository/picasa:view', 'read', 70, 'repository_picasa', 0),
	(548, 'repository/recent:view', 'read', 70, 'repository_recent', 0),
	(549, 'repository/s3:view', 'read', 70, 'repository_s3', 0),
	(550, 'repository/skydrive:view', 'read', 70, 'repository_skydrive', 0),
	(551, 'repository/upload:view', 'read', 70, 'repository_upload', 0),
	(552, 'repository/url:view', 'read', 70, 'repository_url', 0),
	(553, 'repository/user:view', 'read', 70, 'repository_user', 0),
	(554, 'repository/webdav:view', 'read', 70, 'repository_webdav', 0),
	(555, 'repository/wikimedia:view', 'read', 70, 'repository_wikimedia', 0),
	(556, 'repository/youtube:view', 'read', 70, 'repository_youtube', 0),
	(557, 'tool/customlang:view', 'read', 10, 'tool_customlang', 2),
	(558, 'tool/customlang:edit', 'write', 10, 'tool_customlang', 6),
	(559, 'tool/lpmigrate:frameworksmigrate', 'write', 10, 'tool_lpmigrate', 0),
	(560, 'tool/monitor:subscribe', 'read', 50, 'tool_monitor', 8),
	(561, 'tool/monitor:managerules', 'write', 50, 'tool_monitor', 4),
	(562, 'tool/monitor:managetool', 'write', 10, 'tool_monitor', 4),
	(563, 'tool/recyclebin:deleteitems', 'write', 50, 'tool_recyclebin', 32),
	(564, 'tool/recyclebin:restoreitems', 'write', 50, 'tool_recyclebin', 0),
	(565, 'tool/recyclebin:viewitems', 'read', 50, 'tool_recyclebin', 0),
	(566, 'tool/uploaduser:uploaduserpictures', 'write', 10, 'tool_uploaduser', 16),
	(567, 'booktool/exportimscp:export', 'read', 70, 'booktool_exportimscp', 0),
	(568, 'booktool/importhtml:import', 'write', 70, 'booktool_importhtml', 4),
	(569, 'booktool/print:print', 'read', 70, 'booktool_print', 0),
	(570, 'quiz/grading:viewstudentnames', 'read', 70, 'quiz_grading', 0),
	(571, 'quiz/grading:viewidnumber', 'read', 70, 'quiz_grading', 0),
	(572, 'quiz/statistics:view', 'read', 70, 'quiz_statistics', 0);
/*!40000 ALTER TABLE `mdl_capabilities` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_chat
CREATE TABLE IF NOT EXISTS `mdl_chat` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `keepdays` bigint(11) NOT NULL DEFAULT '0',
  `studentlogs` smallint(4) NOT NULL DEFAULT '0',
  `chattime` bigint(10) NOT NULL DEFAULT '0',
  `schedule` smallint(4) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chat_cou_ix` (`course`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each of these is a chat room';

-- Copiando dados para a tabela capacitacoes.mdl_chat: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_chat` DISABLE KEYS */;
INSERT INTO `mdl_chat` (`id`, `course`, `name`, `intro`, `introformat`, `keepdays`, `studentlogs`, `chattime`, `schedule`, `timemodified`) VALUES
	(1, 3, 'Chat A', '', 1, 0, 0, 1475527500, 0, 1475527682);
/*!40000 ALTER TABLE `mdl_chat` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_chat_messages
CREATE TABLE IF NOT EXISTS `mdl_chat_messages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmess_use_ix` (`userid`),
  KEY `mdl_chatmess_gro_ix` (`groupid`),
  KEY `mdl_chatmess_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmess_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all the actual chat messages';

-- Copiando dados para a tabela capacitacoes.mdl_chat_messages: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_chat_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_chat_messages` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_chat_messages_current
CREATE TABLE IF NOT EXISTS `mdl_chat_messages_current` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmesscurr_use_ix` (`userid`),
  KEY `mdl_chatmesscurr_gro_ix` (`groupid`),
  KEY `mdl_chatmesscurr_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmesscurr_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores current session';

-- Copiando dados para a tabela capacitacoes.mdl_chat_messages_current: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_chat_messages_current` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_chat_messages_current` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_chat_users
CREATE TABLE IF NOT EXISTS `mdl_chat_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(11) NOT NULL DEFAULT '0',
  `userid` bigint(11) NOT NULL DEFAULT '0',
  `groupid` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstping` bigint(10) NOT NULL DEFAULT '0',
  `lastping` bigint(10) NOT NULL DEFAULT '0',
  `lastmessageping` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_chatuser_use_ix` (`userid`),
  KEY `mdl_chatuser_las_ix` (`lastping`),
  KEY `mdl_chatuser_gro_ix` (`groupid`),
  KEY `mdl_chatuser_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of which users are in which chat rooms';

-- Copiando dados para a tabela capacitacoes.mdl_chat_users: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_chat_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_chat_users` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_choice
CREATE TABLE IF NOT EXISTS `mdl_choice` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `publish` tinyint(2) NOT NULL DEFAULT '0',
  `showresults` tinyint(2) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `allowupdate` tinyint(2) NOT NULL DEFAULT '0',
  `allowmultiple` tinyint(2) NOT NULL DEFAULT '0',
  `showunanswered` tinyint(2) NOT NULL DEFAULT '0',
  `includeinactive` tinyint(2) NOT NULL DEFAULT '1',
  `limitanswers` tinyint(2) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `showpreview` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choi_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Available choices are stored here';

-- Copiando dados para a tabela capacitacoes.mdl_choice: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_choice` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_choice_answers
CREATE TABLE IF NOT EXISTS `mdl_choice_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `optionid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiansw_use_ix` (`userid`),
  KEY `mdl_choiansw_cho_ix` (`choiceid`),
  KEY `mdl_choiansw_opt_ix` (`optionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='choices performed by users';

-- Copiando dados para a tabela capacitacoes.mdl_choice_answers: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_choice_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_choice_answers` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_choice_options
CREATE TABLE IF NOT EXISTS `mdl_choice_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `text` longtext COLLATE utf8_unicode_ci,
  `maxanswers` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiopti_cho_ix` (`choiceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='available options to choice';

-- Copiando dados para a tabela capacitacoes.mdl_choice_options: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_choice_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_choice_options` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_cohort
CREATE TABLE IF NOT EXISTS `mdl_cohort` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_coho_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record represents one cohort (aka site-wide group).';

-- Copiando dados para a tabela capacitacoes.mdl_cohort: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_cohort` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_cohort` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_cohort_members
CREATE TABLE IF NOT EXISTS `mdl_cohort_members` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `cohortid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cohomemb_cohuse_uix` (`cohortid`,`userid`),
  KEY `mdl_cohomemb_coh_ix` (`cohortid`),
  KEY `mdl_cohomemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a user to a cohort.';

-- Copiando dados para a tabela capacitacoes.mdl_cohort_members: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_cohort_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_cohort_members` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_comments
CREATE TABLE IF NOT EXISTS `mdl_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `commentarea` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle comments module';

-- Copiando dados para a tabela capacitacoes.mdl_comments: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_comments` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_competency
CREATE TABLE IF NOT EXISTS `mdl_competency` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(4) NOT NULL DEFAULT '0',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `competencyframeworkid` bigint(10) NOT NULL,
  `parentid` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL,
  `ruletype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ruleoutcome` tinyint(2) NOT NULL DEFAULT '0',
  `ruleconfig` longtext COLLATE utf8_unicode_ci,
  `scaleid` bigint(10) DEFAULT NULL,
  `scaleconfiguration` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_comp_comidn_uix` (`competencyframeworkid`,`idnumber`),
  KEY `mdl_comp_rul_ix` (`ruleoutcome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains the master record of each competency in ';

-- Copiando dados para a tabela capacitacoes.mdl_competency: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_competency` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_competency_coursecomp
CREATE TABLE IF NOT EXISTS `mdl_competency_coursecomp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `ruleoutcome` tinyint(2) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compcour_coucom_uix` (`courseid`,`competencyid`),
  KEY `mdl_compcour_courul_ix` (`courseid`,`ruleoutcome`),
  KEY `mdl_compcour_cou_ix` (`courseid`),
  KEY `mdl_compcour_com_ix` (`competencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a competency to a course.';

-- Copiando dados para a tabela capacitacoes.mdl_competency_coursecomp: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_competency_coursecomp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_coursecomp` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_competency_coursecompsetting
CREATE TABLE IF NOT EXISTS `mdl_competency_coursecompsetting` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `pushratingstouserplans` tinyint(2) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compcour_cou_uix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains the course specific settings for compete';

-- Copiando dados para a tabela capacitacoes.mdl_competency_coursecompsetting: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_competency_coursecompsetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_coursecompsetting` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_competency_evidence
CREATE TABLE IF NOT EXISTS `mdl_competency_evidence` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `usercompetencyid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `action` tinyint(2) NOT NULL,
  `actionuserid` bigint(10) DEFAULT NULL,
  `descidentifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `desccomponent` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `desca` longtext COLLATE utf8_unicode_ci,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grade` bigint(10) DEFAULT NULL,
  `note` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_compevid_use_ix` (`usercompetencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The evidence linked to a user competency';

-- Copiando dados para a tabela capacitacoes.mdl_competency_evidence: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_competency_evidence` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_evidence` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_competency_framework
CREATE TABLE IF NOT EXISTS `mdl_competency_framework` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contextid` bigint(10) NOT NULL,
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(4) NOT NULL DEFAULT '0',
  `scaleid` bigint(11) DEFAULT NULL,
  `scaleconfiguration` longtext COLLATE utf8_unicode_ci NOT NULL,
  `visible` tinyint(2) NOT NULL DEFAULT '1',
  `taxonomies` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compfram_idn_uix` (`idnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of competency frameworks.';

-- Copiando dados para a tabela capacitacoes.mdl_competency_framework: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_competency_framework` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_framework` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_competency_modulecomp
CREATE TABLE IF NOT EXISTS `mdl_competency_modulecomp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `cmid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `ruleoutcome` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compmodu_cmicom_uix` (`cmid`,`competencyid`),
  KEY `mdl_compmodu_cmirul_ix` (`cmid`,`ruleoutcome`),
  KEY `mdl_compmodu_cmi_ix` (`cmid`),
  KEY `mdl_compmodu_com_ix` (`competencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a competency to a module.';

-- Copiando dados para a tabela capacitacoes.mdl_competency_modulecomp: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_competency_modulecomp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_modulecomp` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_competency_plan
CREATE TABLE IF NOT EXISTS `mdl_competency_plan` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(4) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL,
  `templateid` bigint(10) DEFAULT NULL,
  `origtemplateid` bigint(10) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `duedate` bigint(10) DEFAULT '0',
  `reviewerid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_compplan_usesta_ix` (`userid`,`status`),
  KEY `mdl_compplan_tem_ix` (`templateid`),
  KEY `mdl_compplan_stadue_ix` (`status`,`duedate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Learning plans';

-- Copiando dados para a tabela capacitacoes.mdl_competency_plan: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_competency_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_plan` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_competency_plancomp
CREATE TABLE IF NOT EXISTS `mdl_competency_plancomp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `planid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `sortorder` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compplan_placom_uix` (`planid`,`competencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Plan competencies';

-- Copiando dados para a tabela capacitacoes.mdl_competency_plancomp: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_competency_plancomp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_plancomp` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_competency_relatedcomp
CREATE TABLE IF NOT EXISTS `mdl_competency_relatedcomp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `competencyid` bigint(10) NOT NULL,
  `relatedcompetencyid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Related competencies';

-- Copiando dados para a tabela capacitacoes.mdl_competency_relatedcomp: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_competency_relatedcomp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_relatedcomp` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_competency_template
CREATE TABLE IF NOT EXISTS `mdl_competency_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contextid` bigint(10) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(4) NOT NULL DEFAULT '0',
  `visible` tinyint(2) NOT NULL DEFAULT '1',
  `duedate` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Learning plan templates.';

-- Copiando dados para a tabela capacitacoes.mdl_competency_template: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_competency_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_template` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_competency_templatecohort
CREATE TABLE IF NOT EXISTS `mdl_competency_templatecohort` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `templateid` bigint(10) NOT NULL,
  `cohortid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_comptemp_temcoh_uix` (`templateid`,`cohortid`),
  KEY `mdl_comptemp_tem2_ix` (`templateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Default comment for the table, please edit me';

-- Copiando dados para a tabela capacitacoes.mdl_competency_templatecohort: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_competency_templatecohort` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_templatecohort` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_competency_templatecomp
CREATE TABLE IF NOT EXISTS `mdl_competency_templatecomp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `templateid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_comptemp_tem_ix` (`templateid`),
  KEY `mdl_comptemp_com_ix` (`competencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a competency to a learning plan template.';

-- Copiando dados para a tabela capacitacoes.mdl_competency_templatecomp: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_competency_templatecomp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_templatecomp` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_competency_usercomp
CREATE TABLE IF NOT EXISTS `mdl_competency_usercomp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `reviewerid` bigint(10) DEFAULT NULL,
  `proficiency` tinyint(2) DEFAULT NULL,
  `grade` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compuser_usecom_uix` (`userid`,`competencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='User competencies';

-- Copiando dados para a tabela capacitacoes.mdl_competency_usercomp: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_competency_usercomp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_usercomp` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_competency_usercompcourse
CREATE TABLE IF NOT EXISTS `mdl_competency_usercompcourse` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `proficiency` tinyint(2) DEFAULT NULL,
  `grade` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compuser_usecoucom_uix` (`userid`,`courseid`,`competencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='User competencies in a course';

-- Copiando dados para a tabela capacitacoes.mdl_competency_usercompcourse: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_competency_usercompcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_usercompcourse` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_competency_usercompplan
CREATE TABLE IF NOT EXISTS `mdl_competency_usercompplan` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `planid` bigint(10) NOT NULL,
  `proficiency` tinyint(2) DEFAULT NULL,
  `grade` bigint(10) DEFAULT NULL,
  `sortorder` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compuser_usecompla_uix` (`userid`,`competencyid`,`planid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='User competencies plans';

-- Copiando dados para a tabela capacitacoes.mdl_competency_usercompplan: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_competency_usercompplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_usercompplan` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_competency_userevidence
CREATE TABLE IF NOT EXISTS `mdl_competency_userevidence` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `descriptionformat` tinyint(1) NOT NULL,
  `url` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_compuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The evidence of prior learning';

-- Copiando dados para a tabela capacitacoes.mdl_competency_userevidence: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_competency_userevidence` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_userevidence` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_competency_userevidencecomp
CREATE TABLE IF NOT EXISTS `mdl_competency_userevidencecomp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userevidenceid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compuser_usecom2_uix` (`userevidenceid`,`competencyid`),
  KEY `mdl_compuser_use2_ix` (`userevidenceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Relationship between user evidence and competencies';

-- Copiando dados para a tabela capacitacoes.mdl_competency_userevidencecomp: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_competency_userevidencecomp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_userevidencecomp` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_config
CREATE TABLE IF NOT EXISTS `mdl_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_conf_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=465 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Moodle configuration variables';

-- Copiando dados para a tabela capacitacoes.mdl_config: ~482 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_config` DISABLE KEYS */;
INSERT INTO `mdl_config` (`id`, `name`, `value`) VALUES
	(2, 'rolesactive', '1'),
	(3, 'auth', 'email'),
	(4, 'auth_pop3mailbox', 'INBOX'),
	(5, 'enrol_plugins_enabled', 'manual,guest,self,cohort'),
	(6, 'theme', 'clean'),
	(7, 'filter_multilang_converted', '1'),
	(8, 'siteidentifier', 'o3UXjG7TfMSFTLwwDSfsfmNpjUMB7jIwlocalhost'),
	(9, 'backup_version', '2016052300'),
	(10, 'backup_release', '3.1'),
	(11, 'mnet_dispatcher_mode', 'off'),
	(12, 'sessiontimeout', '7200'),
	(13, 'stringfilters', ''),
	(14, 'filterall', '0'),
	(15, 'texteditors', 'atto,tinymce,textarea'),
	(16, 'antiviruses', ''),
	(17, 'upgrade_minmaxgradestepignored', '1'),
	(18, 'upgrade_extracreditweightsstepignored', '1'),
	(19, 'upgrade_calculatedgradeitemsignored', '1'),
	(20, 'upgrade_letterboundarycourses', '1'),
	(21, 'mnet_localhost_id', '1'),
	(22, 'mnet_all_hosts_id', '2'),
	(23, 'siteguest', '1'),
	(24, 'siteadmins', '2'),
	(25, 'themerev', '1475503676'),
	(26, 'jsrev', '1475503676'),
	(27, 'gdversion', '2'),
	(28, 'licenses', 'unknown,allrightsreserved,public,cc,cc-nd,cc-nc-nd,cc-nc,cc-nc-sa,cc-sa'),
	(29, 'version', '2016052302.03'),
	(30, 'enableoutcomes', '0'),
	(31, 'usecomments', '1'),
	(32, 'usetags', '1'),
	(33, 'enablenotes', '1'),
	(34, 'enableportfolios', '0'),
	(35, 'enablewebservices', '0'),
	(36, 'messaging', '1'),
	(37, 'messaginghidereadnotifications', '0'),
	(38, 'messagingdeletereadnotificationsdelay', '604800'),
	(39, 'messagingallowemailoverride', '0'),
	(40, 'enablestats', '0'),
	(41, 'enablerssfeeds', '0'),
	(42, 'enableblogs', '1'),
	(43, 'enablecompletion', '1'),
	(44, 'completiondefault', '1'),
	(45, 'enableavailability', '1'),
	(46, 'enableplagiarism', '0'),
	(47, 'enablebadges', '1'),
	(48, 'enableglobalsearch', '0'),
	(49, 'defaultpreference_maildisplay', '2'),
	(50, 'defaultpreference_mailformat', '1'),
	(51, 'defaultpreference_maildigest', '0'),
	(52, 'defaultpreference_autosubscribe', '1'),
	(53, 'defaultpreference_trackforums', '0'),
	(54, 'autologinguests', '0'),
	(55, 'hiddenuserfields', ''),
	(56, 'showuseridentity', 'email'),
	(57, 'fullnamedisplay', 'language'),
	(58, 'alternativefullnameformat', 'language'),
	(59, 'maxusersperpage', '100'),
	(60, 'enablegravatar', '0'),
	(61, 'gravatardefaulturl', 'mm'),
	(62, 'enablecourserequests', '0'),
	(63, 'defaultrequestcategory', '1'),
	(64, 'requestcategoryselection', '0'),
	(65, 'courserequestnotify', ''),
	(66, 'grade_profilereport', 'user'),
	(67, 'grade_aggregationposition', '1'),
	(68, 'grade_includescalesinaggregation', '1'),
	(69, 'grade_hiddenasdate', '0'),
	(70, 'gradepublishing', '0'),
	(71, 'grade_export_displaytype', '1'),
	(72, 'grade_export_decimalpoints', '2'),
	(73, 'grade_navmethod', '0'),
	(74, 'grade_export_userprofilefields', 'firstname,lastname,idnumber,institution,department,email'),
	(75, 'grade_export_customprofilefields', ''),
	(76, 'recovergradesdefault', '0'),
	(77, 'gradeexport', ''),
	(78, 'unlimitedgrades', '0'),
	(79, 'grade_report_showmin', '1'),
	(80, 'gradepointmax', '100'),
	(81, 'gradepointdefault', '100'),
	(82, 'grade_minmaxtouse', '1'),
	(83, 'grade_mygrades_report', 'overview'),
	(84, 'gradereport_mygradeurl', ''),
	(85, 'grade_hideforcedsettings', '1'),
	(86, 'grade_aggregation', '13'),
	(87, 'grade_aggregation_flag', '0'),
	(88, 'grade_aggregations_visible', '13'),
	(89, 'grade_aggregateonlygraded', '1'),
	(90, 'grade_aggregateonlygraded_flag', '2'),
	(91, 'grade_aggregateoutcomes', '0'),
	(92, 'grade_aggregateoutcomes_flag', '2'),
	(93, 'grade_keephigh', '0'),
	(94, 'grade_keephigh_flag', '3'),
	(95, 'grade_droplow', '0'),
	(96, 'grade_droplow_flag', '2'),
	(97, 'grade_overridecat', '1'),
	(98, 'grade_displaytype', '1'),
	(99, 'grade_decimalpoints', '2'),
	(100, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime'),
	(101, 'grade_report_studentsperpage', '100'),
	(102, 'grade_report_showonlyactiveenrol', '1'),
	(103, 'grade_report_quickgrading', '1'),
	(104, 'grade_report_showquickfeedback', '0'),
	(105, 'grade_report_meanselection', '1'),
	(106, 'grade_report_enableajax', '0'),
	(107, 'grade_report_showcalculations', '1'),
	(108, 'grade_report_showeyecons', '0'),
	(109, 'grade_report_showaverages', '1'),
	(110, 'grade_report_showlocks', '0'),
	(111, 'grade_report_showranges', '0'),
	(112, 'grade_report_showanalysisicon', '1'),
	(113, 'grade_report_showuserimage', '1'),
	(114, 'grade_report_showactivityicons', '1'),
	(115, 'grade_report_shownumberofgrades', '0'),
	(116, 'grade_report_averagesdisplaytype', 'inherit'),
	(117, 'grade_report_rangesdisplaytype', 'inherit'),
	(118, 'grade_report_averagesdecimalpoints', 'inherit'),
	(119, 'grade_report_rangesdecimalpoints', 'inherit'),
	(120, 'grade_report_historyperpage', '50'),
	(121, 'grade_report_overview_showrank', '0'),
	(122, 'grade_report_overview_showtotalsifcontainhidden', '0'),
	(123, 'grade_report_user_showrank', '0'),
	(124, 'grade_report_user_showpercentage', '1'),
	(125, 'grade_report_user_showgrade', '1'),
	(126, 'grade_report_user_showfeedback', '1'),
	(127, 'grade_report_user_showrange', '1'),
	(128, 'grade_report_user_showweight', '1'),
	(129, 'grade_report_user_showaverage', '0'),
	(130, 'grade_report_user_showlettergrade', '0'),
	(131, 'grade_report_user_rangedecimals', '0'),
	(132, 'grade_report_user_showhiddenitems', '1'),
	(133, 'grade_report_user_showtotalsifcontainhidden', '0'),
	(134, 'grade_report_user_showcontributiontocoursetotal', '1'),
	(135, 'badges_defaultissuername', ''),
	(136, 'badges_defaultissuercontact', ''),
	(137, 'badges_badgesalt', 'badges1475503294'),
	(138, 'badges_allowexternalbackpack', '1'),
	(139, 'badges_allowcoursebadges', '1'),
	(141, 'forcetimezone', '99'),
	(142, 'country', '0'),
	(143, 'defaultcity', ''),
	(144, 'geoipfile', '/home/rupertlustosa/Área de Trabalho/moodledata/geoip/GeoLiteCity.dat'),
	(145, 'googlemapkey3', ''),
	(146, 'allcountrycodes', ''),
	(147, 'autolang', '1'),
	(148, 'lang', 'pt_br'),
	(149, 'langmenu', '1'),
	(150, 'langlist', ''),
	(151, 'langrev', '1475503676'),
	(152, 'langcache', '1'),
	(153, 'langstringcache', '1'),
	(154, 'locale', ''),
	(155, 'latinexcelexport', '0'),
	(156, 'requiremodintro', '0'),
	(158, 'authloginviaemail', '0'),
	(159, 'allowaccountssameemail', '0'),
	(160, 'authpreventaccountcreation', '0'),
	(161, 'loginpageautofocus', '0'),
	(162, 'guestloginbutton', '1'),
	(163, 'limitconcurrentlogins', '0'),
	(164, 'alternateloginurl', ''),
	(165, 'forgottenpasswordurl', ''),
	(166, 'auth_instructions', ''),
	(167, 'allowemailaddresses', ''),
	(168, 'denyemailaddresses', ''),
	(169, 'verifychangedemail', '1'),
	(170, 'recaptchapublickey', ''),
	(171, 'recaptchaprivatekey', ''),
	(172, 'filteruploadedfiles', '0'),
	(173, 'filtermatchoneperpage', '0'),
	(174, 'filtermatchonepertext', '0'),
	(175, 'sitedefaultlicense', 'allrightsreserved'),
	(176, 'searchengine', 'solr'),
	(177, 'portfolio_moderate_filesize_threshold', '1048576'),
	(178, 'portfolio_high_filesize_threshold', '5242880'),
	(179, 'portfolio_moderate_db_threshold', '20'),
	(180, 'portfolio_high_db_threshold', '50'),
	(181, 'repositorycacheexpire', '120'),
	(182, 'repositorygetfiletimeout', '30'),
	(183, 'repositorysyncfiletimeout', '1'),
	(184, 'repositorysyncimagetimeout', '3'),
	(185, 'repositoryallowexternallinks', '1'),
	(186, 'legacyfilesinnewcourses', '0'),
	(187, 'legacyfilesaddallowed', '1'),
	(188, 'mobilecssurl', ''),
	(189, 'enablewsdocumentation', '0'),
	(190, 'allowbeforeblock', '0'),
	(191, 'allowedip', ''),
	(192, 'blockedip', ''),
	(193, 'protectusernames', '1'),
	(194, 'forcelogin', '0'),
	(195, 'forceloginforprofiles', '1'),
	(196, 'forceloginforprofileimage', '0'),
	(197, 'opentogoogle', '0'),
	(198, 'maxbytes', '0'),
	(199, 'userquota', '104857600'),
	(200, 'allowobjectembed', '0'),
	(201, 'enabletrusttext', '0'),
	(202, 'maxeditingtime', '1800'),
	(203, 'extendedusernamechars', '0'),
	(204, 'sitepolicy', ''),
	(205, 'sitepolicyguest', ''),
	(206, 'keeptagnamecase', '1'),
	(207, 'profilesforenrolledusersonly', '1'),
	(208, 'cronclionly', '1'),
	(209, 'cronremotepassword', ''),
	(210, 'lockoutthreshold', '0'),
	(211, 'lockoutwindow', '1800'),
	(212, 'lockoutduration', '1800'),
	(213, 'passwordpolicy', '1'),
	(214, 'minpasswordlength', '4'),
	(215, 'minpassworddigits', '0'),
	(216, 'minpasswordlower', '0'),
	(217, 'minpasswordupper', '0'),
	(218, 'minpasswordnonalphanum', '0'),
	(219, 'maxconsecutiveidentchars', '0'),
	(220, 'passwordreuselimit', '0'),
	(221, 'pwresettime', '1800'),
	(222, 'passwordchangelogout', '0'),
	(223, 'groupenrolmentkeypolicy', '1'),
	(224, 'disableuserimages', '0'),
	(225, 'emailchangeconfirmation', '1'),
	(226, 'rememberusername', '2'),
	(227, 'strictformsrequired', '0'),
	(228, 'loginhttps', '0'),
	(229, 'cookiesecure', '1'),
	(230, 'cookiehttponly', '0'),
	(231, 'allowframembedding', '0'),
	(232, 'loginpasswordautocomplete', '0'),
	(233, 'displayloginfailures', '0'),
	(234, 'notifyloginfailures', ''),
	(235, 'notifyloginthreshold', '10'),
	(236, 'themelist', ''),
	(237, 'themedesignermode', '0'),
	(238, 'allowuserthemes', '0'),
	(239, 'allowcoursethemes', '0'),
	(240, 'allowcategorythemes', '0'),
	(241, 'allowthemechangeonurl', '0'),
	(242, 'allowuserblockhiding', '1'),
	(243, 'allowblockstodock', '1'),
	(244, 'custommenuitems', ''),
	(245, 'customusermenuitems', 'grades,grades|/grade/report/mygrades.php|grades\nmessages,message|/message/index.php|message\npreferences,moodle|/user/preferences.php|preferences'),
	(246, 'enabledevicedetection', '1'),
	(247, 'devicedetectregex', '[]'),
	(248, 'calendartype', 'gregorian'),
	(249, 'calendar_adminseesall', '0'),
	(250, 'calendar_site_timeformat', '0'),
	(251, 'calendar_startwday', '1'),
	(252, 'calendar_weekend', '65'),
	(253, 'calendar_lookahead', '21'),
	(254, 'calendar_maxevents', '10'),
	(255, 'enablecalendarexport', '1'),
	(256, 'calendar_customexport', '1'),
	(257, 'calendar_exportlookahead', '365'),
	(258, 'calendar_exportlookback', '5'),
	(259, 'calendar_exportsalt', 'sEt60P87WFIWK1n4rZ7p8KD3CZ4Al4dMbhJV7GjnY3HjINeVPkGu5tYwz15f'),
	(260, 'calendar_showicalsource', '1'),
	(261, 'useblogassociations', '1'),
	(262, 'bloglevel', '4'),
	(263, 'useexternalblogs', '1'),
	(264, 'externalblogcrontime', '86400'),
	(265, 'maxexternalblogsperuser', '1'),
	(266, 'blogusecomments', '1'),
	(267, 'blogshowcommentscount', '1'),
	(268, 'defaulthomepage', '0'),
	(269, 'allowguestmymoodle', '1'),
	(270, 'navshowfullcoursenames', '0'),
	(271, 'navshowcategories', '1'),
	(272, 'navshowmycoursecategories', '0'),
	(273, 'navshowallcourses', '0'),
	(274, 'navexpandmycourses', '1'),
	(275, 'navsortmycoursessort', 'sortorder'),
	(276, 'navcourselimit', '20'),
	(277, 'usesitenameforsitepages', '0'),
	(278, 'linkadmincategories', '0'),
	(279, 'linkcoursesections', '0'),
	(280, 'navshowfrontpagemods', '1'),
	(281, 'navadduserpostslinks', '1'),
	(282, 'formatstringstriptags', '1'),
	(283, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]'),
	(284, 'core_media_enable_youtube', '1'),
	(285, 'core_media_enable_vimeo', '0'),
	(286, 'core_media_enable_mp3', '1'),
	(287, 'core_media_enable_flv', '1'),
	(288, 'core_media_enable_swf', '1'),
	(289, 'core_media_enable_html5audio', '1'),
	(290, 'core_media_enable_html5video', '1'),
	(291, 'core_media_enable_qt', '1'),
	(292, 'core_media_enable_wmp', '1'),
	(293, 'core_media_enable_rm', '1'),
	(294, 'docroot', 'http://docs.moodle.org'),
	(295, 'doclang', ''),
	(296, 'doctonewwindow', '0'),
	(297, 'courselistshortnames', '0'),
	(298, 'coursesperpage', '20'),
	(299, 'courseswithsummarieslimit', '10'),
	(300, 'courseoverviewfileslimit', '1'),
	(301, 'courseoverviewfilesext', '.jpg,.gif,.png'),
	(302, 'useexternalyui', '0'),
	(303, 'yuicomboloading', '1'),
	(304, 'cachejs', '1'),
	(305, 'modchooserdefault', '1'),
	(306, 'modeditingmenu', '1'),
	(307, 'blockeditingmenu', '1'),
	(308, 'additionalhtmlhead', ''),
	(309, 'additionalhtmltopofbody', ''),
	(310, 'additionalhtmlfooter', ''),
	(311, 'pathtodu', ''),
	(312, 'aspellpath', ''),
	(313, 'pathtodot', ''),
	(314, 'pathtogs', '/usr/bin/gs'),
	(315, 'pathtounoconv', '/usr/bin/unoconv'),
	(316, 'supportname', 'Administrador Usuário'),
	(317, 'supportemail', ''),
	(318, 'supportpage', ''),
	(319, 'dbsessions', '0'),
	(320, 'sessioncookie', ''),
	(321, 'sessioncookiepath', ''),
	(322, 'sessioncookiedomain', ''),
	(323, 'statsfirstrun', 'none'),
	(324, 'statsmaxruntime', '0'),
	(325, 'statsruntimedays', '31'),
	(326, 'statsuserthreshold', '0'),
	(327, 'slasharguments', '1'),
	(328, 'getremoteaddrconf', '0'),
	(329, 'proxyhost', ''),
	(330, 'proxyport', '0'),
	(331, 'proxytype', 'HTTP'),
	(332, 'proxyuser', ''),
	(333, 'proxypassword', ''),
	(334, 'proxybypass', 'localhost, 127.0.0.1'),
	(335, 'maintenance_enabled', '0'),
	(336, 'maintenance_message', ''),
	(337, 'deleteunconfirmed', '168'),
	(338, 'deleteincompleteusers', '0'),
	(339, 'disablegradehistory', '0'),
	(340, 'gradehistorylifetime', '0'),
	(341, 'tempdatafoldercleanup', '168'),
	(342, 'extramemorylimit', '512M'),
	(343, 'maxtimelimit', '0'),
	(344, 'curlcache', '120'),
	(345, 'curltimeoutkbitrate', '56'),
	(346, 'updateautocheck', '1'),
	(347, 'updateminmaturity', '200'),
	(348, 'updatenotifybuilds', '0'),
	(349, 'enablesafebrowserintegration', '0'),
	(350, 'dndallowtextandlinks', '0'),
	(351, 'enablecssoptimiser', '0'),
	(352, 'debug', '0'),
	(353, 'debugdisplay', '1'),
	(354, 'debugsmtp', '0'),
	(355, 'perfdebug', '7'),
	(356, 'debugstringids', '0'),
	(357, 'debugvalidators', '0'),
	(358, 'debugpageinfo', '0'),
	(359, 'profilingenabled', '0'),
	(360, 'profilingincluded', ''),
	(361, 'profilingexcluded', ''),
	(362, 'profilingautofrec', '0'),
	(363, 'profilingallowme', '0'),
	(364, 'profilingallowall', '0'),
	(365, 'profilinglifetime', '1440'),
	(366, 'profilingimportprefix', '(I)'),
	(367, 'release', '3.1.2+ (Build: 20160923)'),
	(368, 'branch', '31'),
	(369, 'localcachedirpurged', '1475503676'),
	(370, 'scheduledtaskreset', '1475503676'),
	(371, 'allversionshash', '130f01f70e0435beddf71d57dc3c7cdeef468ab9'),
	(373, 'notloggedinroleid', '6'),
	(374, 'guestroleid', '6'),
	(375, 'defaultuserroleid', '7'),
	(376, 'creatornewroleid', '3'),
	(377, 'restorernewroleid', '3'),
	(378, 'gradebookroles', '5'),
	(379, 'chat_method', 'ajax'),
	(380, 'chat_refresh_userlist', '10'),
	(381, 'chat_old_ping', '35'),
	(382, 'chat_refresh_room', '5'),
	(383, 'chat_normal_updatemode', 'jsupdate'),
	(384, 'chat_serverhost', 'localhost'),
	(385, 'chat_serverip', '127.0.0.1'),
	(386, 'chat_serverport', '9111'),
	(387, 'chat_servermax', '100'),
	(388, 'data_enablerssfeeds', '0'),
	(389, 'feedback_allowfullanonymous', '0'),
	(390, 'forum_displaymode', '3'),
	(391, 'forum_replytouser', '1'),
	(392, 'forum_shortpost', '300'),
	(393, 'forum_longpost', '600'),
	(394, 'forum_manydiscussions', '100'),
	(395, 'forum_maxbytes', '512000'),
	(396, 'forum_maxattachments', '9'),
	(397, 'forum_trackingtype', '1'),
	(398, 'forum_trackreadposts', '1'),
	(399, 'forum_allowforcedreadtracking', '0'),
	(400, 'forum_oldpostdays', '14'),
	(401, 'forum_usermarksread', '0'),
	(402, 'forum_cleanreadtime', '2'),
	(403, 'digestmailtime', '17'),
	(404, 'forum_enablerssfeeds', '0'),
	(405, 'forum_enabletimedposts', '1'),
	(406, 'glossary_entbypage', '10'),
	(407, 'glossary_dupentries', '0'),
	(408, 'glossary_allowcomments', '0'),
	(409, 'glossary_linkbydefault', '1'),
	(410, 'glossary_defaultapproval', '1'),
	(411, 'glossary_enablerssfeeds', '0'),
	(412, 'glossary_linkentries', '0'),
	(413, 'glossary_casesensitive', '0'),
	(414, 'glossary_fullmatch', '0'),
	(415, 'block_course_list_adminview', 'all'),
	(416, 'block_course_list_hideallcourseslink', '0'),
	(417, 'block_html_allowcssclasses', '0'),
	(418, 'block_online_users_timetosee', '5'),
	(419, 'block_rss_client_num_entries', '5'),
	(420, 'block_rss_client_timeout', '30'),
	(421, 'filter_censor_badwords', ''),
	(422, 'filter_multilang_force_old', '0'),
	(423, 'logguests', '1'),
	(424, 'loglifetime', '0'),
	(425, 'airnotifierurl', 'https://messages.moodle.net'),
	(426, 'airnotifierport', '443'),
	(427, 'airnotifiermobileappname', 'com.moodle.moodlemobile'),
	(428, 'airnotifierappname', 'commoodlemoodlemobile'),
	(429, 'airnotifieraccesskey', ''),
	(430, 'smtphosts', ''),
	(431, 'smtpsecure', ''),
	(432, 'smtpauthtype', 'LOGIN'),
	(433, 'smtpuser', ''),
	(434, 'smtppass', ''),
	(435, 'smtpmaxbulk', '1'),
	(436, 'noreplyaddress', 'noreply@localhost'),
	(437, 'emailonlyfromnoreplyaddress', '0'),
	(438, 'sitemailcharset', '0'),
	(439, 'allowusermailcharset', '0'),
	(440, 'allowattachments', '1'),
	(441, 'mailnewline', 'LF'),
	(442, 'jabberhost', ''),
	(443, 'jabberserver', ''),
	(444, 'jabberusername', ''),
	(445, 'jabberpassword', ''),
	(446, 'jabberport', '5222'),
	(447, 'enablemobilewebservice', '0'),
	(448, 'profileroles', '3,4,5'),
	(449, 'coursecontact', '3'),
	(450, 'frontpage', ''),
	(451, 'frontpageloggedin', '4'),
	(452, 'maxcategorydepth', '2'),
	(453, 'frontpagecourselimit', '200'),
	(454, 'commentsperpage', '15'),
	(455, 'defaultfrontpageroleid', '8'),
	(456, 'messageinbound_enabled', '0'),
	(457, 'messageinbound_mailbox', ''),
	(458, 'messageinbound_domain', ''),
	(459, 'messageinbound_host', ''),
	(460, 'messageinbound_hostssl', 'ssl'),
	(461, 'messageinbound_hostuser', ''),
	(462, 'messageinbound_hostpass', ''),
	(463, 'timezone', 'America/Sao_Paulo'),
	(464, 'registerauth', '');
/*!40000 ALTER TABLE `mdl_config` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_config_log
CREATE TABLE IF NOT EXISTS `mdl_config_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `plugin` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  `oldvalue` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_conflog_tim_ix` (`timemodified`),
  KEY `mdl_conflog_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=1022 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Changes done in server configuration through admin UI';

-- Copiando dados para a tabela capacitacoes.mdl_config_log: ~1.229 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_config_log` DISABLE KEYS */;
INSERT INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
	(1, 0, 1475503346, NULL, 'enableoutcomes', '0', NULL),
	(2, 0, 1475503346, NULL, 'usecomments', '1', NULL),
	(3, 0, 1475503346, NULL, 'usetags', '1', NULL),
	(4, 0, 1475503346, NULL, 'enablenotes', '1', NULL),
	(5, 0, 1475503346, NULL, 'enableportfolios', '0', NULL),
	(6, 0, 1475503346, NULL, 'enablewebservices', '0', NULL),
	(7, 0, 1475503346, NULL, 'messaging', '1', NULL),
	(8, 0, 1475503347, NULL, 'messaginghidereadnotifications', '0', NULL),
	(9, 0, 1475503347, NULL, 'messagingdeletereadnotificationsdelay', '604800', NULL),
	(10, 0, 1475503347, NULL, 'messagingallowemailoverride', '0', NULL),
	(11, 0, 1475503347, NULL, 'enablestats', '0', NULL),
	(12, 0, 1475503347, NULL, 'enablerssfeeds', '0', NULL),
	(13, 0, 1475503347, NULL, 'enableblogs', '1', NULL),
	(14, 0, 1475503347, NULL, 'enablecompletion', '1', NULL),
	(15, 0, 1475503347, NULL, 'completiondefault', '1', NULL),
	(16, 0, 1475503347, NULL, 'enableavailability', '1', NULL),
	(17, 0, 1475503347, NULL, 'enableplagiarism', '0', NULL),
	(18, 0, 1475503347, NULL, 'enablebadges', '1', NULL),
	(19, 0, 1475503347, NULL, 'enableglobalsearch', '0', NULL),
	(20, 0, 1475503347, NULL, 'defaultpreference_maildisplay', '2', NULL),
	(21, 0, 1475503348, NULL, 'defaultpreference_mailformat', '1', NULL),
	(22, 0, 1475503348, NULL, 'defaultpreference_maildigest', '0', NULL),
	(23, 0, 1475503348, NULL, 'defaultpreference_autosubscribe', '1', NULL),
	(24, 0, 1475503348, NULL, 'defaultpreference_trackforums', '0', NULL),
	(25, 0, 1475503348, NULL, 'autologinguests', '0', NULL),
	(26, 0, 1475503348, NULL, 'hiddenuserfields', '', NULL),
	(27, 0, 1475503348, NULL, 'showuseridentity', 'email', NULL),
	(28, 0, 1475503348, NULL, 'fullnamedisplay', 'language', NULL),
	(29, 0, 1475503348, NULL, 'alternativefullnameformat', 'language', NULL),
	(30, 0, 1475503348, NULL, 'maxusersperpage', '100', NULL),
	(31, 0, 1475503348, NULL, 'enablegravatar', '0', NULL),
	(32, 0, 1475503348, NULL, 'gravatardefaulturl', 'mm', NULL),
	(33, 0, 1475503348, 'moodlecourse', 'visible', '1', NULL),
	(34, 0, 1475503349, 'moodlecourse', 'format', 'weeks', NULL),
	(35, 0, 1475503349, 'moodlecourse', 'maxsections', '52', NULL),
	(36, 0, 1475503349, 'moodlecourse', 'numsections', '10', NULL),
	(37, 0, 1475503349, 'moodlecourse', 'hiddensections', '0', NULL),
	(38, 0, 1475503349, 'moodlecourse', 'coursedisplay', '0', NULL),
	(39, 0, 1475503349, 'moodlecourse', 'lang', '', NULL),
	(40, 0, 1475503349, 'moodlecourse', 'newsitems', '5', NULL),
	(41, 0, 1475503349, 'moodlecourse', 'showgrades', '1', NULL),
	(42, 0, 1475503349, 'moodlecourse', 'showreports', '0', NULL),
	(43, 0, 1475503349, 'moodlecourse', 'maxbytes', '0', NULL),
	(44, 0, 1475503349, 'moodlecourse', 'enablecompletion', '0', NULL),
	(45, 0, 1475503349, 'moodlecourse', 'groupmode', '0', NULL),
	(46, 0, 1475503349, 'moodlecourse', 'groupmodeforce', '0', NULL),
	(47, 0, 1475503350, NULL, 'enablecourserequests', '0', NULL),
	(48, 0, 1475503350, NULL, 'defaultrequestcategory', '1', NULL),
	(49, 0, 1475503350, NULL, 'requestcategoryselection', '0', NULL),
	(50, 0, 1475503350, NULL, 'courserequestnotify', '', NULL),
	(51, 0, 1475503350, 'backup', 'loglifetime', '30', NULL),
	(52, 0, 1475503350, 'backup', 'backup_general_users', '1', NULL),
	(53, 0, 1475503350, 'backup', 'backup_general_users_locked', '', NULL),
	(54, 0, 1475503350, 'backup', 'backup_general_anonymize', '0', NULL),
	(55, 0, 1475503350, 'backup', 'backup_general_anonymize_locked', '', NULL),
	(56, 0, 1475503350, 'backup', 'backup_general_role_assignments', '1', NULL),
	(57, 0, 1475503351, 'backup', 'backup_general_role_assignments_locked', '', NULL),
	(58, 0, 1475503351, 'backup', 'backup_general_activities', '1', NULL),
	(59, 0, 1475503351, 'backup', 'backup_general_activities_locked', '', NULL),
	(60, 0, 1475503351, 'backup', 'backup_general_blocks', '1', NULL),
	(61, 0, 1475503351, 'backup', 'backup_general_blocks_locked', '', NULL),
	(62, 0, 1475503351, 'backup', 'backup_general_filters', '1', NULL),
	(63, 0, 1475503351, 'backup', 'backup_general_filters_locked', '', NULL),
	(64, 0, 1475503351, 'backup', 'backup_general_comments', '1', NULL),
	(65, 0, 1475503351, 'backup', 'backup_general_comments_locked', '', NULL),
	(66, 0, 1475503351, 'backup', 'backup_general_badges', '1', NULL),
	(67, 0, 1475503351, 'backup', 'backup_general_badges_locked', '', NULL),
	(68, 0, 1475503351, 'backup', 'backup_general_userscompletion', '1', NULL),
	(69, 0, 1475503351, 'backup', 'backup_general_userscompletion_locked', '', NULL),
	(70, 0, 1475503352, 'backup', 'backup_general_logs', '0', NULL),
	(71, 0, 1475503352, 'backup', 'backup_general_logs_locked', '', NULL),
	(72, 0, 1475503352, 'backup', 'backup_general_histories', '0', NULL),
	(73, 0, 1475503352, 'backup', 'backup_general_histories_locked', '', NULL),
	(74, 0, 1475503352, 'backup', 'backup_general_questionbank', '1', NULL),
	(75, 0, 1475503352, 'backup', 'backup_general_questionbank_locked', '', NULL),
	(76, 0, 1475503352, 'backup', 'backup_general_groups', '1', NULL),
	(77, 0, 1475503352, 'backup', 'backup_general_groups_locked', '', NULL),
	(78, 0, 1475503352, 'backup', 'import_general_maxresults', '10', NULL),
	(79, 0, 1475503352, 'backup', 'import_general_duplicate_admin_allowed', '0', NULL),
	(80, 0, 1475503352, 'backup', 'backup_auto_active', '0', NULL),
	(81, 0, 1475503352, 'backup', 'backup_auto_weekdays', '0000000', NULL),
	(82, 0, 1475503352, 'backup', 'backup_auto_hour', '0', NULL),
	(83, 0, 1475503353, 'backup', 'backup_auto_minute', '0', NULL),
	(84, 0, 1475503353, 'backup', 'backup_auto_storage', '0', NULL),
	(85, 0, 1475503353, 'backup', 'backup_auto_destination', '', NULL),
	(86, 0, 1475503353, 'backup', 'backup_auto_max_kept', '1', NULL),
	(87, 0, 1475503353, 'backup', 'backup_auto_delete_days', '0', NULL),
	(88, 0, 1475503353, 'backup', 'backup_auto_min_kept', '0', NULL),
	(89, 0, 1475503353, 'backup', 'backup_shortname', '0', NULL),
	(90, 0, 1475503353, 'backup', 'backup_auto_skip_hidden', '1', NULL),
	(91, 0, 1475503353, 'backup', 'backup_auto_skip_modif_days', '30', NULL),
	(92, 0, 1475503353, 'backup', 'backup_auto_skip_modif_prev', '0', NULL),
	(93, 0, 1475503353, 'backup', 'backup_auto_users', '1', NULL),
	(94, 0, 1475503353, 'backup', 'backup_auto_role_assignments', '1', NULL),
	(95, 0, 1475503354, 'backup', 'backup_auto_activities', '1', NULL),
	(96, 0, 1475503354, 'backup', 'backup_auto_blocks', '1', NULL),
	(97, 0, 1475503354, 'backup', 'backup_auto_filters', '1', NULL),
	(98, 0, 1475503354, 'backup', 'backup_auto_comments', '1', NULL),
	(99, 0, 1475503354, 'backup', 'backup_auto_badges', '1', NULL),
	(100, 0, 1475503354, 'backup', 'backup_auto_userscompletion', '1', NULL),
	(101, 0, 1475503354, 'backup', 'backup_auto_logs', '0', NULL),
	(102, 0, 1475503354, 'backup', 'backup_auto_histories', '0', NULL),
	(103, 0, 1475503354, 'backup', 'backup_auto_questionbank', '1', NULL),
	(104, 0, 1475503354, 'backup', 'backup_auto_groups', '1', NULL),
	(105, 0, 1475503355, NULL, 'grade_profilereport', 'user', NULL),
	(106, 0, 1475503355, NULL, 'grade_aggregationposition', '1', NULL),
	(107, 0, 1475503355, NULL, 'grade_includescalesinaggregation', '1', NULL),
	(108, 0, 1475503355, NULL, 'grade_hiddenasdate', '0', NULL),
	(109, 0, 1475503355, NULL, 'gradepublishing', '0', NULL),
	(110, 0, 1475503355, NULL, 'grade_export_displaytype', '1', NULL),
	(111, 0, 1475503355, NULL, 'grade_export_decimalpoints', '2', NULL),
	(112, 0, 1475503355, NULL, 'grade_navmethod', '0', NULL),
	(113, 0, 1475503356, NULL, 'grade_export_userprofilefields', 'firstname,lastname,idnumber,institution,department,email', NULL),
	(114, 0, 1475503356, NULL, 'grade_export_customprofilefields', '', NULL),
	(115, 0, 1475503356, NULL, 'recovergradesdefault', '0', NULL),
	(116, 0, 1475503356, NULL, 'gradeexport', '', NULL),
	(117, 0, 1475503356, NULL, 'unlimitedgrades', '0', NULL),
	(118, 0, 1475503356, NULL, 'grade_report_showmin', '1', NULL),
	(119, 0, 1475503356, NULL, 'gradepointmax', '100', NULL),
	(120, 0, 1475503356, NULL, 'gradepointdefault', '100', NULL),
	(121, 0, 1475503356, NULL, 'grade_minmaxtouse', '1', NULL),
	(122, 0, 1475503356, NULL, 'grade_mygrades_report', 'overview', NULL),
	(123, 0, 1475503356, NULL, 'gradereport_mygradeurl', '', NULL),
	(124, 0, 1475503357, NULL, 'grade_hideforcedsettings', '1', NULL),
	(125, 0, 1475503357, NULL, 'grade_aggregation', '13', NULL),
	(126, 0, 1475503357, NULL, 'grade_aggregation_flag', '0', NULL),
	(127, 0, 1475503357, NULL, 'grade_aggregations_visible', '13', NULL),
	(128, 0, 1475503357, NULL, 'grade_aggregateonlygraded', '1', NULL),
	(129, 0, 1475503357, NULL, 'grade_aggregateonlygraded_flag', '2', NULL),
	(130, 0, 1475503357, NULL, 'grade_aggregateoutcomes', '0', NULL),
	(131, 0, 1475503357, NULL, 'grade_aggregateoutcomes_flag', '2', NULL),
	(132, 0, 1475503357, NULL, 'grade_keephigh', '0', NULL),
	(133, 0, 1475503357, NULL, 'grade_keephigh_flag', '3', NULL),
	(134, 0, 1475503357, NULL, 'grade_droplow', '0', NULL),
	(135, 0, 1475503357, NULL, 'grade_droplow_flag', '2', NULL),
	(136, 0, 1475503357, NULL, 'grade_overridecat', '1', NULL),
	(137, 0, 1475503357, NULL, 'grade_displaytype', '1', NULL),
	(138, 0, 1475503358, NULL, 'grade_decimalpoints', '2', NULL),
	(139, 0, 1475503358, NULL, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime', NULL),
	(140, 0, 1475503358, NULL, 'grade_report_studentsperpage', '100', NULL),
	(141, 0, 1475503358, NULL, 'grade_report_showonlyactiveenrol', '1', NULL),
	(142, 0, 1475503358, NULL, 'grade_report_quickgrading', '1', NULL),
	(143, 0, 1475503358, NULL, 'grade_report_showquickfeedback', '0', NULL),
	(144, 0, 1475503358, NULL, 'grade_report_meanselection', '1', NULL),
	(145, 0, 1475503358, NULL, 'grade_report_enableajax', '0', NULL),
	(146, 0, 1475503358, NULL, 'grade_report_showcalculations', '1', NULL),
	(147, 0, 1475503358, NULL, 'grade_report_showeyecons', '0', NULL),
	(148, 0, 1475503358, NULL, 'grade_report_showaverages', '1', NULL),
	(149, 0, 1475503358, NULL, 'grade_report_showlocks', '0', NULL),
	(150, 0, 1475503358, NULL, 'grade_report_showranges', '0', NULL),
	(151, 0, 1475503358, NULL, 'grade_report_showanalysisicon', '1', NULL),
	(152, 0, 1475503359, NULL, 'grade_report_showuserimage', '1', NULL),
	(153, 0, 1475503359, NULL, 'grade_report_showactivityicons', '1', NULL),
	(154, 0, 1475503359, NULL, 'grade_report_shownumberofgrades', '0', NULL),
	(155, 0, 1475503359, NULL, 'grade_report_averagesdisplaytype', 'inherit', NULL),
	(156, 0, 1475503359, NULL, 'grade_report_rangesdisplaytype', 'inherit', NULL),
	(157, 0, 1475503359, NULL, 'grade_report_averagesdecimalpoints', 'inherit', NULL),
	(158, 0, 1475503359, NULL, 'grade_report_rangesdecimalpoints', 'inherit', NULL),
	(159, 0, 1475503359, NULL, 'grade_report_historyperpage', '50', NULL),
	(160, 0, 1475503359, NULL, 'grade_report_overview_showrank', '0', NULL),
	(161, 0, 1475503359, NULL, 'grade_report_overview_showtotalsifcontainhidden', '0', NULL),
	(162, 0, 1475503359, NULL, 'grade_report_user_showrank', '0', NULL),
	(163, 0, 1475503360, NULL, 'grade_report_user_showpercentage', '1', NULL),
	(164, 0, 1475503360, NULL, 'grade_report_user_showgrade', '1', NULL),
	(165, 0, 1475503360, NULL, 'grade_report_user_showfeedback', '1', NULL),
	(166, 0, 1475503360, NULL, 'grade_report_user_showrange', '1', NULL),
	(167, 0, 1475503360, NULL, 'grade_report_user_showweight', '1', NULL),
	(168, 0, 1475503360, NULL, 'grade_report_user_showaverage', '0', NULL),
	(169, 0, 1475503360, NULL, 'grade_report_user_showlettergrade', '0', NULL),
	(170, 0, 1475503360, NULL, 'grade_report_user_rangedecimals', '0', NULL),
	(171, 0, 1475503360, NULL, 'grade_report_user_showhiddenitems', '1', NULL),
	(172, 0, 1475503360, NULL, 'grade_report_user_showtotalsifcontainhidden', '0', NULL),
	(173, 0, 1475503360, NULL, 'grade_report_user_showcontributiontocoursetotal', '1', NULL),
	(174, 0, 1475503360, 'core_competency', 'enabled', '1', NULL),
	(175, 0, 1475503360, 'core_competency', 'pushcourseratingstouserplans', '1', NULL),
	(176, 0, 1475503361, NULL, 'badges_defaultissuername', '', NULL),
	(177, 0, 1475503361, NULL, 'badges_defaultissuercontact', '', NULL),
	(178, 0, 1475503361, NULL, 'badges_badgesalt', 'badges1475503294', NULL),
	(179, 0, 1475503361, NULL, 'badges_allowexternalbackpack', '1', NULL),
	(180, 0, 1475503361, NULL, 'badges_allowcoursebadges', '1', NULL),
	(181, 0, 1475503363, NULL, 'timezone', 'America/Sao_Paulo', NULL),
	(182, 0, 1475503365, NULL, 'forcetimezone', '99', NULL),
	(183, 0, 1475503365, NULL, 'country', '0', NULL),
	(184, 0, 1475503365, NULL, 'defaultcity', '', NULL),
	(185, 0, 1475503365, NULL, 'geoipfile', '/home/rupertlustosa/Área de Trabalho/moodledata/geoip/GeoLiteCity.dat', NULL),
	(186, 0, 1475503365, NULL, 'googlemapkey3', '', NULL),
	(187, 0, 1475503365, NULL, 'allcountrycodes', '', NULL),
	(188, 0, 1475503365, NULL, 'autolang', '1', NULL),
	(189, 0, 1475503366, NULL, 'lang', 'pt_br', NULL),
	(190, 0, 1475503366, NULL, 'langmenu', '1', NULL),
	(191, 0, 1475503366, NULL, 'langlist', '', NULL),
	(192, 0, 1475503366, NULL, 'langcache', '1', NULL),
	(193, 0, 1475503366, NULL, 'langstringcache', '1', NULL),
	(194, 0, 1475503366, NULL, 'locale', '', NULL),
	(195, 0, 1475503366, NULL, 'latinexcelexport', '0', NULL),
	(196, 0, 1475503366, NULL, 'requiremodintro', '0', NULL),
	(197, 0, 1475503367, NULL, 'registerauth', '', NULL),
	(198, 0, 1475503367, NULL, 'authloginviaemail', '0', NULL),
	(199, 0, 1475503367, NULL, 'allowaccountssameemail', '0', NULL),
	(200, 0, 1475503367, NULL, 'authpreventaccountcreation', '0', NULL),
	(201, 0, 1475503367, NULL, 'loginpageautofocus', '0', NULL),
	(202, 0, 1475503367, NULL, 'guestloginbutton', '1', NULL),
	(203, 0, 1475503367, NULL, 'limitconcurrentlogins', '0', NULL),
	(204, 0, 1475503367, NULL, 'alternateloginurl', '', NULL),
	(205, 0, 1475503367, NULL, 'forgottenpasswordurl', '', NULL),
	(206, 0, 1475503367, NULL, 'auth_instructions', '', NULL),
	(207, 0, 1475503367, NULL, 'allowemailaddresses', '', NULL),
	(208, 0, 1475503367, NULL, 'denyemailaddresses', '', NULL),
	(209, 0, 1475503367, NULL, 'verifychangedemail', '1', NULL),
	(210, 0, 1475503368, NULL, 'recaptchapublickey', '', NULL),
	(211, 0, 1475503368, NULL, 'recaptchaprivatekey', '', NULL),
	(212, 0, 1475503368, 'cachestore_memcache', 'testservers', '', NULL),
	(213, 0, 1475503368, 'cachestore_memcached', 'testservers', '', NULL),
	(214, 0, 1475503368, 'cachestore_mongodb', 'testserver', '', NULL),
	(215, 0, 1475503368, NULL, 'filteruploadedfiles', '0', NULL),
	(216, 0, 1475503368, NULL, 'filtermatchoneperpage', '0', NULL),
	(217, 0, 1475503368, NULL, 'filtermatchonepertext', '0', NULL),
	(218, 0, 1475503368, NULL, 'sitedefaultlicense', 'allrightsreserved', NULL),
	(219, 0, 1475503368, NULL, 'searchengine', 'solr', NULL),
	(220, 0, 1475503368, 'mod_assign', 'search_activity_enabled', '1', NULL),
	(221, 0, 1475503368, 'mod_book', 'search_activity_enabled', '1', NULL),
	(222, 0, 1475503368, 'mod_book', 'search_chapter_enabled', '1', NULL),
	(223, 0, 1475503369, 'mod_chat', 'search_activity_enabled', '1', NULL),
	(224, 0, 1475503369, 'mod_choice', 'search_activity_enabled', '1', NULL),
	(225, 0, 1475503369, 'mod_data', 'search_activity_enabled', '1', NULL),
	(226, 0, 1475503369, 'mod_feedback', 'search_activity_enabled', '1', NULL),
	(227, 0, 1475503369, 'mod_folder', 'search_activity_enabled', '1', NULL),
	(228, 0, 1475503369, 'mod_forum', 'search_activity_enabled', '1', NULL),
	(229, 0, 1475503369, 'mod_forum', 'search_post_enabled', '1', NULL),
	(230, 0, 1475503369, 'mod_glossary', 'search_activity_enabled', '1', NULL),
	(231, 0, 1475503369, 'mod_glossary', 'search_entry_enabled', '1', NULL),
	(232, 0, 1475503369, 'mod_imscp', 'search_activity_enabled', '1', NULL),
	(233, 0, 1475503369, 'mod_label', 'search_activity_enabled', '1', NULL),
	(234, 0, 1475503369, 'mod_lesson', 'search_activity_enabled', '1', NULL),
	(235, 0, 1475503370, 'mod_lti', 'search_activity_enabled', '1', NULL),
	(236, 0, 1475503370, 'mod_page', 'search_activity_enabled', '1', NULL),
	(237, 0, 1475503370, 'mod_quiz', 'search_activity_enabled', '1', NULL),
	(238, 0, 1475503370, 'mod_resource', 'search_activity_enabled', '1', NULL),
	(239, 0, 1475503370, 'mod_scorm', 'search_activity_enabled', '1', NULL),
	(240, 0, 1475503370, 'mod_survey', 'search_activity_enabled', '1', NULL),
	(241, 0, 1475503370, 'mod_url', 'search_activity_enabled', '1', NULL),
	(242, 0, 1475503370, 'mod_wiki', 'search_activity_enabled', '1', NULL),
	(243, 0, 1475503370, 'mod_wiki', 'search_collaborative_page_enabled', '1', NULL),
	(244, 0, 1475503370, 'mod_workshop', 'search_activity_enabled', '1', NULL),
	(245, 0, 1475503371, 'core_search', 'core_course_mycourse_enabled', '1', NULL),
	(246, 0, 1475503371, NULL, 'portfolio_moderate_filesize_threshold', '1048576', NULL),
	(247, 0, 1475503371, NULL, 'portfolio_high_filesize_threshold', '5242880', NULL),
	(248, 0, 1475503371, NULL, 'portfolio_moderate_db_threshold', '20', NULL),
	(249, 0, 1475503371, NULL, 'portfolio_high_db_threshold', '50', NULL),
	(250, 0, 1475503371, NULL, 'repositorycacheexpire', '120', NULL),
	(251, 0, 1475503371, NULL, 'repositorygetfiletimeout', '30', NULL),
	(252, 0, 1475503371, NULL, 'repositorysyncfiletimeout', '1', NULL),
	(253, 0, 1475503371, NULL, 'repositorysyncimagetimeout', '3', NULL),
	(254, 0, 1475503371, NULL, 'repositoryallowexternallinks', '1', NULL),
	(255, 0, 1475503371, NULL, 'legacyfilesinnewcourses', '0', NULL),
	(256, 0, 1475503371, NULL, 'legacyfilesaddallowed', '1', NULL),
	(257, 0, 1475503371, 'question_preview', 'behaviour', 'deferredfeedback', NULL),
	(258, 0, 1475503372, 'question_preview', 'correctness', '1', NULL),
	(259, 0, 1475503372, 'question_preview', 'marks', '2', NULL),
	(260, 0, 1475503372, 'question_preview', 'markdp', '2', NULL),
	(261, 0, 1475503372, 'question_preview', 'feedback', '1', NULL),
	(262, 0, 1475503372, 'question_preview', 'generalfeedback', '1', NULL),
	(263, 0, 1475503372, 'question_preview', 'rightanswer', '1', NULL),
	(264, 0, 1475503372, 'question_preview', 'history', '0', NULL),
	(265, 0, 1475503372, NULL, 'mobilecssurl', '', NULL),
	(266, 0, 1475503372, NULL, 'enablewsdocumentation', '0', NULL),
	(267, 0, 1475503372, NULL, 'allowbeforeblock', '0', NULL),
	(268, 0, 1475503372, NULL, 'allowedip', '', NULL),
	(269, 0, 1475503372, NULL, 'blockedip', '', NULL),
	(270, 0, 1475503372, NULL, 'protectusernames', '1', NULL),
	(271, 0, 1475503373, NULL, 'forcelogin', '0', NULL),
	(272, 0, 1475503373, NULL, 'forceloginforprofiles', '1', NULL),
	(273, 0, 1475503373, NULL, 'forceloginforprofileimage', '0', NULL),
	(274, 0, 1475503373, NULL, 'opentogoogle', '0', NULL),
	(275, 0, 1475503373, NULL, 'maxbytes', '0', NULL),
	(276, 0, 1475503373, NULL, 'userquota', '104857600', NULL),
	(277, 0, 1475503373, NULL, 'allowobjectembed', '0', NULL),
	(278, 0, 1475503373, NULL, 'enabletrusttext', '0', NULL),
	(279, 0, 1475503373, NULL, 'maxeditingtime', '1800', NULL),
	(280, 0, 1475503373, NULL, 'extendedusernamechars', '0', NULL),
	(281, 0, 1475503374, NULL, 'sitepolicy', '', NULL),
	(282, 0, 1475503374, NULL, 'sitepolicyguest', '', NULL),
	(283, 0, 1475503374, NULL, 'keeptagnamecase', '1', NULL),
	(284, 0, 1475503374, NULL, 'profilesforenrolledusersonly', '1', NULL),
	(285, 0, 1475503374, NULL, 'cronclionly', '1', NULL),
	(286, 0, 1475503374, NULL, 'cronremotepassword', '', NULL),
	(287, 0, 1475503374, NULL, 'lockoutthreshold', '0', NULL),
	(288, 0, 1475503374, NULL, 'lockoutwindow', '1800', NULL),
	(289, 0, 1475503374, NULL, 'lockoutduration', '1800', NULL),
	(290, 0, 1475503374, NULL, 'passwordpolicy', '1', NULL),
	(291, 0, 1475503374, NULL, 'minpasswordlength', '8', NULL),
	(292, 0, 1475503374, NULL, 'minpassworddigits', '1', NULL),
	(293, 0, 1475503374, NULL, 'minpasswordlower', '1', NULL),
	(294, 0, 1475503375, NULL, 'minpasswordupper', '1', NULL),
	(295, 0, 1475503375, NULL, 'minpasswordnonalphanum', '1', NULL),
	(296, 0, 1475503375, NULL, 'maxconsecutiveidentchars', '0', NULL),
	(297, 0, 1475503375, NULL, 'passwordreuselimit', '0', NULL),
	(298, 0, 1475503375, NULL, 'pwresettime', '1800', NULL),
	(299, 0, 1475503375, NULL, 'passwordchangelogout', '0', NULL),
	(300, 0, 1475503375, NULL, 'groupenrolmentkeypolicy', '1', NULL),
	(301, 0, 1475503375, NULL, 'disableuserimages', '0', NULL),
	(302, 0, 1475503375, NULL, 'emailchangeconfirmation', '1', NULL),
	(303, 0, 1475503375, NULL, 'rememberusername', '2', NULL),
	(304, 0, 1475503375, NULL, 'strictformsrequired', '0', NULL),
	(305, 0, 1475503375, NULL, 'loginhttps', '0', NULL),
	(306, 0, 1475503375, NULL, 'cookiesecure', '1', NULL),
	(307, 0, 1475503376, NULL, 'cookiehttponly', '0', NULL),
	(308, 0, 1475503376, NULL, 'allowframembedding', '0', NULL),
	(309, 0, 1475503376, NULL, 'loginpasswordautocomplete', '0', NULL),
	(310, 0, 1475503376, NULL, 'displayloginfailures', '0', NULL),
	(311, 0, 1475503376, NULL, 'notifyloginfailures', '', NULL),
	(312, 0, 1475503377, NULL, 'notifyloginthreshold', '10', NULL),
	(313, 0, 1475503377, NULL, 'themelist', '', NULL),
	(314, 0, 1475503377, NULL, 'themedesignermode', '0', NULL),
	(315, 0, 1475503377, NULL, 'allowuserthemes', '0', NULL),
	(316, 0, 1475503377, NULL, 'allowcoursethemes', '0', NULL),
	(317, 0, 1475503377, NULL, 'allowcategorythemes', '0', NULL),
	(318, 0, 1475503377, NULL, 'allowthemechangeonurl', '0', NULL),
	(319, 0, 1475503377, NULL, 'allowuserblockhiding', '1', NULL),
	(320, 0, 1475503377, NULL, 'allowblockstodock', '1', NULL),
	(321, 0, 1475503377, NULL, 'custommenuitems', '', NULL),
	(322, 0, 1475503377, NULL, 'customusermenuitems', 'grades,grades|/grade/report/mygrades.php|grades\nmessages,message|/message/index.php|message\npreferences,moodle|/user/preferences.php|preferences', NULL),
	(323, 0, 1475503377, NULL, 'enabledevicedetection', '1', NULL),
	(324, 0, 1475503377, NULL, 'devicedetectregex', '[]', NULL),
	(325, 0, 1475503378, 'theme_clean', 'invert', '0', NULL),
	(326, 0, 1475503378, 'theme_clean', 'logo', '', NULL),
	(327, 0, 1475503378, 'theme_clean', 'smalllogo', '', NULL),
	(328, 0, 1475503378, 'theme_clean', 'sitename', '1', NULL),
	(329, 0, 1475503378, 'theme_clean', 'customcss', '', NULL),
	(330, 0, 1475503378, 'theme_clean', 'footnote', '', NULL),
	(331, 0, 1475503378, 'theme_more', 'textcolor', '#333366', NULL),
	(332, 0, 1475503378, 'theme_more', 'linkcolor', '#FF6500', NULL),
	(333, 0, 1475503378, 'theme_more', 'bodybackground', '', NULL),
	(334, 0, 1475503378, 'theme_more', 'backgroundimage', '', NULL),
	(335, 0, 1475503378, 'theme_more', 'backgroundrepeat', 'repeat', NULL),
	(336, 0, 1475503378, 'theme_more', 'backgroundposition', '0', NULL),
	(337, 0, 1475503378, 'theme_more', 'backgroundfixed', '0', NULL),
	(338, 0, 1475503378, 'theme_more', 'contentbackground', '#FFFFFF', NULL),
	(339, 0, 1475503379, 'theme_more', 'secondarybackground', '#FFFFFF', NULL),
	(340, 0, 1475503379, 'theme_more', 'invert', '1', NULL),
	(341, 0, 1475503379, 'theme_more', 'logo', '', NULL),
	(342, 0, 1475503379, 'theme_more', 'smalllogo', '', NULL),
	(343, 0, 1475503379, 'theme_more', 'sitename', '1', NULL),
	(344, 0, 1475503379, 'theme_more', 'customcss', '', NULL),
	(345, 0, 1475503379, 'theme_more', 'footnote', '', NULL),
	(346, 0, 1475503379, NULL, 'calendartype', 'gregorian', NULL),
	(347, 0, 1475503379, NULL, 'calendar_adminseesall', '0', NULL),
	(348, 0, 1475503379, NULL, 'calendar_site_timeformat', '0', NULL),
	(349, 0, 1475503379, NULL, 'calendar_startwday', '1', NULL),
	(350, 0, 1475503380, NULL, 'calendar_weekend', '65', NULL),
	(351, 0, 1475503380, NULL, 'calendar_lookahead', '21', NULL),
	(352, 0, 1475503380, NULL, 'calendar_maxevents', '10', NULL),
	(353, 0, 1475503380, NULL, 'enablecalendarexport', '1', NULL),
	(354, 0, 1475503380, NULL, 'calendar_customexport', '1', NULL),
	(355, 0, 1475503380, NULL, 'calendar_exportlookahead', '365', NULL),
	(356, 0, 1475503380, NULL, 'calendar_exportlookback', '5', NULL),
	(357, 0, 1475503380, NULL, 'calendar_exportsalt', 'sEt60P87WFIWK1n4rZ7p8KD3CZ4Al4dMbhJV7GjnY3HjINeVPkGu5tYwz15f', NULL),
	(358, 0, 1475503380, NULL, 'calendar_showicalsource', '1', NULL),
	(359, 0, 1475503380, NULL, 'useblogassociations', '1', NULL),
	(360, 0, 1475503381, NULL, 'bloglevel', '4', NULL),
	(361, 0, 1475503381, NULL, 'useexternalblogs', '1', NULL),
	(362, 0, 1475503381, NULL, 'externalblogcrontime', '86400', NULL),
	(363, 0, 1475503381, NULL, 'maxexternalblogsperuser', '1', NULL),
	(364, 0, 1475503381, NULL, 'blogusecomments', '1', NULL),
	(365, 0, 1475503381, NULL, 'blogshowcommentscount', '1', NULL),
	(366, 0, 1475503381, NULL, 'defaulthomepage', '1', NULL),
	(367, 0, 1475503381, NULL, 'allowguestmymoodle', '1', NULL),
	(368, 0, 1475503382, NULL, 'navshowfullcoursenames', '0', NULL),
	(369, 0, 1475503382, NULL, 'navshowcategories', '1', NULL),
	(370, 0, 1475503382, NULL, 'navshowmycoursecategories', '0', NULL),
	(371, 0, 1475503382, NULL, 'navshowallcourses', '0', NULL),
	(372, 0, 1475503382, NULL, 'navexpandmycourses', '1', NULL),
	(373, 0, 1475503382, NULL, 'navsortmycoursessort', 'sortorder', NULL),
	(374, 0, 1475503382, NULL, 'navcourselimit', '20', NULL),
	(375, 0, 1475503383, NULL, 'usesitenameforsitepages', '0', NULL),
	(376, 0, 1475503383, NULL, 'linkadmincategories', '0', NULL),
	(377, 0, 1475503383, NULL, 'linkcoursesections', '0', NULL),
	(378, 0, 1475503383, NULL, 'navshowfrontpagemods', '1', NULL),
	(379, 0, 1475503383, NULL, 'navadduserpostslinks', '1', NULL),
	(380, 0, 1475503383, NULL, 'formatstringstriptags', '1', NULL),
	(381, 0, 1475503383, NULL, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]', NULL),
	(382, 0, 1475503383, NULL, 'core_media_enable_youtube', '1', NULL),
	(383, 0, 1475503384, NULL, 'core_media_enable_vimeo', '0', NULL),
	(384, 0, 1475503384, NULL, 'core_media_enable_mp3', '1', NULL),
	(385, 0, 1475503384, NULL, 'core_media_enable_flv', '1', NULL),
	(386, 0, 1475503384, NULL, 'core_media_enable_swf', '1', NULL),
	(387, 0, 1475503384, NULL, 'core_media_enable_html5audio', '1', NULL),
	(388, 0, 1475503384, NULL, 'core_media_enable_html5video', '1', NULL),
	(389, 0, 1475503384, NULL, 'core_media_enable_qt', '1', NULL),
	(390, 0, 1475503385, NULL, 'core_media_enable_wmp', '1', NULL),
	(391, 0, 1475503385, NULL, 'core_media_enable_rm', '1', NULL),
	(392, 0, 1475503385, NULL, 'docroot', 'http://docs.moodle.org', NULL),
	(393, 0, 1475503385, NULL, 'doclang', '', NULL),
	(394, 0, 1475503385, NULL, 'doctonewwindow', '0', NULL),
	(395, 0, 1475503385, NULL, 'courselistshortnames', '0', NULL),
	(396, 0, 1475503385, NULL, 'coursesperpage', '20', NULL),
	(397, 0, 1475503385, NULL, 'courseswithsummarieslimit', '10', NULL),
	(398, 0, 1475503386, NULL, 'courseoverviewfileslimit', '1', NULL),
	(399, 0, 1475503386, NULL, 'courseoverviewfilesext', '.jpg,.gif,.png', NULL),
	(400, 0, 1475503386, NULL, 'useexternalyui', '0', NULL),
	(401, 0, 1475503386, NULL, 'yuicomboloading', '1', NULL),
	(402, 0, 1475503386, NULL, 'cachejs', '1', NULL),
	(403, 0, 1475503386, NULL, 'modchooserdefault', '1', NULL),
	(404, 0, 1475503386, NULL, 'modeditingmenu', '1', NULL),
	(405, 0, 1475503386, NULL, 'blockeditingmenu', '1', NULL),
	(406, 0, 1475503387, NULL, 'additionalhtmlhead', '', NULL),
	(407, 0, 1475503387, NULL, 'additionalhtmltopofbody', '', NULL),
	(408, 0, 1475503387, NULL, 'additionalhtmlfooter', '', NULL),
	(409, 0, 1475503388, NULL, 'pathtodu', '', NULL),
	(410, 0, 1475503388, NULL, 'aspellpath', '', NULL),
	(411, 0, 1475503388, NULL, 'pathtodot', '', NULL),
	(412, 0, 1475503388, NULL, 'pathtogs', '/usr/bin/gs', NULL),
	(413, 0, 1475503388, NULL, 'pathtounoconv', '/usr/bin/unoconv', NULL),
	(414, 0, 1475503388, NULL, 'supportname', 'Administrador Usuário', NULL),
	(415, 0, 1475503388, NULL, 'supportemail', '', NULL),
	(416, 0, 1475503389, NULL, 'supportpage', '', NULL),
	(417, 0, 1475503389, NULL, 'dbsessions', '0', NULL),
	(418, 0, 1475503389, NULL, 'sessioncookie', '', NULL),
	(419, 0, 1475503389, NULL, 'sessioncookiepath', '', NULL),
	(420, 0, 1475503389, NULL, 'sessioncookiedomain', '', NULL),
	(421, 0, 1475503389, NULL, 'statsfirstrun', 'none', NULL),
	(422, 0, 1475503389, NULL, 'statsmaxruntime', '0', NULL),
	(423, 0, 1475503390, NULL, 'statsruntimedays', '31', NULL),
	(424, 0, 1475503390, NULL, 'statsuserthreshold', '0', NULL),
	(425, 0, 1475503390, NULL, 'slasharguments', '1', NULL),
	(426, 0, 1475503390, NULL, 'getremoteaddrconf', '0', NULL),
	(427, 0, 1475503390, NULL, 'proxyhost', '', NULL),
	(428, 0, 1475503390, NULL, 'proxyport', '0', NULL),
	(429, 0, 1475503390, NULL, 'proxytype', 'HTTP', NULL),
	(430, 0, 1475503390, NULL, 'proxyuser', '', NULL),
	(431, 0, 1475503391, NULL, 'proxypassword', '', NULL),
	(432, 0, 1475503391, NULL, 'proxybypass', 'localhost, 127.0.0.1', NULL),
	(433, 0, 1475503391, NULL, 'maintenance_enabled', '0', NULL),
	(434, 0, 1475503391, NULL, 'maintenance_message', '', NULL),
	(435, 0, 1475503391, NULL, 'deleteunconfirmed', '168', NULL),
	(436, 0, 1475503391, NULL, 'deleteincompleteusers', '0', NULL),
	(437, 0, 1475503391, NULL, 'disablegradehistory', '0', NULL),
	(438, 0, 1475503391, NULL, 'gradehistorylifetime', '0', NULL),
	(439, 0, 1475503392, NULL, 'tempdatafoldercleanup', '168', NULL),
	(440, 0, 1475503392, NULL, 'extramemorylimit', '512M', NULL),
	(441, 0, 1475503392, NULL, 'maxtimelimit', '0', NULL),
	(442, 0, 1475503392, NULL, 'curlcache', '120', NULL),
	(443, 0, 1475503392, NULL, 'curltimeoutkbitrate', '56', NULL),
	(444, 0, 1475503392, NULL, 'updateautocheck', '1', NULL),
	(445, 0, 1475503392, NULL, 'updateminmaturity', '200', NULL),
	(446, 0, 1475503392, NULL, 'updatenotifybuilds', '0', NULL),
	(447, 0, 1475503393, NULL, 'enablesafebrowserintegration', '0', NULL),
	(448, 0, 1475503393, NULL, 'dndallowtextandlinks', '0', NULL),
	(449, 0, 1475503393, NULL, 'enablecssoptimiser', '0', NULL),
	(450, 0, 1475503393, NULL, 'debug', '0', NULL),
	(451, 0, 1475503393, NULL, 'debugdisplay', '1', NULL),
	(452, 0, 1475503393, NULL, 'debugsmtp', '0', NULL),
	(453, 0, 1475503393, NULL, 'perfdebug', '7', NULL),
	(454, 0, 1475503394, NULL, 'debugstringids', '0', NULL),
	(455, 0, 1475503394, NULL, 'debugvalidators', '0', NULL),
	(456, 0, 1475503394, NULL, 'debugpageinfo', '0', NULL),
	(457, 0, 1475503394, NULL, 'profilingenabled', '0', NULL),
	(458, 0, 1475503394, NULL, 'profilingincluded', '', NULL),
	(459, 0, 1475503394, NULL, 'profilingexcluded', '', NULL),
	(460, 0, 1475503394, NULL, 'profilingautofrec', '0', NULL),
	(461, 0, 1475503395, NULL, 'profilingallowme', '0', NULL),
	(462, 0, 1475503395, NULL, 'profilingallowall', '0', NULL),
	(463, 0, 1475503395, NULL, 'profilinglifetime', '1440', NULL),
	(464, 0, 1475503395, NULL, 'profilingimportprefix', '(I)', NULL),
	(465, 0, 1475503535, 'activitynames', 'filter_active', '1', ''),
	(466, 0, 1475503539, 'mathjaxloader', 'filter_active', '1', ''),
	(467, 0, 1475503539, 'mediaplugin', 'filter_active', '1', ''),
	(468, 2, 1475505524, NULL, 'notloggedinroleid', '6', NULL),
	(469, 2, 1475505524, NULL, 'guestroleid', '6', NULL),
	(470, 2, 1475505524, NULL, 'defaultuserroleid', '7', NULL),
	(471, 2, 1475505524, NULL, 'creatornewroleid', '3', NULL),
	(472, 2, 1475505524, NULL, 'restorernewroleid', '3', NULL),
	(473, 2, 1475505524, NULL, 'gradebookroles', '5', NULL),
	(474, 2, 1475505524, 'assign', 'feedback_plugin_for_gradebook', 'assignfeedback_comments', NULL),
	(475, 2, 1475505524, 'assign', 'showrecentsubmissions', '0', NULL),
	(476, 2, 1475505524, 'assign', 'submissionreceipts', '1', NULL),
	(477, 2, 1475505524, 'assign', 'submissionstatement', 'Esta tarefa é meu próprio trabalho, exceto onde eu reconheço o uso do trabalho de outras pessoas.', NULL),
	(478, 2, 1475505524, 'assign', 'maxperpage', '-1', NULL),
	(479, 2, 1475505525, 'assign', 'alwaysshowdescription', '1', NULL),
	(480, 2, 1475505525, 'assign', 'alwaysshowdescription_adv', '', NULL),
	(481, 2, 1475505525, 'assign', 'alwaysshowdescription_locked', '', NULL),
	(482, 2, 1475505525, 'assign', 'allowsubmissionsfromdate', '0', NULL),
	(483, 2, 1475505525, 'assign', 'allowsubmissionsfromdate_enabled', '1', NULL),
	(484, 2, 1475505525, 'assign', 'allowsubmissionsfromdate_adv', '', NULL),
	(485, 2, 1475505526, 'assign', 'duedate', '604800', NULL),
	(486, 2, 1475505526, 'assign', 'duedate_enabled', '1', NULL),
	(487, 2, 1475505526, 'assign', 'duedate_adv', '', NULL),
	(488, 2, 1475505526, 'assign', 'cutoffdate', '1209600', NULL),
	(489, 2, 1475505526, 'assign', 'cutoffdate_enabled', '', NULL),
	(490, 2, 1475505526, 'assign', 'cutoffdate_adv', '', NULL),
	(491, 2, 1475505526, 'assign', 'submissiondrafts', '0', NULL),
	(492, 2, 1475505526, 'assign', 'submissiondrafts_adv', '', NULL),
	(493, 2, 1475505526, 'assign', 'submissiondrafts_locked', '', NULL),
	(494, 2, 1475505526, 'assign', 'requiresubmissionstatement', '0', NULL),
	(495, 2, 1475505526, 'assign', 'requiresubmissionstatement_adv', '', NULL),
	(496, 2, 1475505526, 'assign', 'requiresubmissionstatement_locked', '', NULL),
	(497, 2, 1475505526, 'assign', 'attemptreopenmethod', 'none', NULL),
	(498, 2, 1475505526, 'assign', 'attemptreopenmethod_adv', '', NULL),
	(499, 2, 1475505527, 'assign', 'attemptreopenmethod_locked', '', NULL),
	(500, 2, 1475505527, 'assign', 'maxattempts', '-1', NULL),
	(501, 2, 1475505527, 'assign', 'maxattempts_adv', '', NULL),
	(502, 2, 1475505527, 'assign', 'maxattempts_locked', '', NULL),
	(503, 2, 1475505527, 'assign', 'teamsubmission', '0', NULL),
	(504, 2, 1475505527, 'assign', 'teamsubmission_adv', '', NULL),
	(505, 2, 1475505527, 'assign', 'teamsubmission_locked', '', NULL),
	(506, 2, 1475505527, 'assign', 'preventsubmissionnotingroup', '0', NULL),
	(507, 2, 1475505527, 'assign', 'preventsubmissionnotingroup_adv', '', NULL),
	(508, 2, 1475505527, 'assign', 'preventsubmissionnotingroup_locked', '', NULL),
	(509, 2, 1475505527, 'assign', 'requireallteammemberssubmit', '0', NULL),
	(510, 2, 1475505527, 'assign', 'requireallteammemberssubmit_adv', '', NULL),
	(511, 2, 1475505528, 'assign', 'requireallteammemberssubmit_locked', '', NULL),
	(512, 2, 1475505528, 'assign', 'teamsubmissiongroupingid', '', NULL),
	(513, 2, 1475505528, 'assign', 'teamsubmissiongroupingid_adv', '', NULL),
	(514, 2, 1475505528, 'assign', 'sendnotifications', '0', NULL),
	(515, 2, 1475505528, 'assign', 'sendnotifications_adv', '', NULL),
	(516, 2, 1475505528, 'assign', 'sendnotifications_locked', '', NULL),
	(517, 2, 1475505528, 'assign', 'sendlatenotifications', '0', NULL),
	(518, 2, 1475505528, 'assign', 'sendlatenotifications_adv', '', NULL),
	(519, 2, 1475505528, 'assign', 'sendlatenotifications_locked', '', NULL),
	(520, 2, 1475505528, 'assign', 'sendstudentnotifications', '1', NULL),
	(521, 2, 1475505528, 'assign', 'sendstudentnotifications_adv', '', NULL),
	(522, 2, 1475505528, 'assign', 'sendstudentnotifications_locked', '', NULL),
	(523, 2, 1475505528, 'assign', 'blindmarking', '0', NULL),
	(524, 2, 1475505528, 'assign', 'blindmarking_adv', '', NULL),
	(525, 2, 1475505529, 'assign', 'blindmarking_locked', '', NULL),
	(526, 2, 1475505529, 'assign', 'markingworkflow', '0', NULL),
	(527, 2, 1475505529, 'assign', 'markingworkflow_adv', '', NULL),
	(528, 2, 1475505529, 'assign', 'markingworkflow_locked', '', NULL),
	(529, 2, 1475505529, 'assign', 'markingallocation', '0', NULL),
	(530, 2, 1475505529, 'assign', 'markingallocation_adv', '', NULL),
	(531, 2, 1475505529, 'assign', 'markingallocation_locked', '', NULL),
	(532, 2, 1475505529, 'assignsubmission_file', 'default', '1', NULL),
	(533, 2, 1475505529, 'assignsubmission_file', 'maxfiles', '20', NULL),
	(534, 2, 1475505529, 'assignsubmission_file', 'maxbytes', '1048576', NULL),
	(535, 2, 1475505529, 'assignsubmission_onlinetext', 'default', '0', NULL),
	(536, 2, 1475505529, 'assignfeedback_comments', 'default', '1', NULL),
	(537, 2, 1475505529, 'assignfeedback_comments', 'inline', '0', NULL),
	(538, 2, 1475505530, 'assignfeedback_comments', 'inline_adv', '', NULL),
	(539, 2, 1475505530, 'assignfeedback_comments', 'inline_locked', '', NULL),
	(540, 2, 1475505530, 'assignfeedback_editpdf', 'stamps', '', NULL),
	(541, 2, 1475505530, 'assignfeedback_file', 'default', '0', NULL),
	(542, 2, 1475505530, 'assignfeedback_offline', 'default', '0', NULL),
	(543, 2, 1475505530, 'book', 'numberingoptions', '0,1,2,3', NULL),
	(544, 2, 1475505530, 'book', 'navoptions', '0,1,2', NULL),
	(545, 2, 1475505530, 'book', 'numbering', '1', NULL),
	(546, 2, 1475505530, 'book', 'navstyle', '1', NULL),
	(547, 2, 1475505530, NULL, 'chat_method', 'ajax', NULL),
	(548, 2, 1475505530, NULL, 'chat_refresh_userlist', '10', NULL),
	(549, 2, 1475505530, NULL, 'chat_old_ping', '35', NULL),
	(550, 2, 1475505531, NULL, 'chat_refresh_room', '5', NULL),
	(551, 2, 1475505531, NULL, 'chat_normal_updatemode', 'jsupdate', NULL),
	(552, 2, 1475505531, NULL, 'chat_serverhost', 'localhost', NULL),
	(553, 2, 1475505531, NULL, 'chat_serverip', '127.0.0.1', NULL),
	(554, 2, 1475505531, NULL, 'chat_serverport', '9111', NULL),
	(555, 2, 1475505531, NULL, 'chat_servermax', '100', NULL),
	(556, 2, 1475505531, NULL, 'data_enablerssfeeds', '0', NULL),
	(557, 2, 1475505531, NULL, 'feedback_allowfullanonymous', '0', NULL),
	(558, 2, 1475505531, 'folder', 'showexpanded', '1', NULL),
	(559, 2, 1475505531, 'folder', 'maxsizetodownload', '0', NULL),
	(560, 2, 1475505531, NULL, 'forum_displaymode', '3', NULL),
	(561, 2, 1475505531, NULL, 'forum_replytouser', '1', NULL),
	(562, 2, 1475505531, NULL, 'forum_shortpost', '300', NULL),
	(563, 2, 1475505531, NULL, 'forum_longpost', '600', NULL),
	(564, 2, 1475505531, NULL, 'forum_manydiscussions', '100', NULL),
	(565, 2, 1475505532, NULL, 'forum_maxbytes', '512000', NULL),
	(566, 2, 1475505532, NULL, 'forum_maxattachments', '9', NULL),
	(567, 2, 1475505532, NULL, 'forum_trackingtype', '1', NULL),
	(568, 2, 1475505532, NULL, 'forum_trackreadposts', '1', NULL),
	(569, 2, 1475505532, NULL, 'forum_allowforcedreadtracking', '0', NULL),
	(570, 2, 1475505532, NULL, 'forum_oldpostdays', '14', NULL),
	(571, 2, 1475505532, NULL, 'forum_usermarksread', '0', NULL),
	(572, 2, 1475505532, NULL, 'forum_cleanreadtime', '2', NULL),
	(573, 2, 1475505532, NULL, 'digestmailtime', '17', NULL),
	(574, 2, 1475505532, NULL, 'forum_enablerssfeeds', '0', NULL),
	(575, 2, 1475505532, NULL, 'forum_enabletimedposts', '1', NULL),
	(576, 2, 1475505533, NULL, 'glossary_entbypage', '10', NULL),
	(577, 2, 1475505533, NULL, 'glossary_dupentries', '0', NULL),
	(578, 2, 1475505533, NULL, 'glossary_allowcomments', '0', NULL),
	(579, 2, 1475505533, NULL, 'glossary_linkbydefault', '1', NULL),
	(580, 2, 1475505533, NULL, 'glossary_defaultapproval', '1', NULL),
	(581, 2, 1475505533, NULL, 'glossary_enablerssfeeds', '0', NULL),
	(582, 2, 1475505533, NULL, 'glossary_linkentries', '0', NULL),
	(583, 2, 1475505533, NULL, 'glossary_casesensitive', '0', NULL),
	(584, 2, 1475505533, NULL, 'glossary_fullmatch', '0', NULL),
	(585, 2, 1475505533, 'imscp', 'keepold', '1', NULL),
	(586, 2, 1475505534, 'imscp', 'keepold_adv', '', NULL),
	(587, 2, 1475505534, 'label', 'dndmedia', '1', NULL),
	(588, 2, 1475505534, 'label', 'dndresizewidth', '400', NULL),
	(589, 2, 1475505534, 'label', 'dndresizeheight', '400', NULL),
	(590, 2, 1475505534, 'mod_lesson', 'mediafile', '', NULL),
	(591, 2, 1475505534, 'mod_lesson', 'mediafile_adv', '1', NULL),
	(592, 2, 1475505534, 'mod_lesson', 'mediawidth', '640', NULL),
	(593, 2, 1475505534, 'mod_lesson', 'mediaheight', '480', NULL),
	(594, 2, 1475505534, 'mod_lesson', 'mediaclose', '0', NULL),
	(595, 2, 1475505534, 'mod_lesson', 'progressbar', '0', NULL),
	(596, 2, 1475505534, 'mod_lesson', 'progressbar_adv', '', NULL),
	(597, 2, 1475505534, 'mod_lesson', 'ongoing', '0', NULL),
	(598, 2, 1475505534, 'mod_lesson', 'ongoing_adv', '1', NULL),
	(599, 2, 1475505534, 'mod_lesson', 'displayleftmenu', '0', NULL),
	(600, 2, 1475505534, 'mod_lesson', 'displayleftmenu_adv', '', NULL),
	(601, 2, 1475505534, 'mod_lesson', 'displayleftif', '0', NULL),
	(602, 2, 1475505534, 'mod_lesson', 'displayleftif_adv', '1', NULL),
	(603, 2, 1475505535, 'mod_lesson', 'slideshow', '0', NULL),
	(604, 2, 1475505535, 'mod_lesson', 'slideshow_adv', '1', NULL),
	(605, 2, 1475505535, 'mod_lesson', 'slideshowwidth', '640', NULL),
	(606, 2, 1475505535, 'mod_lesson', 'slideshowheight', '480', NULL),
	(607, 2, 1475505535, 'mod_lesson', 'slideshowbgcolor', '#FFFFFF', NULL),
	(608, 2, 1475505535, 'mod_lesson', 'maxanswers', '5', NULL),
	(609, 2, 1475505535, 'mod_lesson', 'maxanswers_adv', '1', NULL),
	(610, 2, 1475505535, 'mod_lesson', 'defaultfeedback', '0', NULL),
	(611, 2, 1475505535, 'mod_lesson', 'defaultfeedback_adv', '1', NULL),
	(612, 2, 1475505535, 'mod_lesson', 'activitylink', '', NULL),
	(613, 2, 1475505535, 'mod_lesson', 'activitylink_adv', '1', NULL),
	(614, 2, 1475505535, 'mod_lesson', 'timelimit', '0', NULL),
	(615, 2, 1475505536, 'mod_lesson', 'timelimit_adv', '', NULL),
	(616, 2, 1475505536, 'mod_lesson', 'password', '0', NULL),
	(617, 2, 1475505536, 'mod_lesson', 'password_adv', '1', NULL),
	(618, 2, 1475505536, 'mod_lesson', 'modattempts', '0', NULL),
	(619, 2, 1475505537, 'mod_lesson', 'modattempts_adv', '', NULL),
	(620, 2, 1475505537, 'mod_lesson', 'displayreview', '0', NULL),
	(621, 2, 1475505537, 'mod_lesson', 'displayreview_adv', '', NULL),
	(622, 2, 1475505537, 'mod_lesson', 'maximumnumberofattempts', '1', NULL),
	(623, 2, 1475505537, 'mod_lesson', 'maximumnumberofattempts_adv', '', NULL),
	(624, 2, 1475505537, 'mod_lesson', 'defaultnextpage', '0', NULL),
	(625, 2, 1475505537, 'mod_lesson', 'defaultnextpage_adv', '1', NULL),
	(626, 2, 1475505537, 'mod_lesson', 'numberofpagestoshow', '1', NULL),
	(627, 2, 1475505537, 'mod_lesson', 'numberofpagestoshow_adv', '1', NULL),
	(628, 2, 1475505537, 'mod_lesson', 'practice', '0', NULL),
	(629, 2, 1475505537, 'mod_lesson', 'practice_adv', '', NULL),
	(630, 2, 1475505537, 'mod_lesson', 'customscoring', '1', NULL),
	(631, 2, 1475505537, 'mod_lesson', 'customscoring_adv', '1', NULL),
	(632, 2, 1475505537, 'mod_lesson', 'retakesallowed', '0', NULL),
	(633, 2, 1475505538, 'mod_lesson', 'retakesallowed_adv', '', NULL),
	(634, 2, 1475505538, 'mod_lesson', 'handlingofretakes', '0', NULL),
	(635, 2, 1475505538, 'mod_lesson', 'handlingofretakes_adv', '1', NULL),
	(636, 2, 1475505538, 'mod_lesson', 'minimumnumberofquestions', '0', NULL),
	(637, 2, 1475505538, 'mod_lesson', 'minimumnumberofquestions_adv', '1', NULL),
	(638, 2, 1475505538, 'page', 'displayoptions', '5', NULL),
	(639, 2, 1475505538, 'page', 'printheading', '1', NULL),
	(640, 2, 1475505538, 'page', 'printintro', '0', NULL),
	(641, 2, 1475505538, 'page', 'display', '5', NULL),
	(642, 2, 1475505538, 'page', 'popupwidth', '620', NULL),
	(643, 2, 1475505538, 'page', 'popupheight', '450', NULL),
	(644, 2, 1475505539, 'quiz', 'timelimit', '0', NULL),
	(645, 2, 1475505539, 'quiz', 'timelimit_adv', '', NULL),
	(646, 2, 1475505539, 'quiz', 'overduehandling', 'autosubmit', NULL),
	(647, 2, 1475505539, 'quiz', 'overduehandling_adv', '', NULL),
	(648, 2, 1475505539, 'quiz', 'graceperiod', '86400', NULL),
	(649, 2, 1475505539, 'quiz', 'graceperiod_adv', '', NULL),
	(650, 2, 1475505539, 'quiz', 'graceperiodmin', '60', NULL),
	(651, 2, 1475505539, 'quiz', 'attempts', '0', NULL),
	(652, 2, 1475505539, 'quiz', 'attempts_adv', '', NULL),
	(653, 2, 1475505539, 'quiz', 'grademethod', '1', NULL),
	(654, 2, 1475505539, 'quiz', 'grademethod_adv', '', NULL),
	(655, 2, 1475505539, 'quiz', 'maximumgrade', '10', NULL),
	(656, 2, 1475505540, 'quiz', 'questionsperpage', '1', NULL),
	(657, 2, 1475505540, 'quiz', 'questionsperpage_adv', '', NULL),
	(658, 2, 1475505540, 'quiz', 'navmethod', 'free', NULL),
	(659, 2, 1475505540, 'quiz', 'navmethod_adv', '1', NULL),
	(660, 2, 1475505540, 'quiz', 'shuffleanswers', '1', NULL),
	(661, 2, 1475505540, 'quiz', 'shuffleanswers_adv', '', NULL),
	(662, 2, 1475505540, 'quiz', 'preferredbehaviour', 'deferredfeedback', NULL),
	(663, 2, 1475505540, 'quiz', 'canredoquestions', '0', NULL),
	(664, 2, 1475505540, 'quiz', 'canredoquestions_adv', '1', NULL),
	(665, 2, 1475505540, 'quiz', 'attemptonlast', '0', NULL),
	(666, 2, 1475505540, 'quiz', 'attemptonlast_adv', '1', NULL),
	(667, 2, 1475505540, 'quiz', 'reviewattempt', '69904', NULL),
	(668, 2, 1475505541, 'quiz', 'reviewcorrectness', '69904', NULL),
	(669, 2, 1475505541, 'quiz', 'reviewmarks', '69904', NULL),
	(670, 2, 1475505541, 'quiz', 'reviewspecificfeedback', '69904', NULL),
	(671, 2, 1475505541, 'quiz', 'reviewgeneralfeedback', '69904', NULL),
	(672, 2, 1475505541, 'quiz', 'reviewrightanswer', '69904', NULL),
	(673, 2, 1475505541, 'quiz', 'reviewoverallfeedback', '4368', NULL),
	(674, 2, 1475505541, 'quiz', 'showuserpicture', '0', NULL),
	(675, 2, 1475505541, 'quiz', 'showuserpicture_adv', '', NULL),
	(676, 2, 1475505541, 'quiz', 'decimalpoints', '2', NULL),
	(677, 2, 1475505541, 'quiz', 'decimalpoints_adv', '', NULL),
	(678, 2, 1475505541, 'quiz', 'questiondecimalpoints', '-1', NULL),
	(679, 2, 1475505541, 'quiz', 'questiondecimalpoints_adv', '1', NULL),
	(680, 2, 1475505541, 'quiz', 'showblocks', '0', NULL),
	(681, 2, 1475505541, 'quiz', 'showblocks_adv', '1', NULL),
	(682, 2, 1475505542, 'quiz', 'password', '', NULL),
	(683, 2, 1475505542, 'quiz', 'password_adv', '', NULL),
	(684, 2, 1475505542, 'quiz', 'subnet', '', NULL),
	(685, 2, 1475505542, 'quiz', 'subnet_adv', '1', NULL),
	(686, 2, 1475505542, 'quiz', 'delay1', '0', NULL),
	(687, 2, 1475505542, 'quiz', 'delay1_adv', '1', NULL),
	(688, 2, 1475505542, 'quiz', 'delay2', '0', NULL),
	(689, 2, 1475505542, 'quiz', 'delay2_adv', '1', NULL),
	(690, 2, 1475505542, 'quiz', 'browsersecurity', '-', NULL),
	(691, 2, 1475505542, 'quiz', 'browsersecurity_adv', '1', NULL),
	(692, 2, 1475505542, 'quiz', 'initialnumfeedbacks', '2', NULL),
	(693, 2, 1475505542, 'quiz', 'autosaveperiod', '60', NULL),
	(694, 2, 1475505543, 'resource', 'framesize', '130', NULL),
	(695, 2, 1475505543, 'resource', 'displayoptions', '0,1,4,5,6', NULL),
	(696, 2, 1475505543, 'resource', 'printintro', '1', NULL),
	(697, 2, 1475505543, 'resource', 'display', '0', NULL),
	(698, 2, 1475505543, 'resource', 'showsize', '0', NULL),
	(699, 2, 1475505543, 'resource', 'showtype', '0', NULL),
	(700, 2, 1475505543, 'resource', 'showdate', '0', NULL),
	(701, 2, 1475505543, 'resource', 'popupwidth', '620', NULL),
	(702, 2, 1475505543, 'resource', 'popupheight', '450', NULL),
	(703, 2, 1475505543, 'resource', 'filterfiles', '0', NULL),
	(704, 2, 1475505543, 'scorm', 'displaycoursestructure', '0', NULL),
	(705, 2, 1475505543, 'scorm', 'displaycoursestructure_adv', '', NULL),
	(706, 2, 1475505543, 'scorm', 'popup', '0', NULL),
	(707, 2, 1475505543, 'scorm', 'popup_adv', '', NULL),
	(708, 2, 1475505544, 'scorm', 'displayactivityname', '1', NULL),
	(709, 2, 1475505544, 'scorm', 'framewidth', '100', NULL),
	(710, 2, 1475505544, 'scorm', 'framewidth_adv', '1', NULL),
	(711, 2, 1475505544, 'scorm', 'frameheight', '500', NULL),
	(712, 2, 1475505544, 'scorm', 'frameheight_adv', '1', NULL),
	(713, 2, 1475505544, 'scorm', 'winoptgrp_adv', '1', NULL),
	(714, 2, 1475505544, 'scorm', 'scrollbars', '0', NULL),
	(715, 2, 1475505544, 'scorm', 'directories', '0', NULL),
	(716, 2, 1475505544, 'scorm', 'location', '0', NULL),
	(717, 2, 1475505544, 'scorm', 'menubar', '0', NULL),
	(718, 2, 1475505544, 'scorm', 'toolbar', '0', NULL),
	(719, 2, 1475505544, 'scorm', 'status', '0', NULL),
	(720, 2, 1475505544, 'scorm', 'skipview', '0', NULL),
	(721, 2, 1475505545, 'scorm', 'skipview_adv', '1', NULL),
	(722, 2, 1475505545, 'scorm', 'hidebrowse', '0', NULL),
	(723, 2, 1475505545, 'scorm', 'hidebrowse_adv', '1', NULL),
	(724, 2, 1475505545, 'scorm', 'hidetoc', '0', NULL),
	(725, 2, 1475505545, 'scorm', 'hidetoc_adv', '1', NULL),
	(726, 2, 1475505545, 'scorm', 'nav', '1', NULL),
	(727, 2, 1475505545, 'scorm', 'nav_adv', '1', NULL),
	(728, 2, 1475505545, 'scorm', 'navpositionleft', '-100', NULL),
	(729, 2, 1475505545, 'scorm', 'navpositionleft_adv', '1', NULL),
	(730, 2, 1475505545, 'scorm', 'navpositiontop', '-100', NULL),
	(731, 2, 1475505545, 'scorm', 'navpositiontop_adv', '1', NULL),
	(732, 2, 1475505545, 'scorm', 'collapsetocwinsize', '767', NULL),
	(733, 2, 1475505545, 'scorm', 'collapsetocwinsize_adv', '1', NULL),
	(734, 2, 1475505546, 'scorm', 'displayattemptstatus', '1', NULL),
	(735, 2, 1475505546, 'scorm', 'displayattemptstatus_adv', '', NULL),
	(736, 2, 1475505546, 'scorm', 'grademethod', '1', NULL),
	(737, 2, 1475505546, 'scorm', 'maxgrade', '100', NULL),
	(738, 2, 1475505546, 'scorm', 'maxattempt', '0', NULL),
	(739, 2, 1475505546, 'scorm', 'whatgrade', '0', NULL),
	(740, 2, 1475505546, 'scorm', 'forcecompleted', '0', NULL),
	(741, 2, 1475505546, 'scorm', 'forcenewattempt', '0', NULL),
	(742, 2, 1475505546, 'scorm', 'autocommit', '0', NULL),
	(743, 2, 1475505546, 'scorm', 'masteryoverride', '1', NULL),
	(744, 2, 1475505546, 'scorm', 'lastattemptlock', '0', NULL),
	(745, 2, 1475505546, 'scorm', 'auto', '0', NULL),
	(746, 2, 1475505546, 'scorm', 'updatefreq', '0', NULL),
	(747, 2, 1475505546, 'scorm', 'scorm12standard', '1', NULL),
	(748, 2, 1475505547, 'scorm', 'allowtypeexternal', '0', NULL),
	(749, 2, 1475505547, 'scorm', 'allowtypelocalsync', '0', NULL),
	(750, 2, 1475505547, 'scorm', 'allowtypeexternalaicc', '0', NULL),
	(751, 2, 1475505548, 'scorm', 'allowaicchacp', '0', NULL),
	(752, 2, 1475505548, 'scorm', 'aicchacptimeout', '30', NULL),
	(753, 2, 1475505548, 'scorm', 'aicchacpkeepsessiondata', '1', NULL),
	(754, 2, 1475505548, 'scorm', 'aiccuserid', '1', NULL),
	(755, 2, 1475505548, 'scorm', 'forcejavascript', '1', NULL),
	(756, 2, 1475505548, 'scorm', 'allowapidebug', '0', NULL),
	(757, 2, 1475505548, 'scorm', 'apidebugmask', '.*', NULL),
	(758, 2, 1475505548, 'scorm', 'protectpackagedownloads', '0', NULL),
	(759, 2, 1475505548, 'url', 'framesize', '130', NULL),
	(760, 2, 1475505548, 'url', 'secretphrase', '', NULL),
	(761, 2, 1475505548, 'url', 'rolesinparams', '0', NULL),
	(762, 2, 1475505548, 'url', 'displayoptions', '0,1,5,6', NULL),
	(763, 2, 1475505548, 'url', 'printintro', '1', NULL),
	(764, 2, 1475505549, 'url', 'display', '0', NULL),
	(765, 2, 1475505549, 'url', 'popupwidth', '620', NULL),
	(766, 2, 1475505549, 'url', 'popupheight', '450', NULL),
	(767, 2, 1475505549, 'workshop', 'grade', '80', NULL),
	(768, 2, 1475505549, 'workshop', 'gradinggrade', '20', NULL),
	(769, 2, 1475505549, 'workshop', 'gradedecimals', '0', NULL),
	(770, 2, 1475505549, 'workshop', 'maxbytes', '0', NULL),
	(771, 2, 1475505549, 'workshop', 'strategy', 'accumulative', NULL),
	(772, 2, 1475505549, 'workshop', 'examplesmode', '0', NULL),
	(773, 2, 1475505549, 'workshopallocation_random', 'numofreviews', '5', NULL),
	(774, 2, 1475505549, 'workshopform_numerrors', 'grade0', 'Não', NULL),
	(775, 2, 1475505549, 'workshopform_numerrors', 'grade1', 'Sim', NULL),
	(776, 2, 1475505549, 'workshopeval_best', 'comparison', '5', NULL),
	(777, 2, 1475505550, NULL, 'block_course_list_adminview', 'all', NULL),
	(778, 2, 1475505550, NULL, 'block_course_list_hideallcourseslink', '0', NULL),
	(779, 2, 1475505550, 'block_course_overview', 'defaultmaxcourses', '10', NULL),
	(780, 2, 1475505550, 'block_course_overview', 'forcedefaultmaxcourses', '0', NULL),
	(781, 2, 1475505550, 'block_course_overview', 'showchildren', '0', NULL),
	(782, 2, 1475505550, 'block_course_overview', 'showwelcomearea', '0', NULL),
	(783, 2, 1475505550, 'block_course_overview', 'showcategories', '0', NULL),
	(784, 2, 1475505550, NULL, 'block_html_allowcssclasses', '0', NULL),
	(785, 2, 1475505550, NULL, 'block_online_users_timetosee', '5', NULL),
	(786, 2, 1475505550, NULL, 'block_rss_client_num_entries', '5', NULL),
	(787, 2, 1475505550, NULL, 'block_rss_client_timeout', '30', NULL),
	(788, 2, 1475505550, 'block_section_links', 'numsections1', '22', NULL),
	(789, 2, 1475505550, 'block_section_links', 'incby1', '2', NULL),
	(790, 2, 1475505551, 'block_section_links', 'numsections2', '40', NULL),
	(791, 2, 1475505551, 'block_section_links', 'incby2', '5', NULL),
	(792, 2, 1475505551, 'block_tag_youtube', 'apikey', '', NULL),
	(793, 2, 1475505551, 'editor_atto', 'toolbar', 'collapse = collapse\nstyle1 = title, bold, italic\nlist = unorderedlist, orderedlist\nlinks = link\nfiles = image, media, managefiles\nstyle2 = underline, strike, subscript, superscript\nalign = align\nindent = indent\ninsert = equation, charmap, table, clear\nundo = undo\naccessibility = accessibilitychecker, accessibilityhelper\nother = html', NULL),
	(794, 2, 1475505551, 'editor_atto', 'autosavefrequency', '60', NULL),
	(795, 2, 1475505551, 'atto_collapse', 'showgroups', '5', NULL),
	(796, 2, 1475505551, 'atto_equation', 'librarygroup1', '\n\\cdot\n\\times\n\\ast\n\\div\n\\diamond\n\\pm\n\\mp\n\\oplus\n\\ominus\n\\otimes\n\\oslash\n\\odot\n\\circ\n\\bullet\n\\asymp\n\\equiv\n\\subseteq\n\\supseteq\n\\leq\n\\geq\n\\preceq\n\\succeq\n\\sim\n\\simeq\n\\approx\n\\subset\n\\supset\n\\ll\n\\gg\n\\prec\n\\succ\n\\infty\n\\in\n\\ni\n\\forall\n\\exists\n\\neq\n', NULL),
	(797, 2, 1475505551, 'atto_equation', 'librarygroup2', '\n\\leftarrow\n\\rightarrow\n\\uparrow\n\\downarrow\n\\leftrightarrow\n\\nearrow\n\\searrow\n\\swarrow\n\\nwarrow\n\\Leftarrow\n\\Rightarrow\n\\Uparrow\n\\Downarrow\n\\Leftrightarrow\n', NULL),
	(798, 2, 1475505551, 'atto_equation', 'librarygroup3', '\n\\alpha\n\\beta\n\\gamma\n\\delta\n\\epsilon\n\\zeta\n\\eta\n\\theta\n\\iota\n\\kappa\n\\lambda\n\\mu\n\\nu\n\\xi\n\\pi\n\\rho\n\\sigma\n\\tau\n\\upsilon\n\\phi\n\\chi\n\\psi\n\\omega\n\\Gamma\n\\Delta\n\\Theta\n\\Lambda\n\\Xi\n\\Pi\n\\Sigma\n\\Upsilon\n\\Phi\n\\Psi\n\\Omega\n', NULL),
	(799, 2, 1475505551, 'atto_equation', 'librarygroup4', '\n\\sum{a,b}\n\\sqrt[a]{b+c}\n\\int_{a}^{b}{c}\n\\iint_{a}^{b}{c}\n\\iiint_{a}^{b}{c}\n\\oint{a}\n(a)\n[a]\n\\lbrace{a}\\rbrace\n\\left| \\begin{matrix} a_1 & a_2 \\ a_3 & a_4 \\end{matrix} \\right|\n\\frac{a}{b+c}\n\\vec{a}\n\\binom {a} {b}\n{a \\brack b}\n{a \\brace b}\n', NULL),
	(800, 2, 1475505551, 'atto_table', 'allowborders', '0', NULL),
	(801, 2, 1475505551, 'atto_table', 'allowbackgroundcolour', '0', NULL),
	(802, 2, 1475505551, 'atto_table', 'allowwidth', '0', NULL),
	(803, 2, 1475505551, 'editor_tinymce', 'customtoolbar', 'wrap,formatselect,wrap,bold,italic,wrap,bullist,numlist,wrap,link,unlink,wrap,image\n\nundo,redo,wrap,underline,strikethrough,sub,sup,wrap,justifyleft,justifycenter,justifyright,wrap,outdent,indent,wrap,forecolor,backcolor,wrap,ltr,rtl\n\nfontselect,fontsizeselect,wrap,code,search,replace,wrap,nonbreaking,charmap,table,wrap,cleanup,removeformat,pastetext,pasteword,wrap,fullscreen', NULL),
	(804, 2, 1475505552, 'editor_tinymce', 'fontselectlist', 'Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings', NULL),
	(805, 2, 1475505552, 'editor_tinymce', 'customconfig', '', NULL),
	(806, 2, 1475505552, 'tinymce_moodleemoticon', 'requireemoticon', '1', NULL),
	(807, 2, 1475505552, 'tinymce_spellchecker', 'spellengine', '', NULL),
	(808, 2, 1475505552, 'tinymce_spellchecker', 'spelllanguagelist', '+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv', NULL),
	(809, 2, 1475505552, 'tool_recyclebin', 'coursebinenable', '1', NULL),
	(810, 2, 1475505552, 'tool_recyclebin', 'coursebinexpiry', '604800', NULL),
	(811, 2, 1475505552, 'tool_recyclebin', 'categorybinenable', '1', NULL),
	(812, 2, 1475505552, 'tool_recyclebin', 'categorybinexpiry', '604800', NULL),
	(813, 2, 1475505552, 'tool_recyclebin', 'autohide', '1', NULL),
	(814, 2, 1475505552, NULL, 'filter_censor_badwords', '', NULL),
	(815, 2, 1475505552, 'filter_emoticon', 'formats', '1,4,0', NULL),
	(816, 2, 1475505552, 'filter_mathjaxloader', 'httpurl', 'http://cdn.mathjax.org/mathjax/2.6-latest/MathJax.js', NULL),
	(817, 2, 1475505552, 'filter_mathjaxloader', 'httpsurl', 'https://cdn.mathjax.org/mathjax/2.6-latest/MathJax.js', NULL),
	(818, 2, 1475505552, 'filter_mathjaxloader', 'texfiltercompatibility', '0', NULL),
	(819, 2, 1475505553, 'filter_mathjaxloader', 'mathjaxconfig', '\nMathJax.Hub.Config({\n    config: ["Accessible.js", "Safe.js"],\n    errorSettings: { message: ["!"] },\n    skipStartupTypeset: true,\n    messageStyle: "none"\n});\n', NULL),
	(820, 2, 1475505553, 'filter_mathjaxloader', 'additionaldelimiters', '', NULL),
	(821, 2, 1475505553, NULL, 'filter_multilang_force_old', '0', NULL),
	(822, 2, 1475505553, 'filter_tex', 'latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n', NULL),
	(823, 2, 1475505553, 'filter_tex', 'latexbackground', '#FFFFFF', NULL),
	(824, 2, 1475505553, 'filter_tex', 'density', '120', NULL),
	(825, 2, 1475505553, 'filter_tex', 'pathlatex', '/usr/bin/latex', NULL),
	(826, 2, 1475505553, 'filter_tex', 'pathdvips', '/usr/bin/dvips', NULL),
	(827, 2, 1475505553, 'filter_tex', 'pathconvert', '/usr/bin/convert', NULL),
	(828, 2, 1475505553, 'filter_tex', 'pathdvisvgm', '/usr/bin/dvisvgm', NULL),
	(829, 2, 1475505553, 'filter_tex', 'pathmimetex', '', NULL),
	(830, 2, 1475505553, 'filter_tex', 'convertformat', 'gif', NULL),
	(831, 2, 1475505553, 'filter_urltolink', 'formats', '0', NULL),
	(832, 2, 1475505553, 'filter_urltolink', 'embedimages', '1', NULL),
	(833, 2, 1475505554, 'format_singleactivity', 'activitytype', 'forum', NULL),
	(834, 2, 1475505554, 'enrol_cohort', 'roleid', '5', NULL),
	(835, 2, 1475505554, 'enrol_cohort', 'unenrolaction', '0', NULL),
	(836, 2, 1475505554, 'enrol_database', 'dbtype', '', NULL),
	(837, 2, 1475505554, 'enrol_database', 'dbhost', 'localhost', NULL),
	(838, 2, 1475505554, 'enrol_database', 'dbuser', '', NULL),
	(839, 2, 1475505554, 'enrol_database', 'dbpass', '', NULL),
	(840, 2, 1475505554, 'enrol_database', 'dbname', '', NULL),
	(841, 2, 1475505554, 'enrol_database', 'dbencoding', 'utf-8', NULL),
	(842, 2, 1475505554, 'enrol_database', 'dbsetupsql', '', NULL),
	(843, 2, 1475505554, 'enrol_database', 'dbsybasequoting', '0', NULL),
	(844, 2, 1475505554, 'enrol_database', 'debugdb', '0', NULL),
	(845, 2, 1475505554, 'enrol_database', 'localcoursefield', 'idnumber', NULL),
	(846, 2, 1475505554, 'enrol_database', 'localuserfield', 'idnumber', NULL),
	(847, 2, 1475505555, 'enrol_database', 'localrolefield', 'shortname', NULL),
	(848, 2, 1475505555, 'enrol_database', 'localcategoryfield', 'id', NULL),
	(849, 2, 1475505555, 'enrol_database', 'remoteenroltable', '', NULL),
	(850, 2, 1475505555, 'enrol_database', 'remotecoursefield', '', NULL),
	(851, 2, 1475505555, 'enrol_database', 'remoteuserfield', '', NULL),
	(852, 2, 1475505555, 'enrol_database', 'remoterolefield', '', NULL),
	(853, 2, 1475505555, 'enrol_database', 'remoteotheruserfield', '', NULL),
	(854, 2, 1475505555, 'enrol_database', 'defaultrole', '5', NULL),
	(855, 2, 1475505555, 'enrol_database', 'ignorehiddencourses', '0', NULL),
	(856, 2, 1475505555, 'enrol_database', 'unenrolaction', '0', NULL),
	(857, 2, 1475505555, 'enrol_database', 'newcoursetable', '', NULL),
	(858, 2, 1475505555, 'enrol_database', 'newcoursefullname', 'fullname', NULL),
	(859, 2, 1475505555, 'enrol_database', 'newcourseshortname', 'shortname', NULL),
	(860, 2, 1475505555, 'enrol_database', 'newcourseidnumber', 'idnumber', NULL),
	(861, 2, 1475505555, 'enrol_database', 'newcoursecategory', '', NULL),
	(862, 2, 1475505555, 'enrol_database', 'defaultcategory', '1', NULL),
	(863, 2, 1475505556, 'enrol_database', 'templatecourse', '', NULL),
	(864, 2, 1475505556, 'enrol_flatfile', 'location', '', NULL),
	(865, 2, 1475505556, 'enrol_flatfile', 'encoding', 'UTF-8', NULL),
	(866, 2, 1475505556, 'enrol_flatfile', 'mailstudents', '0', NULL),
	(867, 2, 1475505556, 'enrol_flatfile', 'mailteachers', '0', NULL),
	(868, 2, 1475505556, 'enrol_flatfile', 'mailadmins', '0', NULL),
	(869, 2, 1475505556, 'enrol_flatfile', 'unenrolaction', '3', NULL),
	(870, 2, 1475505556, 'enrol_flatfile', 'expiredaction', '3', NULL),
	(871, 2, 1475505556, 'enrol_guest', 'requirepassword', '0', NULL),
	(872, 2, 1475505556, 'enrol_guest', 'usepasswordpolicy', '0', NULL),
	(873, 2, 1475505556, 'enrol_guest', 'showhint', '0', NULL),
	(874, 2, 1475505556, 'enrol_guest', 'defaultenrol', '1', NULL),
	(875, 2, 1475505557, 'enrol_guest', 'status', '1', NULL),
	(876, 2, 1475505557, 'enrol_guest', 'status_adv', '', NULL),
	(877, 2, 1475505557, 'enrol_imsenterprise', 'imsfilelocation', '', NULL),
	(878, 2, 1475505557, 'enrol_imsenterprise', 'logtolocation', '', NULL),
	(879, 2, 1475505557, 'enrol_imsenterprise', 'mailadmins', '0', NULL),
	(880, 2, 1475505557, 'enrol_imsenterprise', 'createnewusers', '0', NULL),
	(881, 2, 1475505557, 'enrol_imsenterprise', 'imsdeleteusers', '0', NULL),
	(882, 2, 1475505557, 'enrol_imsenterprise', 'fixcaseusernames', '0', NULL),
	(883, 2, 1475505557, 'enrol_imsenterprise', 'fixcasepersonalnames', '0', NULL),
	(884, 2, 1475505557, 'enrol_imsenterprise', 'imssourcedidfallback', '0', NULL),
	(885, 2, 1475505557, 'enrol_imsenterprise', 'imsrolemap01', '5', NULL),
	(886, 2, 1475505557, 'enrol_imsenterprise', 'imsrolemap02', '3', NULL),
	(887, 2, 1475505557, 'enrol_imsenterprise', 'imsrolemap03', '3', NULL),
	(888, 2, 1475505557, 'enrol_imsenterprise', 'imsrolemap04', '5', NULL),
	(889, 2, 1475505558, 'enrol_imsenterprise', 'imsrolemap05', '0', NULL),
	(890, 2, 1475505558, 'enrol_imsenterprise', 'imsrolemap06', '4', NULL),
	(891, 2, 1475505558, 'enrol_imsenterprise', 'imsrolemap07', '0', NULL),
	(892, 2, 1475505559, 'enrol_imsenterprise', 'imsrolemap08', '4', NULL),
	(893, 2, 1475505559, 'enrol_imsenterprise', 'truncatecoursecodes', '0', NULL),
	(894, 2, 1475505559, 'enrol_imsenterprise', 'createnewcourses', '0', NULL),
	(895, 2, 1475505559, 'enrol_imsenterprise', 'createnewcategories', '0', NULL),
	(896, 2, 1475505559, 'enrol_imsenterprise', 'imsunenrol', '0', NULL),
	(897, 2, 1475505559, 'enrol_imsenterprise', 'imscoursemapshortname', 'coursecode', NULL),
	(898, 2, 1475505559, 'enrol_imsenterprise', 'imscoursemapfullname', 'short', NULL),
	(899, 2, 1475505559, 'enrol_imsenterprise', 'imscoursemapsummary', 'ignore', NULL),
	(900, 2, 1475505559, 'enrol_imsenterprise', 'imsrestricttarget', '', NULL),
	(901, 2, 1475505559, 'enrol_imsenterprise', 'imscapitafix', '0', NULL),
	(902, 2, 1475505559, 'enrol_lti', 'emaildisplay', '2', NULL),
	(903, 2, 1475505559, 'enrol_lti', 'city', '', NULL),
	(904, 2, 1475505559, 'enrol_lti', 'country', '', NULL),
	(905, 2, 1475505560, 'enrol_lti', 'timezone', '99', NULL),
	(906, 2, 1475505560, 'enrol_lti', 'lang', 'pt_br', NULL),
	(907, 2, 1475505560, 'enrol_lti', 'institution', '', NULL),
	(908, 2, 1475505560, 'enrol_manual', 'expiredaction', '1', NULL),
	(909, 2, 1475505560, 'enrol_manual', 'expirynotifyhour', '6', NULL),
	(910, 2, 1475505560, 'enrol_manual', 'defaultenrol', '1', NULL),
	(911, 2, 1475505560, 'enrol_manual', 'status', '0', NULL),
	(912, 2, 1475505560, 'enrol_manual', 'roleid', '5', NULL),
	(913, 2, 1475505561, 'enrol_manual', 'enrolstart', '4', NULL),
	(914, 2, 1475505561, 'enrol_manual', 'enrolperiod', '0', NULL),
	(915, 2, 1475505561, 'enrol_manual', 'expirynotify', '0', NULL),
	(916, 2, 1475505561, 'enrol_manual', 'expirythreshold', '86400', NULL),
	(917, 2, 1475505561, 'enrol_meta', 'nosyncroleids', '', NULL),
	(918, 2, 1475505561, 'enrol_meta', 'syncall', '1', NULL),
	(919, 2, 1475505561, 'enrol_meta', 'unenrolaction', '3', NULL),
	(920, 2, 1475505561, 'enrol_meta', 'coursesort', 'sortorder', NULL),
	(921, 2, 1475505561, 'enrol_mnet', 'roleid', '5', NULL),
	(922, 2, 1475505561, 'enrol_mnet', 'roleid_adv', '1', NULL),
	(923, 2, 1475505561, 'enrol_paypal', 'paypalbusiness', '', NULL),
	(924, 2, 1475505562, 'enrol_paypal', 'mailstudents', '0', NULL),
	(925, 2, 1475505562, 'enrol_paypal', 'mailteachers', '0', NULL),
	(926, 2, 1475505562, 'enrol_paypal', 'mailadmins', '0', NULL),
	(927, 2, 1475505562, 'enrol_paypal', 'expiredaction', '3', NULL),
	(928, 2, 1475505562, 'enrol_paypal', 'status', '1', NULL),
	(929, 2, 1475505562, 'enrol_paypal', 'cost', '0', NULL),
	(930, 2, 1475505562, 'enrol_paypal', 'currency', 'USD', NULL),
	(931, 2, 1475505562, 'enrol_paypal', 'roleid', '5', NULL),
	(932, 2, 1475505562, 'enrol_paypal', 'enrolperiod', '0', NULL),
	(933, 2, 1475505562, 'enrol_self', 'requirepassword', '0', NULL),
	(934, 2, 1475505562, 'enrol_self', 'usepasswordpolicy', '0', NULL),
	(935, 2, 1475505562, 'enrol_self', 'showhint', '0', NULL),
	(936, 2, 1475505562, 'enrol_self', 'expiredaction', '1', NULL),
	(937, 2, 1475505562, 'enrol_self', 'expirynotifyhour', '6', NULL),
	(938, 2, 1475505562, 'enrol_self', 'defaultenrol', '1', NULL),
	(939, 2, 1475505563, 'enrol_self', 'status', '1', NULL),
	(940, 2, 1475505563, 'enrol_self', 'newenrols', '1', NULL),
	(941, 2, 1475505563, 'enrol_self', 'groupkey', '0', NULL),
	(942, 2, 1475505563, 'enrol_self', 'roleid', '5', NULL),
	(943, 2, 1475505563, 'enrol_self', 'enrolperiod', '0', NULL),
	(944, 2, 1475505563, 'enrol_self', 'expirynotify', '0', NULL),
	(945, 2, 1475505563, 'enrol_self', 'expirythreshold', '86400', NULL),
	(946, 2, 1475505563, 'enrol_self', 'longtimenosee', '0', NULL),
	(947, 2, 1475505563, 'enrol_self', 'maxenrolled', '0', NULL),
	(948, 2, 1475505563, 'enrol_self', 'sendcoursewelcomemessage', '1', NULL),
	(949, 2, 1475505563, 'logstore_database', 'dbdriver', '', NULL),
	(950, 2, 1475505563, 'logstore_database', 'dbhost', '', NULL),
	(951, 2, 1475505564, 'logstore_database', 'dbuser', '', NULL),
	(952, 2, 1475505564, 'logstore_database', 'dbpass', '', NULL),
	(953, 2, 1475505564, 'logstore_database', 'dbname', '', NULL),
	(954, 2, 1475505564, 'logstore_database', 'dbtable', '', NULL),
	(955, 2, 1475505564, 'logstore_database', 'dbpersist', '0', NULL),
	(956, 2, 1475505564, 'logstore_database', 'dbsocket', '', NULL),
	(957, 2, 1475505564, 'logstore_database', 'dbport', '', NULL),
	(958, 2, 1475505564, 'logstore_database', 'dbschema', '', NULL),
	(959, 2, 1475505564, 'logstore_database', 'dbcollation', '', NULL),
	(960, 2, 1475505564, 'logstore_database', 'buffersize', '50', NULL),
	(961, 2, 1475505564, 'logstore_database', 'logguests', '0', NULL),
	(962, 2, 1475505564, 'logstore_database', 'includelevels', '1,2,0', NULL),
	(963, 2, 1475505565, 'logstore_database', 'includeactions', 'c,r,u,d', NULL),
	(964, 2, 1475505565, 'logstore_legacy', 'loglegacy', '0', NULL),
	(965, 2, 1475505565, NULL, 'logguests', '1', NULL),
	(966, 2, 1475505565, NULL, 'loglifetime', '0', NULL),
	(967, 2, 1475505565, 'logstore_standard', 'logguests', '1', NULL),
	(968, 2, 1475505565, 'logstore_standard', 'loglifetime', '0', NULL),
	(969, 2, 1475505565, 'logstore_standard', 'buffersize', '50', NULL),
	(970, 2, 1475505565, 'antivirus_clamav', 'pathtoclam', '', NULL),
	(971, 2, 1475505565, 'antivirus_clamav', 'quarantinedir', '', NULL),
	(972, 2, 1475505565, 'antivirus_clamav', 'clamfailureonupload', 'donothing', NULL),
	(973, 2, 1475505565, NULL, 'airnotifierurl', 'https://messages.moodle.net', NULL),
	(974, 2, 1475505565, NULL, 'airnotifierport', '443', NULL),
	(975, 2, 1475505565, NULL, 'airnotifiermobileappname', 'com.moodle.moodlemobile', NULL),
	(976, 2, 1475505565, NULL, 'airnotifierappname', 'commoodlemoodlemobile', NULL),
	(977, 2, 1475505566, NULL, 'airnotifieraccesskey', '', NULL),
	(978, 2, 1475505566, NULL, 'smtphosts', '', NULL),
	(979, 2, 1475505566, NULL, 'smtpsecure', '', NULL),
	(980, 2, 1475505566, NULL, 'smtpauthtype', 'LOGIN', NULL),
	(981, 2, 1475505566, NULL, 'smtpuser', '', NULL),
	(982, 2, 1475505566, NULL, 'smtppass', '', NULL),
	(983, 2, 1475505566, NULL, 'smtpmaxbulk', '1', NULL),
	(984, 2, 1475505566, NULL, 'noreplyaddress', 'noreply@localhost', NULL),
	(985, 2, 1475505566, NULL, 'emailonlyfromnoreplyaddress', '0', NULL),
	(986, 2, 1475505566, NULL, 'sitemailcharset', '0', NULL),
	(987, 2, 1475505566, NULL, 'allowusermailcharset', '0', NULL),
	(988, 2, 1475505566, NULL, 'allowattachments', '1', NULL),
	(989, 2, 1475505567, NULL, 'mailnewline', 'LF', NULL),
	(990, 2, 1475505567, NULL, 'jabberhost', '', NULL),
	(991, 2, 1475505567, NULL, 'jabberserver', '', NULL),
	(992, 2, 1475505567, NULL, 'jabberusername', '', NULL),
	(993, 2, 1475505567, NULL, 'jabberpassword', '', NULL),
	(994, 2, 1475505567, NULL, 'jabberport', '5222', NULL),
	(995, 2, 1475505567, NULL, 'enablemobilewebservice', '0', NULL),
	(996, 2, 1475505567, NULL, 'profileroles', '5,4,3', NULL),
	(997, 2, 1475505567, NULL, 'coursecontact', '3', NULL),
	(998, 2, 1475505567, NULL, 'frontpage', '6', NULL),
	(999, 2, 1475505568, NULL, 'frontpageloggedin', '6', NULL),
	(1000, 2, 1475505568, NULL, 'maxcategorydepth', '2', NULL),
	(1001, 2, 1475505568, NULL, 'frontpagecourselimit', '200', NULL),
	(1002, 2, 1475505568, NULL, 'commentsperpage', '15', NULL),
	(1003, 2, 1475505568, NULL, 'defaultfrontpageroleid', '8', NULL),
	(1004, 2, 1475505568, NULL, 'messageinbound_enabled', '0', NULL),
	(1005, 2, 1475505568, NULL, 'messageinbound_mailbox', '', NULL),
	(1006, 2, 1475505568, NULL, 'messageinbound_domain', '', NULL),
	(1007, 2, 1475505568, NULL, 'messageinbound_host', '', NULL),
	(1008, 2, 1475505568, NULL, 'messageinbound_hostssl', 'ssl', NULL),
	(1009, 2, 1475505568, NULL, 'messageinbound_hostuser', '', NULL),
	(1010, 2, 1475505568, NULL, 'messageinbound_hostpass', '', NULL),
	(1011, 2, 1475506359, NULL, 'timezone', 'America/Sao_Paulo', NULL),
	(1012, 2, 1475506359, NULL, 'registerauth', '', NULL),
	(1013, 2, 1475526659, NULL, 'profileroles', '3,4,5', '5,4,3'),
	(1014, 2, 1475526659, NULL, 'minpasswordlength', '4', '8'),
	(1015, 2, 1475526659, NULL, 'minpassworddigits', '0', '1'),
	(1016, 2, 1475526659, NULL, 'minpasswordlower', '0', '1'),
	(1017, 2, 1475526659, NULL, 'minpasswordupper', '0', '1'),
	(1018, 2, 1475526659, NULL, 'minpasswordnonalphanum', '0', '1'),
	(1019, 2, 1475526872, NULL, 'frontpage', '', '6'),
	(1020, 2, 1475526872, NULL, 'frontpageloggedin', '4', '6'),
	(1021, 2, 1475527020, NULL, 'defaulthomepage', '0', '1');
/*!40000 ALTER TABLE `mdl_config_log` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_config_plugins
CREATE TABLE IF NOT EXISTS `mdl_config_plugins` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'core',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_confplug_plunam_uix` (`plugin`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1256 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Moodle modules and plugins configuration variables';

-- Copiando dados para a tabela capacitacoes.mdl_config_plugins: ~1.149 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_config_plugins` DISABLE KEYS */;
INSERT INTO `mdl_config_plugins` (`id`, `plugin`, `name`, `value`) VALUES
	(1, 'question', 'multichoice_sortorder', '1'),
	(2, 'question', 'truefalse_sortorder', '2'),
	(3, 'question', 'match_sortorder', '3'),
	(4, 'question', 'shortanswer_sortorder', '4'),
	(5, 'question', 'numerical_sortorder', '5'),
	(6, 'question', 'essay_sortorder', '6'),
	(7, 'moodlecourse', 'visible', '1'),
	(8, 'moodlecourse', 'format', 'weeks'),
	(9, 'moodlecourse', 'maxsections', '52'),
	(10, 'moodlecourse', 'numsections', '10'),
	(11, 'moodlecourse', 'hiddensections', '0'),
	(12, 'moodlecourse', 'coursedisplay', '0'),
	(13, 'moodlecourse', 'lang', ''),
	(14, 'moodlecourse', 'newsitems', '5'),
	(15, 'moodlecourse', 'showgrades', '1'),
	(16, 'moodlecourse', 'showreports', '0'),
	(17, 'moodlecourse', 'maxbytes', '0'),
	(18, 'moodlecourse', 'enablecompletion', '0'),
	(19, 'moodlecourse', 'groupmode', '0'),
	(20, 'moodlecourse', 'groupmodeforce', '0'),
	(21, 'backup', 'loglifetime', '30'),
	(22, 'backup', 'backup_general_users', '1'),
	(23, 'backup', 'backup_general_users_locked', ''),
	(24, 'backup', 'backup_general_anonymize', '0'),
	(25, 'backup', 'backup_general_anonymize_locked', ''),
	(26, 'backup', 'backup_general_role_assignments', '1'),
	(27, 'backup', 'backup_general_role_assignments_locked', ''),
	(28, 'backup', 'backup_general_activities', '1'),
	(29, 'backup', 'backup_general_activities_locked', ''),
	(30, 'backup', 'backup_general_blocks', '1'),
	(31, 'backup', 'backup_general_blocks_locked', ''),
	(32, 'backup', 'backup_general_filters', '1'),
	(33, 'backup', 'backup_general_filters_locked', ''),
	(34, 'backup', 'backup_general_comments', '1'),
	(35, 'backup', 'backup_general_comments_locked', ''),
	(36, 'backup', 'backup_general_badges', '1'),
	(37, 'backup', 'backup_general_badges_locked', ''),
	(38, 'backup', 'backup_general_userscompletion', '1'),
	(39, 'backup', 'backup_general_userscompletion_locked', ''),
	(40, 'backup', 'backup_general_logs', '0'),
	(41, 'backup', 'backup_general_logs_locked', ''),
	(42, 'backup', 'backup_general_histories', '0'),
	(43, 'backup', 'backup_general_histories_locked', ''),
	(44, 'backup', 'backup_general_questionbank', '1'),
	(45, 'backup', 'backup_general_questionbank_locked', ''),
	(46, 'backup', 'backup_general_groups', '1'),
	(47, 'backup', 'backup_general_groups_locked', ''),
	(48, 'backup', 'import_general_maxresults', '10'),
	(49, 'backup', 'import_general_duplicate_admin_allowed', '0'),
	(50, 'backup', 'backup_auto_active', '0'),
	(51, 'backup', 'backup_auto_weekdays', '0000000'),
	(52, 'backup', 'backup_auto_hour', '0'),
	(53, 'backup', 'backup_auto_minute', '0'),
	(54, 'backup', 'backup_auto_storage', '0'),
	(55, 'backup', 'backup_auto_destination', ''),
	(56, 'backup', 'backup_auto_max_kept', '1'),
	(57, 'backup', 'backup_auto_delete_days', '0'),
	(58, 'backup', 'backup_auto_min_kept', '0'),
	(59, 'backup', 'backup_shortname', '0'),
	(60, 'backup', 'backup_auto_skip_hidden', '1'),
	(61, 'backup', 'backup_auto_skip_modif_days', '30'),
	(62, 'backup', 'backup_auto_skip_modif_prev', '0'),
	(63, 'backup', 'backup_auto_users', '1'),
	(64, 'backup', 'backup_auto_role_assignments', '1'),
	(65, 'backup', 'backup_auto_activities', '1'),
	(66, 'backup', 'backup_auto_blocks', '1'),
	(67, 'backup', 'backup_auto_filters', '1'),
	(68, 'backup', 'backup_auto_comments', '1'),
	(69, 'backup', 'backup_auto_badges', '1'),
	(70, 'backup', 'backup_auto_userscompletion', '1'),
	(71, 'backup', 'backup_auto_logs', '0'),
	(72, 'backup', 'backup_auto_histories', '0'),
	(73, 'backup', 'backup_auto_questionbank', '1'),
	(74, 'backup', 'backup_auto_groups', '1'),
	(75, 'core_competency', 'enabled', '1'),
	(76, 'core_competency', 'pushcourseratingstouserplans', '1'),
	(77, 'cachestore_memcache', 'testservers', ''),
	(78, 'cachestore_memcached', 'testservers', ''),
	(79, 'cachestore_mongodb', 'testserver', ''),
	(80, 'mod_assign', 'search_activity_enabled', '1'),
	(81, 'mod_book', 'search_activity_enabled', '1'),
	(82, 'mod_book', 'search_chapter_enabled', '1'),
	(83, 'mod_chat', 'search_activity_enabled', '1'),
	(84, 'mod_choice', 'search_activity_enabled', '1'),
	(85, 'mod_data', 'search_activity_enabled', '1'),
	(86, 'mod_feedback', 'search_activity_enabled', '1'),
	(87, 'mod_folder', 'search_activity_enabled', '1'),
	(88, 'mod_forum', 'search_activity_enabled', '1'),
	(89, 'mod_forum', 'search_post_enabled', '1'),
	(90, 'mod_glossary', 'search_activity_enabled', '1'),
	(91, 'mod_glossary', 'search_entry_enabled', '1'),
	(92, 'mod_imscp', 'search_activity_enabled', '1'),
	(93, 'mod_label', 'search_activity_enabled', '1'),
	(94, 'mod_lesson', 'search_activity_enabled', '1'),
	(95, 'mod_lti', 'search_activity_enabled', '1'),
	(96, 'mod_page', 'search_activity_enabled', '1'),
	(97, 'mod_quiz', 'search_activity_enabled', '1'),
	(98, 'mod_resource', 'search_activity_enabled', '1'),
	(99, 'mod_scorm', 'search_activity_enabled', '1'),
	(100, 'mod_survey', 'search_activity_enabled', '1'),
	(101, 'mod_url', 'search_activity_enabled', '1'),
	(102, 'mod_wiki', 'search_activity_enabled', '1'),
	(103, 'mod_wiki', 'search_collaborative_page_enabled', '1'),
	(104, 'mod_workshop', 'search_activity_enabled', '1'),
	(105, 'core_search', 'core_course_mycourse_enabled', '1'),
	(106, 'question_preview', 'behaviour', 'deferredfeedback'),
	(107, 'question_preview', 'correctness', '1'),
	(108, 'question_preview', 'marks', '2'),
	(109, 'question_preview', 'markdp', '2'),
	(110, 'question_preview', 'feedback', '1'),
	(111, 'question_preview', 'generalfeedback', '1'),
	(112, 'question_preview', 'rightanswer', '1'),
	(113, 'question_preview', 'history', '0'),
	(114, 'theme_clean', 'invert', '0'),
	(115, 'theme_clean', 'logo', ''),
	(116, 'theme_clean', 'smalllogo', ''),
	(117, 'theme_clean', 'sitename', '1'),
	(118, 'theme_clean', 'customcss', ''),
	(119, 'theme_clean', 'footnote', ''),
	(120, 'theme_more', 'textcolor', '#333366'),
	(121, 'theme_more', 'linkcolor', '#FF6500'),
	(122, 'theme_more', 'bodybackground', ''),
	(123, 'theme_more', 'backgroundimage', ''),
	(124, 'theme_more', 'backgroundrepeat', 'repeat'),
	(125, 'theme_more', 'backgroundposition', '0'),
	(126, 'theme_more', 'backgroundfixed', '0'),
	(127, 'theme_more', 'contentbackground', '#FFFFFF'),
	(128, 'theme_more', 'secondarybackground', '#FFFFFF'),
	(129, 'theme_more', 'invert', '1'),
	(130, 'theme_more', 'logo', ''),
	(131, 'theme_more', 'smalllogo', ''),
	(132, 'theme_more', 'sitename', '1'),
	(133, 'theme_more', 'customcss', ''),
	(134, 'theme_more', 'footnote', ''),
	(135, 'antivirus_clamav', 'version', '2016052300'),
	(136, 'availability_completion', 'version', '2016052300'),
	(137, 'availability_date', 'version', '2016052300'),
	(138, 'availability_grade', 'version', '2016052300'),
	(139, 'availability_group', 'version', '2016052300'),
	(140, 'availability_grouping', 'version', '2016052300'),
	(141, 'availability_profile', 'version', '2016052300'),
	(142, 'qtype_calculated', 'version', '2016052300'),
	(143, 'qtype_calculatedmulti', 'version', '2016052300'),
	(144, 'qtype_calculatedsimple', 'version', '2016052300'),
	(145, 'qtype_ddimageortext', 'version', '2016052300'),
	(146, 'qtype_ddmarker', 'version', '2016052300'),
	(147, 'qtype_ddwtos', 'version', '2016052300'),
	(148, 'qtype_description', 'version', '2016052300'),
	(149, 'qtype_essay', 'version', '2016052300'),
	(150, 'qtype_gapselect', 'version', '2016052300'),
	(151, 'qtype_match', 'version', '2016052300'),
	(152, 'qtype_missingtype', 'version', '2016052300'),
	(153, 'qtype_multianswer', 'version', '2016052300'),
	(154, 'qtype_multichoice', 'version', '2016052300'),
	(155, 'qtype_numerical', 'version', '2016052300'),
	(156, 'qtype_random', 'version', '2016052300'),
	(157, 'qtype_randomsamatch', 'version', '2016052300'),
	(158, 'qtype_shortanswer', 'version', '2016052300'),
	(159, 'qtype_truefalse', 'version', '2016052300'),
	(160, 'mod_assign', 'version', '2016052301'),
	(161, 'mod_assignment', 'version', '2016052300'),
	(163, 'mod_book', 'version', '2016052300'),
	(164, 'mod_chat', 'version', '2016052300'),
	(165, 'mod_choice', 'version', '2016052300'),
	(166, 'mod_data', 'version', '2016052300'),
	(167, 'mod_feedback', 'version', '2016052300'),
	(169, 'mod_folder', 'version', '2016052300'),
	(171, 'mod_forum', 'version', '2016052300'),
	(172, 'mod_glossary', 'version', '2016052300'),
	(173, 'mod_imscp', 'version', '2016052300'),
	(175, 'mod_label', 'version', '2016052300'),
	(176, 'mod_lesson', 'version', '2016052300'),
	(177, 'mod_lti', 'version', '2016052300'),
	(178, 'mod_page', 'version', '2016052300'),
	(180, 'mod_quiz', 'version', '2016052300'),
	(181, 'mod_resource', 'version', '2016052300'),
	(182, 'mod_scorm', 'version', '2016052300'),
	(183, 'mod_survey', 'version', '2016052300'),
	(185, 'mod_url', 'version', '2016052300'),
	(187, 'mod_wiki', 'version', '2016052300'),
	(189, 'mod_workshop', 'version', '2016052300'),
	(190, 'auth_cas', 'version', '2016052300'),
	(192, 'auth_db', 'version', '2016052300'),
	(194, 'auth_email', 'version', '2016052300'),
	(195, 'auth_fc', 'version', '2016052300'),
	(197, 'auth_imap', 'version', '2016052300'),
	(199, 'auth_ldap', 'version', '2016052300'),
	(201, 'auth_lti', 'version', '2016052300'),
	(202, 'auth_manual', 'version', '2016052300'),
	(203, 'auth_mnet', 'version', '2016052300'),
	(205, 'auth_nntp', 'version', '2016052300'),
	(207, 'auth_nologin', 'version', '2016052300'),
	(208, 'auth_none', 'version', '2016052300'),
	(209, 'auth_pam', 'version', '2016052300'),
	(211, 'auth_pop3', 'version', '2016052300'),
	(213, 'auth_radius', 'version', '2016052300'),
	(215, 'auth_shibboleth', 'version', '2016052300'),
	(217, 'auth_webservice', 'version', '2016052300'),
	(218, 'calendartype_gregorian', 'version', '2016052300'),
	(219, 'enrol_category', 'version', '2016052300'),
	(221, 'enrol_cohort', 'version', '2016052300'),
	(222, 'enrol_database', 'version', '2016052300'),
	(224, 'enrol_flatfile', 'version', '2016052300'),
	(226, 'enrol_flatfile', 'map_1', 'manager'),
	(227, 'enrol_flatfile', 'map_2', 'coursecreator'),
	(228, 'enrol_flatfile', 'map_3', 'editingteacher'),
	(229, 'enrol_flatfile', 'map_4', 'teacher'),
	(230, 'enrol_flatfile', 'map_5', 'student'),
	(231, 'enrol_flatfile', 'map_6', 'guest'),
	(232, 'enrol_flatfile', 'map_7', 'user'),
	(233, 'enrol_flatfile', 'map_8', 'frontpage'),
	(234, 'enrol_guest', 'version', '2016052300'),
	(235, 'enrol_imsenterprise', 'version', '2016052300'),
	(237, 'enrol_ldap', 'version', '2016052300'),
	(239, 'enrol_lti', 'version', '2016052300'),
	(240, 'enrol_manual', 'version', '2016052300'),
	(242, 'enrol_meta', 'version', '2016052300'),
	(244, 'enrol_mnet', 'version', '2016052300'),
	(245, 'enrol_paypal', 'version', '2016052300'),
	(246, 'enrol_self', 'version', '2016052301'),
	(248, 'message_airnotifier', 'version', '2016052300'),
	(250, 'message', 'airnotifier_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
	(251, 'message', 'airnotifier_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
	(252, 'message', 'airnotifier_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
	(253, 'message', 'airnotifier_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
	(254, 'message', 'airnotifier_provider_enrol_self_expiry_notification_permitted', 'permitted'),
	(255, 'message', 'airnotifier_provider_mod_assign_assign_notification_permitted', 'permitted'),
	(256, 'message', 'airnotifier_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
	(257, 'message', 'airnotifier_provider_mod_feedback_submission_permitted', 'permitted'),
	(258, 'message', 'airnotifier_provider_mod_feedback_message_permitted', 'permitted'),
	(259, 'message', 'airnotifier_provider_mod_forum_posts_permitted', 'permitted'),
	(260, 'message', 'airnotifier_provider_mod_forum_digests_permitted', 'permitted'),
	(261, 'message', 'airnotifier_provider_mod_lesson_graded_essay_permitted', 'permitted'),
	(262, 'message', 'airnotifier_provider_mod_quiz_submission_permitted', 'permitted'),
	(263, 'message', 'airnotifier_provider_mod_quiz_confirmation_permitted', 'permitted'),
	(264, 'message', 'airnotifier_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
	(265, 'message', 'airnotifier_provider_moodle_notices_permitted', 'permitted'),
	(266, 'message', 'airnotifier_provider_moodle_errors_permitted', 'permitted'),
	(267, 'message', 'airnotifier_provider_moodle_availableupdate_permitted', 'permitted'),
	(268, 'message', 'airnotifier_provider_moodle_instantmessage_permitted', 'permitted'),
	(269, 'message', 'airnotifier_provider_moodle_backup_permitted', 'permitted'),
	(270, 'message', 'airnotifier_provider_moodle_courserequested_permitted', 'permitted'),
	(271, 'message', 'airnotifier_provider_moodle_courserequestapproved_permitted', 'permitted'),
	(272, 'message', 'airnotifier_provider_moodle_courserequestrejected_permitted', 'permitted'),
	(273, 'message', 'airnotifier_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
	(274, 'message', 'airnotifier_provider_moodle_badgecreatornotice_permitted', 'permitted'),
	(275, 'message', 'airnotifier_provider_moodle_competencyplancomment_permitted', 'permitted'),
	(276, 'message', 'airnotifier_provider_moodle_competencyusercompcomment_permitted', 'permitted'),
	(277, 'message_email', 'version', '2016052300'),
	(279, 'message', 'email_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
	(280, 'message', 'message_provider_enrol_flatfile_flatfile_enrolment_loggedin', 'email'),
	(281, 'message', 'message_provider_enrol_flatfile_flatfile_enrolment_loggedoff', 'email'),
	(282, 'message', 'email_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
	(283, 'message', 'message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedin', 'email'),
	(284, 'message', 'message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedoff', 'email'),
	(285, 'message', 'email_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
	(286, 'message', 'message_provider_enrol_manual_expiry_notification_loggedin', 'email'),
	(287, 'message', 'message_provider_enrol_manual_expiry_notification_loggedoff', 'email'),
	(288, 'message', 'email_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
	(289, 'message', 'message_provider_enrol_paypal_paypal_enrolment_loggedin', 'email'),
	(290, 'message', 'message_provider_enrol_paypal_paypal_enrolment_loggedoff', 'email'),
	(291, 'message', 'email_provider_enrol_self_expiry_notification_permitted', 'permitted'),
	(292, 'message', 'message_provider_enrol_self_expiry_notification_loggedin', 'email'),
	(293, 'message', 'message_provider_enrol_self_expiry_notification_loggedoff', 'email'),
	(294, 'message', 'email_provider_mod_assign_assign_notification_permitted', 'permitted'),
	(295, 'message', 'message_provider_mod_assign_assign_notification_loggedin', 'email'),
	(296, 'message', 'message_provider_mod_assign_assign_notification_loggedoff', 'email'),
	(297, 'message', 'email_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
	(298, 'message', 'message_provider_mod_assignment_assignment_updates_loggedin', 'email'),
	(299, 'message', 'message_provider_mod_assignment_assignment_updates_loggedoff', 'email'),
	(300, 'message', 'email_provider_mod_feedback_submission_permitted', 'permitted'),
	(301, 'message', 'message_provider_mod_feedback_submission_loggedin', 'email'),
	(302, 'message', 'message_provider_mod_feedback_submission_loggedoff', 'email'),
	(303, 'message', 'email_provider_mod_feedback_message_permitted', 'permitted'),
	(304, 'message', 'message_provider_mod_feedback_message_loggedin', 'email'),
	(305, 'message', 'message_provider_mod_feedback_message_loggedoff', 'email'),
	(306, 'message', 'email_provider_mod_forum_posts_permitted', 'permitted'),
	(307, 'message', 'message_provider_mod_forum_posts_loggedin', 'email'),
	(308, 'message', 'message_provider_mod_forum_posts_loggedoff', 'email'),
	(309, 'message', 'email_provider_mod_forum_digests_permitted', 'permitted'),
	(310, 'message', 'message_provider_mod_forum_digests_loggedin', 'email'),
	(311, 'message', 'message_provider_mod_forum_digests_loggedoff', 'email'),
	(312, 'message', 'email_provider_mod_lesson_graded_essay_permitted', 'permitted'),
	(313, 'message', 'message_provider_mod_lesson_graded_essay_loggedin', 'email'),
	(314, 'message', 'message_provider_mod_lesson_graded_essay_loggedoff', 'email'),
	(315, 'message', 'email_provider_mod_quiz_submission_permitted', 'permitted'),
	(316, 'message', 'message_provider_mod_quiz_submission_loggedin', 'email'),
	(317, 'message', 'message_provider_mod_quiz_submission_loggedoff', 'email'),
	(318, 'message', 'email_provider_mod_quiz_confirmation_permitted', 'permitted'),
	(319, 'message', 'message_provider_mod_quiz_confirmation_loggedin', 'email'),
	(320, 'message', 'message_provider_mod_quiz_confirmation_loggedoff', 'email'),
	(321, 'message', 'email_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
	(322, 'message', 'message_provider_mod_quiz_attempt_overdue_loggedin', 'email'),
	(323, 'message', 'message_provider_mod_quiz_attempt_overdue_loggedoff', 'email'),
	(324, 'message', 'email_provider_moodle_notices_permitted', 'permitted'),
	(325, 'message', 'message_provider_moodle_notices_loggedin', 'email'),
	(326, 'message', 'message_provider_moodle_notices_loggedoff', 'email'),
	(327, 'message', 'email_provider_moodle_errors_permitted', 'permitted'),
	(328, 'message', 'message_provider_moodle_errors_loggedin', 'email'),
	(329, 'message', 'message_provider_moodle_errors_loggedoff', 'email'),
	(330, 'message', 'email_provider_moodle_availableupdate_permitted', 'permitted'),
	(331, 'message', 'message_provider_moodle_availableupdate_loggedin', 'email'),
	(332, 'message', 'message_provider_moodle_availableupdate_loggedoff', 'email'),
	(333, 'message', 'email_provider_moodle_instantmessage_permitted', 'permitted'),
	(334, 'message', 'message_provider_moodle_instantmessage_loggedoff', 'popup,email'),
	(335, 'message', 'email_provider_moodle_backup_permitted', 'permitted'),
	(336, 'message', 'message_provider_moodle_backup_loggedin', 'email'),
	(337, 'message', 'message_provider_moodle_backup_loggedoff', 'email'),
	(338, 'message', 'email_provider_moodle_courserequested_permitted', 'permitted'),
	(339, 'message', 'message_provider_moodle_courserequested_loggedin', 'email'),
	(340, 'message', 'message_provider_moodle_courserequested_loggedoff', 'email'),
	(341, 'message', 'email_provider_moodle_courserequestapproved_permitted', 'permitted'),
	(342, 'message', 'message_provider_moodle_courserequestapproved_loggedin', 'email'),
	(343, 'message', 'message_provider_moodle_courserequestapproved_loggedoff', 'email'),
	(344, 'message', 'email_provider_moodle_courserequestrejected_permitted', 'permitted'),
	(345, 'message', 'message_provider_moodle_courserequestrejected_loggedin', 'email'),
	(346, 'message', 'message_provider_moodle_courserequestrejected_loggedoff', 'email'),
	(347, 'message', 'email_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
	(348, 'message', 'message_provider_moodle_badgerecipientnotice_loggedoff', 'popup,email'),
	(349, 'message', 'email_provider_moodle_badgecreatornotice_permitted', 'permitted'),
	(350, 'message', 'message_provider_moodle_badgecreatornotice_loggedoff', 'email'),
	(351, 'message', 'email_provider_moodle_competencyplancomment_permitted', 'permitted'),
	(352, 'message', 'message_provider_moodle_competencyplancomment_loggedin', 'email'),
	(353, 'message', 'message_provider_moodle_competencyplancomment_loggedoff', 'email'),
	(354, 'message', 'email_provider_moodle_competencyusercompcomment_permitted', 'permitted'),
	(355, 'message', 'message_provider_moodle_competencyusercompcomment_loggedin', 'email'),
	(356, 'message', 'message_provider_moodle_competencyusercompcomment_loggedoff', 'email'),
	(357, 'message_jabber', 'version', '2016052300'),
	(359, 'message', 'jabber_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
	(360, 'message', 'jabber_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
	(361, 'message', 'jabber_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
	(362, 'message', 'jabber_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
	(363, 'message', 'jabber_provider_enrol_self_expiry_notification_permitted', 'permitted'),
	(364, 'message', 'jabber_provider_mod_assign_assign_notification_permitted', 'permitted'),
	(365, 'message', 'jabber_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
	(366, 'message', 'jabber_provider_mod_feedback_submission_permitted', 'permitted'),
	(367, 'message', 'jabber_provider_mod_feedback_message_permitted', 'permitted'),
	(368, 'message', 'jabber_provider_mod_forum_posts_permitted', 'permitted'),
	(369, 'message', 'jabber_provider_mod_forum_digests_permitted', 'permitted'),
	(370, 'message', 'jabber_provider_mod_lesson_graded_essay_permitted', 'permitted'),
	(371, 'message', 'jabber_provider_mod_quiz_submission_permitted', 'permitted'),
	(372, 'message', 'jabber_provider_mod_quiz_confirmation_permitted', 'permitted'),
	(373, 'message', 'jabber_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
	(374, 'message', 'jabber_provider_moodle_notices_permitted', 'permitted'),
	(375, 'message', 'jabber_provider_moodle_errors_permitted', 'permitted'),
	(376, 'message', 'jabber_provider_moodle_availableupdate_permitted', 'permitted'),
	(377, 'message', 'jabber_provider_moodle_instantmessage_permitted', 'permitted'),
	(378, 'message', 'jabber_provider_moodle_backup_permitted', 'permitted'),
	(379, 'message', 'jabber_provider_moodle_courserequested_permitted', 'permitted'),
	(380, 'message', 'jabber_provider_moodle_courserequestapproved_permitted', 'permitted'),
	(381, 'message', 'jabber_provider_moodle_courserequestrejected_permitted', 'permitted'),
	(382, 'message', 'jabber_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
	(383, 'message', 'jabber_provider_moodle_badgecreatornotice_permitted', 'permitted'),
	(384, 'message', 'jabber_provider_moodle_competencyplancomment_permitted', 'permitted'),
	(385, 'message', 'jabber_provider_moodle_competencyusercompcomment_permitted', 'permitted'),
	(386, 'message_popup', 'version', '2016052300'),
	(388, 'message', 'popup_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
	(389, 'message', 'popup_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
	(390, 'message', 'popup_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
	(391, 'message', 'popup_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
	(392, 'message', 'popup_provider_enrol_self_expiry_notification_permitted', 'permitted'),
	(393, 'message', 'popup_provider_mod_assign_assign_notification_permitted', 'permitted'),
	(394, 'message', 'popup_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
	(395, 'message', 'popup_provider_mod_feedback_submission_permitted', 'permitted'),
	(396, 'message', 'popup_provider_mod_feedback_message_permitted', 'permitted'),
	(397, 'message', 'popup_provider_mod_forum_posts_permitted', 'permitted'),
	(398, 'message', 'popup_provider_mod_forum_digests_permitted', 'permitted'),
	(399, 'message', 'popup_provider_mod_lesson_graded_essay_permitted', 'permitted'),
	(400, 'message', 'popup_provider_mod_quiz_submission_permitted', 'permitted'),
	(401, 'message', 'popup_provider_mod_quiz_confirmation_permitted', 'permitted'),
	(402, 'message', 'popup_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
	(403, 'message', 'popup_provider_moodle_notices_permitted', 'permitted'),
	(404, 'message', 'popup_provider_moodle_errors_permitted', 'permitted'),
	(405, 'message', 'popup_provider_moodle_availableupdate_permitted', 'permitted'),
	(406, 'message', 'popup_provider_moodle_instantmessage_permitted', 'permitted'),
	(407, 'message', 'message_provider_moodle_instantmessage_loggedin', 'popup'),
	(408, 'message', 'popup_provider_moodle_backup_permitted', 'permitted'),
	(409, 'message', 'popup_provider_moodle_courserequested_permitted', 'permitted'),
	(410, 'message', 'popup_provider_moodle_courserequestapproved_permitted', 'permitted'),
	(411, 'message', 'popup_provider_moodle_courserequestrejected_permitted', 'permitted'),
	(412, 'message', 'popup_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
	(413, 'message', 'message_provider_moodle_badgerecipientnotice_loggedin', 'popup'),
	(414, 'message', 'popup_provider_moodle_badgecreatornotice_permitted', 'permitted'),
	(415, 'message', 'popup_provider_moodle_competencyplancomment_permitted', 'permitted'),
	(416, 'message', 'popup_provider_moodle_competencyusercompcomment_permitted', 'permitted'),
	(417, 'block_activity_modules', 'version', '2016052300'),
	(418, 'block_activity_results', 'version', '2016052300'),
	(419, 'block_admin_bookmarks', 'version', '2016052300'),
	(420, 'block_badges', 'version', '2016052300'),
	(421, 'block_blog_menu', 'version', '2016052300'),
	(422, 'block_blog_recent', 'version', '2016052300'),
	(423, 'block_blog_tags', 'version', '2016052300'),
	(424, 'block_calendar_month', 'version', '2016052300'),
	(425, 'block_calendar_upcoming', 'version', '2016052300'),
	(426, 'block_comments', 'version', '2016052300'),
	(427, 'block_community', 'version', '2016052300'),
	(428, 'block_completionstatus', 'version', '2016052300'),
	(429, 'block_course_list', 'version', '2016052300'),
	(430, 'block_course_overview', 'version', '2016052300'),
	(431, 'block_course_summary', 'version', '2016052300'),
	(432, 'block_feedback', 'version', '2016052300'),
	(434, 'block_globalsearch', 'version', '2016052300'),
	(435, 'block_glossary_random', 'version', '2016052300'),
	(436, 'block_html', 'version', '2016052300'),
	(437, 'block_login', 'version', '2016052300'),
	(438, 'block_lp', 'version', '2016052300'),
	(439, 'block_mentees', 'version', '2016052300'),
	(440, 'block_messages', 'version', '2016052300'),
	(441, 'block_mnet_hosts', 'version', '2016052300'),
	(442, 'block_myprofile', 'version', '2016052300'),
	(443, 'block_navigation', 'version', '2016052300'),
	(444, 'block_news_items', 'version', '2016052300'),
	(445, 'block_online_users', 'version', '2016052300'),
	(446, 'block_participants', 'version', '2016052300'),
	(447, 'block_private_files', 'version', '2016052300'),
	(448, 'block_quiz_results', 'version', '2016052300'),
	(450, 'block_recent_activity', 'version', '2016052300'),
	(451, 'block_rss_client', 'version', '2016052300'),
	(452, 'block_search_forums', 'version', '2016052300'),
	(453, 'block_section_links', 'version', '2016052300'),
	(454, 'block_selfcompletion', 'version', '2016052300'),
	(455, 'block_settings', 'version', '2016052300'),
	(456, 'block_site_main_menu', 'version', '2016052300'),
	(457, 'block_social_activities', 'version', '2016052300'),
	(458, 'block_tag_flickr', 'version', '2016052300'),
	(459, 'block_tag_youtube', 'version', '2016052300'),
	(461, 'block_tags', 'version', '2016052300'),
	(462, 'filter_activitynames', 'version', '2016052300'),
	(464, 'filter_algebra', 'version', '2016052300'),
	(465, 'filter_censor', 'version', '2016052300'),
	(466, 'filter_data', 'version', '2016052300'),
	(468, 'filter_emailprotect', 'version', '2016052300'),
	(469, 'filter_emoticon', 'version', '2016052300'),
	(470, 'filter_glossary', 'version', '2016052300'),
	(472, 'filter_mathjaxloader', 'version', '2016052300'),
	(474, 'filter_mediaplugin', 'version', '2016052300'),
	(476, 'filter_multilang', 'version', '2016052300'),
	(477, 'filter_tex', 'version', '2016052300'),
	(479, 'filter_tidy', 'version', '2016052300'),
	(480, 'filter_urltolink', 'version', '2016052300'),
	(481, 'editor_atto', 'version', '2016052300'),
	(483, 'editor_textarea', 'version', '2016052300'),
	(484, 'editor_tinymce', 'version', '2016052300'),
	(485, 'format_singleactivity', 'version', '2016052300'),
	(486, 'format_social', 'version', '2016052300'),
	(487, 'format_topics', 'version', '2016052300'),
	(488, 'format_weeks', 'version', '2016052300'),
	(489, 'dataformat_csv', 'version', '2016052300'),
	(490, 'dataformat_excel', 'version', '2016052300'),
	(491, 'dataformat_html', 'version', '2016052300'),
	(492, 'dataformat_json', 'version', '2016052300'),
	(493, 'dataformat_ods', 'version', '2016052300'),
	(494, 'profilefield_checkbox', 'version', '2016052300'),
	(495, 'profilefield_datetime', 'version', '2016052300'),
	(496, 'profilefield_menu', 'version', '2016052300'),
	(497, 'profilefield_text', 'version', '2016052300'),
	(498, 'profilefield_textarea', 'version', '2016052300'),
	(499, 'report_backups', 'version', '2016052300'),
	(500, 'report_competency', 'version', '2016052300'),
	(501, 'report_completion', 'version', '2016052300'),
	(503, 'report_configlog', 'version', '2016052300'),
	(504, 'report_courseoverview', 'version', '2016052300'),
	(505, 'report_eventlist', 'version', '2016052300'),
	(506, 'report_log', 'version', '2016052300'),
	(508, 'report_loglive', 'version', '2016052300'),
	(509, 'report_outline', 'version', '2016052300'),
	(511, 'report_participation', 'version', '2016052300'),
	(513, 'report_performance', 'version', '2016052300'),
	(514, 'report_progress', 'version', '2016052300'),
	(516, 'report_questioninstances', 'version', '2016052300'),
	(517, 'report_search', 'version', '2016052300'),
	(518, 'report_security', 'version', '2016052300'),
	(519, 'report_stats', 'version', '2016052300'),
	(521, 'report_usersessions', 'version', '2016052300'),
	(522, 'gradeexport_ods', 'version', '2016052300'),
	(523, 'gradeexport_txt', 'version', '2016052300'),
	(524, 'gradeexport_xls', 'version', '2016052300'),
	(525, 'gradeexport_xml', 'version', '2016052300'),
	(526, 'gradeimport_csv', 'version', '2016052300'),
	(527, 'gradeimport_direct', 'version', '2016052300'),
	(528, 'gradeimport_xml', 'version', '2016052300'),
	(529, 'gradereport_grader', 'version', '2016052300'),
	(530, 'gradereport_history', 'version', '2016052300'),
	(531, 'gradereport_outcomes', 'version', '2016052300'),
	(532, 'gradereport_overview', 'version', '2016052300'),
	(533, 'gradereport_singleview', 'version', '2016052300'),
	(534, 'gradereport_user', 'version', '2016052300'),
	(535, 'gradingform_guide', 'version', '2016052300'),
	(536, 'gradingform_rubric', 'version', '2016052300'),
	(537, 'mnetservice_enrol', 'version', '2016052300'),
	(538, 'webservice_rest', 'version', '2016052300'),
	(539, 'webservice_soap', 'version', '2016052300'),
	(540, 'webservice_xmlrpc', 'version', '2016052300'),
	(541, 'repository_alfresco', 'version', '2016052300'),
	(542, 'repository_areafiles', 'version', '2016052300'),
	(544, 'areafiles', 'enablecourseinstances', '0'),
	(545, 'areafiles', 'enableuserinstances', '0'),
	(546, 'repository_boxnet', 'version', '2016052300'),
	(547, 'repository_coursefiles', 'version', '2016052300'),
	(548, 'repository_dropbox', 'version', '2016052300'),
	(549, 'repository_equella', 'version', '2016052300'),
	(550, 'repository_filesystem', 'version', '2016052300'),
	(551, 'repository_flickr', 'version', '2016052300'),
	(552, 'repository_flickr_public', 'version', '2016052300'),
	(553, 'repository_googledocs', 'version', '2016052300'),
	(554, 'repository_local', 'version', '2016052300'),
	(556, 'local', 'enablecourseinstances', '0'),
	(557, 'local', 'enableuserinstances', '0'),
	(558, 'repository_merlot', 'version', '2016052300'),
	(559, 'repository_picasa', 'version', '2016052300'),
	(560, 'repository_recent', 'version', '2016052300'),
	(562, 'recent', 'enablecourseinstances', '0'),
	(563, 'recent', 'enableuserinstances', '0'),
	(564, 'repository_s3', 'version', '2016052300'),
	(565, 'repository_skydrive', 'version', '2016052300'),
	(566, 'repository_upload', 'version', '2016052300'),
	(568, 'upload', 'enablecourseinstances', '0'),
	(569, 'upload', 'enableuserinstances', '0'),
	(570, 'repository_url', 'version', '2016052300'),
	(572, 'url', 'enablecourseinstances', '0'),
	(573, 'url', 'enableuserinstances', '0'),
	(574, 'repository_user', 'version', '2016052300'),
	(576, 'user', 'enablecourseinstances', '0'),
	(577, 'user', 'enableuserinstances', '0'),
	(578, 'repository_webdav', 'version', '2016052300'),
	(579, 'repository_wikimedia', 'version', '2016052300'),
	(581, 'wikimedia', 'enablecourseinstances', '0'),
	(582, 'wikimedia', 'enableuserinstances', '0'),
	(583, 'repository_youtube', 'version', '2016052300'),
	(585, 'portfolio_boxnet', 'version', '2016052300'),
	(586, 'portfolio_download', 'version', '2016052300'),
	(587, 'portfolio_flickr', 'version', '2016052300'),
	(588, 'portfolio_googledocs', 'version', '2016052300'),
	(589, 'portfolio_mahara', 'version', '2016052300'),
	(590, 'portfolio_picasa', 'version', '2016052300'),
	(591, 'search_solr', 'version', '2016052300'),
	(592, 'qbehaviour_adaptive', 'version', '2016052300'),
	(593, 'qbehaviour_adaptivenopenalty', 'version', '2016052300'),
	(594, 'qbehaviour_deferredcbm', 'version', '2016052300'),
	(595, 'qbehaviour_deferredfeedback', 'version', '2016052300'),
	(596, 'qbehaviour_immediatecbm', 'version', '2016052300'),
	(597, 'qbehaviour_immediatefeedback', 'version', '2016052300'),
	(598, 'qbehaviour_informationitem', 'version', '2016052300'),
	(599, 'qbehaviour_interactive', 'version', '2016052300'),
	(600, 'qbehaviour_interactivecountback', 'version', '2016052300'),
	(601, 'qbehaviour_manualgraded', 'version', '2016052300'),
	(603, 'question', 'disabledbehaviours', 'manualgraded'),
	(604, 'qbehaviour_missing', 'version', '2016052300'),
	(605, 'qformat_aiken', 'version', '2016052300'),
	(606, 'qformat_blackboard_six', 'version', '2016052300'),
	(607, 'qformat_examview', 'version', '2016052300'),
	(608, 'qformat_gift', 'version', '2016052300'),
	(609, 'qformat_missingword', 'version', '2016052300'),
	(610, 'qformat_multianswer', 'version', '2016052300'),
	(611, 'qformat_webct', 'version', '2016052300'),
	(612, 'qformat_xhtml', 'version', '2016052300'),
	(613, 'qformat_xml', 'version', '2016052300'),
	(614, 'tool_assignmentupgrade', 'version', '2016052300'),
	(615, 'tool_availabilityconditions', 'version', '2016052300'),
	(616, 'tool_behat', 'version', '2016052300'),
	(617, 'tool_capability', 'version', '2016052300'),
	(618, 'tool_cohortroles', 'version', '2016052300'),
	(619, 'tool_customlang', 'version', '2016052300'),
	(621, 'tool_dbtransfer', 'version', '2016052300'),
	(622, 'tool_filetypes', 'version', '2016052300'),
	(623, 'tool_generator', 'version', '2016052300'),
	(624, 'tool_health', 'version', '2016052300'),
	(625, 'tool_innodb', 'version', '2016052300'),
	(626, 'tool_installaddon', 'version', '2016052300'),
	(627, 'tool_langimport', 'version', '2016052300'),
	(628, 'tool_log', 'version', '2016052300'),
	(630, 'tool_log', 'enabled_stores', 'logstore_standard'),
	(631, 'tool_lp', 'version', '2016052300'),
	(632, 'tool_lpmigrate', 'version', '2016052300'),
	(633, 'tool_messageinbound', 'version', '2016052300'),
	(634, 'message', 'airnotifier_provider_tool_messageinbound_invalidrecipienthandler_permitted', 'permitted'),
	(635, 'message', 'email_provider_tool_messageinbound_invalidrecipienthandler_permitted', 'permitted'),
	(636, 'message', 'jabber_provider_tool_messageinbound_invalidrecipienthandler_permitted', 'permitted'),
	(637, 'message', 'popup_provider_tool_messageinbound_invalidrecipienthandler_permitted', 'permitted'),
	(638, 'message', 'message_provider_tool_messageinbound_invalidrecipienthandler_loggedin', 'email'),
	(639, 'message', 'message_provider_tool_messageinbound_invalidrecipienthandler_loggedoff', 'email'),
	(640, 'message', 'airnotifier_provider_tool_messageinbound_messageprocessingerror_permitted', 'permitted'),
	(641, 'message', 'email_provider_tool_messageinbound_messageprocessingerror_permitted', 'permitted'),
	(642, 'message', 'jabber_provider_tool_messageinbound_messageprocessingerror_permitted', 'permitted'),
	(643, 'message', 'popup_provider_tool_messageinbound_messageprocessingerror_permitted', 'permitted'),
	(644, 'message', 'message_provider_tool_messageinbound_messageprocessingerror_loggedin', 'email'),
	(645, 'message', 'message_provider_tool_messageinbound_messageprocessingerror_loggedoff', 'email'),
	(646, 'message', 'airnotifier_provider_tool_messageinbound_messageprocessingsuccess_permitted', 'permitted'),
	(647, 'message', 'email_provider_tool_messageinbound_messageprocessingsuccess_permitted', 'permitted'),
	(648, 'message', 'jabber_provider_tool_messageinbound_messageprocessingsuccess_permitted', 'permitted'),
	(649, 'message', 'popup_provider_tool_messageinbound_messageprocessingsuccess_permitted', 'permitted'),
	(650, 'message', 'message_provider_tool_messageinbound_messageprocessingsuccess_loggedin', 'email'),
	(651, 'message', 'message_provider_tool_messageinbound_messageprocessingsuccess_loggedoff', 'email'),
	(652, 'tool_mobile', 'version', '2016052300'),
	(653, 'tool_monitor', 'version', '2016052305'),
	(654, 'message', 'airnotifier_provider_tool_monitor_notification_permitted', 'permitted'),
	(655, 'message', 'email_provider_tool_monitor_notification_permitted', 'permitted'),
	(656, 'message', 'jabber_provider_tool_monitor_notification_permitted', 'permitted'),
	(657, 'message', 'popup_provider_tool_monitor_notification_permitted', 'permitted'),
	(658, 'message', 'message_provider_tool_monitor_notification_loggedin', 'email'),
	(659, 'message', 'message_provider_tool_monitor_notification_loggedoff', 'email'),
	(660, 'tool_multilangupgrade', 'version', '2016052300'),
	(661, 'tool_phpunit', 'version', '2016052300'),
	(662, 'tool_profiling', 'version', '2016052300'),
	(663, 'tool_recyclebin', 'version', '2016052300'),
	(664, 'tool_replace', 'version', '2016052300'),
	(665, 'tool_spamcleaner', 'version', '2016052300'),
	(666, 'tool_task', 'version', '2016052300'),
	(667, 'tool_templatelibrary', 'version', '2016052300'),
	(668, 'tool_unsuproles', 'version', '2016052300'),
	(670, 'tool_uploadcourse', 'version', '2016052300'),
	(671, 'tool_uploaduser', 'version', '2016052300'),
	(672, 'tool_xmldb', 'version', '2016052300'),
	(673, 'cachestore_file', 'version', '2016052300'),
	(674, 'cachestore_memcache', 'version', '2016052300'),
	(675, 'cachestore_memcached', 'version', '2016052300'),
	(676, 'cachestore_mongodb', 'version', '2016052300'),
	(677, 'cachestore_session', 'version', '2016052300'),
	(678, 'cachestore_static', 'version', '2016052300'),
	(679, 'cachelock_file', 'version', '2016052300'),
	(680, 'theme_base', 'version', '2016052300'),
	(681, 'theme_bootstrapbase', 'version', '2016052300'),
	(682, 'theme_canvas', 'version', '2016052300'),
	(683, 'theme_clean', 'version', '2016052300'),
	(684, 'theme_more', 'version', '2016052300'),
	(686, 'assignsubmission_comments', 'version', '2016052300'),
	(688, 'assignsubmission_file', 'sortorder', '1'),
	(689, 'assignsubmission_comments', 'sortorder', '2'),
	(690, 'assignsubmission_onlinetext', 'sortorder', '0'),
	(691, 'assignsubmission_file', 'version', '2016052300'),
	(692, 'assignsubmission_onlinetext', 'version', '2016052300'),
	(694, 'assignfeedback_comments', 'version', '2016052300'),
	(696, 'assignfeedback_comments', 'sortorder', '0'),
	(697, 'assignfeedback_editpdf', 'sortorder', '1'),
	(698, 'assignfeedback_file', 'sortorder', '3'),
	(699, 'assignfeedback_offline', 'sortorder', '2'),
	(700, 'assignfeedback_editpdf', 'version', '2016052300'),
	(702, 'assignfeedback_file', 'version', '2016052300'),
	(704, 'assignfeedback_offline', 'version', '2016052300'),
	(705, 'assignment_offline', 'version', '2016052300'),
	(706, 'assignment_online', 'version', '2016052300'),
	(707, 'assignment_upload', 'version', '2016052300'),
	(708, 'assignment_uploadsingle', 'version', '2016052300'),
	(709, 'booktool_exportimscp', 'version', '2016052300'),
	(710, 'booktool_importhtml', 'version', '2016052300'),
	(711, 'booktool_print', 'version', '2016052300'),
	(712, 'datafield_checkbox', 'version', '2016052300'),
	(713, 'datafield_date', 'version', '2016052300'),
	(714, 'datafield_file', 'version', '2016052300'),
	(715, 'datafield_latlong', 'version', '2016052300'),
	(716, 'datafield_menu', 'version', '2016052300'),
	(717, 'datafield_multimenu', 'version', '2016052300'),
	(718, 'datafield_number', 'version', '2016052300'),
	(719, 'datafield_picture', 'version', '2016052300'),
	(720, 'datafield_radiobutton', 'version', '2016052300'),
	(721, 'datafield_text', 'version', '2016052300'),
	(722, 'datafield_textarea', 'version', '2016052300'),
	(723, 'datafield_url', 'version', '2016052300'),
	(724, 'datapreset_imagegallery', 'version', '2016052300'),
	(725, 'ltiservice_memberships', 'version', '2016052300'),
	(726, 'ltiservice_profile', 'version', '2016052300'),
	(727, 'ltiservice_toolproxy', 'version', '2016052300'),
	(728, 'ltiservice_toolsettings', 'version', '2016052300'),
	(729, 'quiz_grading', 'version', '2016052300'),
	(731, 'quiz_overview', 'version', '2016052300'),
	(733, 'quiz_responses', 'version', '2016052300'),
	(735, 'quiz_statistics', 'version', '2016052300'),
	(737, 'quizaccess_delaybetweenattempts', 'version', '2016052300'),
	(738, 'quizaccess_ipaddress', 'version', '2016052300'),
	(739, 'quizaccess_numattempts', 'version', '2016052300'),
	(740, 'quizaccess_openclosedate', 'version', '2016052300'),
	(741, 'quizaccess_password', 'version', '2016052300'),
	(742, 'quizaccess_safebrowser', 'version', '2016052300'),
	(743, 'quizaccess_securewindow', 'version', '2016052300'),
	(744, 'quizaccess_timelimit', 'version', '2016052300'),
	(745, 'scormreport_basic', 'version', '2016052300'),
	(746, 'scormreport_graphs', 'version', '2016052300'),
	(747, 'scormreport_interactions', 'version', '2016052300'),
	(748, 'scormreport_objectives', 'version', '2016052300'),
	(749, 'workshopform_accumulative', 'version', '2016052300'),
	(751, 'workshopform_comments', 'version', '2016052300'),
	(753, 'workshopform_numerrors', 'version', '2016052300'),
	(755, 'workshopform_rubric', 'version', '2016052300'),
	(757, 'workshopallocation_manual', 'version', '2016052300'),
	(758, 'workshopallocation_random', 'version', '2016052300'),
	(759, 'workshopallocation_scheduled', 'version', '2016052300'),
	(760, 'workshopeval_best', 'version', '2016052300'),
	(761, 'atto_accessibilitychecker', 'version', '2016052300'),
	(762, 'atto_accessibilityhelper', 'version', '2016052300'),
	(763, 'atto_align', 'version', '2016052300'),
	(764, 'atto_backcolor', 'version', '2016052300'),
	(765, 'atto_bold', 'version', '2016052300'),
	(766, 'atto_charmap', 'version', '2016052300'),
	(767, 'atto_clear', 'version', '2016052300'),
	(768, 'atto_collapse', 'version', '2016052300'),
	(769, 'atto_emoticon', 'version', '2016052300'),
	(770, 'atto_equation', 'version', '2016052300'),
	(771, 'atto_fontcolor', 'version', '2016052300'),
	(772, 'atto_html', 'version', '2016052300'),
	(773, 'atto_image', 'version', '2016052300'),
	(774, 'atto_indent', 'version', '2016052300'),
	(775, 'atto_italic', 'version', '2016052300'),
	(776, 'atto_link', 'version', '2016052300'),
	(777, 'atto_managefiles', 'version', '2016052300'),
	(778, 'atto_media', 'version', '2016052300'),
	(779, 'atto_noautolink', 'version', '2016052300'),
	(780, 'atto_orderedlist', 'version', '2016052300'),
	(781, 'atto_rtl', 'version', '2016052300'),
	(782, 'atto_strike', 'version', '2016052300'),
	(783, 'atto_subscript', 'version', '2016052300'),
	(784, 'atto_superscript', 'version', '2016052300'),
	(785, 'atto_table', 'version', '2016052300'),
	(786, 'atto_title', 'version', '2016052300'),
	(787, 'atto_underline', 'version', '2016052300'),
	(788, 'atto_undo', 'version', '2016052300'),
	(789, 'atto_unorderedlist', 'version', '2016052300'),
	(790, 'tinymce_ctrlhelp', 'version', '2016052300'),
	(791, 'tinymce_managefiles', 'version', '2016052300'),
	(792, 'tinymce_moodleemoticon', 'version', '2016052300'),
	(793, 'tinymce_moodleimage', 'version', '2016052300'),
	(794, 'tinymce_moodlemedia', 'version', '2016052300'),
	(795, 'tinymce_moodlenolink', 'version', '2016052300'),
	(796, 'tinymce_pdw', 'version', '2016052300'),
	(797, 'tinymce_spellchecker', 'version', '2016052300'),
	(799, 'tinymce_wrap', 'version', '2016052300'),
	(800, 'logstore_database', 'version', '2016052300'),
	(801, 'logstore_legacy', 'version', '2016052300'),
	(802, 'logstore_standard', 'version', '2016052300'),
	(803, 'assign', 'feedback_plugin_for_gradebook', 'assignfeedback_comments'),
	(804, 'assign', 'showrecentsubmissions', '0'),
	(805, 'assign', 'submissionreceipts', '1'),
	(806, 'assign', 'submissionstatement', 'Esta tarefa é meu próprio trabalho, exceto onde eu reconheço o uso do trabalho de outras pessoas.'),
	(807, 'assign', 'maxperpage', '-1'),
	(808, 'assign', 'alwaysshowdescription', '1'),
	(809, 'assign', 'alwaysshowdescription_adv', ''),
	(810, 'assign', 'alwaysshowdescription_locked', ''),
	(811, 'assign', 'allowsubmissionsfromdate', '0'),
	(812, 'assign', 'allowsubmissionsfromdate_enabled', '1'),
	(813, 'assign', 'allowsubmissionsfromdate_adv', ''),
	(814, 'assign', 'duedate', '604800'),
	(815, 'assign', 'duedate_enabled', '1'),
	(816, 'assign', 'duedate_adv', ''),
	(817, 'assign', 'cutoffdate', '1209600'),
	(818, 'assign', 'cutoffdate_enabled', ''),
	(819, 'assign', 'cutoffdate_adv', ''),
	(820, 'assign', 'submissiondrafts', '0'),
	(821, 'assign', 'submissiondrafts_adv', ''),
	(822, 'assign', 'submissiondrafts_locked', ''),
	(823, 'assign', 'requiresubmissionstatement', '0'),
	(824, 'assign', 'requiresubmissionstatement_adv', ''),
	(825, 'assign', 'requiresubmissionstatement_locked', ''),
	(826, 'assign', 'attemptreopenmethod', 'none'),
	(827, 'assign', 'attemptreopenmethod_adv', ''),
	(828, 'assign', 'attemptreopenmethod_locked', ''),
	(829, 'assign', 'maxattempts', '-1'),
	(830, 'assign', 'maxattempts_adv', ''),
	(831, 'assign', 'maxattempts_locked', ''),
	(832, 'assign', 'teamsubmission', '0'),
	(833, 'assign', 'teamsubmission_adv', ''),
	(834, 'assign', 'teamsubmission_locked', ''),
	(835, 'assign', 'preventsubmissionnotingroup', '0'),
	(836, 'assign', 'preventsubmissionnotingroup_adv', ''),
	(837, 'assign', 'preventsubmissionnotingroup_locked', ''),
	(838, 'assign', 'requireallteammemberssubmit', '0'),
	(839, 'assign', 'requireallteammemberssubmit_adv', ''),
	(840, 'assign', 'requireallteammemberssubmit_locked', ''),
	(841, 'assign', 'teamsubmissiongroupingid', ''),
	(842, 'assign', 'teamsubmissiongroupingid_adv', ''),
	(843, 'assign', 'sendnotifications', '0'),
	(844, 'assign', 'sendnotifications_adv', ''),
	(845, 'assign', 'sendnotifications_locked', ''),
	(846, 'assign', 'sendlatenotifications', '0'),
	(847, 'assign', 'sendlatenotifications_adv', ''),
	(848, 'assign', 'sendlatenotifications_locked', ''),
	(849, 'assign', 'sendstudentnotifications', '1'),
	(850, 'assign', 'sendstudentnotifications_adv', ''),
	(851, 'assign', 'sendstudentnotifications_locked', ''),
	(852, 'assign', 'blindmarking', '0'),
	(853, 'assign', 'blindmarking_adv', ''),
	(854, 'assign', 'blindmarking_locked', ''),
	(855, 'assign', 'markingworkflow', '0'),
	(856, 'assign', 'markingworkflow_adv', ''),
	(857, 'assign', 'markingworkflow_locked', ''),
	(858, 'assign', 'markingallocation', '0'),
	(859, 'assign', 'markingallocation_adv', ''),
	(860, 'assign', 'markingallocation_locked', ''),
	(861, 'assignsubmission_file', 'default', '1'),
	(862, 'assignsubmission_file', 'maxfiles', '20'),
	(863, 'assignsubmission_file', 'maxbytes', '1048576'),
	(864, 'assignsubmission_onlinetext', 'default', '0'),
	(865, 'assignfeedback_comments', 'default', '1'),
	(866, 'assignfeedback_comments', 'inline', '0'),
	(867, 'assignfeedback_comments', 'inline_adv', ''),
	(868, 'assignfeedback_comments', 'inline_locked', ''),
	(869, 'assignfeedback_editpdf', 'stamps', ''),
	(870, 'assignfeedback_file', 'default', '0'),
	(871, 'assignfeedback_offline', 'default', '0'),
	(872, 'book', 'numberingoptions', '0,1,2,3'),
	(873, 'book', 'navoptions', '0,1,2'),
	(874, 'book', 'numbering', '1'),
	(875, 'book', 'navstyle', '1'),
	(876, 'folder', 'showexpanded', '1'),
	(877, 'folder', 'maxsizetodownload', '0'),
	(878, 'imscp', 'keepold', '1'),
	(879, 'imscp', 'keepold_adv', ''),
	(880, 'label', 'dndmedia', '1'),
	(881, 'label', 'dndresizewidth', '400'),
	(882, 'label', 'dndresizeheight', '400'),
	(883, 'mod_lesson', 'mediafile', ''),
	(884, 'mod_lesson', 'mediafile_adv', '1'),
	(885, 'mod_lesson', 'mediawidth', '640'),
	(886, 'mod_lesson', 'mediaheight', '480'),
	(887, 'mod_lesson', 'mediaclose', '0'),
	(888, 'mod_lesson', 'progressbar', '0'),
	(889, 'mod_lesson', 'progressbar_adv', ''),
	(890, 'mod_lesson', 'ongoing', '0'),
	(891, 'mod_lesson', 'ongoing_adv', '1'),
	(892, 'mod_lesson', 'displayleftmenu', '0'),
	(893, 'mod_lesson', 'displayleftmenu_adv', ''),
	(894, 'mod_lesson', 'displayleftif', '0'),
	(895, 'mod_lesson', 'displayleftif_adv', '1'),
	(896, 'mod_lesson', 'slideshow', '0'),
	(897, 'mod_lesson', 'slideshow_adv', '1'),
	(898, 'mod_lesson', 'slideshowwidth', '640'),
	(899, 'mod_lesson', 'slideshowheight', '480'),
	(900, 'mod_lesson', 'slideshowbgcolor', '#FFFFFF'),
	(901, 'mod_lesson', 'maxanswers', '5'),
	(902, 'mod_lesson', 'maxanswers_adv', '1'),
	(903, 'mod_lesson', 'defaultfeedback', '0'),
	(904, 'mod_lesson', 'defaultfeedback_adv', '1'),
	(905, 'mod_lesson', 'activitylink', ''),
	(906, 'mod_lesson', 'activitylink_adv', '1'),
	(907, 'mod_lesson', 'timelimit', '0'),
	(908, 'mod_lesson', 'timelimit_adv', ''),
	(909, 'mod_lesson', 'password', '0'),
	(910, 'mod_lesson', 'password_adv', '1'),
	(911, 'mod_lesson', 'modattempts', '0'),
	(912, 'mod_lesson', 'modattempts_adv', ''),
	(913, 'mod_lesson', 'displayreview', '0'),
	(914, 'mod_lesson', 'displayreview_adv', ''),
	(915, 'mod_lesson', 'maximumnumberofattempts', '1'),
	(916, 'mod_lesson', 'maximumnumberofattempts_adv', ''),
	(917, 'mod_lesson', 'defaultnextpage', '0'),
	(918, 'mod_lesson', 'defaultnextpage_adv', '1'),
	(919, 'mod_lesson', 'numberofpagestoshow', '1'),
	(920, 'mod_lesson', 'numberofpagestoshow_adv', '1'),
	(921, 'mod_lesson', 'practice', '0'),
	(922, 'mod_lesson', 'practice_adv', ''),
	(923, 'mod_lesson', 'customscoring', '1'),
	(924, 'mod_lesson', 'customscoring_adv', '1'),
	(925, 'mod_lesson', 'retakesallowed', '0'),
	(926, 'mod_lesson', 'retakesallowed_adv', ''),
	(927, 'mod_lesson', 'handlingofretakes', '0'),
	(928, 'mod_lesson', 'handlingofretakes_adv', '1'),
	(929, 'mod_lesson', 'minimumnumberofquestions', '0'),
	(930, 'mod_lesson', 'minimumnumberofquestions_adv', '1'),
	(931, 'page', 'displayoptions', '5'),
	(932, 'page', 'printheading', '1'),
	(933, 'page', 'printintro', '0'),
	(934, 'page', 'display', '5'),
	(935, 'page', 'popupwidth', '620'),
	(936, 'page', 'popupheight', '450'),
	(937, 'quiz', 'timelimit', '0'),
	(938, 'quiz', 'timelimit_adv', ''),
	(939, 'quiz', 'overduehandling', 'autosubmit'),
	(940, 'quiz', 'overduehandling_adv', ''),
	(941, 'quiz', 'graceperiod', '86400'),
	(942, 'quiz', 'graceperiod_adv', ''),
	(943, 'quiz', 'graceperiodmin', '60'),
	(944, 'quiz', 'attempts', '0'),
	(945, 'quiz', 'attempts_adv', ''),
	(946, 'quiz', 'grademethod', '1'),
	(947, 'quiz', 'grademethod_adv', ''),
	(948, 'quiz', 'maximumgrade', '10'),
	(949, 'quiz', 'questionsperpage', '1'),
	(950, 'quiz', 'questionsperpage_adv', ''),
	(951, 'quiz', 'navmethod', 'free'),
	(952, 'quiz', 'navmethod_adv', '1'),
	(953, 'quiz', 'shuffleanswers', '1'),
	(954, 'quiz', 'shuffleanswers_adv', ''),
	(955, 'quiz', 'preferredbehaviour', 'deferredfeedback'),
	(956, 'quiz', 'canredoquestions', '0'),
	(957, 'quiz', 'canredoquestions_adv', '1'),
	(958, 'quiz', 'attemptonlast', '0'),
	(959, 'quiz', 'attemptonlast_adv', '1'),
	(960, 'quiz', 'reviewattempt', '69904'),
	(961, 'quiz', 'reviewcorrectness', '69904'),
	(962, 'quiz', 'reviewmarks', '69904'),
	(963, 'quiz', 'reviewspecificfeedback', '69904'),
	(964, 'quiz', 'reviewgeneralfeedback', '69904'),
	(965, 'quiz', 'reviewrightanswer', '69904'),
	(966, 'quiz', 'reviewoverallfeedback', '4368'),
	(967, 'quiz', 'showuserpicture', '0'),
	(968, 'quiz', 'showuserpicture_adv', ''),
	(969, 'quiz', 'decimalpoints', '2'),
	(970, 'quiz', 'decimalpoints_adv', ''),
	(971, 'quiz', 'questiondecimalpoints', '-1'),
	(972, 'quiz', 'questiondecimalpoints_adv', '1'),
	(973, 'quiz', 'showblocks', '0'),
	(974, 'quiz', 'showblocks_adv', '1'),
	(975, 'quiz', 'password', ''),
	(976, 'quiz', 'password_adv', ''),
	(977, 'quiz', 'subnet', ''),
	(978, 'quiz', 'subnet_adv', '1'),
	(979, 'quiz', 'delay1', '0'),
	(980, 'quiz', 'delay1_adv', '1'),
	(981, 'quiz', 'delay2', '0'),
	(982, 'quiz', 'delay2_adv', '1'),
	(983, 'quiz', 'browsersecurity', '-'),
	(984, 'quiz', 'browsersecurity_adv', '1'),
	(985, 'quiz', 'initialnumfeedbacks', '2'),
	(986, 'quiz', 'autosaveperiod', '60'),
	(987, 'resource', 'framesize', '130'),
	(988, 'resource', 'displayoptions', '0,1,4,5,6'),
	(989, 'resource', 'printintro', '1'),
	(990, 'resource', 'display', '0'),
	(991, 'resource', 'showsize', '0'),
	(992, 'resource', 'showtype', '0'),
	(993, 'resource', 'showdate', '0'),
	(994, 'resource', 'popupwidth', '620'),
	(995, 'resource', 'popupheight', '450'),
	(996, 'resource', 'filterfiles', '0'),
	(997, 'scorm', 'displaycoursestructure', '0'),
	(998, 'scorm', 'displaycoursestructure_adv', ''),
	(999, 'scorm', 'popup', '0'),
	(1000, 'scorm', 'popup_adv', ''),
	(1001, 'scorm', 'displayactivityname', '1'),
	(1002, 'scorm', 'framewidth', '100'),
	(1003, 'scorm', 'framewidth_adv', '1'),
	(1004, 'scorm', 'frameheight', '500'),
	(1005, 'scorm', 'frameheight_adv', '1'),
	(1006, 'scorm', 'winoptgrp_adv', '1'),
	(1007, 'scorm', 'scrollbars', '0'),
	(1008, 'scorm', 'directories', '0'),
	(1009, 'scorm', 'location', '0'),
	(1010, 'scorm', 'menubar', '0'),
	(1011, 'scorm', 'toolbar', '0'),
	(1012, 'scorm', 'status', '0'),
	(1013, 'scorm', 'skipview', '0'),
	(1014, 'scorm', 'skipview_adv', '1'),
	(1015, 'scorm', 'hidebrowse', '0'),
	(1016, 'scorm', 'hidebrowse_adv', '1'),
	(1017, 'scorm', 'hidetoc', '0'),
	(1018, 'scorm', 'hidetoc_adv', '1'),
	(1019, 'scorm', 'nav', '1'),
	(1020, 'scorm', 'nav_adv', '1'),
	(1021, 'scorm', 'navpositionleft', '-100'),
	(1022, 'scorm', 'navpositionleft_adv', '1'),
	(1023, 'scorm', 'navpositiontop', '-100'),
	(1024, 'scorm', 'navpositiontop_adv', '1'),
	(1025, 'scorm', 'collapsetocwinsize', '767'),
	(1026, 'scorm', 'collapsetocwinsize_adv', '1'),
	(1027, 'scorm', 'displayattemptstatus', '1'),
	(1028, 'scorm', 'displayattemptstatus_adv', ''),
	(1029, 'scorm', 'grademethod', '1'),
	(1030, 'scorm', 'maxgrade', '100'),
	(1031, 'scorm', 'maxattempt', '0'),
	(1032, 'scorm', 'whatgrade', '0'),
	(1033, 'scorm', 'forcecompleted', '0'),
	(1034, 'scorm', 'forcenewattempt', '0'),
	(1035, 'scorm', 'autocommit', '0'),
	(1036, 'scorm', 'masteryoverride', '1'),
	(1037, 'scorm', 'lastattemptlock', '0'),
	(1038, 'scorm', 'auto', '0'),
	(1039, 'scorm', 'updatefreq', '0'),
	(1040, 'scorm', 'scorm12standard', '1'),
	(1041, 'scorm', 'allowtypeexternal', '0'),
	(1042, 'scorm', 'allowtypelocalsync', '0'),
	(1043, 'scorm', 'allowtypeexternalaicc', '0'),
	(1044, 'scorm', 'allowaicchacp', '0'),
	(1045, 'scorm', 'aicchacptimeout', '30'),
	(1046, 'scorm', 'aicchacpkeepsessiondata', '1'),
	(1047, 'scorm', 'aiccuserid', '1'),
	(1048, 'scorm', 'forcejavascript', '1'),
	(1049, 'scorm', 'allowapidebug', '0'),
	(1050, 'scorm', 'apidebugmask', '.*'),
	(1051, 'scorm', 'protectpackagedownloads', '0'),
	(1052, 'url', 'framesize', '130'),
	(1053, 'url', 'secretphrase', ''),
	(1054, 'url', 'rolesinparams', '0'),
	(1055, 'url', 'displayoptions', '0,1,5,6'),
	(1056, 'url', 'printintro', '1'),
	(1057, 'url', 'display', '0'),
	(1058, 'url', 'popupwidth', '620'),
	(1059, 'url', 'popupheight', '450'),
	(1060, 'workshop', 'grade', '80'),
	(1061, 'workshop', 'gradinggrade', '20'),
	(1062, 'workshop', 'gradedecimals', '0'),
	(1063, 'workshop', 'maxbytes', '0'),
	(1064, 'workshop', 'strategy', 'accumulative'),
	(1065, 'workshop', 'examplesmode', '0'),
	(1066, 'workshopallocation_random', 'numofreviews', '5'),
	(1067, 'workshopform_numerrors', 'grade0', 'Não'),
	(1068, 'workshopform_numerrors', 'grade1', 'Sim'),
	(1069, 'workshopeval_best', 'comparison', '5'),
	(1070, 'block_course_overview', 'defaultmaxcourses', '10'),
	(1071, 'block_course_overview', 'forcedefaultmaxcourses', '0'),
	(1072, 'block_course_overview', 'showchildren', '0'),
	(1073, 'block_course_overview', 'showwelcomearea', '0'),
	(1074, 'block_course_overview', 'showcategories', '0'),
	(1075, 'block_section_links', 'numsections1', '22'),
	(1076, 'block_section_links', 'incby1', '2'),
	(1077, 'block_section_links', 'numsections2', '40'),
	(1078, 'block_section_links', 'incby2', '5'),
	(1079, 'block_tag_youtube', 'apikey', ''),
	(1080, 'editor_atto', 'toolbar', 'collapse = collapse\nstyle1 = title, bold, italic\nlist = unorderedlist, orderedlist\nlinks = link\nfiles = image, media, managefiles\nstyle2 = underline, strike, subscript, superscript\nalign = align\nindent = indent\ninsert = equation, charmap, table, clear\nundo = undo\naccessibility = accessibilitychecker, accessibilityhelper\nother = html'),
	(1081, 'editor_atto', 'autosavefrequency', '60'),
	(1082, 'atto_collapse', 'showgroups', '5'),
	(1083, 'atto_equation', 'librarygroup1', '\n\\cdot\n\\times\n\\ast\n\\div\n\\diamond\n\\pm\n\\mp\n\\oplus\n\\ominus\n\\otimes\n\\oslash\n\\odot\n\\circ\n\\bullet\n\\asymp\n\\equiv\n\\subseteq\n\\supseteq\n\\leq\n\\geq\n\\preceq\n\\succeq\n\\sim\n\\simeq\n\\approx\n\\subset\n\\supset\n\\ll\n\\gg\n\\prec\n\\succ\n\\infty\n\\in\n\\ni\n\\forall\n\\exists\n\\neq\n'),
	(1084, 'atto_equation', 'librarygroup2', '\n\\leftarrow\n\\rightarrow\n\\uparrow\n\\downarrow\n\\leftrightarrow\n\\nearrow\n\\searrow\n\\swarrow\n\\nwarrow\n\\Leftarrow\n\\Rightarrow\n\\Uparrow\n\\Downarrow\n\\Leftrightarrow\n'),
	(1085, 'atto_equation', 'librarygroup3', '\n\\alpha\n\\beta\n\\gamma\n\\delta\n\\epsilon\n\\zeta\n\\eta\n\\theta\n\\iota\n\\kappa\n\\lambda\n\\mu\n\\nu\n\\xi\n\\pi\n\\rho\n\\sigma\n\\tau\n\\upsilon\n\\phi\n\\chi\n\\psi\n\\omega\n\\Gamma\n\\Delta\n\\Theta\n\\Lambda\n\\Xi\n\\Pi\n\\Sigma\n\\Upsilon\n\\Phi\n\\Psi\n\\Omega\n'),
	(1086, 'atto_equation', 'librarygroup4', '\n\\sum{a,b}\n\\sqrt[a]{b+c}\n\\int_{a}^{b}{c}\n\\iint_{a}^{b}{c}\n\\iiint_{a}^{b}{c}\n\\oint{a}\n(a)\n[a]\n\\lbrace{a}\\rbrace\n\\left| \\begin{matrix} a_1 & a_2 \\ a_3 & a_4 \\end{matrix} \\right|\n\\frac{a}{b+c}\n\\vec{a}\n\\binom {a} {b}\n{a \\brack b}\n{a \\brace b}\n'),
	(1087, 'atto_table', 'allowborders', '0'),
	(1088, 'atto_table', 'allowbackgroundcolour', '0'),
	(1089, 'atto_table', 'allowwidth', '0'),
	(1090, 'editor_tinymce', 'customtoolbar', 'wrap,formatselect,wrap,bold,italic,wrap,bullist,numlist,wrap,link,unlink,wrap,image\n\nundo,redo,wrap,underline,strikethrough,sub,sup,wrap,justifyleft,justifycenter,justifyright,wrap,outdent,indent,wrap,forecolor,backcolor,wrap,ltr,rtl\n\nfontselect,fontsizeselect,wrap,code,search,replace,wrap,nonbreaking,charmap,table,wrap,cleanup,removeformat,pastetext,pasteword,wrap,fullscreen'),
	(1091, 'editor_tinymce', 'fontselectlist', 'Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings'),
	(1092, 'editor_tinymce', 'customconfig', ''),
	(1093, 'tinymce_moodleemoticon', 'requireemoticon', '1'),
	(1094, 'tinymce_spellchecker', 'spellengine', ''),
	(1095, 'tinymce_spellchecker', 'spelllanguagelist', '+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv'),
	(1096, 'tool_recyclebin', 'coursebinenable', '1'),
	(1097, 'tool_recyclebin', 'coursebinexpiry', '604800'),
	(1098, 'tool_recyclebin', 'categorybinenable', '1'),
	(1099, 'tool_recyclebin', 'categorybinexpiry', '604800'),
	(1100, 'tool_recyclebin', 'autohide', '1'),
	(1101, 'filter_emoticon', 'formats', '1,4,0'),
	(1102, 'filter_mathjaxloader', 'httpurl', 'http://cdn.mathjax.org/mathjax/2.6-latest/MathJax.js'),
	(1103, 'filter_mathjaxloader', 'httpsurl', 'https://cdn.mathjax.org/mathjax/2.6-latest/MathJax.js'),
	(1104, 'filter_mathjaxloader', 'texfiltercompatibility', '0'),
	(1105, 'filter_mathjaxloader', 'mathjaxconfig', '\nMathJax.Hub.Config({\n    config: ["Accessible.js", "Safe.js"],\n    errorSettings: { message: ["!"] },\n    skipStartupTypeset: true,\n    messageStyle: "none"\n});\n'),
	(1106, 'filter_mathjaxloader', 'additionaldelimiters', ''),
	(1107, 'filter_tex', 'latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n'),
	(1108, 'filter_tex', 'latexbackground', '#FFFFFF'),
	(1109, 'filter_tex', 'density', '120'),
	(1110, 'filter_tex', 'pathlatex', '/usr/bin/latex'),
	(1111, 'filter_tex', 'pathdvips', '/usr/bin/dvips'),
	(1112, 'filter_tex', 'pathconvert', '/usr/bin/convert'),
	(1113, 'filter_tex', 'pathdvisvgm', '/usr/bin/dvisvgm'),
	(1114, 'filter_tex', 'pathmimetex', ''),
	(1115, 'filter_tex', 'convertformat', 'gif'),
	(1116, 'filter_urltolink', 'formats', '0'),
	(1117, 'filter_urltolink', 'embedimages', '1'),
	(1118, 'format_singleactivity', 'activitytype', 'forum'),
	(1119, 'enrol_cohort', 'roleid', '5'),
	(1120, 'enrol_cohort', 'unenrolaction', '0'),
	(1121, 'enrol_database', 'dbtype', ''),
	(1122, 'enrol_database', 'dbhost', 'localhost'),
	(1123, 'enrol_database', 'dbuser', ''),
	(1124, 'enrol_database', 'dbpass', ''),
	(1125, 'enrol_database', 'dbname', ''),
	(1126, 'enrol_database', 'dbencoding', 'utf-8'),
	(1127, 'enrol_database', 'dbsetupsql', ''),
	(1128, 'enrol_database', 'dbsybasequoting', '0'),
	(1129, 'enrol_database', 'debugdb', '0'),
	(1130, 'enrol_database', 'localcoursefield', 'idnumber'),
	(1131, 'enrol_database', 'localuserfield', 'idnumber'),
	(1132, 'enrol_database', 'localrolefield', 'shortname'),
	(1133, 'enrol_database', 'localcategoryfield', 'id'),
	(1134, 'enrol_database', 'remoteenroltable', ''),
	(1135, 'enrol_database', 'remotecoursefield', ''),
	(1136, 'enrol_database', 'remoteuserfield', ''),
	(1137, 'enrol_database', 'remoterolefield', ''),
	(1138, 'enrol_database', 'remoteotheruserfield', ''),
	(1139, 'enrol_database', 'defaultrole', '5'),
	(1140, 'enrol_database', 'ignorehiddencourses', '0'),
	(1141, 'enrol_database', 'unenrolaction', '0'),
	(1142, 'enrol_database', 'newcoursetable', ''),
	(1143, 'enrol_database', 'newcoursefullname', 'fullname'),
	(1144, 'enrol_database', 'newcourseshortname', 'shortname'),
	(1145, 'enrol_database', 'newcourseidnumber', 'idnumber'),
	(1146, 'enrol_database', 'newcoursecategory', ''),
	(1147, 'enrol_database', 'defaultcategory', '1'),
	(1148, 'enrol_database', 'templatecourse', ''),
	(1149, 'enrol_flatfile', 'location', ''),
	(1150, 'enrol_flatfile', 'encoding', 'UTF-8'),
	(1151, 'enrol_flatfile', 'mailstudents', '0'),
	(1152, 'enrol_flatfile', 'mailteachers', '0'),
	(1153, 'enrol_flatfile', 'mailadmins', '0'),
	(1154, 'enrol_flatfile', 'unenrolaction', '3'),
	(1155, 'enrol_flatfile', 'expiredaction', '3'),
	(1156, 'enrol_guest', 'requirepassword', '0'),
	(1157, 'enrol_guest', 'usepasswordpolicy', '0'),
	(1158, 'enrol_guest', 'showhint', '0'),
	(1159, 'enrol_guest', 'defaultenrol', '1'),
	(1160, 'enrol_guest', 'status', '1'),
	(1161, 'enrol_guest', 'status_adv', ''),
	(1162, 'enrol_imsenterprise', 'imsfilelocation', ''),
	(1163, 'enrol_imsenterprise', 'logtolocation', ''),
	(1164, 'enrol_imsenterprise', 'mailadmins', '0'),
	(1165, 'enrol_imsenterprise', 'createnewusers', '0'),
	(1166, 'enrol_imsenterprise', 'imsdeleteusers', '0'),
	(1167, 'enrol_imsenterprise', 'fixcaseusernames', '0'),
	(1168, 'enrol_imsenterprise', 'fixcasepersonalnames', '0'),
	(1169, 'enrol_imsenterprise', 'imssourcedidfallback', '0'),
	(1170, 'enrol_imsenterprise', 'imsrolemap01', '5'),
	(1171, 'enrol_imsenterprise', 'imsrolemap02', '3'),
	(1172, 'enrol_imsenterprise', 'imsrolemap03', '3'),
	(1173, 'enrol_imsenterprise', 'imsrolemap04', '5'),
	(1174, 'enrol_imsenterprise', 'imsrolemap05', '0'),
	(1175, 'enrol_imsenterprise', 'imsrolemap06', '4'),
	(1176, 'enrol_imsenterprise', 'imsrolemap07', '0'),
	(1177, 'enrol_imsenterprise', 'imsrolemap08', '4'),
	(1178, 'enrol_imsenterprise', 'truncatecoursecodes', '0'),
	(1179, 'enrol_imsenterprise', 'createnewcourses', '0'),
	(1180, 'enrol_imsenterprise', 'createnewcategories', '0'),
	(1181, 'enrol_imsenterprise', 'imsunenrol', '0'),
	(1182, 'enrol_imsenterprise', 'imscoursemapshortname', 'coursecode'),
	(1183, 'enrol_imsenterprise', 'imscoursemapfullname', 'short'),
	(1184, 'enrol_imsenterprise', 'imscoursemapsummary', 'ignore'),
	(1185, 'enrol_imsenterprise', 'imsrestricttarget', ''),
	(1186, 'enrol_imsenterprise', 'imscapitafix', '0'),
	(1187, 'enrol_lti', 'emaildisplay', '2'),
	(1188, 'enrol_lti', 'city', ''),
	(1189, 'enrol_lti', 'country', ''),
	(1190, 'enrol_lti', 'timezone', '99'),
	(1191, 'enrol_lti', 'lang', 'pt_br'),
	(1192, 'enrol_lti', 'institution', ''),
	(1193, 'enrol_manual', 'expiredaction', '1'),
	(1194, 'enrol_manual', 'expirynotifyhour', '6'),
	(1195, 'enrol_manual', 'defaultenrol', '1'),
	(1196, 'enrol_manual', 'status', '0'),
	(1197, 'enrol_manual', 'roleid', '5'),
	(1198, 'enrol_manual', 'enrolstart', '4'),
	(1199, 'enrol_manual', 'enrolperiod', '0'),
	(1200, 'enrol_manual', 'expirynotify', '0'),
	(1201, 'enrol_manual', 'expirythreshold', '86400'),
	(1202, 'enrol_meta', 'nosyncroleids', ''),
	(1203, 'enrol_meta', 'syncall', '1'),
	(1204, 'enrol_meta', 'unenrolaction', '3'),
	(1205, 'enrol_meta', 'coursesort', 'sortorder'),
	(1206, 'enrol_mnet', 'roleid', '5'),
	(1207, 'enrol_mnet', 'roleid_adv', '1'),
	(1208, 'enrol_paypal', 'paypalbusiness', ''),
	(1209, 'enrol_paypal', 'mailstudents', '0'),
	(1210, 'enrol_paypal', 'mailteachers', '0'),
	(1211, 'enrol_paypal', 'mailadmins', '0'),
	(1212, 'enrol_paypal', 'expiredaction', '3'),
	(1213, 'enrol_paypal', 'status', '1'),
	(1214, 'enrol_paypal', 'cost', '0'),
	(1215, 'enrol_paypal', 'currency', 'USD'),
	(1216, 'enrol_paypal', 'roleid', '5'),
	(1217, 'enrol_paypal', 'enrolperiod', '0'),
	(1218, 'enrol_self', 'requirepassword', '0'),
	(1219, 'enrol_self', 'usepasswordpolicy', '0'),
	(1220, 'enrol_self', 'showhint', '0'),
	(1221, 'enrol_self', 'expiredaction', '1'),
	(1222, 'enrol_self', 'expirynotifyhour', '6'),
	(1223, 'enrol_self', 'defaultenrol', '1'),
	(1224, 'enrol_self', 'status', '1'),
	(1225, 'enrol_self', 'newenrols', '1'),
	(1226, 'enrol_self', 'groupkey', '0'),
	(1227, 'enrol_self', 'roleid', '5'),
	(1228, 'enrol_self', 'enrolperiod', '0'),
	(1229, 'enrol_self', 'expirynotify', '0'),
	(1230, 'enrol_self', 'expirythreshold', '86400'),
	(1231, 'enrol_self', 'longtimenosee', '0'),
	(1232, 'enrol_self', 'maxenrolled', '0'),
	(1233, 'enrol_self', 'sendcoursewelcomemessage', '1'),
	(1234, 'logstore_database', 'dbdriver', ''),
	(1235, 'logstore_database', 'dbhost', ''),
	(1236, 'logstore_database', 'dbuser', ''),
	(1237, 'logstore_database', 'dbpass', ''),
	(1238, 'logstore_database', 'dbname', ''),
	(1239, 'logstore_database', 'dbtable', ''),
	(1240, 'logstore_database', 'dbpersist', '0'),
	(1241, 'logstore_database', 'dbsocket', ''),
	(1242, 'logstore_database', 'dbport', ''),
	(1243, 'logstore_database', 'dbschema', ''),
	(1244, 'logstore_database', 'dbcollation', ''),
	(1245, 'logstore_database', 'buffersize', '50'),
	(1246, 'logstore_database', 'logguests', '0'),
	(1247, 'logstore_database', 'includelevels', '1,2,0'),
	(1248, 'logstore_database', 'includeactions', 'c,r,u,d'),
	(1249, 'logstore_legacy', 'loglegacy', '0'),
	(1250, 'logstore_standard', 'logguests', '1'),
	(1251, 'logstore_standard', 'loglifetime', '0'),
	(1252, 'logstore_standard', 'buffersize', '50'),
	(1253, 'antivirus_clamav', 'pathtoclam', ''),
	(1254, 'antivirus_clamav', 'quarantinedir', ''),
	(1255, 'antivirus_clamav', 'clamfailureonupload', 'donothing');
/*!40000 ALTER TABLE `mdl_config_plugins` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_context
CREATE TABLE IF NOT EXISTS `mdl_context` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depth` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cont_conins_uix` (`contextlevel`,`instanceid`),
  KEY `mdl_cont_ins_ix` (`instanceid`),
  KEY `mdl_cont_pat_ix` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='one of these must be set';

-- Copiando dados para a tabela capacitacoes.mdl_context: ~50 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_context` DISABLE KEYS */;
INSERT INTO `mdl_context` (`id`, `contextlevel`, `instanceid`, `path`, `depth`) VALUES
	(2, 10, 0, '/2', 1),
	(3, 50, 1, '/2/3', 2),
	(4, 40, 1, '/2/4', 2),
	(5, 30, 1, '/2/5', 2),
	(6, 30, 2, '/2/6', 2),
	(7, 80, 1, '/2/3/7', 3),
	(8, 80, 2, '/2/3/8', 3),
	(9, 80, 3, '/2/3/9', 3),
	(10, 80, 4, '/2/10', 2),
	(11, 80, 5, '/2/11', 2),
	(12, 80, 6, '/2/12', 2),
	(13, 80, 7, '/2/13', 2),
	(14, 80, 8, '/2/14', 2),
	(15, 80, 9, '/2/15', 2),
	(16, 80, 10, '/2/16', 2),
	(17, 80, 11, '/2/17', 2),
	(18, 80, 12, '/2/18', 2),
	(19, 80, 13, '/2/19', 2),
	(27, 30, 3, '/2/27', 2),
	(28, 30, 4, '/2/28', 2),
	(29, 80, 21, '/2/29', 2),
	(30, 40, 2, '/2/30', 2),
	(31, 50, 2, '/2/4/31', 3),
	(32, 80, 22, '/2/4/31/32', 4),
	(33, 80, 23, '/2/4/31/33', 4),
	(34, 80, 24, '/2/4/31/34', 4),
	(35, 80, 25, '/2/4/31/35', 4),
	(36, 50, 3, '/2/30/36', 3),
	(37, 80, 26, '/2/30/36/37', 4),
	(38, 80, 27, '/2/30/36/38', 4),
	(39, 80, 28, '/2/30/36/39', 4),
	(40, 80, 29, '/2/30/36/40', 4),
	(41, 50, 4, '/2/30/41', 3),
	(42, 80, 30, '/2/30/41/42', 4),
	(43, 80, 31, '/2/30/41/43', 4),
	(44, 80, 32, '/2/30/41/44', 4),
	(45, 80, 33, '/2/30/41/45', 4),
	(46, 50, 5, '/2/30/46', 3),
	(47, 80, 34, '/2/30/46/47', 4),
	(48, 80, 35, '/2/30/46/48', 4),
	(49, 80, 36, '/2/30/46/49', 4),
	(50, 80, 37, '/2/30/46/50', 4),
	(52, 70, 2, '/2/30/41/52', 4),
	(53, 70, 3, '/2/30/46/53', 4),
	(54, 70, 4, '/2/30/36/54', 4),
	(55, 70, 5, '/2/30/36/55', 4),
	(56, 70, 6, '/2/30/36/56', 4),
	(57, 70, 7, '/2/30/36/57', 4),
	(58, 70, 8, '/2/30/36/58', 4),
	(59, 70, 9, '/2/30/36/59', 4);
/*!40000 ALTER TABLE `mdl_context` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_context_temp
CREATE TABLE IF NOT EXISTS `mdl_context_temp` (
  `id` bigint(10) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `depth` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Used by build_context_path() in upgrade and cron to keep con';

-- Copiando dados para a tabela capacitacoes.mdl_context_temp: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_context_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_context_temp` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_course
CREATE TABLE IF NOT EXISTS `mdl_course` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `format` varchar(21) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'topics',
  `showgrades` tinyint(2) NOT NULL DEFAULT '1',
  `newsitems` mediumint(5) NOT NULL DEFAULT '1',
  `startdate` bigint(10) NOT NULL DEFAULT '0',
  `marker` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `showreports` smallint(4) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupmodeforce` smallint(4) NOT NULL DEFAULT '0',
  `defaultgroupingid` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `calendartype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requested` tinyint(1) NOT NULL DEFAULT '0',
  `enablecompletion` tinyint(1) NOT NULL DEFAULT '0',
  `completionnotify` tinyint(1) NOT NULL DEFAULT '0',
  `cacherev` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cour_cat_ix` (`category`),
  KEY `mdl_cour_idn_ix` (`idnumber`),
  KEY `mdl_cour_sho_ix` (`shortname`),
  KEY `mdl_cour_sor_ix` (`sortorder`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Central course table';

-- Copiando dados para a tabela capacitacoes.mdl_course: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_course` DISABLE KEYS */;
INSERT INTO `mdl_course` (`id`, `category`, `sortorder`, `fullname`, `shortname`, `idnumber`, `summary`, `summaryformat`, `format`, `showgrades`, `newsitems`, `startdate`, `marker`, `maxbytes`, `legacyfiles`, `showreports`, `visible`, `visibleold`, `groupmode`, `groupmodeforce`, `defaultgroupingid`, `lang`, `calendartype`, `theme`, `timecreated`, `timemodified`, `requested`, `enablecompletion`, `completionnotify`, `cacherev`) VALUES
	(1, 0, 1, 'AVA - INFATEC', 'AVA - INFATEC', '', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and \r\ntypesetting industry. Lorem Ipsum has been the industry\'s standard dummy\r\n text ever since the 1500s, when an unknown printer took a galley of \r\ntype and scrambled it to make a type specimen book. It has survived not \r\nonly five centuries, but also the leap into electronic typesetting, \r\nremaining essentially unchanged. It was popularised in the 1960s with \r\nthe release of Letraset sheets containing Lorem Ipsum passages, and more\r\n recently with desktop publishing software like Aldus PageMaker \r\nincluding versions of Lorem Ipsum.</p><p><br>Contrary to popular belief, Lorem Ipsum is not simply random text. It \r\nhas roots in a piece of classical Latin literature from 45 BC, making it\r\n over 2000 years old. Richard McClintock, a Latin professor at \r\nHampden-Sydney College in Virginia, looked up one of the more obscure \r\nLatin words, consectetur, from a Lorem Ipsum passage, and going through \r\nthe cites of the word in classical literature, discovered the \r\nundoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 \r\nof "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by \r\nCicero, written in 45 BC. This book is a treatise on the theory of \r\nethics, very popular during the Renaissance. The first line of Lorem \r\nIpsum, "Lorem ipsum dolor sit amet..", comes from a line in section \r\n1.10.32.</p>', 0, 'site', 1, 3, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, '', '', '', 1475503294, 1475526872, 0, 0, 0, 1475526872),
	(2, 1, 10001, 'MÓDULO I – DESENVOLVIMENTO INFANTIL', '2015 - Modulo I', '', '', 1, 'topics', 1, 5, 1475550000, 0, 0, 0, 0, 1, 1, 0, 0, 0, '', '', '', 1475527124, 1475527124, 0, 0, 0, 1475527125),
	(3, 2, 20001, 'MÓDULO I – DESENVOLVIMENTO INFANTIL', '2016 - Modulo I', '', '', 1, 'topics', 1, 5, 1475550000, 0, 0, 0, 0, 1, 1, 0, 0, 0, '', '', '', 1475527157, 1475527157, 0, 0, 0, 1475527705),
	(4, 2, 20002, 'MÓDULO II - EIXO CURRICULAR LINGUAGEM ORAL E ESCRITA', '2016 - Modulo II', '', '', 1, 'topics', 1, 5, 1475550000, 0, 0, 0, 0, 1, 1, 0, 0, 0, '', '', '', 1475527202, 1475527202, 0, 0, 0, 1475527446),
	(5, 2, 20003, 'MÓDULO III- A LUDICIDADE COMO PRINCIPIO ESTÉTICO', '2016 - Modulo III', '', '', 1, 'topics', 1, 5, 1475550000, 0, 0, 0, 0, 1, 1, 0, 0, 0, '', '', '', 1475527250, 1475527250, 0, 0, 0, 1475527477);
/*!40000 ALTER TABLE `mdl_course` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_course_categories
CREATE TABLE IF NOT EXISTS `mdl_course_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `coursecount` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `theme` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcate_par_ix` (`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course categories';

-- Copiando dados para a tabela capacitacoes.mdl_course_categories: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_course_categories` DISABLE KEYS */;
INSERT INTO `mdl_course_categories` (`id`, `name`, `idnumber`, `description`, `descriptionformat`, `parent`, `sortorder`, `coursecount`, `visible`, `visibleold`, `timemodified`, `depth`, `path`, `theme`) VALUES
	(1, '2015', NULL, 'Descrição 2015 ', 0, 0, 10000, 1, 1, 1, 1475527070, 1, '/1', NULL),
	(2, '2016', '', '<p>Descrição 2016<br></p>', 1, 0, 20000, 3, 1, 1, 1475527087, 1, '/2', NULL);
/*!40000 ALTER TABLE `mdl_course_categories` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_course_completions
CREATE TABLE IF NOT EXISTS `mdl_course_completions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `timeenrolled` bigint(10) NOT NULL DEFAULT '0',
  `timestarted` bigint(10) NOT NULL DEFAULT '0',
  `timecompleted` bigint(10) DEFAULT NULL,
  `reaggregate` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcomp_usecou_uix` (`userid`,`course`),
  KEY `mdl_courcomp_use_ix` (`userid`),
  KEY `mdl_courcomp_cou_ix` (`course`),
  KEY `mdl_courcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion records';

-- Copiando dados para a tabela capacitacoes.mdl_course_completions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_course_completions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_completions` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_course_completion_aggr_methd
CREATE TABLE IF NOT EXISTS `mdl_course_completion_aggr_methd` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '0',
  `value` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompaggrmeth_coucr_uix` (`course`,`criteriatype`),
  KEY `mdl_courcompaggrmeth_cou_ix` (`course`),
  KEY `mdl_courcompaggrmeth_cri_ix` (`criteriatype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion aggregation methods for criteria';

-- Copiando dados para a tabela capacitacoes.mdl_course_completion_aggr_methd: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_course_completion_aggr_methd` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_completion_aggr_methd` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_course_completion_criteria
CREATE TABLE IF NOT EXISTS `mdl_course_completion_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `moduleinstance` bigint(10) DEFAULT NULL,
  `courseinstance` bigint(10) DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT NULL,
  `timeend` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) DEFAULT NULL,
  `role` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcompcrit_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion criteria';

-- Copiando dados para a tabela capacitacoes.mdl_course_completion_criteria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_course_completion_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_completion_criteria` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_course_completion_crit_compl
CREATE TABLE IF NOT EXISTS `mdl_course_completion_crit_compl` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriaid` bigint(10) NOT NULL DEFAULT '0',
  `gradefinal` decimal(10,5) DEFAULT NULL,
  `unenroled` bigint(10) DEFAULT NULL,
  `timecompleted` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompcritcomp_useco_uix` (`userid`,`course`,`criteriaid`),
  KEY `mdl_courcompcritcomp_use_ix` (`userid`),
  KEY `mdl_courcompcritcomp_cou_ix` (`course`),
  KEY `mdl_courcompcritcomp_cri_ix` (`criteriaid`),
  KEY `mdl_courcompcritcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion user records';

-- Copiando dados para a tabela capacitacoes.mdl_course_completion_crit_compl: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_course_completion_crit_compl` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_completion_crit_compl` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_course_format_options
CREATE TABLE IF NOT EXISTS `mdl_course_format_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `format` varchar(21) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sectionid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courformopti_couforsec_uix` (`courseid`,`format`,`sectionid`,`name`),
  KEY `mdl_courformopti_cou_ix` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores format-specific options for the course or course sect';

-- Copiando dados para a tabela capacitacoes.mdl_course_format_options: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_course_format_options` DISABLE KEYS */;
INSERT INTO `mdl_course_format_options` (`id`, `courseid`, `format`, `sectionid`, `name`, `value`) VALUES
	(1, 1, 'site', 0, 'numsections', '1'),
	(2, 2, 'topics', 0, 'numsections', '2'),
	(3, 2, 'topics', 0, 'hiddensections', '0'),
	(4, 2, 'topics', 0, 'coursedisplay', '0'),
	(5, 3, 'topics', 0, 'numsections', '2'),
	(6, 3, 'topics', 0, 'hiddensections', '0'),
	(7, 3, 'topics', 0, 'coursedisplay', '0'),
	(8, 4, 'topics', 0, 'numsections', '3'),
	(9, 4, 'topics', 0, 'hiddensections', '0'),
	(10, 4, 'topics', 0, 'coursedisplay', '0'),
	(11, 5, 'topics', 0, 'numsections', '3'),
	(12, 5, 'topics', 0, 'hiddensections', '0'),
	(13, 5, 'topics', 0, 'coursedisplay', '0');
/*!40000 ALTER TABLE `mdl_course_format_options` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_course_modules
CREATE TABLE IF NOT EXISTS `mdl_course_modules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` bigint(10) NOT NULL DEFAULT '0',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `added` bigint(10) NOT NULL DEFAULT '0',
  `score` smallint(4) NOT NULL DEFAULT '0',
  `indent` mediumint(5) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `completion` tinyint(1) NOT NULL DEFAULT '0',
  `completiongradeitemnumber` bigint(10) DEFAULT NULL,
  `completionview` tinyint(1) NOT NULL DEFAULT '0',
  `completionexpected` bigint(10) NOT NULL DEFAULT '0',
  `showdescription` tinyint(1) NOT NULL DEFAULT '0',
  `availability` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_courmodu_vis_ix` (`visible`),
  KEY `mdl_courmodu_cou_ix` (`course`),
  KEY `mdl_courmodu_mod_ix` (`module`),
  KEY `mdl_courmodu_ins_ix` (`instance`),
  KEY `mdl_courmodu_idncou_ix` (`idnumber`,`course`),
  KEY `mdl_courmodu_gro_ix` (`groupingid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='course_modules table retrofitted from MySQL';

-- Copiando dados para a tabela capacitacoes.mdl_course_modules: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_course_modules` DISABLE KEYS */;
INSERT INTO `mdl_course_modules` (`id`, `course`, `module`, `instance`, `section`, `idnumber`, `added`, `score`, `indent`, `visible`, `visibleold`, `groupmode`, `groupingid`, `completion`, `completiongradeitemnumber`, `completionview`, `completionexpected`, `showdescription`, `availability`) VALUES
	(2, 4, 9, 2, 5, NULL, 1475527362, 0, 0, 1, 1, 0, 0, 0, NULL, 0, 0, 0, NULL),
	(3, 5, 9, 3, 6, NULL, 1475527452, 0, 0, 1, 1, 0, 0, 0, NULL, 0, 0, 0, NULL),
	(4, 3, 9, 4, 7, '', 1475527533, 0, 0, 1, 1, 0, 0, 0, NULL, 0, 0, 0, NULL),
	(5, 3, 22, 1, 7, '', 1475527593, 0, 0, 1, 1, 0, 0, 0, NULL, 0, 0, 0, NULL),
	(6, 3, 9, 5, 8, '', 1475527634, 0, 0, 1, 1, 0, 0, 0, NULL, 0, 0, 0, NULL),
	(7, 3, 9, 6, 8, '', 1475527655, 0, 0, 1, 1, 0, 0, 0, NULL, 0, 0, 0, NULL),
	(8, 3, 4, 1, 8, '', 1475527682, 0, 0, 1, 1, 0, 0, 0, NULL, 0, 0, 0, NULL),
	(9, 3, 9, 7, 4, NULL, 1475527704, 0, 0, 1, 1, 0, 0, 0, NULL, 0, 0, 0, NULL);
/*!40000 ALTER TABLE `mdl_course_modules` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_course_modules_completion
CREATE TABLE IF NOT EXISTS `mdl_course_modules_completion` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `completionstate` tinyint(1) NOT NULL,
  `viewed` tinyint(1) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courmoducomp_usecou_uix` (`userid`,`coursemoduleid`),
  KEY `mdl_courmoducomp_cou_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the completion state (completed or not completed, etc';

-- Copiando dados para a tabela capacitacoes.mdl_course_modules_completion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_course_modules_completion` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_modules_completion` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_course_published
CREATE TABLE IF NOT EXISTS `mdl_course_published` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `huburl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `timepublished` bigint(10) NOT NULL,
  `enrollable` tinyint(1) NOT NULL DEFAULT '1',
  `hubcourseid` bigint(10) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `timechecked` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about how and when an local courses were publish';

-- Copiando dados para a tabela capacitacoes.mdl_course_published: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_course_published` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_published` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_course_request
CREATE TABLE IF NOT EXISTS `mdl_course_request` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci NOT NULL,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `category` bigint(10) NOT NULL DEFAULT '0',
  `reason` longtext COLLATE utf8_unicode_ci NOT NULL,
  `requester` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_courrequ_sho_ix` (`shortname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='course requests';

-- Copiando dados para a tabela capacitacoes.mdl_course_request: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_course_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_request` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_course_sections
CREATE TABLE IF NOT EXISTS `mdl_course_sections` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` longtext COLLATE utf8_unicode_ci,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `sequence` longtext COLLATE utf8_unicode_ci,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `availability` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_coursect_cousec_uix` (`course`,`section`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to define the sections for each course';

-- Copiando dados para a tabela capacitacoes.mdl_course_sections: ~14 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_course_sections` DISABLE KEYS */;
INSERT INTO `mdl_course_sections` (`id`, `course`, `section`, `name`, `summary`, `summaryformat`, `sequence`, `visible`, `availability`) VALUES
	(1, 1, 0, NULL, '', 1, '', 1, NULL),
	(2, 1, 1, NULL, '', 1, '', 1, NULL),
	(3, 2, 0, NULL, '', 1, '', 1, NULL),
	(4, 3, 0, NULL, '', 1, '9', 1, NULL),
	(5, 4, 0, NULL, '', 1, '2', 1, NULL),
	(6, 5, 0, NULL, '', 1, '3', 1, NULL),
	(7, 3, 1, 'Etapas do desenvolvimento da criança', '', 1, '4,5', 1, NULL),
	(8, 3, 2, 'Intervenções pedagógicas para estimular a linguagem oral e escrita, o movimento, a afetividade, o raciocínio lógico', '', 1, '6,7,8', 1, NULL),
	(9, 4, 1, 'Leitura na Educação Infantil: para quê?', '', 1, '', 1, NULL),
	(10, 4, 2, 'Literatura: porta de entrada das crianças para a leitura.  (Oficina de Recursos para as  histórias)', '', 1, '', 1, NULL),
	(11, 4, 3, 'Alfabetizar e letrar na Educação Infantil', '', 1, '', 1, NULL),
	(12, 5, 1, 'O brincar no desenvolvimento da criança', '', 1, '', 1, NULL),
	(13, 5, 2, 'Classificação das brincadeiras', '', 1, '', 1, NULL),
	(14, 5, 3, 'Jogos e brincadeiras (Oficina Movimento e o brincar na Educação infantil)', '', 1, '', 1, NULL);
/*!40000 ALTER TABLE `mdl_course_sections` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_data
CREATE TABLE IF NOT EXISTS `mdl_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `comments` smallint(4) NOT NULL DEFAULT '0',
  `timeavailablefrom` bigint(10) NOT NULL DEFAULT '0',
  `timeavailableto` bigint(10) NOT NULL DEFAULT '0',
  `timeviewfrom` bigint(10) NOT NULL DEFAULT '0',
  `timeviewto` bigint(10) NOT NULL DEFAULT '0',
  `requiredentries` int(8) NOT NULL DEFAULT '0',
  `requiredentriestoview` int(8) NOT NULL DEFAULT '0',
  `maxentries` int(8) NOT NULL DEFAULT '0',
  `rssarticles` smallint(4) NOT NULL DEFAULT '0',
  `singletemplate` longtext COLLATE utf8_unicode_ci,
  `listtemplate` longtext COLLATE utf8_unicode_ci,
  `listtemplateheader` longtext COLLATE utf8_unicode_ci,
  `listtemplatefooter` longtext COLLATE utf8_unicode_ci,
  `addtemplate` longtext COLLATE utf8_unicode_ci,
  `rsstemplate` longtext COLLATE utf8_unicode_ci,
  `rsstitletemplate` longtext COLLATE utf8_unicode_ci,
  `csstemplate` longtext COLLATE utf8_unicode_ci,
  `jstemplate` longtext COLLATE utf8_unicode_ci,
  `asearchtemplate` longtext COLLATE utf8_unicode_ci,
  `approval` smallint(4) NOT NULL DEFAULT '0',
  `manageapproved` smallint(4) NOT NULL DEFAULT '1',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `defaultsort` bigint(10) NOT NULL DEFAULT '0',
  `defaultsortdir` smallint(4) NOT NULL DEFAULT '0',
  `editany` smallint(4) NOT NULL DEFAULT '0',
  `notification` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_data_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all database activities';

-- Copiando dados para a tabela capacitacoes.mdl_data: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_data_content
CREATE TABLE IF NOT EXISTS `mdl_data_content` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `recordid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `content1` longtext COLLATE utf8_unicode_ci,
  `content2` longtext COLLATE utf8_unicode_ci,
  `content3` longtext COLLATE utf8_unicode_ci,
  `content4` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_datacont_rec_ix` (`recordid`),
  KEY `mdl_datacont_fie_ix` (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the content introduced in each record/fields';

-- Copiando dados para a tabela capacitacoes.mdl_data_content: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_data_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data_content` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_data_fields
CREATE TABLE IF NOT EXISTS `mdl_data_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `param1` longtext COLLATE utf8_unicode_ci,
  `param2` longtext COLLATE utf8_unicode_ci,
  `param3` longtext COLLATE utf8_unicode_ci,
  `param4` longtext COLLATE utf8_unicode_ci,
  `param5` longtext COLLATE utf8_unicode_ci,
  `param6` longtext COLLATE utf8_unicode_ci,
  `param7` longtext COLLATE utf8_unicode_ci,
  `param8` longtext COLLATE utf8_unicode_ci,
  `param9` longtext COLLATE utf8_unicode_ci,
  `param10` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_datafiel_typdat_ix` (`type`,`dataid`),
  KEY `mdl_datafiel_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='every field available';

-- Copiando dados para a tabela capacitacoes.mdl_data_fields: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_data_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data_fields` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_data_records
CREATE TABLE IF NOT EXISTS `mdl_data_records` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `approved` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_datareco_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='every record introduced';

-- Copiando dados para a tabela capacitacoes.mdl_data_records: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_data_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data_records` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_editor_atto_autosave
CREATE TABLE IF NOT EXISTS `mdl_editor_atto_autosave` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `elementid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `pagehash` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `drafttext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `draftid` bigint(10) DEFAULT NULL,
  `pageinstance` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_editattoauto_eleconuse_uix` (`elementid`,`contextid`,`userid`,`pagehash`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Draft text that is auto-saved every 5 seconds while an edito';

-- Copiando dados para a tabela capacitacoes.mdl_editor_atto_autosave: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_editor_atto_autosave` DISABLE KEYS */;
INSERT INTO `mdl_editor_atto_autosave` (`id`, `elementid`, `contextid`, `pagehash`, `userid`, `drafttext`, `draftid`, `pageinstance`, `timemodified`) VALUES
	(4, 'id_description_editor', 28, '1a97912dee7d1275a7d2c90686b9618d9971dc33', 2, '', 518113484, 'yui_3_17_2_1_1475526775359_222', 1475526778),
	(6, 'summary', 2, '6a643158c9686da9f56f8858daa62d6dac06427d', 2, '', -1, 'yui_3_17_2_1_1475526874293_158', 1475526876),
	(7, 'id_summary_editor', 4, 'b86cec95e19a7aa38f0f3f3be9dc5e24c07f6dda', 2, '', 322465848, 'yui_3_17_2_1_1475527043845_344', 1475527046);
/*!40000 ALTER TABLE `mdl_editor_atto_autosave` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_enrol
CREATE TABLE IF NOT EXISTS `mdl_enrol` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `enrol` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT '0',
  `enrolstartdate` bigint(10) DEFAULT '0',
  `enrolenddate` bigint(10) DEFAULT '0',
  `expirynotify` tinyint(1) DEFAULT '0',
  `expirythreshold` bigint(10) DEFAULT '0',
  `notifyall` tinyint(1) DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleid` bigint(10) DEFAULT '0',
  `customint1` bigint(10) DEFAULT NULL,
  `customint2` bigint(10) DEFAULT NULL,
  `customint3` bigint(10) DEFAULT NULL,
  `customint4` bigint(10) DEFAULT NULL,
  `customint5` bigint(10) DEFAULT NULL,
  `customint6` bigint(10) DEFAULT NULL,
  `customint7` bigint(10) DEFAULT NULL,
  `customint8` bigint(10) DEFAULT NULL,
  `customchar1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customchar2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customchar3` varchar(1333) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customdec1` decimal(12,7) DEFAULT NULL,
  `customdec2` decimal(12,7) DEFAULT NULL,
  `customtext1` longtext COLLATE utf8_unicode_ci,
  `customtext2` longtext COLLATE utf8_unicode_ci,
  `customtext3` longtext COLLATE utf8_unicode_ci,
  `customtext4` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enro_enr_ix` (`enrol`),
  KEY `mdl_enro_cou_ix` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Instances of enrolment plugins used in courses, fields marke';

-- Copiando dados para a tabela capacitacoes.mdl_enrol: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_enrol` DISABLE KEYS */;
INSERT INTO `mdl_enrol` (`id`, `enrol`, `status`, `courseid`, `sortorder`, `name`, `enrolperiod`, `enrolstartdate`, `enrolenddate`, `expirynotify`, `expirythreshold`, `notifyall`, `password`, `cost`, `currency`, `roleid`, `customint1`, `customint2`, `customint3`, `customint4`, `customint5`, `customint6`, `customint7`, `customint8`, `customchar1`, `customchar2`, `customchar3`, `customdec1`, `customdec2`, `customtext1`, `customtext2`, `customtext3`, `customtext4`, `timecreated`, `timemodified`) VALUES
	(1, 'manual', 0, 2, 0, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1475527125, 1475527125),
	(2, 'guest', 1, 2, 1, NULL, 0, 0, 0, 0, 0, 0, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1475527125, 1475527125),
	(3, 'self', 1, 2, 2, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, 0, 0, 0, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1475527125, 1475527125),
	(4, 'manual', 0, 3, 0, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1475527159, 1475527159),
	(5, 'guest', 1, 3, 1, NULL, 0, 0, 0, 0, 0, 0, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1475527159, 1475527159),
	(6, 'self', 1, 3, 2, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, 0, 0, 0, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1475527159, 1475527159),
	(7, 'manual', 0, 4, 0, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1475527203, 1475527203),
	(8, 'guest', 1, 4, 1, NULL, 0, 0, 0, 0, 0, 0, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1475527203, 1475527203),
	(9, 'self', 1, 4, 2, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, 0, 0, 0, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1475527203, 1475527203),
	(10, 'manual', 0, 5, 0, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1475527251, 1475527251),
	(11, 'guest', 1, 5, 1, NULL, 0, 0, 0, 0, 0, 0, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1475527251, 1475527251),
	(12, 'self', 1, 5, 2, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, 0, 0, 0, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1475527251, 1475527251);
/*!40000 ALTER TABLE `mdl_enrol` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_enrol_flatfile
CREATE TABLE IF NOT EXISTS `mdl_enrol_flatfile` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `roleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enroflat_cou_ix` (`courseid`),
  KEY `mdl_enroflat_use_ix` (`userid`),
  KEY `mdl_enroflat_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='enrol_flatfile table retrofitted from MySQL';

-- Copiando dados para a tabela capacitacoes.mdl_enrol_flatfile: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_enrol_flatfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_flatfile` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_enrol_lti_tools
CREATE TABLE IF NOT EXISTS `mdl_enrol_lti_tools` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `enrolid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `institution` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `timezone` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '99',
  `maxenrolled` bigint(10) NOT NULL DEFAULT '0',
  `maildisplay` tinyint(2) NOT NULL DEFAULT '2',
  `city` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gradesync` tinyint(1) NOT NULL DEFAULT '0',
  `gradesynccompletion` tinyint(1) NOT NULL DEFAULT '0',
  `membersync` tinyint(1) NOT NULL DEFAULT '0',
  `membersyncmode` tinyint(1) NOT NULL DEFAULT '0',
  `roleinstructor` bigint(10) NOT NULL,
  `rolelearner` bigint(10) NOT NULL,
  `secret` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_enroltitool_enr_ix` (`enrolid`),
  KEY `mdl_enroltitool_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of tools provided to the remote system';

-- Copiando dados para a tabela capacitacoes.mdl_enrol_lti_tools: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_enrol_lti_tools` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_lti_tools` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_enrol_lti_users
CREATE TABLE IF NOT EXISTS `mdl_enrol_lti_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `toolid` bigint(10) NOT NULL,
  `serviceurl` longtext COLLATE utf8_unicode_ci,
  `sourceid` longtext COLLATE utf8_unicode_ci,
  `consumerkey` longtext COLLATE utf8_unicode_ci,
  `consumersecret` longtext COLLATE utf8_unicode_ci,
  `membershipsurl` longtext COLLATE utf8_unicode_ci,
  `membershipsid` longtext COLLATE utf8_unicode_ci,
  `lastgrade` decimal(10,5) DEFAULT NULL,
  `lastaccess` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_enroltiuser_use_ix` (`userid`),
  KEY `mdl_enroltiuser_too_ix` (`toolid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='User access log and gradeback data';

-- Copiando dados para a tabela capacitacoes.mdl_enrol_lti_users: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_enrol_lti_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_lti_users` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_enrol_paypal
CREATE TABLE IF NOT EXISTS `mdl_enrol_paypal` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `business` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `receiver_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `receiver_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `item_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `memo` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_name1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_selection1_x` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_name2` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_selection2_x` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pending_reason` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reason_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `txn_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent_txn_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timeupdated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Holds all known information about PayPal transactions';

-- Copiando dados para a tabela capacitacoes.mdl_enrol_paypal: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_enrol_paypal` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_paypal` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_event
CREATE TABLE IF NOT EXISTS `mdl_event` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `repeatid` bigint(10) NOT NULL DEFAULT '0',
  `modulename` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeduration` bigint(10) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '1',
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sequence` bigint(10) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `subscriptionid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_even_cou_ix` (`courseid`),
  KEY `mdl_even_use_ix` (`userid`),
  KEY `mdl_even_tim_ix` (`timestart`),
  KEY `mdl_even_tim2_ix` (`timeduration`),
  KEY `mdl_even_grocouvisuse_ix` (`groupid`,`courseid`,`visible`,`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For everything with a time associated to it';

-- Copiando dados para a tabela capacitacoes.mdl_event: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_event` DISABLE KEYS */;
INSERT INTO `mdl_event` (`id`, `name`, `description`, `format`, `courseid`, `groupid`, `userid`, `repeatid`, `modulename`, `instance`, `eventtype`, `timestart`, `timeduration`, `visible`, `uuid`, `sequence`, `timemodified`, `subscriptionid`) VALUES
	(1, 'Chat A', '', 1, 3, 0, 2, 0, 'chat', 1, 'chattime', 1475527500, 0, 1, '', 1, 1475527682, NULL);
/*!40000 ALTER TABLE `mdl_event` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_events_handlers
CREATE TABLE IF NOT EXISTS `mdl_events_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handlerfile` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handlerfunction` longtext COLLATE utf8_unicode_ci,
  `schedule` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `internal` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_evenhand_evecom_uix` (`eventname`,`component`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table is for storing which components requests what typ';

-- Copiando dados para a tabela capacitacoes.mdl_events_handlers: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_events_handlers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_events_handlers` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_events_queue
CREATE TABLE IF NOT EXISTS `mdl_events_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventdata` longtext COLLATE utf8_unicode_ci NOT NULL,
  `stackdump` longtext COLLATE utf8_unicode_ci,
  `userid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table is for storing queued events. It stores only one ';

-- Copiando dados para a tabela capacitacoes.mdl_events_queue: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_events_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_events_queue` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_events_queue_handlers
CREATE TABLE IF NOT EXISTS `mdl_events_queue_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `queuedeventid` bigint(10) NOT NULL,
  `handlerid` bigint(10) NOT NULL,
  `status` bigint(10) DEFAULT NULL,
  `errormessage` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueuhand_que_ix` (`queuedeventid`),
  KEY `mdl_evenqueuhand_han_ix` (`handlerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This is the list of queued handlers for processing. The even';

-- Copiando dados para a tabela capacitacoes.mdl_events_queue_handlers: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_events_queue_handlers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_events_queue_handlers` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_event_subscriptions
CREATE TABLE IF NOT EXISTS `mdl_event_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pollinterval` bigint(10) NOT NULL DEFAULT '0',
  `lastupdated` bigint(10) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tracks subscriptions to remote calendars.';

-- Copiando dados para a tabela capacitacoes.mdl_event_subscriptions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_event_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_event_subscriptions` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_external_functions
CREATE TABLE IF NOT EXISTS `mdl_external_functions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `methodname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classpath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `capabilities` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `services` varchar(1333) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_extefunc_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=332 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='list of all external functions';

-- Copiando dados para a tabela capacitacoes.mdl_external_functions: ~361 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_external_functions` DISABLE KEYS */;
INSERT INTO `mdl_external_functions` (`id`, `name`, `classname`, `methodname`, `classpath`, `component`, `capabilities`, `services`) VALUES
	(1, 'core_badges_get_user_badges', 'core_badges_external', 'get_user_badges', NULL, 'moodle', 'moodle/badges:viewotherbadges', 'moodle_mobile_app'),
	(2, 'core_calendar_create_calendar_events', 'core_calendar_external', 'create_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries, moodle/calendar:manageownentries, moodle/calendar:managegroupentries', NULL),
	(3, 'core_calendar_delete_calendar_events', 'core_calendar_external', 'delete_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries, moodle/calendar:manageownentries, moodle/calendar:managegroupentries', NULL),
	(4, 'core_calendar_get_calendar_events', 'core_calendar_external', 'get_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries, moodle/calendar:manageownentries, moodle/calendar:managegroupentries', 'moodle_mobile_app'),
	(5, 'core_cohort_add_cohort_members', 'core_cohort_external', 'add_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:assign', NULL),
	(6, 'core_cohort_create_cohorts', 'core_cohort_external', 'create_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage', NULL),
	(7, 'core_cohort_delete_cohort_members', 'core_cohort_external', 'delete_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:assign', NULL),
	(8, 'core_cohort_delete_cohorts', 'core_cohort_external', 'delete_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage', NULL),
	(9, 'core_cohort_get_cohort_members', 'core_cohort_external', 'get_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:view', NULL),
	(10, 'core_cohort_get_cohorts', 'core_cohort_external', 'get_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:view', NULL),
	(11, 'core_cohort_update_cohorts', 'core_cohort_external', 'update_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage', NULL),
	(12, 'core_comment_get_comments', 'core_comment_external', 'get_comments', NULL, 'moodle', 'moodle/comment:view', 'moodle_mobile_app'),
	(13, 'core_completion_get_activities_completion_status', 'core_completion_external', 'get_activities_completion_status', NULL, 'moodle', '', 'moodle_mobile_app'),
	(14, 'core_completion_get_course_completion_status', 'core_completion_external', 'get_course_completion_status', NULL, 'moodle', 'report/completion:view', 'moodle_mobile_app'),
	(15, 'core_completion_mark_course_self_completed', 'core_completion_external', 'mark_course_self_completed', NULL, 'moodle', '', 'moodle_mobile_app'),
	(16, 'core_completion_update_activity_completion_status_manually', 'core_completion_external', 'update_activity_completion_status_manually', NULL, 'moodle', '', 'moodle_mobile_app'),
	(17, 'core_course_create_categories', 'core_course_external', 'create_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage', NULL),
	(18, 'core_course_create_courses', 'core_course_external', 'create_courses', 'course/externallib.php', 'moodle', 'moodle/course:create, moodle/course:visibility', NULL),
	(19, 'core_course_delete_categories', 'core_course_external', 'delete_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage', NULL),
	(20, 'core_course_delete_courses', 'core_course_external', 'delete_courses', 'course/externallib.php', 'moodle', 'moodle/course:delete', NULL),
	(21, 'core_course_delete_modules', 'core_course_external', 'delete_modules', 'course/externallib.php', 'moodle', 'moodle/course:manageactivities', NULL),
	(22, 'core_course_duplicate_course', 'core_course_external', 'duplicate_course', 'course/externallib.php', 'moodle', 'moodle/backup:backupcourse, moodle/restore:restorecourse, moodle/course:create', NULL),
	(23, 'core_course_get_categories', 'core_course_external', 'get_categories', 'course/externallib.php', 'moodle', 'moodle/category:viewhiddencategories', NULL),
	(24, 'core_course_get_contents', 'core_course_external', 'get_course_contents', 'course/externallib.php', 'moodle', 'moodle/course:update, moodle/course:viewhiddencourses', 'moodle_mobile_app'),
	(25, 'core_course_get_course_module', 'core_course_external', 'get_course_module', 'course/externallib.php', 'moodle', '', 'moodle_mobile_app'),
	(26, 'core_course_get_course_module_by_instance', 'core_course_external', 'get_course_module_by_instance', 'course/externallib.php', 'moodle', '', 'moodle_mobile_app'),
	(27, 'core_course_get_courses', 'core_course_external', 'get_courses', 'course/externallib.php', 'moodle', 'moodle/course:view, moodle/course:update, moodle/course:viewhiddencourses', 'moodle_mobile_app'),
	(28, 'core_course_import_course', 'core_course_external', 'import_course', 'course/externallib.php', 'moodle', 'moodle/backup:backuptargetimport, moodle/restore:restoretargetimport', NULL),
	(29, 'core_course_search_courses', 'core_course_external', 'search_courses', 'course/externallib.php', 'moodle', '', 'moodle_mobile_app'),
	(30, 'core_course_update_categories', 'core_course_external', 'update_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage', NULL),
	(31, 'core_course_update_courses', 'core_course_external', 'update_courses', 'course/externallib.php', 'moodle', 'moodle/course:update, moodle/course:changecategory, moodle/course:changefullname, moodle/course:changeshortname, moodle/course:changeidnumber, moodle/course:changesummary, moodle/course:visibility', NULL),
	(32, 'core_course_view_course', 'core_course_external', 'view_course', 'course/externallib.php', 'moodle', '', 'moodle_mobile_app'),
	(33, 'core_enrol_get_course_enrolment_methods', 'core_enrol_external', 'get_course_enrolment_methods', 'enrol/externallib.php', 'moodle', '', 'moodle_mobile_app'),
	(34, 'core_enrol_get_enrolled_users', 'core_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups', 'moodle_mobile_app'),
	(35, 'core_enrol_get_enrolled_users_with_capability', 'core_enrol_external', 'get_enrolled_users_with_capability', 'enrol/externallib.php', 'moodle', '', NULL),
	(36, 'core_enrol_get_users_courses', 'core_enrol_external', 'get_users_courses', 'enrol/externallib.php', 'moodle', 'moodle/course:viewparticipants', 'moodle_mobile_app'),
	(37, 'core_fetch_notifications', 'core_external', 'fetch_notifications', 'lib/external/externallib.php', 'moodle', '', NULL),
	(38, 'core_files_get_files', 'core_files_external', 'get_files', 'files/externallib.php', 'moodle', '', 'moodle_mobile_app'),
	(39, 'core_files_upload', 'core_files_external', 'upload', 'files/externallib.php', 'moodle', '', NULL),
	(40, 'core_get_component_strings', 'core_external', 'get_component_strings', 'lib/external/externallib.php', 'moodle', '', 'moodle_mobile_app'),
	(41, 'core_get_fragment', 'core_external', 'get_fragment', 'lib/external/externallib.php', 'moodle', '', NULL),
	(42, 'core_get_string', 'core_external', 'get_string', 'lib/external/externallib.php', 'moodle', '', NULL),
	(43, 'core_get_strings', 'core_external', 'get_strings', 'lib/external/externallib.php', 'moodle', '', NULL),
	(44, 'core_grades_get_grades', 'core_grades_external', 'get_grades', NULL, 'moodle', 'moodle/grade:view, moodle/grade:viewall, moodle/grade:viewhidden', NULL),
	(45, 'core_grades_update_grades', 'core_grades_external', 'update_grades', NULL, 'moodle', '', 'moodle_mobile_app'),
	(46, 'core_grading_get_definitions', 'core_grading_external', 'get_definitions', NULL, 'moodle', '', NULL),
	(47, 'core_grading_get_gradingform_instances', 'core_grading_external', 'get_gradingform_instances', NULL, 'moodle', '', NULL),
	(48, 'core_grading_save_definitions', 'core_grading_external', 'save_definitions', NULL, 'moodle', '', NULL),
	(49, 'core_group_add_group_members', 'core_group_external', 'add_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups', NULL),
	(50, 'core_group_assign_grouping', 'core_group_external', 'assign_grouping', 'group/externallib.php', 'moodle', '', NULL),
	(51, 'core_group_create_groupings', 'core_group_external', 'create_groupings', 'group/externallib.php', 'moodle', '', NULL),
	(52, 'core_group_create_groups', 'core_group_external', 'create_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups', NULL),
	(53, 'core_group_delete_group_members', 'core_group_external', 'delete_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups', NULL),
	(54, 'core_group_delete_groupings', 'core_group_external', 'delete_groupings', 'group/externallib.php', 'moodle', '', NULL),
	(55, 'core_group_delete_groups', 'core_group_external', 'delete_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups', NULL),
	(56, 'core_group_get_activity_allowed_groups', 'core_group_external', 'get_activity_allowed_groups', 'group/externallib.php', 'moodle', '', 'moodle_mobile_app'),
	(57, 'core_group_get_activity_groupmode', 'core_group_external', 'get_activity_groupmode', 'group/externallib.php', 'moodle', '', 'moodle_mobile_app'),
	(58, 'core_group_get_course_groupings', 'core_group_external', 'get_course_groupings', 'group/externallib.php', 'moodle', '', NULL),
	(59, 'core_group_get_course_groups', 'core_group_external', 'get_course_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups', NULL),
	(60, 'core_group_get_course_user_groups', 'core_group_external', 'get_course_user_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups', 'moodle_mobile_app'),
	(61, 'core_group_get_group_members', 'core_group_external', 'get_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups', NULL),
	(62, 'core_group_get_groupings', 'core_group_external', 'get_groupings', 'group/externallib.php', 'moodle', '', NULL),
	(63, 'core_group_get_groups', 'core_group_external', 'get_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups', NULL),
	(64, 'core_group_unassign_grouping', 'core_group_external', 'unassign_grouping', 'group/externallib.php', 'moodle', '', NULL),
	(65, 'core_group_update_groupings', 'core_group_external', 'update_groupings', 'group/externallib.php', 'moodle', '', NULL),
	(66, 'core_message_block_contacts', 'core_message_external', 'block_contacts', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
	(67, 'core_message_create_contacts', 'core_message_external', 'create_contacts', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
	(68, 'core_message_delete_contacts', 'core_message_external', 'delete_contacts', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
	(69, 'core_message_delete_message', 'core_message_external', 'delete_message', 'message/externallib.php', 'moodle', 'moodle/site:deleteownmessage', 'moodle_mobile_app'),
	(70, 'core_message_get_blocked_users', 'core_message_external', 'get_blocked_users', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
	(71, 'core_message_get_contacts', 'core_message_external', 'get_contacts', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
	(72, 'core_message_get_messages', 'core_message_external', 'get_messages', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
	(73, 'core_message_mark_message_read', 'core_message_external', 'mark_message_read', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
	(74, 'core_message_search_contacts', 'core_message_external', 'search_contacts', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
	(75, 'core_message_send_instant_messages', 'core_message_external', 'send_instant_messages', 'message/externallib.php', 'moodle', 'moodle/site:sendmessage', 'moodle_mobile_app'),
	(76, 'core_message_unblock_contacts', 'core_message_external', 'unblock_contacts', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
	(77, 'core_notes_create_notes', 'core_notes_external', 'create_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage', 'moodle_mobile_app'),
	(78, 'core_notes_delete_notes', 'core_notes_external', 'delete_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage', 'moodle_mobile_app'),
	(79, 'core_notes_get_course_notes', 'core_notes_external', 'get_course_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:view', 'moodle_mobile_app'),
	(80, 'core_notes_get_notes', 'core_notes_external', 'get_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:view', NULL),
	(81, 'core_notes_update_notes', 'core_notes_external', 'update_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage', NULL),
	(82, 'core_notes_view_notes', 'core_notes_external', 'view_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:view', 'moodle_mobile_app'),
	(83, 'core_output_load_template', 'core\\output\\external', 'load_template', NULL, 'moodle', '', NULL),
	(84, 'core_question_update_flag', 'core_question_external', 'update_flag', NULL, 'moodle', 'moodle/question:flag', 'moodle_mobile_app'),
	(85, 'core_rating_get_item_ratings', 'core_rating_external', 'get_item_ratings', NULL, 'moodle', 'moodle/rating:view', 'moodle_mobile_app'),
	(86, 'core_role_assign_roles', 'core_role_external', 'assign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign', NULL),
	(87, 'core_role_unassign_roles', 'core_role_external', 'unassign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign', NULL),
	(88, 'core_tag_get_tagindex', 'core_tag_external', 'get_tagindex', NULL, 'moodle', '', NULL),
	(89, 'core_tag_get_tags', 'core_tag_external', 'get_tags', NULL, 'moodle', '', NULL),
	(90, 'core_tag_update_tags', 'core_tag_external', 'update_tags', NULL, 'moodle', '', NULL),
	(91, 'core_update_inplace_editable', 'core_external', 'update_inplace_editable', 'lib/external/externallib.php', 'moodle', '', NULL),
	(92, 'core_user_add_user_device', 'core_user_external', 'add_user_device', 'user/externallib.php', 'moodle', '', 'moodle_mobile_app'),
	(93, 'core_user_add_user_private_files', 'core_user_external', 'add_user_private_files', 'user/externallib.php', 'moodle', 'moodle/user:manageownfiles', 'moodle_mobile_app'),
	(94, 'core_user_create_users', 'core_user_external', 'create_users', 'user/externallib.php', 'moodle', 'moodle/user:create', NULL),
	(95, 'core_user_delete_users', 'core_user_external', 'delete_users', 'user/externallib.php', 'moodle', 'moodle/user:delete', NULL),
	(96, 'core_user_get_course_user_profiles', 'core_user_external', 'get_course_user_profiles', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups', 'moodle_mobile_app'),
	(97, 'core_user_get_users', 'core_user_external', 'get_users', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update', NULL),
	(98, 'core_user_get_users_by_field', 'core_user_external', 'get_users_by_field', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update', 'moodle_mobile_app'),
	(99, 'core_user_remove_user_device', 'core_user_external', 'remove_user_device', 'user/externallib.php', 'moodle', '', 'moodle_mobile_app'),
	(100, 'core_user_update_users', 'core_user_external', 'update_users', 'user/externallib.php', 'moodle', 'moodle/user:update', NULL),
	(101, 'core_user_view_user_list', 'core_user_external', 'view_user_list', 'user/externallib.php', 'moodle', 'moodle/course:viewparticipants', 'moodle_mobile_app'),
	(102, 'core_user_view_user_profile', 'core_user_external', 'view_user_profile', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails', 'moodle_mobile_app'),
	(103, 'core_competency_create_competency_framework', 'core_competency\\external', 'create_competency_framework', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
	(104, 'core_competency_read_competency_framework', 'core_competency\\external', 'read_competency_framework', NULL, 'moodle', 'moodle/competency:competencyview', NULL),
	(105, 'core_competency_duplicate_competency_framework', 'core_competency\\external', 'duplicate_competency_framework', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
	(106, 'core_competency_delete_competency_framework', 'core_competency\\external', 'delete_competency_framework', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
	(107, 'core_competency_update_competency_framework', 'core_competency\\external', 'update_competency_framework', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
	(108, 'core_competency_list_competency_frameworks', 'core_competency\\external', 'list_competency_frameworks', NULL, 'moodle', 'moodle/competency:competencyview', NULL),
	(109, 'core_competency_count_competency_frameworks', 'core_competency\\external', 'count_competency_frameworks', NULL, 'moodle', 'moodle/competency:competencyview', NULL),
	(110, 'core_competency_competency_framework_viewed', 'core_competency\\external', 'competency_framework_viewed', NULL, 'moodle', 'moodle/competency:competencyview', NULL),
	(111, 'core_competency_create_competency', 'core_competency\\external', 'create_competency', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
	(112, 'core_competency_read_competency', 'core_competency\\external', 'read_competency', NULL, 'moodle', 'moodle/competency:competencyview', NULL),
	(113, 'core_competency_competency_viewed', 'core_competency\\external', 'competency_viewed', NULL, 'moodle', 'moodle/competency:competencyview', 'moodle_mobile_app'),
	(114, 'core_competency_delete_competency', 'core_competency\\external', 'delete_competency', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
	(115, 'core_competency_update_competency', 'core_competency\\external', 'update_competency', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
	(116, 'core_competency_list_competencies', 'core_competency\\external', 'list_competencies', NULL, 'moodle', 'moodle/competency:competencyview', NULL),
	(117, 'core_competency_list_competencies_in_template', 'core_competency\\external', 'list_competencies_in_template', NULL, 'moodle', 'moodle/competency:competencyview', NULL),
	(118, 'core_competency_count_competencies', 'core_competency\\external', 'count_competencies', NULL, 'moodle', 'moodle/competency:competencyview', NULL),
	(119, 'core_competency_count_competencies_in_template', 'core_competency\\external', 'count_competencies_in_template', NULL, 'moodle', 'moodle/competency:competencyview', NULL),
	(120, 'core_competency_search_competencies', 'core_competency\\external', 'search_competencies', NULL, 'moodle', 'moodle/competency:competencyview', NULL),
	(121, 'core_competency_set_parent_competency', 'core_competency\\external', 'set_parent_competency', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
	(122, 'core_competency_move_up_competency', 'core_competency\\external', 'move_up_competency', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
	(123, 'core_competency_move_down_competency', 'core_competency\\external', 'move_down_competency', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
	(124, 'core_competency_list_course_competencies', 'core_competency\\external', 'list_course_competencies', NULL, 'moodle', 'moodle/competency:coursecompetencyview', 'moodle_mobile_app'),
	(125, 'core_competency_count_competencies_in_course', 'core_competency\\external', 'count_competencies_in_course', NULL, 'moodle', 'moodle/competency:coursecompetencyview', NULL),
	(126, 'core_competency_count_courses_using_competency', 'core_competency\\external', 'count_courses_using_competency', NULL, 'moodle', 'moodle/competency:coursecompetencyview', NULL),
	(127, 'core_competency_add_competency_to_course', 'core_competency\\external', 'add_competency_to_course', NULL, 'moodle', 'moodle/competency:coursecompetencymanage', NULL),
	(128, 'core_competency_add_competency_to_template', 'core_competency\\external', 'add_competency_to_template', NULL, 'moodle', 'moodle/competency:templatemanage', NULL),
	(129, 'core_competency_remove_competency_from_course', 'core_competency\\external', 'remove_competency_from_course', NULL, 'moodle', 'moodle/competency:coursecompetencymanage', NULL),
	(130, 'core_competency_set_course_competency_ruleoutcome', 'core_competency\\external', 'set_course_competency_ruleoutcome', NULL, 'moodle', 'moodle/competency:coursecompetencymanage', NULL),
	(131, 'core_competency_remove_competency_from_template', 'core_competency\\external', 'remove_competency_from_template', NULL, 'moodle', 'moodle/competency:templatemanage', NULL),
	(132, 'core_competency_reorder_course_competency', 'core_competency\\external', 'reorder_course_competency', NULL, 'moodle', 'moodle/competency:coursecompetencymanage', NULL),
	(133, 'core_competency_reorder_template_competency', 'core_competency\\external', 'reorder_template_competency', NULL, 'moodle', 'moodle/competency:templatemanage', NULL),
	(134, 'core_competency_create_template', 'core_competency\\external', 'create_template', NULL, 'moodle', 'moodle/competency:templatemanage', NULL),
	(135, 'core_competency_duplicate_template', 'core_competency\\external', 'duplicate_template', NULL, 'moodle', 'moodle/competency:templatemanage', NULL),
	(136, 'core_competency_read_template', 'core_competency\\external', 'read_template', NULL, 'moodle', 'moodle/competency:templateview', NULL),
	(137, 'core_competency_delete_template', 'core_competency\\external', 'delete_template', NULL, 'moodle', 'moodle/competency:templatemanage', NULL),
	(138, 'core_competency_update_template', 'core_competency\\external', 'update_template', NULL, 'moodle', 'moodle/competency:templatemanage', NULL),
	(139, 'core_competency_list_templates', 'core_competency\\external', 'list_templates', NULL, 'moodle', 'moodle/competency:templateview', NULL),
	(140, 'core_competency_list_templates_using_competency', 'core_competency\\external', 'list_templates_using_competency', NULL, 'moodle', 'moodle/competency:templateview', NULL),
	(141, 'core_competency_count_templates', 'core_competency\\external', 'count_templates', NULL, 'moodle', 'moodle/competency:templateview', NULL),
	(142, 'core_competency_count_templates_using_competency', 'core_competency\\external', 'count_templates_using_competency', NULL, 'moodle', 'moodle/competency:templateview', NULL),
	(143, 'core_competency_create_plan', 'core_competency\\external', 'create_plan', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
	(144, 'core_competency_update_plan', 'core_competency\\external', 'update_plan', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
	(145, 'core_competency_complete_plan', 'core_competency\\external', 'complete_plan', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
	(146, 'core_competency_reopen_plan', 'core_competency\\external', 'reopen_plan', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
	(147, 'core_competency_read_plan', 'core_competency\\external', 'read_plan', NULL, 'moodle', 'moodle/competency:planviewown', NULL),
	(148, 'core_competency_delete_plan', 'core_competency\\external', 'delete_plan', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
	(149, 'core_competency_list_user_plans', 'core_competency\\external', 'list_user_plans', NULL, 'moodle', 'moodle/competency:planviewown', NULL),
	(150, 'core_competency_list_plan_competencies', 'core_competency\\external', 'list_plan_competencies', NULL, 'moodle', 'moodle/competency:planviewown', NULL),
	(151, 'core_competency_add_competency_to_plan', 'core_competency\\external', 'add_competency_to_plan', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
	(152, 'core_competency_remove_competency_from_plan', 'core_competency\\external', 'remove_competency_from_plan', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
	(153, 'core_competency_reorder_plan_competency', 'core_competency\\external', 'reorder_plan_competency', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
	(154, 'core_competency_plan_request_review', 'core_competency\\external', 'plan_request_review', NULL, 'moodle', 'moodle/competency:planmanagedraft', NULL),
	(155, 'core_competency_plan_start_review', 'core_competency\\external', 'plan_start_review', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
	(156, 'core_competency_plan_stop_review', 'core_competency\\external', 'plan_stop_review', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
	(157, 'core_competency_plan_cancel_review_request', 'core_competency\\external', 'plan_cancel_review_request', NULL, 'moodle', 'moodle/competency:planmanagedraft', NULL),
	(158, 'core_competency_approve_plan', 'core_competency\\external', 'approve_plan', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
	(159, 'core_competency_unapprove_plan', 'core_competency\\external', 'unapprove_plan', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
	(160, 'core_competency_template_has_related_data', 'core_competency\\external', 'template_has_related_data', NULL, 'moodle', 'moodle/competency:templateview', NULL),
	(161, 'core_competency_get_scale_values', 'core_competency\\external', 'get_scale_values', NULL, 'moodle', 'moodle/competency:competencymanage', 'moodle_mobile_app'),
	(162, 'core_competency_add_related_competency', 'core_competency\\external', 'add_related_competency', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
	(163, 'core_competency_remove_related_competency', 'core_competency\\external', 'remove_related_competency', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
	(164, 'core_competency_read_user_evidence', 'core_competency\\external', 'read_user_evidence', NULL, 'moodle', 'moodle/competency:userevidenceview', NULL),
	(165, 'core_competency_delete_user_evidence', 'core_competency\\external', 'delete_user_evidence', NULL, 'moodle', 'moodle/competency:userevidencemanageown', NULL),
	(166, 'core_competency_create_user_evidence_competency', 'core_competency\\external', 'create_user_evidence_competency', NULL, 'moodle', 'moodle/competency:userevidencemanageown, moodle/competency:competencyview', NULL),
	(167, 'core_competency_delete_user_evidence_competency', 'core_competency\\external', 'delete_user_evidence_competency', NULL, 'moodle', 'moodle/competency:userevidencemanageown', NULL),
	(168, 'core_competency_user_competency_cancel_review_request', 'core_competency\\external', 'user_competency_cancel_review_request', NULL, 'moodle', 'moodle/competency:userevidencemanageown', NULL),
	(169, 'core_competency_user_competency_request_review', 'core_competency\\external', 'user_competency_request_review', NULL, 'moodle', 'moodle/competency:userevidencemanageown', NULL),
	(170, 'core_competency_user_competency_start_review', 'core_competency\\external', 'user_competency_start_review', NULL, 'moodle', 'moodle/competency:competencygrade', NULL),
	(171, 'core_competency_user_competency_stop_review', 'core_competency\\external', 'user_competency_stop_review', NULL, 'moodle', 'moodle/competency:competencygrade', NULL),
	(172, 'core_competency_user_competency_viewed', 'core_competency\\external', 'user_competency_viewed', NULL, 'moodle', 'moodle/competency:usercompetencyview', 'moodle_mobile_app'),
	(173, 'core_competency_user_competency_viewed_in_plan', 'core_competency\\external', 'user_competency_viewed_in_plan', NULL, 'moodle', 'moodle/competency:usercompetencyview', 'moodle_mobile_app'),
	(174, 'core_competency_user_competency_viewed_in_course', 'core_competency\\external', 'user_competency_viewed_in_course', NULL, 'moodle', 'moodle/competency:usercompetencyview', 'moodle_mobile_app'),
	(175, 'core_competency_user_competency_plan_viewed', 'core_competency\\external', 'user_competency_plan_viewed', NULL, 'moodle', 'moodle/competency:usercompetencyview', 'moodle_mobile_app'),
	(176, 'core_competency_grade_competency', 'core_competency\\external', 'grade_competency', NULL, 'moodle', 'moodle/competency:competencygrade', NULL),
	(177, 'core_competency_grade_competency_in_plan', 'core_competency\\external', 'grade_competency_in_plan', NULL, 'moodle', 'moodle/competency:competencygrade', NULL),
	(178, 'core_competency_grade_competency_in_course', 'core_competency\\external', 'grade_competency_in_course', NULL, 'moodle', 'moodle/competency:competencygrade', 'moodle_mobile_app'),
	(179, 'core_competency_unlink_plan_from_template', 'core_competency\\external', 'unlink_plan_from_template', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
	(180, 'core_competency_template_viewed', 'core_competency\\external', 'template_viewed', NULL, 'moodle', 'moodle/competency:templateview', NULL),
	(181, 'core_competency_request_review_of_user_evidence_linked_competencies', 'core_competency\\external', 'request_review_of_user_evidence_linked_competencies', NULL, 'moodle', 'moodle/competency:userevidencemanageown', NULL),
	(182, 'core_competency_update_course_competency_settings', 'core_competency\\external', 'update_course_competency_settings', NULL, 'moodle', 'moodle/competency:coursecompetencyconfigure', NULL),
	(183, 'core_competency_delete_evidence', 'core_competency\\external', 'delete_evidence', NULL, 'moodle', 'moodle/competency:evidencedelete', 'moodle_mobile_app'),
	(184, 'core_webservice_get_site_info', 'core_webservice_external', 'get_site_info', 'webservice/externallib.php', 'moodle', '', 'moodle_mobile_app'),
	(185, 'mod_assign_copy_previous_attempt', 'mod_assign_external', 'copy_previous_attempt', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:view, mod/assign:submit', NULL),
	(186, 'mod_assign_get_grades', 'mod_assign_external', 'get_grades', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
	(187, 'mod_assign_get_assignments', 'mod_assign_external', 'get_assignments', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
	(188, 'mod_assign_get_submissions', 'mod_assign_external', 'get_submissions', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
	(189, 'mod_assign_get_user_flags', 'mod_assign_external', 'get_user_flags', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
	(190, 'mod_assign_set_user_flags', 'mod_assign_external', 'set_user_flags', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:grade', 'moodle_mobile_app'),
	(191, 'mod_assign_get_user_mappings', 'mod_assign_external', 'get_user_mappings', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
	(192, 'mod_assign_revert_submissions_to_draft', 'mod_assign_external', 'revert_submissions_to_draft', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
	(193, 'mod_assign_lock_submissions', 'mod_assign_external', 'lock_submissions', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
	(194, 'mod_assign_unlock_submissions', 'mod_assign_external', 'unlock_submissions', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
	(195, 'mod_assign_save_submission', 'mod_assign_external', 'save_submission', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
	(196, 'mod_assign_submit_for_grading', 'mod_assign_external', 'submit_for_grading', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
	(197, 'mod_assign_save_grade', 'mod_assign_external', 'save_grade', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
	(198, 'mod_assign_save_grades', 'mod_assign_external', 'save_grades', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
	(199, 'mod_assign_save_user_extensions', 'mod_assign_external', 'save_user_extensions', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
	(200, 'mod_assign_reveal_identities', 'mod_assign_external', 'reveal_identities', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
	(201, 'mod_assign_view_grading_table', 'mod_assign_external', 'view_grading_table', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:view, mod/assign:viewgrades', 'moodle_mobile_app'),
	(202, 'mod_assign_view_submission_status', 'mod_assign_external', 'view_submission_status', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:view', 'moodle_mobile_app'),
	(203, 'mod_assign_get_submission_status', 'mod_assign_external', 'get_submission_status', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:view', 'moodle_mobile_app'),
	(204, 'mod_assign_list_participants', 'mod_assign_external', 'list_participants', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:view, mod/assign:viewgrades', NULL),
	(205, 'mod_assign_submit_grading_form', 'mod_assign_external', 'submit_grading_form', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:grade', NULL),
	(206, 'mod_assign_get_participant', 'mod_assign_external', 'get_participant', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:view, mod/assign:viewgrades', NULL),
	(207, 'mod_book_view_book', 'mod_book_external', 'view_book', NULL, 'mod_book', 'mod/book:read', 'moodle_mobile_app'),
	(208, 'mod_book_get_books_by_courses', 'mod_book_external', 'get_books_by_courses', NULL, 'mod_book', '', 'moodle_mobile_app'),
	(209, 'mod_chat_login_user', 'mod_chat_external', 'login_user', NULL, 'mod_chat', 'mod/chat:chat', 'moodle_mobile_app'),
	(210, 'mod_chat_get_chat_users', 'mod_chat_external', 'get_chat_users', NULL, 'mod_chat', 'mod/chat:chat', 'moodle_mobile_app'),
	(211, 'mod_chat_send_chat_message', 'mod_chat_external', 'send_chat_message', NULL, 'mod_chat', 'mod/chat:chat', 'moodle_mobile_app'),
	(212, 'mod_chat_get_chat_latest_messages', 'mod_chat_external', 'get_chat_latest_messages', NULL, 'mod_chat', 'mod/chat:chat', 'moodle_mobile_app'),
	(213, 'mod_chat_view_chat', 'mod_chat_external', 'view_chat', NULL, 'mod_chat', 'mod/chat:chat', 'moodle_mobile_app'),
	(214, 'mod_chat_get_chats_by_courses', 'mod_chat_external', 'get_chats_by_courses', NULL, 'mod_chat', '', 'moodle_mobile_app'),
	(215, 'mod_choice_get_choice_results', 'mod_choice_external', 'get_choice_results', NULL, 'mod_choice', '', 'moodle_mobile_app'),
	(216, 'mod_choice_get_choice_options', 'mod_choice_external', 'get_choice_options', NULL, 'mod_choice', 'mod/choice:choose', 'moodle_mobile_app'),
	(217, 'mod_choice_submit_choice_response', 'mod_choice_external', 'submit_choice_response', NULL, 'mod_choice', 'mod/choice:choose', 'moodle_mobile_app'),
	(218, 'mod_choice_view_choice', 'mod_choice_external', 'view_choice', NULL, 'mod_choice', '', 'moodle_mobile_app'),
	(219, 'mod_choice_get_choices_by_courses', 'mod_choice_external', 'get_choices_by_courses', NULL, 'mod_choice', '', 'moodle_mobile_app'),
	(220, 'mod_choice_delete_choice_responses', 'mod_choice_external', 'delete_choice_responses', NULL, 'mod_choice', 'mod/choice:choose', 'moodle_mobile_app'),
	(221, 'mod_data_get_databases_by_courses', 'mod_data_external', 'get_databases_by_courses', NULL, 'mod_data', 'mod/data:viewentry', 'moodle_mobile_app'),
	(222, 'mod_folder_view_folder', 'mod_folder_external', 'view_folder', NULL, 'mod_folder', 'mod/folder:view', 'moodle_mobile_app'),
	(223, 'mod_forum_get_forums_by_courses', 'mod_forum_external', 'get_forums_by_courses', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion', 'moodle_mobile_app'),
	(224, 'mod_forum_get_forum_discussion_posts', 'mod_forum_external', 'get_forum_discussion_posts', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting', 'moodle_mobile_app'),
	(225, 'mod_forum_get_forum_discussions_paginated', 'mod_forum_external', 'get_forum_discussions_paginated', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting', 'moodle_mobile_app'),
	(226, 'mod_forum_view_forum', 'mod_forum_external', 'view_forum', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion', 'moodle_mobile_app'),
	(227, 'mod_forum_view_forum_discussion', 'mod_forum_external', 'view_forum_discussion', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion', 'moodle_mobile_app'),
	(228, 'mod_forum_add_discussion_post', 'mod_forum_external', 'add_discussion_post', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:replypost', 'moodle_mobile_app'),
	(229, 'mod_forum_add_discussion', 'mod_forum_external', 'add_discussion', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:startdiscussion', 'moodle_mobile_app'),
	(230, 'mod_forum_can_add_discussion', 'mod_forum_external', 'can_add_discussion', 'mod/forum/externallib.php', 'mod_forum', '', 'moodle_mobile_app'),
	(231, 'mod_glossary_get_glossaries_by_courses', 'mod_glossary_external', 'get_glossaries_by_courses', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
	(232, 'mod_glossary_view_glossary', 'mod_glossary_external', 'view_glossary', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
	(233, 'mod_glossary_view_entry', 'mod_glossary_external', 'view_entry', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
	(234, 'mod_glossary_get_entries_by_letter', 'mod_glossary_external', 'get_entries_by_letter', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
	(235, 'mod_glossary_get_entries_by_date', 'mod_glossary_external', 'get_entries_by_date', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
	(236, 'mod_glossary_get_categories', 'mod_glossary_external', 'get_categories', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
	(237, 'mod_glossary_get_entries_by_category', 'mod_glossary_external', 'get_entries_by_category', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
	(238, 'mod_glossary_get_authors', 'mod_glossary_external', 'get_authors', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
	(239, 'mod_glossary_get_entries_by_author', 'mod_glossary_external', 'get_entries_by_author', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
	(240, 'mod_glossary_get_entries_by_author_id', 'mod_glossary_external', 'get_entries_by_author_id', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
	(241, 'mod_glossary_get_entries_by_search', 'mod_glossary_external', 'get_entries_by_search', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
	(242, 'mod_glossary_get_entries_by_term', 'mod_glossary_external', 'get_entries_by_term', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
	(243, 'mod_glossary_get_entries_to_approve', 'mod_glossary_external', 'get_entries_to_approve', NULL, 'mod_glossary', 'mod/glossary:approve', 'moodle_mobile_app'),
	(244, 'mod_glossary_get_entry_by_id', 'mod_glossary_external', 'get_entry_by_id', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
	(245, 'mod_imscp_view_imscp', 'mod_imscp_external', 'view_imscp', NULL, 'mod_imscp', 'mod/imscp:view', 'moodle_mobile_app'),
	(246, 'mod_imscp_get_imscps_by_courses', 'mod_imscp_external', 'get_imscps_by_courses', NULL, 'mod_imscp', 'mod/imscp:view', 'moodle_mobile_app'),
	(247, 'mod_lti_get_tool_launch_data', 'mod_lti_external', 'get_tool_launch_data', NULL, 'mod_lti', 'mod/lti:view', 'moodle_mobile_app'),
	(248, 'mod_lti_get_ltis_by_courses', 'mod_lti_external', 'get_ltis_by_courses', NULL, 'mod_lti', 'mod/lti:view', 'moodle_mobile_app'),
	(249, 'mod_lti_view_lti', 'mod_lti_external', 'view_lti', NULL, 'mod_lti', 'mod/lti:view', 'moodle_mobile_app'),
	(250, 'mod_lti_get_tool_proxies', 'mod_lti_external', 'get_tool_proxies', NULL, 'mod_lti', 'moodle/site:config', NULL),
	(251, 'mod_lti_create_tool_proxy', 'mod_lti_external', 'create_tool_proxy', NULL, 'mod_lti', 'moodle/site:config', NULL),
	(252, 'mod_lti_delete_tool_proxy', 'mod_lti_external', 'delete_tool_proxy', NULL, 'mod_lti', 'moodle/site:config', NULL),
	(253, 'mod_lti_get_tool_proxy_registration_request', 'mod_lti_external', 'get_tool_proxy_registration_request', NULL, 'mod_lti', 'moodle/site:config', NULL),
	(254, 'mod_lti_get_tool_types', 'mod_lti_external', 'get_tool_types', NULL, 'mod_lti', 'moodle/site:config', NULL),
	(255, 'mod_lti_create_tool_type', 'mod_lti_external', 'create_tool_type', NULL, 'mod_lti', 'moodle/site:config', NULL),
	(256, 'mod_lti_update_tool_type', 'mod_lti_external', 'update_tool_type', NULL, 'mod_lti', 'moodle/site:config', NULL),
	(257, 'mod_lti_delete_tool_type', 'mod_lti_external', 'delete_tool_type', NULL, 'mod_lti', 'moodle/site:config', NULL),
	(258, 'mod_lti_is_cartridge', 'mod_lti_external', 'is_cartridge', NULL, 'mod_lti', 'moodle/site:config', NULL),
	(259, 'mod_page_view_page', 'mod_page_external', 'view_page', NULL, 'mod_page', 'mod/page:view', 'moodle_mobile_app'),
	(260, 'mod_quiz_get_quizzes_by_courses', 'mod_quiz_external', 'get_quizzes_by_courses', NULL, 'mod_quiz', 'mod/quiz:view', 'moodle_mobile_app'),
	(261, 'mod_quiz_view_quiz', 'mod_quiz_external', 'view_quiz', NULL, 'mod_quiz', 'mod/quiz:view', 'moodle_mobile_app'),
	(262, 'mod_quiz_get_user_attempts', 'mod_quiz_external', 'get_user_attempts', NULL, 'mod_quiz', 'mod/quiz:view', 'moodle_mobile_app'),
	(263, 'mod_quiz_get_user_best_grade', 'mod_quiz_external', 'get_user_best_grade', NULL, 'mod_quiz', 'mod/quiz:view', 'moodle_mobile_app'),
	(264, 'mod_quiz_get_combined_review_options', 'mod_quiz_external', 'get_combined_review_options', NULL, 'mod_quiz', 'mod/quiz:view', 'moodle_mobile_app'),
	(265, 'mod_quiz_start_attempt', 'mod_quiz_external', 'start_attempt', NULL, 'mod_quiz', 'mod/quiz:attempt', 'moodle_mobile_app'),
	(266, 'mod_quiz_get_attempt_data', 'mod_quiz_external', 'get_attempt_data', NULL, 'mod_quiz', 'mod/quiz:attempt', 'moodle_mobile_app'),
	(267, 'mod_quiz_get_attempt_summary', 'mod_quiz_external', 'get_attempt_summary', NULL, 'mod_quiz', 'mod/quiz:attempt', 'moodle_mobile_app'),
	(268, 'mod_quiz_save_attempt', 'mod_quiz_external', 'save_attempt', NULL, 'mod_quiz', 'mod/quiz:attempt', 'moodle_mobile_app'),
	(269, 'mod_quiz_process_attempt', 'mod_quiz_external', 'process_attempt', NULL, 'mod_quiz', 'mod/quiz:attempt', 'moodle_mobile_app'),
	(270, 'mod_quiz_get_attempt_review', 'mod_quiz_external', 'get_attempt_review', NULL, 'mod_quiz', 'mod/quiz:reviewmyattempts', 'moodle_mobile_app'),
	(271, 'mod_quiz_view_attempt', 'mod_quiz_external', 'view_attempt', NULL, 'mod_quiz', 'mod/quiz:attempt', 'moodle_mobile_app'),
	(272, 'mod_quiz_view_attempt_summary', 'mod_quiz_external', 'view_attempt_summary', NULL, 'mod_quiz', 'mod/quiz:attempt', 'moodle_mobile_app'),
	(273, 'mod_quiz_view_attempt_review', 'mod_quiz_external', 'view_attempt_review', NULL, 'mod_quiz', 'mod/quiz:reviewmyattempts', 'moodle_mobile_app'),
	(274, 'mod_quiz_get_quiz_feedback_for_grade', 'mod_quiz_external', 'get_quiz_feedback_for_grade', NULL, 'mod_quiz', 'mod/quiz:view', 'moodle_mobile_app'),
	(275, 'mod_quiz_get_quiz_access_information', 'mod_quiz_external', 'get_quiz_access_information', NULL, 'mod_quiz', 'mod/quiz:view', 'moodle_mobile_app'),
	(276, 'mod_quiz_get_attempt_access_information', 'mod_quiz_external', 'get_attempt_access_information', NULL, 'mod_quiz', 'mod/quiz:view', 'moodle_mobile_app'),
	(277, 'mod_quiz_get_quiz_required_qtypes', 'mod_quiz_external', 'get_quiz_required_qtypes', NULL, 'mod_quiz', 'mod/quiz:view', 'moodle_mobile_app'),
	(278, 'mod_resource_view_resource', 'mod_resource_external', 'view_resource', NULL, 'mod_resource', 'mod/resource:view', 'moodle_mobile_app'),
	(279, 'mod_scorm_view_scorm', 'mod_scorm_external', 'view_scorm', NULL, 'mod_scorm', '', 'moodle_mobile_app'),
	(280, 'mod_scorm_get_scorm_attempt_count', 'mod_scorm_external', 'get_scorm_attempt_count', NULL, 'mod_scorm', '', 'moodle_mobile_app'),
	(281, 'mod_scorm_get_scorm_scoes', 'mod_scorm_external', 'get_scorm_scoes', NULL, 'mod_scorm', '', 'moodle_mobile_app'),
	(282, 'mod_scorm_get_scorm_user_data', 'mod_scorm_external', 'get_scorm_user_data', NULL, 'mod_scorm', '', 'moodle_mobile_app'),
	(283, 'mod_scorm_insert_scorm_tracks', 'mod_scorm_external', 'insert_scorm_tracks', NULL, 'mod_scorm', 'mod/scorm:savetrack', 'moodle_mobile_app'),
	(284, 'mod_scorm_get_scorm_sco_tracks', 'mod_scorm_external', 'get_scorm_sco_tracks', NULL, 'mod_scorm', '', 'moodle_mobile_app'),
	(285, 'mod_scorm_get_scorms_by_courses', 'mod_scorm_external', 'get_scorms_by_courses', NULL, 'mod_scorm', '', 'moodle_mobile_app'),
	(286, 'mod_scorm_launch_sco', 'mod_scorm_external', 'launch_sco', NULL, 'mod_scorm', '', 'moodle_mobile_app'),
	(287, 'mod_survey_get_surveys_by_courses', 'mod_survey_external', 'get_surveys_by_courses', NULL, 'mod_survey', '', 'moodle_mobile_app'),
	(288, 'mod_survey_view_survey', 'mod_survey_external', 'view_survey', NULL, 'mod_survey', 'mod/survey:participate', 'moodle_mobile_app'),
	(289, 'mod_survey_get_questions', 'mod_survey_external', 'get_questions', NULL, 'mod_survey', 'mod/survey:participate', 'moodle_mobile_app'),
	(290, 'mod_survey_submit_answers', 'mod_survey_external', 'submit_answers', NULL, 'mod_survey', 'mod/survey:participate', 'moodle_mobile_app'),
	(291, 'mod_url_view_url', 'mod_url_external', 'view_url', NULL, 'mod_url', 'mod/url:view', 'moodle_mobile_app'),
	(292, 'mod_wiki_get_wikis_by_courses', 'mod_wiki_external', 'get_wikis_by_courses', NULL, 'mod_wiki', 'mod/wiki:viewpage', 'moodle_mobile_app'),
	(293, 'mod_wiki_view_wiki', 'mod_wiki_external', 'view_wiki', NULL, 'mod_wiki', 'mod/wiki:viewpage', 'moodle_mobile_app'),
	(294, 'mod_wiki_view_page', 'mod_wiki_external', 'view_page', NULL, 'mod_wiki', 'mod/wiki:viewpage', 'moodle_mobile_app'),
	(295, 'mod_wiki_get_subwikis', 'mod_wiki_external', 'get_subwikis', NULL, 'mod_wiki', 'mod/wiki:viewpage', 'moodle_mobile_app'),
	(296, 'mod_wiki_get_subwiki_pages', 'mod_wiki_external', 'get_subwiki_pages', NULL, 'mod_wiki', 'mod/wiki:viewpage', 'moodle_mobile_app'),
	(297, 'mod_wiki_get_subwiki_files', 'mod_wiki_external', 'get_subwiki_files', NULL, 'mod_wiki', 'mod/wiki:viewpage', 'moodle_mobile_app'),
	(298, 'mod_wiki_get_page_contents', 'mod_wiki_external', 'get_page_contents', NULL, 'mod_wiki', 'mod/wiki:viewpage', 'moodle_mobile_app'),
	(299, 'mod_wiki_get_page_for_editing', 'mod_wiki_external', 'get_page_for_editing', NULL, 'mod_wiki', 'mod/wiki:editpage', 'moodle_mobile_app'),
	(300, 'mod_wiki_new_page', 'mod_wiki_external', 'new_page', NULL, 'mod_wiki', 'mod/wiki:editpage', 'moodle_mobile_app'),
	(301, 'mod_wiki_edit_page', 'mod_wiki_external', 'edit_page', NULL, 'mod_wiki', 'mod/wiki:editpage', 'moodle_mobile_app'),
	(302, 'enrol_guest_get_instance_info', 'enrol_guest_external', 'get_instance_info', NULL, 'enrol_guest', '', 'moodle_mobile_app'),
	(303, 'enrol_manual_enrol_users', 'enrol_manual_external', 'enrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:enrol', NULL),
	(304, 'enrol_manual_unenrol_users', 'enrol_manual_external', 'unenrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:unenrol', NULL),
	(305, 'enrol_self_get_instance_info', 'enrol_self_external', 'get_instance_info', 'enrol/self/externallib.php', 'enrol_self', '', 'moodle_mobile_app'),
	(306, 'enrol_self_enrol_user', 'enrol_self_external', 'enrol_user', 'enrol/self/externallib.php', 'enrol_self', '', 'moodle_mobile_app'),
	(307, 'message_airnotifier_is_system_configured', 'message_airnotifier_external', 'is_system_configured', 'message/output/airnotifier/externallib.php', 'message_airnotifier', '', 'moodle_mobile_app'),
	(308, 'message_airnotifier_are_notification_preferences_configured', 'message_airnotifier_external', 'are_notification_preferences_configured', 'message/output/airnotifier/externallib.php', 'message_airnotifier', '', 'moodle_mobile_app'),
	(309, 'report_competency_data_for_report', 'report_competency\\external', 'data_for_report', NULL, 'report_competency', 'moodle/competency:coursecompetencyview', NULL),
	(310, 'gradereport_user_get_grades_table', 'gradereport_user_external', 'get_grades_table', 'grade/report/user/externallib.php', 'gradereport_user', 'gradereport/user:view', 'moodle_mobile_app'),
	(311, 'gradereport_user_view_grade_report', 'gradereport_user_external', 'view_grade_report', 'grade/report/user/externallib.php', 'gradereport_user', 'gradereport/user:view', 'moodle_mobile_app'),
	(312, 'tool_lp_data_for_competency_frameworks_manage_page', 'tool_lp\\external', 'data_for_competency_frameworks_manage_page', NULL, 'tool_lp', 'moodle/competency:competencyview', NULL),
	(313, 'tool_lp_data_for_competency_summary', 'tool_lp\\external', 'data_for_competency_summary', NULL, 'tool_lp', 'moodle/competency:competencyview', NULL),
	(314, 'tool_lp_data_for_competencies_manage_page', 'tool_lp\\external', 'data_for_competencies_manage_page', NULL, 'tool_lp', 'moodle/competency:competencyview', NULL),
	(315, 'tool_lp_list_courses_using_competency', 'tool_lp\\external', 'list_courses_using_competency', NULL, 'tool_lp', 'moodle/competency:coursecompetencyview', NULL),
	(316, 'tool_lp_data_for_course_competencies_page', 'tool_lp\\external', 'data_for_course_competencies_page', NULL, 'tool_lp', 'moodle/competency:coursecompetencyview', 'moodle_mobile_app'),
	(317, 'tool_lp_data_for_template_competencies_page', 'tool_lp\\external', 'data_for_template_competencies_page', NULL, 'tool_lp', 'moodle/competency:templateview', NULL),
	(318, 'tool_lp_data_for_templates_manage_page', 'tool_lp\\external', 'data_for_templates_manage_page', NULL, 'tool_lp', 'moodle/competency:templateview', NULL),
	(319, 'tool_lp_data_for_plans_page', 'tool_lp\\external', 'data_for_plans_page', NULL, 'tool_lp', 'moodle/competency:planviewown', 'moodle_mobile_app'),
	(320, 'tool_lp_data_for_plan_page', 'tool_lp\\external', 'data_for_plan_page', NULL, 'tool_lp', 'moodle/competency:planview', 'moodle_mobile_app'),
	(321, 'tool_lp_data_for_related_competencies_section', 'tool_lp\\external', 'data_for_related_competencies_section', NULL, 'tool_lp', 'moodle/competency:competencyview', NULL),
	(322, 'tool_lp_search_users', 'tool_lp\\external', 'search_users', NULL, 'tool_lp', '', NULL),
	(323, 'tool_lp_search_cohorts', 'tool_lp\\external', 'search_cohorts', NULL, 'tool_lp', 'moodle/cohort:view', NULL),
	(324, 'tool_lp_data_for_user_evidence_list_page', 'tool_lp\\external', 'data_for_user_evidence_list_page', NULL, 'tool_lp', 'moodle/competency:userevidenceview', 'moodle_mobile_app'),
	(325, 'tool_lp_data_for_user_evidence_page', 'tool_lp\\external', 'data_for_user_evidence_page', NULL, 'tool_lp', 'moodle/competency:userevidenceview', 'moodle_mobile_app'),
	(326, 'tool_lp_data_for_user_competency_summary', 'tool_lp\\external', 'data_for_user_competency_summary', NULL, 'tool_lp', 'moodle/competency:planview', 'moodle_mobile_app'),
	(327, 'tool_lp_data_for_user_competency_summary_in_plan', 'tool_lp\\external', 'data_for_user_competency_summary_in_plan', NULL, 'tool_lp', 'moodle/competency:planview', 'moodle_mobile_app'),
	(328, 'tool_lp_data_for_user_competency_summary_in_course', 'tool_lp\\external', 'data_for_user_competency_summary_in_course', NULL, 'tool_lp', 'moodle/competency:coursecompetencyview', 'moodle_mobile_app'),
	(329, 'tool_mobile_get_plugins_supporting_mobile', 'tool_mobile\\external', 'get_plugins_supporting_mobile', NULL, 'tool_mobile', '', 'moodle_mobile_app'),
	(330, 'tool_templatelibrary_list_templates', 'tool_templatelibrary\\external', 'list_templates', NULL, 'tool_templatelibrary', '', NULL),
	(331, 'tool_templatelibrary_load_canonical_template', 'tool_templatelibrary\\external', 'load_canonical_template', NULL, 'tool_templatelibrary', '', NULL);
/*!40000 ALTER TABLE `mdl_external_functions` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_external_services
CREATE TABLE IF NOT EXISTS `mdl_external_services` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  `requiredcapability` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `restrictedusers` tinyint(1) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `downloadfiles` tinyint(1) NOT NULL DEFAULT '0',
  `uploadfiles` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_exteserv_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='built in and custom external services';

-- Copiando dados para a tabela capacitacoes.mdl_external_services: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_external_services` DISABLE KEYS */;
INSERT INTO `mdl_external_services` (`id`, `name`, `enabled`, `requiredcapability`, `restrictedusers`, `component`, `timecreated`, `timemodified`, `shortname`, `downloadfiles`, `uploadfiles`) VALUES
	(1, 'Moodle mobile web service', 0, NULL, 0, 'moodle', 1475503341, 1475505567, 'moodle_mobile_app', 1, 1);
/*!40000 ALTER TABLE `mdl_external_services` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_external_services_functions
CREATE TABLE IF NOT EXISTS `mdl_external_services_functions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) NOT NULL,
  `functionname` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_exteservfunc_ext_ix` (`externalserviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='lists functions available in each service group';

-- Copiando dados para a tabela capacitacoes.mdl_external_services_functions: ~176 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_external_services_functions` DISABLE KEYS */;
INSERT INTO `mdl_external_services_functions` (`id`, `externalserviceid`, `functionname`) VALUES
	(1, 1, 'core_badges_get_user_badges'),
	(2, 1, 'core_calendar_get_calendar_events'),
	(3, 1, 'core_comment_get_comments'),
	(4, 1, 'core_completion_get_activities_completion_status'),
	(5, 1, 'core_completion_get_course_completion_status'),
	(6, 1, 'core_completion_mark_course_self_completed'),
	(7, 1, 'core_completion_update_activity_completion_status_manually'),
	(8, 1, 'core_course_get_contents'),
	(9, 1, 'core_course_get_course_module'),
	(10, 1, 'core_course_get_course_module_by_instance'),
	(11, 1, 'core_course_get_courses'),
	(12, 1, 'core_course_search_courses'),
	(13, 1, 'core_course_view_course'),
	(14, 1, 'core_enrol_get_course_enrolment_methods'),
	(15, 1, 'core_enrol_get_enrolled_users'),
	(16, 1, 'core_enrol_get_users_courses'),
	(17, 1, 'core_files_get_files'),
	(18, 1, 'core_get_component_strings'),
	(19, 1, 'core_grades_update_grades'),
	(20, 1, 'core_group_get_activity_allowed_groups'),
	(21, 1, 'core_group_get_activity_groupmode'),
	(22, 1, 'core_group_get_course_user_groups'),
	(23, 1, 'core_message_block_contacts'),
	(24, 1, 'core_message_create_contacts'),
	(25, 1, 'core_message_delete_contacts'),
	(26, 1, 'core_message_delete_message'),
	(27, 1, 'core_message_get_blocked_users'),
	(28, 1, 'core_message_get_contacts'),
	(29, 1, 'core_message_get_messages'),
	(30, 1, 'core_message_mark_message_read'),
	(31, 1, 'core_message_search_contacts'),
	(32, 1, 'core_message_send_instant_messages'),
	(33, 1, 'core_message_unblock_contacts'),
	(34, 1, 'core_notes_create_notes'),
	(35, 1, 'core_notes_delete_notes'),
	(36, 1, 'core_notes_get_course_notes'),
	(37, 1, 'core_notes_view_notes'),
	(38, 1, 'core_question_update_flag'),
	(39, 1, 'core_rating_get_item_ratings'),
	(40, 1, 'core_user_add_user_device'),
	(41, 1, 'core_user_add_user_private_files'),
	(42, 1, 'core_user_get_course_user_profiles'),
	(43, 1, 'core_user_get_users_by_field'),
	(44, 1, 'core_user_remove_user_device'),
	(45, 1, 'core_user_view_user_list'),
	(46, 1, 'core_user_view_user_profile'),
	(47, 1, 'core_competency_competency_viewed'),
	(48, 1, 'core_competency_list_course_competencies'),
	(49, 1, 'core_competency_get_scale_values'),
	(50, 1, 'core_competency_user_competency_viewed'),
	(51, 1, 'core_competency_user_competency_viewed_in_plan'),
	(52, 1, 'core_competency_user_competency_viewed_in_course'),
	(53, 1, 'core_competency_user_competency_plan_viewed'),
	(54, 1, 'core_competency_grade_competency_in_course'),
	(55, 1, 'core_competency_delete_evidence'),
	(56, 1, 'core_webservice_get_site_info'),
	(57, 1, 'mod_assign_get_grades'),
	(58, 1, 'mod_assign_get_assignments'),
	(59, 1, 'mod_assign_get_submissions'),
	(60, 1, 'mod_assign_get_user_flags'),
	(61, 1, 'mod_assign_set_user_flags'),
	(62, 1, 'mod_assign_get_user_mappings'),
	(63, 1, 'mod_assign_revert_submissions_to_draft'),
	(64, 1, 'mod_assign_lock_submissions'),
	(65, 1, 'mod_assign_unlock_submissions'),
	(66, 1, 'mod_assign_save_submission'),
	(67, 1, 'mod_assign_submit_for_grading'),
	(68, 1, 'mod_assign_save_grade'),
	(69, 1, 'mod_assign_save_grades'),
	(70, 1, 'mod_assign_save_user_extensions'),
	(71, 1, 'mod_assign_reveal_identities'),
	(72, 1, 'mod_assign_view_grading_table'),
	(73, 1, 'mod_assign_view_submission_status'),
	(74, 1, 'mod_assign_get_submission_status'),
	(75, 1, 'mod_book_view_book'),
	(76, 1, 'mod_book_get_books_by_courses'),
	(77, 1, 'mod_chat_login_user'),
	(78, 1, 'mod_chat_get_chat_users'),
	(79, 1, 'mod_chat_send_chat_message'),
	(80, 1, 'mod_chat_get_chat_latest_messages'),
	(81, 1, 'mod_chat_view_chat'),
	(82, 1, 'mod_chat_get_chats_by_courses'),
	(83, 1, 'mod_choice_get_choice_results'),
	(84, 1, 'mod_choice_get_choice_options'),
	(85, 1, 'mod_choice_submit_choice_response'),
	(86, 1, 'mod_choice_view_choice'),
	(87, 1, 'mod_choice_get_choices_by_courses'),
	(88, 1, 'mod_choice_delete_choice_responses'),
	(89, 1, 'mod_data_get_databases_by_courses'),
	(90, 1, 'mod_folder_view_folder'),
	(91, 1, 'mod_forum_get_forums_by_courses'),
	(92, 1, 'mod_forum_get_forum_discussion_posts'),
	(93, 1, 'mod_forum_get_forum_discussions_paginated'),
	(94, 1, 'mod_forum_view_forum'),
	(95, 1, 'mod_forum_view_forum_discussion'),
	(96, 1, 'mod_forum_add_discussion_post'),
	(97, 1, 'mod_forum_add_discussion'),
	(98, 1, 'mod_forum_can_add_discussion'),
	(99, 1, 'mod_glossary_get_glossaries_by_courses'),
	(100, 1, 'mod_glossary_view_glossary'),
	(101, 1, 'mod_glossary_view_entry'),
	(102, 1, 'mod_glossary_get_entries_by_letter'),
	(103, 1, 'mod_glossary_get_entries_by_date'),
	(104, 1, 'mod_glossary_get_categories'),
	(105, 1, 'mod_glossary_get_entries_by_category'),
	(106, 1, 'mod_glossary_get_authors'),
	(107, 1, 'mod_glossary_get_entries_by_author'),
	(108, 1, 'mod_glossary_get_entries_by_author_id'),
	(109, 1, 'mod_glossary_get_entries_by_search'),
	(110, 1, 'mod_glossary_get_entries_by_term'),
	(111, 1, 'mod_glossary_get_entries_to_approve'),
	(112, 1, 'mod_glossary_get_entry_by_id'),
	(113, 1, 'mod_imscp_view_imscp'),
	(114, 1, 'mod_imscp_get_imscps_by_courses'),
	(115, 1, 'mod_lti_get_tool_launch_data'),
	(116, 1, 'mod_lti_get_ltis_by_courses'),
	(117, 1, 'mod_lti_view_lti'),
	(118, 1, 'mod_page_view_page'),
	(119, 1, 'mod_quiz_get_quizzes_by_courses'),
	(120, 1, 'mod_quiz_view_quiz'),
	(121, 1, 'mod_quiz_get_user_attempts'),
	(122, 1, 'mod_quiz_get_user_best_grade'),
	(123, 1, 'mod_quiz_get_combined_review_options'),
	(124, 1, 'mod_quiz_start_attempt'),
	(125, 1, 'mod_quiz_get_attempt_data'),
	(126, 1, 'mod_quiz_get_attempt_summary'),
	(127, 1, 'mod_quiz_save_attempt'),
	(128, 1, 'mod_quiz_process_attempt'),
	(129, 1, 'mod_quiz_get_attempt_review'),
	(130, 1, 'mod_quiz_view_attempt'),
	(131, 1, 'mod_quiz_view_attempt_summary'),
	(132, 1, 'mod_quiz_view_attempt_review'),
	(133, 1, 'mod_quiz_get_quiz_feedback_for_grade'),
	(134, 1, 'mod_quiz_get_quiz_access_information'),
	(135, 1, 'mod_quiz_get_attempt_access_information'),
	(136, 1, 'mod_quiz_get_quiz_required_qtypes'),
	(137, 1, 'mod_resource_view_resource'),
	(138, 1, 'mod_scorm_view_scorm'),
	(139, 1, 'mod_scorm_get_scorm_attempt_count'),
	(140, 1, 'mod_scorm_get_scorm_scoes'),
	(141, 1, 'mod_scorm_get_scorm_user_data'),
	(142, 1, 'mod_scorm_insert_scorm_tracks'),
	(143, 1, 'mod_scorm_get_scorm_sco_tracks'),
	(144, 1, 'mod_scorm_get_scorms_by_courses'),
	(145, 1, 'mod_scorm_launch_sco'),
	(146, 1, 'mod_survey_get_surveys_by_courses'),
	(147, 1, 'mod_survey_view_survey'),
	(148, 1, 'mod_survey_get_questions'),
	(149, 1, 'mod_survey_submit_answers'),
	(150, 1, 'mod_url_view_url'),
	(151, 1, 'mod_wiki_get_wikis_by_courses'),
	(152, 1, 'mod_wiki_view_wiki'),
	(153, 1, 'mod_wiki_view_page'),
	(154, 1, 'mod_wiki_get_subwikis'),
	(155, 1, 'mod_wiki_get_subwiki_pages'),
	(156, 1, 'mod_wiki_get_subwiki_files'),
	(157, 1, 'mod_wiki_get_page_contents'),
	(158, 1, 'mod_wiki_get_page_for_editing'),
	(159, 1, 'mod_wiki_new_page'),
	(160, 1, 'mod_wiki_edit_page'),
	(161, 1, 'enrol_guest_get_instance_info'),
	(162, 1, 'enrol_self_get_instance_info'),
	(163, 1, 'enrol_self_enrol_user'),
	(164, 1, 'message_airnotifier_is_system_configured'),
	(165, 1, 'message_airnotifier_are_notification_preferences_configured'),
	(166, 1, 'gradereport_user_get_grades_table'),
	(167, 1, 'gradereport_user_view_grade_report'),
	(168, 1, 'tool_lp_data_for_course_competencies_page'),
	(169, 1, 'tool_lp_data_for_plans_page'),
	(170, 1, 'tool_lp_data_for_plan_page'),
	(171, 1, 'tool_lp_data_for_user_evidence_list_page'),
	(172, 1, 'tool_lp_data_for_user_evidence_page'),
	(173, 1, 'tool_lp_data_for_user_competency_summary'),
	(174, 1, 'tool_lp_data_for_user_competency_summary_in_plan'),
	(175, 1, 'tool_lp_data_for_user_competency_summary_in_course'),
	(176, 1, 'tool_mobile_get_plugins_supporting_mobile');
/*!40000 ALTER TABLE `mdl_external_services_functions` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_external_services_users
CREATE TABLE IF NOT EXISTS `mdl_external_services_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_exteservuser_ext_ix` (`externalserviceid`),
  KEY `mdl_exteservuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='users allowed to use services with restricted users flag';

-- Copiando dados para a tabela capacitacoes.mdl_external_services_users: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_external_services_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_external_services_users` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_external_tokens
CREATE TABLE IF NOT EXISTS `mdl_external_tokens` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tokentype` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `externalserviceid` bigint(10) NOT NULL,
  `sid` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contextid` bigint(10) NOT NULL,
  `creatorid` bigint(10) NOT NULL DEFAULT '1',
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `lastaccess` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_extetoke_use_ix` (`userid`),
  KEY `mdl_extetoke_ext_ix` (`externalserviceid`),
  KEY `mdl_extetoke_con_ix` (`contextid`),
  KEY `mdl_extetoke_cre_ix` (`creatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Security tokens for accessing of external services';

-- Copiando dados para a tabela capacitacoes.mdl_external_tokens: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_external_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_external_tokens` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_feedback
CREATE TABLE IF NOT EXISTS `mdl_feedback` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '1',
  `email_notification` tinyint(1) NOT NULL DEFAULT '1',
  `multiple_submit` tinyint(1) NOT NULL DEFAULT '1',
  `autonumbering` tinyint(1) NOT NULL DEFAULT '1',
  `site_after_submit` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `page_after_submit` longtext COLLATE utf8_unicode_ci NOT NULL,
  `page_after_submitformat` tinyint(2) NOT NULL DEFAULT '0',
  `publish_stats` tinyint(1) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feed_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all feedbacks';

-- Copiando dados para a tabela capacitacoes.mdl_feedback: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_feedback_completed
CREATE TABLE IF NOT EXISTS `mdl_feedback_completed` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use_ix` (`userid`),
  KEY `mdl_feedcomp_fee_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='filled out feedback';

-- Copiando dados para a tabela capacitacoes.mdl_feedback_completed: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_feedback_completed` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_completed` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_feedback_completedtmp
CREATE TABLE IF NOT EXISTS `mdl_feedback_completedtmp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `guestid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use2_ix` (`userid`),
  KEY `mdl_feedcomp_fee2_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='filled out feedback';

-- Copiando dados para a tabela capacitacoes.mdl_feedback_completedtmp: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_feedback_completedtmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_completedtmp` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_feedback_item
CREATE TABLE IF NOT EXISTS `mdl_feedback_item` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `presentation` longtext COLLATE utf8_unicode_ci NOT NULL,
  `typ` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hasvalue` tinyint(1) NOT NULL DEFAULT '0',
  `position` smallint(3) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `dependitem` bigint(10) NOT NULL DEFAULT '0',
  `dependvalue` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feeditem_fee_ix` (`feedback`),
  KEY `mdl_feeditem_tem_ix` (`template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback_items';

-- Copiando dados para a tabela capacitacoes.mdl_feedback_item: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_feedback_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_item` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_feedback_sitecourse_map
CREATE TABLE IF NOT EXISTS `mdl_feedback_sitecourse_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedbackid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedsitemap_cou_ix` (`courseid`),
  KEY `mdl_feedsitemap_fee_ix` (`feedbackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback sitecourse map';

-- Copiando dados para a tabela capacitacoes.mdl_feedback_sitecourse_map: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_feedback_sitecourse_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_sitecourse_map` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_feedback_template
CREATE TABLE IF NOT EXISTS `mdl_feedback_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtemp_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='templates of feedbackstructures';

-- Copiando dados para a tabela capacitacoes.mdl_feedback_template: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_feedback_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_template` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_feedback_value
CREATE TABLE IF NOT EXISTS `mdl_feedback_value` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_feedvalu_comitecou_uix` (`completed`,`item`,`course_id`),
  KEY `mdl_feedvalu_cou_ix` (`course_id`),
  KEY `mdl_feedvalu_ite_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='values of the completeds';

-- Copiando dados para a tabela capacitacoes.mdl_feedback_value: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_feedback_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_value` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_feedback_valuetmp
CREATE TABLE IF NOT EXISTS `mdl_feedback_valuetmp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_feedvalu_comitecou2_uix` (`completed`,`item`,`course_id`),
  KEY `mdl_feedvalu_cou2_ix` (`course_id`),
  KEY `mdl_feedvalu_ite2_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='values of the completedstmp';

-- Copiando dados para a tabela capacitacoes.mdl_feedback_valuetmp: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_feedback_valuetmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_valuetmp` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_files
CREATE TABLE IF NOT EXISTS `mdl_files` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contenthash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pathnamehash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filearea` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `filepath` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) DEFAULT NULL,
  `filesize` bigint(10) NOT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `source` longtext COLLATE utf8_unicode_ci,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `referencefileid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_file_pat_uix` (`pathnamehash`),
  KEY `mdl_file_comfilconite_ix` (`component`,`filearea`,`contextid`,`itemid`),
  KEY `mdl_file_con_ix` (`contenthash`),
  KEY `mdl_file_con2_ix` (`contextid`),
  KEY `mdl_file_use_ix` (`userid`),
  KEY `mdl_file_ref_ix` (`referencefileid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='description of files, content is stored in sha1 file pool';

-- Copiando dados para a tabela capacitacoes.mdl_files: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_files` DISABLE KEYS */;
INSERT INTO `mdl_files` (`id`, `contenthash`, `pathnamehash`, `contextid`, `component`, `filearea`, `itemid`, `filepath`, `filename`, `userid`, `filesize`, `mimetype`, `status`, `source`, `author`, `license`, `timecreated`, `timemodified`, `sortorder`, `referencefileid`) VALUES
	(1, '41cfeee5884a43a4650a851f4f85e7b28316fcc9', '1cf58110bbed722a68f7b1f97bd542c71a3eb675', 2, 'theme_more', 'backgroundimage', 0, '/', 'background.jpg', 2, 4451, 'image/jpeg', 0, NULL, NULL, NULL, 1475503622, 1475503622, 0, NULL),
	(2, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'a3cc4c67c513460cc8cd8d1c7e30531c4edf3983', 2, 'theme_more', 'backgroundimage', 0, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1475503622, 1475503622, 0, NULL),
	(3, '5f8e911d0da441e36f47c5c46f4393269211ca56', 'a7e34e16219b47136fbae2bd0429f58211a2924f', 2, 'assignfeedback_editpdf', 'stamps', 0, '/', 'smile.png', 2, 1085, 'image/png', 0, NULL, NULL, NULL, 1475503626, 1475503626, 0, NULL),
	(4, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '58130600c9b2ba01c59c16070a09f620225b3b19', 2, 'assignfeedback_editpdf', 'stamps', 0, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1475503626, 1475503626, 0, NULL),
	(5, '75c101cb8cb34ea573cd25ac38f8157b1de901b8', '7e84fe79af8bc28cb366e0c5ad98d4886391c87f', 2, 'assignfeedback_editpdf', 'stamps', 0, '/', 'sad.png', 2, 966, 'image/png', 0, NULL, NULL, NULL, 1475503626, 1475503626, 0, NULL),
	(6, '0c5190a24c3943966541401c883eacaa20ca20cb', '28065315e206e514d0944c633351525dca188549', 2, 'assignfeedback_editpdf', 'stamps', 0, '/', 'tick.png', 2, 1039, 'image/png', 0, NULL, NULL, NULL, 1475503626, 1475503626, 0, NULL),
	(7, '8c96a486d5801e0f4ab8c411f561f1c687e1f865', '0e65225effa9d3f418aa151bcb1303cc26099bd2', 2, 'assignfeedback_editpdf', 'stamps', 0, '/', 'cross.png', 2, 861, 'image/png', 0, NULL, NULL, NULL, 1475503626, 1475503626, 0, NULL),
	(10, '0cccba160978d019d9f268d69784332a6356a958', '34d6c9c9b3761ca24fb8be57e24e8d1bf43939eb', 36, 'tool_recyclebin', 'recyclebin_course', 1, '/', 'backup.mbz', 2, 2540, 'application/vnd.moodle.backup', 0, NULL, NULL, NULL, 1475527701, 1475527701, 0, NULL),
	(11, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '18c7e41ffd5b38d10eb21956adf6bb924e848be8', 36, 'tool_recyclebin', 'recyclebin_course', 1, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1475527701, 1475527701, 0, NULL);
/*!40000 ALTER TABLE `mdl_files` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_files_reference
CREATE TABLE IF NOT EXISTS `mdl_files_reference` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `repositoryid` bigint(10) NOT NULL,
  `lastsync` bigint(10) DEFAULT NULL,
  `reference` longtext COLLATE utf8_unicode_ci,
  `referencehash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filerefe_refrep_uix` (`referencehash`,`repositoryid`),
  KEY `mdl_filerefe_rep_ix` (`repositoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store files references';

-- Copiando dados para a tabela capacitacoes.mdl_files_reference: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_files_reference` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_files_reference` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_filter_active
CREATE TABLE IF NOT EXISTS `mdl_filter_active` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `active` smallint(4) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtacti_confil_uix` (`contextid`,`filter`),
  KEY `mdl_filtacti_con_ix` (`contextid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores information about which filters are active in which c';

-- Copiando dados para a tabela capacitacoes.mdl_filter_active: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_filter_active` DISABLE KEYS */;
INSERT INTO `mdl_filter_active` (`id`, `filter`, `contextid`, `active`, `sortorder`) VALUES
	(1, 'activitynames', 2, 1, 2),
	(2, 'mathjaxloader', 2, 1, 1),
	(3, 'mediaplugin', 2, 1, 3);
/*!40000 ALTER TABLE `mdl_filter_active` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_filter_config
CREATE TABLE IF NOT EXISTS `mdl_filter_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtconf_confilnam_uix` (`contextid`,`filter`,`name`),
  KEY `mdl_filtconf_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores per-context configuration settings for filters which ';

-- Copiando dados para a tabela capacitacoes.mdl_filter_config: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_filter_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_filter_config` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_folder
CREATE TABLE IF NOT EXISTS `mdl_folder` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `showexpanded` tinyint(1) NOT NULL DEFAULT '1',
  `showdownloadfolder` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_fold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one folder resource';

-- Copiando dados para a tabela capacitacoes.mdl_folder: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_folder` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_forum
CREATE TABLE IF NOT EXISTS `mdl_forum` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'general',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `maxattachments` bigint(10) NOT NULL DEFAULT '1',
  `forcesubscribe` tinyint(1) NOT NULL DEFAULT '0',
  `trackingtype` tinyint(2) NOT NULL DEFAULT '1',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `warnafter` bigint(10) NOT NULL DEFAULT '0',
  `blockafter` bigint(10) NOT NULL DEFAULT '0',
  `blockperiod` bigint(10) NOT NULL DEFAULT '0',
  `completiondiscussions` int(9) NOT NULL DEFAULT '0',
  `completionreplies` int(9) NOT NULL DEFAULT '0',
  `completionposts` int(9) NOT NULL DEFAULT '0',
  `displaywordcount` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foru_cou_ix` (`course`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Forums contain and structure discussion';

-- Copiando dados para a tabela capacitacoes.mdl_forum: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_forum` DISABLE KEYS */;
INSERT INTO `mdl_forum` (`id`, `course`, `type`, `name`, `intro`, `introformat`, `assessed`, `assesstimestart`, `assesstimefinish`, `scale`, `maxbytes`, `maxattachments`, `forcesubscribe`, `trackingtype`, `rsstype`, `rssarticles`, `timemodified`, `warnafter`, `blockafter`, `blockperiod`, `completiondiscussions`, `completionreplies`, `completionposts`, `displaywordcount`) VALUES
	(2, 4, 'news', 'Fórum de notícias', 'Notícias e avisos', 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1475527362, 0, 0, 0, 0, 0, 0, 0),
	(3, 5, 'news', 'Fórum de notícias', 'Notícias e avisos', 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1475527452, 0, 0, 0, 0, 0, 0, 0),
	(4, 3, 'general', 'Fórum A', '', 1, 0, 0, 0, 100, 512000, 9, 0, 1, 0, 0, 1475527533, 0, 0, 0, 0, 0, 0, 0),
	(5, 3, 'general', 'Fórum B', '', 1, 0, 0, 0, 100, 512000, 9, 0, 1, 0, 0, 1475527634, 0, 0, 0, 0, 0, 0, 0),
	(6, 3, 'general', 'Fórum C', '', 1, 0, 0, 0, 100, 512000, 9, 0, 1, 0, 0, 1475527655, 0, 0, 0, 0, 0, 0, 0),
	(7, 3, 'news', 'Fórum de notícias', 'Notícias e avisos', 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1475527704, 0, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `mdl_forum` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_forum_digests
CREATE TABLE IF NOT EXISTS `mdl_forum_digests` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `forum` bigint(10) NOT NULL,
  `maildigest` tinyint(1) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_forudige_forusemai_uix` (`forum`,`userid`,`maildigest`),
  KEY `mdl_forudige_use_ix` (`userid`),
  KEY `mdl_forudige_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of user mail delivery preferences for each forum';

-- Copiando dados para a tabela capacitacoes.mdl_forum_digests: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_forum_digests` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_digests` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_forum_discussions
CREATE TABLE IF NOT EXISTS `mdl_forum_discussions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstpost` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '-1',
  `assessed` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) NOT NULL DEFAULT '0',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forudisc_use_ix` (`userid`),
  KEY `mdl_forudisc_cou_ix` (`course`),
  KEY `mdl_forudisc_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Forums are composed of discussions';

-- Copiando dados para a tabela capacitacoes.mdl_forum_discussions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_forum_discussions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_discussions` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_forum_discussion_subs
CREATE TABLE IF NOT EXISTS `mdl_forum_discussion_subs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `forum` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `discussion` bigint(10) NOT NULL,
  `preference` bigint(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_forudiscsubs_usedis_uix` (`userid`,`discussion`),
  KEY `mdl_forudiscsubs_for_ix` (`forum`),
  KEY `mdl_forudiscsubs_use_ix` (`userid`),
  KEY `mdl_forudiscsubs_dis_ix` (`discussion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Users may choose to subscribe and unsubscribe from specific ';

-- Copiando dados para a tabela capacitacoes.mdl_forum_discussion_subs: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_forum_discussion_subs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_discussion_subs` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_forum_posts
CREATE TABLE IF NOT EXISTS `mdl_forum_posts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `discussion` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `messageformat` tinyint(2) NOT NULL DEFAULT '0',
  `messagetrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `totalscore` smallint(4) NOT NULL DEFAULT '0',
  `mailnow` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forupost_use_ix` (`userid`),
  KEY `mdl_forupost_cre_ix` (`created`),
  KEY `mdl_forupost_mai_ix` (`mailed`),
  KEY `mdl_forupost_dis_ix` (`discussion`),
  KEY `mdl_forupost_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='All posts are stored in this table';

-- Copiando dados para a tabela capacitacoes.mdl_forum_posts: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_forum_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_posts` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_forum_queue
CREATE TABLE IF NOT EXISTS `mdl_forum_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruqueu_use_ix` (`userid`),
  KEY `mdl_foruqueu_dis_ix` (`discussionid`),
  KEY `mdl_foruqueu_pos_ix` (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For keeping track of posts that will be mailed in digest for';

-- Copiando dados para a tabela capacitacoes.mdl_forum_queue: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_forum_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_queue` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_forum_read
CREATE TABLE IF NOT EXISTS `mdl_forum_read` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `firstread` bigint(10) NOT NULL DEFAULT '0',
  `lastread` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruread_usefor_ix` (`userid`,`forumid`),
  KEY `mdl_foruread_usedis_ix` (`userid`,`discussionid`),
  KEY `mdl_foruread_posuse_ix` (`postid`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tracks each users read posts';

-- Copiando dados para a tabela capacitacoes.mdl_forum_read: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_forum_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_read` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_forum_subscriptions
CREATE TABLE IF NOT EXISTS `mdl_forum_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forusubs_use_ix` (`userid`),
  KEY `mdl_forusubs_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of who is subscribed to what forum';

-- Copiando dados para a tabela capacitacoes.mdl_forum_subscriptions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_forum_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_subscriptions` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_forum_track_prefs
CREATE TABLE IF NOT EXISTS `mdl_forum_track_prefs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forutracpref_usefor_ix` (`userid`,`forumid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tracks each users untracked forums';

-- Copiando dados para a tabela capacitacoes.mdl_forum_track_prefs: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_forum_track_prefs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_track_prefs` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_glossary
CREATE TABLE IF NOT EXISTS `mdl_glossary` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `allowduplicatedentries` tinyint(2) NOT NULL DEFAULT '0',
  `displayformat` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'dictionary',
  `mainglossary` tinyint(2) NOT NULL DEFAULT '0',
  `showspecial` tinyint(2) NOT NULL DEFAULT '1',
  `showalphabet` tinyint(2) NOT NULL DEFAULT '1',
  `showall` tinyint(2) NOT NULL DEFAULT '1',
  `allowcomments` tinyint(2) NOT NULL DEFAULT '0',
  `allowprintview` tinyint(2) NOT NULL DEFAULT '1',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `defaultapproval` tinyint(2) NOT NULL DEFAULT '1',
  `approvaldisplayformat` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `globalglossary` tinyint(2) NOT NULL DEFAULT '0',
  `entbypage` smallint(3) NOT NULL DEFAULT '10',
  `editalways` tinyint(2) NOT NULL DEFAULT '0',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionentries` int(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glos_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all glossaries';

-- Copiando dados para a tabela capacitacoes.mdl_glossary: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_glossary` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_glossary_alias
CREATE TABLE IF NOT EXISTS `mdl_glossary_alias` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_glosalia_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='entries alias';

-- Copiando dados para a tabela capacitacoes.mdl_glossary_alias: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_glossary_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_alias` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_glossary_categories
CREATE TABLE IF NOT EXISTS `mdl_glossary_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_gloscate_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all categories for glossary entries';

-- Copiando dados para a tabela capacitacoes.mdl_glossary_categories: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_glossary_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_categories` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_glossary_entries
CREATE TABLE IF NOT EXISTS `mdl_glossary_entries` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `concept` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `definition` longtext COLLATE utf8_unicode_ci NOT NULL,
  `definitionformat` tinyint(2) NOT NULL DEFAULT '0',
  `definitiontrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherentry` tinyint(2) NOT NULL DEFAULT '0',
  `sourceglossaryid` bigint(10) NOT NULL DEFAULT '0',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `casesensitive` tinyint(2) NOT NULL DEFAULT '0',
  `fullmatch` tinyint(2) NOT NULL DEFAULT '1',
  `approved` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentr_use_ix` (`userid`),
  KEY `mdl_glosentr_con_ix` (`concept`),
  KEY `mdl_glosentr_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all glossary entries';

-- Copiando dados para a tabela capacitacoes.mdl_glossary_entries: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_glossary_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_entries` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_glossary_entries_categories
CREATE TABLE IF NOT EXISTS `mdl_glossary_entries_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentrcate_cat_ix` (`categoryid`),
  KEY `mdl_glosentrcate_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='categories of each glossary entry';

-- Copiando dados para a tabela capacitacoes.mdl_glossary_entries_categories: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_glossary_entries_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_entries_categories` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_glossary_formats
CREATE TABLE IF NOT EXISTS `mdl_glossary_formats` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `popupformatname` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(2) NOT NULL DEFAULT '1',
  `showgroup` tinyint(2) NOT NULL DEFAULT '1',
  `showtabs` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `defaultmode` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `defaulthook` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortkey` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Setting of the display formats';

-- Copiando dados para a tabela capacitacoes.mdl_glossary_formats: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_glossary_formats` DISABLE KEYS */;
INSERT INTO `mdl_glossary_formats` (`id`, `name`, `popupformatname`, `visible`, `showgroup`, `showtabs`, `defaultmode`, `defaulthook`, `sortkey`, `sortorder`) VALUES
	(1, 'continuous', 'continuous', 1, 1, 'standard,category,date', '', '', '', ''),
	(2, 'dictionary', 'dictionary', 1, 1, 'standard', '', '', '', ''),
	(3, 'encyclopedia', 'encyclopedia', 1, 1, 'standard,category,date,author', '', '', '', ''),
	(4, 'entrylist', 'entrylist', 1, 1, 'standard,category,date,author', '', '', '', ''),
	(5, 'faq', 'faq', 1, 1, 'standard,category,date,author', '', '', '', ''),
	(6, 'fullwithauthor', 'fullwithauthor', 1, 1, 'standard,category,date,author', '', '', '', ''),
	(7, 'fullwithoutauthor', 'fullwithoutauthor', 1, 1, 'standard,category,date', '', '', '', '');
/*!40000 ALTER TABLE `mdl_glossary_formats` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_grade_categories
CREATE TABLE IF NOT EXISTS `mdl_grade_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcate_cou_ix` (`courseid`),
  KEY `mdl_gradcate_par_ix` (`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about categories, used for grou';

-- Copiando dados para a tabela capacitacoes.mdl_grade_categories: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_grade_categories` DISABLE KEYS */;
INSERT INTO `mdl_grade_categories` (`id`, `courseid`, `parent`, `depth`, `path`, `fullname`, `aggregation`, `keephigh`, `droplow`, `aggregateonlygraded`, `aggregateoutcomes`, `timecreated`, `timemodified`, `hidden`) VALUES
	(1, 3, NULL, 1, '/1/', '?', 13, 0, 0, 1, 0, 1475527518, 1475527518, 0);
/*!40000 ALTER TABLE `mdl_grade_categories` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_grade_categories_history
CREATE TABLE IF NOT EXISTS `mdl_grade_categories_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcatehist_act_ix` (`action`),
  KEY `mdl_gradcatehist_old_ix` (`oldid`),
  KEY `mdl_gradcatehist_cou_ix` (`courseid`),
  KEY `mdl_gradcatehist_par_ix` (`parent`),
  KEY `mdl_gradcatehist_log_ix` (`loggeduser`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History of grade_categories';

-- Copiando dados para a tabela capacitacoes.mdl_grade_categories_history: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_grade_categories_history` DISABLE KEYS */;
INSERT INTO `mdl_grade_categories_history` (`id`, `action`, `oldid`, `source`, `timemodified`, `loggeduser`, `courseid`, `parent`, `depth`, `path`, `fullname`, `aggregation`, `keephigh`, `droplow`, `aggregateonlygraded`, `aggregateoutcomes`, `aggregatesubcats`, `hidden`) VALUES
	(1, 1, 1, 'system', 1475527518, 2, 3, NULL, 0, NULL, '?', 13, 0, 0, 1, 0, 0, 0),
	(2, 2, 1, 'system', 1475527518, 2, 3, NULL, 1, '/1/', '?', 13, 0, 0, 1, 0, 0, 0);
/*!40000 ALTER TABLE `mdl_grade_categories_history` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_grade_grades
CREATE TABLE IF NOT EXISTS `mdl_grade_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext COLLATE utf8_unicode_ci,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `aggregationstatus` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `aggregationweight` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradgrad_useite_uix` (`userid`,`itemid`),
  KEY `mdl_gradgrad_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_gradgrad_ite_ix` (`itemid`),
  KEY `mdl_gradgrad_use_ix` (`userid`),
  KEY `mdl_gradgrad_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgrad_use2_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='grade_grades  This table keeps individual grades for each us';

-- Copiando dados para a tabela capacitacoes.mdl_grade_grades: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_grade_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_grades` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_grade_grades_history
CREATE TABLE IF NOT EXISTS `mdl_grade_grades_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext COLLATE utf8_unicode_ci,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradgradhist_act_ix` (`action`),
  KEY `mdl_gradgradhist_tim_ix` (`timemodified`),
  KEY `mdl_gradgradhist_useitetim_ix` (`userid`,`itemid`,`timemodified`),
  KEY `mdl_gradgradhist_old_ix` (`oldid`),
  KEY `mdl_gradgradhist_ite_ix` (`itemid`),
  KEY `mdl_gradgradhist_use_ix` (`userid`),
  KEY `mdl_gradgradhist_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgradhist_use2_ix` (`usermodified`),
  KEY `mdl_gradgradhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table';

-- Copiando dados para a tabela capacitacoes.mdl_grade_grades_history: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_grade_grades_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_grades_history` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_grade_import_newitem
CREATE TABLE IF NOT EXISTS `mdl_grade_import_newitem` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimponewi_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='temporary table for storing new grade_item names from grade ';

-- Copiando dados para a tabela capacitacoes.mdl_grade_import_newitem: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_grade_import_newitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_import_newitem` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_grade_import_values
CREATE TABLE IF NOT EXISTS `mdl_grade_import_values` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) DEFAULT NULL,
  `newgradeitem` bigint(10) DEFAULT NULL,
  `userid` bigint(10) NOT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `feedback` longtext COLLATE utf8_unicode_ci,
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) DEFAULT NULL,
  `importonlyfeedback` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradimpovalu_ite_ix` (`itemid`),
  KEY `mdl_gradimpovalu_new_ix` (`newgradeitem`),
  KEY `mdl_gradimpovalu_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Temporary table for importing grades';

-- Copiando dados para a tabela capacitacoes.mdl_grade_import_values: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_grade_import_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_import_values` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_grade_items
CREATE TABLE IF NOT EXISTS `mdl_grade_items` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemtype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemmodule` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext COLLATE utf8_unicode_ci,
  `idnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calculation` longtext COLLATE utf8_unicode_ci,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef2` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `weightoverride` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_graditem_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_graditem_itenee_ix` (`itemtype`,`needsupdate`),
  KEY `mdl_graditem_gra_ix` (`gradetype`),
  KEY `mdl_graditem_idncou_ix` (`idnumber`,`courseid`),
  KEY `mdl_graditem_cou_ix` (`courseid`),
  KEY `mdl_graditem_cat_ix` (`categoryid`),
  KEY `mdl_graditem_sca_ix` (`scaleid`),
  KEY `mdl_graditem_out_ix` (`outcomeid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about gradeable items (ie colum';

-- Copiando dados para a tabela capacitacoes.mdl_grade_items: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_grade_items` DISABLE KEYS */;
INSERT INTO `mdl_grade_items` (`id`, `courseid`, `categoryid`, `itemname`, `itemtype`, `itemmodule`, `iteminstance`, `itemnumber`, `iteminfo`, `idnumber`, `calculation`, `gradetype`, `grademax`, `grademin`, `scaleid`, `outcomeid`, `gradepass`, `multfactor`, `plusfactor`, `aggregationcoef`, `aggregationcoef2`, `sortorder`, `display`, `decimals`, `hidden`, `locked`, `locktime`, `needsupdate`, `weightoverride`, `timecreated`, `timemodified`) VALUES
	(1, 3, NULL, NULL, 'course', NULL, 1, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 0.00000, 1, 0, NULL, 0, 0, 0, 0, 0, 1475527518, 1475527593),
	(2, 3, 1, 'Laboratório de Avaliação A (envio)', 'mod', 'workshop', 1, 0, NULL, NULL, NULL, 1, 80.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 0.80000, 2, 0, NULL, 0, 0, 0, 0, 0, 1475527593, 1475527593),
	(3, 3, 1, 'Laboratório de Avaliação A (avaliação)', 'mod', 'workshop', 1, 1, NULL, NULL, NULL, 1, 20.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 0.20000, 3, 0, NULL, 0, 0, 0, 0, 0, 1475527593, 1475527593);
/*!40000 ALTER TABLE `mdl_grade_items` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_grade_items_history
CREATE TABLE IF NOT EXISTS `mdl_grade_items_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemtype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemmodule` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext COLLATE utf8_unicode_ci,
  `idnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calculation` longtext COLLATE utf8_unicode_ci,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef2` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  `weightoverride` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_graditemhist_act_ix` (`action`),
  KEY `mdl_graditemhist_old_ix` (`oldid`),
  KEY `mdl_graditemhist_cou_ix` (`courseid`),
  KEY `mdl_graditemhist_cat_ix` (`categoryid`),
  KEY `mdl_graditemhist_sca_ix` (`scaleid`),
  KEY `mdl_graditemhist_out_ix` (`outcomeid`),
  KEY `mdl_graditemhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History of grade_items';

-- Copiando dados para a tabela capacitacoes.mdl_grade_items_history: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_grade_items_history` DISABLE KEYS */;
INSERT INTO `mdl_grade_items_history` (`id`, `action`, `oldid`, `source`, `timemodified`, `loggeduser`, `courseid`, `categoryid`, `itemname`, `itemtype`, `itemmodule`, `iteminstance`, `itemnumber`, `iteminfo`, `idnumber`, `calculation`, `gradetype`, `grademax`, `grademin`, `scaleid`, `outcomeid`, `gradepass`, `multfactor`, `plusfactor`, `aggregationcoef`, `aggregationcoef2`, `sortorder`, `hidden`, `locked`, `locktime`, `needsupdate`, `display`, `decimals`, `weightoverride`) VALUES
	(1, 1, 1, 'system', 1475527518, 2, 3, NULL, NULL, 'course', NULL, 1, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1, 0, NULL, 0),
	(2, 2, 1, 'aggregation', 1475527533, 2, 3, NULL, NULL, 'course', NULL, 1, NULL, NULL, NULL, NULL, 1, 0.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1, 0, NULL, 0),
	(3, 1, 2, NULL, 1475527593, 2, 3, 1, 'Laboratório de Avaliação A (envio)', 'mod', 'workshop', 1, 0, NULL, NULL, NULL, 1, 80.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 0.00000, 2, 0, 0, 0, 1, 0, NULL, 0),
	(4, 1, 3, NULL, 1475527593, 2, 3, 1, 'Laboratório de Avaliação A (avaliação)', 'mod', 'workshop', 1, 1, NULL, NULL, NULL, 1, 20.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 0.00000, 3, 0, 0, 0, 1, 0, NULL, 0),
	(5, 2, 2, NULL, 1475527593, 2, 3, 1, 'Laboratório de Avaliação A (envio)', 'mod', 'workshop', 1, 0, NULL, NULL, NULL, 1, 80.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 0.80000, 2, 0, 0, 0, 1, 0, NULL, 0),
	(6, 2, 3, NULL, 1475527593, 2, 3, 1, 'Laboratório de Avaliação A (avaliação)', 'mod', 'workshop', 1, 1, NULL, NULL, NULL, 1, 20.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 0.20000, 3, 0, 0, 0, 1, 0, NULL, 0),
	(7, 2, 1, 'aggregation', 1475527593, 2, 3, NULL, NULL, 'course', NULL, 1, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1, 0, NULL, 0);
/*!40000 ALTER TABLE `mdl_grade_items_history` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_grade_letters
CREATE TABLE IF NOT EXISTS `mdl_grade_letters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `lowerboundary` decimal(10,5) NOT NULL,
  `letter` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradlett_conlowlet_uix` (`contextid`,`lowerboundary`,`letter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Repository for grade letters, for courses and other moodle e';

-- Copiando dados para a tabela capacitacoes.mdl_grade_letters: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_grade_letters` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_letters` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_grade_outcomes
CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fullname` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutc_cousho_uix` (`courseid`,`shortname`),
  KEY `mdl_gradoutc_cou_ix` (`courseid`),
  KEY `mdl_gradoutc_sca_ix` (`scaleid`),
  KEY `mdl_gradoutc_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table describes the outcomes used in the system. An out';

-- Copiando dados para a tabela capacitacoes.mdl_grade_outcomes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_grade_outcomes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_outcomes` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_grade_outcomes_courses
CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `outcomeid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutccour_couout_uix` (`courseid`,`outcomeid`),
  KEY `mdl_gradoutccour_cou_ix` (`courseid`),
  KEY `mdl_gradoutccour_out_ix` (`outcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='stores what outcomes are used in what courses.';

-- Copiando dados para a tabela capacitacoes.mdl_grade_outcomes_courses: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_grade_outcomes_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_outcomes_courses` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_grade_outcomes_history
CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fullname` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradoutchist_act_ix` (`action`),
  KEY `mdl_gradoutchist_old_ix` (`oldid`),
  KEY `mdl_gradoutchist_cou_ix` (`courseid`),
  KEY `mdl_gradoutchist_sca_ix` (`scaleid`),
  KEY `mdl_gradoutchist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table';

-- Copiando dados para a tabela capacitacoes.mdl_grade_outcomes_history: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_grade_outcomes_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_outcomes_history` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_grade_settings
CREATE TABLE IF NOT EXISTS `mdl_grade_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradsett_counam_uix` (`courseid`,`name`),
  KEY `mdl_gradsett_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='gradebook settings';

-- Copiando dados para a tabela capacitacoes.mdl_grade_settings: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_grade_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_settings` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_gradingform_guide_comments
CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcomm_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='frequently used comments used in marking guide';

-- Copiando dados para a tabela capacitacoes.mdl_gradingform_guide_comments: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_gradingform_guide_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_guide_comments` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_gradingform_guide_criteria
CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `descriptionmarkers` longtext COLLATE utf8_unicode_ci,
  `descriptionmarkersformat` tinyint(2) DEFAULT NULL,
  `maxscore` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the rows of the criteria grid.';

-- Copiando dados para a tabela capacitacoes.mdl_gradingform_guide_criteria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_gradingform_guide_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_guide_criteria` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_gradingform_guide_fillings
CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_fillings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `remark` longtext COLLATE utf8_unicode_ci,
  `remarkformat` tinyint(2) DEFAULT NULL,
  `score` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradguidfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradguidfill_ins_ix` (`instanceid`),
  KEY `mdl_gradguidfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the data of how the guide is filled by a particular r';

-- Copiando dados para a tabela capacitacoes.mdl_gradingform_guide_fillings: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_gradingform_guide_fillings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_guide_fillings` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_gradingform_rubric_criteria
CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the rows of the rubric grid.';

-- Copiando dados para a tabela capacitacoes.mdl_gradingform_rubric_criteria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_gradingform_rubric_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_criteria` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_gradingform_rubric_fillings
CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_fillings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `levelid` bigint(10) DEFAULT NULL,
  `remark` longtext COLLATE utf8_unicode_ci,
  `remarkformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradrubrfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradrubrfill_lev_ix` (`levelid`),
  KEY `mdl_gradrubrfill_ins_ix` (`instanceid`),
  KEY `mdl_gradrubrfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the data of how the rubric is filled by a particular ';

-- Copiando dados para a tabela capacitacoes.mdl_gradingform_rubric_fillings: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_gradingform_rubric_fillings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_fillings` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_gradingform_rubric_levels
CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `criterionid` bigint(10) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `definition` longtext COLLATE utf8_unicode_ci,
  `definitionformat` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrleve_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the columns of the rubric grid.';

-- Copiando dados para a tabela capacitacoes.mdl_gradingform_rubric_levels: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_gradingform_rubric_levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_levels` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_grading_areas
CREATE TABLE IF NOT EXISTS `mdl_grading_areas` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `areaname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `activemethod` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradarea_concomare_uix` (`contextid`,`component`,`areaname`),
  KEY `mdl_gradarea_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Identifies gradable areas where advanced grading can happen.';

-- Copiando dados para a tabela capacitacoes.mdl_grading_areas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_grading_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grading_areas` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_grading_definitions
CREATE TABLE IF NOT EXISTS `mdl_grading_definitions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `areaid` bigint(10) NOT NULL,
  `method` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `copiedfromid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `usercreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `timecopied` bigint(10) DEFAULT '0',
  `options` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_graddefi_aremet_uix` (`areaid`,`method`),
  KEY `mdl_graddefi_are_ix` (`areaid`),
  KEY `mdl_graddefi_use_ix` (`usermodified`),
  KEY `mdl_graddefi_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the basic information about an advanced grading for';

-- Copiando dados para a tabela capacitacoes.mdl_grading_definitions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_grading_definitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grading_definitions` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_grading_instances
CREATE TABLE IF NOT EXISTS `mdl_grading_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `raterid` bigint(10) NOT NULL,
  `itemid` bigint(10) DEFAULT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci,
  `feedbackformat` tinyint(2) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradinst_def_ix` (`definitionid`),
  KEY `mdl_gradinst_rat_ix` (`raterid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Grading form instance is an assessment record for one gradab';

-- Copiando dados para a tabela capacitacoes.mdl_grading_instances: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_grading_instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grading_instances` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_groupings
CREATE TABLE IF NOT EXISTS `mdl_groupings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `configdata` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn2_ix` (`idnumber`),
  KEY `mdl_grou_cou2_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A grouping is a collection of groups. WAS: groups_groupings';

-- Copiando dados para a tabela capacitacoes.mdl_groupings: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_groupings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groupings` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_groupings_groups
CREATE TABLE IF NOT EXISTS `mdl_groupings_groups` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grougrou_gro_ix` (`groupingid`),
  KEY `mdl_grougrou_gro2_ix` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a grouping to a group (note, groups can be in multiple ';

-- Copiando dados para a tabela capacitacoes.mdl_groupings_groups: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_groupings_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groupings_groups` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_groups
CREATE TABLE IF NOT EXISTS `mdl_groups` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `enrolmentkey` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `hidepicture` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn_ix` (`idnumber`),
  KEY `mdl_grou_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record represents a group.';

-- Copiando dados para a tabela capacitacoes.mdl_groups: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groups` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_groups_members
CREATE TABLE IF NOT EXISTS `mdl_groups_members` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_groumemb_gro_ix` (`groupid`),
  KEY `mdl_groumemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a user to a group.';

-- Copiando dados para a tabela capacitacoes.mdl_groups_members: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_groups_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groups_members` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_imscp
CREATE TABLE IF NOT EXISTS `mdl_imscp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `keepold` bigint(10) NOT NULL DEFAULT '-1',
  `structure` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_imsc_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one imscp resource';

-- Copiando dados para a tabela capacitacoes.mdl_imscp: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_imscp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_imscp` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_label
CREATE TABLE IF NOT EXISTS `mdl_label` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_labe_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines labels';

-- Copiando dados para a tabela capacitacoes.mdl_label: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_label` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_lesson
CREATE TABLE IF NOT EXISTS `mdl_lesson` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `practice` smallint(3) NOT NULL DEFAULT '0',
  `modattempts` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dependency` bigint(10) NOT NULL DEFAULT '0',
  `conditions` longtext COLLATE utf8_unicode_ci NOT NULL,
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `custom` smallint(3) NOT NULL DEFAULT '0',
  `ongoing` smallint(3) NOT NULL DEFAULT '0',
  `usemaxgrade` smallint(3) NOT NULL DEFAULT '0',
  `maxanswers` smallint(3) NOT NULL DEFAULT '4',
  `maxattempts` smallint(3) NOT NULL DEFAULT '5',
  `review` smallint(3) NOT NULL DEFAULT '0',
  `nextpagedefault` smallint(3) NOT NULL DEFAULT '0',
  `feedback` smallint(3) NOT NULL DEFAULT '1',
  `minquestions` smallint(3) NOT NULL DEFAULT '0',
  `maxpages` smallint(3) NOT NULL DEFAULT '0',
  `timelimit` bigint(10) NOT NULL DEFAULT '0',
  `retake` smallint(3) NOT NULL DEFAULT '1',
  `activitylink` bigint(10) NOT NULL DEFAULT '0',
  `mediafile` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mediaheight` bigint(10) NOT NULL DEFAULT '100',
  `mediawidth` bigint(10) NOT NULL DEFAULT '650',
  `mediaclose` smallint(3) NOT NULL DEFAULT '0',
  `slideshow` smallint(3) NOT NULL DEFAULT '0',
  `width` bigint(10) NOT NULL DEFAULT '640',
  `height` bigint(10) NOT NULL DEFAULT '480',
  `bgcolor` varchar(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#FFFFFF',
  `displayleft` smallint(3) NOT NULL DEFAULT '0',
  `displayleftif` smallint(3) NOT NULL DEFAULT '0',
  `progressbar` smallint(3) NOT NULL DEFAULT '0',
  `available` bigint(10) NOT NULL DEFAULT '0',
  `deadline` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionendreached` tinyint(1) DEFAULT '0',
  `completiontimespent` bigint(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_less_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson';

-- Copiando dados para a tabela capacitacoes.mdl_lesson: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_lesson` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_lesson_answers
CREATE TABLE IF NOT EXISTS `mdl_lesson_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `jumpto` bigint(11) NOT NULL DEFAULT '0',
  `grade` smallint(4) NOT NULL DEFAULT '0',
  `score` bigint(10) NOT NULL DEFAULT '0',
  `flags` smallint(3) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext COLLATE utf8_unicode_ci,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `response` longtext COLLATE utf8_unicode_ci,
  `responseformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessansw_les_ix` (`lessonid`),
  KEY `mdl_lessansw_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_answers';

-- Copiando dados para a tabela capacitacoes.mdl_lesson_answers: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_lesson_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_answers` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_lesson_attempts
CREATE TABLE IF NOT EXISTS `mdl_lesson_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `answerid` bigint(10) NOT NULL DEFAULT '0',
  `retry` smallint(3) NOT NULL DEFAULT '0',
  `correct` bigint(10) NOT NULL DEFAULT '0',
  `useranswer` longtext COLLATE utf8_unicode_ci,
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessatte_use_ix` (`userid`),
  KEY `mdl_lessatte_les_ix` (`lessonid`),
  KEY `mdl_lessatte_pag_ix` (`pageid`),
  KEY `mdl_lessatte_ans_ix` (`answerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_attempts';

-- Copiando dados para a tabela capacitacoes.mdl_lesson_attempts: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_lesson_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_attempts` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_lesson_branch
CREATE TABLE IF NOT EXISTS `mdl_lesson_branch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `retry` bigint(10) NOT NULL DEFAULT '0',
  `flag` smallint(3) NOT NULL DEFAULT '0',
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessbran_use_ix` (`userid`),
  KEY `mdl_lessbran_les_ix` (`lessonid`),
  KEY `mdl_lessbran_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='branches for each lesson/user';

-- Copiando dados para a tabela capacitacoes.mdl_lesson_branch: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_lesson_branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_branch` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_lesson_grades
CREATE TABLE IF NOT EXISTS `mdl_lesson_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessgrad_use_ix` (`userid`),
  KEY `mdl_lessgrad_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_grades';

-- Copiando dados para a tabela capacitacoes.mdl_lesson_grades: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_lesson_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_grades` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_lesson_overrides
CREATE TABLE IF NOT EXISTS `mdl_lesson_overrides` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) DEFAULT NULL,
  `userid` bigint(10) DEFAULT NULL,
  `available` bigint(10) DEFAULT NULL,
  `deadline` bigint(10) DEFAULT NULL,
  `timelimit` bigint(10) DEFAULT NULL,
  `review` smallint(3) DEFAULT NULL,
  `maxattempts` smallint(3) DEFAULT NULL,
  `retake` smallint(3) DEFAULT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_lessover_les_ix` (`lessonid`),
  KEY `mdl_lessover_gro_ix` (`groupid`),
  KEY `mdl_lessover_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The overrides to lesson settings.';

-- Copiando dados para a tabela capacitacoes.mdl_lesson_overrides: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_lesson_overrides` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_overrides` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_lesson_pages
CREATE TABLE IF NOT EXISTS `mdl_lesson_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `prevpageid` bigint(10) NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) NOT NULL DEFAULT '0',
  `qtype` smallint(3) NOT NULL DEFAULT '0',
  `qoption` smallint(3) NOT NULL DEFAULT '0',
  `layout` smallint(3) NOT NULL DEFAULT '1',
  `display` smallint(3) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contents` longtext COLLATE utf8_unicode_ci NOT NULL,
  `contentsformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesspage_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_pages';

-- Copiando dados para a tabela capacitacoes.mdl_lesson_pages: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_lesson_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_pages` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_lesson_timer
CREATE TABLE IF NOT EXISTS `mdl_lesson_timer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `starttime` bigint(10) NOT NULL DEFAULT '0',
  `lessontime` bigint(10) NOT NULL DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesstime_use_ix` (`userid`),
  KEY `mdl_lesstime_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='lesson timer for each lesson';

-- Copiando dados para a tabela capacitacoes.mdl_lesson_timer: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_lesson_timer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_timer` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_license
CREATE TABLE IF NOT EXISTS `mdl_license` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` longtext COLLATE utf8_unicode_ci,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `version` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='store licenses used by moodle';

-- Copiando dados para a tabela capacitacoes.mdl_license: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_license` DISABLE KEYS */;
INSERT INTO `mdl_license` (`id`, `shortname`, `fullname`, `source`, `enabled`, `version`) VALUES
	(1, 'unknown', 'Unknown license', '', 1, 2010033100),
	(2, 'allrightsreserved', 'All rights reserved', 'http://en.wikipedia.org/wiki/All_rights_reserved', 1, 2010033100),
	(3, 'public', 'Public Domain', 'http://creativecommons.org/licenses/publicdomain/', 1, 2010033100),
	(4, 'cc', 'Creative Commons', 'http://creativecommons.org/licenses/by/3.0/', 1, 2010033100),
	(5, 'cc-nd', 'Creative Commons - NoDerivs', 'http://creativecommons.org/licenses/by-nd/3.0/', 1, 2010033100),
	(6, 'cc-nc-nd', 'Creative Commons - No Commercial NoDerivs', 'http://creativecommons.org/licenses/by-nc-nd/3.0/', 1, 2010033100),
	(7, 'cc-nc', 'Creative Commons - No Commercial', 'http://creativecommons.org/licenses/by-nc/3.0/', 1, 2013051500),
	(8, 'cc-nc-sa', 'Creative Commons - No Commercial ShareAlike', 'http://creativecommons.org/licenses/by-nc-sa/3.0/', 1, 2010033100),
	(9, 'cc-sa', 'Creative Commons - ShareAlike', 'http://creativecommons.org/licenses/by-sa/3.0/', 1, 2010033100);
/*!40000 ALTER TABLE `mdl_license` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_lock_db
CREATE TABLE IF NOT EXISTS `mdl_lock_db` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `resourcekey` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` bigint(10) DEFAULT NULL,
  `owner` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_lockdb_res_uix` (`resourcekey`),
  KEY `mdl_lockdb_exp_ix` (`expires`),
  KEY `mdl_lockdb_own_ix` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores active and inactive lock types for db locking method.';

-- Copiando dados para a tabela capacitacoes.mdl_lock_db: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_lock_db` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lock_db` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_log
CREATE TABLE IF NOT EXISTS `mdl_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_log_coumodact_ix` (`course`,`module`,`action`),
  KEY `mdl_log_tim_ix` (`time`),
  KEY `mdl_log_act_ix` (`action`),
  KEY `mdl_log_usecou_ix` (`userid`,`course`),
  KEY `mdl_log_cmi_ix` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Every action is logged as far as possible';

-- Copiando dados para a tabela capacitacoes.mdl_log: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_log` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_logstore_standard_log
CREATE TABLE IF NOT EXISTS `mdl_logstore_standard_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `action` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `target` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `objecttable` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `objectid` bigint(10) DEFAULT NULL,
  `crud` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `edulevel` tinyint(1) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  `contextinstanceid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `relateduserid` bigint(10) DEFAULT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `other` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL,
  `origin` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `realuserid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_logsstanlog_tim_ix` (`timecreated`),
  KEY `mdl_logsstanlog_couanotim_ix` (`courseid`,`anonymous`,`timecreated`),
  KEY `mdl_logsstanlog_useconconcr_ix` (`userid`,`contextlevel`,`contextinstanceid`,`crud`,`edulevel`,`timecreated`),
  KEY `mdl_logsstanlog_con_ix` (`contextid`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Standard log table';

-- Copiando dados para a tabela capacitacoes.mdl_logstore_standard_log: ~79 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_logstore_standard_log` DISABLE KEYS */;
INSERT INTO `mdl_logstore_standard_log` (`id`, `eventname`, `component`, `action`, `target`, `objecttable`, `objectid`, `crud`, `edulevel`, `contextid`, `contextlevel`, `contextinstanceid`, `userid`, `courseid`, `relateduserid`, `anonymous`, `other`, `timecreated`, `origin`, `ip`, `realuserid`) VALUES
	(1, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 2, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1475503733, 'web', '127.0.0.1', NULL),
	(2, '\\core\\event\\user_password_updated', 'core', 'updated', 'user_password', NULL, NULL, 'u', 0, 6, 30, 2, 2, 0, 2, 0, 'a:1:{s:14:"forgottenreset";b:0;}', 1475505520, 'web', '127.0.0.1', NULL),
	(3, '\\core\\event\\user_updated', 'core', 'updated', 'user', 'user', 2, 'u', 0, 6, 30, 2, 2, 0, 2, 0, 'N;', 1475505521, 'web', '127.0.0.1', NULL),
	(4, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 3, 50, 1, 0, 1, NULL, 0, 'N;', 1475526563, 'web', '127.0.0.1', NULL),
	(5, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 3, 50, 1, 0, 1, NULL, 0, 'N;', 1475526568, 'web', '127.0.0.1', NULL),
	(6, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 2, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:7:"infatec";}', 1475526581, 'web', '127.0.0.1', NULL),
	(7, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 3, 50, 1, 2, 1, NULL, 0, 'N;', 1475526581, 'web', '127.0.0.1', NULL),
	(8, '\\core\\event\\user_login_failed', 'core', 'failed', 'user_login', NULL, NULL, 'r', 0, 2, 10, 0, 0, 0, NULL, 0, 'a:2:{s:8:"username";s:11:"00110115309";s:6:"reason";i:1;}', 1475526591, 'web', '127.0.0.1', NULL),
	(9, '\\core\\event\\user_login_failed', 'core', 'failed', 'user_login', NULL, NULL, 'r', 0, 2, 10, 0, 0, 0, NULL, 0, 'a:2:{s:8:"username";s:11:"00110115309";s:6:"reason";i:1;}', 1475526604, 'web', '127.0.0.1', NULL),
	(10, '\\core\\event\\user_created', 'core', 'created', 'user', 'user', 3, 'c', 0, 27, 30, 3, 2, 0, 3, 0, 'N;', 1475526711, 'web', '127.0.0.1', NULL),
	(11, '\\core\\event\\user_created', 'core', 'created', 'user', 'user', 4, 'c', 0, 28, 30, 4, 2, 0, 4, 0, 'N;', 1475526764, 'web', '127.0.0.1', NULL),
	(12, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 4, 'r', 0, 28, 30, 4, 2, 0, 4, 0, 'N;', 1475526769, 'web', '127.0.0.1', NULL),
	(13, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 3, 50, 1, 2, 1, NULL, 0, 'N;', 1475526808, 'web', '127.0.0.1', NULL),
	(14, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 3, 50, 1, 2, 1, NULL, 0, 'N;', 1475526814, 'web', '127.0.0.1', NULL),
	(15, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 3, 50, 1, 2, 1, NULL, 0, 'N;', 1475527037, 'web', '127.0.0.1', NULL),
	(16, '\\core\\event\\course_category_updated', 'core', 'updated', 'course_category', 'course_categories', 1, 'u', 0, 4, 40, 1, 2, 0, NULL, 0, 'N;', 1475527070, 'web', '127.0.0.1', NULL),
	(17, '\\core\\event\\course_category_created', 'core', 'created', 'course_category', 'course_categories', 2, 'c', 0, 30, 40, 2, 2, 0, NULL, 0, 'N;', 1475527087, 'web', '127.0.0.1', NULL),
	(18, '\\core\\event\\course_created', 'core', 'created', 'course', 'course', 2, 'c', 1, 31, 50, 2, 2, 2, NULL, 0, 'a:2:{s:9:"shortname";s:15:"2015 - Modulo I";s:8:"fullname";s:38:"MÓDULO I – DESENVOLVIMENTO INFANTIL";}', 1475527125, 'web', '127.0.0.1', NULL),
	(19, '\\core\\event\\enrol_instance_created', 'core', 'created', 'enrol_instance', 'enrol', 1, 'c', 0, 31, 50, 2, 2, 2, NULL, 0, 'a:1:{s:5:"enrol";s:6:"manual";}', 1475527125, 'web', '127.0.0.1', NULL),
	(20, '\\core\\event\\enrol_instance_created', 'core', 'created', 'enrol_instance', 'enrol', 2, 'c', 0, 31, 50, 2, 2, 2, NULL, 0, 'a:1:{s:5:"enrol";s:5:"guest";}', 1475527125, 'web', '127.0.0.1', NULL),
	(21, '\\core\\event\\enrol_instance_created', 'core', 'created', 'enrol_instance', 'enrol', 3, 'c', 0, 31, 50, 2, 2, 2, NULL, 0, 'a:1:{s:5:"enrol";s:4:"self";}', 1475527125, 'web', '127.0.0.1', NULL),
	(22, '\\core\\event\\course_created', 'core', 'created', 'course', 'course', 3, 'c', 1, 36, 50, 3, 2, 3, NULL, 0, 'a:2:{s:9:"shortname";s:15:"2016 - Modulo I";s:8:"fullname";s:38:"MÓDULO I – DESENVOLVIMENTO INFANTIL";}', 1475527158, 'web', '127.0.0.1', NULL),
	(23, '\\core\\event\\enrol_instance_created', 'core', 'created', 'enrol_instance', 'enrol', 4, 'c', 0, 36, 50, 3, 2, 3, NULL, 0, 'a:1:{s:5:"enrol";s:6:"manual";}', 1475527159, 'web', '127.0.0.1', NULL),
	(24, '\\core\\event\\enrol_instance_created', 'core', 'created', 'enrol_instance', 'enrol', 5, 'c', 0, 36, 50, 3, 2, 3, NULL, 0, 'a:1:{s:5:"enrol";s:5:"guest";}', 1475527159, 'web', '127.0.0.1', NULL),
	(25, '\\core\\event\\enrol_instance_created', 'core', 'created', 'enrol_instance', 'enrol', 6, 'c', 0, 36, 50, 3, 2, 3, NULL, 0, 'a:1:{s:5:"enrol";s:4:"self";}', 1475527159, 'web', '127.0.0.1', NULL),
	(26, '\\core\\event\\course_created', 'core', 'created', 'course', 'course', 4, 'c', 1, 41, 50, 4, 2, 4, NULL, 0, 'a:2:{s:9:"shortname";s:16:"2016 - Modulo II";s:8:"fullname";s:53:"MÓDULO II - EIXO CURRICULAR LINGUAGEM ORAL E ESCRITA";}', 1475527202, 'web', '127.0.0.1', NULL),
	(27, '\\core\\event\\enrol_instance_created', 'core', 'created', 'enrol_instance', 'enrol', 7, 'c', 0, 41, 50, 4, 2, 4, NULL, 0, 'a:1:{s:5:"enrol";s:6:"manual";}', 1475527203, 'web', '127.0.0.1', NULL),
	(28, '\\core\\event\\enrol_instance_created', 'core', 'created', 'enrol_instance', 'enrol', 8, 'c', 0, 41, 50, 4, 2, 4, NULL, 0, 'a:1:{s:5:"enrol";s:5:"guest";}', 1475527203, 'web', '127.0.0.1', NULL),
	(29, '\\core\\event\\enrol_instance_created', 'core', 'created', 'enrol_instance', 'enrol', 9, 'c', 0, 41, 50, 4, 2, 4, NULL, 0, 'a:1:{s:5:"enrol";s:4:"self";}', 1475527203, 'web', '127.0.0.1', NULL),
	(30, '\\core\\event\\course_created', 'core', 'created', 'course', 'course', 5, 'c', 1, 46, 50, 5, 2, 5, NULL, 0, 'a:2:{s:9:"shortname";s:17:"2016 - Modulo III";s:8:"fullname";s:50:"MÓDULO III- A LUDICIDADE COMO PRINCIPIO ESTÉTICO";}', 1475527251, 'web', '127.0.0.1', NULL),
	(31, '\\core\\event\\enrol_instance_created', 'core', 'created', 'enrol_instance', 'enrol', 10, 'c', 0, 46, 50, 5, 2, 5, NULL, 0, 'a:1:{s:5:"enrol";s:6:"manual";}', 1475527251, 'web', '127.0.0.1', NULL),
	(32, '\\core\\event\\enrol_instance_created', 'core', 'created', 'enrol_instance', 'enrol', 11, 'c', 0, 46, 50, 5, 2, 5, NULL, 0, 'a:1:{s:5:"enrol";s:5:"guest";}', 1475527251, 'web', '127.0.0.1', NULL),
	(33, '\\core\\event\\enrol_instance_created', 'core', 'created', 'enrol_instance', 'enrol', 12, 'c', 0, 46, 50, 5, 2, 5, NULL, 0, 'a:1:{s:5:"enrol";s:4:"self";}', 1475527251, 'web', '127.0.0.1', NULL),
	(34, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 3, 'r', 0, 2, 10, 0, 3, 0, NULL, 0, 'a:1:{s:8:"username";s:11:"00110115309";}', 1475527269, 'web', '127.0.0.1', NULL),
	(35, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 3, 50, 1, 3, 1, NULL, 0, 'N;', 1475527269, 'web', '127.0.0.1', NULL),
	(36, '\\core\\event\\user_enrolment_created', 'core', 'created', 'user_enrolment', 'user_enrolments', 1, 'c', 0, 31, 50, 2, 2, 2, 3, 0, 'a:1:{s:5:"enrol";s:6:"manual";}', 1475527314, 'web', '127.0.0.1', NULL),
	(37, '\\core\\event\\role_assigned', 'core', 'assigned', 'role', 'role', 5, 'c', 0, 31, 50, 2, 2, 2, 3, 0, 'a:3:{s:2:"id";i:1;s:9:"component";s:0:"";s:6:"itemid";i:0;}', 1475527314, 'web', '127.0.0.1', NULL),
	(38, '\\core\\event\\user_enrolment_created', 'core', 'created', 'user_enrolment', 'user_enrolments', 2, 'c', 0, 31, 50, 2, 2, 2, 4, 0, 'a:1:{s:5:"enrol";s:6:"manual";}', 1475527315, 'web', '127.0.0.1', NULL),
	(39, '\\core\\event\\role_assigned', 'core', 'assigned', 'role', 'role', 5, 'c', 0, 31, 50, 2, 2, 2, 4, 0, 'a:3:{s:2:"id";i:2;s:9:"component";s:0:"";s:6:"itemid";i:0;}', 1475527315, 'web', '127.0.0.1', NULL),
	(40, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 36, 50, 3, 2, 3, NULL, 0, 'N;', 1475527327, 'web', '127.0.0.1', NULL),
	(41, '\\core\\event\\user_enrolment_created', 'core', 'created', 'user_enrolment', 'user_enrolments', 3, 'c', 0, 36, 50, 3, 2, 3, 3, 0, 'a:1:{s:5:"enrol";s:6:"manual";}', 1475527350, 'web', '127.0.0.1', NULL),
	(42, '\\core\\event\\role_assigned', 'core', 'assigned', 'role', 'role', 5, 'c', 0, 36, 50, 3, 2, 3, 3, 0, 'a:3:{s:2:"id";i:3;s:9:"component";s:0:"";s:6:"itemid";i:0;}', 1475527350, 'web', '127.0.0.1', NULL),
	(43, '\\core\\event\\user_enrolment_created', 'core', 'created', 'user_enrolment', 'user_enrolments', 4, 'c', 0, 36, 50, 3, 2, 3, 4, 0, 'a:1:{s:5:"enrol";s:6:"manual";}', 1475527352, 'web', '127.0.0.1', NULL),
	(44, '\\core\\event\\role_assigned', 'core', 'assigned', 'role', 'role', 5, 'c', 0, 36, 50, 3, 2, 3, 4, 0, 'a:3:{s:2:"id";i:4;s:9:"component";s:0:"";s:6:"itemid";i:0;}', 1475527352, 'web', '127.0.0.1', NULL),
	(45, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 41, 50, 4, 2, 4, NULL, 0, 'N;', 1475527362, 'web', '127.0.0.1', NULL),
	(46, '\\core\\event\\user_enrolment_created', 'core', 'created', 'user_enrolment', 'user_enrolments', 5, 'c', 0, 41, 50, 4, 2, 4, 4, 0, 'a:1:{s:5:"enrol";s:6:"manual";}', 1475527371, 'web', '127.0.0.1', NULL),
	(47, '\\core\\event\\role_assigned', 'core', 'assigned', 'role', 'role', 5, 'c', 0, 41, 50, 4, 2, 4, 4, 0, 'a:3:{s:2:"id";i:5;s:9:"component";s:0:"";s:6:"itemid";i:0;}', 1475527371, 'web', '127.0.0.1', NULL),
	(48, '\\core\\event\\user_enrolment_created', 'core', 'created', 'user_enrolment', 'user_enrolments', 6, 'c', 0, 41, 50, 4, 2, 4, 3, 0, 'a:1:{s:5:"enrol";s:6:"manual";}', 1475527372, 'web', '127.0.0.1', NULL),
	(49, '\\core\\event\\role_assigned', 'core', 'assigned', 'role', 'role', 5, 'c', 0, 41, 50, 4, 2, 4, 3, 0, 'a:3:{s:2:"id";i:6;s:9:"component";s:0:"";s:6:"itemid";i:0;}', 1475527372, 'web', '127.0.0.1', NULL),
	(50, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 36, 50, 3, 2, 3, NULL, 0, 'N;', 1475527387, 'web', '127.0.0.1', NULL),
	(51, '\\core\\event\\course_section_updated', 'core', 'updated', 'course_section', 'course_sections', 7, 'u', 1, 36, 50, 3, 2, 3, NULL, 0, 'a:1:{s:10:"sectionnum";s:1:"1";}', 1475527406, 'web', '127.0.0.1', NULL),
	(52, '\\core\\event\\course_section_updated', 'core', 'updated', 'course_section', 'course_sections', 8, 'u', 1, 36, 50, 3, 2, 3, NULL, 0, 'a:1:{s:10:"sectionnum";s:1:"2";}', 1475527414, 'web', '127.0.0.1', NULL),
	(53, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 41, 50, 4, 2, 4, NULL, 0, 'N;', 1475527421, 'web', '127.0.0.1', NULL),
	(54, '\\core\\event\\course_section_updated', 'core', 'updated', 'course_section', 'course_sections', 9, 'u', 1, 41, 50, 4, 2, 4, NULL, 0, 'a:1:{s:10:"sectionnum";s:1:"1";}', 1475527428, 'web', '127.0.0.1', NULL),
	(55, '\\core\\event\\course_section_updated', 'core', 'updated', 'course_section', 'course_sections', 10, 'u', 1, 41, 50, 4, 2, 4, NULL, 0, 'a:1:{s:10:"sectionnum";s:1:"2";}', 1475527437, 'web', '127.0.0.1', NULL),
	(56, '\\core\\event\\course_section_updated', 'core', 'updated', 'course_section', 'course_sections', 11, 'u', 1, 41, 50, 4, 2, 4, NULL, 0, 'a:1:{s:10:"sectionnum";s:1:"3";}', 1475527446, 'web', '127.0.0.1', NULL),
	(57, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 46, 50, 5, 2, 5, NULL, 0, 'N;', 1475527452, 'web', '127.0.0.1', NULL),
	(58, '\\core\\event\\course_section_updated', 'core', 'updated', 'course_section', 'course_sections', 12, 'u', 1, 46, 50, 5, 2, 5, NULL, 0, 'a:1:{s:10:"sectionnum";s:1:"1";}', 1475527458, 'web', '127.0.0.1', NULL),
	(59, '\\core\\event\\course_section_updated', 'core', 'updated', 'course_section', 'course_sections', 13, 'u', 1, 46, 50, 5, 2, 5, NULL, 0, 'a:1:{s:10:"sectionnum";s:1:"2";}', 1475527465, 'web', '127.0.0.1', NULL),
	(60, '\\core\\event\\course_section_updated', 'core', 'updated', 'course_section', 'course_sections', 14, 'u', 1, 46, 50, 5, 2, 5, NULL, 0, 'a:1:{s:10:"sectionnum";s:1:"3";}', 1475527477, 'web', '127.0.0.1', NULL),
	(61, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 3, 50, 1, 3, 1, NULL, 0, 'N;', 1475527490, 'web', '127.0.0.1', NULL),
	(62, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 36, 50, 3, 3, 3, NULL, 0, 'N;', 1475527495, 'web', '127.0.0.1', NULL),
	(63, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 36, 50, 3, 2, 3, NULL, 0, 'N;', 1475527504, 'web', '127.0.0.1', NULL),
	(64, '\\core\\event\\course_module_created', 'core', 'created', 'course_module', 'course_modules', 4, 'c', 1, 54, 70, 4, 2, 3, NULL, 0, 'a:3:{s:10:"modulename";s:5:"forum";s:10:"instanceid";i:4;s:4:"name";s:8:"Fórum A";}', 1475527533, 'web', '127.0.0.1', NULL),
	(65, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 36, 50, 3, 2, 3, NULL, 0, 'N;', 1475527534, 'web', '127.0.0.1', NULL),
	(66, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 36, 50, 3, 3, 3, NULL, 0, 'N;', 1475527535, 'web', '127.0.0.1', NULL),
	(67, '\\core\\event\\course_module_created', 'core', 'created', 'course_module', 'course_modules', 5, 'c', 1, 55, 70, 5, 2, 3, NULL, 0, 'a:3:{s:10:"modulename";s:8:"workshop";s:10:"instanceid";i:1;s:4:"name";s:29:"Laboratório de Avaliação A";}', 1475527593, 'web', '127.0.0.1', NULL),
	(68, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 36, 50, 3, 2, 3, NULL, 0, 'N;', 1475527594, 'web', '127.0.0.1', NULL),
	(69, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 36, 50, 3, 3, 3, NULL, 0, 'N;', 1475527595, 'web', '127.0.0.1', NULL),
	(70, '\\core\\event\\course_module_created', 'core', 'created', 'course_module', 'course_modules', 6, 'c', 1, 56, 70, 6, 2, 3, NULL, 0, 'a:3:{s:10:"modulename";s:5:"forum";s:10:"instanceid";i:5;s:4:"name";s:8:"Fórum B";}', 1475527634, 'web', '127.0.0.1', NULL),
	(71, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 36, 50, 3, 2, 3, NULL, 0, 'N;', 1475527635, 'web', '127.0.0.1', NULL),
	(72, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 36, 50, 3, 3, 3, NULL, 0, 'N;', 1475527636, 'web', '127.0.0.1', NULL),
	(73, '\\core\\event\\course_module_created', 'core', 'created', 'course_module', 'course_modules', 7, 'c', 1, 57, 70, 7, 2, 3, NULL, 0, 'a:3:{s:10:"modulename";s:5:"forum";s:10:"instanceid";i:6;s:4:"name";s:8:"Fórum C";}', 1475527655, 'web', '127.0.0.1', NULL),
	(74, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 36, 50, 3, 2, 3, NULL, 0, 'N;', 1475527656, 'web', '127.0.0.1', NULL),
	(75, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 36, 50, 3, 3, 3, NULL, 0, 'N;', 1475527659, 'web', '127.0.0.1', NULL),
	(76, '\\core\\event\\calendar_event_created', 'core', 'created', 'calendar_event', 'event', 1, 'c', 0, 36, 50, 3, 2, 3, NULL, 0, 'a:3:{s:8:"repeatid";i:0;s:9:"timestart";i:1475527500;s:4:"name";s:6:"Chat A";}', 1475527682, 'web', '127.0.0.1', NULL),
	(77, '\\core\\event\\course_module_created', 'core', 'created', 'course_module', 'course_modules', 8, 'c', 1, 58, 70, 8, 2, 3, NULL, 0, 'a:3:{s:10:"modulename";s:4:"chat";s:10:"instanceid";i:1;s:4:"name";s:6:"Chat A";}', 1475527682, 'web', '127.0.0.1', NULL),
	(78, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 36, 50, 3, 2, 3, NULL, 0, 'N;', 1475527682, 'web', '127.0.0.1', NULL),
	(79, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 36, 50, 3, 3, 3, NULL, 0, 'N;', 1475527685, 'web', '127.0.0.1', NULL),
	(80, '\\tool_recyclebin\\event\\course_bin_item_created', 'tool_recyclebin', 'created', 'course_bin_item', 'tool_recyclebin_course', 1, 'c', 0, 36, 50, 3, 2, 3, NULL, 0, 'N;', 1475527701, 'web', '127.0.0.1', NULL),
	(81, '\\core\\event\\course_module_deleted', 'core', 'deleted', 'course_module', 'course_modules', 1, 'd', 1, 51, 70, 1, 2, 3, NULL, 0, 'a:2:{s:10:"modulename";s:5:"forum";s:10:"instanceid";s:1:"1";}', 1475527701, 'web', '127.0.0.1', NULL),
	(82, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 36, 50, 3, 3, 3, NULL, 0, 'N;', 1475527705, 'web', '127.0.0.1', NULL),
	(83, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 36, 50, 3, 3, 3, NULL, 0, 'N;', 1475527707, 'web', '127.0.0.1', NULL),
	(84, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 36, 50, 3, 3, 3, NULL, 0, 'N;', 1475527710, 'web', '127.0.0.1', NULL),
	(85, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 2, 'r', 0, 6, 30, 2, 2, 0, 2, 0, 'N;', 1475527766, 'web', '127.0.0.1', NULL),
	(86, '\\core\\event\\user_password_updated', 'core', 'updated', 'user_password', NULL, NULL, 'u', 0, 6, 30, 2, 2, 0, 2, 0, 'a:1:{s:14:"forgottenreset";b:0;}', 1475527786, 'web', '127.0.0.1', NULL),
	(87, '\\core\\event\\user_updated', 'core', 'updated', 'user', 'user', 2, 'u', 0, 6, 30, 2, 2, 0, 2, 0, 'N;', 1475527786, 'web', '127.0.0.1', NULL),
	(88, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 2, 'r', 0, 6, 30, 2, 2, 0, 2, 0, 'N;', 1475527786, 'web', '127.0.0.1', NULL),
	(89, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 3, 50, 1, 2, 1, NULL, 0, 'N;', 1475528233, 'web', '127.0.0.1', NULL),
	(90, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 36, 50, 3, 2, 3, NULL, 0, 'N;', 1475528237, 'web', '127.0.0.1', NULL),
	(91, '\\mod_forum\\event\\course_module_viewed', 'mod_forum', 'viewed', 'course_module', 'forum', 4, 'r', 2, 54, 70, 4, 2, 3, NULL, 0, 'N;', 1475528238, 'web', '127.0.0.1', NULL);
/*!40000 ALTER TABLE `mdl_logstore_standard_log` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_log_display
CREATE TABLE IF NOT EXISTS `mdl_log_display` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mtable` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `field` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_logdisp_modact_uix` (`module`,`action`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For a particular module/action, specifies a moodle table/fie';

-- Copiando dados para a tabela capacitacoes.mdl_log_display: ~189 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_log_display` DISABLE KEYS */;
INSERT INTO `mdl_log_display` (`id`, `module`, `action`, `mtable`, `field`, `component`) VALUES
	(1, 'course', 'user report', 'user', 'CONCAT(firstname, \' \', lastname)', 'moodle'),
	(2, 'course', 'view', 'course', 'fullname', 'moodle'),
	(3, 'course', 'view section', 'course_sections', 'name', 'moodle'),
	(4, 'course', 'update', 'course', 'fullname', 'moodle'),
	(5, 'course', 'hide', 'course', 'fullname', 'moodle'),
	(6, 'course', 'show', 'course', 'fullname', 'moodle'),
	(7, 'course', 'move', 'course', 'fullname', 'moodle'),
	(8, 'course', 'enrol', 'course', 'fullname', 'moodle'),
	(9, 'course', 'unenrol', 'course', 'fullname', 'moodle'),
	(10, 'course', 'report log', 'course', 'fullname', 'moodle'),
	(11, 'course', 'report live', 'course', 'fullname', 'moodle'),
	(12, 'course', 'report outline', 'course', 'fullname', 'moodle'),
	(13, 'course', 'report participation', 'course', 'fullname', 'moodle'),
	(14, 'course', 'report stats', 'course', 'fullname', 'moodle'),
	(15, 'category', 'add', 'course_categories', 'name', 'moodle'),
	(16, 'category', 'hide', 'course_categories', 'name', 'moodle'),
	(17, 'category', 'move', 'course_categories', 'name', 'moodle'),
	(18, 'category', 'show', 'course_categories', 'name', 'moodle'),
	(19, 'category', 'update', 'course_categories', 'name', 'moodle'),
	(20, 'message', 'write', 'user', 'CONCAT(firstname, \' \', lastname)', 'moodle'),
	(21, 'message', 'read', 'user', 'CONCAT(firstname, \' \', lastname)', 'moodle'),
	(22, 'message', 'add contact', 'user', 'CONCAT(firstname, \' \', lastname)', 'moodle'),
	(23, 'message', 'remove contact', 'user', 'CONCAT(firstname, \' \', lastname)', 'moodle'),
	(24, 'message', 'block contact', 'user', 'CONCAT(firstname, \' \', lastname)', 'moodle'),
	(25, 'message', 'unblock contact', 'user', 'CONCAT(firstname, \' \', lastname)', 'moodle'),
	(26, 'group', 'view', 'groups', 'name', 'moodle'),
	(27, 'tag', 'update', 'tag', 'name', 'moodle'),
	(28, 'tag', 'flag', 'tag', 'name', 'moodle'),
	(29, 'user', 'view', 'user', 'CONCAT(firstname, \' \', lastname)', 'moodle'),
	(30, 'assign', 'add', 'assign', 'name', 'mod_assign'),
	(31, 'assign', 'delete mod', 'assign', 'name', 'mod_assign'),
	(32, 'assign', 'download all submissions', 'assign', 'name', 'mod_assign'),
	(33, 'assign', 'grade submission', 'assign', 'name', 'mod_assign'),
	(34, 'assign', 'lock submission', 'assign', 'name', 'mod_assign'),
	(35, 'assign', 'reveal identities', 'assign', 'name', 'mod_assign'),
	(36, 'assign', 'revert submission to draft', 'assign', 'name', 'mod_assign'),
	(37, 'assign', 'set marking workflow state', 'assign', 'name', 'mod_assign'),
	(38, 'assign', 'submission statement accepted', 'assign', 'name', 'mod_assign'),
	(39, 'assign', 'submit', 'assign', 'name', 'mod_assign'),
	(40, 'assign', 'submit for grading', 'assign', 'name', 'mod_assign'),
	(41, 'assign', 'unlock submission', 'assign', 'name', 'mod_assign'),
	(42, 'assign', 'update', 'assign', 'name', 'mod_assign'),
	(43, 'assign', 'upload', 'assign', 'name', 'mod_assign'),
	(44, 'assign', 'view', 'assign', 'name', 'mod_assign'),
	(45, 'assign', 'view all', 'course', 'fullname', 'mod_assign'),
	(46, 'assign', 'view confirm submit assignment form', 'assign', 'name', 'mod_assign'),
	(47, 'assign', 'view grading form', 'assign', 'name', 'mod_assign'),
	(48, 'assign', 'view submission', 'assign', 'name', 'mod_assign'),
	(49, 'assign', 'view submission grading table', 'assign', 'name', 'mod_assign'),
	(50, 'assign', 'view submit assignment form', 'assign', 'name', 'mod_assign'),
	(51, 'assign', 'view feedback', 'assign', 'name', 'mod_assign'),
	(52, 'assign', 'view batch set marking workflow state', 'assign', 'name', 'mod_assign'),
	(53, 'assignment', 'view', 'assignment', 'name', 'mod_assignment'),
	(54, 'assignment', 'add', 'assignment', 'name', 'mod_assignment'),
	(55, 'assignment', 'update', 'assignment', 'name', 'mod_assignment'),
	(56, 'assignment', 'view submission', 'assignment', 'name', 'mod_assignment'),
	(57, 'assignment', 'upload', 'assignment', 'name', 'mod_assignment'),
	(58, 'book', 'add', 'book', 'name', 'mod_book'),
	(59, 'book', 'update', 'book', 'name', 'mod_book'),
	(60, 'book', 'view', 'book', 'name', 'mod_book'),
	(61, 'book', 'add chapter', 'book_chapters', 'title', 'mod_book'),
	(62, 'book', 'update chapter', 'book_chapters', 'title', 'mod_book'),
	(63, 'book', 'view chapter', 'book_chapters', 'title', 'mod_book'),
	(64, 'chat', 'view', 'chat', 'name', 'mod_chat'),
	(65, 'chat', 'add', 'chat', 'name', 'mod_chat'),
	(66, 'chat', 'update', 'chat', 'name', 'mod_chat'),
	(67, 'chat', 'report', 'chat', 'name', 'mod_chat'),
	(68, 'chat', 'talk', 'chat', 'name', 'mod_chat'),
	(69, 'choice', 'view', 'choice', 'name', 'mod_choice'),
	(70, 'choice', 'update', 'choice', 'name', 'mod_choice'),
	(71, 'choice', 'add', 'choice', 'name', 'mod_choice'),
	(72, 'choice', 'report', 'choice', 'name', 'mod_choice'),
	(73, 'choice', 'choose', 'choice', 'name', 'mod_choice'),
	(74, 'choice', 'choose again', 'choice', 'name', 'mod_choice'),
	(75, 'data', 'view', 'data', 'name', 'mod_data'),
	(76, 'data', 'add', 'data', 'name', 'mod_data'),
	(77, 'data', 'update', 'data', 'name', 'mod_data'),
	(78, 'data', 'record delete', 'data', 'name', 'mod_data'),
	(79, 'data', 'fields add', 'data_fields', 'name', 'mod_data'),
	(80, 'data', 'fields update', 'data_fields', 'name', 'mod_data'),
	(81, 'data', 'templates saved', 'data', 'name', 'mod_data'),
	(82, 'data', 'templates def', 'data', 'name', 'mod_data'),
	(83, 'feedback', 'startcomplete', 'feedback', 'name', 'mod_feedback'),
	(84, 'feedback', 'submit', 'feedback', 'name', 'mod_feedback'),
	(85, 'feedback', 'delete', 'feedback', 'name', 'mod_feedback'),
	(86, 'feedback', 'view', 'feedback', 'name', 'mod_feedback'),
	(87, 'feedback', 'view all', 'course', 'shortname', 'mod_feedback'),
	(88, 'folder', 'view', 'folder', 'name', 'mod_folder'),
	(89, 'folder', 'view all', 'folder', 'name', 'mod_folder'),
	(90, 'folder', 'update', 'folder', 'name', 'mod_folder'),
	(91, 'folder', 'add', 'folder', 'name', 'mod_folder'),
	(92, 'forum', 'add', 'forum', 'name', 'mod_forum'),
	(93, 'forum', 'update', 'forum', 'name', 'mod_forum'),
	(94, 'forum', 'add discussion', 'forum_discussions', 'name', 'mod_forum'),
	(95, 'forum', 'add post', 'forum_posts', 'subject', 'mod_forum'),
	(96, 'forum', 'update post', 'forum_posts', 'subject', 'mod_forum'),
	(97, 'forum', 'user report', 'user', 'CONCAT(firstname, \' \', lastname)', 'mod_forum'),
	(98, 'forum', 'move discussion', 'forum_discussions', 'name', 'mod_forum'),
	(99, 'forum', 'view subscribers', 'forum', 'name', 'mod_forum'),
	(100, 'forum', 'view discussion', 'forum_discussions', 'name', 'mod_forum'),
	(101, 'forum', 'view forum', 'forum', 'name', 'mod_forum'),
	(102, 'forum', 'subscribe', 'forum', 'name', 'mod_forum'),
	(103, 'forum', 'unsubscribe', 'forum', 'name', 'mod_forum'),
	(104, 'forum', 'pin discussion', 'forum_discussions', 'name', 'mod_forum'),
	(105, 'forum', 'unpin discussion', 'forum_discussions', 'name', 'mod_forum'),
	(106, 'glossary', 'add', 'glossary', 'name', 'mod_glossary'),
	(107, 'glossary', 'update', 'glossary', 'name', 'mod_glossary'),
	(108, 'glossary', 'view', 'glossary', 'name', 'mod_glossary'),
	(109, 'glossary', 'view all', 'glossary', 'name', 'mod_glossary'),
	(110, 'glossary', 'add entry', 'glossary', 'name', 'mod_glossary'),
	(111, 'glossary', 'update entry', 'glossary', 'name', 'mod_glossary'),
	(112, 'glossary', 'add category', 'glossary', 'name', 'mod_glossary'),
	(113, 'glossary', 'update category', 'glossary', 'name', 'mod_glossary'),
	(114, 'glossary', 'delete category', 'glossary', 'name', 'mod_glossary'),
	(115, 'glossary', 'approve entry', 'glossary', 'name', 'mod_glossary'),
	(116, 'glossary', 'disapprove entry', 'glossary', 'name', 'mod_glossary'),
	(117, 'glossary', 'view entry', 'glossary_entries', 'concept', 'mod_glossary'),
	(118, 'imscp', 'view', 'imscp', 'name', 'mod_imscp'),
	(119, 'imscp', 'view all', 'imscp', 'name', 'mod_imscp'),
	(120, 'imscp', 'update', 'imscp', 'name', 'mod_imscp'),
	(121, 'imscp', 'add', 'imscp', 'name', 'mod_imscp'),
	(122, 'label', 'add', 'label', 'name', 'mod_label'),
	(123, 'label', 'update', 'label', 'name', 'mod_label'),
	(124, 'lesson', 'start', 'lesson', 'name', 'mod_lesson'),
	(125, 'lesson', 'end', 'lesson', 'name', 'mod_lesson'),
	(126, 'lesson', 'view', 'lesson_pages', 'title', 'mod_lesson'),
	(127, 'lti', 'view', 'lti', 'name', 'mod_lti'),
	(128, 'lti', 'launch', 'lti', 'name', 'mod_lti'),
	(129, 'lti', 'view all', 'lti', 'name', 'mod_lti'),
	(130, 'page', 'view', 'page', 'name', 'mod_page'),
	(131, 'page', 'view all', 'page', 'name', 'mod_page'),
	(132, 'page', 'update', 'page', 'name', 'mod_page'),
	(133, 'page', 'add', 'page', 'name', 'mod_page'),
	(134, 'quiz', 'add', 'quiz', 'name', 'mod_quiz'),
	(135, 'quiz', 'update', 'quiz', 'name', 'mod_quiz'),
	(136, 'quiz', 'view', 'quiz', 'name', 'mod_quiz'),
	(137, 'quiz', 'report', 'quiz', 'name', 'mod_quiz'),
	(138, 'quiz', 'attempt', 'quiz', 'name', 'mod_quiz'),
	(139, 'quiz', 'submit', 'quiz', 'name', 'mod_quiz'),
	(140, 'quiz', 'review', 'quiz', 'name', 'mod_quiz'),
	(141, 'quiz', 'editquestions', 'quiz', 'name', 'mod_quiz'),
	(142, 'quiz', 'preview', 'quiz', 'name', 'mod_quiz'),
	(143, 'quiz', 'start attempt', 'quiz', 'name', 'mod_quiz'),
	(144, 'quiz', 'close attempt', 'quiz', 'name', 'mod_quiz'),
	(145, 'quiz', 'continue attempt', 'quiz', 'name', 'mod_quiz'),
	(146, 'quiz', 'edit override', 'quiz', 'name', 'mod_quiz'),
	(147, 'quiz', 'delete override', 'quiz', 'name', 'mod_quiz'),
	(148, 'quiz', 'view summary', 'quiz', 'name', 'mod_quiz'),
	(149, 'resource', 'view', 'resource', 'name', 'mod_resource'),
	(150, 'resource', 'view all', 'resource', 'name', 'mod_resource'),
	(151, 'resource', 'update', 'resource', 'name', 'mod_resource'),
	(152, 'resource', 'add', 'resource', 'name', 'mod_resource'),
	(153, 'scorm', 'view', 'scorm', 'name', 'mod_scorm'),
	(154, 'scorm', 'review', 'scorm', 'name', 'mod_scorm'),
	(155, 'scorm', 'update', 'scorm', 'name', 'mod_scorm'),
	(156, 'scorm', 'add', 'scorm', 'name', 'mod_scorm'),
	(157, 'survey', 'add', 'survey', 'name', 'mod_survey'),
	(158, 'survey', 'update', 'survey', 'name', 'mod_survey'),
	(159, 'survey', 'download', 'survey', 'name', 'mod_survey'),
	(160, 'survey', 'view form', 'survey', 'name', 'mod_survey'),
	(161, 'survey', 'view graph', 'survey', 'name', 'mod_survey'),
	(162, 'survey', 'view report', 'survey', 'name', 'mod_survey'),
	(163, 'survey', 'submit', 'survey', 'name', 'mod_survey'),
	(164, 'url', 'view', 'url', 'name', 'mod_url'),
	(165, 'url', 'view all', 'url', 'name', 'mod_url'),
	(166, 'url', 'update', 'url', 'name', 'mod_url'),
	(167, 'url', 'add', 'url', 'name', 'mod_url'),
	(168, 'workshop', 'add', 'workshop', 'name', 'mod_workshop'),
	(169, 'workshop', 'update', 'workshop', 'name', 'mod_workshop'),
	(170, 'workshop', 'view', 'workshop', 'name', 'mod_workshop'),
	(171, 'workshop', 'view all', 'workshop', 'name', 'mod_workshop'),
	(172, 'workshop', 'add submission', 'workshop_submissions', 'title', 'mod_workshop'),
	(173, 'workshop', 'update submission', 'workshop_submissions', 'title', 'mod_workshop'),
	(174, 'workshop', 'view submission', 'workshop_submissions', 'title', 'mod_workshop'),
	(175, 'workshop', 'add assessment', 'workshop_submissions', 'title', 'mod_workshop'),
	(176, 'workshop', 'update assessment', 'workshop_submissions', 'title', 'mod_workshop'),
	(177, 'workshop', 'add example', 'workshop_submissions', 'title', 'mod_workshop'),
	(178, 'workshop', 'update example', 'workshop_submissions', 'title', 'mod_workshop'),
	(179, 'workshop', 'view example', 'workshop_submissions', 'title', 'mod_workshop'),
	(180, 'workshop', 'add reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
	(181, 'workshop', 'update reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
	(182, 'workshop', 'add example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
	(183, 'workshop', 'update example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
	(184, 'workshop', 'update aggregate grades', 'workshop', 'name', 'mod_workshop'),
	(185, 'workshop', 'update clear aggregated grades', 'workshop', 'name', 'mod_workshop'),
	(186, 'workshop', 'update clear assessments', 'workshop', 'name', 'mod_workshop'),
	(187, 'book', 'exportimscp', 'book', 'name', 'booktool_exportimscp'),
	(188, 'book', 'print', 'book', 'name', 'booktool_print'),
	(189, 'book', 'print chapter', 'book_chapters', 'title', 'booktool_print');
/*!40000 ALTER TABLE `mdl_log_display` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_log_queries
CREATE TABLE IF NOT EXISTS `mdl_log_queries` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `qtype` mediumint(5) NOT NULL,
  `sqltext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sqlparams` longtext COLLATE utf8_unicode_ci,
  `error` mediumint(5) NOT NULL DEFAULT '0',
  `info` longtext COLLATE utf8_unicode_ci,
  `backtrace` longtext COLLATE utf8_unicode_ci,
  `exectime` decimal(10,5) NOT NULL,
  `timelogged` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Logged database queries.';

-- Copiando dados para a tabela capacitacoes.mdl_log_queries: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_log_queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_log_queries` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_lti
CREATE TABLE IF NOT EXISTS `mdl_lti` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `typeid` bigint(10) DEFAULT NULL,
  `toolurl` longtext COLLATE utf8_unicode_ci NOT NULL,
  `securetoolurl` longtext COLLATE utf8_unicode_ci,
  `instructorchoicesendname` tinyint(1) DEFAULT NULL,
  `instructorchoicesendemailaddr` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowroster` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowsetting` tinyint(1) DEFAULT NULL,
  `instructorcustomparameters` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructorchoiceacceptgrades` tinyint(1) DEFAULT NULL,
  `grade` bigint(10) NOT NULL DEFAULT '100',
  `launchcontainer` tinyint(2) NOT NULL DEFAULT '1',
  `resourcekey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `debuglaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showtitlelaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showdescriptionlaunch` tinyint(1) NOT NULL DEFAULT '0',
  `servicesalt` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` longtext COLLATE utf8_unicode_ci,
  `secureicon` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_lti_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains Basic LTI activities instances';

-- Copiando dados para a tabela capacitacoes.mdl_lti: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_lti` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_lti_submission
CREATE TABLE IF NOT EXISTS `mdl_lti_submission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `ltiid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datesubmitted` bigint(10) NOT NULL,
  `dateupdated` bigint(10) NOT NULL,
  `gradepercent` decimal(10,5) NOT NULL,
  `originalgrade` decimal(10,5) NOT NULL,
  `launchid` bigint(10) NOT NULL,
  `state` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltisubm_lti_ix` (`ltiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of individual submissions for LTI activities.';

-- Copiando dados para a tabela capacitacoes.mdl_lti_submission: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_lti_submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_submission` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_lti_tool_proxies
CREATE TABLE IF NOT EXISTS `mdl_lti_tool_proxies` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Tool Provider',
  `regurl` longtext COLLATE utf8_unicode_ci,
  `state` tinyint(2) NOT NULL DEFAULT '1',
  `guid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vendorcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `capabilityoffered` longtext COLLATE utf8_unicode_ci NOT NULL,
  `serviceoffered` longtext COLLATE utf8_unicode_ci NOT NULL,
  `toolproxy` longtext COLLATE utf8_unicode_ci,
  `createdby` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_ltitoolprox_gui_uix` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='LTI tool proxy registrations';

-- Copiando dados para a tabela capacitacoes.mdl_lti_tool_proxies: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_lti_tool_proxies` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_tool_proxies` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_lti_tool_settings
CREATE TABLE IF NOT EXISTS `mdl_lti_tool_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `toolproxyid` bigint(10) NOT NULL,
  `course` bigint(10) DEFAULT NULL,
  `coursemoduleid` bigint(10) DEFAULT NULL,
  `settings` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltitoolsett_too_ix` (`toolproxyid`),
  KEY `mdl_ltitoolsett_cou_ix` (`course`),
  KEY `mdl_ltitoolsett_cou2_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='LTI tool setting values';

-- Copiando dados para a tabela capacitacoes.mdl_lti_tool_settings: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_lti_tool_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_tool_settings` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_lti_types
CREATE TABLE IF NOT EXISTS `mdl_lti_types` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'basiclti Activity',
  `baseurl` longtext COLLATE utf8_unicode_ci NOT NULL,
  `tooldomain` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint(2) NOT NULL DEFAULT '2',
  `course` bigint(10) NOT NULL,
  `coursevisible` tinyint(1) NOT NULL DEFAULT '0',
  `toolproxyid` bigint(10) DEFAULT NULL,
  `enabledcapability` longtext COLLATE utf8_unicode_ci,
  `parameter` longtext COLLATE utf8_unicode_ci,
  `icon` longtext COLLATE utf8_unicode_ci,
  `secureicon` longtext COLLATE utf8_unicode_ci,
  `createdby` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_ltitype_cou_ix` (`course`),
  KEY `mdl_ltitype_too_ix` (`tooldomain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Basic LTI pre-configured activities';

-- Copiando dados para a tabela capacitacoes.mdl_lti_types: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_lti_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_types` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_lti_types_config
CREATE TABLE IF NOT EXISTS `mdl_lti_types_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `typeid` bigint(10) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_ltitypeconf_typ_ix` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Basic LTI types configuration';

-- Copiando dados para a tabela capacitacoes.mdl_lti_types_config: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_lti_types_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_types_config` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_message
CREATE TABLE IF NOT EXISTS `mdl_message` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext COLLATE utf8_unicode_ci,
  `fullmessage` longtext COLLATE utf8_unicode_ci,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext COLLATE utf8_unicode_ci,
  `smallmessage` longtext COLLATE utf8_unicode_ci,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext COLLATE utf8_unicode_ci,
  `contexturlname` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timeuserfromdeleted` bigint(10) NOT NULL DEFAULT '0',
  `timeusertodeleted` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mess_use_ix` (`useridto`),
  KEY `mdl_mess_useusetimtim_ix` (`useridfrom`,`useridto`,`timeuserfromdeleted`,`timeusertodeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all unread messages';

-- Copiando dados para a tabela capacitacoes.mdl_message: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_messageinbound_datakeys
CREATE TABLE IF NOT EXISTS `mdl_messageinbound_datakeys` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `handler` bigint(10) NOT NULL,
  `datavalue` bigint(10) NOT NULL,
  `datakey` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `expires` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messdata_handat_uix` (`handler`,`datavalue`),
  KEY `mdl_messdata_han_ix` (`handler`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Inbound Message data item secret keys.';

-- Copiando dados para a tabela capacitacoes.mdl_messageinbound_datakeys: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_messageinbound_datakeys` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_messageinbound_datakeys` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_messageinbound_handlers
CREATE TABLE IF NOT EXISTS `mdl_messageinbound_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `defaultexpiration` bigint(10) NOT NULL DEFAULT '86400',
  `validateaddress` tinyint(1) NOT NULL DEFAULT '1',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messhand_cla_uix` (`classname`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Inbound Message Handler definitions.';

-- Copiando dados para a tabela capacitacoes.mdl_messageinbound_handlers: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_messageinbound_handlers` DISABLE KEYS */;
INSERT INTO `mdl_messageinbound_handlers` (`id`, `component`, `classname`, `defaultexpiration`, `validateaddress`, `enabled`) VALUES
	(1, 'core', '\\core\\message\\inbound\\private_files_handler', 0, 1, 0),
	(2, 'mod_forum', '\\mod_forum\\message\\inbound\\reply_handler', 604800, 1, 0),
	(3, 'tool_messageinbound', '\\tool_messageinbound\\message\\inbound\\invalid_recipient_handler', 604800, 0, 1);
/*!40000 ALTER TABLE `mdl_messageinbound_handlers` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_messageinbound_messagelist
CREATE TABLE IF NOT EXISTS `mdl_messageinbound_messagelist` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `messageid` longtext COLLATE utf8_unicode_ci NOT NULL,
  `userid` bigint(10) NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_messmess_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A list of message IDs for existing replies';

-- Copiando dados para a tabela capacitacoes.mdl_messageinbound_messagelist: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_messageinbound_messagelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_messageinbound_messagelist` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_message_airnotifier_devices
CREATE TABLE IF NOT EXISTS `mdl_message_airnotifier_devices` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userdeviceid` bigint(10) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messairndevi_use_uix` (`userdeviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store information about the devices registered in Airnotifie';

-- Copiando dados para a tabela capacitacoes.mdl_message_airnotifier_devices: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_message_airnotifier_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message_airnotifier_devices` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_message_contacts
CREATE TABLE IF NOT EXISTS `mdl_message_contacts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contactid` bigint(10) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messcont_usecon_uix` (`userid`,`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Maintains lists of relationships between users';

-- Copiando dados para a tabela capacitacoes.mdl_message_contacts: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_message_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message_contacts` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_message_processors
CREATE TABLE IF NOT EXISTS `mdl_message_processors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of message output plugins';

-- Copiando dados para a tabela capacitacoes.mdl_message_processors: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_message_processors` DISABLE KEYS */;
INSERT INTO `mdl_message_processors` (`id`, `name`, `enabled`) VALUES
	(1, 'airnotifier', 0),
	(2, 'email', 1),
	(3, 'jabber', 1),
	(4, 'popup', 1);
/*!40000 ALTER TABLE `mdl_message_processors` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_message_providers
CREATE TABLE IF NOT EXISTS `mdl_message_providers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `capability` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messprov_comnam_uix` (`component`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores the message providers (modules and core sy';

-- Copiando dados para a tabela capacitacoes.mdl_message_providers: ~31 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_message_providers` DISABLE KEYS */;
INSERT INTO `mdl_message_providers` (`id`, `name`, `component`, `capability`) VALUES
	(1, 'notices', 'moodle', 'moodle/site:config'),
	(2, 'errors', 'moodle', 'moodle/site:config'),
	(3, 'availableupdate', 'moodle', 'moodle/site:config'),
	(4, 'instantmessage', 'moodle', NULL),
	(5, 'backup', 'moodle', 'moodle/site:config'),
	(6, 'courserequested', 'moodle', 'moodle/site:approvecourse'),
	(7, 'courserequestapproved', 'moodle', 'moodle/course:request'),
	(8, 'courserequestrejected', 'moodle', 'moodle/course:request'),
	(9, 'badgerecipientnotice', 'moodle', 'moodle/badges:earnbadge'),
	(10, 'badgecreatornotice', 'moodle', NULL),
	(11, 'competencyplancomment', 'moodle', NULL),
	(12, 'competencyusercompcomment', 'moodle', NULL),
	(13, 'assign_notification', 'mod_assign', NULL),
	(14, 'assignment_updates', 'mod_assignment', NULL),
	(15, 'submission', 'mod_feedback', NULL),
	(16, 'message', 'mod_feedback', NULL),
	(17, 'posts', 'mod_forum', NULL),
	(18, 'digests', 'mod_forum', NULL),
	(19, 'graded_essay', 'mod_lesson', NULL),
	(20, 'submission', 'mod_quiz', 'mod/quiz:emailnotifysubmission'),
	(21, 'confirmation', 'mod_quiz', 'mod/quiz:emailconfirmsubmission'),
	(22, 'attempt_overdue', 'mod_quiz', 'mod/quiz:emailwarnoverdue'),
	(23, 'flatfile_enrolment', 'enrol_flatfile', NULL),
	(24, 'imsenterprise_enrolment', 'enrol_imsenterprise', NULL),
	(25, 'expiry_notification', 'enrol_manual', NULL),
	(26, 'paypal_enrolment', 'enrol_paypal', NULL),
	(27, 'expiry_notification', 'enrol_self', NULL),
	(28, 'invalidrecipienthandler', 'tool_messageinbound', NULL),
	(29, 'messageprocessingerror', 'tool_messageinbound', NULL),
	(30, 'messageprocessingsuccess', 'tool_messageinbound', NULL),
	(31, 'notification', 'tool_monitor', 'tool/monitor:subscribe');
/*!40000 ALTER TABLE `mdl_message_providers` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_message_read
CREATE TABLE IF NOT EXISTS `mdl_message_read` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext COLLATE utf8_unicode_ci,
  `fullmessage` longtext COLLATE utf8_unicode_ci,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext COLLATE utf8_unicode_ci,
  `smallmessage` longtext COLLATE utf8_unicode_ci,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext COLLATE utf8_unicode_ci,
  `contexturlname` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timeread` bigint(10) NOT NULL DEFAULT '0',
  `timeuserfromdeleted` bigint(10) NOT NULL DEFAULT '0',
  `timeusertodeleted` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_messread_use_ix` (`useridto`),
  KEY `mdl_messread_useusetimtim_ix` (`useridfrom`,`useridto`,`timeuserfromdeleted`,`timeusertodeleted`),
  KEY `mdl_messread_nottim_ix` (`notification`,`timeread`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all messages that have been read';

-- Copiando dados para a tabela capacitacoes.mdl_message_read: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_message_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message_read` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_message_working
CREATE TABLE IF NOT EXISTS `mdl_message_working` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `unreadmessageid` bigint(10) NOT NULL,
  `processorid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_messwork_unr_ix` (`unreadmessageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists all the messages and processors that need to be proces';

-- Copiando dados para a tabela capacitacoes.mdl_message_working: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_message_working` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message_working` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_mnetservice_enrol_courses
CREATE TABLE IF NOT EXISTS `mdl_mnetservice_enrol_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL,
  `remoteid` bigint(10) NOT NULL,
  `categoryid` bigint(10) NOT NULL,
  `categoryname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci NOT NULL,
  `summaryformat` smallint(3) DEFAULT '0',
  `startdate` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `rolename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetenrocour_hosrem_uix` (`hostid`,`remoteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Caches the information fetched via XML-RPC about courses on ';

-- Copiando dados para a tabela capacitacoes.mdl_mnetservice_enrol_courses: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_mnetservice_enrol_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnetservice_enrol_courses` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_mnetservice_enrol_enrolments
CREATE TABLE IF NOT EXISTS `mdl_mnetservice_enrol_enrolments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `remotecourseid` bigint(10) NOT NULL,
  `rolename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enroltime` bigint(10) NOT NULL DEFAULT '0',
  `enroltype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetenroenro_use_ix` (`userid`),
  KEY `mdl_mnetenroenro_hos_ix` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Caches the information about enrolments of our local users i';

-- Copiando dados para a tabela capacitacoes.mdl_mnetservice_enrol_enrolments: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_mnetservice_enrol_enrolments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnetservice_enrol_enrolments` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_mnet_application
CREATE TABLE IF NOT EXISTS `mdl_mnet_application` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpc_server_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sso_land_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sso_jump_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about applications on remote hosts';

-- Copiando dados para a tabela capacitacoes.mdl_mnet_application: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_mnet_application` DISABLE KEYS */;
INSERT INTO `mdl_mnet_application` (`id`, `name`, `display_name`, `xmlrpc_server_url`, `sso_land_url`, `sso_jump_url`) VALUES
	(1, 'moodle', 'Moodle', '/mnet/xmlrpc/server.php', '/auth/mnet/land.php', '/auth/mnet/jump.php'),
	(2, 'mahara', 'Mahara', '/api/xmlrpc/server.php', '/auth/xmlrpc/land.php', '/auth/xmlrpc/jump.php');
/*!40000 ALTER TABLE `mdl_mnet_application` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_mnet_host
CREATE TABLE IF NOT EXISTS `mdl_mnet_host` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `wwwroot` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `public_key` longtext COLLATE utf8_unicode_ci NOT NULL,
  `public_key_expires` bigint(10) NOT NULL DEFAULT '0',
  `transport` tinyint(2) NOT NULL DEFAULT '0',
  `portno` mediumint(5) NOT NULL DEFAULT '0',
  `last_connect_time` bigint(10) NOT NULL DEFAULT '0',
  `last_log_id` bigint(10) NOT NULL DEFAULT '0',
  `force_theme` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applicationid` bigint(10) NOT NULL DEFAULT '1',
  `sslverification` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mnethost_app_ix` (`applicationid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about the local and remote hosts for RPC';

-- Copiando dados para a tabela capacitacoes.mdl_mnet_host: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_mnet_host` DISABLE KEYS */;
INSERT INTO `mdl_mnet_host` (`id`, `deleted`, `wwwroot`, `ip_address`, `name`, `public_key`, `public_key_expires`, `transport`, `portno`, `last_connect_time`, `last_log_id`, `force_theme`, `theme`, `applicationid`, `sslverification`) VALUES
	(1, 0, 'http://localhost/CAPACITACOES/moodle', '127.0.0.1', '', '', 0, 0, 0, 0, 0, 0, NULL, 1, 0),
	(2, 0, '', '', 'All Hosts', '', 0, 0, 0, 0, 0, 0, NULL, 1, 0);
/*!40000 ALTER TABLE `mdl_mnet_host` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_mnet_host2service
CREATE TABLE IF NOT EXISTS `mdl_mnet_host2service` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `subscribe` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnethost_hosser_uix` (`hostid`,`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about the services for a given host';

-- Copiando dados para a tabela capacitacoes.mdl_mnet_host2service: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_mnet_host2service` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_host2service` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_mnet_log
CREATE TABLE IF NOT EXISTS `mdl_mnet_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `remoteid` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `coursename` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetlog_hosusecou_ix` (`hostid`,`userid`,`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store session data from users migrating to other sites';

-- Copiando dados para a tabela capacitacoes.mdl_mnet_log: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_mnet_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_log` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_mnet_remote_rpc
CREATE TABLE IF NOT EXISTS `mdl_mnet_remote_rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plugintype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pluginname` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table describes functions that might be called remotely';

-- Copiando dados para a tabela capacitacoes.mdl_mnet_remote_rpc: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_mnet_remote_rpc` DISABLE KEYS */;
INSERT INTO `mdl_mnet_remote_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`) VALUES
	(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1),
	(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1),
	(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1),
	(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1),
	(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1),
	(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1),
	(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1),
	(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1),
	(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1),
	(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1),
	(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1),
	(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1),
	(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1),
	(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1),
	(15, 'send_content_intent', 'portfolio/mahara/lib.php/send_content_intent', 'portfolio', 'mahara', 1),
	(16, 'send_content_ready', 'portfolio/mahara/lib.php/send_content_ready', 'portfolio', 'mahara', 1);
/*!40000 ALTER TABLE `mdl_mnet_remote_rpc` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_mnet_remote_service2rpc
CREATE TABLE IF NOT EXISTS `mdl_mnet_remote_service2rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetremoserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Group functions or methods under a service';

-- Copiando dados para a tabela capacitacoes.mdl_mnet_remote_service2rpc: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_mnet_remote_service2rpc` DISABLE KEYS */;
INSERT INTO `mdl_mnet_remote_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(4, 1, 4),
	(5, 1, 5),
	(6, 1, 6),
	(7, 1, 7),
	(8, 2, 8),
	(9, 2, 9),
	(10, 3, 10),
	(11, 3, 11),
	(12, 3, 12),
	(13, 3, 13),
	(14, 3, 14),
	(15, 4, 15),
	(16, 4, 16);
/*!40000 ALTER TABLE `mdl_mnet_remote_service2rpc` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_mnet_rpc
CREATE TABLE IF NOT EXISTS `mdl_mnet_rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plugintype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pluginname` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `help` longtext COLLATE utf8_unicode_ci NOT NULL,
  `profile` longtext COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `static` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_mnetrpc_enaxml_ix` (`enabled`,`xmlrpcpath`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Functions or methods that we may publish or subscribe to';

-- Copiando dados para a tabela capacitacoes.mdl_mnet_rpc: ~15 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_mnet_rpc` DISABLE KEYS */;
INSERT INTO `mdl_mnet_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`, `help`, `profile`, `filename`, `classname`, `static`) VALUES
	(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1, 'Return user data for the provided token, compare with user_agent string.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:37:"The unique ID provided by remotehost.";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:18:"User Agent string.";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:44:"$userdata Array of user info for remote host";}}', 'auth.php', 'auth_plugin_mnet', 0),
	(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1, 'Receives an array of usernames from a remote machine and prods their\nsessions to keep them alive', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
	(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1, 'The IdP uses this function to kill child sessions on other hosts', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:35:"SHA1 hash of user agent to look for";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:39:"A plaintext report of what has happened";}}', 'auth.php', 'auth_plugin_mnet', 0),
	(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1, 'Receives an array of log entries from an SP and adds them to the mnet_log\ntable', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
	(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1, 'Returns the user\'s profile image info\nIf the user exists and has a profile picture, the returned array will contain keys:\nf1          - the content of the default 100x100px image\nf1_mimetype - the mimetype of the f1 file\nf2          - the content of the 35x35px variant of the image\nf2_mimetype - the mimetype of the f2 file\nThe mimetype information was added in Moodle 2.0. In Moodle 1.x, images are always jpegs.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:3:"int";s:11:"description";s:18:"The id of the user";}}s:6:"return";a:2:{s:4:"type";s:11:"false|array";s:11:"description";s:84:"false if user not found, empty array if no picture exists, array with data otherwise";}}', 'auth.php', 'auth_plugin_mnet', 0),
	(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1, 'Returns the theme information and logo url as strings.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:14:"The theme info";}}', 'auth.php', 'auth_plugin_mnet', 0),
	(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1, 'Invoke this function _on_ the IDP to update it with enrolment info local to\nthe SP right after calling user_authorise()\nNormally called by the SP after calling user_authorise()', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:12:"The username";}i:1;a:3:{s:4:"name";s:7:"courses";s:4:"type";s:5:"array";s:11:"description";s:75:"Assoc array of courses following the structure of mnetservice_enrol_courses";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
	(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1, 'Poll the IdP server to let it know that a user it has authenticated is still\nonline', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
	(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1, 'When the IdP requests that child sessions are terminated,\nthis function will be called on each of the child hosts. The machine that\ncalls the function (over xmlrpc) provides us with the mnethostid we need.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:35:"SHA1 hash of user agent to look for";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:15:"True on success";}}', 'auth.php', 'auth_plugin_mnet', 0),
	(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1, 'Returns list of courses that we offer to the caller for remote enrolment of their users\nSince Moodle 2.0, courses are made available for MNet peers by creating an instance\nof enrol_mnet plugin for the course. Hidden courses are not returned. If there are two\ninstances - one specific for the host and one for \'All hosts\', the setting of the specific\none is used. The id of the peer is kept in customint1, no other custom fields are used.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
	(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1, 'This method has never been implemented in Moodle MNet API', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:11:"empty array";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
	(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1, 'Enrol remote user to our course\nIf we do not have local record for the remote user in our database,\nit gets created here.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"userdata";s:4:"type";s:5:"array";s:11:"description";s:43:"user details {@see mnet_fields_to_import()}";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:19:"our local course id";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:69:"true if the enrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
	(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1, 'Unenrol remote user from our course\nOnly users enrolled via enrol_mnet plugin can be unenrolled remotely. If the\nremote user is enrolled into the local course via some other enrol plugin\n(enrol_manual for example), the remote host can\'t touch such enrolment. Please\ndo not report this behaviour as bug, it is a feature ;-)', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:18:"of the remote user";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:19:"of our local course";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:71:"true if the unenrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
	(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1, 'Returns a list of users from the client server who are enrolled in our course\nSuitable instance of enrol_mnet must be created in the course. This method will not\nreturn any information about the enrolments in courses that are not available for\nremote enrolment, even if their users are enrolled into them via other plugin\n(note the difference from {@link self::user_enrolments()}).\nThis method will return enrolment information for users from hosts regardless\nthe enrolment plugin. It does not matter if the user was enrolled remotely by\ntheir admin or locally. Once the course is available for remote enrolments, we\nwill tell them everything about their users.\nIn Moodle 1.x the returned array used to be indexed by username. The side effect\nof MDL-19219 fix is that we do not need to use such index and therefore we can\nreturn all enrolment records. MNet clients 1.x will only use the last record for\nthe student, if she is enrolled via multiple plugins.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:16:"ID of our course";}i:1;a:3:{s:4:"name";s:5:"roles";s:4:"type";s:12:"string|array";s:11:"description";s:58:"comma separated list of role shortnames (or array of them)";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
	(15, 'fetch_file', 'portfolio/mahara/lib.php/fetch_file', 'portfolio', 'mahara', 1, 'xmlrpc (mnet) function to get the file.\nreads in the file and returns it base_64 encoded\nso that it can be enrypted by mnet.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:56:"the token recieved previously during send_content_intent";}}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'lib.php', 'portfolio_plugin_mahara', 1);
/*!40000 ALTER TABLE `mdl_mnet_rpc` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_mnet_service
CREATE TABLE IF NOT EXISTS `mdl_mnet_service` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `apiversion` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `offer` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A service is a group of functions';

-- Copiando dados para a tabela capacitacoes.mdl_mnet_service: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_mnet_service` DISABLE KEYS */;
INSERT INTO `mdl_mnet_service` (`id`, `name`, `description`, `apiversion`, `offer`) VALUES
	(1, 'sso_idp', '', '1', 1),
	(2, 'sso_sp', '', '1', 1),
	(3, 'mnet_enrol', '', '1', 1),
	(4, 'pf', '', '1', 1);
/*!40000 ALTER TABLE `mdl_mnet_service` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_mnet_service2rpc
CREATE TABLE IF NOT EXISTS `mdl_mnet_service2rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Group functions or methods under a service';

-- Copiando dados para a tabela capacitacoes.mdl_mnet_service2rpc: ~15 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_mnet_service2rpc` DISABLE KEYS */;
INSERT INTO `mdl_mnet_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(4, 1, 4),
	(5, 1, 5),
	(6, 1, 6),
	(7, 1, 7),
	(8, 2, 8),
	(9, 2, 9),
	(10, 3, 10),
	(11, 3, 11),
	(12, 3, 12),
	(13, 3, 13),
	(14, 3, 14),
	(15, 4, 15);
/*!40000 ALTER TABLE `mdl_mnet_service2rpc` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_mnet_session
CREATE TABLE IF NOT EXISTS `mdl_mnet_session` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `token` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `useragent` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `confirm_timeout` bigint(10) NOT NULL DEFAULT '0',
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetsess_tok_uix` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store session data from users migrating to other sites';

-- Copiando dados para a tabela capacitacoes.mdl_mnet_session: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_mnet_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_session` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_mnet_sso_access_control
CREATE TABLE IF NOT EXISTS `mdl_mnet_sso_access_control` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mnet_host_id` bigint(10) NOT NULL DEFAULT '0',
  `accessctrl` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'allow',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetssoaccecont_mneuse_uix` (`mnet_host_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Users by host permitted (or not) to login from a remote prov';

-- Copiando dados para a tabela capacitacoes.mdl_mnet_sso_access_control: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_mnet_sso_access_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_sso_access_control` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_modules
CREATE TABLE IF NOT EXISTS `mdl_modules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `search` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_modu_nam_ix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='modules available in the site';

-- Copiando dados para a tabela capacitacoes.mdl_modules: ~22 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_modules` DISABLE KEYS */;
INSERT INTO `mdl_modules` (`id`, `name`, `cron`, `lastcron`, `search`, `visible`) VALUES
	(1, 'assign', 60, 0, '', 1),
	(2, 'assignment', 60, 0, '', 0),
	(3, 'book', 0, 0, '', 1),
	(4, 'chat', 300, 0, '', 1),
	(5, 'choice', 0, 0, '', 1),
	(6, 'data', 0, 0, '', 1),
	(7, 'feedback', 0, 0, '', 1),
	(8, 'folder', 0, 0, '', 1),
	(9, 'forum', 0, 0, '', 1),
	(10, 'glossary', 0, 0, '', 1),
	(11, 'imscp', 0, 0, '', 1),
	(12, 'label', 0, 0, '', 1),
	(13, 'lesson', 0, 0, '', 1),
	(14, 'lti', 0, 0, '', 1),
	(15, 'page', 0, 0, '', 1),
	(16, 'quiz', 60, 0, '', 1),
	(17, 'resource', 0, 0, '', 1),
	(18, 'scorm', 300, 0, '', 1),
	(19, 'survey', 0, 0, '', 1),
	(20, 'url', 0, 0, '', 1),
	(21, 'wiki', 0, 0, '', 1),
	(22, 'workshop', 60, 0, '', 1);
/*!40000 ALTER TABLE `mdl_modules` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_my_pages
CREATE TABLE IF NOT EXISTS `mdl_my_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) DEFAULT '0',
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `private` tinyint(1) NOT NULL DEFAULT '1',
  `sortorder` mediumint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mypage_usepri_ix` (`userid`,`private`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Extra user pages for the My Moodle system';

-- Copiando dados para a tabela capacitacoes.mdl_my_pages: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_my_pages` DISABLE KEYS */;
INSERT INTO `mdl_my_pages` (`id`, `userid`, `name`, `private`, `sortorder`) VALUES
	(1, NULL, '__default', 0, 0),
	(2, NULL, '__default', 1, 0),
	(4, 4, '__default', 0, 0),
	(5, 2, '__default', 0, 0);
/*!40000 ALTER TABLE `mdl_my_pages` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_page
CREATE TABLE IF NOT EXISTS `mdl_page` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext COLLATE utf8_unicode_ci,
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_page_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one page and its config data';

-- Copiando dados para a tabela capacitacoes.mdl_page: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_page` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_portfolio_instance
CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='base table (not including config data) for instances of port';

-- Copiando dados para a tabela capacitacoes.mdl_portfolio_instance: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_portfolio_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_instance` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_portfolio_instance_config
CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstconf_nam_ix` (`name`),
  KEY `mdl_portinstconf_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='config for portfolio plugin instances';

-- Copiando dados para a tabela capacitacoes.mdl_portfolio_instance_config: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_portfolio_instance_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_instance_config` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_portfolio_instance_user
CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstuser_ins_ix` (`instance`),
  KEY `mdl_portinstuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data for portfolio instances.';

-- Copiando dados para a tabela capacitacoes.mdl_portfolio_instance_user: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_portfolio_instance_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_instance_user` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_portfolio_log
CREATE TABLE IF NOT EXISTS `mdl_portfolio_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `time` bigint(10) NOT NULL,
  `portfolio` bigint(10) NOT NULL,
  `caller_class` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `caller_file` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `caller_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caller_sha1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tempdataid` bigint(10) NOT NULL DEFAULT '0',
  `returnurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `continueurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portlog_use_ix` (`userid`),
  KEY `mdl_portlog_por_ix` (`portfolio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='log of portfolio transfers (used to later check for duplicat';

-- Copiando dados para a tabela capacitacoes.mdl_portfolio_log: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_portfolio_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_log` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_portfolio_mahara_queue
CREATE TABLE IF NOT EXISTS `mdl_portfolio_mahara_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `transferid` bigint(10) NOT NULL,
  `token` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portmahaqueu_tok_ix` (`token`),
  KEY `mdl_portmahaqueu_tra_ix` (`transferid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='maps mahara tokens to transfer ids';

-- Copiando dados para a tabela capacitacoes.mdl_portfolio_mahara_queue: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_portfolio_mahara_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_mahara_queue` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_portfolio_tempdata
CREATE TABLE IF NOT EXISTS `mdl_portfolio_tempdata` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8_unicode_ci,
  `expirytime` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT '0',
  `queued` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_porttemp_use_ix` (`userid`),
  KEY `mdl_porttemp_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='stores temporary data for portfolio exports. the id of this ';

-- Copiando dados para a tabela capacitacoes.mdl_portfolio_tempdata: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_portfolio_tempdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_tempdata` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_post
CREATE TABLE IF NOT EXISTS `mdl_post` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `moduleid` bigint(10) NOT NULL DEFAULT '0',
  `coursemoduleid` bigint(10) NOT NULL DEFAULT '0',
  `subject` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `uniquehash` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rating` bigint(10) NOT NULL DEFAULT '0',
  `format` bigint(10) NOT NULL DEFAULT '0',
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publishstate` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `lastmodified` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_post_iduse_uix` (`id`,`userid`),
  KEY `mdl_post_las_ix` (`lastmodified`),
  KEY `mdl_post_mod_ix` (`module`),
  KEY `mdl_post_sub_ix` (`subject`),
  KEY `mdl_post_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Generic post table to hold data blog entries etc in differen';

-- Copiando dados para a tabela capacitacoes.mdl_post: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_post` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_profiling
CREATE TABLE IF NOT EXISTS `mdl_profiling` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `runid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `totalexecutiontime` bigint(10) NOT NULL,
  `totalcputime` bigint(10) NOT NULL,
  `totalcalls` bigint(10) NOT NULL,
  `totalmemory` bigint(10) NOT NULL,
  `runreference` tinyint(2) NOT NULL DEFAULT '0',
  `runcomment` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_prof_run_uix` (`runid`),
  KEY `mdl_prof_urlrun_ix` (`url`,`runreference`),
  KEY `mdl_prof_timrun_ix` (`timecreated`,`runreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the results of all the profiling runs';

-- Copiando dados para a tabela capacitacoes.mdl_profiling: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_profiling` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_profiling` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_qtype_ddimageortext
CREATE TABLE IF NOT EXISTS `mdl_qtype_ddimageortext` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddim_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines drag and drop (text or images onto a background imag';

-- Copiando dados para a tabela capacitacoes.mdl_qtype_ddimageortext: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_qtype_ddimageortext` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_ddimageortext` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_qtype_ddimageortext_drags
CREATE TABLE IF NOT EXISTS `mdl_qtype_ddimageortext_drags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `no` bigint(10) NOT NULL DEFAULT '0',
  `draggroup` bigint(10) NOT NULL DEFAULT '0',
  `infinite` smallint(4) NOT NULL DEFAULT '0',
  `label` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddimdrag_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Images to drag. Actual file names are not stored here we use';

-- Copiando dados para a tabela capacitacoes.mdl_qtype_ddimageortext_drags: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_qtype_ddimageortext_drags` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_ddimageortext_drags` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_qtype_ddimageortext_drops
CREATE TABLE IF NOT EXISTS `mdl_qtype_ddimageortext_drops` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `no` bigint(10) NOT NULL DEFAULT '0',
  `xleft` bigint(10) NOT NULL DEFAULT '0',
  `ytop` bigint(10) NOT NULL DEFAULT '0',
  `choice` bigint(10) NOT NULL DEFAULT '0',
  `label` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddimdrop_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Drop boxes';

-- Copiando dados para a tabela capacitacoes.mdl_qtype_ddimageortext_drops: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_qtype_ddimageortext_drops` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_ddimageortext_drops` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_qtype_ddmarker
CREATE TABLE IF NOT EXISTS `mdl_qtype_ddmarker` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  `showmisplaced` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddma_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines drag and drop (text or images onto a background imag';

-- Copiando dados para a tabela capacitacoes.mdl_qtype_ddmarker: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_qtype_ddmarker` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_ddmarker` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_qtype_ddmarker_drags
CREATE TABLE IF NOT EXISTS `mdl_qtype_ddmarker_drags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `no` bigint(10) NOT NULL DEFAULT '0',
  `label` longtext COLLATE utf8_unicode_ci NOT NULL,
  `infinite` smallint(4) NOT NULL DEFAULT '0',
  `noofdrags` bigint(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddmadrag_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Labels for markers to drag.';

-- Copiando dados para a tabela capacitacoes.mdl_qtype_ddmarker_drags: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_qtype_ddmarker_drags` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_ddmarker_drags` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_qtype_ddmarker_drops
CREATE TABLE IF NOT EXISTS `mdl_qtype_ddmarker_drops` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `no` bigint(10) NOT NULL DEFAULT '0',
  `shape` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coords` longtext COLLATE utf8_unicode_ci NOT NULL,
  `choice` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddmadrop_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='drop regions';

-- Copiando dados para a tabela capacitacoes.mdl_qtype_ddmarker_drops: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_qtype_ddmarker_drops` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_ddmarker_drops` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_qtype_essay_options
CREATE TABLE IF NOT EXISTS `mdl_qtype_essay_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL,
  `responseformat` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'editor',
  `responserequired` tinyint(2) NOT NULL DEFAULT '1',
  `responsefieldlines` smallint(4) NOT NULL DEFAULT '15',
  `attachments` smallint(4) NOT NULL DEFAULT '0',
  `attachmentsrequired` smallint(4) NOT NULL DEFAULT '0',
  `graderinfo` longtext COLLATE utf8_unicode_ci,
  `graderinfoformat` smallint(4) NOT NULL DEFAULT '0',
  `responsetemplate` longtext COLLATE utf8_unicode_ci,
  `responsetemplateformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypessaopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Extra options for essay questions.';

-- Copiando dados para a tabela capacitacoes.mdl_qtype_essay_options: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_qtype_essay_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_essay_options` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_qtype_match_options
CREATE TABLE IF NOT EXISTS `mdl_qtype_match_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypmatcopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines the question-type specific options for matching ques';

-- Copiando dados para a tabela capacitacoes.mdl_qtype_match_options: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_qtype_match_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_match_options` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_qtype_match_subquestions
CREATE TABLE IF NOT EXISTS `mdl_qtype_match_subquestions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `questiontext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `answertext` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypmatcsubq_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The subquestions that make up a matching question';

-- Copiando dados para a tabela capacitacoes.mdl_qtype_match_subquestions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_qtype_match_subquestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_match_subquestions` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_qtype_multichoice_options
CREATE TABLE IF NOT EXISTS `mdl_qtype_multichoice_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `layout` smallint(4) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypmultopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for multiple choice questions';

-- Copiando dados para a tabela capacitacoes.mdl_qtype_multichoice_options: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_qtype_multichoice_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_multichoice_options` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_qtype_randomsamatch_options
CREATE TABLE IF NOT EXISTS `mdl_qtype_randomsamatch_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `choose` bigint(10) NOT NULL DEFAULT '4',
  `subcats` tinyint(2) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtyprandopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about a random short-answer matching question';

-- Copiando dados para a tabela capacitacoes.mdl_qtype_randomsamatch_options: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_qtype_randomsamatch_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_randomsamatch_options` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_qtype_shortanswer_options
CREATE TABLE IF NOT EXISTS `mdl_qtype_shortanswer_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `usecase` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypshoropti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for short answer questions';

-- Copiando dados para a tabela capacitacoes.mdl_qtype_shortanswer_options: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_qtype_shortanswer_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_shortanswer_options` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_question
CREATE TABLE IF NOT EXISTS `mdl_question` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `questiontext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `generalfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `generalfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `defaultmark` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.3333333',
  `qtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `length` bigint(10) NOT NULL DEFAULT '1',
  `stamp` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `createdby` bigint(10) DEFAULT NULL,
  `modifiedby` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ques_qty_ix` (`qtype`),
  KEY `mdl_ques_cat_ix` (`category`),
  KEY `mdl_ques_par_ix` (`parent`),
  KEY `mdl_ques_cre_ix` (`createdby`),
  KEY `mdl_ques_mod_ix` (`modifiedby`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The questions themselves';

-- Copiando dados para a tabela capacitacoes.mdl_question: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_question_answers
CREATE TABLE IF NOT EXISTS `mdl_question_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext COLLATE utf8_unicode_ci NOT NULL,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `fraction` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `feedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Answers, with a fractional grade (0-1) and feedback';

-- Copiando dados para a tabela capacitacoes.mdl_question_answers: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_question_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_answers` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_question_attempts
CREATE TABLE IF NOT EXISTS `mdl_question_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `behaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `questionid` bigint(10) NOT NULL,
  `variant` bigint(10) NOT NULL DEFAULT '1',
  `maxmark` decimal(12,7) NOT NULL,
  `minfraction` decimal(12,7) NOT NULL,
  `maxfraction` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `flagged` tinyint(1) NOT NULL DEFAULT '0',
  `questionsummary` longtext COLLATE utf8_unicode_ci,
  `rightanswer` longtext COLLATE utf8_unicode_ci,
  `responsesummary` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesatte_queslo_uix` (`questionusageid`,`slot`),
  KEY `mdl_quesatte_beh_ix` (`behaviour`),
  KEY `mdl_quesatte_que_ix` (`questionid`),
  KEY `mdl_quesatte_que2_ix` (`questionusageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each row here corresponds to an attempt at one question, as ';

-- Copiando dados para a tabela capacitacoes.mdl_question_attempts: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_question_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_attempts` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_question_attempt_steps
CREATE TABLE IF NOT EXISTS `mdl_question_attempt_steps` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionattemptid` bigint(10) NOT NULL,
  `sequencenumber` bigint(10) NOT NULL,
  `state` varchar(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fraction` decimal(12,7) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `userid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestep_queseq_uix` (`questionattemptid`,`sequencenumber`),
  KEY `mdl_quesattestep_que_ix` (`questionattemptid`),
  KEY `mdl_quesattestep_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores one step in in a question attempt. As well as the dat';

-- Copiando dados para a tabela capacitacoes.mdl_question_attempt_steps: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_question_attempt_steps` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_attempt_steps` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_question_attempt_step_data
CREATE TABLE IF NOT EXISTS `mdl_question_attempt_step_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attemptstepid` bigint(10) NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_quesattestepdata_att_ix` (`attemptstepid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each question_attempt_step has an associative array of the d';

-- Copiando dados para a tabela capacitacoes.mdl_question_attempt_step_data: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_question_attempt_step_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_attempt_step_data` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_question_calculated
CREATE TABLE IF NOT EXISTS `mdl_question_calculated` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0',
  `tolerancetype` bigint(10) NOT NULL DEFAULT '1',
  `correctanswerlength` bigint(10) NOT NULL DEFAULT '2',
  `correctanswerformat` bigint(10) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalc_ans_ix` (`answer`),
  KEY `mdl_quescalc_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type calculated';

-- Copiando dados para a tabela capacitacoes.mdl_question_calculated: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_question_calculated` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_calculated` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_question_calculated_options
CREATE TABLE IF NOT EXISTS `mdl_question_calculated_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `synchronize` tinyint(2) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `correctfeedback` longtext COLLATE utf8_unicode_ci,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalcopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type calculated';

-- Copiando dados para a tabela capacitacoes.mdl_question_calculated_options: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_question_calculated_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_calculated_options` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_question_categories
CREATE TABLE IF NOT EXISTS `mdl_question_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `info` longtext COLLATE utf8_unicode_ci NOT NULL,
  `infoformat` tinyint(2) NOT NULL DEFAULT '0',
  `stamp` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '999',
  PRIMARY KEY (`id`),
  KEY `mdl_quescate_con_ix` (`contextid`),
  KEY `mdl_quescate_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Categories are for grouping questions';

-- Copiando dados para a tabela capacitacoes.mdl_question_categories: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_question_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_categories` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_question_datasets
CREATE TABLE IF NOT EXISTS `mdl_question_datasets` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `datasetdefinition` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdata_quedat_ix` (`question`,`datasetdefinition`),
  KEY `mdl_quesdata_que_ix` (`question`),
  KEY `mdl_quesdata_dat_ix` (`datasetdefinition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Many-many relation between questions and dataset definitions';

-- Copiando dados para a tabela capacitacoes.mdl_question_datasets: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_question_datasets` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_datasets` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_question_dataset_definitions
CREATE TABLE IF NOT EXISTS `mdl_question_dataset_definitions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` bigint(10) NOT NULL DEFAULT '0',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemcount` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdatadefi_cat_ix` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Organises and stores properties for dataset items';

-- Copiando dados para a tabela capacitacoes.mdl_question_dataset_definitions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_question_dataset_definitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_dataset_definitions` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_question_dataset_items
CREATE TABLE IF NOT EXISTS `mdl_question_dataset_items` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definition` bigint(10) NOT NULL DEFAULT '0',
  `itemnumber` bigint(10) NOT NULL DEFAULT '0',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdataitem_def_ix` (`definition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Individual dataset items';

-- Copiando dados para a tabela capacitacoes.mdl_question_dataset_items: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_question_dataset_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_dataset_items` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_question_ddwtos
CREATE TABLE IF NOT EXISTS `mdl_question_ddwtos` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesddwt_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines drag and drop (words into sentences) questions';

-- Copiando dados para a tabela capacitacoes.mdl_question_ddwtos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_question_ddwtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_ddwtos` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_question_gapselect
CREATE TABLE IF NOT EXISTS `mdl_question_gapselect` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesgaps_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines select missing words questions';

-- Copiando dados para a tabela capacitacoes.mdl_question_gapselect: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_question_gapselect` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_gapselect` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_question_hints
CREATE TABLE IF NOT EXISTS `mdl_question_hints` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL,
  `hint` longtext COLLATE utf8_unicode_ci NOT NULL,
  `hintformat` smallint(4) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(1) DEFAULT NULL,
  `clearwrong` tinyint(1) DEFAULT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_queshint_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the the part of the question definition that gives di';

-- Copiando dados para a tabela capacitacoes.mdl_question_hints: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_question_hints` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_hints` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_question_multianswer
CREATE TABLE IF NOT EXISTS `mdl_question_multianswer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `sequence` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quesmult_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for multianswer questions';

-- Copiando dados para a tabela capacitacoes.mdl_question_multianswer: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_question_multianswer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_multianswer` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_question_numerical
CREATE TABLE IF NOT EXISTS `mdl_question_numerical` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnume_ans_ix` (`answer`),
  KEY `mdl_quesnume_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for numerical questions.';

-- Copiando dados para a tabela capacitacoes.mdl_question_numerical: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_question_numerical` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_numerical` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_question_numerical_options
CREATE TABLE IF NOT EXISTS `mdl_question_numerical_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `showunits` smallint(4) NOT NULL DEFAULT '0',
  `unitsleft` smallint(4) NOT NULL DEFAULT '0',
  `unitgradingtype` smallint(4) NOT NULL DEFAULT '0',
  `unitpenalty` decimal(12,7) NOT NULL DEFAULT '0.1000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnumeopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type numerical This table is also u';

-- Copiando dados para a tabela capacitacoes.mdl_question_numerical_options: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_question_numerical_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_numerical_options` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_question_numerical_units
CREATE TABLE IF NOT EXISTS `mdl_question_numerical_units` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `multiplier` decimal(40,20) NOT NULL DEFAULT '1.00000000000000000000',
  `unit` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesnumeunit_queuni_uix` (`question`,`unit`),
  KEY `mdl_quesnumeunit_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Optional unit options for numerical questions. This table is';

-- Copiando dados para a tabela capacitacoes.mdl_question_numerical_units: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_question_numerical_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_numerical_units` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_question_response_analysis
CREATE TABLE IF NOT EXISTS `mdl_question_response_analysis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `whichtries` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `variant` bigint(10) DEFAULT NULL,
  `subqid` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aid` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `response` longtext COLLATE utf8_unicode_ci,
  `credit` decimal(15,5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Analysis of student responses given to questions.';

-- Copiando dados para a tabela capacitacoes.mdl_question_response_analysis: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_question_response_analysis` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_response_analysis` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_question_response_count
CREATE TABLE IF NOT EXISTS `mdl_question_response_count` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `analysisid` bigint(10) NOT NULL,
  `try` bigint(10) NOT NULL,
  `rcount` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quesrespcoun_ana_ix` (`analysisid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Count for each responses for each try at a question.';

-- Copiando dados para a tabela capacitacoes.mdl_question_response_count: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_question_response_count` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_response_count` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_question_statistics
CREATE TABLE IF NOT EXISTS `mdl_question_statistics` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `slot` bigint(10) DEFAULT NULL,
  `subquestion` smallint(4) NOT NULL,
  `variant` bigint(10) DEFAULT NULL,
  `s` bigint(10) NOT NULL DEFAULT '0',
  `effectiveweight` decimal(15,5) DEFAULT NULL,
  `negcovar` tinyint(2) NOT NULL DEFAULT '0',
  `discriminationindex` decimal(15,5) DEFAULT NULL,
  `discriminativeefficiency` decimal(15,5) DEFAULT NULL,
  `sd` decimal(15,10) DEFAULT NULL,
  `facility` decimal(15,10) DEFAULT NULL,
  `subquestions` longtext COLLATE utf8_unicode_ci,
  `maxmark` decimal(12,7) DEFAULT NULL,
  `positions` longtext COLLATE utf8_unicode_ci,
  `randomguessscore` decimal(12,7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Statistics for individual questions used in an activity.';

-- Copiando dados para a tabela capacitacoes.mdl_question_statistics: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_question_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_statistics` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_question_truefalse
CREATE TABLE IF NOT EXISTS `mdl_question_truefalse` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `trueanswer` bigint(10) NOT NULL DEFAULT '0',
  `falseanswer` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_questrue_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for True-False questions';

-- Copiando dados para a tabela capacitacoes.mdl_question_truefalse: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_question_truefalse` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_truefalse` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_question_usages
CREATE TABLE IF NOT EXISTS `mdl_question_usages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `preferredbehaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesusag_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table''s main purpose it to assign a unique id to each a';

-- Copiando dados para a tabela capacitacoes.mdl_question_usages: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_question_usages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_usages` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_quiz
CREATE TABLE IF NOT EXISTS `mdl_quiz` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timelimit` bigint(10) NOT NULL DEFAULT '0',
  `overduehandling` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'autoabandon',
  `graceperiod` bigint(10) NOT NULL DEFAULT '0',
  `preferredbehaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `canredoquestions` smallint(4) NOT NULL DEFAULT '0',
  `attempts` mediumint(6) NOT NULL DEFAULT '0',
  `attemptonlast` smallint(4) NOT NULL DEFAULT '0',
  `grademethod` smallint(4) NOT NULL DEFAULT '1',
  `decimalpoints` smallint(4) NOT NULL DEFAULT '2',
  `questiondecimalpoints` smallint(4) NOT NULL DEFAULT '-1',
  `reviewattempt` mediumint(6) NOT NULL DEFAULT '0',
  `reviewcorrectness` mediumint(6) NOT NULL DEFAULT '0',
  `reviewmarks` mediumint(6) NOT NULL DEFAULT '0',
  `reviewspecificfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewgeneralfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewrightanswer` mediumint(6) NOT NULL DEFAULT '0',
  `reviewoverallfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `questionsperpage` bigint(10) NOT NULL DEFAULT '0',
  `navmethod` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'free',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `sumgrades` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subnet` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `browsersecurity` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delay1` bigint(10) NOT NULL DEFAULT '0',
  `delay2` bigint(10) NOT NULL DEFAULT '0',
  `showuserpicture` smallint(4) NOT NULL DEFAULT '0',
  `showblocks` smallint(4) NOT NULL DEFAULT '0',
  `completionattemptsexhausted` tinyint(1) DEFAULT '0',
  `completionpass` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quiz_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The settings for each quiz.';

-- Copiando dados para a tabela capacitacoes.mdl_quiz: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_quiz` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_quiz_attempts
CREATE TABLE IF NOT EXISTS `mdl_quiz_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` mediumint(6) NOT NULL DEFAULT '0',
  `uniqueid` bigint(10) NOT NULL DEFAULT '0',
  `layout` longtext COLLATE utf8_unicode_ci NOT NULL,
  `currentpage` bigint(10) NOT NULL DEFAULT '0',
  `preview` smallint(3) NOT NULL DEFAULT '0',
  `state` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inprogress',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timefinish` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timecheckstate` bigint(10) DEFAULT '0',
  `sumgrades` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizatte_quiuseatt_uix` (`quiz`,`userid`,`attempt`),
  UNIQUE KEY `mdl_quizatte_uni_uix` (`uniqueid`),
  KEY `mdl_quizatte_statim_ix` (`state`,`timecheckstate`),
  KEY `mdl_quizatte_qui_ix` (`quiz`),
  KEY `mdl_quizatte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores users attempts at quizzes.';

-- Copiando dados para a tabela capacitacoes.mdl_quiz_attempts: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_quiz_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_attempts` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_quiz_feedback
CREATE TABLE IF NOT EXISTS `mdl_quiz_feedback` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) NOT NULL DEFAULT '0',
  `feedbacktext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedbacktextformat` tinyint(2) NOT NULL DEFAULT '0',
  `mingrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `maxgrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`),
  KEY `mdl_quizfeed_qui_ix` (`quizid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Feedback given to students based on which grade band their o';

-- Copiando dados para a tabela capacitacoes.mdl_quiz_feedback: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_quiz_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_feedback` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_quiz_grades
CREATE TABLE IF NOT EXISTS `mdl_quiz_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quizgrad_use_ix` (`userid`),
  KEY `mdl_quizgrad_qui_ix` (`quiz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the overall grade for each user on the quiz, based on';

-- Copiando dados para a tabela capacitacoes.mdl_quiz_grades: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_quiz_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_grades` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_quiz_overrides
CREATE TABLE IF NOT EXISTS `mdl_quiz_overrides` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) DEFAULT NULL,
  `userid` bigint(10) DEFAULT NULL,
  `timeopen` bigint(10) DEFAULT NULL,
  `timeclose` bigint(10) DEFAULT NULL,
  `timelimit` bigint(10) DEFAULT NULL,
  `attempts` mediumint(6) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quizover_qui_ix` (`quiz`),
  KEY `mdl_quizover_gro_ix` (`groupid`),
  KEY `mdl_quizover_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The overrides to quiz settings on a per-user and per-group b';

-- Copiando dados para a tabela capacitacoes.mdl_quiz_overrides: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_quiz_overrides` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_overrides` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_quiz_overview_regrades
CREATE TABLE IF NOT EXISTS `mdl_quiz_overview_regrades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `newfraction` decimal(12,7) DEFAULT NULL,
  `oldfraction` decimal(12,7) DEFAULT NULL,
  `regraded` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table records which question attempts need regrading an';

-- Copiando dados para a tabela capacitacoes.mdl_quiz_overview_regrades: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_quiz_overview_regrades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_overview_regrades` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_quiz_reports
CREATE TABLE IF NOT EXISTS `mdl_quiz_reports` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayorder` bigint(10) NOT NULL,
  `capability` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizrepo_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists all the installed quiz reports and their display order';

-- Copiando dados para a tabela capacitacoes.mdl_quiz_reports: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_quiz_reports` DISABLE KEYS */;
INSERT INTO `mdl_quiz_reports` (`id`, `name`, `displayorder`, `capability`) VALUES
	(1, 'grading', 6000, 'mod/quiz:grade'),
	(2, 'overview', 10000, NULL),
	(3, 'responses', 9000, NULL),
	(4, 'statistics', 8000, 'quiz/statistics:view');
/*!40000 ALTER TABLE `mdl_quiz_reports` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_quiz_sections
CREATE TABLE IF NOT EXISTS `mdl_quiz_sections` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) NOT NULL,
  `firstslot` bigint(10) NOT NULL,
  `heading` varchar(1333) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shufflequestions` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizsect_quifir_uix` (`quizid`,`firstslot`),
  KEY `mdl_quizsect_qui_ix` (`quizid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores sections of a quiz with section name (heading), from ';

-- Copiando dados para a tabela capacitacoes.mdl_quiz_sections: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_quiz_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_sections` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_quiz_slots
CREATE TABLE IF NOT EXISTS `mdl_quiz_slots` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `slot` bigint(10) NOT NULL,
  `quizid` bigint(10) NOT NULL DEFAULT '0',
  `page` bigint(10) NOT NULL,
  `requireprevious` smallint(4) NOT NULL DEFAULT '0',
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `maxmark` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizslot_quislo_uix` (`quizid`,`slot`),
  KEY `mdl_quizslot_qui_ix` (`quizid`),
  KEY `mdl_quizslot_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the question used in a quiz, with the order, and for ';

-- Copiando dados para a tabela capacitacoes.mdl_quiz_slots: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_quiz_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_slots` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_quiz_statistics
CREATE TABLE IF NOT EXISTS `mdl_quiz_statistics` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `whichattempts` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstattemptscount` bigint(10) NOT NULL,
  `highestattemptscount` bigint(10) NOT NULL,
  `lastattemptscount` bigint(10) NOT NULL,
  `allattemptscount` bigint(10) NOT NULL,
  `firstattemptsavg` decimal(15,5) DEFAULT NULL,
  `highestattemptsavg` decimal(15,5) DEFAULT NULL,
  `lastattemptsavg` decimal(15,5) DEFAULT NULL,
  `allattemptsavg` decimal(15,5) DEFAULT NULL,
  `median` decimal(15,5) DEFAULT NULL,
  `standarddeviation` decimal(15,5) DEFAULT NULL,
  `skewness` decimal(15,10) DEFAULT NULL,
  `kurtosis` decimal(15,5) DEFAULT NULL,
  `cic` decimal(15,10) DEFAULT NULL,
  `errorratio` decimal(15,10) DEFAULT NULL,
  `standarderror` decimal(15,10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='table to cache results from analysis done in statistics repo';

-- Copiando dados para a tabela capacitacoes.mdl_quiz_statistics: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_quiz_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_statistics` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_rating
CREATE TABLE IF NOT EXISTS `mdl_rating` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ratingarea` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `scaleid` bigint(10) NOT NULL,
  `rating` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_rati_comratconite_ix` (`component`,`ratingarea`,`contextid`,`itemid`),
  KEY `mdl_rati_con_ix` (`contextid`),
  KEY `mdl_rati_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle ratings';

-- Copiando dados para a tabela capacitacoes.mdl_rating: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_rating` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_registration_hubs
CREATE TABLE IF NOT EXISTS `mdl_registration_hubs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hubname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `huburl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='hub where the site is registered on with their associated to';

-- Copiando dados para a tabela capacitacoes.mdl_registration_hubs: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_registration_hubs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_registration_hubs` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_repository
CREATE TABLE IF NOT EXISTS `mdl_repository` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) DEFAULT '1',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains one entry for every configured external ';

-- Copiando dados para a tabela capacitacoes.mdl_repository: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_repository` DISABLE KEYS */;
INSERT INTO `mdl_repository` (`id`, `type`, `visible`, `sortorder`) VALUES
	(1, 'areafiles', 1, 1),
	(2, 'local', 1, 2),
	(3, 'recent', 1, 3),
	(4, 'upload', 1, 4),
	(5, 'url', 1, 5),
	(6, 'user', 1, 6),
	(7, 'wikimedia', 1, 7);
/*!40000 ALTER TABLE `mdl_repository` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_repository_instances
CREATE TABLE IF NOT EXISTS `mdl_repository_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `typeid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains one entry for every configured external ';

-- Copiando dados para a tabela capacitacoes.mdl_repository_instances: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_repository_instances` DISABLE KEYS */;
INSERT INTO `mdl_repository_instances` (`id`, `name`, `typeid`, `userid`, `contextid`, `username`, `password`, `timecreated`, `timemodified`, `readonly`) VALUES
	(1, '', 1, 0, 2, NULL, NULL, 1475503575, 1475503575, 0),
	(2, '', 2, 0, 2, NULL, NULL, 1475503580, 1475503580, 0),
	(3, '', 3, 0, 2, NULL, NULL, 1475503582, 1475503582, 0),
	(4, '', 4, 0, 2, NULL, NULL, 1475503584, 1475503584, 0),
	(5, '', 5, 0, 2, NULL, NULL, 1475503585, 1475503585, 0),
	(6, '', 6, 0, 2, NULL, NULL, 1475503585, 1475503585, 0),
	(7, '', 7, 0, 2, NULL, NULL, 1475503588, 1475503588, 0);
/*!40000 ALTER TABLE `mdl_repository_instances` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_repository_instance_config
CREATE TABLE IF NOT EXISTS `mdl_repository_instance_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The config for intances';

-- Copiando dados para a tabela capacitacoes.mdl_repository_instance_config: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_repository_instance_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_repository_instance_config` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_resource
CREATE TABLE IF NOT EXISTS `mdl_resource` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `tobemigrated` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext COLLATE utf8_unicode_ci,
  `filterfiles` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_reso_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one resource and its config data';

-- Copiando dados para a tabela capacitacoes.mdl_resource: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_resource` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_resource_old
CREATE TABLE IF NOT EXISTS `mdl_resource_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alltext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `popup` longtext COLLATE utf8_unicode_ci NOT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `cmid` bigint(10) DEFAULT NULL,
  `newmodule` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  `migrated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_resoold_old_uix` (`oldid`),
  KEY `mdl_resoold_cmi_ix` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='backup of all old resource instances from 1.9';

-- Copiando dados para a tabela capacitacoes.mdl_resource_old: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_resource_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_resource_old` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_role
CREATE TABLE IF NOT EXISTS `mdl_role` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `archetype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_role_sor_uix` (`sortorder`),
  UNIQUE KEY `mdl_role_sho_uix` (`shortname`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle roles';

-- Copiando dados para a tabela capacitacoes.mdl_role: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_role` DISABLE KEYS */;
INSERT INTO `mdl_role` (`id`, `name`, `shortname`, `description`, `sortorder`, `archetype`) VALUES
	(1, '', 'manager', '', 1, 'manager'),
	(2, '', 'coursecreator', '', 2, 'coursecreator'),
	(3, '', 'editingteacher', '', 3, 'editingteacher'),
	(4, '', 'teacher', '', 4, 'teacher'),
	(5, '', 'student', '', 5, 'student'),
	(6, '', 'guest', '', 6, 'guest'),
	(7, '', 'user', '', 7, 'user'),
	(8, '', 'frontpage', '', 8, 'frontpage');
/*!40000 ALTER TABLE `mdl_role` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_role_allow_assign
CREATE TABLE IF NOT EXISTS `mdl_role_allow_assign` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowassign` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloassi_rolall_uix` (`roleid`,`allowassign`),
  KEY `mdl_rolealloassi_rol_ix` (`roleid`),
  KEY `mdl_rolealloassi_all_ix` (`allowassign`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines what role can assign what role';

-- Copiando dados para a tabela capacitacoes.mdl_role_allow_assign: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_role_allow_assign` DISABLE KEYS */;
INSERT INTO `mdl_role_allow_assign` (`id`, `roleid`, `allowassign`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(4, 1, 4),
	(5, 1, 5),
	(6, 3, 4),
	(7, 3, 5);
/*!40000 ALTER TABLE `mdl_role_allow_assign` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_role_allow_override
CREATE TABLE IF NOT EXISTS `mdl_role_allow_override` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowoverride` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloover_rolall_uix` (`roleid`,`allowoverride`),
  KEY `mdl_rolealloover_rol_ix` (`roleid`),
  KEY `mdl_rolealloover_all_ix` (`allowoverride`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines what role can override what role';

-- Copiando dados para a tabela capacitacoes.mdl_role_allow_override: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_role_allow_override` DISABLE KEYS */;
INSERT INTO `mdl_role_allow_override` (`id`, `roleid`, `allowoverride`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(4, 1, 4),
	(5, 1, 5),
	(6, 1, 6),
	(7, 1, 7),
	(8, 1, 8),
	(9, 3, 4),
	(10, 3, 5),
	(11, 3, 6);
/*!40000 ALTER TABLE `mdl_role_allow_override` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_role_allow_switch
CREATE TABLE IF NOT EXISTS `mdl_role_allow_switch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL,
  `allowswitch` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloswit_rolall_uix` (`roleid`,`allowswitch`),
  KEY `mdl_rolealloswit_rol_ix` (`roleid`),
  KEY `mdl_rolealloswit_all_ix` (`allowswitch`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores which which other roles a user is allowed ';

-- Copiando dados para a tabela capacitacoes.mdl_role_allow_switch: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_role_allow_switch` DISABLE KEYS */;
INSERT INTO `mdl_role_allow_switch` (`id`, `roleid`, `allowswitch`) VALUES
	(1, 1, 3),
	(2, 1, 4),
	(3, 1, 5),
	(4, 1, 6),
	(5, 3, 4),
	(6, 3, 5),
	(7, 3, 6),
	(8, 4, 5),
	(9, 4, 6);
/*!40000 ALTER TABLE `mdl_role_allow_switch` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_role_assignments
CREATE TABLE IF NOT EXISTS `mdl_role_assignments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_roleassi_sor_ix` (`sortorder`),
  KEY `mdl_roleassi_rolcon_ix` (`roleid`,`contextid`),
  KEY `mdl_roleassi_useconrol_ix` (`userid`,`contextid`,`roleid`),
  KEY `mdl_roleassi_comiteuse_ix` (`component`,`itemid`,`userid`),
  KEY `mdl_roleassi_rol_ix` (`roleid`),
  KEY `mdl_roleassi_con_ix` (`contextid`),
  KEY `mdl_roleassi_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='assigning roles in different context';

-- Copiando dados para a tabela capacitacoes.mdl_role_assignments: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_role_assignments` DISABLE KEYS */;
INSERT INTO `mdl_role_assignments` (`id`, `roleid`, `contextid`, `userid`, `timemodified`, `modifierid`, `component`, `itemid`, `sortorder`) VALUES
	(1, 5, 31, 3, 1475527314, 2, '', 0, 0),
	(2, 5, 31, 4, 1475527315, 2, '', 0, 0),
	(3, 5, 36, 3, 1475527350, 2, '', 0, 0),
	(4, 5, 36, 4, 1475527352, 2, '', 0, 0),
	(5, 5, 41, 4, 1475527371, 2, '', 0, 0),
	(6, 5, 41, 3, 1475527372, 2, '', 0, 0);
/*!40000 ALTER TABLE `mdl_role_assignments` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_role_capabilities
CREATE TABLE IF NOT EXISTS `mdl_role_capabilities` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `capability` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `permission` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecapa_rolconcap_uix` (`roleid`,`contextid`,`capability`),
  KEY `mdl_rolecapa_rol_ix` (`roleid`),
  KEY `mdl_rolecapa_con_ix` (`contextid`),
  KEY `mdl_rolecapa_mod_ix` (`modifierid`),
  KEY `mdl_rolecapa_cap_ix` (`capability`)
) ENGINE=InnoDB AUTO_INCREMENT=1234 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='permission has to be signed, overriding a capability for a p';

-- Copiando dados para a tabela capacitacoes.mdl_role_capabilities: ~1.319 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_role_capabilities` DISABLE KEYS */;
INSERT INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
	(1, 2, 1, 'moodle/site:readallmessages', 1, 1475503299, 0),
	(2, 2, 3, 'moodle/site:readallmessages', 1, 1475503299, 0),
	(3, 2, 1, 'moodle/site:deleteanymessage', 1, 1475503299, 0),
	(4, 2, 1, 'moodle/site:sendmessage', 1, 1475503299, 0),
	(5, 2, 7, 'moodle/site:sendmessage', 1, 1475503299, 0),
	(6, 2, 7, 'moodle/site:deleteownmessage', 1, 1475503299, 0),
	(7, 2, 1, 'moodle/site:approvecourse', 1, 1475503300, 0),
	(8, 2, 3, 'moodle/backup:backupcourse', 1, 1475503300, 0),
	(9, 2, 1, 'moodle/backup:backupcourse', 1, 1475503300, 0),
	(10, 2, 3, 'moodle/backup:backupsection', 1, 1475503300, 0),
	(11, 2, 1, 'moodle/backup:backupsection', 1, 1475503300, 0),
	(12, 2, 3, 'moodle/backup:backupactivity', 1, 1475503301, 0),
	(13, 2, 1, 'moodle/backup:backupactivity', 1, 1475503301, 0),
	(14, 2, 3, 'moodle/backup:backuptargethub', 1, 1475503301, 0),
	(15, 2, 1, 'moodle/backup:backuptargethub', 1, 1475503301, 0),
	(16, 2, 3, 'moodle/backup:backuptargetimport', 1, 1475503301, 0),
	(17, 2, 1, 'moodle/backup:backuptargetimport', 1, 1475503301, 0),
	(18, 2, 3, 'moodle/backup:downloadfile', 1, 1475503301, 0),
	(19, 2, 1, 'moodle/backup:downloadfile', 1, 1475503301, 0),
	(20, 2, 3, 'moodle/backup:configure', 1, 1475503301, 0),
	(21, 2, 1, 'moodle/backup:configure', 1, 1475503301, 0),
	(22, 2, 1, 'moodle/backup:userinfo', 1, 1475503301, 0),
	(23, 2, 1, 'moodle/backup:anonymise', 1, 1475503302, 0),
	(24, 2, 3, 'moodle/restore:restorecourse', 1, 1475503302, 0),
	(25, 2, 1, 'moodle/restore:restorecourse', 1, 1475503302, 0),
	(26, 2, 3, 'moodle/restore:restoresection', 1, 1475503302, 0),
	(27, 2, 1, 'moodle/restore:restoresection', 1, 1475503302, 0),
	(28, 2, 3, 'moodle/restore:restoreactivity', 1, 1475503302, 0),
	(29, 2, 1, 'moodle/restore:restoreactivity', 1, 1475503302, 0),
	(30, 2, 3, 'moodle/restore:restoretargethub', 1, 1475503302, 0),
	(31, 2, 1, 'moodle/restore:restoretargethub', 1, 1475503302, 0),
	(32, 2, 3, 'moodle/restore:restoretargetimport', 1, 1475503302, 0),
	(33, 2, 1, 'moodle/restore:restoretargetimport', 1, 1475503302, 0),
	(34, 2, 3, 'moodle/restore:uploadfile', 1, 1475503302, 0),
	(35, 2, 1, 'moodle/restore:uploadfile', 1, 1475503303, 0),
	(36, 2, 3, 'moodle/restore:configure', 1, 1475503303, 0),
	(37, 2, 1, 'moodle/restore:configure', 1, 1475503303, 0),
	(38, 2, 2, 'moodle/restore:rolldates', 1, 1475503303, 0),
	(39, 2, 1, 'moodle/restore:rolldates', 1, 1475503303, 0),
	(40, 2, 1, 'moodle/restore:userinfo', 1, 1475503303, 0),
	(41, 2, 1, 'moodle/restore:createuser', 1, 1475503303, 0),
	(42, 2, 3, 'moodle/site:manageblocks', 1, 1475503303, 0),
	(43, 2, 1, 'moodle/site:manageblocks', 1, 1475503303, 0),
	(44, 2, 4, 'moodle/site:accessallgroups', 1, 1475503303, 0),
	(45, 2, 3, 'moodle/site:accessallgroups', 1, 1475503303, 0),
	(46, 2, 1, 'moodle/site:accessallgroups', 1, 1475503303, 0),
	(47, 2, 4, 'moodle/site:viewfullnames', 1, 1475503304, 0),
	(48, 2, 3, 'moodle/site:viewfullnames', 1, 1475503304, 0),
	(49, 2, 1, 'moodle/site:viewfullnames', 1, 1475503304, 0),
	(50, 2, 4, 'moodle/site:viewuseridentity', 1, 1475503304, 0),
	(51, 2, 3, 'moodle/site:viewuseridentity', 1, 1475503304, 0),
	(52, 2, 1, 'moodle/site:viewuseridentity', 1, 1475503304, 0),
	(53, 2, 4, 'moodle/site:viewreports', 1, 1475503304, 0),
	(54, 2, 3, 'moodle/site:viewreports', 1, 1475503304, 0),
	(55, 2, 1, 'moodle/site:viewreports', 1, 1475503304, 0),
	(56, 2, 3, 'moodle/site:trustcontent', 1, 1475503304, 0),
	(57, 2, 1, 'moodle/site:trustcontent', 1, 1475503304, 0),
	(58, 2, 1, 'moodle/site:uploadusers', 1, 1475503304, 0),
	(59, 2, 3, 'moodle/filter:manage', 1, 1475503305, 0),
	(60, 2, 1, 'moodle/filter:manage', 1, 1475503305, 0),
	(61, 2, 1, 'moodle/user:create', 1, 1475503305, 0),
	(62, 2, 1, 'moodle/user:delete', 1, 1475503305, 0),
	(63, 2, 1, 'moodle/user:update', 1, 1475503305, 0),
	(64, 2, 6, 'moodle/user:viewdetails', 1, 1475503305, 0),
	(65, 2, 5, 'moodle/user:viewdetails', 1, 1475503305, 0),
	(66, 2, 4, 'moodle/user:viewdetails', 1, 1475503305, 0),
	(67, 2, 3, 'moodle/user:viewdetails', 1, 1475503305, 0),
	(68, 2, 1, 'moodle/user:viewdetails', 1, 1475503305, 0),
	(69, 2, 1, 'moodle/user:viewalldetails', 1, 1475503305, 0),
	(70, 2, 1, 'moodle/user:viewlastip', 1, 1475503306, 0),
	(71, 2, 4, 'moodle/user:viewhiddendetails', 1, 1475503306, 0),
	(72, 2, 3, 'moodle/user:viewhiddendetails', 1, 1475503306, 0),
	(73, 2, 1, 'moodle/user:viewhiddendetails', 1, 1475503306, 0),
	(74, 2, 1, 'moodle/user:loginas', 1, 1475503306, 0),
	(75, 2, 1, 'moodle/user:managesyspages', 1, 1475503306, 0),
	(76, 2, 7, 'moodle/user:manageownblocks', 1, 1475503306, 0),
	(77, 2, 7, 'moodle/user:manageownfiles', 1, 1475503306, 0),
	(78, 2, 1, 'moodle/my:configsyspages', 1, 1475503306, 0),
	(79, 2, 3, 'moodle/role:assign', 1, 1475503306, 0),
	(80, 2, 1, 'moodle/role:assign', 1, 1475503306, 0),
	(81, 2, 4, 'moodle/role:review', 1, 1475503306, 0),
	(82, 2, 3, 'moodle/role:review', 1, 1475503307, 0),
	(83, 2, 1, 'moodle/role:review', 1, 1475503307, 0),
	(84, 2, 1, 'moodle/role:override', 1, 1475503307, 0),
	(85, 2, 3, 'moodle/role:safeoverride', 1, 1475503307, 0),
	(86, 2, 1, 'moodle/role:manage', 1, 1475503307, 0),
	(87, 2, 3, 'moodle/role:switchroles', 1, 1475503307, 0),
	(88, 2, 1, 'moodle/role:switchroles', 1, 1475503307, 0),
	(89, 2, 1, 'moodle/category:manage', 1, 1475503307, 0),
	(90, 2, 2, 'moodle/category:viewhiddencategories', 1, 1475503307, 0),
	(91, 2, 1, 'moodle/category:viewhiddencategories', 1, 1475503307, 0),
	(92, 2, 1, 'moodle/cohort:manage', 1, 1475503307, 0),
	(93, 2, 1, 'moodle/cohort:assign', 1, 1475503307, 0),
	(94, 2, 3, 'moodle/cohort:view', 1, 1475503308, 0),
	(95, 2, 1, 'moodle/cohort:view', 1, 1475503308, 0),
	(96, 2, 2, 'moodle/course:create', 1, 1475503308, 0),
	(97, 2, 1, 'moodle/course:create', 1, 1475503308, 0),
	(98, 2, 7, 'moodle/course:request', 1, 1475503308, 0),
	(99, 2, 1, 'moodle/course:delete', 1, 1475503308, 0),
	(100, 2, 3, 'moodle/course:update', 1, 1475503308, 0),
	(101, 2, 1, 'moodle/course:update', 1, 1475503308, 0),
	(102, 2, 1, 'moodle/course:view', 1, 1475503308, 0),
	(103, 2, 3, 'moodle/course:enrolreview', 1, 1475503308, 0),
	(104, 2, 1, 'moodle/course:enrolreview', 1, 1475503308, 0),
	(105, 2, 3, 'moodle/course:enrolconfig', 1, 1475503309, 0),
	(106, 2, 1, 'moodle/course:enrolconfig', 1, 1475503309, 0),
	(107, 2, 3, 'moodle/course:reviewotherusers', 1, 1475503309, 0),
	(108, 2, 1, 'moodle/course:reviewotherusers', 1, 1475503309, 0),
	(109, 2, 4, 'moodle/course:bulkmessaging', 1, 1475503309, 0),
	(110, 2, 3, 'moodle/course:bulkmessaging', 1, 1475503309, 0),
	(111, 2, 1, 'moodle/course:bulkmessaging', 1, 1475503309, 0),
	(112, 2, 4, 'moodle/course:viewhiddenuserfields', 1, 1475503309, 0),
	(113, 2, 3, 'moodle/course:viewhiddenuserfields', 1, 1475503309, 0),
	(114, 2, 1, 'moodle/course:viewhiddenuserfields', 1, 1475503309, 0),
	(115, 2, 2, 'moodle/course:viewhiddencourses', 1, 1475503309, 0),
	(116, 2, 4, 'moodle/course:viewhiddencourses', 1, 1475503309, 0),
	(117, 2, 3, 'moodle/course:viewhiddencourses', 1, 1475503309, 0),
	(118, 2, 1, 'moodle/course:viewhiddencourses', 1, 1475503309, 0),
	(119, 2, 3, 'moodle/course:visibility', 1, 1475503309, 0),
	(120, 2, 1, 'moodle/course:visibility', 1, 1475503309, 0),
	(121, 2, 3, 'moodle/course:managefiles', 1, 1475503310, 0),
	(122, 2, 1, 'moodle/course:managefiles', 1, 1475503310, 0),
	(123, 2, 3, 'moodle/course:manageactivities', 1, 1475503310, 0),
	(124, 2, 1, 'moodle/course:manageactivities', 1, 1475503310, 0),
	(125, 2, 3, 'moodle/course:activityvisibility', 1, 1475503310, 0),
	(126, 2, 1, 'moodle/course:activityvisibility', 1, 1475503310, 0),
	(127, 2, 4, 'moodle/course:viewhiddenactivities', 1, 1475503310, 0),
	(128, 2, 3, 'moodle/course:viewhiddenactivities', 1, 1475503310, 0),
	(129, 2, 1, 'moodle/course:viewhiddenactivities', 1, 1475503310, 0),
	(130, 2, 5, 'moodle/course:viewparticipants', 1, 1475503310, 0),
	(131, 2, 4, 'moodle/course:viewparticipants', 1, 1475503310, 0),
	(132, 2, 3, 'moodle/course:viewparticipants', 1, 1475503310, 0),
	(133, 2, 1, 'moodle/course:viewparticipants', 1, 1475503310, 0),
	(134, 2, 3, 'moodle/course:changefullname', 1, 1475503310, 0),
	(135, 2, 1, 'moodle/course:changefullname', 1, 1475503310, 0),
	(136, 2, 3, 'moodle/course:changeshortname', 1, 1475503310, 0),
	(137, 2, 1, 'moodle/course:changeshortname', 1, 1475503311, 0),
	(138, 2, 3, 'moodle/course:renameroles', 1, 1475503311, 0),
	(139, 2, 1, 'moodle/course:renameroles', 1, 1475503311, 0),
	(140, 2, 3, 'moodle/course:changeidnumber', 1, 1475503311, 0),
	(141, 2, 1, 'moodle/course:changeidnumber', 1, 1475503311, 0),
	(142, 2, 3, 'moodle/course:changecategory', 1, 1475503311, 0),
	(143, 2, 1, 'moodle/course:changecategory', 1, 1475503311, 0),
	(144, 2, 3, 'moodle/course:changesummary', 1, 1475503311, 0),
	(145, 2, 1, 'moodle/course:changesummary', 1, 1475503311, 0),
	(146, 2, 1, 'moodle/site:viewparticipants', 1, 1475503312, 0),
	(147, 2, 5, 'moodle/course:isincompletionreports', 1, 1475503312, 0),
	(148, 2, 5, 'moodle/course:viewscales', 1, 1475503312, 0),
	(149, 2, 4, 'moodle/course:viewscales', 1, 1475503312, 0),
	(150, 2, 3, 'moodle/course:viewscales', 1, 1475503312, 0),
	(151, 2, 1, 'moodle/course:viewscales', 1, 1475503312, 0),
	(152, 2, 3, 'moodle/course:managescales', 1, 1475503312, 0),
	(153, 2, 1, 'moodle/course:managescales', 1, 1475503312, 0),
	(154, 2, 3, 'moodle/course:managegroups', 1, 1475503312, 0),
	(155, 2, 1, 'moodle/course:managegroups', 1, 1475503312, 0),
	(156, 2, 3, 'moodle/course:reset', 1, 1475503312, 0),
	(157, 2, 1, 'moodle/course:reset', 1, 1475503312, 0),
	(158, 2, 3, 'moodle/course:viewsuspendedusers', 1, 1475503313, 0),
	(159, 2, 1, 'moodle/course:viewsuspendedusers', 1, 1475503313, 0),
	(160, 2, 1, 'moodle/course:tag', 1, 1475503313, 0),
	(161, 2, 3, 'moodle/course:tag', 1, 1475503313, 0),
	(162, 2, 6, 'moodle/blog:view', 1, 1475503313, 0),
	(163, 2, 7, 'moodle/blog:view', 1, 1475503313, 0),
	(164, 2, 5, 'moodle/blog:view', 1, 1475503313, 0),
	(165, 2, 4, 'moodle/blog:view', 1, 1475503313, 0),
	(166, 2, 3, 'moodle/blog:view', 1, 1475503313, 0),
	(167, 2, 1, 'moodle/blog:view', 1, 1475503313, 0),
	(168, 2, 6, 'moodle/blog:search', 1, 1475503313, 0),
	(169, 2, 7, 'moodle/blog:search', 1, 1475503313, 0),
	(170, 2, 5, 'moodle/blog:search', 1, 1475503313, 0),
	(171, 2, 4, 'moodle/blog:search', 1, 1475503313, 0),
	(172, 2, 3, 'moodle/blog:search', 1, 1475503313, 0),
	(173, 2, 1, 'moodle/blog:search', 1, 1475503313, 0),
	(174, 2, 1, 'moodle/blog:viewdrafts', 1, 1475503313, 0),
	(175, 2, 7, 'moodle/blog:create', 1, 1475503313, 0),
	(176, 2, 1, 'moodle/blog:create', 1, 1475503314, 0),
	(177, 2, 4, 'moodle/blog:manageentries', 1, 1475503314, 0),
	(178, 2, 3, 'moodle/blog:manageentries', 1, 1475503314, 0),
	(179, 2, 1, 'moodle/blog:manageentries', 1, 1475503314, 0),
	(180, 2, 5, 'moodle/blog:manageexternal', 1, 1475503314, 0),
	(181, 2, 7, 'moodle/blog:manageexternal', 1, 1475503314, 0),
	(182, 2, 4, 'moodle/blog:manageexternal', 1, 1475503314, 0),
	(183, 2, 3, 'moodle/blog:manageexternal', 1, 1475503314, 0),
	(184, 2, 1, 'moodle/blog:manageexternal', 1, 1475503314, 0),
	(185, 2, 7, 'moodle/calendar:manageownentries', 1, 1475503314, 0),
	(186, 2, 1, 'moodle/calendar:manageownentries', 1, 1475503314, 0),
	(187, 2, 4, 'moodle/calendar:managegroupentries', 1, 1475503314, 0),
	(188, 2, 3, 'moodle/calendar:managegroupentries', 1, 1475503314, 0),
	(189, 2, 1, 'moodle/calendar:managegroupentries', 1, 1475503314, 0),
	(190, 2, 4, 'moodle/calendar:manageentries', 1, 1475503314, 0),
	(191, 2, 3, 'moodle/calendar:manageentries', 1, 1475503314, 0),
	(192, 2, 1, 'moodle/calendar:manageentries', 1, 1475503314, 0),
	(193, 2, 1, 'moodle/user:editprofile', 1, 1475503315, 0),
	(194, 2, 6, 'moodle/user:editownprofile', -1000, 1475503315, 0),
	(195, 2, 7, 'moodle/user:editownprofile', 1, 1475503315, 0),
	(196, 2, 1, 'moodle/user:editownprofile', 1, 1475503315, 0),
	(197, 2, 6, 'moodle/user:changeownpassword', -1000, 1475503315, 0),
	(198, 2, 7, 'moodle/user:changeownpassword', 1, 1475503315, 0),
	(199, 2, 1, 'moodle/user:changeownpassword', 1, 1475503315, 0),
	(200, 2, 5, 'moodle/user:readuserposts', 1, 1475503315, 0),
	(201, 2, 4, 'moodle/user:readuserposts', 1, 1475503315, 0),
	(202, 2, 3, 'moodle/user:readuserposts', 1, 1475503315, 0),
	(203, 2, 1, 'moodle/user:readuserposts', 1, 1475503315, 0),
	(204, 2, 5, 'moodle/user:readuserblogs', 1, 1475503315, 0),
	(205, 2, 4, 'moodle/user:readuserblogs', 1, 1475503315, 0),
	(206, 2, 3, 'moodle/user:readuserblogs', 1, 1475503315, 0),
	(207, 2, 1, 'moodle/user:readuserblogs', 1, 1475503315, 0),
	(208, 2, 1, 'moodle/user:editmessageprofile', 1, 1475503315, 0),
	(209, 2, 6, 'moodle/user:editownmessageprofile', -1000, 1475503315, 0),
	(210, 2, 7, 'moodle/user:editownmessageprofile', 1, 1475503316, 0),
	(211, 2, 1, 'moodle/user:editownmessageprofile', 1, 1475503316, 0),
	(212, 2, 3, 'moodle/question:managecategory', 1, 1475503316, 0),
	(213, 2, 1, 'moodle/question:managecategory', 1, 1475503316, 0),
	(214, 2, 3, 'moodle/question:add', 1, 1475503316, 0),
	(215, 2, 1, 'moodle/question:add', 1, 1475503316, 0),
	(216, 2, 3, 'moodle/question:editmine', 1, 1475503316, 0),
	(217, 2, 1, 'moodle/question:editmine', 1, 1475503316, 0),
	(218, 2, 3, 'moodle/question:editall', 1, 1475503316, 0),
	(219, 2, 1, 'moodle/question:editall', 1, 1475503316, 0),
	(220, 2, 3, 'moodle/question:viewmine', 1, 1475503316, 0),
	(221, 2, 1, 'moodle/question:viewmine', 1, 1475503316, 0),
	(222, 2, 3, 'moodle/question:viewall', 1, 1475503316, 0),
	(223, 2, 1, 'moodle/question:viewall', 1, 1475503316, 0),
	(224, 2, 3, 'moodle/question:usemine', 1, 1475503316, 0),
	(225, 2, 1, 'moodle/question:usemine', 1, 1475503316, 0),
	(226, 2, 3, 'moodle/question:useall', 1, 1475503317, 0),
	(227, 2, 1, 'moodle/question:useall', 1, 1475503317, 0),
	(228, 2, 3, 'moodle/question:movemine', 1, 1475503317, 0),
	(229, 2, 1, 'moodle/question:movemine', 1, 1475503317, 0),
	(230, 2, 3, 'moodle/question:moveall', 1, 1475503317, 0),
	(231, 2, 1, 'moodle/question:moveall', 1, 1475503317, 0),
	(232, 2, 1, 'moodle/question:config', 1, 1475503317, 0),
	(233, 2, 5, 'moodle/question:flag', 1, 1475503317, 0),
	(234, 2, 4, 'moodle/question:flag', 1, 1475503317, 0),
	(235, 2, 3, 'moodle/question:flag', 1, 1475503317, 0),
	(236, 2, 1, 'moodle/question:flag', 1, 1475503317, 0),
	(237, 2, 4, 'moodle/site:doclinks', 1, 1475503317, 0),
	(238, 2, 3, 'moodle/site:doclinks', 1, 1475503317, 0),
	(239, 2, 1, 'moodle/site:doclinks', 1, 1475503317, 0),
	(240, 2, 3, 'moodle/course:sectionvisibility', 1, 1475503317, 0),
	(241, 2, 1, 'moodle/course:sectionvisibility', 1, 1475503317, 0),
	(242, 2, 3, 'moodle/course:useremail', 1, 1475503318, 0),
	(243, 2, 1, 'moodle/course:useremail', 1, 1475503318, 0),
	(244, 2, 3, 'moodle/course:viewhiddensections', 1, 1475503318, 0),
	(245, 2, 1, 'moodle/course:viewhiddensections', 1, 1475503318, 0),
	(246, 2, 3, 'moodle/course:setcurrentsection', 1, 1475503318, 0),
	(247, 2, 1, 'moodle/course:setcurrentsection', 1, 1475503318, 0),
	(248, 2, 3, 'moodle/course:movesections', 1, 1475503318, 0),
	(249, 2, 1, 'moodle/course:movesections', 1, 1475503318, 0),
	(250, 2, 4, 'moodle/grade:viewall', 1, 1475503318, 0),
	(251, 2, 3, 'moodle/grade:viewall', 1, 1475503318, 0),
	(252, 2, 1, 'moodle/grade:viewall', 1, 1475503318, 0),
	(253, 2, 5, 'moodle/grade:view', 1, 1475503318, 0),
	(254, 2, 4, 'moodle/grade:viewhidden', 1, 1475503318, 0),
	(255, 2, 3, 'moodle/grade:viewhidden', 1, 1475503318, 0),
	(256, 2, 1, 'moodle/grade:viewhidden', 1, 1475503318, 0),
	(257, 2, 3, 'moodle/grade:import', 1, 1475503319, 0),
	(258, 2, 1, 'moodle/grade:import', 1, 1475503319, 0),
	(259, 2, 4, 'moodle/grade:export', 1, 1475503319, 0),
	(260, 2, 3, 'moodle/grade:export', 1, 1475503319, 0),
	(261, 2, 1, 'moodle/grade:export', 1, 1475503319, 0),
	(262, 2, 3, 'moodle/grade:manage', 1, 1475503319, 0),
	(263, 2, 1, 'moodle/grade:manage', 1, 1475503319, 0),
	(264, 2, 3, 'moodle/grade:edit', 1, 1475503319, 0),
	(265, 2, 1, 'moodle/grade:edit', 1, 1475503319, 0),
	(266, 2, 3, 'moodle/grade:managegradingforms', 1, 1475503319, 0),
	(267, 2, 1, 'moodle/grade:managegradingforms', 1, 1475503319, 0),
	(268, 2, 1, 'moodle/grade:sharegradingforms', 1, 1475503319, 0),
	(269, 2, 1, 'moodle/grade:managesharedforms', 1, 1475503319, 0),
	(270, 2, 3, 'moodle/grade:manageoutcomes', 1, 1475503319, 0),
	(271, 2, 1, 'moodle/grade:manageoutcomes', 1, 1475503319, 0),
	(272, 2, 3, 'moodle/grade:manageletters', 1, 1475503319, 0),
	(273, 2, 1, 'moodle/grade:manageletters', 1, 1475503319, 0),
	(274, 2, 3, 'moodle/grade:hide', 1, 1475503320, 0),
	(275, 2, 1, 'moodle/grade:hide', 1, 1475503320, 0),
	(276, 2, 3, 'moodle/grade:lock', 1, 1475503320, 0),
	(277, 2, 1, 'moodle/grade:lock', 1, 1475503320, 0),
	(278, 2, 3, 'moodle/grade:unlock', 1, 1475503320, 0),
	(279, 2, 1, 'moodle/grade:unlock', 1, 1475503320, 0),
	(280, 2, 7, 'moodle/my:manageblocks', 1, 1475503320, 0),
	(281, 2, 4, 'moodle/notes:view', 1, 1475503320, 0),
	(282, 2, 3, 'moodle/notes:view', 1, 1475503320, 0),
	(283, 2, 1, 'moodle/notes:view', 1, 1475503320, 0),
	(284, 2, 4, 'moodle/notes:manage', 1, 1475503320, 0),
	(285, 2, 3, 'moodle/notes:manage', 1, 1475503320, 0),
	(286, 2, 1, 'moodle/notes:manage', 1, 1475503320, 0),
	(287, 2, 1, 'moodle/tag:manage', 1, 1475503320, 0),
	(288, 2, 1, 'moodle/tag:edit', 1, 1475503320, 0),
	(289, 2, 7, 'moodle/tag:flag', 1, 1475503320, 0),
	(290, 2, 4, 'moodle/tag:editblocks', 1, 1475503321, 0),
	(291, 2, 3, 'moodle/tag:editblocks', 1, 1475503321, 0),
	(292, 2, 1, 'moodle/tag:editblocks', 1, 1475503321, 0),
	(293, 2, 6, 'moodle/block:view', 1, 1475503321, 0),
	(294, 2, 7, 'moodle/block:view', 1, 1475503321, 0),
	(295, 2, 5, 'moodle/block:view', 1, 1475503321, 0),
	(296, 2, 4, 'moodle/block:view', 1, 1475503321, 0),
	(297, 2, 3, 'moodle/block:view', 1, 1475503321, 0),
	(298, 2, 3, 'moodle/block:edit', 1, 1475503321, 0),
	(299, 2, 1, 'moodle/block:edit', 1, 1475503321, 0),
	(300, 2, 7, 'moodle/portfolio:export', 1, 1475503321, 0),
	(301, 2, 5, 'moodle/portfolio:export', 1, 1475503321, 0),
	(302, 2, 4, 'moodle/portfolio:export', 1, 1475503321, 0),
	(303, 2, 3, 'moodle/portfolio:export', 1, 1475503321, 0),
	(304, 2, 8, 'moodle/comment:view', 1, 1475503321, 0),
	(305, 2, 6, 'moodle/comment:view', 1, 1475503321, 0),
	(306, 2, 7, 'moodle/comment:view', 1, 1475503321, 0),
	(307, 2, 5, 'moodle/comment:view', 1, 1475503321, 0),
	(308, 2, 4, 'moodle/comment:view', 1, 1475503321, 0),
	(309, 2, 3, 'moodle/comment:view', 1, 1475503322, 0),
	(310, 2, 1, 'moodle/comment:view', 1, 1475503322, 0),
	(311, 2, 7, 'moodle/comment:post', 1, 1475503322, 0),
	(312, 2, 5, 'moodle/comment:post', 1, 1475503322, 0),
	(313, 2, 4, 'moodle/comment:post', 1, 1475503322, 0),
	(314, 2, 3, 'moodle/comment:post', 1, 1475503322, 0),
	(315, 2, 1, 'moodle/comment:post', 1, 1475503322, 0),
	(316, 2, 3, 'moodle/comment:delete', 1, 1475503322, 0),
	(317, 2, 1, 'moodle/comment:delete', 1, 1475503322, 0),
	(318, 2, 1, 'moodle/webservice:createtoken', 1, 1475503322, 0),
	(319, 2, 7, 'moodle/webservice:createmobiletoken', 1, 1475503323, 0),
	(320, 2, 7, 'moodle/rating:view', 1, 1475503323, 0),
	(321, 2, 5, 'moodle/rating:view', 1, 1475503323, 0),
	(322, 2, 4, 'moodle/rating:view', 1, 1475503323, 0),
	(323, 2, 3, 'moodle/rating:view', 1, 1475503323, 0),
	(324, 2, 1, 'moodle/rating:view', 1, 1475503323, 0),
	(325, 2, 7, 'moodle/rating:viewany', 1, 1475503323, 0),
	(326, 2, 5, 'moodle/rating:viewany', 1, 1475503323, 0),
	(327, 2, 4, 'moodle/rating:viewany', 1, 1475503323, 0),
	(328, 2, 3, 'moodle/rating:viewany', 1, 1475503323, 0),
	(329, 2, 1, 'moodle/rating:viewany', 1, 1475503323, 0),
	(330, 2, 7, 'moodle/rating:viewall', 1, 1475503323, 0),
	(331, 2, 5, 'moodle/rating:viewall', 1, 1475503323, 0),
	(332, 2, 4, 'moodle/rating:viewall', 1, 1475503323, 0),
	(333, 2, 3, 'moodle/rating:viewall', 1, 1475503323, 0),
	(334, 2, 1, 'moodle/rating:viewall', 1, 1475503323, 0),
	(335, 2, 7, 'moodle/rating:rate', 1, 1475503323, 0),
	(336, 2, 5, 'moodle/rating:rate', 1, 1475503323, 0),
	(337, 2, 4, 'moodle/rating:rate', 1, 1475503323, 0),
	(338, 2, 3, 'moodle/rating:rate', 1, 1475503323, 0),
	(339, 2, 1, 'moodle/rating:rate', 1, 1475503323, 0),
	(340, 2, 1, 'moodle/course:publish', 1, 1475503324, 0),
	(341, 2, 4, 'moodle/course:markcomplete', 1, 1475503324, 0),
	(342, 2, 3, 'moodle/course:markcomplete', 1, 1475503324, 0),
	(343, 2, 1, 'moodle/course:markcomplete', 1, 1475503324, 0),
	(344, 2, 1, 'moodle/community:add', 1, 1475503324, 0),
	(345, 2, 4, 'moodle/community:add', 1, 1475503324, 0),
	(346, 2, 3, 'moodle/community:add', 1, 1475503324, 0),
	(347, 2, 1, 'moodle/community:download', 1, 1475503324, 0),
	(348, 2, 3, 'moodle/community:download', 1, 1475503324, 0),
	(349, 2, 1, 'moodle/badges:manageglobalsettings', 1, 1475503324, 0),
	(350, 2, 7, 'moodle/badges:viewbadges', 1, 1475503324, 0),
	(351, 2, 7, 'moodle/badges:manageownbadges', 1, 1475503324, 0),
	(352, 2, 7, 'moodle/badges:viewotherbadges', 1, 1475503324, 0),
	(353, 2, 7, 'moodle/badges:earnbadge', 1, 1475503325, 0),
	(354, 2, 1, 'moodle/badges:createbadge', 1, 1475503325, 0),
	(355, 2, 3, 'moodle/badges:createbadge', 1, 1475503325, 0),
	(356, 2, 1, 'moodle/badges:deletebadge', 1, 1475503325, 0),
	(357, 2, 3, 'moodle/badges:deletebadge', 1, 1475503325, 0),
	(358, 2, 1, 'moodle/badges:configuredetails', 1, 1475503325, 0),
	(359, 2, 3, 'moodle/badges:configuredetails', 1, 1475503325, 0),
	(360, 2, 1, 'moodle/badges:configurecriteria', 1, 1475503325, 0),
	(361, 2, 3, 'moodle/badges:configurecriteria', 1, 1475503325, 0),
	(362, 2, 1, 'moodle/badges:configuremessages', 1, 1475503325, 0),
	(363, 2, 3, 'moodle/badges:configuremessages', 1, 1475503325, 0),
	(364, 2, 1, 'moodle/badges:awardbadge', 1, 1475503325, 0),
	(365, 2, 4, 'moodle/badges:awardbadge', 1, 1475503325, 0),
	(366, 2, 3, 'moodle/badges:awardbadge', 1, 1475503325, 0),
	(367, 2, 1, 'moodle/badges:viewawarded', 1, 1475503325, 0),
	(368, 2, 4, 'moodle/badges:viewawarded', 1, 1475503325, 0),
	(369, 2, 3, 'moodle/badges:viewawarded', 1, 1475503325, 0),
	(370, 2, 6, 'moodle/search:query', 1, 1475503326, 0),
	(371, 2, 7, 'moodle/search:query', 1, 1475503326, 0),
	(372, 2, 5, 'moodle/search:query', 1, 1475503326, 0),
	(373, 2, 4, 'moodle/search:query', 1, 1475503326, 0),
	(374, 2, 3, 'moodle/search:query', 1, 1475503326, 0),
	(375, 2, 1, 'moodle/search:query', 1, 1475503326, 0),
	(376, 2, 1, 'moodle/competency:competencymanage', 1, 1475503326, 0),
	(377, 2, 7, 'moodle/competency:competencyview', 1, 1475503326, 0),
	(378, 2, 3, 'moodle/competency:competencygrade', 1, 1475503326, 0),
	(379, 2, 4, 'moodle/competency:competencygrade', 1, 1475503326, 0),
	(380, 2, 1, 'moodle/competency:competencygrade', 1, 1475503326, 0),
	(381, 2, 3, 'moodle/competency:coursecompetencymanage', 1, 1475503326, 0),
	(382, 2, 1, 'moodle/competency:coursecompetencymanage', 1, 1475503326, 0),
	(383, 2, 1, 'moodle/competency:coursecompetencyconfigure', 1, 1475503326, 0),
	(384, 2, 5, 'moodle/competency:coursecompetencygradable', 1, 1475503326, 0),
	(385, 2, 7, 'moodle/competency:coursecompetencyview', 1, 1475503326, 0),
	(386, 2, 1, 'moodle/competency:planmanage', 1, 1475503326, 0),
	(387, 2, 1, 'moodle/competency:planmanagedraft', 1, 1475503327, 0),
	(388, 2, 1, 'moodle/competency:planview', 1, 1475503327, 0),
	(389, 2, 1, 'moodle/competency:planviewdraft', 1, 1475503327, 0),
	(390, 2, 7, 'moodle/competency:planviewown', 1, 1475503327, 0),
	(391, 2, 1, 'moodle/competency:planrequestreview', 1, 1475503327, 0),
	(392, 2, 7, 'moodle/competency:planrequestreviewown', 1, 1475503327, 0),
	(393, 2, 1, 'moodle/competency:planreview', 1, 1475503327, 0),
	(394, 2, 1, 'moodle/competency:plancomment', 1, 1475503327, 0),
	(395, 2, 7, 'moodle/competency:plancommentown', 1, 1475503327, 0),
	(396, 2, 1, 'moodle/competency:usercompetencyview', 1, 1475503328, 0),
	(397, 2, 3, 'moodle/competency:usercompetencyview', 1, 1475503328, 0),
	(398, 2, 4, 'moodle/competency:usercompetencyview', 1, 1475503328, 0),
	(399, 2, 1, 'moodle/competency:usercompetencyrequestreview', 1, 1475503328, 0),
	(400, 2, 7, 'moodle/competency:usercompetencyrequestreviewown', 1, 1475503328, 0),
	(401, 2, 1, 'moodle/competency:usercompetencyreview', 1, 1475503328, 0),
	(402, 2, 1, 'moodle/competency:usercompetencycomment', 1, 1475503328, 0),
	(403, 2, 7, 'moodle/competency:usercompetencycommentown', 1, 1475503328, 0),
	(404, 2, 1, 'moodle/competency:templatemanage', 1, 1475503328, 0),
	(405, 2, 1, 'moodle/competency:templateview', 1, 1475503328, 0),
	(406, 2, 1, 'moodle/competency:userevidencemanage', 1, 1475503328, 0),
	(407, 2, 7, 'moodle/competency:userevidencemanageown', 1, 1475503328, 0),
	(408, 2, 1, 'moodle/competency:userevidenceview', 1, 1475503328, 0),
	(409, 2, 6, 'mod/assign:view', 1, 1475503409, 0),
	(410, 2, 5, 'mod/assign:view', 1, 1475503409, 0),
	(411, 2, 4, 'mod/assign:view', 1, 1475503409, 0),
	(412, 2, 3, 'mod/assign:view', 1, 1475503409, 0),
	(413, 2, 1, 'mod/assign:view', 1, 1475503409, 0),
	(414, 2, 5, 'mod/assign:submit', 1, 1475503410, 0),
	(415, 2, 4, 'mod/assign:grade', 1, 1475503410, 0),
	(416, 2, 3, 'mod/assign:grade', 1, 1475503410, 0),
	(417, 2, 1, 'mod/assign:grade', 1, 1475503410, 0),
	(418, 2, 4, 'mod/assign:exportownsubmission', 1, 1475503410, 0),
	(419, 2, 3, 'mod/assign:exportownsubmission', 1, 1475503410, 0),
	(420, 2, 1, 'mod/assign:exportownsubmission', 1, 1475503410, 0),
	(421, 2, 5, 'mod/assign:exportownsubmission', 1, 1475503410, 0),
	(422, 2, 3, 'mod/assign:addinstance', 1, 1475503410, 0),
	(423, 2, 1, 'mod/assign:addinstance', 1, 1475503410, 0),
	(424, 2, 4, 'mod/assign:grantextension', 1, 1475503411, 0),
	(425, 2, 3, 'mod/assign:grantextension', 1, 1475503411, 0),
	(426, 2, 1, 'mod/assign:grantextension', 1, 1475503411, 0),
	(427, 2, 3, 'mod/assign:revealidentities', 1, 1475503411, 0),
	(428, 2, 1, 'mod/assign:revealidentities', 1, 1475503411, 0),
	(429, 2, 3, 'mod/assign:reviewgrades', 1, 1475503411, 0),
	(430, 2, 1, 'mod/assign:reviewgrades', 1, 1475503411, 0),
	(431, 2, 3, 'mod/assign:releasegrades', 1, 1475503411, 0),
	(432, 2, 1, 'mod/assign:releasegrades', 1, 1475503411, 0),
	(433, 2, 3, 'mod/assign:managegrades', 1, 1475503411, 0),
	(434, 2, 1, 'mod/assign:managegrades', 1, 1475503411, 0),
	(435, 2, 3, 'mod/assign:manageallocations', 1, 1475503411, 0),
	(436, 2, 1, 'mod/assign:manageallocations', 1, 1475503411, 0),
	(437, 2, 3, 'mod/assign:viewgrades', 1, 1475503411, 0),
	(438, 2, 1, 'mod/assign:viewgrades', 1, 1475503411, 0),
	(439, 2, 4, 'mod/assign:viewgrades', 1, 1475503411, 0),
	(440, 2, 1, 'mod/assign:viewblinddetails', 1, 1475503412, 0),
	(441, 2, 4, 'mod/assign:receivegradernotifications', 1, 1475503412, 0),
	(442, 2, 3, 'mod/assign:receivegradernotifications', 1, 1475503412, 0),
	(443, 2, 1, 'mod/assign:receivegradernotifications', 1, 1475503412, 0),
	(444, 2, 6, 'mod/assignment:view', 1, 1475503414, 0),
	(445, 2, 5, 'mod/assignment:view', 1, 1475503414, 0),
	(446, 2, 4, 'mod/assignment:view', 1, 1475503414, 0),
	(447, 2, 3, 'mod/assignment:view', 1, 1475503414, 0),
	(448, 2, 1, 'mod/assignment:view', 1, 1475503414, 0),
	(449, 2, 3, 'mod/assignment:addinstance', 1, 1475503414, 0),
	(450, 2, 1, 'mod/assignment:addinstance', 1, 1475503414, 0),
	(451, 2, 5, 'mod/assignment:submit', 1, 1475503414, 0),
	(452, 2, 4, 'mod/assignment:grade', 1, 1475503415, 0),
	(453, 2, 3, 'mod/assignment:grade', 1, 1475503415, 0),
	(454, 2, 1, 'mod/assignment:grade', 1, 1475503415, 0),
	(455, 2, 4, 'mod/assignment:exportownsubmission', 1, 1475503415, 0),
	(456, 2, 3, 'mod/assignment:exportownsubmission', 1, 1475503415, 0),
	(457, 2, 1, 'mod/assignment:exportownsubmission', 1, 1475503415, 0),
	(458, 2, 5, 'mod/assignment:exportownsubmission', 1, 1475503415, 0),
	(459, 2, 3, 'mod/book:addinstance', 1, 1475503416, 0),
	(460, 2, 1, 'mod/book:addinstance', 1, 1475503416, 0),
	(461, 2, 6, 'mod/book:read', 1, 1475503416, 0),
	(462, 2, 8, 'mod/book:read', 1, 1475503416, 0),
	(463, 2, 5, 'mod/book:read', 1, 1475503416, 0),
	(464, 2, 4, 'mod/book:read', 1, 1475503416, 0),
	(465, 2, 3, 'mod/book:read', 1, 1475503416, 0),
	(466, 2, 1, 'mod/book:read', 1, 1475503416, 0),
	(467, 2, 4, 'mod/book:viewhiddenchapters', 1, 1475503416, 0),
	(468, 2, 3, 'mod/book:viewhiddenchapters', 1, 1475503416, 0),
	(469, 2, 1, 'mod/book:viewhiddenchapters', 1, 1475503416, 0),
	(470, 2, 3, 'mod/book:edit', 1, 1475503417, 0),
	(471, 2, 1, 'mod/book:edit', 1, 1475503417, 0),
	(472, 2, 3, 'mod/chat:addinstance', 1, 1475503418, 0),
	(473, 2, 1, 'mod/chat:addinstance', 1, 1475503418, 0),
	(474, 2, 5, 'mod/chat:chat', 1, 1475503418, 0),
	(475, 2, 4, 'mod/chat:chat', 1, 1475503418, 0),
	(476, 2, 3, 'mod/chat:chat', 1, 1475503418, 0),
	(477, 2, 1, 'mod/chat:chat', 1, 1475503418, 0),
	(478, 2, 5, 'mod/chat:readlog', 1, 1475503418, 0),
	(479, 2, 4, 'mod/chat:readlog', 1, 1475503418, 0),
	(480, 2, 3, 'mod/chat:readlog', 1, 1475503418, 0),
	(481, 2, 1, 'mod/chat:readlog', 1, 1475503418, 0),
	(482, 2, 4, 'mod/chat:deletelog', 1, 1475503418, 0),
	(483, 2, 3, 'mod/chat:deletelog', 1, 1475503418, 0),
	(484, 2, 1, 'mod/chat:deletelog', 1, 1475503418, 0),
	(485, 2, 4, 'mod/chat:exportparticipatedsession', 1, 1475503418, 0),
	(486, 2, 3, 'mod/chat:exportparticipatedsession', 1, 1475503418, 0),
	(487, 2, 1, 'mod/chat:exportparticipatedsession', 1, 1475503418, 0),
	(488, 2, 4, 'mod/chat:exportsession', 1, 1475503419, 0),
	(489, 2, 3, 'mod/chat:exportsession', 1, 1475503419, 0),
	(490, 2, 1, 'mod/chat:exportsession', 1, 1475503419, 0),
	(491, 2, 3, 'mod/choice:addinstance', 1, 1475503420, 0),
	(492, 2, 1, 'mod/choice:addinstance', 1, 1475503420, 0),
	(493, 2, 5, 'mod/choice:choose', 1, 1475503420, 0),
	(494, 2, 4, 'mod/choice:choose', 1, 1475503420, 0),
	(495, 2, 3, 'mod/choice:choose', 1, 1475503420, 0),
	(496, 2, 4, 'mod/choice:readresponses', 1, 1475503420, 0),
	(497, 2, 3, 'mod/choice:readresponses', 1, 1475503420, 0),
	(498, 2, 1, 'mod/choice:readresponses', 1, 1475503421, 0),
	(499, 2, 4, 'mod/choice:deleteresponses', 1, 1475503421, 0),
	(500, 2, 3, 'mod/choice:deleteresponses', 1, 1475503421, 0),
	(501, 2, 1, 'mod/choice:deleteresponses', 1, 1475503421, 0),
	(502, 2, 4, 'mod/choice:downloadresponses', 1, 1475503421, 0),
	(503, 2, 3, 'mod/choice:downloadresponses', 1, 1475503421, 0),
	(504, 2, 1, 'mod/choice:downloadresponses', 1, 1475503421, 0),
	(505, 2, 3, 'mod/data:addinstance', 1, 1475503423, 0),
	(506, 2, 1, 'mod/data:addinstance', 1, 1475503423, 0),
	(507, 2, 8, 'mod/data:viewentry', 1, 1475503423, 0),
	(508, 2, 6, 'mod/data:viewentry', 1, 1475503423, 0),
	(509, 2, 5, 'mod/data:viewentry', 1, 1475503423, 0),
	(510, 2, 4, 'mod/data:viewentry', 1, 1475503423, 0),
	(511, 2, 3, 'mod/data:viewentry', 1, 1475503423, 0),
	(512, 2, 1, 'mod/data:viewentry', 1, 1475503423, 0),
	(513, 2, 5, 'mod/data:writeentry', 1, 1475503423, 0),
	(514, 2, 4, 'mod/data:writeentry', 1, 1475503423, 0),
	(515, 2, 3, 'mod/data:writeentry', 1, 1475503423, 0),
	(516, 2, 1, 'mod/data:writeentry', 1, 1475503423, 0),
	(517, 2, 5, 'mod/data:comment', 1, 1475503423, 0),
	(518, 2, 4, 'mod/data:comment', 1, 1475503423, 0),
	(519, 2, 3, 'mod/data:comment', 1, 1475503424, 0),
	(520, 2, 1, 'mod/data:comment', 1, 1475503424, 0),
	(521, 2, 4, 'mod/data:rate', 1, 1475503424, 0),
	(522, 2, 3, 'mod/data:rate', 1, 1475503424, 0),
	(523, 2, 1, 'mod/data:rate', 1, 1475503424, 0),
	(524, 2, 4, 'mod/data:viewrating', 1, 1475503424, 0),
	(525, 2, 3, 'mod/data:viewrating', 1, 1475503424, 0),
	(526, 2, 1, 'mod/data:viewrating', 1, 1475503424, 0),
	(527, 2, 4, 'mod/data:viewanyrating', 1, 1475503424, 0),
	(528, 2, 3, 'mod/data:viewanyrating', 1, 1475503424, 0),
	(529, 2, 1, 'mod/data:viewanyrating', 1, 1475503424, 0),
	(530, 2, 4, 'mod/data:viewallratings', 1, 1475503424, 0),
	(531, 2, 3, 'mod/data:viewallratings', 1, 1475503424, 0),
	(532, 2, 1, 'mod/data:viewallratings', 1, 1475503424, 0),
	(533, 2, 4, 'mod/data:approve', 1, 1475503424, 0),
	(534, 2, 3, 'mod/data:approve', 1, 1475503424, 0),
	(535, 2, 1, 'mod/data:approve', 1, 1475503424, 0),
	(536, 2, 4, 'mod/data:manageentries', 1, 1475503424, 0),
	(537, 2, 3, 'mod/data:manageentries', 1, 1475503425, 0),
	(538, 2, 1, 'mod/data:manageentries', 1, 1475503425, 0),
	(539, 2, 4, 'mod/data:managecomments', 1, 1475503425, 0),
	(540, 2, 3, 'mod/data:managecomments', 1, 1475503425, 0),
	(541, 2, 1, 'mod/data:managecomments', 1, 1475503425, 0),
	(542, 2, 3, 'mod/data:managetemplates', 1, 1475503425, 0),
	(543, 2, 1, 'mod/data:managetemplates', 1, 1475503425, 0),
	(544, 2, 4, 'mod/data:viewalluserpresets', 1, 1475503425, 0),
	(545, 2, 3, 'mod/data:viewalluserpresets', 1, 1475503425, 0),
	(546, 2, 1, 'mod/data:viewalluserpresets', 1, 1475503425, 0),
	(547, 2, 1, 'mod/data:manageuserpresets', 1, 1475503425, 0),
	(548, 2, 1, 'mod/data:exportentry', 1, 1475503425, 0),
	(549, 2, 4, 'mod/data:exportentry', 1, 1475503425, 0),
	(550, 2, 3, 'mod/data:exportentry', 1, 1475503425, 0),
	(551, 2, 1, 'mod/data:exportownentry', 1, 1475503425, 0),
	(552, 2, 4, 'mod/data:exportownentry', 1, 1475503425, 0),
	(553, 2, 3, 'mod/data:exportownentry', 1, 1475503425, 0),
	(554, 2, 5, 'mod/data:exportownentry', 1, 1475503425, 0),
	(555, 2, 1, 'mod/data:exportallentries', 1, 1475503426, 0),
	(556, 2, 4, 'mod/data:exportallentries', 1, 1475503426, 0),
	(557, 2, 3, 'mod/data:exportallentries', 1, 1475503426, 0),
	(558, 2, 1, 'mod/data:exportuserinfo', 1, 1475503426, 0),
	(559, 2, 4, 'mod/data:exportuserinfo', 1, 1475503426, 0),
	(560, 2, 3, 'mod/data:exportuserinfo', 1, 1475503426, 0),
	(561, 2, 3, 'mod/feedback:addinstance', 1, 1475503427, 0),
	(562, 2, 1, 'mod/feedback:addinstance', 1, 1475503428, 0),
	(563, 2, 6, 'mod/feedback:view', 1, 1475503428, 0),
	(564, 2, 8, 'mod/feedback:view', 1, 1475503428, 0),
	(565, 2, 5, 'mod/feedback:view', 1, 1475503428, 0),
	(566, 2, 4, 'mod/feedback:view', 1, 1475503428, 0),
	(567, 2, 3, 'mod/feedback:view', 1, 1475503428, 0),
	(568, 2, 1, 'mod/feedback:view', 1, 1475503428, 0),
	(569, 2, 8, 'mod/feedback:complete', 1, 1475503428, 0),
	(570, 2, 5, 'mod/feedback:complete', 1, 1475503428, 0),
	(571, 2, 5, 'mod/feedback:viewanalysepage', 1, 1475503428, 0),
	(572, 2, 3, 'mod/feedback:viewanalysepage', 1, 1475503428, 0),
	(573, 2, 1, 'mod/feedback:viewanalysepage', 1, 1475503428, 0),
	(574, 2, 3, 'mod/feedback:deletesubmissions', 1, 1475503428, 0),
	(575, 2, 1, 'mod/feedback:deletesubmissions', 1, 1475503428, 0),
	(576, 2, 1, 'mod/feedback:mapcourse', 1, 1475503428, 0),
	(577, 2, 3, 'mod/feedback:edititems', 1, 1475503428, 0),
	(578, 2, 1, 'mod/feedback:edititems', 1, 1475503428, 0),
	(579, 2, 3, 'mod/feedback:createprivatetemplate', 1, 1475503429, 0),
	(580, 2, 1, 'mod/feedback:createprivatetemplate', 1, 1475503429, 0),
	(581, 2, 3, 'mod/feedback:createpublictemplate', 1, 1475503429, 0),
	(582, 2, 1, 'mod/feedback:createpublictemplate', 1, 1475503429, 0),
	(583, 2, 3, 'mod/feedback:deletetemplate', 1, 1475503429, 0),
	(584, 2, 1, 'mod/feedback:deletetemplate', 1, 1475503429, 0),
	(585, 2, 4, 'mod/feedback:viewreports', 1, 1475503429, 0),
	(586, 2, 3, 'mod/feedback:viewreports', 1, 1475503429, 0),
	(587, 2, 1, 'mod/feedback:viewreports', 1, 1475503429, 0),
	(588, 2, 4, 'mod/feedback:receivemail', 1, 1475503429, 0),
	(589, 2, 3, 'mod/feedback:receivemail', 1, 1475503429, 0),
	(590, 2, 3, 'mod/folder:addinstance', 1, 1475503430, 0),
	(591, 2, 1, 'mod/folder:addinstance', 1, 1475503430, 0),
	(592, 2, 6, 'mod/folder:view', 1, 1475503430, 0),
	(593, 2, 7, 'mod/folder:view', 1, 1475503430, 0),
	(594, 2, 3, 'mod/folder:managefiles', 1, 1475503430, 0),
	(595, 2, 3, 'mod/forum:addinstance', 1, 1475503433, 0),
	(596, 2, 1, 'mod/forum:addinstance', 1, 1475503433, 0),
	(597, 2, 8, 'mod/forum:viewdiscussion', 1, 1475503433, 0),
	(598, 2, 6, 'mod/forum:viewdiscussion', 1, 1475503433, 0),
	(599, 2, 5, 'mod/forum:viewdiscussion', 1, 1475503433, 0),
	(600, 2, 4, 'mod/forum:viewdiscussion', 1, 1475503433, 0),
	(601, 2, 3, 'mod/forum:viewdiscussion', 1, 1475503433, 0),
	(602, 2, 1, 'mod/forum:viewdiscussion', 1, 1475503433, 0),
	(603, 2, 4, 'mod/forum:viewhiddentimedposts', 1, 1475503433, 0),
	(604, 2, 3, 'mod/forum:viewhiddentimedposts', 1, 1475503433, 0),
	(605, 2, 1, 'mod/forum:viewhiddentimedposts', 1, 1475503433, 0),
	(606, 2, 5, 'mod/forum:startdiscussion', 1, 1475503433, 0),
	(607, 2, 4, 'mod/forum:startdiscussion', 1, 1475503433, 0),
	(608, 2, 3, 'mod/forum:startdiscussion', 1, 1475503433, 0),
	(609, 2, 1, 'mod/forum:startdiscussion', 1, 1475503433, 0),
	(610, 2, 5, 'mod/forum:replypost', 1, 1475503433, 0),
	(611, 2, 4, 'mod/forum:replypost', 1, 1475503434, 0),
	(612, 2, 3, 'mod/forum:replypost', 1, 1475503434, 0),
	(613, 2, 1, 'mod/forum:replypost', 1, 1475503434, 0),
	(614, 2, 4, 'mod/forum:addnews', 1, 1475503434, 0),
	(615, 2, 3, 'mod/forum:addnews', 1, 1475503434, 0),
	(616, 2, 1, 'mod/forum:addnews', 1, 1475503434, 0),
	(617, 2, 4, 'mod/forum:replynews', 1, 1475503434, 0),
	(618, 2, 3, 'mod/forum:replynews', 1, 1475503434, 0),
	(619, 2, 1, 'mod/forum:replynews', 1, 1475503434, 0),
	(620, 2, 5, 'mod/forum:viewrating', 1, 1475503434, 0),
	(621, 2, 4, 'mod/forum:viewrating', 1, 1475503434, 0),
	(622, 2, 3, 'mod/forum:viewrating', 1, 1475503434, 0),
	(623, 2, 1, 'mod/forum:viewrating', 1, 1475503434, 0),
	(624, 2, 4, 'mod/forum:viewanyrating', 1, 1475503434, 0),
	(625, 2, 3, 'mod/forum:viewanyrating', 1, 1475503434, 0),
	(626, 2, 1, 'mod/forum:viewanyrating', 1, 1475503434, 0),
	(627, 2, 4, 'mod/forum:viewallratings', 1, 1475503434, 0),
	(628, 2, 3, 'mod/forum:viewallratings', 1, 1475503434, 0),
	(629, 2, 1, 'mod/forum:viewallratings', 1, 1475503434, 0),
	(630, 2, 4, 'mod/forum:rate', 1, 1475503435, 0),
	(631, 2, 3, 'mod/forum:rate', 1, 1475503435, 0),
	(632, 2, 1, 'mod/forum:rate', 1, 1475503435, 0),
	(633, 2, 5, 'mod/forum:createattachment', 1, 1475503435, 0),
	(634, 2, 4, 'mod/forum:createattachment', 1, 1475503435, 0),
	(635, 2, 3, 'mod/forum:createattachment', 1, 1475503435, 0),
	(636, 2, 1, 'mod/forum:createattachment', 1, 1475503435, 0),
	(637, 2, 5, 'mod/forum:deleteownpost', 1, 1475503435, 0),
	(638, 2, 4, 'mod/forum:deleteownpost', 1, 1475503435, 0),
	(639, 2, 3, 'mod/forum:deleteownpost', 1, 1475503435, 0),
	(640, 2, 1, 'mod/forum:deleteownpost', 1, 1475503435, 0),
	(641, 2, 4, 'mod/forum:deleteanypost', 1, 1475503435, 0),
	(642, 2, 3, 'mod/forum:deleteanypost', 1, 1475503435, 0),
	(643, 2, 1, 'mod/forum:deleteanypost', 1, 1475503435, 0),
	(644, 2, 4, 'mod/forum:splitdiscussions', 1, 1475503435, 0),
	(645, 2, 3, 'mod/forum:splitdiscussions', 1, 1475503435, 0),
	(646, 2, 1, 'mod/forum:splitdiscussions', 1, 1475503435, 0),
	(647, 2, 4, 'mod/forum:movediscussions', 1, 1475503435, 0),
	(648, 2, 3, 'mod/forum:movediscussions', 1, 1475503435, 0),
	(649, 2, 1, 'mod/forum:movediscussions', 1, 1475503436, 0),
	(650, 2, 4, 'mod/forum:pindiscussions', 1, 1475503436, 0),
	(651, 2, 3, 'mod/forum:pindiscussions', 1, 1475503436, 0),
	(652, 2, 1, 'mod/forum:pindiscussions', 1, 1475503436, 0),
	(653, 2, 4, 'mod/forum:editanypost', 1, 1475503436, 0),
	(654, 2, 3, 'mod/forum:editanypost', 1, 1475503436, 0),
	(655, 2, 1, 'mod/forum:editanypost', 1, 1475503436, 0),
	(656, 2, 4, 'mod/forum:viewqandawithoutposting', 1, 1475503436, 0),
	(657, 2, 3, 'mod/forum:viewqandawithoutposting', 1, 1475503436, 0),
	(658, 2, 1, 'mod/forum:viewqandawithoutposting', 1, 1475503436, 0),
	(659, 2, 4, 'mod/forum:viewsubscribers', 1, 1475503436, 0),
	(660, 2, 3, 'mod/forum:viewsubscribers', 1, 1475503436, 0),
	(661, 2, 1, 'mod/forum:viewsubscribers', 1, 1475503436, 0),
	(662, 2, 4, 'mod/forum:managesubscriptions', 1, 1475503436, 0),
	(663, 2, 3, 'mod/forum:managesubscriptions', 1, 1475503436, 0),
	(664, 2, 1, 'mod/forum:managesubscriptions', 1, 1475503436, 0),
	(665, 2, 4, 'mod/forum:postwithoutthrottling', 1, 1475503436, 0),
	(666, 2, 3, 'mod/forum:postwithoutthrottling', 1, 1475503436, 0),
	(667, 2, 1, 'mod/forum:postwithoutthrottling', 1, 1475503436, 0),
	(668, 2, 4, 'mod/forum:exportdiscussion', 1, 1475503437, 0),
	(669, 2, 3, 'mod/forum:exportdiscussion', 1, 1475503437, 0),
	(670, 2, 1, 'mod/forum:exportdiscussion', 1, 1475503437, 0),
	(671, 2, 4, 'mod/forum:exportpost', 1, 1475503437, 0),
	(672, 2, 3, 'mod/forum:exportpost', 1, 1475503437, 0),
	(673, 2, 1, 'mod/forum:exportpost', 1, 1475503437, 0),
	(674, 2, 4, 'mod/forum:exportownpost', 1, 1475503437, 0),
	(675, 2, 3, 'mod/forum:exportownpost', 1, 1475503437, 0),
	(676, 2, 1, 'mod/forum:exportownpost', 1, 1475503437, 0),
	(677, 2, 5, 'mod/forum:exportownpost', 1, 1475503437, 0),
	(678, 2, 4, 'mod/forum:addquestion', 1, 1475503437, 0),
	(679, 2, 3, 'mod/forum:addquestion', 1, 1475503437, 0),
	(680, 2, 1, 'mod/forum:addquestion', 1, 1475503437, 0),
	(681, 2, 5, 'mod/forum:allowforcesubscribe', 1, 1475503437, 0),
	(682, 2, 4, 'mod/forum:allowforcesubscribe', 1, 1475503437, 0),
	(683, 2, 3, 'mod/forum:allowforcesubscribe', 1, 1475503437, 0),
	(684, 2, 8, 'mod/forum:allowforcesubscribe', 1, 1475503437, 0),
	(685, 2, 4, 'mod/forum:canposttomygroups', 1, 1475503438, 0),
	(686, 2, 3, 'mod/forum:canposttomygroups', 1, 1475503438, 0),
	(687, 2, 1, 'mod/forum:canposttomygroups', 1, 1475503438, 0),
	(688, 2, 3, 'mod/glossary:addinstance', 1, 1475503439, 0),
	(689, 2, 1, 'mod/glossary:addinstance', 1, 1475503439, 0),
	(690, 2, 8, 'mod/glossary:view', 1, 1475503439, 0),
	(691, 2, 6, 'mod/glossary:view', 1, 1475503439, 0),
	(692, 2, 5, 'mod/glossary:view', 1, 1475503440, 0),
	(693, 2, 4, 'mod/glossary:view', 1, 1475503440, 0),
	(694, 2, 3, 'mod/glossary:view', 1, 1475503440, 0),
	(695, 2, 1, 'mod/glossary:view', 1, 1475503440, 0),
	(696, 2, 5, 'mod/glossary:write', 1, 1475503440, 0),
	(697, 2, 4, 'mod/glossary:write', 1, 1475503440, 0),
	(698, 2, 3, 'mod/glossary:write', 1, 1475503440, 0),
	(699, 2, 1, 'mod/glossary:write', 1, 1475503440, 0),
	(700, 2, 4, 'mod/glossary:manageentries', 1, 1475503440, 0),
	(701, 2, 3, 'mod/glossary:manageentries', 1, 1475503440, 0),
	(702, 2, 1, 'mod/glossary:manageentries', 1, 1475503440, 0),
	(703, 2, 4, 'mod/glossary:managecategories', 1, 1475503440, 0),
	(704, 2, 3, 'mod/glossary:managecategories', 1, 1475503440, 0),
	(705, 2, 1, 'mod/glossary:managecategories', 1, 1475503440, 0),
	(706, 2, 5, 'mod/glossary:comment', 1, 1475503440, 0),
	(707, 2, 4, 'mod/glossary:comment', 1, 1475503440, 0),
	(708, 2, 3, 'mod/glossary:comment', 1, 1475503441, 0),
	(709, 2, 1, 'mod/glossary:comment', 1, 1475503441, 0),
	(710, 2, 4, 'mod/glossary:managecomments', 1, 1475503441, 0),
	(711, 2, 3, 'mod/glossary:managecomments', 1, 1475503441, 0),
	(712, 2, 1, 'mod/glossary:managecomments', 1, 1475503441, 0),
	(713, 2, 4, 'mod/glossary:import', 1, 1475503441, 0),
	(714, 2, 3, 'mod/glossary:import', 1, 1475503441, 0),
	(715, 2, 1, 'mod/glossary:import', 1, 1475503441, 0),
	(716, 2, 4, 'mod/glossary:export', 1, 1475503441, 0),
	(717, 2, 3, 'mod/glossary:export', 1, 1475503441, 0),
	(718, 2, 1, 'mod/glossary:export', 1, 1475503441, 0),
	(719, 2, 4, 'mod/glossary:approve', 1, 1475503441, 0),
	(720, 2, 3, 'mod/glossary:approve', 1, 1475503441, 0),
	(721, 2, 1, 'mod/glossary:approve', 1, 1475503441, 0),
	(722, 2, 4, 'mod/glossary:rate', 1, 1475503441, 0),
	(723, 2, 3, 'mod/glossary:rate', 1, 1475503441, 0),
	(724, 2, 1, 'mod/glossary:rate', 1, 1475503441, 0),
	(725, 2, 4, 'mod/glossary:viewrating', 1, 1475503441, 0),
	(726, 2, 3, 'mod/glossary:viewrating', 1, 1475503441, 0),
	(727, 2, 1, 'mod/glossary:viewrating', 1, 1475503441, 0),
	(728, 2, 4, 'mod/glossary:viewanyrating', 1, 1475503441, 0),
	(729, 2, 3, 'mod/glossary:viewanyrating', 1, 1475503441, 0),
	(730, 2, 1, 'mod/glossary:viewanyrating', 1, 1475503441, 0),
	(731, 2, 4, 'mod/glossary:viewallratings', 1, 1475503442, 0),
	(732, 2, 3, 'mod/glossary:viewallratings', 1, 1475503442, 0),
	(733, 2, 1, 'mod/glossary:viewallratings', 1, 1475503442, 0),
	(734, 2, 4, 'mod/glossary:exportentry', 1, 1475503442, 0),
	(735, 2, 3, 'mod/glossary:exportentry', 1, 1475503442, 0),
	(736, 2, 1, 'mod/glossary:exportentry', 1, 1475503442, 0),
	(737, 2, 4, 'mod/glossary:exportownentry', 1, 1475503442, 0),
	(738, 2, 3, 'mod/glossary:exportownentry', 1, 1475503442, 0),
	(739, 2, 1, 'mod/glossary:exportownentry', 1, 1475503442, 0),
	(740, 2, 5, 'mod/glossary:exportownentry', 1, 1475503442, 0),
	(741, 2, 6, 'mod/imscp:view', 1, 1475503444, 0),
	(742, 2, 7, 'mod/imscp:view', 1, 1475503444, 0),
	(743, 2, 3, 'mod/imscp:addinstance', 1, 1475503445, 0),
	(744, 2, 1, 'mod/imscp:addinstance', 1, 1475503445, 0),
	(745, 2, 3, 'mod/label:addinstance', 1, 1475503445, 0),
	(746, 2, 1, 'mod/label:addinstance', 1, 1475503445, 0),
	(747, 2, 3, 'mod/lesson:addinstance', 1, 1475503447, 0),
	(748, 2, 1, 'mod/lesson:addinstance', 1, 1475503447, 0),
	(749, 2, 3, 'mod/lesson:edit', 1, 1475503447, 0),
	(750, 2, 1, 'mod/lesson:edit', 1, 1475503447, 0),
	(751, 2, 4, 'mod/lesson:grade', 1, 1475503447, 0),
	(752, 2, 3, 'mod/lesson:grade', 1, 1475503447, 0),
	(753, 2, 1, 'mod/lesson:grade', 1, 1475503447, 0),
	(754, 2, 4, 'mod/lesson:viewreports', 1, 1475503447, 0),
	(755, 2, 3, 'mod/lesson:viewreports', 1, 1475503447, 0),
	(756, 2, 1, 'mod/lesson:viewreports', 1, 1475503447, 0),
	(757, 2, 4, 'mod/lesson:manage', 1, 1475503447, 0),
	(758, 2, 3, 'mod/lesson:manage', 1, 1475503447, 0),
	(759, 2, 1, 'mod/lesson:manage', 1, 1475503447, 0),
	(760, 2, 3, 'mod/lesson:manageoverrides', 1, 1475503447, 0),
	(761, 2, 1, 'mod/lesson:manageoverrides', 1, 1475503447, 0),
	(762, 2, 5, 'mod/lti:view', 1, 1475503448, 0),
	(763, 2, 4, 'mod/lti:view', 1, 1475503448, 0),
	(764, 2, 3, 'mod/lti:view', 1, 1475503449, 0),
	(765, 2, 1, 'mod/lti:view', 1, 1475503449, 0),
	(766, 2, 3, 'mod/lti:addinstance', 1, 1475503449, 0),
	(767, 2, 1, 'mod/lti:addinstance', 1, 1475503449, 0),
	(768, 2, 4, 'mod/lti:manage', 1, 1475503449, 0),
	(769, 2, 3, 'mod/lti:manage', 1, 1475503449, 0),
	(770, 2, 1, 'mod/lti:manage', 1, 1475503449, 0),
	(771, 2, 3, 'mod/lti:addcoursetool', 1, 1475503449, 0),
	(772, 2, 1, 'mod/lti:addcoursetool', 1, 1475503449, 0),
	(773, 2, 3, 'mod/lti:requesttooladd', 1, 1475503449, 0),
	(774, 2, 1, 'mod/lti:requesttooladd', 1, 1475503449, 0),
	(775, 2, 6, 'mod/page:view', 1, 1475503450, 0),
	(776, 2, 7, 'mod/page:view', 1, 1475503450, 0),
	(777, 2, 3, 'mod/page:addinstance', 1, 1475503450, 0),
	(778, 2, 1, 'mod/page:addinstance', 1, 1475503450, 0),
	(779, 2, 6, 'mod/quiz:view', 1, 1475503452, 0),
	(780, 2, 5, 'mod/quiz:view', 1, 1475503452, 0),
	(781, 2, 4, 'mod/quiz:view', 1, 1475503452, 0),
	(782, 2, 3, 'mod/quiz:view', 1, 1475503452, 0),
	(783, 2, 1, 'mod/quiz:view', 1, 1475503452, 0),
	(784, 2, 3, 'mod/quiz:addinstance', 1, 1475503452, 0),
	(785, 2, 1, 'mod/quiz:addinstance', 1, 1475503452, 0),
	(786, 2, 5, 'mod/quiz:attempt', 1, 1475503452, 0),
	(787, 2, 5, 'mod/quiz:reviewmyattempts', 1, 1475503452, 0),
	(788, 2, 3, 'mod/quiz:manage', 1, 1475503452, 0),
	(789, 2, 1, 'mod/quiz:manage', 1, 1475503452, 0),
	(790, 2, 3, 'mod/quiz:manageoverrides', 1, 1475503452, 0),
	(791, 2, 1, 'mod/quiz:manageoverrides', 1, 1475503452, 0),
	(792, 2, 4, 'mod/quiz:preview', 1, 1475503452, 0),
	(793, 2, 3, 'mod/quiz:preview', 1, 1475503453, 0),
	(794, 2, 1, 'mod/quiz:preview', 1, 1475503453, 0),
	(795, 2, 4, 'mod/quiz:grade', 1, 1475503453, 0),
	(796, 2, 3, 'mod/quiz:grade', 1, 1475503453, 0),
	(797, 2, 1, 'mod/quiz:grade', 1, 1475503453, 0),
	(798, 2, 4, 'mod/quiz:regrade', 1, 1475503453, 0),
	(799, 2, 3, 'mod/quiz:regrade', 1, 1475503453, 0),
	(800, 2, 1, 'mod/quiz:regrade', 1, 1475503453, 0),
	(801, 2, 4, 'mod/quiz:viewreports', 1, 1475503453, 0),
	(802, 2, 3, 'mod/quiz:viewreports', 1, 1475503453, 0),
	(803, 2, 1, 'mod/quiz:viewreports', 1, 1475503453, 0),
	(804, 2, 3, 'mod/quiz:deleteattempts', 1, 1475503453, 0),
	(805, 2, 1, 'mod/quiz:deleteattempts', 1, 1475503453, 0),
	(806, 2, 6, 'mod/resource:view', 1, 1475503457, 0),
	(807, 2, 7, 'mod/resource:view', 1, 1475503457, 0),
	(808, 2, 3, 'mod/resource:addinstance', 1, 1475503457, 0),
	(809, 2, 1, 'mod/resource:addinstance', 1, 1475503457, 0),
	(810, 2, 3, 'mod/scorm:addinstance', 1, 1475503459, 0),
	(811, 2, 1, 'mod/scorm:addinstance', 1, 1475503459, 0),
	(812, 2, 4, 'mod/scorm:viewreport', 1, 1475503459, 0),
	(813, 2, 3, 'mod/scorm:viewreport', 1, 1475503459, 0),
	(814, 2, 1, 'mod/scorm:viewreport', 1, 1475503459, 0),
	(815, 2, 5, 'mod/scorm:skipview', 1, 1475503459, 0),
	(816, 2, 5, 'mod/scorm:savetrack', 1, 1475503459, 0),
	(817, 2, 4, 'mod/scorm:savetrack', 1, 1475503459, 0),
	(818, 2, 3, 'mod/scorm:savetrack', 1, 1475503459, 0),
	(819, 2, 1, 'mod/scorm:savetrack', 1, 1475503459, 0),
	(820, 2, 5, 'mod/scorm:viewscores', 1, 1475503460, 0),
	(821, 2, 4, 'mod/scorm:viewscores', 1, 1475503460, 0),
	(822, 2, 3, 'mod/scorm:viewscores', 1, 1475503460, 0),
	(823, 2, 1, 'mod/scorm:viewscores', 1, 1475503460, 0),
	(824, 2, 4, 'mod/scorm:deleteresponses', 1, 1475503460, 0),
	(825, 2, 3, 'mod/scorm:deleteresponses', 1, 1475503460, 0),
	(826, 2, 1, 'mod/scorm:deleteresponses', 1, 1475503460, 0),
	(827, 2, 3, 'mod/survey:addinstance', 1, 1475503464, 0),
	(828, 2, 1, 'mod/survey:addinstance', 1, 1475503464, 0),
	(829, 2, 5, 'mod/survey:participate', 1, 1475503464, 0),
	(830, 2, 4, 'mod/survey:participate', 1, 1475503464, 0),
	(831, 2, 3, 'mod/survey:participate', 1, 1475503465, 0),
	(832, 2, 1, 'mod/survey:participate', 1, 1475503465, 0),
	(833, 2, 4, 'mod/survey:readresponses', 1, 1475503465, 0),
	(834, 2, 3, 'mod/survey:readresponses', 1, 1475503465, 0),
	(835, 2, 1, 'mod/survey:readresponses', 1, 1475503465, 0),
	(836, 2, 4, 'mod/survey:download', 1, 1475503465, 0),
	(837, 2, 3, 'mod/survey:download', 1, 1475503466, 0),
	(838, 2, 1, 'mod/survey:download', 1, 1475503466, 0),
	(839, 2, 6, 'mod/url:view', 1, 1475503467, 0),
	(840, 2, 7, 'mod/url:view', 1, 1475503467, 0),
	(841, 2, 3, 'mod/url:addinstance', 1, 1475503467, 0),
	(842, 2, 1, 'mod/url:addinstance', 1, 1475503467, 0),
	(843, 2, 3, 'mod/wiki:addinstance', 1, 1475503468, 0),
	(844, 2, 1, 'mod/wiki:addinstance', 1, 1475503468, 0),
	(845, 2, 6, 'mod/wiki:viewpage', 1, 1475503468, 0),
	(846, 2, 5, 'mod/wiki:viewpage', 1, 1475503468, 0),
	(847, 2, 4, 'mod/wiki:viewpage', 1, 1475503468, 0),
	(848, 2, 3, 'mod/wiki:viewpage', 1, 1475503468, 0),
	(849, 2, 1, 'mod/wiki:viewpage', 1, 1475503468, 0),
	(850, 2, 5, 'mod/wiki:editpage', 1, 1475503468, 0),
	(851, 2, 4, 'mod/wiki:editpage', 1, 1475503468, 0),
	(852, 2, 3, 'mod/wiki:editpage', 1, 1475503469, 0),
	(853, 2, 1, 'mod/wiki:editpage', 1, 1475503469, 0),
	(854, 2, 5, 'mod/wiki:createpage', 1, 1475503469, 0),
	(855, 2, 4, 'mod/wiki:createpage', 1, 1475503469, 0),
	(856, 2, 3, 'mod/wiki:createpage', 1, 1475503469, 0),
	(857, 2, 1, 'mod/wiki:createpage', 1, 1475503469, 0),
	(858, 2, 5, 'mod/wiki:viewcomment', 1, 1475503469, 0),
	(859, 2, 4, 'mod/wiki:viewcomment', 1, 1475503469, 0),
	(860, 2, 3, 'mod/wiki:viewcomment', 1, 1475503469, 0),
	(861, 2, 1, 'mod/wiki:viewcomment', 1, 1475503469, 0),
	(862, 2, 5, 'mod/wiki:editcomment', 1, 1475503469, 0),
	(863, 2, 4, 'mod/wiki:editcomment', 1, 1475503469, 0),
	(864, 2, 3, 'mod/wiki:editcomment', 1, 1475503469, 0),
	(865, 2, 1, 'mod/wiki:editcomment', 1, 1475503469, 0),
	(866, 2, 4, 'mod/wiki:managecomment', 1, 1475503469, 0),
	(867, 2, 3, 'mod/wiki:managecomment', 1, 1475503469, 0),
	(868, 2, 1, 'mod/wiki:managecomment', 1, 1475503470, 0),
	(869, 2, 4, 'mod/wiki:managefiles', 1, 1475503470, 0),
	(870, 2, 3, 'mod/wiki:managefiles', 1, 1475503470, 0),
	(871, 2, 1, 'mod/wiki:managefiles', 1, 1475503470, 0),
	(872, 2, 4, 'mod/wiki:overridelock', 1, 1475503470, 0),
	(873, 2, 3, 'mod/wiki:overridelock', 1, 1475503470, 0),
	(874, 2, 1, 'mod/wiki:overridelock', 1, 1475503470, 0),
	(875, 2, 4, 'mod/wiki:managewiki', 1, 1475503470, 0),
	(876, 2, 3, 'mod/wiki:managewiki', 1, 1475503470, 0),
	(877, 2, 1, 'mod/wiki:managewiki', 1, 1475503470, 0),
	(878, 2, 6, 'mod/workshop:view', 1, 1475503472, 0),
	(879, 2, 5, 'mod/workshop:view', 1, 1475503472, 0),
	(880, 2, 4, 'mod/workshop:view', 1, 1475503472, 0),
	(881, 2, 3, 'mod/workshop:view', 1, 1475503472, 0),
	(882, 2, 1, 'mod/workshop:view', 1, 1475503472, 0),
	(883, 2, 3, 'mod/workshop:addinstance', 1, 1475503472, 0),
	(884, 2, 1, 'mod/workshop:addinstance', 1, 1475503472, 0),
	(885, 2, 4, 'mod/workshop:switchphase', 1, 1475503472, 0),
	(886, 2, 3, 'mod/workshop:switchphase', 1, 1475503472, 0),
	(887, 2, 1, 'mod/workshop:switchphase', 1, 1475503472, 0),
	(888, 2, 3, 'mod/workshop:editdimensions', 1, 1475503473, 0),
	(889, 2, 1, 'mod/workshop:editdimensions', 1, 1475503473, 0),
	(890, 2, 5, 'mod/workshop:submit', 1, 1475503473, 0),
	(891, 2, 5, 'mod/workshop:peerassess', 1, 1475503473, 0),
	(892, 2, 4, 'mod/workshop:manageexamples', 1, 1475503473, 0),
	(893, 2, 3, 'mod/workshop:manageexamples', 1, 1475503473, 0),
	(894, 2, 1, 'mod/workshop:manageexamples', 1, 1475503473, 0),
	(895, 2, 4, 'mod/workshop:allocate', 1, 1475503473, 0),
	(896, 2, 3, 'mod/workshop:allocate', 1, 1475503473, 0),
	(897, 2, 1, 'mod/workshop:allocate', 1, 1475503473, 0),
	(898, 2, 4, 'mod/workshop:publishsubmissions', 1, 1475503473, 0),
	(899, 2, 3, 'mod/workshop:publishsubmissions', 1, 1475503473, 0),
	(900, 2, 1, 'mod/workshop:publishsubmissions', 1, 1475503473, 0),
	(901, 2, 5, 'mod/workshop:viewauthornames', 1, 1475503473, 0),
	(902, 2, 4, 'mod/workshop:viewauthornames', 1, 1475503473, 0),
	(903, 2, 3, 'mod/workshop:viewauthornames', 1, 1475503473, 0),
	(904, 2, 1, 'mod/workshop:viewauthornames', 1, 1475503473, 0),
	(905, 2, 4, 'mod/workshop:viewreviewernames', 1, 1475503473, 0),
	(906, 2, 3, 'mod/workshop:viewreviewernames', 1, 1475503473, 0),
	(907, 2, 1, 'mod/workshop:viewreviewernames', 1, 1475503474, 0),
	(908, 2, 4, 'mod/workshop:viewallsubmissions', 1, 1475503474, 0),
	(909, 2, 3, 'mod/workshop:viewallsubmissions', 1, 1475503474, 0),
	(910, 2, 1, 'mod/workshop:viewallsubmissions', 1, 1475503474, 0),
	(911, 2, 5, 'mod/workshop:viewpublishedsubmissions', 1, 1475503474, 0),
	(912, 2, 4, 'mod/workshop:viewpublishedsubmissions', 1, 1475503474, 0),
	(913, 2, 3, 'mod/workshop:viewpublishedsubmissions', 1, 1475503474, 0),
	(914, 2, 1, 'mod/workshop:viewpublishedsubmissions', 1, 1475503474, 0),
	(915, 2, 5, 'mod/workshop:viewauthorpublished', 1, 1475503474, 0),
	(916, 2, 4, 'mod/workshop:viewauthorpublished', 1, 1475503474, 0),
	(917, 2, 3, 'mod/workshop:viewauthorpublished', 1, 1475503474, 0),
	(918, 2, 1, 'mod/workshop:viewauthorpublished', 1, 1475503474, 0),
	(919, 2, 4, 'mod/workshop:viewallassessments', 1, 1475503474, 0),
	(920, 2, 3, 'mod/workshop:viewallassessments', 1, 1475503474, 0),
	(921, 2, 1, 'mod/workshop:viewallassessments', 1, 1475503474, 0),
	(922, 2, 4, 'mod/workshop:overridegrades', 1, 1475503474, 0),
	(923, 2, 3, 'mod/workshop:overridegrades', 1, 1475503474, 0),
	(924, 2, 1, 'mod/workshop:overridegrades', 1, 1475503474, 0),
	(925, 2, 4, 'mod/workshop:ignoredeadlines', 1, 1475503475, 0),
	(926, 2, 3, 'mod/workshop:ignoredeadlines', 1, 1475503475, 0),
	(927, 2, 1, 'mod/workshop:ignoredeadlines', 1, 1475503475, 0),
	(928, 2, 4, 'mod/workshop:deletesubmissions', 1, 1475503475, 0),
	(929, 2, 3, 'mod/workshop:deletesubmissions', 1, 1475503475, 0),
	(930, 2, 1, 'mod/workshop:deletesubmissions', 1, 1475503475, 0),
	(931, 2, 1, 'enrol/category:config', 1, 1475503486, 0),
	(932, 2, 3, 'enrol/category:config', 1, 1475503486, 0),
	(933, 2, 3, 'enrol/cohort:config', 1, 1475503486, 0),
	(934, 2, 1, 'enrol/cohort:config', 1, 1475503487, 0),
	(935, 2, 1, 'enrol/cohort:unenrol', 1, 1475503487, 0),
	(936, 2, 1, 'enrol/database:unenrol', 1, 1475503488, 0),
	(937, 2, 1, 'enrol/database:config', 1, 1475503488, 0),
	(938, 2, 3, 'enrol/database:config', 1, 1475503488, 0),
	(939, 2, 1, 'enrol/guest:config', 1, 1475503490, 0),
	(940, 2, 3, 'enrol/guest:config', 1, 1475503490, 0),
	(941, 2, 1, 'enrol/imsenterprise:config', 1, 1475503490, 0),
	(942, 2, 3, 'enrol/imsenterprise:config', 1, 1475503490, 0),
	(943, 2, 1, 'enrol/ldap:manage', 1, 1475503491, 0),
	(944, 2, 1, 'enrol/lti:config', 1, 1475503492, 0),
	(945, 2, 3, 'enrol/lti:config', 1, 1475503492, 0),
	(946, 2, 1, 'enrol/lti:unenrol', 1, 1475503492, 0),
	(947, 2, 3, 'enrol/lti:unenrol', 1, 1475503492, 0),
	(948, 2, 1, 'enrol/manual:config', 1, 1475503492, 0),
	(949, 2, 1, 'enrol/manual:enrol', 1, 1475503493, 0),
	(950, 2, 3, 'enrol/manual:enrol', 1, 1475503493, 0),
	(951, 2, 1, 'enrol/manual:manage', 1, 1475503493, 0),
	(952, 2, 3, 'enrol/manual:manage', 1, 1475503493, 0),
	(953, 2, 1, 'enrol/manual:unenrol', 1, 1475503493, 0),
	(954, 2, 3, 'enrol/manual:unenrol', 1, 1475503493, 0),
	(955, 2, 1, 'enrol/meta:config', 1, 1475503493, 0),
	(956, 2, 3, 'enrol/meta:config', 1, 1475503493, 0),
	(957, 2, 1, 'enrol/meta:selectaslinked', 1, 1475503494, 0),
	(958, 2, 1, 'enrol/meta:unenrol', 1, 1475503494, 0),
	(959, 2, 1, 'enrol/mnet:config', 1, 1475503494, 0),
	(960, 2, 3, 'enrol/mnet:config', 1, 1475503494, 0),
	(961, 2, 1, 'enrol/paypal:config', 1, 1475503496, 0),
	(962, 2, 1, 'enrol/paypal:manage', 1, 1475503496, 0),
	(963, 2, 3, 'enrol/paypal:manage', 1, 1475503496, 0),
	(964, 2, 1, 'enrol/paypal:unenrol', 1, 1475503496, 0),
	(965, 2, 3, 'enrol/self:config', 1, 1475503497, 0),
	(966, 2, 1, 'enrol/self:config', 1, 1475503497, 0),
	(967, 2, 3, 'enrol/self:manage', 1, 1475503497, 0),
	(968, 2, 1, 'enrol/self:manage', 1, 1475503497, 0),
	(969, 2, 5, 'enrol/self:unenrolself', 1, 1475503497, 0),
	(970, 2, 3, 'enrol/self:unenrol', 1, 1475503497, 0),
	(971, 2, 1, 'enrol/self:unenrol', 1, 1475503497, 0),
	(972, 2, 7, 'message/airnotifier:managedevice', 1, 1475503498, 0),
	(973, 2, 3, 'block/activity_modules:addinstance', 1, 1475503503, 0),
	(974, 2, 1, 'block/activity_modules:addinstance', 1, 1475503503, 0),
	(975, 2, 3, 'block/activity_results:addinstance', 1, 1475503504, 0),
	(976, 2, 1, 'block/activity_results:addinstance', 1, 1475503504, 0),
	(977, 2, 7, 'block/admin_bookmarks:myaddinstance', 1, 1475503504, 0),
	(978, 2, 3, 'block/admin_bookmarks:addinstance', 1, 1475503504, 0),
	(979, 2, 1, 'block/admin_bookmarks:addinstance', 1, 1475503504, 0),
	(980, 2, 3, 'block/badges:addinstance', 1, 1475503505, 0),
	(981, 2, 1, 'block/badges:addinstance', 1, 1475503505, 0),
	(982, 2, 7, 'block/badges:myaddinstance', 1, 1475503505, 0),
	(983, 2, 3, 'block/blog_menu:addinstance', 1, 1475503505, 0),
	(984, 2, 1, 'block/blog_menu:addinstance', 1, 1475503505, 0),
	(985, 2, 3, 'block/blog_recent:addinstance', 1, 1475503506, 0),
	(986, 2, 1, 'block/blog_recent:addinstance', 1, 1475503506, 0),
	(987, 2, 3, 'block/blog_tags:addinstance', 1, 1475503507, 0),
	(988, 2, 1, 'block/blog_tags:addinstance', 1, 1475503507, 0),
	(989, 2, 7, 'block/calendar_month:myaddinstance', 1, 1475503507, 0),
	(990, 2, 3, 'block/calendar_month:addinstance', 1, 1475503508, 0),
	(991, 2, 1, 'block/calendar_month:addinstance', 1, 1475503508, 0),
	(992, 2, 7, 'block/calendar_upcoming:myaddinstance', 1, 1475503508, 0),
	(993, 2, 3, 'block/calendar_upcoming:addinstance', 1, 1475503508, 0),
	(994, 2, 1, 'block/calendar_upcoming:addinstance', 1, 1475503508, 0),
	(995, 2, 7, 'block/comments:myaddinstance', 1, 1475503509, 0),
	(996, 2, 3, 'block/comments:addinstance', 1, 1475503509, 0),
	(997, 2, 1, 'block/comments:addinstance', 1, 1475503510, 0),
	(998, 2, 7, 'block/community:myaddinstance', 1, 1475503510, 0),
	(999, 2, 3, 'block/community:addinstance', 1, 1475503511, 0),
	(1000, 2, 1, 'block/community:addinstance', 1, 1475503511, 0),
	(1001, 2, 3, 'block/completionstatus:addinstance', 1, 1475503511, 0),
	(1002, 2, 1, 'block/completionstatus:addinstance', 1, 1475503511, 0),
	(1003, 2, 7, 'block/course_list:myaddinstance', 1, 1475503512, 0),
	(1004, 2, 3, 'block/course_list:addinstance', 1, 1475503512, 0),
	(1005, 2, 1, 'block/course_list:addinstance', 1, 1475503512, 0),
	(1006, 2, 7, 'block/course_overview:myaddinstance', 1, 1475503512, 0),
	(1007, 2, 3, 'block/course_overview:addinstance', 1, 1475503512, 0),
	(1008, 2, 1, 'block/course_overview:addinstance', 1, 1475503512, 0),
	(1009, 2, 3, 'block/course_summary:addinstance', 1, 1475503513, 0),
	(1010, 2, 1, 'block/course_summary:addinstance', 1, 1475503513, 0),
	(1011, 2, 3, 'block/feedback:addinstance', 1, 1475503514, 0),
	(1012, 2, 1, 'block/feedback:addinstance', 1, 1475503514, 0),
	(1013, 2, 7, 'block/globalsearch:myaddinstance', 1, 1475503514, 0),
	(1014, 2, 3, 'block/globalsearch:addinstance', 1, 1475503514, 0),
	(1015, 2, 1, 'block/globalsearch:addinstance', 1, 1475503514, 0),
	(1016, 2, 7, 'block/glossary_random:myaddinstance', 1, 1475503515, 0),
	(1017, 2, 3, 'block/glossary_random:addinstance', 1, 1475503515, 0),
	(1018, 2, 1, 'block/glossary_random:addinstance', 1, 1475503515, 0),
	(1019, 2, 7, 'block/html:myaddinstance', 1, 1475503515, 0),
	(1020, 2, 3, 'block/html:addinstance', 1, 1475503516, 0),
	(1021, 2, 1, 'block/html:addinstance', 1, 1475503516, 0),
	(1022, 2, 3, 'block/login:addinstance', 1, 1475503516, 0),
	(1023, 2, 1, 'block/login:addinstance', 1, 1475503516, 0),
	(1024, 2, 3, 'block/lp:addinstance', 1, 1475503517, 0),
	(1025, 2, 1, 'block/lp:addinstance', 1, 1475503517, 0),
	(1026, 2, 7, 'block/lp:myaddinstance', 1, 1475503517, 0),
	(1027, 2, 7, 'block/lp:view', 1, 1475503517, 0),
	(1028, 2, 7, 'block/mentees:myaddinstance', 1, 1475503517, 0),
	(1029, 2, 3, 'block/mentees:addinstance', 1, 1475503517, 0),
	(1030, 2, 1, 'block/mentees:addinstance', 1, 1475503517, 0),
	(1031, 2, 7, 'block/messages:myaddinstance', 1, 1475503518, 0),
	(1032, 2, 3, 'block/messages:addinstance', 1, 1475503518, 0),
	(1033, 2, 1, 'block/messages:addinstance', 1, 1475503518, 0),
	(1034, 2, 7, 'block/mnet_hosts:myaddinstance', 1, 1475503518, 0),
	(1035, 2, 3, 'block/mnet_hosts:addinstance', 1, 1475503519, 0),
	(1036, 2, 1, 'block/mnet_hosts:addinstance', 1, 1475503519, 0),
	(1037, 2, 7, 'block/myprofile:myaddinstance', 1, 1475503519, 0),
	(1038, 2, 3, 'block/myprofile:addinstance', 1, 1475503519, 0),
	(1039, 2, 1, 'block/myprofile:addinstance', 1, 1475503519, 0),
	(1040, 2, 7, 'block/navigation:myaddinstance', 1, 1475503520, 0),
	(1041, 2, 3, 'block/navigation:addinstance', 1, 1475503521, 0),
	(1042, 2, 1, 'block/navigation:addinstance', 1, 1475503521, 0),
	(1043, 2, 7, 'block/news_items:myaddinstance', 1, 1475503521, 0),
	(1044, 2, 3, 'block/news_items:addinstance', 1, 1475503522, 0),
	(1045, 2, 1, 'block/news_items:addinstance', 1, 1475503522, 0),
	(1046, 2, 7, 'block/online_users:myaddinstance', 1, 1475503522, 0),
	(1047, 2, 3, 'block/online_users:addinstance', 1, 1475503522, 0),
	(1048, 2, 1, 'block/online_users:addinstance', 1, 1475503522, 0),
	(1049, 2, 7, 'block/online_users:viewlist', 1, 1475503522, 0),
	(1050, 2, 6, 'block/online_users:viewlist', 1, 1475503523, 0),
	(1051, 2, 5, 'block/online_users:viewlist', 1, 1475503523, 0),
	(1052, 2, 4, 'block/online_users:viewlist', 1, 1475503523, 0),
	(1053, 2, 3, 'block/online_users:viewlist', 1, 1475503523, 0),
	(1054, 2, 1, 'block/online_users:viewlist', 1, 1475503523, 0),
	(1055, 2, 3, 'block/participants:addinstance', 1, 1475503523, 0),
	(1056, 2, 1, 'block/participants:addinstance', 1, 1475503523, 0),
	(1057, 2, 7, 'block/private_files:myaddinstance', 1, 1475503524, 0),
	(1058, 2, 3, 'block/private_files:addinstance', 1, 1475503524, 0),
	(1059, 2, 1, 'block/private_files:addinstance', 1, 1475503524, 0),
	(1060, 2, 3, 'block/quiz_results:addinstance', 1, 1475503525, 0),
	(1061, 2, 1, 'block/quiz_results:addinstance', 1, 1475503525, 0),
	(1062, 2, 3, 'block/recent_activity:addinstance', 1, 1475503526, 0),
	(1063, 2, 1, 'block/recent_activity:addinstance', 1, 1475503526, 0),
	(1064, 2, 7, 'block/recent_activity:viewaddupdatemodule', 1, 1475503526, 0),
	(1065, 2, 7, 'block/recent_activity:viewdeletemodule', 1, 1475503526, 0),
	(1066, 2, 7, 'block/rss_client:myaddinstance', 1, 1475503526, 0),
	(1067, 2, 3, 'block/rss_client:addinstance', 1, 1475503527, 0),
	(1068, 2, 1, 'block/rss_client:addinstance', 1, 1475503527, 0),
	(1069, 2, 4, 'block/rss_client:manageownfeeds', 1, 1475503527, 0),
	(1070, 2, 3, 'block/rss_client:manageownfeeds', 1, 1475503527, 0),
	(1071, 2, 1, 'block/rss_client:manageownfeeds', 1, 1475503527, 0),
	(1072, 2, 1, 'block/rss_client:manageanyfeeds', 1, 1475503527, 0),
	(1073, 2, 3, 'block/search_forums:addinstance', 1, 1475503527, 0),
	(1074, 2, 1, 'block/search_forums:addinstance', 1, 1475503527, 0),
	(1075, 2, 3, 'block/section_links:addinstance', 1, 1475503528, 0),
	(1076, 2, 1, 'block/section_links:addinstance', 1, 1475503528, 0),
	(1077, 2, 3, 'block/selfcompletion:addinstance', 1, 1475503529, 0),
	(1078, 2, 1, 'block/selfcompletion:addinstance', 1, 1475503529, 0),
	(1079, 2, 7, 'block/settings:myaddinstance', 1, 1475503529, 0),
	(1080, 2, 3, 'block/settings:addinstance', 1, 1475503529, 0),
	(1081, 2, 1, 'block/settings:addinstance', 1, 1475503529, 0),
	(1082, 2, 3, 'block/site_main_menu:addinstance', 1, 1475503530, 0),
	(1083, 2, 1, 'block/site_main_menu:addinstance', 1, 1475503530, 0),
	(1084, 2, 3, 'block/social_activities:addinstance', 1, 1475503530, 0),
	(1085, 2, 1, 'block/social_activities:addinstance', 1, 1475503530, 0),
	(1086, 2, 3, 'block/tag_flickr:addinstance', 1, 1475503531, 0),
	(1087, 2, 1, 'block/tag_flickr:addinstance', 1, 1475503531, 0),
	(1088, 2, 3, 'block/tag_youtube:addinstance', 1, 1475503533, 0),
	(1089, 2, 1, 'block/tag_youtube:addinstance', 1, 1475503533, 0),
	(1090, 2, 7, 'block/tags:myaddinstance', 1, 1475503533, 0),
	(1091, 2, 3, 'block/tags:addinstance', 1, 1475503533, 0),
	(1092, 2, 1, 'block/tags:addinstance', 1, 1475503533, 0),
	(1093, 2, 4, 'report/completion:view', 1, 1475503555, 0),
	(1094, 2, 3, 'report/completion:view', 1, 1475503555, 0),
	(1095, 2, 1, 'report/completion:view', 1, 1475503555, 0),
	(1096, 2, 4, 'report/courseoverview:view', 1, 1475503555, 0),
	(1097, 2, 3, 'report/courseoverview:view', 1, 1475503555, 0),
	(1098, 2, 1, 'report/courseoverview:view', 1, 1475503555, 0),
	(1099, 2, 4, 'report/log:view', 1, 1475503556, 0),
	(1100, 2, 3, 'report/log:view', 1, 1475503556, 0),
	(1101, 2, 1, 'report/log:view', 1, 1475503556, 0),
	(1102, 2, 4, 'report/log:viewtoday', 1, 1475503556, 0),
	(1103, 2, 3, 'report/log:viewtoday', 1, 1475503556, 0),
	(1104, 2, 1, 'report/log:viewtoday', 1, 1475503557, 0),
	(1105, 2, 4, 'report/loglive:view', 1, 1475503557, 0),
	(1106, 2, 3, 'report/loglive:view', 1, 1475503557, 0),
	(1107, 2, 1, 'report/loglive:view', 1, 1475503557, 0),
	(1108, 2, 4, 'report/outline:view', 1, 1475503558, 0),
	(1109, 2, 3, 'report/outline:view', 1, 1475503558, 0),
	(1110, 2, 1, 'report/outline:view', 1, 1475503558, 0),
	(1111, 2, 4, 'report/participation:view', 1, 1475503558, 0),
	(1112, 2, 3, 'report/participation:view', 1, 1475503559, 0),
	(1113, 2, 1, 'report/participation:view', 1, 1475503559, 0),
	(1114, 2, 1, 'report/performance:view', 1, 1475503559, 0),
	(1115, 2, 4, 'report/progress:view', 1, 1475503559, 0),
	(1116, 2, 3, 'report/progress:view', 1, 1475503559, 0),
	(1117, 2, 1, 'report/progress:view', 1, 1475503560, 0),
	(1118, 2, 1, 'report/security:view', 1, 1475503561, 0),
	(1119, 2, 4, 'report/stats:view', 1, 1475503561, 0),
	(1120, 2, 3, 'report/stats:view', 1, 1475503561, 0),
	(1121, 2, 1, 'report/stats:view', 1, 1475503561, 0),
	(1122, 2, 6, 'report/usersessions:manageownsessions', -1000, 1475503562, 0),
	(1123, 2, 7, 'report/usersessions:manageownsessions', 1, 1475503562, 0),
	(1124, 2, 1, 'report/usersessions:manageownsessions', 1, 1475503562, 0),
	(1125, 2, 4, 'gradeexport/ods:view', 1, 1475503562, 0),
	(1126, 2, 3, 'gradeexport/ods:view', 1, 1475503562, 0),
	(1127, 2, 1, 'gradeexport/ods:view', 1, 1475503562, 0),
	(1128, 2, 1, 'gradeexport/ods:publish', 1, 1475503562, 0),
	(1129, 2, 4, 'gradeexport/txt:view', 1, 1475503563, 0),
	(1130, 2, 3, 'gradeexport/txt:view', 1, 1475503563, 0),
	(1131, 2, 1, 'gradeexport/txt:view', 1, 1475503563, 0),
	(1132, 2, 1, 'gradeexport/txt:publish', 1, 1475503563, 0),
	(1133, 2, 4, 'gradeexport/xls:view', 1, 1475503563, 0),
	(1134, 2, 3, 'gradeexport/xls:view', 1, 1475503563, 0),
	(1135, 2, 1, 'gradeexport/xls:view', 1, 1475503563, 0),
	(1136, 2, 1, 'gradeexport/xls:publish', 1, 1475503564, 0),
	(1137, 2, 4, 'gradeexport/xml:view', 1, 1475503564, 0),
	(1138, 2, 3, 'gradeexport/xml:view', 1, 1475503564, 0),
	(1139, 2, 1, 'gradeexport/xml:view', 1, 1475503564, 0),
	(1140, 2, 1, 'gradeexport/xml:publish', 1, 1475503564, 0),
	(1141, 2, 3, 'gradeimport/csv:view', 1, 1475503565, 0),
	(1142, 2, 1, 'gradeimport/csv:view', 1, 1475503565, 0),
	(1143, 2, 3, 'gradeimport/direct:view', 1, 1475503566, 0),
	(1144, 2, 1, 'gradeimport/direct:view', 1, 1475503566, 0),
	(1145, 2, 3, 'gradeimport/xml:view', 1, 1475503566, 0),
	(1146, 2, 1, 'gradeimport/xml:view', 1, 1475503566, 0),
	(1147, 2, 1, 'gradeimport/xml:publish', 1, 1475503566, 0),
	(1148, 2, 4, 'gradereport/grader:view', 1, 1475503567, 0),
	(1149, 2, 3, 'gradereport/grader:view', 1, 1475503567, 0),
	(1150, 2, 1, 'gradereport/grader:view', 1, 1475503567, 0),
	(1151, 2, 4, 'gradereport/history:view', 1, 1475503567, 0),
	(1152, 2, 3, 'gradereport/history:view', 1, 1475503567, 0),
	(1153, 2, 1, 'gradereport/history:view', 1, 1475503567, 0),
	(1154, 2, 4, 'gradereport/outcomes:view', 1, 1475503568, 0),
	(1155, 2, 3, 'gradereport/outcomes:view', 1, 1475503568, 0),
	(1156, 2, 1, 'gradereport/outcomes:view', 1, 1475503568, 0),
	(1157, 2, 5, 'gradereport/overview:view', 1, 1475503568, 0),
	(1158, 2, 1, 'gradereport/overview:view', 1, 1475503569, 0),
	(1159, 2, 3, 'gradereport/singleview:view', 1, 1475503569, 0),
	(1160, 2, 1, 'gradereport/singleview:view', 1, 1475503569, 0),
	(1161, 2, 5, 'gradereport/user:view', 1, 1475503570, 0),
	(1162, 2, 4, 'gradereport/user:view', 1, 1475503570, 0),
	(1163, 2, 3, 'gradereport/user:view', 1, 1475503570, 0),
	(1164, 2, 1, 'gradereport/user:view', 1, 1475503570, 0),
	(1165, 2, 7, 'repository/alfresco:view', 1, 1475503573, 0),
	(1166, 2, 7, 'repository/areafiles:view', 1, 1475503576, 0),
	(1167, 2, 7, 'repository/boxnet:view', 1, 1475503577, 0),
	(1168, 2, 2, 'repository/coursefiles:view', 1, 1475503577, 0),
	(1169, 2, 4, 'repository/coursefiles:view', 1, 1475503577, 0),
	(1170, 2, 3, 'repository/coursefiles:view', 1, 1475503577, 0),
	(1171, 2, 1, 'repository/coursefiles:view', 1, 1475503577, 0),
	(1172, 2, 7, 'repository/dropbox:view', 1, 1475503577, 0),
	(1173, 2, 7, 'repository/equella:view', 1, 1475503578, 0),
	(1174, 2, 2, 'repository/filesystem:view', 1, 1475503579, 0),
	(1175, 2, 4, 'repository/filesystem:view', 1, 1475503579, 0),
	(1176, 2, 3, 'repository/filesystem:view', 1, 1475503579, 0),
	(1177, 2, 1, 'repository/filesystem:view', 1, 1475503579, 0),
	(1178, 2, 7, 'repository/flickr:view', 1, 1475503579, 0),
	(1179, 2, 7, 'repository/flickr_public:view', 1, 1475503580, 0),
	(1180, 2, 7, 'repository/googledocs:view', 1, 1475503580, 0),
	(1181, 2, 2, 'repository/local:view', 1, 1475503581, 0),
	(1182, 2, 4, 'repository/local:view', 1, 1475503581, 0),
	(1183, 2, 3, 'repository/local:view', 1, 1475503581, 0),
	(1184, 2, 1, 'repository/local:view', 1, 1475503581, 0),
	(1185, 2, 7, 'repository/merlot:view', 1, 1475503581, 0),
	(1186, 2, 7, 'repository/picasa:view', 1, 1475503582, 0),
	(1187, 2, 7, 'repository/recent:view', 1, 1475503582, 0),
	(1188, 2, 7, 'repository/s3:view', 1, 1475503583, 0),
	(1189, 2, 7, 'repository/skydrive:view', 1, 1475503583, 0),
	(1190, 2, 7, 'repository/upload:view', 1, 1475503584, 0),
	(1191, 2, 7, 'repository/url:view', 1, 1475503585, 0),
	(1192, 2, 7, 'repository/user:view', 1, 1475503586, 0),
	(1193, 2, 2, 'repository/webdav:view', 1, 1475503586, 0),
	(1194, 2, 4, 'repository/webdav:view', 1, 1475503586, 0),
	(1195, 2, 3, 'repository/webdav:view', 1, 1475503586, 0),
	(1196, 2, 1, 'repository/webdav:view', 1, 1475503586, 0),
	(1197, 2, 7, 'repository/wikimedia:view', 1, 1475503588, 0),
	(1198, 2, 7, 'repository/youtube:view', 1, 1475503589, 0),
	(1199, 2, 1, 'tool/customlang:view', 1, 1475503603, 0),
	(1200, 2, 1, 'tool/customlang:edit', 1, 1475503603, 0),
	(1201, 2, 1, 'tool/lpmigrate:frameworksmigrate', 1, 1475503608, 0),
	(1202, 2, 4, 'tool/monitor:subscribe', 1, 1475503611, 0),
	(1203, 2, 3, 'tool/monitor:subscribe', 1, 1475503611, 0),
	(1204, 2, 1, 'tool/monitor:subscribe', 1, 1475503611, 0),
	(1205, 2, 4, 'tool/monitor:managerules', 1, 1475503611, 0),
	(1206, 2, 3, 'tool/monitor:managerules', 1, 1475503611, 0),
	(1207, 2, 1, 'tool/monitor:managerules', 1, 1475503611, 0),
	(1208, 2, 1, 'tool/monitor:managetool', 1, 1475503611, 0),
	(1209, 2, 3, 'tool/recyclebin:deleteitems', 1, 1475503613, 0),
	(1210, 2, 1, 'tool/recyclebin:deleteitems', 1, 1475503613, 0),
	(1211, 2, 3, 'tool/recyclebin:restoreitems', 1, 1475503613, 0),
	(1212, 2, 1, 'tool/recyclebin:restoreitems', 1, 1475503613, 0),
	(1213, 2, 4, 'tool/recyclebin:viewitems', 1, 1475503613, 0),
	(1214, 2, 3, 'tool/recyclebin:viewitems', 1, 1475503613, 0),
	(1215, 2, 1, 'tool/recyclebin:viewitems', 1, 1475503613, 0),
	(1216, 2, 1, 'tool/uploaduser:uploaduserpictures', 1, 1475503617, 0),
	(1217, 2, 3, 'booktool/importhtml:import', 1, 1475503629, 0),
	(1218, 2, 1, 'booktool/importhtml:import', 1, 1475503629, 0),
	(1219, 2, 6, 'booktool/print:print', 1, 1475503630, 0),
	(1220, 2, 8, 'booktool/print:print', 1, 1475503630, 0),
	(1221, 2, 5, 'booktool/print:print', 1, 1475503630, 0),
	(1222, 2, 4, 'booktool/print:print', 1, 1475503630, 0),
	(1223, 2, 3, 'booktool/print:print', 1, 1475503630, 0),
	(1224, 2, 1, 'booktool/print:print', 1, 1475503630, 0),
	(1225, 2, 4, 'quiz/grading:viewstudentnames', 1, 1475503637, 0),
	(1226, 2, 3, 'quiz/grading:viewstudentnames', 1, 1475503637, 0),
	(1227, 2, 1, 'quiz/grading:viewstudentnames', 1, 1475503637, 0),
	(1228, 2, 4, 'quiz/grading:viewidnumber', 1, 1475503637, 0),
	(1229, 2, 3, 'quiz/grading:viewidnumber', 1, 1475503638, 0),
	(1230, 2, 1, 'quiz/grading:viewidnumber', 1, 1475503638, 0),
	(1231, 2, 4, 'quiz/statistics:view', 1, 1475503639, 0),
	(1232, 2, 3, 'quiz/statistics:view', 1, 1475503639, 0),
	(1233, 2, 1, 'quiz/statistics:view', 1, 1475503639, 0);
/*!40000 ALTER TABLE `mdl_role_capabilities` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_role_context_levels
CREATE TABLE IF NOT EXISTS `mdl_role_context_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecontleve_conrol_uix` (`contextlevel`,`roleid`),
  KEY `mdl_rolecontleve_rol_ix` (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists which roles can be assigned at which context levels. T';

-- Copiando dados para a tabela capacitacoes.mdl_role_context_levels: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_role_context_levels` DISABLE KEYS */;
INSERT INTO `mdl_role_context_levels` (`id`, `roleid`, `contextlevel`) VALUES
	(1, 1, 10),
	(4, 2, 10),
	(2, 1, 40),
	(5, 2, 40),
	(3, 1, 50),
	(6, 3, 50),
	(8, 4, 50),
	(10, 5, 50),
	(7, 3, 70),
	(9, 4, 70),
	(11, 5, 70);
/*!40000 ALTER TABLE `mdl_role_context_levels` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_role_names
CREATE TABLE IF NOT EXISTS `mdl_role_names` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolename_rolcon_uix` (`roleid`,`contextid`),
  KEY `mdl_rolename_rol_ix` (`roleid`),
  KEY `mdl_rolename_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='role names in native strings';

-- Copiando dados para a tabela capacitacoes.mdl_role_names: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_role_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_role_names` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_role_sortorder
CREATE TABLE IF NOT EXISTS `mdl_role_sortorder` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `sortoder` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolesort_userolcon_uix` (`userid`,`roleid`,`contextid`),
  KEY `mdl_rolesort_use_ix` (`userid`),
  KEY `mdl_rolesort_rol_ix` (`roleid`),
  KEY `mdl_rolesort_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='sort order of course managers in a course';

-- Copiando dados para a tabela capacitacoes.mdl_role_sortorder: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_role_sortorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_role_sortorder` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_scale
CREATE TABLE IF NOT EXISTS `mdl_scale` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scale` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scal_cou_ix` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines grading scales';

-- Copiando dados para a tabela capacitacoes.mdl_scale: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_scale` DISABLE KEYS */;
INSERT INTO `mdl_scale` (`id`, `courseid`, `userid`, `name`, `scale`, `description`, `descriptionformat`, `timemodified`) VALUES
	(1, 0, 0, 'Formas de saber: conectada e destacada', 'Sobretudo saber destacado,Destacado e conectado,Sobretudo saber conectado', 'A escala é baseada na teoria de conhecimento separado e conectado. Esta teoria descreve duas maneiras diferentes de avaliar e aprender sobre as coisas que vemos e ouvimos.<ul><li><strong>Conhecedores separados</strong> permanecem o mais objetivo possível sem incluir semtimentos e emoções. Em uma discussão com outras pessoas, eles gostam de defender suas próprias idéias, usando lógica para encontrar furos nas idéias de seus oponentes.</li><li><strong>Conhecedores conectados</strong> são mais sensíveis com as outras pessoas. Eles são habilidosos em empatia e preferem ouvir e questionar até que sintam que podem conectar e "entender as coisas do seu ponto de vista". Eles aprendem pela tentativa de compartilhar as experiências que levam ao conhecimento que eles encontram nas outras pessoas.</li></ul>', 0, 1475503331),
	(2, 0, 0, 'Escala de competência padrão', 'Ainda não tem a competência,Tem a competência', 'A escala de classificação binária que fornece nenhuma outra informação além se alguém tem demonstrado proficiência ou não.', 0, 1475503331);
/*!40000 ALTER TABLE `mdl_scale` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_scale_history
CREATE TABLE IF NOT EXISTS `mdl_scale_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scale` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scalhist_act_ix` (`action`),
  KEY `mdl_scalhist_old_ix` (`oldid`),
  KEY `mdl_scalhist_cou_ix` (`courseid`),
  KEY `mdl_scalhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table';

-- Copiando dados para a tabela capacitacoes.mdl_scale_history: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_scale_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scale_history` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_scorm
CREATE TABLE IF NOT EXISTS `mdl_scorm` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scormtype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `version` varchar(9) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `maxgrade` double NOT NULL DEFAULT '0',
  `grademethod` tinyint(2) NOT NULL DEFAULT '0',
  `whatgrade` bigint(10) NOT NULL DEFAULT '0',
  `maxattempt` bigint(10) NOT NULL DEFAULT '1',
  `forcecompleted` tinyint(1) NOT NULL DEFAULT '0',
  `forcenewattempt` tinyint(1) NOT NULL DEFAULT '0',
  `lastattemptlock` tinyint(1) NOT NULL DEFAULT '0',
  `masteryoverride` tinyint(1) NOT NULL DEFAULT '1',
  `displayattemptstatus` tinyint(1) NOT NULL DEFAULT '1',
  `displaycoursestructure` tinyint(1) NOT NULL DEFAULT '0',
  `updatefreq` tinyint(1) NOT NULL DEFAULT '0',
  `sha1hash` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `md5hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `launch` bigint(10) NOT NULL DEFAULT '0',
  `skipview` tinyint(1) NOT NULL DEFAULT '1',
  `hidebrowse` tinyint(1) NOT NULL DEFAULT '0',
  `hidetoc` tinyint(1) NOT NULL DEFAULT '0',
  `nav` tinyint(1) NOT NULL DEFAULT '1',
  `navpositionleft` bigint(10) DEFAULT '-100',
  `navpositiontop` bigint(10) DEFAULT '-100',
  `auto` tinyint(1) NOT NULL DEFAULT '0',
  `popup` tinyint(1) NOT NULL DEFAULT '0',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `width` bigint(10) NOT NULL DEFAULT '100',
  `height` bigint(10) NOT NULL DEFAULT '600',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionstatusrequired` tinyint(1) DEFAULT NULL,
  `completionscorerequired` tinyint(2) DEFAULT NULL,
  `displayactivityname` smallint(4) NOT NULL DEFAULT '1',
  `autocommit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scor_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each table is one SCORM module and its configuration';

-- Copiando dados para a tabela capacitacoes.mdl_scorm: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_scorm` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_scorm_aicc_session
CREATE TABLE IF NOT EXISTS `mdl_scorm_aicc_session` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `hacpsession` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scoid` bigint(10) DEFAULT '0',
  `scormmode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scormstatus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` bigint(10) DEFAULT NULL,
  `lessonstatus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sessiontime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scoraiccsess_sco_ix` (`scormid`),
  KEY `mdl_scoraiccsess_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Used by AICC HACP to store session information';

-- Copiando dados para a tabela capacitacoes.mdl_scorm_aicc_session: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_scorm_aicc_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_aicc_session` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_scorm_scoes
CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scorm` bigint(10) NOT NULL DEFAULT '0',
  `manifest` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `organization` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `launch` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scormtype` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoe_sco_ix` (`scorm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each SCO part of the SCORM module';

-- Copiando dados para a tabela capacitacoes.mdl_scorm_scoes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_scorm_scoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_scoes` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_scorm_scoes_data
CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoedata_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains variable data get from packages';

-- Copiando dados para a tabela capacitacoes.mdl_scorm_scoes_data: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_scorm_scoes_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_scoes_data` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_scorm_scoes_track
CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes_track` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` bigint(10) NOT NULL DEFAULT '1',
  `element` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorscoetrac_usescosco_uix` (`userid`,`scormid`,`scoid`,`attempt`,`element`),
  KEY `mdl_scorscoetrac_use_ix` (`userid`),
  KEY `mdl_scorscoetrac_ele_ix` (`element`),
  KEY `mdl_scorscoetrac_sco_ix` (`scormid`),
  KEY `mdl_scorscoetrac_sco2_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to track SCOes';

-- Copiando dados para a tabela capacitacoes.mdl_scorm_scoes_track: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_scorm_scoes_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_scoes_track` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_scorm_seq_mapinfo
CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_mapinfo` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `objectiveid` bigint(10) NOT NULL DEFAULT '0',
  `targetobjectiveid` bigint(10) NOT NULL DEFAULT '0',
  `readsatisfiedstatus` tinyint(1) NOT NULL DEFAULT '1',
  `readnormalizedmeasure` tinyint(1) NOT NULL DEFAULT '1',
  `writesatisfiedstatus` tinyint(1) NOT NULL DEFAULT '0',
  `writenormalizedmeasure` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqmapi_scoidobj_uix` (`scoid`,`id`,`objectiveid`),
  KEY `mdl_scorseqmapi_sco_ix` (`scoid`),
  KEY `mdl_scorseqmapi_obj_ix` (`objectiveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 objective mapinfo description';

-- Copiando dados para a tabela capacitacoes.mdl_scorm_seq_mapinfo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_scorm_seq_mapinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_mapinfo` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_scorm_seq_objective
CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_objective` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `primaryobj` tinyint(1) NOT NULL DEFAULT '0',
  `objectiveid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `satisfiedbymeasure` tinyint(1) NOT NULL DEFAULT '1',
  `minnormalizedmeasure` float(11,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqobje_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqobje_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 objective description';

-- Copiando dados para a tabela capacitacoes.mdl_scorm_seq_objective: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_scorm_seq_objective` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_objective` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_scorm_seq_rolluprule
CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rolluprule` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `childactivityset` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `minimumcount` bigint(10) NOT NULL DEFAULT '0',
  `minimumpercent` float(11,4) NOT NULL DEFAULT '0.0000',
  `conditioncombination` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `action` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqroll_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 sequencing rule';

-- Copiando dados para a tabela capacitacoes.mdl_scorm_seq_rolluprule: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprule` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprule` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_scorm_seq_rolluprulecond
CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rolluprulecond` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `rollupruleid` bigint(10) NOT NULL DEFAULT '0',
  `operator` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'noOp',
  `cond` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scorolid_uix` (`scoid`,`rollupruleid`,`id`),
  KEY `mdl_scorseqroll_sco2_ix` (`scoid`),
  KEY `mdl_scorseqroll_rol_ix` (`rollupruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 sequencing rule';

-- Copiando dados para a tabela capacitacoes.mdl_scorm_seq_rolluprulecond: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprulecond` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprulecond` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_scorm_seq_rulecond
CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rulecond` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `ruleconditionsid` bigint(10) NOT NULL DEFAULT '0',
  `refrencedobjective` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `measurethreshold` float(11,4) NOT NULL DEFAULT '0.0000',
  `operator` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'noOp',
  `cond` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'always',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_idscorul_uix` (`id`,`scoid`,`ruleconditionsid`),
  KEY `mdl_scorseqrule_sco2_ix` (`scoid`),
  KEY `mdl_scorseqrule_rul_ix` (`ruleconditionsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 rule condition';

-- Copiando dados para a tabela capacitacoes.mdl_scorm_seq_rulecond: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_scorm_seq_rulecond` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_rulecond` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_scorm_seq_ruleconds
CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_ruleconds` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `conditioncombination` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `ruletype` tinyint(2) NOT NULL DEFAULT '0',
  `action` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqrule_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 rule conditions';

-- Copiando dados para a tabela capacitacoes.mdl_scorm_seq_ruleconds: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_scorm_seq_ruleconds` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_ruleconds` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_sessions
CREATE TABLE IF NOT EXISTS `mdl_sessions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `state` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `sessdata` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_sess_sid_uix` (`sid`),
  KEY `mdl_sess_sta_ix` (`state`),
  KEY `mdl_sess_tim_ix` (`timecreated`),
  KEY `mdl_sess_tim2_ix` (`timemodified`),
  KEY `mdl_sess_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Database based session storage - now recommended';

-- Copiando dados para a tabela capacitacoes.mdl_sessions: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_sessions` DISABLE KEYS */;
INSERT INTO `mdl_sessions` (`id`, `state`, `sid`, `userid`, `sessdata`, `timecreated`, `timemodified`, `firstip`, `lastip`) VALUES
	(5, 0, 'rpnmes2d55lh8fdjc8dr2cjbq4', 2, NULL, 1475526581, 1475528401, '127.0.0.1', '127.0.0.1'),
	(6, 0, 'd82191ovjo78a3161plurvn6l4', 3, NULL, 1475527269, 1475527705, '127.0.0.1', '127.0.0.1');
/*!40000 ALTER TABLE `mdl_sessions` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_stats_daily
CREATE TABLE IF NOT EXISTS `mdl_stats_daily` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statdail_cou_ix` (`courseid`),
  KEY `mdl_statdail_tim_ix` (`timeend`),
  KEY `mdl_statdail_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to accumulate daily stats';

-- Copiando dados para a tabela capacitacoes.mdl_stats_daily: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_stats_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_daily` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_stats_monthly
CREATE TABLE IF NOT EXISTS `mdl_stats_monthly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statmont_cou_ix` (`courseid`),
  KEY `mdl_statmont_tim_ix` (`timeend`),
  KEY `mdl_statmont_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate monthly stats';

-- Copiando dados para a tabela capacitacoes.mdl_stats_monthly: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_stats_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_monthly` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_stats_user_daily
CREATE TABLE IF NOT EXISTS `mdl_stats_user_daily` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserdail_cou_ix` (`courseid`),
  KEY `mdl_statuserdail_use_ix` (`userid`),
  KEY `mdl_statuserdail_rol_ix` (`roleid`),
  KEY `mdl_statuserdail_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate daily stats per course/user';

-- Copiando dados para a tabela capacitacoes.mdl_stats_user_daily: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_stats_user_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_user_daily` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_stats_user_monthly
CREATE TABLE IF NOT EXISTS `mdl_stats_user_monthly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statusermont_cou_ix` (`courseid`),
  KEY `mdl_statusermont_use_ix` (`userid`),
  KEY `mdl_statusermont_rol_ix` (`roleid`),
  KEY `mdl_statusermont_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate monthly stats per course/user';

-- Copiando dados para a tabela capacitacoes.mdl_stats_user_monthly: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_stats_user_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_user_monthly` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_stats_user_weekly
CREATE TABLE IF NOT EXISTS `mdl_stats_user_weekly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserweek_cou_ix` (`courseid`),
  KEY `mdl_statuserweek_use_ix` (`userid`),
  KEY `mdl_statuserweek_rol_ix` (`roleid`),
  KEY `mdl_statuserweek_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate weekly stats per course/user';

-- Copiando dados para a tabela capacitacoes.mdl_stats_user_weekly: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_stats_user_weekly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_user_weekly` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_stats_weekly
CREATE TABLE IF NOT EXISTS `mdl_stats_weekly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statweek_cou_ix` (`courseid`),
  KEY `mdl_statweek_tim_ix` (`timeend`),
  KEY `mdl_statweek_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate weekly stats';

-- Copiando dados para a tabela capacitacoes.mdl_stats_weekly: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_stats_weekly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_weekly` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_survey
CREATE TABLE IF NOT EXISTS `mdl_survey` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `days` mediumint(6) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `questions` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_surv_cou_ix` (`course`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one SURVEY module with its configuration';

-- Copiando dados para a tabela capacitacoes.mdl_survey: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_survey` DISABLE KEYS */;
INSERT INTO `mdl_survey` (`id`, `course`, `template`, `days`, `timecreated`, `timemodified`, `name`, `intro`, `introformat`, `questions`) VALUES
	(1, 0, 0, 0, 985017600, 985017600, 'collesaname', 'collesaintro', 0, '25,26,27,28,29,30,43,44'),
	(2, 0, 0, 0, 985017600, 985017600, 'collespname', 'collespintro', 0, '31,32,33,34,35,36,43,44'),
	(3, 0, 0, 0, 985017600, 985017600, 'collesapname', 'collesapintro', 0, '37,38,39,40,41,42,43,44'),
	(4, 0, 0, 0, 985017600, 985017600, 'attlsname', 'attlsintro', 0, '65,67,68'),
	(5, 0, 0, 0, 985017600, 985017600, 'ciqname', 'ciqintro', 0, '69,70,71,72,73');
/*!40000 ALTER TABLE `mdl_survey` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_survey_analysis
CREATE TABLE IF NOT EXISTS `mdl_survey_analysis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `notes` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survanal_use_ix` (`userid`),
  KEY `mdl_survanal_sur_ix` (`survey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='text about each survey submission';

-- Copiando dados para a tabela capacitacoes.mdl_survey_analysis: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_survey_analysis` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_survey_analysis` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_survey_answers
CREATE TABLE IF NOT EXISTS `mdl_survey_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `answer1` longtext COLLATE utf8_unicode_ci NOT NULL,
  `answer2` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survansw_use_ix` (`userid`),
  KEY `mdl_survansw_sur_ix` (`survey`),
  KEY `mdl_survansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the answers to each questions filled by the users';

-- Copiando dados para a tabela capacitacoes.mdl_survey_answers: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_survey_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_survey_answers` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_survey_questions
CREATE TABLE IF NOT EXISTS `mdl_survey_questions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shorttext` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `multi` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` smallint(3) NOT NULL DEFAULT '0',
  `options` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the questions conforming one survey';

-- Copiando dados para a tabela capacitacoes.mdl_survey_questions: ~73 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_survey_questions` DISABLE KEYS */;
INSERT INTO `mdl_survey_questions` (`id`, `text`, `shorttext`, `multi`, `intro`, `type`, `options`) VALUES
	(1, 'colles1', 'colles1short', '', '', 1, 'scaletimes5'),
	(2, 'colles2', 'colles2short', '', '', 1, 'scaletimes5'),
	(3, 'colles3', 'colles3short', '', '', 1, 'scaletimes5'),
	(4, 'colles4', 'colles4short', '', '', 1, 'scaletimes5'),
	(5, 'colles5', 'colles5short', '', '', 1, 'scaletimes5'),
	(6, 'colles6', 'colles6short', '', '', 1, 'scaletimes5'),
	(7, 'colles7', 'colles7short', '', '', 1, 'scaletimes5'),
	(8, 'colles8', 'colles8short', '', '', 1, 'scaletimes5'),
	(9, 'colles9', 'colles9short', '', '', 1, 'scaletimes5'),
	(10, 'colles10', 'colles10short', '', '', 1, 'scaletimes5'),
	(11, 'colles11', 'colles11short', '', '', 1, 'scaletimes5'),
	(12, 'colles12', 'colles12short', '', '', 1, 'scaletimes5'),
	(13, 'colles13', 'colles13short', '', '', 1, 'scaletimes5'),
	(14, 'colles14', 'colles14short', '', '', 1, 'scaletimes5'),
	(15, 'colles15', 'colles15short', '', '', 1, 'scaletimes5'),
	(16, 'colles16', 'colles16short', '', '', 1, 'scaletimes5'),
	(17, 'colles17', 'colles17short', '', '', 1, 'scaletimes5'),
	(18, 'colles18', 'colles18short', '', '', 1, 'scaletimes5'),
	(19, 'colles19', 'colles19short', '', '', 1, 'scaletimes5'),
	(20, 'colles20', 'colles20short', '', '', 1, 'scaletimes5'),
	(21, 'colles21', 'colles21short', '', '', 1, 'scaletimes5'),
	(22, 'colles22', 'colles22short', '', '', 1, 'scaletimes5'),
	(23, 'colles23', 'colles23short', '', '', 1, 'scaletimes5'),
	(24, 'colles24', 'colles24short', '', '', 1, 'scaletimes5'),
	(25, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 1, 'scaletimes5'),
	(26, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 1, 'scaletimes5'),
	(27, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 1, 'scaletimes5'),
	(28, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 1, 'scaletimes5'),
	(29, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 1, 'scaletimes5'),
	(30, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 1, 'scaletimes5'),
	(31, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 2, 'scaletimes5'),
	(32, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 2, 'scaletimes5'),
	(33, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 2, 'scaletimes5'),
	(34, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 2, 'scaletimes5'),
	(35, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 2, 'scaletimes5'),
	(36, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 2, 'scaletimes5'),
	(37, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 3, 'scaletimes5'),
	(38, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 3, 'scaletimes5'),
	(39, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 3, 'scaletimes5'),
	(40, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 3, 'scaletimes5'),
	(41, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 3, 'scaletimes5'),
	(42, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 3, 'scaletimes5'),
	(43, 'howlong', '', '', '', 1, 'howlongoptions'),
	(44, 'othercomments', '', '', '', 0, NULL),
	(45, 'attls1', 'attls1short', '', '', 1, 'scaleagree5'),
	(46, 'attls2', 'attls2short', '', '', 1, 'scaleagree5'),
	(47, 'attls3', 'attls3short', '', '', 1, 'scaleagree5'),
	(48, 'attls4', 'attls4short', '', '', 1, 'scaleagree5'),
	(49, 'attls5', 'attls5short', '', '', 1, 'scaleagree5'),
	(50, 'attls6', 'attls6short', '', '', 1, 'scaleagree5'),
	(51, 'attls7', 'attls7short', '', '', 1, 'scaleagree5'),
	(52, 'attls8', 'attls8short', '', '', 1, 'scaleagree5'),
	(53, 'attls9', 'attls9short', '', '', 1, 'scaleagree5'),
	(54, 'attls10', 'attls10short', '', '', 1, 'scaleagree5'),
	(55, 'attls11', 'attls11short', '', '', 1, 'scaleagree5'),
	(56, 'attls12', 'attls12short', '', '', 1, 'scaleagree5'),
	(57, 'attls13', 'attls13short', '', '', 1, 'scaleagree5'),
	(58, 'attls14', 'attls14short', '', '', 1, 'scaleagree5'),
	(59, 'attls15', 'attls15short', '', '', 1, 'scaleagree5'),
	(60, 'attls16', 'attls16short', '', '', 1, 'scaleagree5'),
	(61, 'attls17', 'attls17short', '', '', 1, 'scaleagree5'),
	(62, 'attls18', 'attls18short', '', '', 1, 'scaleagree5'),
	(63, 'attls19', 'attls19short', '', '', 1, 'scaleagree5'),
	(64, 'attls20', 'attls20short', '', '', 1, 'scaleagree5'),
	(65, 'attlsm1', 'attlsm1', '45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64', 'attlsmintro', 1, 'scaleagree5'),
	(66, '-', '-', '-', '-', 0, '-'),
	(67, 'attlsm2', 'attlsm2', '63,62,59,57,55,49,52,50,48,47', 'attlsmintro', -1, 'scaleagree5'),
	(68, 'attlsm3', 'attlsm3', '46,54,45,51,60,53,56,58,61,64', 'attlsmintro', -1, 'scaleagree5'),
	(69, 'ciq1', 'ciq1short', '', '', 0, NULL),
	(70, 'ciq2', 'ciq2short', '', '', 0, NULL),
	(71, 'ciq3', 'ciq3short', '', '', 0, NULL),
	(72, 'ciq4', 'ciq4short', '', '', 0, NULL),
	(73, 'ciq5', 'ciq5short', '', '', 0, NULL);
/*!40000 ALTER TABLE `mdl_survey_questions` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_tag
CREATE TABLE IF NOT EXISTS `mdl_tag` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `tagcollid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rawname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `isstandard` tinyint(1) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `flag` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tag_tagnam_uix` (`tagcollid`,`name`),
  KEY `mdl_tag_tagiss_ix` (`tagcollid`,`isstandard`),
  KEY `mdl_tag_use_ix` (`userid`),
  KEY `mdl_tag_tag_ix` (`tagcollid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tag table - this generic table will replace the old "tags" t';

-- Copiando dados para a tabela capacitacoes.mdl_tag: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tag` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_tag_area
CREATE TABLE IF NOT EXISTS `mdl_tag_area` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `tagcollid` bigint(10) NOT NULL,
  `callback` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `callbackfile` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `showstandard` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tagarea_comite_uix` (`component`,`itemtype`),
  KEY `mdl_tagarea_tag_ix` (`tagcollid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines various tag areas, one area is identified by compone';

-- Copiando dados para a tabela capacitacoes.mdl_tag_area: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_tag_area` DISABLE KEYS */;
INSERT INTO `mdl_tag_area` (`id`, `component`, `itemtype`, `enabled`, `tagcollid`, `callback`, `callbackfile`, `showstandard`) VALUES
	(1, 'core', 'user', 1, 1, 'user_get_tagged_users', '/user/lib.php', 2),
	(2, 'core', 'course', 1, 1, 'course_get_tagged_courses', '/course/lib.php', 0),
	(3, 'core_question', 'question', 1, 1, NULL, NULL, 0),
	(4, 'core', 'post', 1, 1, 'blog_get_tagged_posts', '/blog/lib.php', 0),
	(5, 'core', 'blog_external', 1, 1, NULL, NULL, 0),
	(6, 'core', 'course_modules', 1, 1, 'course_get_tagged_course_modules', '/course/lib.php', 0),
	(7, 'mod_wiki', 'wiki_pages', 1, 1, 'mod_wiki_get_tagged_pages', '/mod/wiki/locallib.php', 0);
/*!40000 ALTER TABLE `mdl_tag_area` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_tag_coll
CREATE TABLE IF NOT EXISTS `mdl_tag_coll` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isdefault` tinyint(2) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortorder` mediumint(5) NOT NULL DEFAULT '0',
  `searchable` tinyint(2) NOT NULL DEFAULT '1',
  `customurl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines different set of tags';

-- Copiando dados para a tabela capacitacoes.mdl_tag_coll: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_tag_coll` DISABLE KEYS */;
INSERT INTO `mdl_tag_coll` (`id`, `name`, `isdefault`, `component`, `sortorder`, `searchable`, `customurl`) VALUES
	(1, NULL, 1, NULL, 0, 1, NULL);
/*!40000 ALTER TABLE `mdl_tag_coll` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_tag_correlation
CREATE TABLE IF NOT EXISTS `mdl_tag_correlation` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) NOT NULL,
  `correlatedtags` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_tagcorr_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The rationale for the ''tag_correlation'' table is performance';

-- Copiando dados para a tabela capacitacoes.mdl_tag_correlation: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_tag_correlation` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tag_correlation` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_tag_instance
CREATE TABLE IF NOT EXISTS `mdl_tag_instance` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `contextid` bigint(10) DEFAULT NULL,
  `tiuserid` bigint(10) NOT NULL DEFAULT '0',
  `ordering` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_taginst_comiteitetiuta_uix` (`component`,`itemtype`,`itemid`,`tiuserid`,`tagid`),
  KEY `mdl_taginst_itecomtagcon_ix` (`itemtype`,`component`,`tagid`,`contextid`),
  KEY `mdl_taginst_tag_ix` (`tagid`),
  KEY `mdl_taginst_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='tag_instance table holds the information of associations bet';

-- Copiando dados para a tabela capacitacoes.mdl_tag_instance: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_tag_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tag_instance` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_task_adhoc
CREATE TABLE IF NOT EXISTS `mdl_task_adhoc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `component` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nextruntime` bigint(10) NOT NULL,
  `faildelay` bigint(10) DEFAULT NULL,
  `customdata` longtext COLLATE utf8_unicode_ci,
  `blocking` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_taskadho_nex_ix` (`nextruntime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of adhoc tasks waiting to run.';

-- Copiando dados para a tabela capacitacoes.mdl_task_adhoc: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_task_adhoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_task_adhoc` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_task_scheduled
CREATE TABLE IF NOT EXISTS `mdl_task_scheduled` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `component` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lastruntime` bigint(10) DEFAULT NULL,
  `nextruntime` bigint(10) DEFAULT NULL,
  `blocking` tinyint(2) NOT NULL DEFAULT '0',
  `minute` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hour` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `day` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `month` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dayofweek` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `faildelay` bigint(10) DEFAULT NULL,
  `customised` tinyint(2) NOT NULL DEFAULT '0',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tasksche_cla_uix` (`classname`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of scheduled tasks to be run by cron.';

-- Copiando dados para a tabela capacitacoes.mdl_task_scheduled: ~53 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_task_scheduled` DISABLE KEYS */;
INSERT INTO `mdl_task_scheduled` (`id`, `component`, `classname`, `lastruntime`, `nextruntime`, `blocking`, `minute`, `hour`, `day`, `month`, `dayofweek`, `faildelay`, `customised`, `disabled`) VALUES
	(1, 'moodle', '\\core\\task\\session_cleanup_task', 0, 1475503380, 0, '*', '*', '*', '*', '*', 0, 0, 0),
	(2, 'moodle', '\\core\\task\\delete_unconfirmed_users_task', 0, 1475506800, 0, '0', '*', '*', '*', '*', 0, 0, 0),
	(3, 'moodle', '\\core\\task\\delete_incomplete_users_task', 0, 1475503500, 0, '5', '*', '*', '*', '*', 0, 0, 0),
	(4, 'moodle', '\\core\\task\\backup_cleanup_task', 0, 1475503800, 0, '10', '*', '*', '*', '*', 0, 0, 0),
	(5, 'moodle', '\\core\\task\\tag_cron_task', 0, 1475562180, 0, '23', '3', '*', '*', '*', 0, 0, 0),
	(6, 'moodle', '\\core\\task\\context_cleanup_task', 0, 1475504700, 0, '25', '*', '*', '*', '*', 0, 0, 0),
	(7, 'moodle', '\\core\\task\\cache_cleanup_task', 0, 1475505000, 0, '30', '*', '*', '*', '*', 0, 0, 0),
	(8, 'moodle', '\\core\\task\\messaging_cleanup_task', 0, 1475505300, 0, '35', '*', '*', '*', '*', 0, 0, 0),
	(9, 'moodle', '\\core\\task\\send_new_user_passwords_task', 0, 1475503380, 0, '*', '*', '*', '*', '*', 0, 0, 0),
	(10, 'moodle', '\\core\\task\\send_failed_login_notifications_task', 0, 1475503380, 0, '*', '*', '*', '*', '*', 0, 0, 0),
	(11, 'moodle', '\\core\\task\\create_contexts_task', 0, 1475550000, 1, '0', '0', '*', '*', '*', 0, 0, 0),
	(12, 'moodle', '\\core\\task\\legacy_plugin_cron_task', 0, 1475503380, 0, '*', '*', '*', '*', '*', 0, 0, 0),
	(13, 'moodle', '\\core\\task\\grade_cron_task', 0, 1475503380, 0, '*', '*', '*', '*', '*', 0, 0, 0),
	(14, 'moodle', '\\core\\task\\events_cron_task', 0, 1475503380, 0, '*', '*', '*', '*', '*', 0, 0, 0),
	(15, 'moodle', '\\core\\task\\completion_regular_task', 0, 1475503380, 0, '*', '*', '*', '*', '*', 0, 0, 0),
	(16, 'moodle', '\\core\\task\\completion_daily_task', 0, 1475503500, 0, '5', '11', '*', '*', '*', 0, 0, 0),
	(17, 'moodle', '\\core\\task\\portfolio_cron_task', 0, 1475503380, 0, '*', '*', '*', '*', '*', 0, 0, 0),
	(18, 'moodle', '\\core\\task\\plagiarism_cron_task', 0, 1475503380, 0, '*', '*', '*', '*', '*', 0, 0, 0),
	(19, 'moodle', '\\core\\task\\calendar_cron_task', 0, 1475503380, 0, '*', '*', '*', '*', '*', 0, 0, 0),
	(20, 'moodle', '\\core\\task\\blog_cron_task', 0, 1475503380, 0, '*', '*', '*', '*', '*', 0, 0, 0),
	(21, 'moodle', '\\core\\task\\question_cron_task', 0, 1475503380, 0, '*', '*', '*', '*', '*', 0, 0, 0),
	(22, 'moodle', '\\core\\task\\registration_cron_task', 0, 1475889000, 0, '10', '22', '*', '*', '5', 0, 0, 0),
	(23, 'moodle', '\\core\\task\\check_for_updates_task', 0, 1475506800, 0, '0', '*/2', '*', '*', '*', 0, 0, 0),
	(24, 'moodle', '\\core\\task\\cache_cron_task', 0, 1475506200, 0, '50', '*', '*', '*', '*', 0, 0, 0),
	(25, 'moodle', '\\core\\task\\automated_backup_task', 0, 1475506200, 0, '50', '*', '*', '*', '*', 0, 0, 0),
	(26, 'moodle', '\\core\\task\\badges_cron_task', 0, 1475503500, 0, '*/5', '*', '*', '*', '*', 0, 0, 0),
	(27, 'moodle', '\\core\\task\\file_temp_cleanup_task', 0, 1475510100, 0, '55', '*/6', '*', '*', '*', 0, 0, 0),
	(28, 'moodle', '\\core\\task\\file_trash_cleanup_task', 0, 1475510100, 0, '55', '*/6', '*', '*', '*', 0, 0, 0),
	(29, 'moodle', '\\core\\task\\search_index_task', 0, 1475505000, 0, '*/30', '*', '*', '*', '*', 0, 0, 0),
	(30, 'moodle', '\\core\\task\\search_optimize_task', 0, 1475507700, 0, '15', '*/12', '*', '*', '*', 0, 0, 0),
	(31, 'moodle', '\\core\\task\\stats_cron_task', 0, 1475550000, 0, '0', '0', '*', '*', '*', 0, 0, 0),
	(32, 'moodle', '\\core\\task\\password_reset_cleanup_task', 0, 1475506800, 0, '0', '*/6', '*', '*', '*', 0, 0, 0),
	(33, 'moodle', '\\core\\task\\complete_plans_task', 0, 1475503620, 0, '7', '*', '*', '*', '*', 0, 0, 0),
	(34, 'moodle', '\\core\\task\\sync_plans_from_template_cohorts_task', 0, 1475503980, 0, '13', '*', '*', '*', '*', 0, 0, 0),
	(35, 'mod_forum', '\\mod_forum\\task\\cron_task', 0, 1475503440, 0, '*', '*', '*', '*', '*', 0, 0, 0),
	(36, 'auth_cas', '\\auth_cas\\task\\sync_task', 0, 1475550000, 0, '0', '0', '*', '*', '*', 0, 0, 1),
	(37, 'auth_ldap', '\\auth_ldap\\task\\sync_task', 0, 1475550000, 0, '0', '0', '*', '*', '*', 0, 0, 1),
	(38, 'enrol_flatfile', '\\enrol_flatfile\\task\\flatfile_sync_task', 0, 1475504100, 0, '15', '*', '*', '*', '*', 0, 0, 0),
	(39, 'enrol_imsenterprise', '\\enrol_imsenterprise\\task\\cron_task', 0, 1475503800, 0, '10', '*', '*', '*', '*', 0, 0, 0),
	(40, 'enrol_lti', '\\enrol_lti\\task\\sync_grades', 0, 1475505000, 0, '*/30', '*', '*', '*', '*', 0, 0, 0),
	(41, 'enrol_lti', '\\enrol_lti\\task\\sync_members', 0, 1475505000, 0, '*/30', '*', '*', '*', '*', 0, 0, 0),
	(42, 'editor_atto', '\\editor_atto\\task\\autosave_cleanup_task', 0, 1475917200, 0, '0', '6', '*', '*', '6', 0, 0, 0),
	(43, 'tool_cohortroles', '\\tool_cohortroles\\task\\cohort_role_sync', 0, 1475507160, 0, '6', '*', '*', '*', '*', 0, 0, 0),
	(44, 'tool_langimport', '\\tool_langimport\\task\\update_langpacks_task', 0, 1475565180, 0, '13', '4', '*', '*', '*', 0, 0, 0),
	(45, 'tool_messageinbound', '\\tool_messageinbound\\task\\pickup_task', 0, 1475503620, 0, '*', '*', '*', '*', '*', 0, 0, 0),
	(46, 'tool_messageinbound', '\\tool_messageinbound\\task\\cleanup_task', 0, 1475556900, 0, '55', '1', '*', '*', '*', 0, 0, 0),
	(47, 'tool_monitor', '\\tool_monitor\\task\\clean_events', 0, 1475503620, 0, '*', '*', '*', '*', '*', 0, 0, 0),
	(48, 'tool_monitor', '\\tool_monitor\\task\\check_subscriptions', 0, 1475514420, 0, '7', '14', '*', '*', '*', 0, 0, 0),
	(49, 'tool_recyclebin', '\\tool_recyclebin\\task\\cleanup_course_bin', 0, 1475505000, 0, '*/30', '*', '*', '*', '*', 0, 0, 0),
	(50, 'tool_recyclebin', '\\tool_recyclebin\\task\\cleanup_category_bin', 0, 1475505000, 0, '*/30', '*', '*', '*', '*', 0, 0, 0),
	(51, 'assignfeedback_editpdf', '\\assignfeedback_editpdf\\task\\convert_submissions', 0, 1475504100, 0, '*/15', '*', '*', '*', '*', 0, 0, 0),
	(52, 'logstore_legacy', '\\logstore_legacy\\task\\cleanup_task', 0, 1475568060, 0, '1', '5', '*', '*', '*', 0, 0, 0),
	(53, 'logstore_standard', '\\logstore_standard\\task\\cleanup_task', 0, 1475565540, 0, '19', '4', '*', '*', '*', 0, 0, 0);
/*!40000 ALTER TABLE `mdl_task_scheduled` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_tool_cohortroles
CREATE TABLE IF NOT EXISTS `mdl_tool_cohortroles` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `cohortid` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolcoho_cohroluse_uix` (`cohortid`,`roleid`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Mapping of users to cohort role assignments.';

-- Copiando dados para a tabela capacitacoes.mdl_tool_cohortroles: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_tool_cohortroles` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_cohortroles` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_tool_customlang
CREATE TABLE IF NOT EXISTS `mdl_tool_customlang` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lang` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `componentid` bigint(10) NOT NULL,
  `stringid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `original` longtext COLLATE utf8_unicode_ci NOT NULL,
  `master` longtext COLLATE utf8_unicode_ci,
  `local` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL,
  `timecustomized` bigint(10) DEFAULT NULL,
  `outdated` smallint(3) DEFAULT '0',
  `modified` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolcust_lancomstr_uix` (`lang`,`componentid`,`stringid`),
  KEY `mdl_toolcust_com_ix` (`componentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the working checkout of all strings and their custo';

-- Copiando dados para a tabela capacitacoes.mdl_tool_customlang: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_tool_customlang` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_customlang` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_tool_customlang_components
CREATE TABLE IF NOT EXISTS `mdl_tool_customlang_components` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the list of all installed plugins that provide thei';

-- Copiando dados para a tabela capacitacoes.mdl_tool_customlang_components: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_tool_customlang_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_customlang_components` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_tool_monitor_events
CREATE TABLE IF NOT EXISTS `mdl_tool_monitor_events` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  `contextinstanceid` bigint(10) NOT NULL,
  `link` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A table that keeps a log of events related to subscriptions';

-- Copiando dados para a tabela capacitacoes.mdl_tool_monitor_events: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_tool_monitor_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_monitor_events` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_tool_monitor_history
CREATE TABLE IF NOT EXISTS `mdl_tool_monitor_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `sid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timesent` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolmonihist_sidusetim_uix` (`sid`,`userid`,`timesent`),
  KEY `mdl_toolmonihist_sid_ix` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table to store history of message notifications sent';

-- Copiando dados para a tabela capacitacoes.mdl_tool_monitor_history: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_tool_monitor_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_monitor_history` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_tool_monitor_rules
CREATE TABLE IF NOT EXISTS `mdl_tool_monitor_rules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(1) NOT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `plugin` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `eventname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `template` longtext COLLATE utf8_unicode_ci NOT NULL,
  `templateformat` tinyint(1) NOT NULL,
  `frequency` smallint(4) NOT NULL,
  `timewindow` mediumint(5) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_toolmonirule_couuse_ix` (`courseid`,`userid`),
  KEY `mdl_toolmonirule_eve_ix` (`eventname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table to store rules';

-- Copiando dados para a tabela capacitacoes.mdl_tool_monitor_rules: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_tool_monitor_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_monitor_rules` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_tool_monitor_subscriptions
CREATE TABLE IF NOT EXISTS `mdl_tool_monitor_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `ruleid` bigint(10) NOT NULL,
  `cmid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `lastnotificationsent` bigint(10) NOT NULL DEFAULT '0',
  `inactivedate` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_toolmonisubs_couuse_ix` (`courseid`,`userid`),
  KEY `mdl_toolmonisubs_rul_ix` (`ruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table to store user subscriptions to various rules';

-- Copiando dados para a tabela capacitacoes.mdl_tool_monitor_subscriptions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_tool_monitor_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_monitor_subscriptions` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_tool_recyclebin_category
CREATE TABLE IF NOT EXISTS `mdl_tool_recyclebin_category` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `categoryid` bigint(10) NOT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_toolrecycate_tim_ix` (`timecreated`),
  KEY `mdl_toolrecycate_cat_ix` (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A list of items in the category recycle bin';

-- Copiando dados para a tabela capacitacoes.mdl_tool_recyclebin_category: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_tool_recyclebin_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_recyclebin_category` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_tool_recyclebin_course
CREATE TABLE IF NOT EXISTS `mdl_tool_recyclebin_course` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `section` bigint(10) NOT NULL,
  `module` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_toolrecycour_tim_ix` (`timecreated`),
  KEY `mdl_toolrecycour_cou_ix` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A list of items in the course recycle bin';

-- Copiando dados para a tabela capacitacoes.mdl_tool_recyclebin_course: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_tool_recyclebin_course` DISABLE KEYS */;
INSERT INTO `mdl_tool_recyclebin_course` (`id`, `courseid`, `section`, `module`, `name`, `timecreated`) VALUES
	(1, 3, 4, 9, 'Fórum de notícias', 1475527701);
/*!40000 ALTER TABLE `mdl_tool_recyclebin_course` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_upgrade_log
CREATE TABLE IF NOT EXISTS `mdl_upgrade_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `type` bigint(10) NOT NULL,
  `plugin` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `version` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `targetversion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `details` longtext COLLATE utf8_unicode_ci,
  `backtrace` longtext COLLATE utf8_unicode_ci,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_upgrlog_tim_ix` (`timemodified`),
  KEY `mdl_upgrlog_typtim_ix` (`type`,`timemodified`),
  KEY `mdl_upgrlog_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=1137 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Upgrade logging';

-- Copiando dados para a tabela capacitacoes.mdl_upgrade_log: ~1.132 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_upgrade_log` DISABLE KEYS */;
INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
	(1, 0, 'core', '2016052302.03', '2016052302.03', 'Upgrade savepoint reached', NULL, '', 0, 1475503331),
	(2, 0, 'core', '2016052302.03', '2016052302.03', 'Core installed', NULL, '', 0, 1475503395),
	(3, 0, 'antivirus_clamav', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503396),
	(4, 0, 'antivirus_clamav', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503396),
	(5, 0, 'antivirus_clamav', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503396),
	(6, 0, 'availability_completion', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503396),
	(7, 0, 'availability_completion', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503396),
	(8, 0, 'availability_completion', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503396),
	(9, 0, 'availability_date', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503397),
	(10, 0, 'availability_date', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503397),
	(11, 0, 'availability_date', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503397),
	(12, 0, 'availability_grade', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503397),
	(13, 0, 'availability_grade', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503397),
	(14, 0, 'availability_grade', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503397),
	(15, 0, 'availability_group', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503397),
	(16, 0, 'availability_group', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503398),
	(17, 0, 'availability_group', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503398),
	(18, 0, 'availability_grouping', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503398),
	(19, 0, 'availability_grouping', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503399),
	(20, 0, 'availability_grouping', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503399),
	(21, 0, 'availability_profile', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503399),
	(22, 0, 'availability_profile', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503399),
	(23, 0, 'availability_profile', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503399),
	(24, 0, 'qtype_calculated', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503400),
	(25, 0, 'qtype_calculated', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503400),
	(26, 0, 'qtype_calculated', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503401),
	(27, 0, 'qtype_calculatedmulti', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503401),
	(28, 0, 'qtype_calculatedmulti', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503401),
	(29, 0, 'qtype_calculatedmulti', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503401),
	(30, 0, 'qtype_calculatedsimple', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503401),
	(31, 0, 'qtype_calculatedsimple', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503401),
	(32, 0, 'qtype_calculatedsimple', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503401),
	(33, 0, 'qtype_ddimageortext', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503402),
	(34, 0, 'qtype_ddimageortext', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503402),
	(35, 0, 'qtype_ddimageortext', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503402),
	(36, 0, 'qtype_ddmarker', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503402),
	(37, 0, 'qtype_ddmarker', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503403),
	(38, 0, 'qtype_ddmarker', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503403),
	(39, 0, 'qtype_ddwtos', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503403),
	(40, 0, 'qtype_ddwtos', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503403),
	(41, 0, 'qtype_ddwtos', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503403),
	(42, 0, 'qtype_description', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503403),
	(43, 0, 'qtype_description', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503403),
	(44, 0, 'qtype_description', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503404),
	(45, 0, 'qtype_essay', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503404),
	(46, 0, 'qtype_essay', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503404),
	(47, 0, 'qtype_essay', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503404),
	(48, 0, 'qtype_gapselect', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503404),
	(49, 0, 'qtype_gapselect', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503404),
	(50, 0, 'qtype_gapselect', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503404),
	(51, 0, 'qtype_match', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503404),
	(52, 0, 'qtype_match', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503405),
	(53, 0, 'qtype_match', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503405),
	(54, 0, 'qtype_missingtype', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503405),
	(55, 0, 'qtype_missingtype', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503405),
	(56, 0, 'qtype_missingtype', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503405),
	(57, 0, 'qtype_multianswer', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503405),
	(58, 0, 'qtype_multianswer', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503406),
	(59, 0, 'qtype_multianswer', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503406),
	(60, 0, 'qtype_multichoice', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503406),
	(61, 0, 'qtype_multichoice', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503406),
	(62, 0, 'qtype_multichoice', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503406),
	(63, 0, 'qtype_numerical', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503406),
	(64, 0, 'qtype_numerical', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503406),
	(65, 0, 'qtype_numerical', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503407),
	(66, 0, 'qtype_random', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503407),
	(67, 0, 'qtype_random', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503407),
	(68, 0, 'qtype_random', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503407),
	(69, 0, 'qtype_randomsamatch', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503407),
	(70, 0, 'qtype_randomsamatch', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503407),
	(71, 0, 'qtype_randomsamatch', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503407),
	(72, 0, 'qtype_shortanswer', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503407),
	(73, 0, 'qtype_shortanswer', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503408),
	(74, 0, 'qtype_shortanswer', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503408),
	(75, 0, 'qtype_truefalse', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503408),
	(76, 0, 'qtype_truefalse', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503408),
	(77, 0, 'qtype_truefalse', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503408),
	(78, 0, 'mod_assign', NULL, '2016052301', 'Starting plugin installation', NULL, '', 0, 1475503408),
	(79, 0, 'mod_assign', '2016052301', '2016052301', 'Upgrade savepoint reached', NULL, '', 0, 1475503409),
	(80, 0, 'mod_assign', '2016052301', '2016052301', 'Plugin installed', NULL, '', 0, 1475503413),
	(81, 0, 'mod_assignment', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503413),
	(82, 0, 'mod_assignment', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503414),
	(83, 0, 'mod_assignment', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503415),
	(84, 0, 'mod_book', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503415),
	(85, 0, 'mod_book', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503416),
	(86, 0, 'mod_book', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503417),
	(87, 0, 'mod_chat', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503417),
	(88, 0, 'mod_chat', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503417),
	(89, 0, 'mod_chat', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503419),
	(90, 0, 'mod_choice', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503419),
	(91, 0, 'mod_choice', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503420),
	(92, 0, 'mod_choice', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503422),
	(93, 0, 'mod_data', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503422),
	(94, 0, 'mod_data', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503423),
	(95, 0, 'mod_data', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503426),
	(96, 0, 'mod_feedback', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503426),
	(97, 0, 'mod_feedback', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503427),
	(98, 0, 'mod_feedback', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503429),
	(99, 0, 'mod_folder', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503430),
	(100, 0, 'mod_folder', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503430),
	(101, 0, 'mod_folder', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503431),
	(102, 0, 'mod_forum', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503431),
	(103, 0, 'mod_forum', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503432),
	(104, 0, 'mod_forum', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503439),
	(105, 0, 'mod_glossary', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503439),
	(106, 0, 'mod_glossary', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503439),
	(107, 0, 'mod_glossary', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503444),
	(108, 0, 'mod_imscp', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503444),
	(109, 0, 'mod_imscp', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503444),
	(110, 0, 'mod_imscp', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503445),
	(111, 0, 'mod_label', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503445),
	(112, 0, 'mod_label', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503445),
	(113, 0, 'mod_label', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503446),
	(114, 0, 'mod_lesson', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503446),
	(115, 0, 'mod_lesson', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503446),
	(116, 0, 'mod_lesson', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503448),
	(117, 0, 'mod_lti', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503448),
	(118, 0, 'mod_lti', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503448),
	(119, 0, 'mod_lti', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503450),
	(120, 0, 'mod_page', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503450),
	(121, 0, 'mod_page', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503450),
	(122, 0, 'mod_page', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503451),
	(123, 0, 'mod_quiz', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503451),
	(124, 0, 'mod_quiz', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503452),
	(125, 0, 'mod_quiz', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503457),
	(126, 0, 'mod_resource', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503457),
	(127, 0, 'mod_resource', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503457),
	(128, 0, 'mod_resource', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503458),
	(129, 0, 'mod_scorm', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503458),
	(130, 0, 'mod_scorm', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503459),
	(131, 0, 'mod_scorm', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503460),
	(132, 0, 'mod_survey', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503461),
	(133, 0, 'mod_survey', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503461),
	(134, 0, 'mod_survey', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503466),
	(135, 0, 'mod_url', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503466),
	(136, 0, 'mod_url', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503466),
	(137, 0, 'mod_url', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503467),
	(138, 0, 'mod_wiki', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503467),
	(139, 0, 'mod_wiki', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503468),
	(140, 0, 'mod_wiki', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503471),
	(141, 0, 'mod_workshop', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503471),
	(142, 0, 'mod_workshop', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503472),
	(143, 0, 'mod_workshop', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503477),
	(144, 0, 'auth_cas', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503477),
	(145, 0, 'auth_cas', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503477),
	(146, 0, 'auth_cas', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503477),
	(147, 0, 'auth_db', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503477),
	(148, 0, 'auth_db', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503477),
	(149, 0, 'auth_db', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503477),
	(150, 0, 'auth_email', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503477),
	(151, 0, 'auth_email', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503477),
	(152, 0, 'auth_email', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503478),
	(153, 0, 'auth_fc', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503478),
	(154, 0, 'auth_fc', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503478),
	(155, 0, 'auth_fc', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503478),
	(156, 0, 'auth_imap', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503478),
	(157, 0, 'auth_imap', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503478),
	(158, 0, 'auth_imap', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503478),
	(159, 0, 'auth_ldap', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503478),
	(160, 0, 'auth_ldap', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503479),
	(161, 0, 'auth_ldap', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503479),
	(162, 0, 'auth_lti', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503479),
	(163, 0, 'auth_lti', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503479),
	(164, 0, 'auth_lti', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503479),
	(165, 0, 'auth_manual', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503479),
	(166, 0, 'auth_manual', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503479),
	(167, 0, 'auth_manual', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503480),
	(168, 0, 'auth_mnet', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503480),
	(169, 0, 'auth_mnet', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503480),
	(170, 0, 'auth_mnet', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503482),
	(171, 0, 'auth_nntp', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503482),
	(172, 0, 'auth_nntp', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503482),
	(173, 0, 'auth_nntp', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503482),
	(174, 0, 'auth_nologin', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503482),
	(175, 0, 'auth_nologin', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503482),
	(176, 0, 'auth_nologin', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503483),
	(177, 0, 'auth_none', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503483),
	(178, 0, 'auth_none', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503483),
	(179, 0, 'auth_none', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503483),
	(180, 0, 'auth_pam', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503483),
	(181, 0, 'auth_pam', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503483),
	(182, 0, 'auth_pam', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503483),
	(183, 0, 'auth_pop3', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503483),
	(184, 0, 'auth_pop3', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503484),
	(185, 0, 'auth_pop3', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503484),
	(186, 0, 'auth_radius', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503484),
	(187, 0, 'auth_radius', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503484),
	(188, 0, 'auth_radius', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503484),
	(189, 0, 'auth_shibboleth', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503484),
	(190, 0, 'auth_shibboleth', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503484),
	(191, 0, 'auth_shibboleth', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503485),
	(192, 0, 'auth_webservice', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503485),
	(193, 0, 'auth_webservice', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503485),
	(194, 0, 'auth_webservice', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503485),
	(195, 0, 'calendartype_gregorian', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503485),
	(196, 0, 'calendartype_gregorian', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503485),
	(197, 0, 'calendartype_gregorian', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503485),
	(198, 0, 'enrol_category', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503486),
	(199, 0, 'enrol_category', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503486),
	(200, 0, 'enrol_category', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503486),
	(201, 0, 'enrol_cohort', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503486),
	(202, 0, 'enrol_cohort', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503486),
	(203, 0, 'enrol_cohort', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503488),
	(204, 0, 'enrol_database', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503488),
	(205, 0, 'enrol_database', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503488),
	(206, 0, 'enrol_database', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503488),
	(207, 0, 'enrol_flatfile', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503488),
	(208, 0, 'enrol_flatfile', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503489),
	(209, 0, 'enrol_flatfile', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503489),
	(210, 0, 'enrol_guest', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503489),
	(211, 0, 'enrol_guest', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503490),
	(212, 0, 'enrol_guest', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503490),
	(213, 0, 'enrol_imsenterprise', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503490),
	(214, 0, 'enrol_imsenterprise', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503490),
	(215, 0, 'enrol_imsenterprise', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503491),
	(216, 0, 'enrol_ldap', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503491),
	(217, 0, 'enrol_ldap', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503491),
	(218, 0, 'enrol_ldap', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503491),
	(219, 0, 'enrol_lti', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503491),
	(220, 0, 'enrol_lti', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503491),
	(221, 0, 'enrol_lti', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503492),
	(222, 0, 'enrol_manual', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503492),
	(223, 0, 'enrol_manual', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503492),
	(224, 0, 'enrol_manual', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503493),
	(225, 0, 'enrol_meta', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503493),
	(226, 0, 'enrol_meta', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503493),
	(227, 0, 'enrol_meta', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503494),
	(228, 0, 'enrol_mnet', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503494),
	(229, 0, 'enrol_mnet', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503494),
	(230, 0, 'enrol_mnet', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503495),
	(231, 0, 'enrol_paypal', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503496),
	(232, 0, 'enrol_paypal', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503496),
	(233, 0, 'enrol_paypal', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503496),
	(234, 0, 'enrol_self', NULL, '2016052301', 'Starting plugin installation', NULL, '', 0, 1475503496),
	(235, 0, 'enrol_self', '2016052301', '2016052301', 'Upgrade savepoint reached', NULL, '', 0, 1475503496),
	(236, 0, 'enrol_self', '2016052301', '2016052301', 'Plugin installed', NULL, '', 0, 1475503497),
	(237, 0, 'message_airnotifier', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503497),
	(238, 0, 'message_airnotifier', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503497),
	(239, 0, 'message_airnotifier', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503499),
	(240, 0, 'message_email', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503499),
	(241, 0, 'message_email', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503499),
	(242, 0, 'message_email', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503501),
	(243, 0, 'message_jabber', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503501),
	(244, 0, 'message_jabber', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503501),
	(245, 0, 'message_jabber', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503502),
	(246, 0, 'message_popup', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503502),
	(247, 0, 'message_popup', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503502),
	(248, 0, 'message_popup', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503503),
	(249, 0, 'block_activity_modules', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503503),
	(250, 0, 'block_activity_modules', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503503),
	(251, 0, 'block_activity_modules', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503503),
	(252, 0, 'block_activity_results', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503503),
	(253, 0, 'block_activity_results', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503503),
	(254, 0, 'block_activity_results', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503504),
	(255, 0, 'block_admin_bookmarks', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503504),
	(256, 0, 'block_admin_bookmarks', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503504),
	(257, 0, 'block_admin_bookmarks', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503505),
	(258, 0, 'block_badges', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503505),
	(259, 0, 'block_badges', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503505),
	(260, 0, 'block_badges', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503505),
	(261, 0, 'block_blog_menu', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503505),
	(262, 0, 'block_blog_menu', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503505),
	(263, 0, 'block_blog_menu', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503506),
	(264, 0, 'block_blog_recent', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503506),
	(265, 0, 'block_blog_recent', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503506),
	(266, 0, 'block_blog_recent', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503506),
	(267, 0, 'block_blog_tags', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503507),
	(268, 0, 'block_blog_tags', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503507),
	(269, 0, 'block_blog_tags', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503507),
	(270, 0, 'block_calendar_month', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503507),
	(271, 0, 'block_calendar_month', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503507),
	(272, 0, 'block_calendar_month', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503508),
	(273, 0, 'block_calendar_upcoming', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503508),
	(274, 0, 'block_calendar_upcoming', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503508),
	(275, 0, 'block_calendar_upcoming', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503508),
	(276, 0, 'block_comments', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503508),
	(277, 0, 'block_comments', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503509),
	(278, 0, 'block_comments', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503510),
	(279, 0, 'block_community', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503510),
	(280, 0, 'block_community', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503510),
	(281, 0, 'block_community', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503511),
	(282, 0, 'block_completionstatus', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503511),
	(283, 0, 'block_completionstatus', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503511),
	(284, 0, 'block_completionstatus', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503511),
	(285, 0, 'block_course_list', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503511),
	(286, 0, 'block_course_list', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503512),
	(287, 0, 'block_course_list', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503512),
	(288, 0, 'block_course_overview', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503512),
	(289, 0, 'block_course_overview', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503512),
	(290, 0, 'block_course_overview', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503512),
	(291, 0, 'block_course_summary', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503512),
	(292, 0, 'block_course_summary', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503513),
	(293, 0, 'block_course_summary', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503513),
	(294, 0, 'block_feedback', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503513),
	(295, 0, 'block_feedback', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503513),
	(296, 0, 'block_feedback', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503514),
	(297, 0, 'block_globalsearch', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503514),
	(298, 0, 'block_globalsearch', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503514),
	(299, 0, 'block_globalsearch', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503514),
	(300, 0, 'block_glossary_random', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503515),
	(301, 0, 'block_glossary_random', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503515),
	(302, 0, 'block_glossary_random', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503515),
	(303, 0, 'block_html', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503515),
	(304, 0, 'block_html', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503515),
	(305, 0, 'block_html', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503516),
	(306, 0, 'block_login', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503516),
	(307, 0, 'block_login', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503516),
	(308, 0, 'block_login', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503516),
	(309, 0, 'block_lp', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503516),
	(310, 0, 'block_lp', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503517),
	(311, 0, 'block_lp', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503517),
	(312, 0, 'block_mentees', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503517),
	(313, 0, 'block_mentees', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503517),
	(314, 0, 'block_mentees', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503518),
	(315, 0, 'block_messages', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503518),
	(316, 0, 'block_messages', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503518),
	(317, 0, 'block_messages', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503518),
	(318, 0, 'block_mnet_hosts', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503518),
	(319, 0, 'block_mnet_hosts', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503518),
	(320, 0, 'block_mnet_hosts', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503519),
	(321, 0, 'block_myprofile', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503519),
	(322, 0, 'block_myprofile', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503519),
	(323, 0, 'block_myprofile', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503519),
	(324, 0, 'block_navigation', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503520),
	(325, 0, 'block_navigation', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503520),
	(326, 0, 'block_navigation', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503521),
	(327, 0, 'block_news_items', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503521),
	(328, 0, 'block_news_items', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503521),
	(329, 0, 'block_news_items', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503522),
	(330, 0, 'block_online_users', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503522),
	(331, 0, 'block_online_users', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503522),
	(332, 0, 'block_online_users', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503523),
	(333, 0, 'block_participants', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503523),
	(334, 0, 'block_participants', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503523),
	(335, 0, 'block_participants', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503524),
	(336, 0, 'block_private_files', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503524),
	(337, 0, 'block_private_files', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503524),
	(338, 0, 'block_private_files', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503524),
	(339, 0, 'block_quiz_results', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503525),
	(340, 0, 'block_quiz_results', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503525),
	(341, 0, 'block_quiz_results', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503525),
	(342, 0, 'block_recent_activity', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503525),
	(343, 0, 'block_recent_activity', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503525),
	(344, 0, 'block_recent_activity', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503526),
	(345, 0, 'block_rss_client', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503526),
	(346, 0, 'block_rss_client', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503526),
	(347, 0, 'block_rss_client', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503527),
	(348, 0, 'block_search_forums', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503527),
	(349, 0, 'block_search_forums', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503527),
	(350, 0, 'block_search_forums', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503528),
	(351, 0, 'block_section_links', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503528),
	(352, 0, 'block_section_links', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503528),
	(353, 0, 'block_section_links', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503528),
	(354, 0, 'block_selfcompletion', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503528),
	(355, 0, 'block_selfcompletion', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503528),
	(356, 0, 'block_selfcompletion', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503529),
	(357, 0, 'block_settings', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503529),
	(358, 0, 'block_settings', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503529),
	(359, 0, 'block_settings', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503530),
	(360, 0, 'block_site_main_menu', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503530),
	(361, 0, 'block_site_main_menu', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503530),
	(362, 0, 'block_site_main_menu', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503530),
	(363, 0, 'block_social_activities', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503530),
	(364, 0, 'block_social_activities', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503530),
	(365, 0, 'block_social_activities', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503531),
	(366, 0, 'block_tag_flickr', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503531),
	(367, 0, 'block_tag_flickr', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503531),
	(368, 0, 'block_tag_flickr', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503532),
	(369, 0, 'block_tag_youtube', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503532),
	(370, 0, 'block_tag_youtube', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503532),
	(371, 0, 'block_tag_youtube', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503533),
	(372, 0, 'block_tags', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503533),
	(373, 0, 'block_tags', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503533),
	(374, 0, 'block_tags', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503533),
	(375, 0, 'filter_activitynames', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503535),
	(376, 0, 'filter_activitynames', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503535),
	(377, 0, 'filter_activitynames', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503536),
	(378, 0, 'filter_algebra', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503536),
	(379, 0, 'filter_algebra', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503536),
	(380, 0, 'filter_algebra', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503536),
	(381, 0, 'filter_censor', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503536),
	(382, 0, 'filter_censor', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503536),
	(383, 0, 'filter_censor', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503536),
	(384, 0, 'filter_data', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503536),
	(385, 0, 'filter_data', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503537),
	(386, 0, 'filter_data', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503537),
	(387, 0, 'filter_emailprotect', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503537),
	(388, 0, 'filter_emailprotect', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503537),
	(389, 0, 'filter_emailprotect', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503537),
	(390, 0, 'filter_emoticon', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503537),
	(391, 0, 'filter_emoticon', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503537),
	(392, 0, 'filter_emoticon', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503538),
	(393, 0, 'filter_glossary', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503538),
	(394, 0, 'filter_glossary', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503538),
	(395, 0, 'filter_glossary', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503538),
	(396, 0, 'filter_mathjaxloader', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503538),
	(397, 0, 'filter_mathjaxloader', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503538),
	(398, 0, 'filter_mathjaxloader', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503539),
	(399, 0, 'filter_mediaplugin', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503539),
	(400, 0, 'filter_mediaplugin', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503539),
	(401, 0, 'filter_mediaplugin', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503539),
	(402, 0, 'filter_multilang', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503540),
	(403, 0, 'filter_multilang', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503540),
	(404, 0, 'filter_multilang', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503540),
	(405, 0, 'filter_tex', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503540),
	(406, 0, 'filter_tex', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503541),
	(407, 0, 'filter_tex', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503543),
	(408, 0, 'filter_tidy', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503543),
	(409, 0, 'filter_tidy', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503544),
	(410, 0, 'filter_tidy', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503544),
	(411, 0, 'filter_urltolink', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503544),
	(412, 0, 'filter_urltolink', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503545),
	(413, 0, 'filter_urltolink', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503545),
	(414, 0, 'editor_atto', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503545),
	(415, 0, 'editor_atto', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503545),
	(416, 0, 'editor_atto', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503546),
	(417, 0, 'editor_textarea', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503546),
	(418, 0, 'editor_textarea', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503546),
	(419, 0, 'editor_textarea', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503546),
	(420, 0, 'editor_tinymce', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503546),
	(421, 0, 'editor_tinymce', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503547),
	(422, 0, 'editor_tinymce', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503547),
	(423, 0, 'format_singleactivity', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503547),
	(424, 0, 'format_singleactivity', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503547),
	(425, 0, 'format_singleactivity', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503548),
	(426, 0, 'format_social', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503548),
	(427, 0, 'format_social', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503548),
	(428, 0, 'format_social', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503549),
	(429, 0, 'format_topics', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503549),
	(430, 0, 'format_topics', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503549),
	(431, 0, 'format_topics', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503549),
	(432, 0, 'format_weeks', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503549),
	(433, 0, 'format_weeks', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503549),
	(434, 0, 'format_weeks', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503549),
	(435, 0, 'dataformat_csv', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503549),
	(436, 0, 'dataformat_csv', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503549),
	(437, 0, 'dataformat_csv', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503550),
	(438, 0, 'dataformat_excel', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503550),
	(439, 0, 'dataformat_excel', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503550),
	(440, 0, 'dataformat_excel', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503550),
	(441, 0, 'dataformat_html', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503550),
	(442, 0, 'dataformat_html', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503550),
	(443, 0, 'dataformat_html', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503550),
	(444, 0, 'dataformat_json', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503551),
	(445, 0, 'dataformat_json', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503551),
	(446, 0, 'dataformat_json', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503551),
	(447, 0, 'dataformat_ods', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503551),
	(448, 0, 'dataformat_ods', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503551),
	(449, 0, 'dataformat_ods', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503551),
	(450, 0, 'profilefield_checkbox', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503551),
	(451, 0, 'profilefield_checkbox', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503551),
	(452, 0, 'profilefield_checkbox', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503551),
	(453, 0, 'profilefield_datetime', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503552),
	(454, 0, 'profilefield_datetime', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503552),
	(455, 0, 'profilefield_datetime', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503552),
	(456, 0, 'profilefield_menu', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503552),
	(457, 0, 'profilefield_menu', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503552),
	(458, 0, 'profilefield_menu', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503552),
	(459, 0, 'profilefield_text', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503552),
	(460, 0, 'profilefield_text', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503552),
	(461, 0, 'profilefield_text', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503552),
	(462, 0, 'profilefield_textarea', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503553),
	(463, 0, 'profilefield_textarea', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503553),
	(464, 0, 'profilefield_textarea', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503553),
	(465, 0, 'report_backups', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503553),
	(466, 0, 'report_backups', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503553),
	(467, 0, 'report_backups', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503553),
	(468, 0, 'report_competency', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503553),
	(469, 0, 'report_competency', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503554),
	(470, 0, 'report_competency', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503554),
	(471, 0, 'report_completion', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503554),
	(472, 0, 'report_completion', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503554),
	(473, 0, 'report_completion', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503555),
	(474, 0, 'report_configlog', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503555),
	(475, 0, 'report_configlog', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503555),
	(476, 0, 'report_configlog', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503555),
	(477, 0, 'report_courseoverview', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503555),
	(478, 0, 'report_courseoverview', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503555),
	(479, 0, 'report_courseoverview', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503556),
	(480, 0, 'report_eventlist', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503556),
	(481, 0, 'report_eventlist', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503556),
	(482, 0, 'report_eventlist', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503556),
	(483, 0, 'report_log', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503556),
	(484, 0, 'report_log', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503556),
	(485, 0, 'report_log', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503557),
	(486, 0, 'report_loglive', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503557),
	(487, 0, 'report_loglive', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503557),
	(488, 0, 'report_loglive', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503557),
	(489, 0, 'report_outline', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503557),
	(490, 0, 'report_outline', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503558),
	(491, 0, 'report_outline', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503558),
	(492, 0, 'report_participation', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503558),
	(493, 0, 'report_participation', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503558),
	(494, 0, 'report_participation', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503559),
	(495, 0, 'report_performance', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503559),
	(496, 0, 'report_performance', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503559),
	(497, 0, 'report_performance', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503559),
	(498, 0, 'report_progress', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503559),
	(499, 0, 'report_progress', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503559),
	(500, 0, 'report_progress', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503560),
	(501, 0, 'report_questioninstances', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503560),
	(502, 0, 'report_questioninstances', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503560),
	(503, 0, 'report_questioninstances', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503560),
	(504, 0, 'report_search', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503560),
	(505, 0, 'report_search', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503560),
	(506, 0, 'report_search', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503560),
	(507, 0, 'report_security', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503560),
	(508, 0, 'report_security', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503560),
	(509, 0, 'report_security', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503561),
	(510, 0, 'report_stats', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503561),
	(511, 0, 'report_stats', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503561),
	(512, 0, 'report_stats', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503561),
	(513, 0, 'report_usersessions', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503561),
	(514, 0, 'report_usersessions', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503561),
	(515, 0, 'report_usersessions', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503562),
	(516, 0, 'gradeexport_ods', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503562),
	(517, 0, 'gradeexport_ods', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503562),
	(518, 0, 'gradeexport_ods', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503563),
	(519, 0, 'gradeexport_txt', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503563),
	(520, 0, 'gradeexport_txt', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503563),
	(521, 0, 'gradeexport_txt', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503563),
	(522, 0, 'gradeexport_xls', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503563),
	(523, 0, 'gradeexport_xls', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503563),
	(524, 0, 'gradeexport_xls', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503564),
	(525, 0, 'gradeexport_xml', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503564),
	(526, 0, 'gradeexport_xml', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503564),
	(527, 0, 'gradeexport_xml', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503564),
	(528, 0, 'gradeimport_csv', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503565),
	(529, 0, 'gradeimport_csv', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503565),
	(530, 0, 'gradeimport_csv', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503566),
	(531, 0, 'gradeimport_direct', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503566),
	(532, 0, 'gradeimport_direct', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503566),
	(533, 0, 'gradeimport_direct', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503566),
	(534, 0, 'gradeimport_xml', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503566),
	(535, 0, 'gradeimport_xml', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503566),
	(536, 0, 'gradeimport_xml', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503567),
	(537, 0, 'gradereport_grader', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503567),
	(538, 0, 'gradereport_grader', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503567),
	(539, 0, 'gradereport_grader', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503567),
	(540, 0, 'gradereport_history', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503567),
	(541, 0, 'gradereport_history', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503567),
	(542, 0, 'gradereport_history', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503568),
	(543, 0, 'gradereport_outcomes', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503568),
	(544, 0, 'gradereport_outcomes', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503568),
	(545, 0, 'gradereport_outcomes', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503568),
	(546, 0, 'gradereport_overview', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503568),
	(547, 0, 'gradereport_overview', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503568),
	(548, 0, 'gradereport_overview', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503569),
	(549, 0, 'gradereport_singleview', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503569),
	(550, 0, 'gradereport_singleview', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503569),
	(551, 0, 'gradereport_singleview', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503569),
	(552, 0, 'gradereport_user', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503569),
	(553, 0, 'gradereport_user', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503569),
	(554, 0, 'gradereport_user', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503570),
	(555, 0, 'gradingform_guide', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503570),
	(556, 0, 'gradingform_guide', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503570),
	(557, 0, 'gradingform_guide', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503571),
	(558, 0, 'gradingform_rubric', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503571),
	(559, 0, 'gradingform_rubric', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503571),
	(560, 0, 'gradingform_rubric', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503571),
	(561, 0, 'mnetservice_enrol', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503571),
	(562, 0, 'mnetservice_enrol', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503571),
	(563, 0, 'mnetservice_enrol', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503572),
	(564, 0, 'webservice_rest', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503572),
	(565, 0, 'webservice_rest', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503572),
	(566, 0, 'webservice_rest', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503572),
	(567, 0, 'webservice_soap', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503572),
	(568, 0, 'webservice_soap', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503572),
	(569, 0, 'webservice_soap', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503572),
	(570, 0, 'webservice_xmlrpc', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503572),
	(571, 0, 'webservice_xmlrpc', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503573),
	(572, 0, 'webservice_xmlrpc', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503573),
	(573, 0, 'repository_alfresco', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503573),
	(574, 0, 'repository_alfresco', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503573),
	(575, 0, 'repository_alfresco', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503574),
	(576, 0, 'repository_areafiles', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503574),
	(577, 0, 'repository_areafiles', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503574),
	(578, 0, 'repository_areafiles', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503576),
	(579, 0, 'repository_boxnet', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503576),
	(580, 0, 'repository_boxnet', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503576),
	(581, 0, 'repository_boxnet', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503577),
	(582, 0, 'repository_coursefiles', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503577),
	(583, 0, 'repository_coursefiles', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503577),
	(584, 0, 'repository_coursefiles', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503577),
	(585, 0, 'repository_dropbox', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503577),
	(586, 0, 'repository_dropbox', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503577),
	(587, 0, 'repository_dropbox', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503578),
	(588, 0, 'repository_equella', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503578),
	(589, 0, 'repository_equella', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503578),
	(590, 0, 'repository_equella', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503578),
	(591, 0, 'repository_filesystem', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503578),
	(592, 0, 'repository_filesystem', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503578),
	(593, 0, 'repository_filesystem', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503579),
	(594, 0, 'repository_flickr', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503579),
	(595, 0, 'repository_flickr', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503579),
	(596, 0, 'repository_flickr', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503579),
	(597, 0, 'repository_flickr_public', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503579),
	(598, 0, 'repository_flickr_public', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503579),
	(599, 0, 'repository_flickr_public', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503580),
	(600, 0, 'repository_googledocs', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503580),
	(601, 0, 'repository_googledocs', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503580),
	(602, 0, 'repository_googledocs', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503580),
	(603, 0, 'repository_local', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503580),
	(604, 0, 'repository_local', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503580),
	(605, 0, 'repository_local', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503581),
	(606, 0, 'repository_merlot', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503581),
	(607, 0, 'repository_merlot', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503581),
	(608, 0, 'repository_merlot', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503581),
	(609, 0, 'repository_picasa', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503582),
	(610, 0, 'repository_picasa', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503582),
	(611, 0, 'repository_picasa', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503582),
	(612, 0, 'repository_recent', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503582),
	(613, 0, 'repository_recent', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503582),
	(614, 0, 'repository_recent', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503583),
	(615, 0, 'repository_s3', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503583),
	(616, 0, 'repository_s3', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503583),
	(617, 0, 'repository_s3', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503583),
	(618, 0, 'repository_skydrive', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503583),
	(619, 0, 'repository_skydrive', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503583),
	(620, 0, 'repository_skydrive', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503584),
	(621, 0, 'repository_upload', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503584),
	(622, 0, 'repository_upload', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503584),
	(623, 0, 'repository_upload', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503584),
	(624, 0, 'repository_url', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503584),
	(625, 0, 'repository_url', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503584),
	(626, 0, 'repository_url', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503585),
	(627, 0, 'repository_user', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503585),
	(628, 0, 'repository_user', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503585),
	(629, 0, 'repository_user', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503586),
	(630, 0, 'repository_webdav', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503586),
	(631, 0, 'repository_webdav', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503586),
	(632, 0, 'repository_webdav', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503586),
	(633, 0, 'repository_wikimedia', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503587),
	(634, 0, 'repository_wikimedia', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503587),
	(635, 0, 'repository_wikimedia', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503588),
	(636, 0, 'repository_youtube', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503588),
	(637, 0, 'repository_youtube', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503588),
	(638, 0, 'repository_youtube', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503589),
	(639, 0, 'portfolio_boxnet', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503589),
	(640, 0, 'portfolio_boxnet', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503589),
	(641, 0, 'portfolio_boxnet', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503589),
	(642, 0, 'portfolio_download', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503589),
	(643, 0, 'portfolio_download', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503589),
	(644, 0, 'portfolio_download', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503590),
	(645, 0, 'portfolio_flickr', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503590),
	(646, 0, 'portfolio_flickr', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503590),
	(647, 0, 'portfolio_flickr', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503590),
	(648, 0, 'portfolio_googledocs', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503590),
	(649, 0, 'portfolio_googledocs', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503590),
	(650, 0, 'portfolio_googledocs', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503590),
	(651, 0, 'portfolio_mahara', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503590),
	(652, 0, 'portfolio_mahara', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503591),
	(653, 0, 'portfolio_mahara', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503591),
	(654, 0, 'portfolio_picasa', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503591),
	(655, 0, 'portfolio_picasa', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503591),
	(656, 0, 'portfolio_picasa', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503591),
	(657, 0, 'search_solr', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503591),
	(658, 0, 'search_solr', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503592),
	(659, 0, 'search_solr', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503592),
	(660, 0, 'qbehaviour_adaptive', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503592),
	(661, 0, 'qbehaviour_adaptive', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503592),
	(662, 0, 'qbehaviour_adaptive', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503592),
	(663, 0, 'qbehaviour_adaptivenopenalty', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503592),
	(664, 0, 'qbehaviour_adaptivenopenalty', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503592),
	(665, 0, 'qbehaviour_adaptivenopenalty', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503593),
	(666, 0, 'qbehaviour_deferredcbm', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503593),
	(667, 0, 'qbehaviour_deferredcbm', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503593),
	(668, 0, 'qbehaviour_deferredcbm', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503593),
	(669, 0, 'qbehaviour_deferredfeedback', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503593),
	(670, 0, 'qbehaviour_deferredfeedback', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503593),
	(671, 0, 'qbehaviour_deferredfeedback', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503593),
	(672, 0, 'qbehaviour_immediatecbm', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503593),
	(673, 0, 'qbehaviour_immediatecbm', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503593),
	(674, 0, 'qbehaviour_immediatecbm', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503594),
	(675, 0, 'qbehaviour_immediatefeedback', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503594),
	(676, 0, 'qbehaviour_immediatefeedback', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503594),
	(677, 0, 'qbehaviour_immediatefeedback', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503594),
	(678, 0, 'qbehaviour_informationitem', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503594),
	(679, 0, 'qbehaviour_informationitem', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503594),
	(680, 0, 'qbehaviour_informationitem', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503594),
	(681, 0, 'qbehaviour_interactive', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503594),
	(682, 0, 'qbehaviour_interactive', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503594),
	(683, 0, 'qbehaviour_interactive', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503595),
	(684, 0, 'qbehaviour_interactivecountback', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503595),
	(685, 0, 'qbehaviour_interactivecountback', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503595),
	(686, 0, 'qbehaviour_interactivecountback', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503595),
	(687, 0, 'qbehaviour_manualgraded', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503595),
	(688, 0, 'qbehaviour_manualgraded', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503595),
	(689, 0, 'qbehaviour_manualgraded', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503595),
	(690, 0, 'qbehaviour_missing', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503595),
	(691, 0, 'qbehaviour_missing', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503596),
	(692, 0, 'qbehaviour_missing', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503596),
	(693, 0, 'qformat_aiken', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503596),
	(694, 0, 'qformat_aiken', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503596),
	(695, 0, 'qformat_aiken', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503596),
	(696, 0, 'qformat_blackboard_six', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503596),
	(697, 0, 'qformat_blackboard_six', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503596),
	(698, 0, 'qformat_blackboard_six', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503597),
	(699, 0, 'qformat_examview', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503597),
	(700, 0, 'qformat_examview', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503597),
	(701, 0, 'qformat_examview', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503597),
	(702, 0, 'qformat_gift', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503597),
	(703, 0, 'qformat_gift', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503597),
	(704, 0, 'qformat_gift', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503597),
	(705, 0, 'qformat_missingword', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503597),
	(706, 0, 'qformat_missingword', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503597),
	(707, 0, 'qformat_missingword', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503598),
	(708, 0, 'qformat_multianswer', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503598),
	(709, 0, 'qformat_multianswer', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503599),
	(710, 0, 'qformat_multianswer', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503599),
	(711, 0, 'qformat_webct', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503599),
	(712, 0, 'qformat_webct', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503599),
	(713, 0, 'qformat_webct', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503599),
	(714, 0, 'qformat_xhtml', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503599),
	(715, 0, 'qformat_xhtml', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503599),
	(716, 0, 'qformat_xhtml', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503600),
	(717, 0, 'qformat_xml', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503600),
	(718, 0, 'qformat_xml', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503600),
	(719, 0, 'qformat_xml', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503600),
	(720, 0, 'tool_assignmentupgrade', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503600),
	(721, 0, 'tool_assignmentupgrade', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503600),
	(722, 0, 'tool_assignmentupgrade', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503601),
	(723, 0, 'tool_availabilityconditions', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503601),
	(724, 0, 'tool_availabilityconditions', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503601),
	(725, 0, 'tool_availabilityconditions', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503601),
	(726, 0, 'tool_behat', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503601),
	(727, 0, 'tool_behat', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503601),
	(728, 0, 'tool_behat', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503601),
	(729, 0, 'tool_capability', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503601),
	(730, 0, 'tool_capability', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503601),
	(731, 0, 'tool_capability', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503602),
	(732, 0, 'tool_cohortroles', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503602),
	(733, 0, 'tool_cohortroles', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503602),
	(734, 0, 'tool_cohortroles', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503602),
	(735, 0, 'tool_customlang', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503602),
	(736, 0, 'tool_customlang', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503602),
	(737, 0, 'tool_customlang', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503603),
	(738, 0, 'tool_dbtransfer', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503603),
	(739, 0, 'tool_dbtransfer', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503603),
	(740, 0, 'tool_dbtransfer', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503603),
	(741, 0, 'tool_filetypes', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503603),
	(742, 0, 'tool_filetypes', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503603),
	(743, 0, 'tool_filetypes', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503604),
	(744, 0, 'tool_generator', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503604),
	(745, 0, 'tool_generator', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503604),
	(746, 0, 'tool_generator', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503604),
	(747, 0, 'tool_health', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503604),
	(748, 0, 'tool_health', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503604),
	(749, 0, 'tool_health', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503604),
	(750, 0, 'tool_innodb', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503604),
	(751, 0, 'tool_innodb', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503604),
	(752, 0, 'tool_innodb', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503605),
	(753, 0, 'tool_installaddon', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503605),
	(754, 0, 'tool_installaddon', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503605),
	(755, 0, 'tool_installaddon', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503605),
	(756, 0, 'tool_langimport', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503605),
	(757, 0, 'tool_langimport', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503605),
	(758, 0, 'tool_langimport', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503606),
	(759, 0, 'tool_log', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503606),
	(760, 0, 'tool_log', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503606),
	(761, 0, 'tool_log', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503606),
	(762, 0, 'tool_lp', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503606),
	(763, 0, 'tool_lp', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503606),
	(764, 0, 'tool_lp', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503607),
	(765, 0, 'tool_lpmigrate', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503607),
	(766, 0, 'tool_lpmigrate', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503607),
	(767, 0, 'tool_lpmigrate', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503608),
	(768, 0, 'tool_messageinbound', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503608),
	(769, 0, 'tool_messageinbound', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503608),
	(770, 0, 'tool_messageinbound', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503609),
	(771, 0, 'tool_mobile', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503609),
	(772, 0, 'tool_mobile', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503609),
	(773, 0, 'tool_mobile', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503610),
	(774, 0, 'tool_monitor', NULL, '2016052305', 'Starting plugin installation', NULL, '', 0, 1475503610),
	(775, 0, 'tool_monitor', '2016052305', '2016052305', 'Upgrade savepoint reached', NULL, '', 0, 1475503610),
	(776, 0, 'tool_monitor', '2016052305', '2016052305', 'Plugin installed', NULL, '', 0, 1475503611),
	(777, 0, 'tool_multilangupgrade', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503611),
	(778, 0, 'tool_multilangupgrade', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503612),
	(779, 0, 'tool_multilangupgrade', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503612),
	(780, 0, 'tool_phpunit', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503612),
	(781, 0, 'tool_phpunit', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503612),
	(782, 0, 'tool_phpunit', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503612),
	(783, 0, 'tool_profiling', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503612),
	(784, 0, 'tool_profiling', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503612),
	(785, 0, 'tool_profiling', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503612),
	(786, 0, 'tool_recyclebin', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503612),
	(787, 0, 'tool_recyclebin', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503613),
	(788, 0, 'tool_recyclebin', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503614),
	(789, 0, 'tool_replace', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503614),
	(790, 0, 'tool_replace', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503614),
	(791, 0, 'tool_replace', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503614),
	(792, 0, 'tool_spamcleaner', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503614),
	(793, 0, 'tool_spamcleaner', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503614),
	(794, 0, 'tool_spamcleaner', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503615),
	(795, 0, 'tool_task', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503615),
	(796, 0, 'tool_task', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503615),
	(797, 0, 'tool_task', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503615),
	(798, 0, 'tool_templatelibrary', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503615),
	(799, 0, 'tool_templatelibrary', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503615),
	(800, 0, 'tool_templatelibrary', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503616),
	(801, 0, 'tool_unsuproles', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503616),
	(802, 0, 'tool_unsuproles', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503616),
	(803, 0, 'tool_unsuproles', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503616),
	(804, 0, 'tool_uploadcourse', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503616),
	(805, 0, 'tool_uploadcourse', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503616),
	(806, 0, 'tool_uploadcourse', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503616),
	(807, 0, 'tool_uploaduser', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503617),
	(808, 0, 'tool_uploaduser', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503617),
	(809, 0, 'tool_uploaduser', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503617),
	(810, 0, 'tool_xmldb', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503617),
	(811, 0, 'tool_xmldb', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503617),
	(812, 0, 'tool_xmldb', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503617),
	(813, 0, 'cachestore_file', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503617),
	(814, 0, 'cachestore_file', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503617),
	(815, 0, 'cachestore_file', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503618),
	(816, 0, 'cachestore_memcache', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503618),
	(817, 0, 'cachestore_memcache', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503618),
	(818, 0, 'cachestore_memcache', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503618),
	(819, 0, 'cachestore_memcached', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503618),
	(820, 0, 'cachestore_memcached', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503618),
	(821, 0, 'cachestore_memcached', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503618),
	(822, 0, 'cachestore_mongodb', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503619),
	(823, 0, 'cachestore_mongodb', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503619),
	(824, 0, 'cachestore_mongodb', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503619),
	(825, 0, 'cachestore_session', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503619),
	(826, 0, 'cachestore_session', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503619),
	(827, 0, 'cachestore_session', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503619),
	(828, 0, 'cachestore_static', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503619),
	(829, 0, 'cachestore_static', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503619),
	(830, 0, 'cachestore_static', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503620),
	(831, 0, 'cachelock_file', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503620),
	(832, 0, 'cachelock_file', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503620),
	(833, 0, 'cachelock_file', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503621),
	(834, 0, 'theme_base', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503621),
	(835, 0, 'theme_base', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503621),
	(836, 0, 'theme_base', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503621),
	(837, 0, 'theme_bootstrapbase', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503621),
	(838, 0, 'theme_bootstrapbase', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503621),
	(839, 0, 'theme_bootstrapbase', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503621),
	(840, 0, 'theme_canvas', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503621),
	(841, 0, 'theme_canvas', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503621),
	(842, 0, 'theme_canvas', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503622),
	(843, 0, 'theme_clean', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503622),
	(844, 0, 'theme_clean', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503622),
	(845, 0, 'theme_clean', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503622),
	(846, 0, 'theme_more', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503622),
	(847, 0, 'theme_more', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503622),
	(848, 0, 'theme_more', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503623),
	(849, 0, 'assignsubmission_comments', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503623),
	(850, 0, 'assignsubmission_comments', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503623),
	(851, 0, 'assignsubmission_comments', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503623),
	(852, 0, 'assignsubmission_file', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503623),
	(853, 0, 'assignsubmission_file', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503623),
	(854, 0, 'assignsubmission_file', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503624),
	(855, 0, 'assignsubmission_onlinetext', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503624),
	(856, 0, 'assignsubmission_onlinetext', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503624),
	(857, 0, 'assignsubmission_onlinetext', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503624),
	(858, 0, 'assignfeedback_comments', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503624),
	(859, 0, 'assignfeedback_comments', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503625),
	(860, 0, 'assignfeedback_comments', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503625),
	(861, 0, 'assignfeedback_editpdf', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503625),
	(862, 0, 'assignfeedback_editpdf', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503625),
	(863, 0, 'assignfeedback_editpdf', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503626),
	(864, 0, 'assignfeedback_file', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503626),
	(865, 0, 'assignfeedback_file', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503626),
	(866, 0, 'assignfeedback_file', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503627),
	(867, 0, 'assignfeedback_offline', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503627),
	(868, 0, 'assignfeedback_offline', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503627),
	(869, 0, 'assignfeedback_offline', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503627),
	(870, 0, 'assignment_offline', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503627),
	(871, 0, 'assignment_offline', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503627),
	(872, 0, 'assignment_offline', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503628),
	(873, 0, 'assignment_online', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503628),
	(874, 0, 'assignment_online', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503628),
	(875, 0, 'assignment_online', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503628),
	(876, 0, 'assignment_upload', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503628),
	(877, 0, 'assignment_upload', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503628),
	(878, 0, 'assignment_upload', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503628),
	(879, 0, 'assignment_uploadsingle', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503628),
	(880, 0, 'assignment_uploadsingle', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503629),
	(881, 0, 'assignment_uploadsingle', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503629),
	(882, 0, 'booktool_exportimscp', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503629),
	(883, 0, 'booktool_exportimscp', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503629),
	(884, 0, 'booktool_exportimscp', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503629),
	(885, 0, 'booktool_importhtml', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503629),
	(886, 0, 'booktool_importhtml', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503629),
	(887, 0, 'booktool_importhtml', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503630),
	(888, 0, 'booktool_print', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503630),
	(889, 0, 'booktool_print', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503630),
	(890, 0, 'booktool_print', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503630),
	(891, 0, 'datafield_checkbox', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503630),
	(892, 0, 'datafield_checkbox', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503630),
	(893, 0, 'datafield_checkbox', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503631),
	(894, 0, 'datafield_date', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503631),
	(895, 0, 'datafield_date', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503631),
	(896, 0, 'datafield_date', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503631),
	(897, 0, 'datafield_file', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503632),
	(898, 0, 'datafield_file', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503632),
	(899, 0, 'datafield_file', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503632),
	(900, 0, 'datafield_latlong', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503632),
	(901, 0, 'datafield_latlong', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503632),
	(902, 0, 'datafield_latlong', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503632),
	(903, 0, 'datafield_menu', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503633),
	(904, 0, 'datafield_menu', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503633),
	(905, 0, 'datafield_menu', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503633),
	(906, 0, 'datafield_multimenu', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503633),
	(907, 0, 'datafield_multimenu', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503633),
	(908, 0, 'datafield_multimenu', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503633),
	(909, 0, 'datafield_number', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503633),
	(910, 0, 'datafield_number', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503633),
	(911, 0, 'datafield_number', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503634),
	(912, 0, 'datafield_picture', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503634),
	(913, 0, 'datafield_picture', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503634),
	(914, 0, 'datafield_picture', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503634),
	(915, 0, 'datafield_radiobutton', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503634),
	(916, 0, 'datafield_radiobutton', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503634),
	(917, 0, 'datafield_radiobutton', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503634),
	(918, 0, 'datafield_text', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503634),
	(919, 0, 'datafield_text', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503634),
	(920, 0, 'datafield_text', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503634),
	(921, 0, 'datafield_textarea', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503635),
	(922, 0, 'datafield_textarea', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503635),
	(923, 0, 'datafield_textarea', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503635),
	(924, 0, 'datafield_url', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503635),
	(925, 0, 'datafield_url', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503635),
	(926, 0, 'datafield_url', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503635),
	(927, 0, 'datapreset_imagegallery', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503635),
	(928, 0, 'datapreset_imagegallery', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503635),
	(929, 0, 'datapreset_imagegallery', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503635),
	(930, 0, 'ltiservice_memberships', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503636),
	(931, 0, 'ltiservice_memberships', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503636),
	(932, 0, 'ltiservice_memberships', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503636),
	(933, 0, 'ltiservice_profile', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503636),
	(934, 0, 'ltiservice_profile', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503636),
	(935, 0, 'ltiservice_profile', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503636),
	(936, 0, 'ltiservice_toolproxy', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503636),
	(937, 0, 'ltiservice_toolproxy', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503636),
	(938, 0, 'ltiservice_toolproxy', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503636),
	(939, 0, 'ltiservice_toolsettings', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503637),
	(940, 0, 'ltiservice_toolsettings', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503637),
	(941, 0, 'ltiservice_toolsettings', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503637),
	(942, 0, 'quiz_grading', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503637),
	(943, 0, 'quiz_grading', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503637),
	(944, 0, 'quiz_grading', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503638),
	(945, 0, 'quiz_overview', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503638),
	(946, 0, 'quiz_overview', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503638),
	(947, 0, 'quiz_overview', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503638),
	(948, 0, 'quiz_responses', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503638),
	(949, 0, 'quiz_responses', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503638),
	(950, 0, 'quiz_responses', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503639),
	(951, 0, 'quiz_statistics', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503639),
	(952, 0, 'quiz_statistics', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503639),
	(953, 0, 'quiz_statistics', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503639),
	(954, 0, 'quizaccess_delaybetweenattempts', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503639),
	(955, 0, 'quizaccess_delaybetweenattempts', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503639),
	(956, 0, 'quizaccess_delaybetweenattempts', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503640),
	(957, 0, 'quizaccess_ipaddress', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503640),
	(958, 0, 'quizaccess_ipaddress', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503640),
	(959, 0, 'quizaccess_ipaddress', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503640),
	(960, 0, 'quizaccess_numattempts', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503640),
	(961, 0, 'quizaccess_numattempts', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503640),
	(962, 0, 'quizaccess_numattempts', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503640),
	(963, 0, 'quizaccess_openclosedate', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503640),
	(964, 0, 'quizaccess_openclosedate', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503640),
	(965, 0, 'quizaccess_openclosedate', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503641),
	(966, 0, 'quizaccess_password', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503641),
	(967, 0, 'quizaccess_password', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503641),
	(968, 0, 'quizaccess_password', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503641),
	(969, 0, 'quizaccess_safebrowser', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503641),
	(970, 0, 'quizaccess_safebrowser', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503641),
	(971, 0, 'quizaccess_safebrowser', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503641),
	(972, 0, 'quizaccess_securewindow', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503641),
	(973, 0, 'quizaccess_securewindow', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503641),
	(974, 0, 'quizaccess_securewindow', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503642),
	(975, 0, 'quizaccess_timelimit', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503642),
	(976, 0, 'quizaccess_timelimit', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503642),
	(977, 0, 'quizaccess_timelimit', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503642),
	(978, 0, 'scormreport_basic', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503642),
	(979, 0, 'scormreport_basic', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503643),
	(980, 0, 'scormreport_basic', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503643),
	(981, 0, 'scormreport_graphs', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503643),
	(982, 0, 'scormreport_graphs', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503643),
	(983, 0, 'scormreport_graphs', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503644),
	(984, 0, 'scormreport_interactions', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503644),
	(985, 0, 'scormreport_interactions', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503644),
	(986, 0, 'scormreport_interactions', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503645),
	(987, 0, 'scormreport_objectives', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503645),
	(988, 0, 'scormreport_objectives', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503645),
	(989, 0, 'scormreport_objectives', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503645),
	(990, 0, 'workshopform_accumulative', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503645),
	(991, 0, 'workshopform_accumulative', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503646),
	(992, 0, 'workshopform_accumulative', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503646),
	(993, 0, 'workshopform_comments', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503646),
	(994, 0, 'workshopform_comments', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503647),
	(995, 0, 'workshopform_comments', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503647),
	(996, 0, 'workshopform_numerrors', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503647),
	(997, 0, 'workshopform_numerrors', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503647),
	(998, 0, 'workshopform_numerrors', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503648),
	(999, 0, 'workshopform_rubric', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503648),
	(1000, 0, 'workshopform_rubric', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503648),
	(1001, 0, 'workshopform_rubric', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503649),
	(1002, 0, 'workshopallocation_manual', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503649),
	(1003, 0, 'workshopallocation_manual', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503649),
	(1004, 0, 'workshopallocation_manual', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503650),
	(1005, 0, 'workshopallocation_random', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503650),
	(1006, 0, 'workshopallocation_random', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503650),
	(1007, 0, 'workshopallocation_random', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503650),
	(1008, 0, 'workshopallocation_scheduled', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503650),
	(1009, 0, 'workshopallocation_scheduled', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503650),
	(1010, 0, 'workshopallocation_scheduled', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503650),
	(1011, 0, 'workshopeval_best', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503650),
	(1012, 0, 'workshopeval_best', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503651),
	(1013, 0, 'workshopeval_best', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503651),
	(1014, 0, 'atto_accessibilitychecker', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503651),
	(1015, 0, 'atto_accessibilitychecker', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503651),
	(1016, 0, 'atto_accessibilitychecker', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503651),
	(1017, 0, 'atto_accessibilityhelper', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503651),
	(1018, 0, 'atto_accessibilityhelper', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503651),
	(1019, 0, 'atto_accessibilityhelper', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503652),
	(1020, 0, 'atto_align', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503652),
	(1021, 0, 'atto_align', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503652),
	(1022, 0, 'atto_align', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503652),
	(1023, 0, 'atto_backcolor', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503652),
	(1024, 0, 'atto_backcolor', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503652),
	(1025, 0, 'atto_backcolor', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503652),
	(1026, 0, 'atto_bold', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503652),
	(1027, 0, 'atto_bold', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503652),
	(1028, 0, 'atto_bold', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503653),
	(1029, 0, 'atto_charmap', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503653),
	(1030, 0, 'atto_charmap', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503653),
	(1031, 0, 'atto_charmap', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503653),
	(1032, 0, 'atto_clear', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503653),
	(1033, 0, 'atto_clear', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503654),
	(1034, 0, 'atto_clear', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503654),
	(1035, 0, 'atto_collapse', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503654),
	(1036, 0, 'atto_collapse', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503654),
	(1037, 0, 'atto_collapse', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503654),
	(1038, 0, 'atto_emoticon', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503655),
	(1039, 0, 'atto_emoticon', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503655),
	(1040, 0, 'atto_emoticon', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503655),
	(1041, 0, 'atto_equation', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503655),
	(1042, 0, 'atto_equation', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503655),
	(1043, 0, 'atto_equation', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503655),
	(1044, 0, 'atto_fontcolor', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503655),
	(1045, 0, 'atto_fontcolor', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503655),
	(1046, 0, 'atto_fontcolor', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503656),
	(1047, 0, 'atto_html', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503656),
	(1048, 0, 'atto_html', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503656),
	(1049, 0, 'atto_html', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503656),
	(1050, 0, 'atto_image', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503656),
	(1051, 0, 'atto_image', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503657),
	(1052, 0, 'atto_image', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503657),
	(1053, 0, 'atto_indent', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503657),
	(1054, 0, 'atto_indent', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503657),
	(1055, 0, 'atto_indent', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503657),
	(1056, 0, 'atto_italic', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503657),
	(1057, 0, 'atto_italic', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503657),
	(1058, 0, 'atto_italic', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503657),
	(1059, 0, 'atto_link', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503657),
	(1060, 0, 'atto_link', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503658),
	(1061, 0, 'atto_link', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503658),
	(1062, 0, 'atto_managefiles', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503658),
	(1063, 0, 'atto_managefiles', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503658),
	(1064, 0, 'atto_managefiles', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503658),
	(1065, 0, 'atto_media', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503658),
	(1066, 0, 'atto_media', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503658),
	(1067, 0, 'atto_media', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503658),
	(1068, 0, 'atto_noautolink', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503658),
	(1069, 0, 'atto_noautolink', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503658),
	(1070, 0, 'atto_noautolink', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503659),
	(1071, 0, 'atto_orderedlist', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503659),
	(1072, 0, 'atto_orderedlist', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503659),
	(1073, 0, 'atto_orderedlist', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503659),
	(1074, 0, 'atto_rtl', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503659),
	(1075, 0, 'atto_rtl', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503659),
	(1076, 0, 'atto_rtl', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503659),
	(1077, 0, 'atto_strike', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503659),
	(1078, 0, 'atto_strike', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503660),
	(1079, 0, 'atto_strike', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503660),
	(1080, 0, 'atto_subscript', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503660),
	(1081, 0, 'atto_subscript', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503660),
	(1082, 0, 'atto_subscript', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503660),
	(1083, 0, 'atto_superscript', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503660),
	(1084, 0, 'atto_superscript', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503660),
	(1085, 0, 'atto_superscript', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503661),
	(1086, 0, 'atto_table', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503661),
	(1087, 0, 'atto_table', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503661),
	(1088, 0, 'atto_table', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503661),
	(1089, 0, 'atto_title', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503661),
	(1090, 0, 'atto_title', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503661),
	(1091, 0, 'atto_title', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503661),
	(1092, 0, 'atto_underline', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503661),
	(1093, 0, 'atto_underline', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503661),
	(1094, 0, 'atto_underline', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503662),
	(1095, 0, 'atto_undo', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503662),
	(1096, 0, 'atto_undo', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503662),
	(1097, 0, 'atto_undo', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503662),
	(1098, 0, 'atto_unorderedlist', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503662),
	(1099, 0, 'atto_unorderedlist', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503662),
	(1100, 0, 'atto_unorderedlist', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503662),
	(1101, 0, 'tinymce_ctrlhelp', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503662),
	(1102, 0, 'tinymce_ctrlhelp', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503662),
	(1103, 0, 'tinymce_ctrlhelp', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503663),
	(1104, 0, 'tinymce_managefiles', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503663),
	(1105, 0, 'tinymce_managefiles', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503663),
	(1106, 0, 'tinymce_managefiles', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503663),
	(1107, 0, 'tinymce_moodleemoticon', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503663),
	(1108, 0, 'tinymce_moodleemoticon', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503663),
	(1109, 0, 'tinymce_moodleemoticon', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503663),
	(1110, 0, 'tinymce_moodleimage', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503663),
	(1111, 0, 'tinymce_moodleimage', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503664),
	(1112, 0, 'tinymce_moodleimage', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503664),
	(1113, 0, 'tinymce_moodlemedia', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503664),
	(1114, 0, 'tinymce_moodlemedia', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503664),
	(1115, 0, 'tinymce_moodlemedia', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503664),
	(1116, 0, 'tinymce_moodlenolink', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503665),
	(1117, 0, 'tinymce_moodlenolink', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503665),
	(1118, 0, 'tinymce_moodlenolink', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503665),
	(1119, 0, 'tinymce_pdw', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503665),
	(1120, 0, 'tinymce_pdw', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503665),
	(1121, 0, 'tinymce_pdw', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503666),
	(1122, 0, 'tinymce_spellchecker', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503666),
	(1123, 0, 'tinymce_spellchecker', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503666),
	(1124, 0, 'tinymce_spellchecker', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503666),
	(1125, 0, 'tinymce_wrap', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503666),
	(1126, 0, 'tinymce_wrap', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503666),
	(1127, 0, 'tinymce_wrap', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503666),
	(1128, 0, 'logstore_database', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503666),
	(1129, 0, 'logstore_database', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503667),
	(1130, 0, 'logstore_database', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503667),
	(1131, 0, 'logstore_legacy', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503667),
	(1132, 0, 'logstore_legacy', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503667),
	(1133, 0, 'logstore_legacy', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503667),
	(1134, 0, 'logstore_standard', NULL, '2016052300', 'Starting plugin installation', NULL, '', 0, 1475503667),
	(1135, 0, 'logstore_standard', '2016052300', '2016052300', 'Upgrade savepoint reached', NULL, '', 0, 1475503667),
	(1136, 0, 'logstore_standard', '2016052300', '2016052300', 'Plugin installed', NULL, '', 0, 1475503667);
/*!40000 ALTER TABLE `mdl_upgrade_log` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_url
CREATE TABLE IF NOT EXISTS `mdl_url` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `externalurl` longtext COLLATE utf8_unicode_ci NOT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext COLLATE utf8_unicode_ci,
  `parameters` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_url_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one url resource';

-- Copiando dados para a tabela capacitacoes.mdl_url: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_url` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_user
CREATE TABLE IF NOT EXISTS `mdl_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `auth` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'manual',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `policyagreed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lastname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `emailstop` tinyint(1) NOT NULL DEFAULT '0',
  `icq` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `skype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `yahoo` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aim` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `msn` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone1` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone2` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `institution` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `department` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `calendartype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'gregorian',
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timezone` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '99',
  `firstaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastlogin` bigint(10) NOT NULL DEFAULT '0',
  `currentlogin` bigint(10) NOT NULL DEFAULT '0',
  `lastip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `secret` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '1',
  `mailformat` tinyint(1) NOT NULL DEFAULT '1',
  `maildigest` tinyint(1) NOT NULL DEFAULT '0',
  `maildisplay` tinyint(2) NOT NULL DEFAULT '2',
  `autosubscribe` tinyint(1) NOT NULL DEFAULT '1',
  `trackforums` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `trustbitmask` bigint(10) NOT NULL DEFAULT '0',
  `imagealt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastnamephonetic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstnamephonetic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middlename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alternatename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_user_mneuse_uix` (`mnethostid`,`username`),
  KEY `mdl_user_del_ix` (`deleted`),
  KEY `mdl_user_con_ix` (`confirmed`),
  KEY `mdl_user_fir_ix` (`firstname`),
  KEY `mdl_user_las_ix` (`lastname`),
  KEY `mdl_user_cit_ix` (`city`),
  KEY `mdl_user_cou_ix` (`country`),
  KEY `mdl_user_las2_ix` (`lastaccess`),
  KEY `mdl_user_ema_ix` (`email`),
  KEY `mdl_user_aut_ix` (`auth`),
  KEY `mdl_user_idn_ix` (`idnumber`),
  KEY `mdl_user_fir2_ix` (`firstnamephonetic`),
  KEY `mdl_user_las3_ix` (`lastnamephonetic`),
  KEY `mdl_user_mid_ix` (`middlename`),
  KEY `mdl_user_alt_ix` (`alternatename`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='One record for each person';

-- Copiando dados para a tabela capacitacoes.mdl_user: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_user` DISABLE KEYS */;
INSERT INTO `mdl_user` (`id`, `auth`, `confirmed`, `policyagreed`, `deleted`, `suspended`, `mnethostid`, `username`, `password`, `idnumber`, `firstname`, `lastname`, `email`, `emailstop`, `icq`, `skype`, `yahoo`, `aim`, `msn`, `phone1`, `phone2`, `institution`, `department`, `address`, `city`, `country`, `lang`, `calendartype`, `theme`, `timezone`, `firstaccess`, `lastaccess`, `lastlogin`, `currentlogin`, `lastip`, `secret`, `picture`, `url`, `description`, `descriptionformat`, `mailformat`, `maildigest`, `maildisplay`, `autosubscribe`, `trackforums`, `timecreated`, `timemodified`, `trustbitmask`, `imagealt`, `lastnamephonetic`, `firstnamephonetic`, `middlename`, `alternatename`) VALUES
	(1, 'manual', 1, 0, 0, 0, 1, 'guest', '$2y$10$ta.86gTGKLyevCxW9XcVBOUSmdwwTGg/TiP4oW6SsCdQacSYCLlTy', '', 'Usuário visitante', ' ', 'root@localhost', 0, '', '', '', '', '', '', '', '', '', '', '', '', 'pt_br', 'gregorian', '', '99', 0, 0, 0, 0, '', '', 0, '', 'Este é um tipo de usuário especial que tem acesso a alguns curso com permissão limitada à leitura.', 1, 1, 0, 2, 1, 0, 0, 1475503296, 0, NULL, NULL, NULL, NULL, NULL),
	(2, 'manual', 1, 0, 0, 0, 1, 'infatec', '$2y$10$D6TwvKDb2DOjTau1DgkCgOh3O33vz/ji2ORzRZIE6vSU/VL2deRIK', '', 'INFATEC', 'SOLUÇÕES TECNOLÓGICAS', 'rupertlustosa@gmail.com', 0, '', '', '', '', '', '(86) 3221-7371', '', '', '', '', 'Teresina', 'BR', 'pt_br', 'gregorian', '', '99', 1475503733, 1475528394, 1475503733, 1475526581, '127.0.0.1', '', 0, '', 'Esse é o usuário padrão da Infatec', 1, 1, 0, 1, 1, 0, 0, 1475527786, 0, '', '', '', '', ''),
	(3, 'manual', 1, 0, 0, 0, 1, '00110115309', '$2y$10$7/wuYtyNGLxOu6Pd7MtQdu0xoNXWrzjy3DIBzX0qkHyW3pAMSo/7i', '', 'Rupert', 'Lustosa', 'rsirius@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'Teresina', 'BR', 'pt_br', 'gregorian', '', '99', 1475527269, 1475527658, 0, 1475527269, '127.0.0.1', '', 0, '', '', 1, 1, 0, 2, 1, 0, 1475526710, 1475526710, 0, '', '', '', '', ''),
	(4, 'manual', 1, 0, 0, 0, 1, '03653895367', '$2y$10$44ExPY8G6N2uEbBo7ZyDn.BjviCaPfnKnuaUzP3k0/XrEHXXBV4wO', '', 'Eduardo', 'Soares', 'l.eduardo.soares@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'Teresina', 'BR', 'pt_br', 'gregorian', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 0, 1475526763, 1475526763, 0, '', '', '', '', '');
/*!40000 ALTER TABLE `mdl_user` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_user_devices
CREATE TABLE IF NOT EXISTS `mdl_user_devices` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `appid` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `model` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `platform` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pushid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userdevi_pususe_uix` (`pushid`,`userid`),
  KEY `mdl_userdevi_uuiuse_ix` (`uuid`,`userid`),
  KEY `mdl_userdevi_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores user''s mobile devices information in order';

-- Copiando dados para a tabela capacitacoes.mdl_user_devices: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_user_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_devices` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_user_enrolments
CREATE TABLE IF NOT EXISTS `mdl_user_enrolments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `enrolid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '2147483647',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userenro_enruse_uix` (`enrolid`,`userid`),
  KEY `mdl_userenro_enr_ix` (`enrolid`),
  KEY `mdl_userenro_use_ix` (`userid`),
  KEY `mdl_userenro_mod_ix` (`modifierid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Users participating in courses (aka enrolled users) - everyb';

-- Copiando dados para a tabela capacitacoes.mdl_user_enrolments: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_user_enrolments` DISABLE KEYS */;
INSERT INTO `mdl_user_enrolments` (`id`, `status`, `enrolid`, `userid`, `timestart`, `timeend`, `modifierid`, `timecreated`, `timemodified`) VALUES
	(1, 0, 1, 3, 1475527299, 0, 2, 1475527314, 1475527314),
	(2, 0, 1, 4, 1475527299, 0, 2, 1475527315, 1475527315),
	(3, 0, 4, 3, 1475527299, 0, 2, 1475527350, 1475527350),
	(4, 0, 4, 4, 1475527299, 0, 2, 1475527352, 1475527352),
	(5, 0, 7, 4, 1475527299, 0, 2, 1475527371, 1475527371),
	(6, 0, 7, 3, 1475527299, 0, 2, 1475527372, 1475527372);
/*!40000 ALTER TABLE `mdl_user_enrolments` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_user_info_category
CREATE TABLE IF NOT EXISTS `mdl_user_info_category` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Customisable fields categories';

-- Copiando dados para a tabela capacitacoes.mdl_user_info_category: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_user_info_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_info_category` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_user_info_data
CREATE TABLE IF NOT EXISTS `mdl_user_info_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `dataformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userinfodata_usefie_uix` (`userid`,`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Data for the customisable user fields';

-- Copiando dados para a tabela capacitacoes.mdl_user_info_data: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_user_info_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_info_data` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_user_info_field
CREATE TABLE IF NOT EXISTS `mdl_user_info_field` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'shortname',
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `datatype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `required` tinyint(2) NOT NULL DEFAULT '0',
  `locked` tinyint(2) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '0',
  `forceunique` tinyint(2) NOT NULL DEFAULT '0',
  `signup` tinyint(2) NOT NULL DEFAULT '0',
  `defaultdata` longtext COLLATE utf8_unicode_ci,
  `defaultdataformat` tinyint(2) NOT NULL DEFAULT '0',
  `param1` longtext COLLATE utf8_unicode_ci,
  `param2` longtext COLLATE utf8_unicode_ci,
  `param3` longtext COLLATE utf8_unicode_ci,
  `param4` longtext COLLATE utf8_unicode_ci,
  `param5` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Customisable user profile fields';

-- Copiando dados para a tabela capacitacoes.mdl_user_info_field: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_user_info_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_info_field` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_user_lastaccess
CREATE TABLE IF NOT EXISTS `mdl_user_lastaccess` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeaccess` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userlast_usecou_uix` (`userid`,`courseid`),
  KEY `mdl_userlast_use_ix` (`userid`),
  KEY `mdl_userlast_cou_ix` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To keep track of course page access times, used in online pa';

-- Copiando dados para a tabela capacitacoes.mdl_user_lastaccess: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_user_lastaccess` DISABLE KEYS */;
INSERT INTO `mdl_user_lastaccess` (`id`, `userid`, `courseid`, `timeaccess`) VALUES
	(1, 2, 2, 1475527310),
	(2, 2, 3, 1475528236),
	(3, 2, 4, 1475527422),
	(4, 2, 5, 1475527451),
	(5, 3, 3, 1475527658);
/*!40000 ALTER TABLE `mdl_user_lastaccess` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_user_password_history
CREATE TABLE IF NOT EXISTS `mdl_user_password_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_userpasshist_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A rotating log of hashes of previously used passwords for ea';

-- Copiando dados para a tabela capacitacoes.mdl_user_password_history: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_user_password_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_password_history` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_user_password_resets
CREATE TABLE IF NOT EXISTS `mdl_user_password_resets` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `timerequested` bigint(10) NOT NULL,
  `timererequested` bigint(10) NOT NULL DEFAULT '0',
  `token` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_userpassrese_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='table tracking password reset confirmation tokens';

-- Copiando dados para a tabela capacitacoes.mdl_user_password_resets: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_user_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_password_resets` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_user_preferences
CREATE TABLE IF NOT EXISTS `mdl_user_preferences` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(1333) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userpref_usenam_uix` (`userid`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Allows modules to store arbitrary user preferences';

-- Copiando dados para a tabela capacitacoes.mdl_user_preferences: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_user_preferences` DISABLE KEYS */;
INSERT INTO `mdl_user_preferences` (`id`, `userid`, `name`, `value`) VALUES
	(1, 2, 'auth_manual_passwordupdatetime', '1475527786'),
	(2, 2, 'email_bounce_count', '1'),
	(3, 2, 'email_send_count', '1'),
	(4, 3, 'auth_forcepasswordchange', '0'),
	(5, 3, 'email_bounce_count', '1'),
	(6, 3, 'email_send_count', '1'),
	(7, 4, 'auth_forcepasswordchange', '0'),
	(8, 4, 'email_bounce_count', '1'),
	(9, 4, 'email_send_count', '1');
/*!40000 ALTER TABLE `mdl_user_preferences` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_user_private_key
CREATE TABLE IF NOT EXISTS `mdl_user_private_key` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `script` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT NULL,
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_userprivkey_scrval_ix` (`script`,`value`),
  KEY `mdl_userprivkey_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='access keys used in cookieless scripts - rss, etc.';

-- Copiando dados para a tabela capacitacoes.mdl_user_private_key: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_user_private_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_private_key` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_wiki
CREATE TABLE IF NOT EXISTS `mdl_wiki` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Wiki',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `firstpagetitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'First Page',
  `wikimode` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'collaborative',
  `defaultformat` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'creole',
  `forceformat` tinyint(1) NOT NULL DEFAULT '1',
  `editbegin` bigint(10) NOT NULL DEFAULT '0',
  `editend` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wiki_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores Wiki activity configuration';

-- Copiando dados para a tabela capacitacoes.mdl_wiki: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_wiki` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_wiki_links
CREATE TABLE IF NOT EXISTS `mdl_wiki_links` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `frompageid` bigint(10) NOT NULL DEFAULT '0',
  `topageid` bigint(10) NOT NULL DEFAULT '0',
  `tomissingpage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_wikilink_fro_ix` (`frompageid`),
  KEY `mdl_wikilink_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Page wiki links';

-- Copiando dados para a tabela capacitacoes.mdl_wiki_links: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_wiki_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_links` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_wiki_locks
CREATE TABLE IF NOT EXISTS `mdl_wiki_locks` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `sectionname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `lockedat` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Manages page locks';

-- Copiando dados para a tabela capacitacoes.mdl_wiki_locks: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_wiki_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_locks` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_wiki_pages
CREATE TABLE IF NOT EXISTS `mdl_wiki_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'title',
  `cachedcontent` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timerendered` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageviews` bigint(10) NOT NULL DEFAULT '0',
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikipage_subtituse_uix` (`subwikiid`,`title`,`userid`),
  KEY `mdl_wikipage_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki pages';

-- Copiando dados para a tabela capacitacoes.mdl_wiki_pages: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_wiki_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_pages` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_wiki_subwikis
CREATE TABLE IF NOT EXISTS `mdl_wiki_subwikis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `wikiid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisubw_wikgrouse_uix` (`wikiid`,`groupid`,`userid`),
  KEY `mdl_wikisubw_wik_ix` (`wikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores subwiki instances';

-- Copiando dados para a tabela capacitacoes.mdl_wiki_subwikis: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_wiki_subwikis` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_subwikis` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_wiki_synonyms
CREATE TABLE IF NOT EXISTS `mdl_wiki_synonyms` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `pagesynonym` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pagesynonym',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisyno_pagpag_uix` (`pageid`,`pagesynonym`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki pages synonyms';

-- Copiando dados para a tabela capacitacoes.mdl_wiki_synonyms: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_wiki_synonyms` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_synonyms` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_wiki_versions
CREATE TABLE IF NOT EXISTS `mdl_wiki_versions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `contentformat` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'creole',
  `version` mediumint(5) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wikivers_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki page history';

-- Copiando dados para a tabela capacitacoes.mdl_wiki_versions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_wiki_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_versions` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_workshop
CREATE TABLE IF NOT EXISTS `mdl_workshop` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(3) NOT NULL DEFAULT '0',
  `instructauthors` longtext COLLATE utf8_unicode_ci,
  `instructauthorsformat` smallint(3) NOT NULL DEFAULT '0',
  `instructreviewers` longtext COLLATE utf8_unicode_ci,
  `instructreviewersformat` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL,
  `phase` smallint(3) DEFAULT '0',
  `useexamples` tinyint(2) DEFAULT '0',
  `usepeerassessment` tinyint(2) DEFAULT '0',
  `useselfassessment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '80.00000',
  `gradinggrade` decimal(10,5) DEFAULT '20.00000',
  `strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `evaluation` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gradedecimals` smallint(3) DEFAULT '0',
  `nattachments` smallint(3) DEFAULT '0',
  `submissionfiletypes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latesubmissions` tinyint(2) DEFAULT '0',
  `maxbytes` bigint(10) DEFAULT '100000',
  `examplesmode` smallint(3) DEFAULT '0',
  `submissionstart` bigint(10) DEFAULT '0',
  `submissionend` bigint(10) DEFAULT '0',
  `assessmentstart` bigint(10) DEFAULT '0',
  `assessmentend` bigint(10) DEFAULT '0',
  `phaseswitchassessment` tinyint(2) NOT NULL DEFAULT '0',
  `conclusion` longtext COLLATE utf8_unicode_ci,
  `conclusionformat` smallint(3) NOT NULL DEFAULT '1',
  `overallfeedbackmode` smallint(3) DEFAULT '1',
  `overallfeedbackfiles` smallint(3) DEFAULT '0',
  `overallfeedbackfiletypes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `overallfeedbackmaxbytes` bigint(10) DEFAULT '100000',
  PRIMARY KEY (`id`),
  KEY `mdl_work_cou_ix` (`course`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about the module instances and ';

-- Copiando dados para a tabela capacitacoes.mdl_workshop: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_workshop` DISABLE KEYS */;
INSERT INTO `mdl_workshop` (`id`, `course`, `name`, `intro`, `introformat`, `instructauthors`, `instructauthorsformat`, `instructreviewers`, `instructreviewersformat`, `timemodified`, `phase`, `useexamples`, `usepeerassessment`, `useselfassessment`, `grade`, `gradinggrade`, `strategy`, `evaluation`, `gradedecimals`, `nattachments`, `submissionfiletypes`, `latesubmissions`, `maxbytes`, `examplesmode`, `submissionstart`, `submissionend`, `assessmentstart`, `assessmentend`, `phaseswitchassessment`, `conclusion`, `conclusionformat`, `overallfeedbackmode`, `overallfeedbackfiles`, `overallfeedbackfiletypes`, `overallfeedbackmaxbytes`) VALUES
	(1, 3, 'Laboratório de Avaliação A', '', 1, '', 1, '', 1, 1475527593, 10, 0, 1, 0, 80.00000, 20.00000, 'accumulative', 'best', 0, 1, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 1, 0, NULL, 0);
/*!40000 ALTER TABLE `mdl_workshop` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_workshopallocation_scheduled
CREATE TABLE IF NOT EXISTS `mdl_workshopallocation_scheduled` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `enabled` tinyint(2) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL,
  `timeallocated` bigint(10) DEFAULT NULL,
  `settings` longtext COLLATE utf8_unicode_ci,
  `resultstatus` bigint(10) DEFAULT NULL,
  `resultmessage` varchar(1333) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resultlog` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worksche_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the allocation settings for the scheduled allocator';

-- Copiando dados para a tabela capacitacoes.mdl_workshopallocation_scheduled: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_workshopallocation_scheduled` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopallocation_scheduled` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_workshopeval_best_settings
CREATE TABLE IF NOT EXISTS `mdl_workshopeval_best_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `comparison` smallint(3) DEFAULT '5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workbestsett_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Settings for the grading evaluation subplugin Comparison wit';

-- Copiando dados para a tabela capacitacoes.mdl_workshopeval_best_settings: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_workshopeval_best_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopeval_best_settings` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_workshopform_accumulative
CREATE TABLE IF NOT EXISTS `mdl_workshopform_accumulative` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  `grade` bigint(10) NOT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_workaccu_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Accumulative gradin';

-- Copiando dados para a tabela capacitacoes.mdl_workshopform_accumulative: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_workshopform_accumulative` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_accumulative` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_workshopform_comments
CREATE TABLE IF NOT EXISTS `mdl_workshopform_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workcomm_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Comments strategy f';

-- Copiando dados para a tabela capacitacoes.mdl_workshopform_comments: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_workshopform_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_comments` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_workshopform_numerrors
CREATE TABLE IF NOT EXISTS `mdl_workshopform_numerrors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  `descriptiontrust` bigint(10) DEFAULT NULL,
  `grade0` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grade1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_worknume_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Number of errors gr';

-- Copiando dados para a tabela capacitacoes.mdl_workshopform_numerrors: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_workshopform_numerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_numerrors` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_workshopform_numerrors_map
CREATE TABLE IF NOT EXISTS `mdl_workshopform_numerrors_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `nonegative` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worknumemap_wornon_uix` (`workshopid`,`nonegative`),
  KEY `mdl_worknumemap_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This maps the number of errors to a percentual grade for sub';

-- Copiando dados para a tabela capacitacoes.mdl_workshopform_numerrors_map: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_workshopform_numerrors_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_numerrors_map` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_workshopform_rubric
CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubr_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Rubric grading stra';

-- Copiando dados para a tabela capacitacoes.mdl_workshopform_rubric: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_workshopform_rubric` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_rubric` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_workshopform_rubric_config
CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `layout` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'list',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workrubrconf_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Configuration table for the Rubric grading strategy';

-- Copiando dados para a tabela capacitacoes.mdl_workshopform_rubric_config: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_workshopform_rubric_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_rubric_config` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_workshopform_rubric_levels
CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `definition` longtext COLLATE utf8_unicode_ci,
  `definitionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrleve_dim_ix` (`dimensionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The definition of rubric rating scales';

-- Copiando dados para a tabela capacitacoes.mdl_workshopform_rubric_levels: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_workshopform_rubric_levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_rubric_levels` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_workshop_aggregations
CREATE TABLE IF NOT EXISTS `mdl_workshop_aggregations` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `timegraded` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workaggr_woruse_uix` (`workshopid`,`userid`),
  KEY `mdl_workaggr_wor_ix` (`workshopid`),
  KEY `mdl_workaggr_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Aggregated grades for assessment are stored here. The aggreg';

-- Copiando dados para a tabela capacitacoes.mdl_workshop_aggregations: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_workshop_aggregations` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_aggregations` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_workshop_assessments
CREATE TABLE IF NOT EXISTS `mdl_workshop_assessments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `submissionid` bigint(10) NOT NULL,
  `reviewerid` bigint(10) NOT NULL,
  `weight` bigint(10) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `gradinggradeover` decimal(10,5) DEFAULT NULL,
  `gradinggradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext COLLATE utf8_unicode_ci,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `feedbackauthorattachment` smallint(3) DEFAULT '0',
  `feedbackreviewer` longtext COLLATE utf8_unicode_ci,
  `feedbackreviewerformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workasse_sub_ix` (`submissionid`),
  KEY `mdl_workasse_gra_ix` (`gradinggradeoverby`),
  KEY `mdl_workasse_rev_ix` (`reviewerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about the made assessment and automatically calculated ';

-- Copiando dados para a tabela capacitacoes.mdl_workshop_assessments: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_workshop_assessments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_assessments` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_workshop_assessments_old
CREATE TABLE IF NOT EXISTS `mdl_workshop_assessments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `submissionid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timegraded` bigint(10) NOT NULL DEFAULT '0',
  `timeagreed` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `teachergraded` smallint(3) NOT NULL DEFAULT '0',
  `mailed` smallint(3) NOT NULL DEFAULT '0',
  `resubmission` smallint(3) NOT NULL DEFAULT '0',
  `donotuse` smallint(3) NOT NULL DEFAULT '0',
  `generalcomment` longtext COLLATE utf8_unicode_ci,
  `teachercomment` longtext COLLATE utf8_unicode_ci,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workasseold_use_ix` (`userid`),
  KEY `mdl_workasseold_mai_ix` (`mailed`),
  KEY `mdl_workasseold_wor_ix` (`workshopid`),
  KEY `mdl_workasseold_sub_ix` (`submissionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_assessments table to be dropped later in Moo';

-- Copiando dados para a tabela capacitacoes.mdl_workshop_assessments_old: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_workshop_assessments_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_assessments_old` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_workshop_comments_old
CREATE TABLE IF NOT EXISTS `mdl_workshop_comments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `comments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workcommold_use_ix` (`userid`),
  KEY `mdl_workcommold_mai_ix` (`mailed`),
  KEY `mdl_workcommold_wor_ix` (`workshopid`),
  KEY `mdl_workcommold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_comments table to be dropped later in Moodle';

-- Copiando dados para a tabela capacitacoes.mdl_workshop_comments_old: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_workshop_comments_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_comments_old` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_workshop_elements_old
CREATE TABLE IF NOT EXISTS `mdl_workshop_elements_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scale` smallint(3) NOT NULL DEFAULT '0',
  `maxscore` smallint(3) NOT NULL DEFAULT '1',
  `weight` smallint(3) NOT NULL DEFAULT '11',
  `stddev` double NOT NULL DEFAULT '0',
  `totalassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workelemold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_elements table to be dropped later in Moodle';

-- Copiando dados para a tabela capacitacoes.mdl_workshop_elements_old: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_workshop_elements_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_elements_old` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_workshop_grades
CREATE TABLE IF NOT EXISTS `mdl_workshop_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assessmentid` bigint(10) NOT NULL,
  `strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `peercomment` longtext COLLATE utf8_unicode_ci,
  `peercommentformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workgrad_assstrdim_uix` (`assessmentid`,`strategy`,`dimensionid`),
  KEY `mdl_workgrad_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='How the reviewers filled-up the grading forms, given grades ';

-- Copiando dados para a tabela capacitacoes.mdl_workshop_grades: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_workshop_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_grades` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_workshop_grades_old
CREATE TABLE IF NOT EXISTS `mdl_workshop_grades_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workgradold_wor_ix` (`workshopid`),
  KEY `mdl_workgradold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_grades table to be dropped later in Moodle 2';

-- Copiando dados para a tabela capacitacoes.mdl_workshop_grades_old: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_workshop_grades_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_grades_old` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_workshop_old
CREATE TABLE IF NOT EXISTS `mdl_workshop_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `wtype` smallint(3) NOT NULL DEFAULT '0',
  `nelements` smallint(3) NOT NULL DEFAULT '1',
  `nattachments` smallint(3) NOT NULL DEFAULT '0',
  `phase` tinyint(2) NOT NULL DEFAULT '0',
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `gradingstrategy` tinyint(2) NOT NULL DEFAULT '1',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `agreeassessments` tinyint(2) NOT NULL DEFAULT '0',
  `hidegrades` tinyint(2) NOT NULL DEFAULT '0',
  `anonymous` tinyint(2) NOT NULL DEFAULT '0',
  `includeself` tinyint(2) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `submissionstart` bigint(10) NOT NULL DEFAULT '0',
  `assessmentstart` bigint(10) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL DEFAULT '0',
  `assessmentend` bigint(10) NOT NULL DEFAULT '0',
  `releasegrades` bigint(10) NOT NULL DEFAULT '0',
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `ntassessments` smallint(3) NOT NULL DEFAULT '0',
  `assessmentcomps` smallint(3) NOT NULL DEFAULT '2',
  `nsassessments` smallint(3) NOT NULL DEFAULT '0',
  `overallocation` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherweight` smallint(3) NOT NULL DEFAULT '1',
  `showleaguetable` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop table to be dropped later in Moodle 2.x';

-- Copiando dados para a tabela capacitacoes.mdl_workshop_old: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_workshop_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_old` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_workshop_rubrics_old
CREATE TABLE IF NOT EXISTS `mdl_workshop_rubrics_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `rubricno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_rubrics table to be dropped later in Moodle ';

-- Copiando dados para a tabela capacitacoes.mdl_workshop_rubrics_old: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_workshop_rubrics_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_rubrics_old` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_workshop_stockcomments_old
CREATE TABLE IF NOT EXISTS `mdl_workshop_stockcomments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `comments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workstocold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_stockcomments table to be dropped later in M';

-- Copiando dados para a tabela capacitacoes.mdl_workshop_stockcomments_old: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_workshop_stockcomments_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_stockcomments_old` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_workshop_submissions
CREATE TABLE IF NOT EXISTS `mdl_workshop_submissions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `example` tinyint(2) DEFAULT '0',
  `authorid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` longtext COLLATE utf8_unicode_ci,
  `contentformat` smallint(3) NOT NULL DEFAULT '0',
  `contenttrust` smallint(3) NOT NULL DEFAULT '0',
  `attachment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradeover` decimal(10,5) DEFAULT NULL,
  `gradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext COLLATE utf8_unicode_ci,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `timegraded` bigint(10) DEFAULT NULL,
  `published` tinyint(2) DEFAULT '0',
  `late` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_worksubm_wor_ix` (`workshopid`),
  KEY `mdl_worksubm_gra_ix` (`gradeoverby`),
  KEY `mdl_worksubm_aut_ix` (`authorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about the submission and the aggregation of the grade f';

-- Copiando dados para a tabela capacitacoes.mdl_workshop_submissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_workshop_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_submissions` ENABLE KEYS */;

-- Copiando estrutura para tabela capacitacoes.mdl_workshop_submissions_old
CREATE TABLE IF NOT EXISTS `mdl_workshop_submissions_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `finalgrade` smallint(3) NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `nassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_worksubmold_use_ix` (`userid`),
  KEY `mdl_worksubmold_mai_ix` (`mailed`),
  KEY `mdl_worksubmold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_submissions table to be dropped later in Moo';

-- Copiando dados para a tabela capacitacoes.mdl_workshop_submissions_old: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdl_workshop_submissions_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_submissions_old` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
