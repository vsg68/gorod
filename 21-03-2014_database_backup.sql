#
# Управление Активами Database Dump
# MODX Version:1.0.12
# 
# Host: 
# Generation Time: 21-03-2014 00:38:12
# Server version: 5.5.35-0ubuntu0.12.04.2
# PHP Version: 5.4.25-1+sury.org~precise+2
# Database : `gorod`
#

# --------------------------------------------------------

#
# Table structure for table `modx_active_users`
#

DROP TABLE IF EXISTS `modx_active_users`;
CREATE TABLE `modx_active_users` (
  `internalKey` int(9) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `lasthit` int(20) NOT NULL DEFAULT '0',
  `id` int(10) DEFAULT NULL,
  `action` varchar(10) NOT NULL DEFAULT '',
  `ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`internalKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data about active users.';

#
# Dumping data for table `modx_active_users`
#

INSERT INTO `modx_active_users` VALUES ('1','admin','1395347892','','93','127.0.0.1');

# --------------------------------------------------------

#
# Table structure for table `modx_categories`
#

DROP TABLE IF EXISTS `modx_categories`;
CREATE TABLE `modx_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Categories to be used snippets,tv,chunks, etc';

#
# Dumping data for table `modx_categories`
#

INSERT INTO `modx_categories` VALUES ('1','Demo Content');
INSERT INTO `modx_categories` VALUES ('2','Js');
INSERT INTO `modx_categories` VALUES ('3','Manager and Admin');
INSERT INTO `modx_categories` VALUES ('4','Navigation');
INSERT INTO `modx_categories` VALUES ('5','Content');
INSERT INTO `modx_categories` VALUES ('6','Шаблоны');
INSERT INTO `modx_categories` VALUES ('7','Img');

# --------------------------------------------------------

#
# Table structure for table `modx_document_groups`
#

DROP TABLE IF EXISTS `modx_document_groups`;
CREATE TABLE `modx_document_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `document_group` int(10) NOT NULL DEFAULT '0',
  `document` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `document` (`document`),
  KEY `document_group` (`document_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';

#
# Dumping data for table `modx_document_groups`
#


# --------------------------------------------------------

#
# Table structure for table `modx_documentgroup_names`
#

DROP TABLE IF EXISTS `modx_documentgroup_names`;
CREATE TABLE `modx_documentgroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `private_memgroup` tinyint(4) DEFAULT '0' COMMENT 'determine whether the document group is private to manager users',
  `private_webgroup` tinyint(4) DEFAULT '0' COMMENT 'determines whether the document is private to web users',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';

#
# Dumping data for table `modx_documentgroup_names`
#


# --------------------------------------------------------

#
# Table structure for table `modx_event_log`
#

DROP TABLE IF EXISTS `modx_event_log`;
CREATE TABLE `modx_event_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventid` int(11) DEFAULT '0',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1- information, 2 - warning, 3- error',
  `user` int(11) NOT NULL DEFAULT '0' COMMENT 'link to user table',
  `usertype` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - manager, 1 - web',
  `source` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='Stores event and error logs';

#
# Dumping data for table `modx_event_log`
#

INSERT INTO `modx_event_log` VALUES ('1','0','1393611729','3','1','0','Файл конфигурации все еще доступен для записи','Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим \'Только для чтения\'');
INSERT INTO `modx_event_log` VALUES ('2','0','1393611729','3','1','0','phpmailer','Could not instantiate mail function.');
INSERT INTO `modx_event_log` VALUES ('3','0','1395082791','3','0','0','Snippet - PSSGallery','<h3 style=\"color:red\">&laquo; MODX Parse Error &raquo;</h3>\n	                <table border=\"0\" cellpadding=\"1\" cellspacing=\"0\">\n	                <tr><td colspan=\"2\">MODX encountered the following error while attempting to parse the requested resource:</td></tr>\n	                <tr><td colspan=\"2\"><b style=\"color:red;\">&laquo; Execution of a query to the database failed - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'asc\' at line 1 &raquo;</b></td></tr><tr><td colspan=\"2\"><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;\">SQL &gt; <span id=\"sqlHolder\">SELECT * FROM `gorod`.`modx_pss_gallery` WHERE document_id=\'15\' AND visible=1 ORDER BY  asc  </span></div>\n	                </td></tr><tr><td colspan=\"2\"><b>Basic info</b></td></tr><tr><td valign=\"top\" style=\"white-space:nowrap;\">REQUEST_URI : </td><td>/15/</td></tr><tr><td valign=\"top\">Resource : </td><td>[15]<a href=\"http://gorod/index.php?id=15\" target=\"_blank\">test</a></td></tr><tr><td>Current Snippet : </td><td>PSSGallery</td></tr><tr><td>Referer : </td><td></td></tr><tr><td>User Agent : </td><td>Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:27.0) Gecko/20100101 Firefox/27.0</td></tr><tr><td>IP : </td><td>127.0.0.1</td></tr><tr><td colspan=\"2\"><b>Benchmarks</b></td></tr><tr><td>MySQL : </td><td>0.0018 s (5 Requests)</td></tr><tr><td>PHP : </td><td>0.0295 s</td></tr><tr><td>Total : </td><td>0.0313 s</td></tr><tr><td>Memory : </td><td>1.2711715698242 mb</td></tr></table>\n<br /><p><b>Backtrace</b></p>\n<table><tr><td valign=\"top\">1</td><td>DocumentParser->executeParser()<br />index.php on line 140</td><tr><td valign=\"top\">2</td><td>DocumentParser->prepareResponse()<br />manager/includes/document.parser.class.inc.php on line 1568</td><tr><td valign=\"top\">3</td><td>DocumentParser->outputContent()<br />manager/includes/document.parser.class.inc.php on line 1673</td><tr><td valign=\"top\">4</td><td>DocumentParser->parseDocumentSource()<br />manager/includes/document.parser.class.inc.php on line 582</td><tr><td valign=\"top\">5</td><td>DocumentParser->evalSnippets()<br />manager/includes/document.parser.class.inc.php on line 1450</td><tr><td valign=\"top\">6</td><td>DocumentParser->_get_snip_result()<br />manager/includes/document.parser.class.inc.php on line 1061</td><tr><td valign=\"top\">7</td><td>DocumentParser->evalSnippet()<br />manager/includes/document.parser.class.inc.php on line 1147</td><tr><td valign=\"top\">8</td><td>eval()<br />manager/includes/document.parser.class.inc.php on line 1005</td><tr><td valign=\"top\">9</td><td>include()<br />manager/includes/document.parser.class.inc.php(1005) : eval()\'d code on line 2</td><tr><td valign=\"top\">10</td><td>PSS_Gallery_Controller->draw()<br />assets/snippets/pss_gallery/index.php on line 31</td><tr><td valign=\"top\">11</td><td>PSS_Gallery_Controller->buildGallery()<br />assets/snippets/pss_gallery/classes/PSS_Gallery_Controller.php on line 166</td><tr><td valign=\"top\">12</td><td>DBAPI->select()<br />assets/snippets/pss_gallery/classes/PSS_Gallery_Controller.php on line 120</td><tr><td valign=\"top\">13</td><td>DBAPI->query()<br />manager/includes/extenders/dbapi.mysql.class.inc.php on line 224</td></table>\n');
INSERT INTO `modx_event_log` VALUES ('4','0','1395082791','3','0','0','phpmailer','Could not instantiate mail function.');
INSERT INTO `modx_event_log` VALUES ('5','0','1395082933','3','0','0','Snippet - PSSGallery','<h3 style=\"color:red\">&laquo; MODX Parse Error &raquo;</h3>\n	                <table border=\"0\" cellpadding=\"1\" cellspacing=\"0\">\n	                <tr><td colspan=\"2\">MODX encountered the following error while attempting to parse the requested resource:</td></tr>\n	                <tr><td colspan=\"2\"><b style=\"color:red;\">&laquo; Execution of a query to the database failed - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'asc\' at line 1 &raquo;</b></td></tr><tr><td colspan=\"2\"><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;\">SQL &gt; <span id=\"sqlHolder\">SELECT * FROM `gorod`.`modx_pss_gallery` WHERE document_id=\'15\' AND visible=1 ORDER BY  asc  </span></div>\n	                </td></tr><tr><td colspan=\"2\"><b>Basic info</b></td></tr><tr><td valign=\"top\" style=\"white-space:nowrap;\">REQUEST_URI : </td><td>/15/</td></tr><tr><td valign=\"top\">Resource : </td><td>[15]<a href=\"http://gorod/index.php?id=15\" target=\"_blank\">test</a></td></tr><tr><td>Current Snippet : </td><td>PSSGallery</td></tr><tr><td>Referer : </td><td></td></tr><tr><td>User Agent : </td><td>Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:27.0) Gecko/20100101 Firefox/27.0</td></tr><tr><td>IP : </td><td>127.0.0.1</td></tr><tr><td colspan=\"2\"><b>Benchmarks</b></td></tr><tr><td>MySQL : </td><td>0.0136 s (5 Requests)</td></tr><tr><td>PHP : </td><td>0.0442 s</td></tr><tr><td>Total : </td><td>0.0578 s</td></tr><tr><td>Memory : </td><td>1.2711715698242 mb</td></tr></table>\n<br /><p><b>Backtrace</b></p>\n<table><tr><td valign=\"top\">1</td><td>DocumentParser->executeParser()<br />index.php on line 140</td><tr><td valign=\"top\">2</td><td>DocumentParser->prepareResponse()<br />manager/includes/document.parser.class.inc.php on line 1568</td><tr><td valign=\"top\">3</td><td>DocumentParser->outputContent()<br />manager/includes/document.parser.class.inc.php on line 1673</td><tr><td valign=\"top\">4</td><td>DocumentParser->parseDocumentSource()<br />manager/includes/document.parser.class.inc.php on line 582</td><tr><td valign=\"top\">5</td><td>DocumentParser->evalSnippets()<br />manager/includes/document.parser.class.inc.php on line 1450</td><tr><td valign=\"top\">6</td><td>DocumentParser->_get_snip_result()<br />manager/includes/document.parser.class.inc.php on line 1061</td><tr><td valign=\"top\">7</td><td>DocumentParser->evalSnippet()<br />manager/includes/document.parser.class.inc.php on line 1147</td><tr><td valign=\"top\">8</td><td>eval()<br />manager/includes/document.parser.class.inc.php on line 1005</td><tr><td valign=\"top\">9</td><td>include()<br />manager/includes/document.parser.class.inc.php(1005) : eval()\'d code on line 2</td><tr><td valign=\"top\">10</td><td>PSS_Gallery_Controller->draw()<br />assets/snippets/pss_gallery/index.php on line 31</td><tr><td valign=\"top\">11</td><td>PSS_Gallery_Controller->buildGallery()<br />assets/snippets/pss_gallery/classes/PSS_Gallery_Controller.php on line 166</td><tr><td valign=\"top\">12</td><td>DBAPI->select()<br />assets/snippets/pss_gallery/classes/PSS_Gallery_Controller.php on line 120</td><tr><td valign=\"top\">13</td><td>DBAPI->query()<br />manager/includes/extenders/dbapi.mysql.class.inc.php on line 224</td></table>\n');
INSERT INTO `modx_event_log` VALUES ('6','0','1395082934','3','0','0','phpmailer','Could not instantiate mail function.');
INSERT INTO `modx_event_log` VALUES ('7','0','1395084285','3','0','0','Snippet - PSSGallery','<h3 style=\"color:red\">&laquo; MODX Parse Error &raquo;</h3>\n	                <table border=\"0\" cellpadding=\"1\" cellspacing=\"0\">\n	                <tr><td colspan=\"2\">MODX encountered the following error while attempting to parse the requested resource:</td></tr>\n	                <tr><td colspan=\"2\"><b style=\"color:red;\">&laquo; Execution of a query to the database failed - Column \'id\' in where clause is ambiguous &raquo;</b></td></tr><tr><td colspan=\"2\"><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;\">SQL &gt; <span id=\"sqlHolder\">SELECT DISTINCT sc.*\n              FROM `gorod`.`modx_site_content` sc\n              LEFT JOIN `gorod`.`modx_document_groups` dg on dg.document = sc.id\n              WHERE sc.parent = \'3\' AND sc.published=id AND sc.deleted=0 \n              AND (sc.privateweb=0)\n              GROUP BY sc.id  ORDER BY sc.menuindex ASC   </span></div>\n	                </td></tr><tr><td colspan=\"2\"><b>Basic info</b></td></tr><tr><td valign=\"top\" style=\"white-space:nowrap;\">REQUEST_URI : </td><td>/15/</td></tr><tr><td valign=\"top\">Resource : </td><td>[15]<a href=\"http://gorod/index.php?id=15\" target=\"_blank\">test</a></td></tr><tr><td>Current Snippet : </td><td>PSSGallery</td></tr><tr><td>Referer : </td><td></td></tr><tr><td>User Agent : </td><td>Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:27.0) Gecko/20100101 Firefox/27.0</td></tr><tr><td>IP : </td><td>127.0.0.1</td></tr><tr><td colspan=\"2\"><b>Benchmarks</b></td></tr><tr><td>MySQL : </td><td>0.0019 s (5 Requests)</td></tr><tr><td>PHP : </td><td>0.0381 s</td></tr><tr><td>Total : </td><td>0.0400 s</td></tr><tr><td>Memory : </td><td>1.2711715698242 mb</td></tr></table>\n<br /><p><b>Backtrace</b></p>\n<table><tr><td valign=\"top\">1</td><td>DocumentParser->executeParser()<br />index.php on line 140</td><tr><td valign=\"top\">2</td><td>DocumentParser->prepareResponse()<br />manager/includes/document.parser.class.inc.php on line 1568</td><tr><td valign=\"top\">3</td><td>DocumentParser->outputContent()<br />manager/includes/document.parser.class.inc.php on line 1673</td><tr><td valign=\"top\">4</td><td>DocumentParser->parseDocumentSource()<br />manager/includes/document.parser.class.inc.php on line 582</td><tr><td valign=\"top\">5</td><td>DocumentParser->evalSnippets()<br />manager/includes/document.parser.class.inc.php on line 1450</td><tr><td valign=\"top\">6</td><td>DocumentParser->_get_snip_result()<br />manager/includes/document.parser.class.inc.php on line 1061</td><tr><td valign=\"top\">7</td><td>DocumentParser->evalSnippet()<br />manager/includes/document.parser.class.inc.php on line 1147</td><tr><td valign=\"top\">8</td><td>eval()<br />manager/includes/document.parser.class.inc.php on line 1005</td><tr><td valign=\"top\">9</td><td>include()<br />manager/includes/document.parser.class.inc.php(1005) : eval()\'d code on line 2</td><tr><td valign=\"top\">10</td><td>My_Gallery_Controller->draw()<br />assets/snippets/pss_gallery/index.php on line 32</td><tr><td valign=\"top\">11</td><td>My_Gallery_Controller->buildGallery()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 13</td><tr><td valign=\"top\">12</td><td>DocumentParser->getDocumentChildren()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 134</td><tr><td valign=\"top\">13</td><td>DBAPI->query()<br />manager/includes/document.parser.class.inc.php on line 2038</td></table>\n');
INSERT INTO `modx_event_log` VALUES ('8','0','1395084285','3','0','0','phpmailer','Could not instantiate mail function.');
INSERT INTO `modx_event_log` VALUES ('9','0','1395084345','3','0','0','Snippet - PSSGallery','<h3 style=\"color:red\">&laquo; MODX Parse Error &raquo;</h3>\n	                <table border=\"0\" cellpadding=\"1\" cellspacing=\"0\">\n	                <tr><td colspan=\"2\">MODX encountered the following error while attempting to parse the requested resource:</td></tr>\n	                <tr><td colspan=\"2\"><b style=\"color:red;\">&laquo; Execution of a query to the database failed - Unknown column \'Array\' in \'where clause\' &raquo;</b></td></tr><tr><td colspan=\"2\"><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;\">SQL &gt; <span id=\"sqlHolder\">SELECT * FROM `gorod`.`modx_pss_gallery` WHERE document_id IN (Array,Array,Array,Array,Array,Array)  </span></div>\n	                </td></tr><tr><td colspan=\"2\"><b>Basic info</b></td></tr><tr><td valign=\"top\" style=\"white-space:nowrap;\">REQUEST_URI : </td><td>/15/</td></tr><tr><td valign=\"top\">Resource : </td><td>[15]<a href=\"http://gorod/index.php?id=15\" target=\"_blank\">test</a></td></tr><tr><td>Current Snippet : </td><td>PSSGallery</td></tr><tr><td>Referer : </td><td></td></tr><tr><td>User Agent : </td><td>Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:27.0) Gecko/20100101 Firefox/27.0</td></tr><tr><td>IP : </td><td>127.0.0.1</td></tr><tr><td colspan=\"2\"><b>Benchmarks</b></td></tr><tr><td>MySQL : </td><td>0.0029 s (6 Requests)</td></tr><tr><td>PHP : </td><td>0.0291 s</td></tr><tr><td>Total : </td><td>0.0320 s</td></tr><tr><td>Memory : </td><td>1.2711715698242 mb</td></tr></table>\n<br /><p><b>Backtrace</b></p>\n<table><tr><td valign=\"top\">1</td><td>DocumentParser->executeParser()<br />index.php on line 140</td><tr><td valign=\"top\">2</td><td>DocumentParser->prepareResponse()<br />manager/includes/document.parser.class.inc.php on line 1568</td><tr><td valign=\"top\">3</td><td>DocumentParser->outputContent()<br />manager/includes/document.parser.class.inc.php on line 1673</td><tr><td valign=\"top\">4</td><td>DocumentParser->parseDocumentSource()<br />manager/includes/document.parser.class.inc.php on line 582</td><tr><td valign=\"top\">5</td><td>DocumentParser->evalSnippets()<br />manager/includes/document.parser.class.inc.php on line 1450</td><tr><td valign=\"top\">6</td><td>DocumentParser->_get_snip_result()<br />manager/includes/document.parser.class.inc.php on line 1061</td><tr><td valign=\"top\">7</td><td>DocumentParser->evalSnippet()<br />manager/includes/document.parser.class.inc.php on line 1147</td><tr><td valign=\"top\">8</td><td>eval()<br />manager/includes/document.parser.class.inc.php on line 1005</td><tr><td valign=\"top\">9</td><td>include()<br />manager/includes/document.parser.class.inc.php(1005) : eval()\'d code on line 2</td><tr><td valign=\"top\">10</td><td>My_Gallery_Controller->draw()<br />assets/snippets/pss_gallery/index.php on line 32</td><tr><td valign=\"top\">11</td><td>My_Gallery_Controller->buildGallery()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 13</td><tr><td valign=\"top\">12</td><td>DBAPI->select()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 137</td><tr><td valign=\"top\">13</td><td>DBAPI->query()<br />manager/includes/extenders/dbapi.mysql.class.inc.php on line 224</td></table>\n');
INSERT INTO `modx_event_log` VALUES ('10','0','1395084345','3','0','0','phpmailer','Could not instantiate mail function.');
INSERT INTO `modx_event_log` VALUES ('11','0','1395084422','3','0','0','Snippet - PSSGallery','<h3 style=\"color:red\">&laquo; MODX Parse Error &raquo;</h3>\n	                <table border=\"0\" cellpadding=\"1\" cellspacing=\"0\">\n	                <tr><td colspan=\"2\">MODX encountered the following error while attempting to parse the requested resource:</td></tr>\n	                <tr><td colspan=\"2\"><b style=\"color:red;\">&laquo; Execution of a query to the database failed - Column \'id\' in where clause is ambiguous &raquo;</b></td></tr><tr><td colspan=\"2\"><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;\">SQL &gt; <span id=\"sqlHolder\">SELECT DISTINCT sc.*\n              FROM `gorod`.`modx_site_content` sc\n              LEFT JOIN `gorod`.`modx_document_groups` dg on dg.document = sc.id\n              WHERE sc.parent = \'3\' AND sc.published=id AND sc.deleted=0 \n              AND (sc.privateweb=0)\n              GROUP BY sc.id  ORDER BY sc.menuindex ASC   </span></div>\n	                </td></tr><tr><td colspan=\"2\"><b>Basic info</b></td></tr><tr><td valign=\"top\" style=\"white-space:nowrap;\">REQUEST_URI : </td><td>/15/</td></tr><tr><td valign=\"top\">Resource : </td><td>[15]<a href=\"http://gorod/index.php?id=15\" target=\"_blank\">test</a></td></tr><tr><td>Current Snippet : </td><td>PSSGallery</td></tr><tr><td>Referer : </td><td></td></tr><tr><td>User Agent : </td><td>Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:27.0) Gecko/20100101 Firefox/27.0</td></tr><tr><td>IP : </td><td>127.0.0.1</td></tr><tr><td colspan=\"2\"><b>Benchmarks</b></td></tr><tr><td>MySQL : </td><td>0.0019 s (5 Requests)</td></tr><tr><td>PHP : </td><td>0.0289 s</td></tr><tr><td>Total : </td><td>0.0308 s</td></tr><tr><td>Memory : </td><td>1.2711715698242 mb</td></tr></table>\n<br /><p><b>Backtrace</b></p>\n<table><tr><td valign=\"top\">1</td><td>DocumentParser->executeParser()<br />index.php on line 140</td><tr><td valign=\"top\">2</td><td>DocumentParser->prepareResponse()<br />manager/includes/document.parser.class.inc.php on line 1568</td><tr><td valign=\"top\">3</td><td>DocumentParser->outputContent()<br />manager/includes/document.parser.class.inc.php on line 1673</td><tr><td valign=\"top\">4</td><td>DocumentParser->parseDocumentSource()<br />manager/includes/document.parser.class.inc.php on line 582</td><tr><td valign=\"top\">5</td><td>DocumentParser->evalSnippets()<br />manager/includes/document.parser.class.inc.php on line 1450</td><tr><td valign=\"top\">6</td><td>DocumentParser->_get_snip_result()<br />manager/includes/document.parser.class.inc.php on line 1061</td><tr><td valign=\"top\">7</td><td>DocumentParser->evalSnippet()<br />manager/includes/document.parser.class.inc.php on line 1147</td><tr><td valign=\"top\">8</td><td>eval()<br />manager/includes/document.parser.class.inc.php on line 1005</td><tr><td valign=\"top\">9</td><td>include()<br />manager/includes/document.parser.class.inc.php(1005) : eval()\'d code on line 2</td><tr><td valign=\"top\">10</td><td>My_Gallery_Controller->draw()<br />assets/snippets/pss_gallery/index.php on line 32</td><tr><td valign=\"top\">11</td><td>My_Gallery_Controller->buildGallery()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 13</td><tr><td valign=\"top\">12</td><td>DocumentParser->getDocumentChildren()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 135</td><tr><td valign=\"top\">13</td><td>DBAPI->query()<br />manager/includes/document.parser.class.inc.php on line 2038</td></table>\n');
INSERT INTO `modx_event_log` VALUES ('12','0','1395084422','3','0','0','phpmailer','Could not instantiate mail function.');
INSERT INTO `modx_event_log` VALUES ('13','0','1395084768','3','0','0','Snippet - PSSGallery','<h3 style=\"color:red\">&laquo; MODX Parse Error &raquo;</h3>\n	                <table border=\"0\" cellpadding=\"1\" cellspacing=\"0\">\n	                <tr><td colspan=\"2\">MODX encountered the following error while attempting to parse the requested resource:</td></tr>\n	                <tr><td colspan=\"2\"><b style=\"color:red;\">&laquo; Execution of a query to the database failed - Column \'id\' in where clause is ambiguous &raquo;</b></td></tr><tr><td colspan=\"2\"><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;\">SQL &gt; <span id=\"sqlHolder\">SELECT DISTINCT sc.*\n              FROM `gorod`.`modx_site_content` sc\n              LEFT JOIN `gorod`.`modx_document_groups` dg on dg.document = sc.id\n              WHERE sc.parent = \'3\' AND sc.published=id AND sc.deleted=0 \n              AND (sc.privateweb=0)\n              GROUP BY sc.id  ORDER BY sc.menuindex ASC   </span></div>\n	                </td></tr><tr><td colspan=\"2\"><b>Basic info</b></td></tr><tr><td valign=\"top\" style=\"white-space:nowrap;\">REQUEST_URI : </td><td>/15/</td></tr><tr><td valign=\"top\">Resource : </td><td>[15]<a href=\"http://gorod/index.php?id=15\" target=\"_blank\">test</a></td></tr><tr><td>Current Snippet : </td><td>PSSGallery</td></tr><tr><td>Referer : </td><td></td></tr><tr><td>User Agent : </td><td>Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:27.0) Gecko/20100101 Firefox/27.0</td></tr><tr><td>IP : </td><td>127.0.0.1</td></tr><tr><td colspan=\"2\"><b>Benchmarks</b></td></tr><tr><td>MySQL : </td><td>0.0019 s (5 Requests)</td></tr><tr><td>PHP : </td><td>0.0319 s</td></tr><tr><td>Total : </td><td>0.0338 s</td></tr><tr><td>Memory : </td><td>1.2711715698242 mb</td></tr></table>\n<br /><p><b>Backtrace</b></p>\n<table><tr><td valign=\"top\">1</td><td>DocumentParser->executeParser()<br />index.php on line 140</td><tr><td valign=\"top\">2</td><td>DocumentParser->prepareResponse()<br />manager/includes/document.parser.class.inc.php on line 1568</td><tr><td valign=\"top\">3</td><td>DocumentParser->outputContent()<br />manager/includes/document.parser.class.inc.php on line 1673</td><tr><td valign=\"top\">4</td><td>DocumentParser->parseDocumentSource()<br />manager/includes/document.parser.class.inc.php on line 582</td><tr><td valign=\"top\">5</td><td>DocumentParser->evalSnippets()<br />manager/includes/document.parser.class.inc.php on line 1450</td><tr><td valign=\"top\">6</td><td>DocumentParser->_get_snip_result()<br />manager/includes/document.parser.class.inc.php on line 1061</td><tr><td valign=\"top\">7</td><td>DocumentParser->evalSnippet()<br />manager/includes/document.parser.class.inc.php on line 1147</td><tr><td valign=\"top\">8</td><td>eval()<br />manager/includes/document.parser.class.inc.php on line 1005</td><tr><td valign=\"top\">9</td><td>include()<br />manager/includes/document.parser.class.inc.php(1005) : eval()\'d code on line 2</td><tr><td valign=\"top\">10</td><td>My_Gallery_Controller->draw()<br />assets/snippets/pss_gallery/index.php on line 32</td><tr><td valign=\"top\">11</td><td>My_Gallery_Controller->buildGallery()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 13</td><tr><td valign=\"top\">12</td><td>DocumentParser->getDocumentChildren()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 135</td><tr><td valign=\"top\">13</td><td>DBAPI->query()<br />manager/includes/document.parser.class.inc.php on line 2038</td></table>\n');
INSERT INTO `modx_event_log` VALUES ('14','0','1395084768','3','0','0','phpmailer','Could not instantiate mail function.');
INSERT INTO `modx_event_log` VALUES ('15','0','1395085058','3','0','0','Snippet - PSSGallery','<h3 style=\"color:red\">&laquo; MODX Parse Error &raquo;</h3>\n	                <table border=\"0\" cellpadding=\"1\" cellspacing=\"0\">\n	                <tr><td colspan=\"2\">MODX encountered the following error while attempting to parse the requested resource:</td></tr>\n	                <tr><td colspan=\"2\"><b style=\"color:red;\">&laquo; Execution of a query to the database failed - Column \'id\' in where clause is ambiguous &raquo;</b></td></tr><tr><td colspan=\"2\"><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;\">SQL &gt; <span id=\"sqlHolder\">SELECT DISTINCT sc.*\n              FROM `gorod`.`modx_site_content` sc\n              LEFT JOIN `gorod`.`modx_document_groups` dg on dg.document = sc.id\n              WHERE sc.parent = \'3\' AND sc.published=id AND sc.deleted=0 \n              AND (sc.privateweb=0)\n              GROUP BY sc.id  ORDER BY sc.menuindex ASC   </span></div>\n	                </td></tr><tr><td colspan=\"2\"><b>Basic info</b></td></tr><tr><td valign=\"top\" style=\"white-space:nowrap;\">REQUEST_URI : </td><td>/15/</td></tr><tr><td valign=\"top\">Resource : </td><td>[15]<a href=\"http://gorod/index.php?id=15\" target=\"_blank\">test</a></td></tr><tr><td>Current Snippet : </td><td>PSSGallery</td></tr><tr><td>Referer : </td><td></td></tr><tr><td>User Agent : </td><td>Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:27.0) Gecko/20100101 Firefox/27.0</td></tr><tr><td>IP : </td><td>127.0.0.1</td></tr><tr><td colspan=\"2\"><b>Benchmarks</b></td></tr><tr><td>MySQL : </td><td>0.0018 s (5 Requests)</td></tr><tr><td>PHP : </td><td>0.0349 s</td></tr><tr><td>Total : </td><td>0.0367 s</td></tr><tr><td>Memory : </td><td>1.2711715698242 mb</td></tr></table>\n<br /><p><b>Backtrace</b></p>\n<table><tr><td valign=\"top\">1</td><td>DocumentParser->executeParser()<br />index.php on line 140</td><tr><td valign=\"top\">2</td><td>DocumentParser->prepareResponse()<br />manager/includes/document.parser.class.inc.php on line 1568</td><tr><td valign=\"top\">3</td><td>DocumentParser->outputContent()<br />manager/includes/document.parser.class.inc.php on line 1673</td><tr><td valign=\"top\">4</td><td>DocumentParser->parseDocumentSource()<br />manager/includes/document.parser.class.inc.php on line 582</td><tr><td valign=\"top\">5</td><td>DocumentParser->evalSnippets()<br />manager/includes/document.parser.class.inc.php on line 1450</td><tr><td valign=\"top\">6</td><td>DocumentParser->_get_snip_result()<br />manager/includes/document.parser.class.inc.php on line 1061</td><tr><td valign=\"top\">7</td><td>DocumentParser->evalSnippet()<br />manager/includes/document.parser.class.inc.php on line 1147</td><tr><td valign=\"top\">8</td><td>eval()<br />manager/includes/document.parser.class.inc.php on line 1005</td><tr><td valign=\"top\">9</td><td>include()<br />manager/includes/document.parser.class.inc.php(1005) : eval()\'d code on line 2</td><tr><td valign=\"top\">10</td><td>My_Gallery_Controller->draw()<br />assets/snippets/pss_gallery/index.php on line 32</td><tr><td valign=\"top\">11</td><td>My_Gallery_Controller->buildGallery()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 13</td><tr><td valign=\"top\">12</td><td>DocumentParser->getDocumentChildren()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 135</td><tr><td valign=\"top\">13</td><td>DBAPI->query()<br />manager/includes/document.parser.class.inc.php on line 2038</td></table>\n');
INSERT INTO `modx_event_log` VALUES ('16','0','1395085058','3','0','0','phpmailer','Could not instantiate mail function.');
INSERT INTO `modx_event_log` VALUES ('17','0','1395085393','3','0','0','Snippet - PSSGallery','<h3 style=\"color:red\">&laquo; MODX Parse Error &raquo;</h3>\n	                <table border=\"0\" cellpadding=\"1\" cellspacing=\"0\">\n	                <tr><td colspan=\"2\">MODX encountered the following error while attempting to parse the requested resource:</td></tr>\n	                <tr><td colspan=\"2\"><b style=\"color:red;\">&laquo; Execution of a query to the database failed - Column \'id\' in where clause is ambiguous &raquo;</b></td></tr><tr><td colspan=\"2\"><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;\">SQL &gt; <span id=\"sqlHolder\">SELECT DISTINCT sc.*\n              FROM `gorod`.`modx_site_content` sc\n              LEFT JOIN `gorod`.`modx_document_groups` dg on dg.document = sc.id\n              WHERE sc.parent = \'3\' AND sc.published=id AND sc.deleted=0 \n              AND (sc.privateweb=0)\n              GROUP BY sc.id  ORDER BY sc.menuindex ASC   </span></div>\n	                </td></tr><tr><td colspan=\"2\"><b>Basic info</b></td></tr><tr><td valign=\"top\" style=\"white-space:nowrap;\">REQUEST_URI : </td><td>/15/</td></tr><tr><td valign=\"top\">Resource : </td><td>[15]<a href=\"http://gorod/index.php?id=15\" target=\"_blank\">test</a></td></tr><tr><td>Current Snippet : </td><td>PSSGallery</td></tr><tr><td>Referer : </td><td></td></tr><tr><td>User Agent : </td><td>Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:27.0) Gecko/20100101 Firefox/27.0</td></tr><tr><td>IP : </td><td>127.0.0.1</td></tr><tr><td colspan=\"2\"><b>Benchmarks</b></td></tr><tr><td>MySQL : </td><td>0.0023 s (5 Requests)</td></tr><tr><td>PHP : </td><td>0.0373 s</td></tr><tr><td>Total : </td><td>0.0396 s</td></tr><tr><td>Memory : </td><td>1.2711715698242 mb</td></tr></table>\n<br /><p><b>Backtrace</b></p>\n<table><tr><td valign=\"top\">1</td><td>DocumentParser->executeParser()<br />index.php on line 140</td><tr><td valign=\"top\">2</td><td>DocumentParser->prepareResponse()<br />manager/includes/document.parser.class.inc.php on line 1568</td><tr><td valign=\"top\">3</td><td>DocumentParser->outputContent()<br />manager/includes/document.parser.class.inc.php on line 1673</td><tr><td valign=\"top\">4</td><td>DocumentParser->parseDocumentSource()<br />manager/includes/document.parser.class.inc.php on line 582</td><tr><td valign=\"top\">5</td><td>DocumentParser->evalSnippets()<br />manager/includes/document.parser.class.inc.php on line 1450</td><tr><td valign=\"top\">6</td><td>DocumentParser->_get_snip_result()<br />manager/includes/document.parser.class.inc.php on line 1061</td><tr><td valign=\"top\">7</td><td>DocumentParser->evalSnippet()<br />manager/includes/document.parser.class.inc.php on line 1147</td><tr><td valign=\"top\">8</td><td>eval()<br />manager/includes/document.parser.class.inc.php on line 1005</td><tr><td valign=\"top\">9</td><td>include()<br />manager/includes/document.parser.class.inc.php(1005) : eval()\'d code on line 2</td><tr><td valign=\"top\">10</td><td>My_Gallery_Controller->draw()<br />assets/snippets/pss_gallery/index.php on line 32</td><tr><td valign=\"top\">11</td><td>My_Gallery_Controller->buildGallery()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 13</td><tr><td valign=\"top\">12</td><td>DocumentParser->getDocumentChildren()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 135</td><tr><td valign=\"top\">13</td><td>DBAPI->query()<br />manager/includes/document.parser.class.inc.php on line 2038</td></table>\n');
INSERT INTO `modx_event_log` VALUES ('18','0','1395085393','3','0','0','phpmailer','Could not instantiate mail function.');
INSERT INTO `modx_event_log` VALUES ('19','0','1395085670','3','0','0','Snippet - PSSGallery','<h3 style=\"color:red\">&laquo; MODX Parse Error &raquo;</h3>\n	                <table border=\"0\" cellpadding=\"1\" cellspacing=\"0\">\n	                <tr><td colspan=\"2\">MODX encountered the following error while attempting to parse the requested resource:</td></tr>\n	                <tr><td colspan=\"2\"><b style=\"color:red;\">&laquo; Execution of a query to the database failed - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'parent AND sc.deleted=0 \n              AND (sc.privateweb=0)\n              GROUP\' at line 4 &raquo;</b></td></tr><tr><td colspan=\"2\"><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;\">SQL &gt; <span id=\"sqlHolder\">SELECT DISTINCT sc.*\n              FROM `gorod`.`modx_site_content` sc\n              LEFT JOIN `gorod`.`modx_document_groups` dg on dg.document = sc.id\n              WHERE sc.parent = \'3\' AND sc.published=id,parent AND sc.deleted=0 \n              AND (sc.privateweb=0)\n              GROUP BY sc.id  ORDER BY sc.menuindex ASC   </span></div>\n	                </td></tr><tr><td colspan=\"2\"><b>Basic info</b></td></tr><tr><td valign=\"top\" style=\"white-space:nowrap;\">REQUEST_URI : </td><td>/15/</td></tr><tr><td valign=\"top\">Resource : </td><td>[15]<a href=\"http://gorod/index.php?id=15\" target=\"_blank\">test</a></td></tr><tr><td>Current Snippet : </td><td>PSSGallery</td></tr><tr><td>Referer : </td><td></td></tr><tr><td>User Agent : </td><td>Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:27.0) Gecko/20100101 Firefox/27.0</td></tr><tr><td>IP : </td><td>127.0.0.1</td></tr><tr><td colspan=\"2\"><b>Benchmarks</b></td></tr><tr><td>MySQL : </td><td>0.0020 s (5 Requests)</td></tr><tr><td>PHP : </td><td>0.0286 s</td></tr><tr><td>Total : </td><td>0.0306 s</td></tr><tr><td>Memory : </td><td>1.2711715698242 mb</td></tr></table>\n<br /><p><b>Backtrace</b></p>\n<table><tr><td valign=\"top\">1</td><td>DocumentParser->executeParser()<br />index.php on line 140</td><tr><td valign=\"top\">2</td><td>DocumentParser->prepareResponse()<br />manager/includes/document.parser.class.inc.php on line 1568</td><tr><td valign=\"top\">3</td><td>DocumentParser->outputContent()<br />manager/includes/document.parser.class.inc.php on line 1673</td><tr><td valign=\"top\">4</td><td>DocumentParser->parseDocumentSource()<br />manager/includes/document.parser.class.inc.php on line 582</td><tr><td valign=\"top\">5</td><td>DocumentParser->evalSnippets()<br />manager/includes/document.parser.class.inc.php on line 1450</td><tr><td valign=\"top\">6</td><td>DocumentParser->_get_snip_result()<br />manager/includes/document.parser.class.inc.php on line 1061</td><tr><td valign=\"top\">7</td><td>DocumentParser->evalSnippet()<br />manager/includes/document.parser.class.inc.php on line 1147</td><tr><td valign=\"top\">8</td><td>eval()<br />manager/includes/document.parser.class.inc.php on line 1005</td><tr><td valign=\"top\">9</td><td>include()<br />manager/includes/document.parser.class.inc.php(1005) : eval()\'d code on line 2</td><tr><td valign=\"top\">10</td><td>My_Gallery_Controller->draw()<br />assets/snippets/pss_gallery/index.php on line 32</td><tr><td valign=\"top\">11</td><td>My_Gallery_Controller->buildGallery()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 13</td><tr><td valign=\"top\">12</td><td>DocumentParser->getDocumentChildren()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 135</td><tr><td valign=\"top\">13</td><td>DBAPI->query()<br />manager/includes/document.parser.class.inc.php on line 2038</td></table>\n');
INSERT INTO `modx_event_log` VALUES ('20','0','1395085670','3','0','0','phpmailer','Could not instantiate mail function.');
INSERT INTO `modx_event_log` VALUES ('21','0','1395085783','3','0','0','Snippet - PSSGallery','<h3 style=\"color:red\">&laquo; MODX Parse Error &raquo;</h3>\n	                <table border=\"0\" cellpadding=\"1\" cellspacing=\"0\">\n	                <tr><td colspan=\"2\">MODX encountered the following error while attempting to parse the requested resource:</td></tr>\n	                <tr><td colspan=\"2\"><b style=\"color:red;\">&laquo; Execution of a query to the database failed - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'AND sc.deleted=0 \n              AND (sc.privateweb=0)\n              GROUP BY sc.\' at line 4 &raquo;</b></td></tr><tr><td colspan=\"2\"><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;\">SQL &gt; <span id=\"sqlHolder\">SELECT DISTINCT sc.*\n              FROM `gorod`.`modx_site_content` sc\n              LEFT JOIN `gorod`.`modx_document_groups` dg on dg.document = sc.id\n              WHERE sc.parent = \'3\' AND sc.published= AND sc.deleted=0 \n              AND (sc.privateweb=0)\n              GROUP BY sc.id  ORDER BY sc.menuindex ASC   </span></div>\n	                </td></tr><tr><td colspan=\"2\"><b>Basic info</b></td></tr><tr><td valign=\"top\" style=\"white-space:nowrap;\">REQUEST_URI : </td><td>/15/</td></tr><tr><td valign=\"top\">Resource : </td><td>[15]<a href=\"http://gorod/index.php?id=15\" target=\"_blank\">test</a></td></tr><tr><td>Current Snippet : </td><td>PSSGallery</td></tr><tr><td>Referer : </td><td></td></tr><tr><td>User Agent : </td><td>Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:27.0) Gecko/20100101 Firefox/27.0</td></tr><tr><td>IP : </td><td>127.0.0.1</td></tr><tr><td colspan=\"2\"><b>Benchmarks</b></td></tr><tr><td>MySQL : </td><td>0.0020 s (5 Requests)</td></tr><tr><td>PHP : </td><td>0.0298 s</td></tr><tr><td>Total : </td><td>0.0318 s</td></tr><tr><td>Memory : </td><td>1.2711715698242 mb</td></tr></table>\n<br /><p><b>Backtrace</b></p>\n<table><tr><td valign=\"top\">1</td><td>DocumentParser->executeParser()<br />index.php on line 140</td><tr><td valign=\"top\">2</td><td>DocumentParser->prepareResponse()<br />manager/includes/document.parser.class.inc.php on line 1568</td><tr><td valign=\"top\">3</td><td>DocumentParser->outputContent()<br />manager/includes/document.parser.class.inc.php on line 1673</td><tr><td valign=\"top\">4</td><td>DocumentParser->parseDocumentSource()<br />manager/includes/document.parser.class.inc.php on line 582</td><tr><td valign=\"top\">5</td><td>DocumentParser->evalSnippets()<br />manager/includes/document.parser.class.inc.php on line 1450</td><tr><td valign=\"top\">6</td><td>DocumentParser->_get_snip_result()<br />manager/includes/document.parser.class.inc.php on line 1061</td><tr><td valign=\"top\">7</td><td>DocumentParser->evalSnippet()<br />manager/includes/document.parser.class.inc.php on line 1147</td><tr><td valign=\"top\">8</td><td>eval()<br />manager/includes/document.parser.class.inc.php on line 1005</td><tr><td valign=\"top\">9</td><td>include()<br />manager/includes/document.parser.class.inc.php(1005) : eval()\'d code on line 2</td><tr><td valign=\"top\">10</td><td>My_Gallery_Controller->draw()<br />assets/snippets/pss_gallery/index.php on line 32</td><tr><td valign=\"top\">11</td><td>My_Gallery_Controller->buildGallery()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 13</td><tr><td valign=\"top\">12</td><td>DocumentParser->getDocumentChildren()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 135</td><tr><td valign=\"top\">13</td><td>DBAPI->query()<br />manager/includes/document.parser.class.inc.php on line 2038</td></table>\n');
INSERT INTO `modx_event_log` VALUES ('22','0','1395085783','3','0','0','phpmailer','Could not instantiate mail function.');
INSERT INTO `modx_event_log` VALUES ('23','0','1395085801','3','0','0','Snippet - PSSGallery','<h3 style=\"color:red\">&laquo; MODX Parse Error &raquo;</h3>\n	                <table border=\"0\" cellpadding=\"1\" cellspacing=\"0\">\n	                <tr><td colspan=\"2\">MODX encountered the following error while attempting to parse the requested resource:</td></tr>\n	                <tr><td colspan=\"2\"><b style=\"color:red;\">&laquo; Execution of a query to the database failed - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'* AND sc.deleted=0 \n              AND (sc.privateweb=0)\n              GROUP BY s\' at line 4 &raquo;</b></td></tr><tr><td colspan=\"2\"><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;\">SQL &gt; <span id=\"sqlHolder\">SELECT DISTINCT sc.*\n              FROM `gorod`.`modx_site_content` sc\n              LEFT JOIN `gorod`.`modx_document_groups` dg on dg.document = sc.id\n              WHERE sc.parent = \'3\' AND sc.published=* AND sc.deleted=0 \n              AND (sc.privateweb=0)\n              GROUP BY sc.id  ORDER BY sc.menuindex ASC   </span></div>\n	                </td></tr><tr><td colspan=\"2\"><b>Basic info</b></td></tr><tr><td valign=\"top\" style=\"white-space:nowrap;\">REQUEST_URI : </td><td>/15/</td></tr><tr><td valign=\"top\">Resource : </td><td>[15]<a href=\"http://gorod/index.php?id=15\" target=\"_blank\">test</a></td></tr><tr><td>Current Snippet : </td><td>PSSGallery</td></tr><tr><td>Referer : </td><td></td></tr><tr><td>User Agent : </td><td>Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:27.0) Gecko/20100101 Firefox/27.0</td></tr><tr><td>IP : </td><td>127.0.0.1</td></tr><tr><td colspan=\"2\"><b>Benchmarks</b></td></tr><tr><td>MySQL : </td><td>0.0020 s (5 Requests)</td></tr><tr><td>PHP : </td><td>0.0288 s</td></tr><tr><td>Total : </td><td>0.0308 s</td></tr><tr><td>Memory : </td><td>1.2711715698242 mb</td></tr></table>\n<br /><p><b>Backtrace</b></p>\n<table><tr><td valign=\"top\">1</td><td>DocumentParser->executeParser()<br />index.php on line 140</td><tr><td valign=\"top\">2</td><td>DocumentParser->prepareResponse()<br />manager/includes/document.parser.class.inc.php on line 1568</td><tr><td valign=\"top\">3</td><td>DocumentParser->outputContent()<br />manager/includes/document.parser.class.inc.php on line 1673</td><tr><td valign=\"top\">4</td><td>DocumentParser->parseDocumentSource()<br />manager/includes/document.parser.class.inc.php on line 582</td><tr><td valign=\"top\">5</td><td>DocumentParser->evalSnippets()<br />manager/includes/document.parser.class.inc.php on line 1450</td><tr><td valign=\"top\">6</td><td>DocumentParser->_get_snip_result()<br />manager/includes/document.parser.class.inc.php on line 1061</td><tr><td valign=\"top\">7</td><td>DocumentParser->evalSnippet()<br />manager/includes/document.parser.class.inc.php on line 1147</td><tr><td valign=\"top\">8</td><td>eval()<br />manager/includes/document.parser.class.inc.php on line 1005</td><tr><td valign=\"top\">9</td><td>include()<br />manager/includes/document.parser.class.inc.php(1005) : eval()\'d code on line 2</td><tr><td valign=\"top\">10</td><td>My_Gallery_Controller->draw()<br />assets/snippets/pss_gallery/index.php on line 32</td><tr><td valign=\"top\">11</td><td>My_Gallery_Controller->buildGallery()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 13</td><tr><td valign=\"top\">12</td><td>DocumentParser->getDocumentChildren()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 135</td><tr><td valign=\"top\">13</td><td>DBAPI->query()<br />manager/includes/document.parser.class.inc.php on line 2038</td></table>\n');
INSERT INTO `modx_event_log` VALUES ('24','0','1395085801','3','0','0','phpmailer','Could not instantiate mail function.');
INSERT INTO `modx_event_log` VALUES ('25','0','1395085940','3','0','0','Snippet - PSSGallery','<h3 style=\"color:red\">&laquo; MODX Parse Error &raquo;</h3>\n	                <table border=\"0\" cellpadding=\"1\" cellspacing=\"0\">\n	                <tr><td colspan=\"2\">MODX encountered the following error while attempting to parse the requested resource:</td></tr>\n	                <tr><td colspan=\"2\"><b style=\"color:red;\">&laquo; Execution of a query to the database failed - Unknown column \'sc.0\' in \'field list\' &raquo;</b></td></tr><tr><td colspan=\"2\"><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;\">SQL &gt; <span id=\"sqlHolder\">SELECT DISTINCT sc.0\n              FROM `gorod`.`modx_site_content` sc\n              LEFT JOIN `gorod`.`modx_document_groups` dg on dg.document = sc.id\n              WHERE sc.parent = \'3\' AND sc.published=3 AND sc.deleted=1 AND id\n              AND (sc.privateweb=0)\n              GROUP BY sc.id  ORDER BY sc.menuindex ASC   </span></div>\n	                </td></tr><tr><td colspan=\"2\"><b>Basic info</b></td></tr><tr><td valign=\"top\" style=\"white-space:nowrap;\">REQUEST_URI : </td><td>/15/</td></tr><tr><td valign=\"top\">Resource : </td><td>[15]<a href=\"http://gorod/index.php?id=15\" target=\"_blank\">test</a></td></tr><tr><td>Current Snippet : </td><td>PSSGallery</td></tr><tr><td>Referer : </td><td></td></tr><tr><td>User Agent : </td><td>Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:27.0) Gecko/20100101 Firefox/27.0</td></tr><tr><td>IP : </td><td>127.0.0.1</td></tr><tr><td colspan=\"2\"><b>Benchmarks</b></td></tr><tr><td>MySQL : </td><td>0.0052 s (5 Requests)</td></tr><tr><td>PHP : </td><td>0.0289 s</td></tr><tr><td>Total : </td><td>0.0341 s</td></tr><tr><td>Memory : </td><td>1.2711715698242 mb</td></tr></table>\n<br /><p><b>Backtrace</b></p>\n<table><tr><td valign=\"top\">1</td><td>DocumentParser->executeParser()<br />index.php on line 140</td><tr><td valign=\"top\">2</td><td>DocumentParser->prepareResponse()<br />manager/includes/document.parser.class.inc.php on line 1568</td><tr><td valign=\"top\">3</td><td>DocumentParser->outputContent()<br />manager/includes/document.parser.class.inc.php on line 1673</td><tr><td valign=\"top\">4</td><td>DocumentParser->parseDocumentSource()<br />manager/includes/document.parser.class.inc.php on line 582</td><tr><td valign=\"top\">5</td><td>DocumentParser->evalSnippets()<br />manager/includes/document.parser.class.inc.php on line 1450</td><tr><td valign=\"top\">6</td><td>DocumentParser->_get_snip_result()<br />manager/includes/document.parser.class.inc.php on line 1061</td><tr><td valign=\"top\">7</td><td>DocumentParser->evalSnippet()<br />manager/includes/document.parser.class.inc.php on line 1147</td><tr><td valign=\"top\">8</td><td>eval()<br />manager/includes/document.parser.class.inc.php on line 1005</td><tr><td valign=\"top\">9</td><td>include()<br />manager/includes/document.parser.class.inc.php(1005) : eval()\'d code on line 2</td><tr><td valign=\"top\">10</td><td>My_Gallery_Controller->draw()<br />assets/snippets/pss_gallery/index.php on line 32</td><tr><td valign=\"top\">11</td><td>My_Gallery_Controller->buildGallery()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 13</td><tr><td valign=\"top\">12</td><td>DocumentParser->getDocumentChildren()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 134</td><tr><td valign=\"top\">13</td><td>DBAPI->query()<br />manager/includes/document.parser.class.inc.php on line 2038</td></table>\n');
INSERT INTO `modx_event_log` VALUES ('26','0','1395085940','3','0','0','phpmailer','Could not instantiate mail function.');
INSERT INTO `modx_event_log` VALUES ('27','0','1395085954','3','0','0','Snippet - PSSGallery','<h3 style=\"color:red\">&laquo; MODX Parse Error &raquo;</h3>\n	                <table border=\"0\" cellpadding=\"1\" cellspacing=\"0\">\n	                <tr><td colspan=\"2\">MODX encountered the following error while attempting to parse the requested resource:</td></tr>\n	                <tr><td colspan=\"2\"><b style=\"color:red;\">&laquo; Execution of a query to the database failed - Unknown column \'Array\' in \'where clause\' &raquo;</b></td></tr><tr><td colspan=\"2\"><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;\">SQL &gt; <span id=\"sqlHolder\">SELECT * FROM `gorod`.`modx_pss_gallery` WHERE document_id IN (Array,Array,Array,Array,Array,Array)  </span></div>\n	                </td></tr><tr><td colspan=\"2\"><b>Basic info</b></td></tr><tr><td valign=\"top\" style=\"white-space:nowrap;\">REQUEST_URI : </td><td>/15/</td></tr><tr><td valign=\"top\">Resource : </td><td>[15]<a href=\"http://gorod/index.php?id=15\" target=\"_blank\">test</a></td></tr><tr><td>Current Snippet : </td><td>PSSGallery</td></tr><tr><td>Referer : </td><td></td></tr><tr><td>User Agent : </td><td>Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:27.0) Gecko/20100101 Firefox/27.0</td></tr><tr><td>IP : </td><td>127.0.0.1</td></tr><tr><td colspan=\"2\"><b>Benchmarks</b></td></tr><tr><td>MySQL : </td><td>0.0021 s (6 Requests)</td></tr><tr><td>PHP : </td><td>0.0348 s</td></tr><tr><td>Total : </td><td>0.0368 s</td></tr><tr><td>Memory : </td><td>1.2711715698242 mb</td></tr></table>\n<br /><p><b>Backtrace</b></p>\n<table><tr><td valign=\"top\">1</td><td>DocumentParser->executeParser()<br />index.php on line 140</td><tr><td valign=\"top\">2</td><td>DocumentParser->prepareResponse()<br />manager/includes/document.parser.class.inc.php on line 1568</td><tr><td valign=\"top\">3</td><td>DocumentParser->outputContent()<br />manager/includes/document.parser.class.inc.php on line 1673</td><tr><td valign=\"top\">4</td><td>DocumentParser->parseDocumentSource()<br />manager/includes/document.parser.class.inc.php on line 582</td><tr><td valign=\"top\">5</td><td>DocumentParser->evalSnippets()<br />manager/includes/document.parser.class.inc.php on line 1450</td><tr><td valign=\"top\">6</td><td>DocumentParser->_get_snip_result()<br />manager/includes/document.parser.class.inc.php on line 1061</td><tr><td valign=\"top\">7</td><td>DocumentParser->evalSnippet()<br />manager/includes/document.parser.class.inc.php on line 1147</td><tr><td valign=\"top\">8</td><td>eval()<br />manager/includes/document.parser.class.inc.php on line 1005</td><tr><td valign=\"top\">9</td><td>include()<br />manager/includes/document.parser.class.inc.php(1005) : eval()\'d code on line 2</td><tr><td valign=\"top\">10</td><td>My_Gallery_Controller->draw()<br />assets/snippets/pss_gallery/index.php on line 32</td><tr><td valign=\"top\">11</td><td>My_Gallery_Controller->buildGallery()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 13</td><tr><td valign=\"top\">12</td><td>DBAPI->select()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 136</td><tr><td valign=\"top\">13</td><td>DBAPI->query()<br />manager/includes/extenders/dbapi.mysql.class.inc.php on line 224</td></table>\n');
INSERT INTO `modx_event_log` VALUES ('28','0','1395085954','3','0','0','phpmailer','Could not instantiate mail function.');
INSERT INTO `modx_event_log` VALUES ('29','0','1395085987','3','0','0','Snippet - PSSGallery','<h3 style=\"color:red\">&laquo; MODX Parse Error &raquo;</h3>\n	                <table border=\"0\" cellpadding=\"1\" cellspacing=\"0\">\n	                <tr><td colspan=\"2\">MODX encountered the following error while attempting to parse the requested resource:</td></tr>\n	                <tr><td colspan=\"2\"><b style=\"color:red;\">&laquo; Execution of a query to the database failed - Unknown column \'Array\' in \'where clause\' &raquo;</b></td></tr><tr><td colspan=\"2\"><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;\">SQL &gt; <span id=\"sqlHolder\">SELECT * FROM `gorod`.`modx_pss_gallery` WHERE document_id IN (Array,Array,Array,Array,Array,Array)  </span></div>\n	                </td></tr><tr><td colspan=\"2\"><b>Basic info</b></td></tr><tr><td valign=\"top\" style=\"white-space:nowrap;\">REQUEST_URI : </td><td>/15/</td></tr><tr><td valign=\"top\">Resource : </td><td>[15]<a href=\"http://gorod/index.php?id=15\" target=\"_blank\">test</a></td></tr><tr><td>Current Snippet : </td><td>PSSGallery</td></tr><tr><td>Referer : </td><td></td></tr><tr><td>User Agent : </td><td>Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:27.0) Gecko/20100101 Firefox/27.0</td></tr><tr><td>IP : </td><td>127.0.0.1</td></tr><tr><td colspan=\"2\"><b>Benchmarks</b></td></tr><tr><td>MySQL : </td><td>0.0020 s (6 Requests)</td></tr><tr><td>PHP : </td><td>0.0283 s</td></tr><tr><td>Total : </td><td>0.0303 s</td></tr><tr><td>Memory : </td><td>1.2711715698242 mb</td></tr></table>\n<br /><p><b>Backtrace</b></p>\n<table><tr><td valign=\"top\">1</td><td>DocumentParser->executeParser()<br />index.php on line 140</td><tr><td valign=\"top\">2</td><td>DocumentParser->prepareResponse()<br />manager/includes/document.parser.class.inc.php on line 1568</td><tr><td valign=\"top\">3</td><td>DocumentParser->outputContent()<br />manager/includes/document.parser.class.inc.php on line 1673</td><tr><td valign=\"top\">4</td><td>DocumentParser->parseDocumentSource()<br />manager/includes/document.parser.class.inc.php on line 582</td><tr><td valign=\"top\">5</td><td>DocumentParser->evalSnippets()<br />manager/includes/document.parser.class.inc.php on line 1450</td><tr><td valign=\"top\">6</td><td>DocumentParser->_get_snip_result()<br />manager/includes/document.parser.class.inc.php on line 1061</td><tr><td valign=\"top\">7</td><td>DocumentParser->evalSnippet()<br />manager/includes/document.parser.class.inc.php on line 1147</td><tr><td valign=\"top\">8</td><td>eval()<br />manager/includes/document.parser.class.inc.php on line 1005</td><tr><td valign=\"top\">9</td><td>include()<br />manager/includes/document.parser.class.inc.php(1005) : eval()\'d code on line 2</td><tr><td valign=\"top\">10</td><td>My_Gallery_Controller->draw()<br />assets/snippets/pss_gallery/index.php on line 32</td><tr><td valign=\"top\">11</td><td>My_Gallery_Controller->buildGallery()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 13</td><tr><td valign=\"top\">12</td><td>DBAPI->select()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 136</td><tr><td valign=\"top\">13</td><td>DBAPI->query()<br />manager/includes/extenders/dbapi.mysql.class.inc.php on line 224</td></table>\n');
INSERT INTO `modx_event_log` VALUES ('30','0','1395085987','3','0','0','phpmailer','Could not instantiate mail function.');
INSERT INTO `modx_event_log` VALUES ('31','0','1395086485','3','0','0','Snippet - PSSGallery','<h3 style=\"color:red\">&laquo; MODX Parse Error &raquo;</h3>\n	                <table border=\"0\" cellpadding=\"1\" cellspacing=\"0\">\n	                <tr><td colspan=\"2\">MODX encountered the following error while attempting to parse the requested resource:</td></tr>\n	                <tr><td colspan=\"2\"><b style=\"color:red;\">&laquo; PHP Parse Error &raquo;</b></td></tr><tr><td colspan=\"2\"><b>PHP error debug</b></td></tr><tr><td colspan=\"2\"><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;\">Error : Cannot use a scalar value as an array</div></td></tr><tr><td valign=\"top\">ErrorType[num] : </td><td>WARNING[2]</td></tr><tr><td>File : </td><td>/var/www/gorod/assets/snippets/pss_gallery/classes/My_Gallery_Controller.php</td></tr><tr><td>Line : </td><td>149</td></tr><tr><td>Source : </td><td>					$val[\'document_id\'] = $key;\n</td></tr><tr><td colspan=\"2\"><b>Basic info</b></td></tr><tr><td valign=\"top\" style=\"white-space:nowrap;\">REQUEST_URI : </td><td>/15/</td></tr><tr><td valign=\"top\">Resource : </td><td>[15]<a href=\"http://gorod/index.php?id=15\" target=\"_blank\">test</a></td></tr><tr><td>Current Snippet : </td><td>PSSGallery</td></tr><tr><td>Referer : </td><td></td></tr><tr><td>User Agent : </td><td>Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:27.0) Gecko/20100101 Firefox/27.0</td></tr><tr><td>IP : </td><td>127.0.0.1</td></tr><tr><td colspan=\"2\"><b>Benchmarks</b></td></tr><tr><td>MySQL : </td><td>0.0038 s (7 Requests)</td></tr><tr><td>PHP : </td><td>0.0369 s</td></tr><tr><td>Total : </td><td>0.0407 s</td></tr><tr><td>Memory : </td><td>1.2711715698242 mb</td></tr></table>\n<br /><p><b>Backtrace</b></p>\n<table><tr><td valign=\"top\">1</td><td>DocumentParser->executeParser()<br />index.php on line 140</td><tr><td valign=\"top\">2</td><td>DocumentParser->prepareResponse()<br />manager/includes/document.parser.class.inc.php on line 1568</td><tr><td valign=\"top\">3</td><td>DocumentParser->outputContent()<br />manager/includes/document.parser.class.inc.php on line 1673</td><tr><td valign=\"top\">4</td><td>DocumentParser->parseDocumentSource()<br />manager/includes/document.parser.class.inc.php on line 582</td><tr><td valign=\"top\">5</td><td>DocumentParser->evalSnippets()<br />manager/includes/document.parser.class.inc.php on line 1450</td><tr><td valign=\"top\">6</td><td>DocumentParser->_get_snip_result()<br />manager/includes/document.parser.class.inc.php on line 1061</td><tr><td valign=\"top\">7</td><td>DocumentParser->evalSnippet()<br />manager/includes/document.parser.class.inc.php on line 1147</td><tr><td valign=\"top\">8</td><td>eval()<br />manager/includes/document.parser.class.inc.php on line 1005</td><tr><td valign=\"top\">9</td><td>include()<br />manager/includes/document.parser.class.inc.php(1005) : eval()\'d code on line 2</td><tr><td valign=\"top\">10</td><td>My_Gallery_Controller->draw()<br />assets/snippets/pss_gallery/index.php on line 32</td><tr><td valign=\"top\">11</td><td>My_Gallery_Controller->buildGallery()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 13</td></table>\n');
INSERT INTO `modx_event_log` VALUES ('32','0','1395086485','3','0','0','phpmailer','Could not instantiate mail function.');
INSERT INTO `modx_event_log` VALUES ('33','0','1395166287','3','0','0','Snippet - PSSGallery','<h3 style=\"color:red\">&laquo; MODX Parse Error &raquo;</h3>\n	                <table border=\"0\" cellpadding=\"1\" cellspacing=\"0\">\n	                <tr><td colspan=\"2\">MODX encountered the following error while attempting to parse the requested resource:</td></tr>\n	                <tr><td colspan=\"2\"><b style=\"color:red;\">&laquo; PHP Parse Error &raquo;</b></td></tr><tr><td colspan=\"2\"><b>PHP error debug</b></td></tr><tr><td colspan=\"2\"><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;\">Error : array_rand() expects parameter 1 to be array, null given</div></td></tr><tr><td valign=\"top\">ErrorType[num] : </td><td>WARNING[2]</td></tr><tr><td>File : </td><td>/var/www/gorod/assets/snippets/pss_gallery/classes/My_Gallery_Controller.php</td></tr><tr><td>Line : </td><td>165</td></tr><tr><td>Source : </td><td>                $images[] = array_rand($tmp);\n</td></tr><tr><td colspan=\"2\"><b>Basic info</b></td></tr><tr><td valign=\"top\" style=\"white-space:nowrap;\">REQUEST_URI : </td><td>/15/</td></tr><tr><td valign=\"top\">Resource : </td><td>[15]<a href=\"http://gorod/index.php?id=15\" target=\"_blank\">test</a></td></tr><tr><td>Current Snippet : </td><td>PSSGallery</td></tr><tr><td>Referer : </td><td></td></tr><tr><td>User Agent : </td><td>Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:27.0) Gecko/20100101 Firefox/27.0</td></tr><tr><td>IP : </td><td>127.0.0.1</td></tr><tr><td colspan=\"2\"><b>Benchmarks</b></td></tr><tr><td>MySQL : </td><td>0.0023 s (7 Requests)</td></tr><tr><td>PHP : </td><td>0.0586 s</td></tr><tr><td>Total : </td><td>0.0609 s</td></tr><tr><td>Memory : </td><td>1.2715682983398 mb</td></tr></table>\n<br /><p><b>Backtrace</b></p>\n<table><tr><td valign=\"top\">1</td><td>DocumentParser->executeParser()<br />index.php on line 140</td><tr><td valign=\"top\">2</td><td>DocumentParser->prepareResponse()<br />manager/includes/document.parser.class.inc.php on line 1568</td><tr><td valign=\"top\">3</td><td>DocumentParser->outputContent()<br />manager/includes/document.parser.class.inc.php on line 1673</td><tr><td valign=\"top\">4</td><td>DocumentParser->parseDocumentSource()<br />manager/includes/document.parser.class.inc.php on line 582</td><tr><td valign=\"top\">5</td><td>DocumentParser->evalSnippets()<br />manager/includes/document.parser.class.inc.php on line 1450</td><tr><td valign=\"top\">6</td><td>DocumentParser->_get_snip_result()<br />manager/includes/document.parser.class.inc.php on line 1061</td><tr><td valign=\"top\">7</td><td>DocumentParser->evalSnippet()<br />manager/includes/document.parser.class.inc.php on line 1147</td><tr><td valign=\"top\">8</td><td>eval()<br />manager/includes/document.parser.class.inc.php on line 1005</td><tr><td valign=\"top\">9</td><td>include()<br />manager/includes/document.parser.class.inc.php(1005) : eval()\'d code on line 2</td><tr><td valign=\"top\">10</td><td>My_Gallery_Controller->draw()<br />assets/snippets/pss_gallery/index.php on line 32</td><tr><td valign=\"top\">11</td><td>My_Gallery_Controller->buildGallery()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 13</td><tr><td valign=\"top\">12</td><td>My_Gallery_Controller->randArray()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 143</td><tr><td valign=\"top\">13</td><td>array_rand()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 165</td></table>\n');
INSERT INTO `modx_event_log` VALUES ('34','0','1395166287','3','0','0','phpmailer','Could not instantiate mail function.');
INSERT INTO `modx_event_log` VALUES ('35','0','1395170267','3','0','0','Snippet - PSSGallery','<h3 style=\"color:red\">&laquo; MODX Parse Error &raquo;</h3>\n	                <table border=\"0\" cellpadding=\"1\" cellspacing=\"0\">\n	                <tr><td colspan=\"2\">MODX encountered the following error while attempting to parse the requested resource:</td></tr>\n	                <tr><td colspan=\"2\"><b style=\"color:red;\">&laquo; Execution of a query to the database failed - Unknown column \'Array\' in \'where clause\' &raquo;</b></td></tr><tr><td colspan=\"2\"><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;\">SQL &gt; <span id=\"sqlHolder\">SELECT * FROM `gorod`.`modx_pss_gallery` WHERE visible=1 AND document_id IN (Array,6,7,8,9,10,11)  </span></div>\n	                </td></tr><tr><td colspan=\"2\"><b>Basic info</b></td></tr><tr><td valign=\"top\" style=\"white-space:nowrap;\">REQUEST_URI : </td><td>/15/</td></tr><tr><td valign=\"top\">Resource : </td><td>[15]<a href=\"http://gorod/index.php?id=15\" target=\"_blank\">test</a></td></tr><tr><td>Current Snippet : </td><td>PSSGallery</td></tr><tr><td>Referer : </td><td></td></tr><tr><td>User Agent : </td><td>Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:27.0) Gecko/20100101 Firefox/27.0</td></tr><tr><td>IP : </td><td>127.0.0.1</td></tr><tr><td colspan=\"2\"><b>Benchmarks</b></td></tr><tr><td>MySQL : </td><td>0.0022 s (6 Requests)</td></tr><tr><td>PHP : </td><td>0.0333 s</td></tr><tr><td>Total : </td><td>0.0355 s</td></tr><tr><td>Memory : </td><td>1.2715682983398 mb</td></tr></table>\n<br /><p><b>Backtrace</b></p>\n<table><tr><td valign=\"top\">1</td><td>DocumentParser->executeParser()<br />index.php on line 140</td><tr><td valign=\"top\">2</td><td>DocumentParser->prepareResponse()<br />manager/includes/document.parser.class.inc.php on line 1568</td><tr><td valign=\"top\">3</td><td>DocumentParser->outputContent()<br />manager/includes/document.parser.class.inc.php on line 1673</td><tr><td valign=\"top\">4</td><td>DocumentParser->parseDocumentSource()<br />manager/includes/document.parser.class.inc.php on line 582</td><tr><td valign=\"top\">5</td><td>DocumentParser->evalSnippets()<br />manager/includes/document.parser.class.inc.php on line 1450</td><tr><td valign=\"top\">6</td><td>DocumentParser->_get_snip_result()<br />manager/includes/document.parser.class.inc.php on line 1061</td><tr><td valign=\"top\">7</td><td>DocumentParser->evalSnippet()<br />manager/includes/document.parser.class.inc.php on line 1147</td><tr><td valign=\"top\">8</td><td>eval()<br />manager/includes/document.parser.class.inc.php on line 1005</td><tr><td valign=\"top\">9</td><td>include()<br />manager/includes/document.parser.class.inc.php(1005) : eval()\'d code on line 2</td><tr><td valign=\"top\">10</td><td>My_Gallery_Controller->draw()<br />assets/snippets/pss_gallery/index.php on line 32</td><tr><td valign=\"top\">11</td><td>My_Gallery_Controller->buildGallery()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 218</td><tr><td valign=\"top\">12</td><td>DBAPI->select()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 75</td><tr><td valign=\"top\">13</td><td>DBAPI->query()<br />manager/includes/extenders/dbapi.mysql.class.inc.php on line 224</td></table>\n');
INSERT INTO `modx_event_log` VALUES ('36','0','1395170267','3','0','0','phpmailer','Could not instantiate mail function.');
INSERT INTO `modx_event_log` VALUES ('37','0','1395250753','3','0','0','Snippet - PSSGallery','<h3 style=\"color:red\">&laquo; MODX Parse Error &raquo;</h3>\n	                <table border=\"0\" cellpadding=\"1\" cellspacing=\"0\">\n	                <tr><td colspan=\"2\">MODX encountered the following error while attempting to parse the requested resource:</td></tr>\n	                <tr><td colspan=\"2\"><b style=\"color:red;\">&laquo; PHP Parse Error &raquo;</b></td></tr><tr><td colspan=\"2\"><b>PHP error debug</b></td></tr><tr><td colspan=\"2\"><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;\">Error : unlink(/var/www/gorod/assets/images/gallery/preview_*): No such file or directory</div></td></tr><tr><td valign=\"top\">ErrorType[num] : </td><td>WARNING[2]</td></tr><tr><td>File : </td><td>/var/www/gorod/assets/snippets/pss_gallery/classes/My_Gallery_Controller.php</td></tr><tr><td>Line : </td><td>140</td></tr><tr><td>Source : </td><td>        unlink($folder.&quot;preview_*&quot;);\n</td></tr><tr><td colspan=\"2\"><b>Basic info</b></td></tr><tr><td valign=\"top\" style=\"white-space:nowrap;\">REQUEST_URI : </td><td>/15/</td></tr><tr><td valign=\"top\">Resource : </td><td>[15]<a href=\"http://gorod/index.php?id=15\" target=\"_blank\">test</a></td></tr><tr><td>Current Snippet : </td><td>PSSGallery</td></tr><tr><td>Referer : </td><td></td></tr><tr><td>User Agent : </td><td>Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:27.0) Gecko/20100101 Firefox/27.0</td></tr><tr><td>IP : </td><td>127.0.0.1</td></tr><tr><td colspan=\"2\"><b>Benchmarks</b></td></tr><tr><td>MySQL : </td><td>0.0054 s (8 Requests)</td></tr><tr><td>PHP : </td><td>0.0311 s</td></tr><tr><td>Total : </td><td>0.0366 s</td></tr><tr><td>Memory : </td><td>1.5217056274414 mb</td></tr></table>\n<br /><p><b>Backtrace</b></p>\n<table><tr><td valign=\"top\">1</td><td>DocumentParser->executeParser()<br />index.php on line 140</td><tr><td valign=\"top\">2</td><td>DocumentParser->prepareResponse()<br />manager/includes/document.parser.class.inc.php on line 1568</td><tr><td valign=\"top\">3</td><td>DocumentParser->outputContent()<br />manager/includes/document.parser.class.inc.php on line 1673</td><tr><td valign=\"top\">4</td><td>DocumentParser->parseDocumentSource()<br />manager/includes/document.parser.class.inc.php on line 582</td><tr><td valign=\"top\">5</td><td>DocumentParser->evalSnippets()<br />manager/includes/document.parser.class.inc.php on line 1450</td><tr><td valign=\"top\">6</td><td>DocumentParser->_get_snip_result()<br />manager/includes/document.parser.class.inc.php on line 1061</td><tr><td valign=\"top\">7</td><td>DocumentParser->evalSnippet()<br />manager/includes/document.parser.class.inc.php on line 1147</td><tr><td valign=\"top\">8</td><td>eval()<br />manager/includes/document.parser.class.inc.php on line 1005</td><tr><td valign=\"top\">9</td><td>include()<br />manager/includes/document.parser.class.inc.php(1005) : eval()\'d code on line 2</td><tr><td valign=\"top\">10</td><td>My_Gallery_Controller->draw()<br />assets/snippets/pss_gallery/index.php on line 32</td><tr><td valign=\"top\">11</td><td>My_Gallery_Controller->makePrview()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 267</td><tr><td valign=\"top\">12</td><td>unlink()<br />assets/snippets/pss_gallery/classes/My_Gallery_Controller.php on line 140</td></table>\n');
INSERT INTO `modx_event_log` VALUES ('38','0','1395250753','3','0','0','phpmailer','Could not instantiate mail function.');

# --------------------------------------------------------

#
# Table structure for table `modx_keyword_xref`
#

DROP TABLE IF EXISTS `modx_keyword_xref`;
CREATE TABLE `modx_keyword_xref` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `keyword_id` int(11) NOT NULL DEFAULT '0',
  KEY `content_id` (`content_id`),
  KEY `keyword_id` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Cross reference bewteen keywords and content';

#
# Dumping data for table `modx_keyword_xref`
#


# --------------------------------------------------------

#
# Table structure for table `modx_manager_log`
#

DROP TABLE IF EXISTS `modx_manager_log`;
CREATE TABLE `modx_manager_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `timestamp` int(20) NOT NULL DEFAULT '0',
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `action` int(10) NOT NULL DEFAULT '0',
  `itemid` varchar(10) DEFAULT '0',
  `itemname` varchar(255) DEFAULT NULL,
  `message` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=820 DEFAULT CHARSET=utf8 COMMENT='Contains a record of user interaction.';

#
# Dumping data for table `modx_manager_log`
#

INSERT INTO `modx_manager_log` VALUES ('1','1393611357','1','admin','58','-','MODx','Logged in');
INSERT INTO `modx_manager_log` VALUES ('2','1393611361','1','admin','17','-','-','Editing settings');
INSERT INTO `modx_manager_log` VALUES ('3','1393611727','1','admin','30','-','-','Saving settings');
INSERT INTO `modx_manager_log` VALUES ('4','1393611929','1','admin','17','-','-','Editing settings');
INSERT INTO `modx_manager_log` VALUES ('5','1393611937','1','admin','30','-','-','Saving settings');
INSERT INTO `modx_manager_log` VALUES ('6','1393611950','1','admin','17','-','-','Editing settings');
INSERT INTO `modx_manager_log` VALUES ('7','1393611959','1','admin','30','-','-','Saving settings');
INSERT INTO `modx_manager_log` VALUES ('8','1393611997','1','admin','3','1','MODX CMS Install Success','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('9','1393612012','1','admin','27','1','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('10','1393612027','1','admin','5','1','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('11','1393612029','1','admin','3','1','MODX CMS Install Success','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('12','1394731316','1','admin','58','-','MODx','Logged in');
INSERT INTO `modx_manager_log` VALUES ('13','1394731331','1','admin','3','1','MODX CMS Install Success','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('14','1394731344','1','admin','3','1','MODX CMS Install Success','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('15','1394731348','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('16','1394731364','1','admin','16','3','Minimal Template','Editing template');
INSERT INTO `modx_manager_log` VALUES ('17','1394731373','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('18','1394731375','1','admin','19','-','New template','Creating a new template');
INSERT INTO `modx_manager_log` VALUES ('19','1394732192','1','admin','20','-','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('20','1394732192','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('21','1394732218','1','admin','77','-','New Chunk','Creating a new Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('22','1394732628','1','admin','79','-','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('23','1394732628','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('24','1394732751','1','admin','78','2','HEAD','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('25','1394732872','1','admin','79','2','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('26','1394732872','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('27','1394732879','1','admin','77','-','New Chunk','Creating a new Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('28','1394732950','1','admin','79','-','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('29','1394732950','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('30','1394732961','1','admin','78','3','ROTATOR','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('31','1394732966','1','admin','79','3','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('32','1394732967','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('33','1394732992','1','admin','78','3','ROTATOR','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('34','1394732999','1','admin','79','3','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('35','1394732999','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('36','1394733006','1','admin','16','5','Window','Editing template');
INSERT INTO `modx_manager_log` VALUES ('37','1394733011','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('38','1394733015','1','admin','78','2','HEAD','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('39','1394733026','1','admin','79','2','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('40','1394733027','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('41','1394733081','1','admin','77','-','New Chunk','Creating a new Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('42','1394733163','1','admin','79','-','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('43','1394733163','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('44','1394733193','1','admin','78','2','HEAD','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('45','1394733206','1','admin','79','2','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('46','1394733206','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('47','1394733216','1','admin','77','-','New Chunk','Creating a new Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('48','1394733302','1','admin','79','-','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('49','1394733302','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('50','1394733405','1','admin','77','-','New Chunk','Creating a new Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('51','1394733638','1','admin','79','-','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('52','1394733638','1','admin','78','6','pageTile','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('53','1394734015','1','admin','79','6','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('54','1394734015','1','admin','78','6','pageTile','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('55','1394734022','1','admin','79','6','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('56','1394734022','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('57','1394734084','1','admin','77','-','New Chunk','Creating a new Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('58','1394734296','1','admin','79','-','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('59','1394734296','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('60','1394734299','1','admin','77','-','New Chunk','Creating a new Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('61','1394734424','1','admin','79','-','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('62','1394734424','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('63','1394734850','1','admin','78','8','tpl-menuItem','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('64','1394734869','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('65','1394734873','1','admin','78','7','topMenu','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('66','1394735027','1','admin','79','7','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('67','1394735027','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('68','1394735034','1','admin','78','8','tpl-menuItem','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('69','1394735039','1','admin','97','8','-','Duplicate Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('70','1394735039','1','admin','78','9','Duplicate of tpl-menuItem','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('71','1394735078','1','admin','79','9','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('72','1394735078','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('73','1394735137','1','admin','77','-','New Chunk','Creating a new Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('74','1394736827','1','admin','79','-','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('75','1394736827','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('76','1394736836','1','admin','23','-','New snippet','Creating a new Snippet');
INSERT INTO `modx_manager_log` VALUES ('77','1394737400','1','admin','24','-','-','Saving Snippet');
INSERT INTO `modx_manager_log` VALUES ('78','1394737400','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('79','1394907860','1','admin','58','-','MODx','Logged in');
INSERT INTO `modx_manager_log` VALUES ('80','1394907865','1','admin','4','-','-','Creating a resource');
INSERT INTO `modx_manager_log` VALUES ('81','1394907869','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('82','1394907879','1','admin','23','-','New snippet','Creating a new Snippet');
INSERT INTO `modx_manager_log` VALUES ('83','1394907953','1','admin','24','-','-','Saving Snippet');
INSERT INTO `modx_manager_log` VALUES ('84','1394907953','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('85','1394908022','1','admin','101','-','New Plugin','Create new plugin');
INSERT INTO `modx_manager_log` VALUES ('86','1394908072','1','admin','103','-','-','Saving plugin');
INSERT INTO `modx_manager_log` VALUES ('87','1394908072','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('88','1394908076','1','admin','300','-','New Template Variable','Create Template Variable');
INSERT INTO `modx_manager_log` VALUES ('89','1394908146','1','admin','302','-','-','Save Template Variable');
INSERT INTO `modx_manager_log` VALUES ('90','1394908146','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('91','1394909236','1','admin','3','1','MODX CMS Install Success','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('92','1394909244','1','admin','27','1','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('93','1394909263','1','admin','27','1','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('94','1394910813','1','admin','27','1','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('95','1394910994','1','admin','5','1','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('96','1394910995','1','admin','3','1','MODX CMS Install Success','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('97','1394911095','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('98','1394911099','1','admin','16','5','Window','Editing template');
INSERT INTO `modx_manager_log` VALUES ('99','1394911115','1','admin','20','5','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('100','1394911116','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('101','1394911155','1','admin','3','1','MODX CMS Install Success','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('102','1394911159','1','admin','27','1','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('103','1394911170','1','admin','5','1','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('104','1394911172','1','admin','3','1','MODX CMS Install Success','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('105','1394911173','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('106','1394911183','1','admin','16','5','Window','Editing template');
INSERT INTO `modx_manager_log` VALUES ('107','1394911204','1','admin','20','5','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('108','1394911204','1','admin','16','5','Window','Editing template');
INSERT INTO `modx_manager_log` VALUES ('109','1394911361','1','admin','3','1','MODX CMS Install Success','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('110','1394911364','1','admin','27','1','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('111','1394911581','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('112','1394911583','1','admin','16','5','Window','Editing template');
INSERT INTO `modx_manager_log` VALUES ('113','1394911598','1','admin','20','5','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('114','1394911598','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('115','1394958598','1','admin','58','-','MODx','Logged in');
INSERT INTO `modx_manager_log` VALUES ('116','1394958608','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('117','1394958611','1','admin','16','5','Window','Editing template');
INSERT INTO `modx_manager_log` VALUES ('118','1394958920','1','admin','20','5','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('119','1394958920','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('120','1394958929','1','admin','3','1','MODX CMS Install Success','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('121','1394958933','1','admin','27','1','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('122','1394959038','1','admin','5','1','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('123','1394959038','1','admin','27','1','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('124','1394959408','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('125','1394959414','1','admin','16','5','Window','Editing template');
INSERT INTO `modx_manager_log` VALUES ('126','1394959755','1','admin','20','5','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('127','1394959755','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('128','1394959760','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('129','1394959764','1','admin','78','2','HEAD','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('130','1394960024','1','admin','79','2','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('131','1394960025','1','admin','78','2','HEAD','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('132','1394960651','1','admin','79','2','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('133','1394960651','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('134','1394960659','1','admin','16','5','Window','Editing template');
INSERT INTO `modx_manager_log` VALUES ('135','1394960864','1','admin','20','5','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('136','1394960864','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('137','1394960866','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('138','1394960871','1','admin','77','-','New Chunk','Creating a new Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('139','1394960946','1','admin','76','-','New Chunk','Element management');
INSERT INTO `modx_manager_log` VALUES ('140','1394960951','1','admin','78','7','topMenu','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('141','1394960965','1','admin','79','7','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('142','1394960966','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('143','1394960991','1','admin','4','-','-','Creating a resource');
INSERT INTO `modx_manager_log` VALUES ('144','1394961135','1','admin','5','-','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('145','1394961137','1','admin','3','2','Новости','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('146','1394961154','1','admin','3','1','Главная','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('147','1394961161','1','admin','3','2','Новости','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('148','1394961167','1','admin','94','2','-','Duplicate resource');
INSERT INTO `modx_manager_log` VALUES ('149','1394961167','1','admin','3','3','Duplicate of Новости','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('150','1394961173','1','admin','3','3','Duplicate of Новости','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('151','1394961178','1','admin','27','3','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('152','1394961210','1','admin','5','3','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('153','1394961210','1','admin','27','3','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('154','1394961218','1','admin','94','3','-','Duplicate resource');
INSERT INTO `modx_manager_log` VALUES ('155','1394961219','1','admin','3','4','Duplicate of Проекты','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('156','1394961221','1','admin','27','4','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('157','1394961272','1','admin','5','4','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('158','1394961273','1','admin','3','4','Контакты','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('159','1394961278','1','admin','94','4','-','Duplicate resource');
INSERT INTO `modx_manager_log` VALUES ('160','1394961279','1','admin','3','5','Duplicate of Контакты','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('161','1394961282','1','admin','27','5','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('162','1394961318','1','admin','5','5','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('163','1394961320','1','admin','3','5','Продажа-Аренда','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('164','1394961322','1','admin','3','3','Проекты','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('165','1394961328','1','admin','27','3','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('166','1394961334','1','admin','5','3','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('167','1394961336','1','admin','3','3','Проекты','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('168','1394961338','1','admin','3','4','Контакты','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('169','1394961350','1','admin','27','4','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('170','1394961355','1','admin','5','4','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('171','1394961357','1','admin','3','4','Контакты','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('172','1394961369','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('173','1394961380','1','admin','78','7','TOPMENU','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('174','1394961431','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('175','1394961439','1','admin','78','9','tpl-menuItemCurrent','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('176','1394961469','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('177','1394961472','1','admin','78','7','TOPMENU','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('178','1394961624','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('179','1394961631','1','admin','78','9','tpl-menuItemCurrent','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('180','1394961645','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('181','1394961647','1','admin','78','7','TOPMENU','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('182','1394961661','1','admin','79','7','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('183','1394961661','1','admin','78','7','TOPMENU','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('184','1394961698','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('185','1394961705','1','admin','78','7','TOPMENU','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('186','1394961719','1','admin','79','7','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('187','1394961719','1','admin','78','7','TOPMENU','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('188','1394961743','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('189','1394961747','1','admin','78','8','tpl-menuItem','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('190','1394961850','1','admin','79','8','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('191','1394961850','1','admin','78','8','tpl-menuItem','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('192','1394961872','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('193','1394961875','1','admin','78','9','tpl-menuItemCurrent','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('194','1394961889','1','admin','79','9','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('195','1394961889','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('196','1394961892','1','admin','78','7','TOPMENU','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('197','1394962010','1','admin','79','7','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('198','1394962010','1','admin','78','7','TOPMENU','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('199','1394962161','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('200','1394962164','1','admin','78','2','HEAD','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('201','1394962297','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('202','1394962302','1','admin','16','5','Window','Editing template');
INSERT INTO `modx_manager_log` VALUES ('203','1394962369','1','admin','20','5','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('204','1394962369','1','admin','16','5','Window','Editing template');
INSERT INTO `modx_manager_log` VALUES ('205','1394963025','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('206','1394963030','1','admin','78','5','FOOTER','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('207','1394963058','1','admin','79','5','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('208','1394963058','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('209','1394963063','1','admin','16','5','Window','Editing template');
INSERT INTO `modx_manager_log` VALUES ('210','1394963105','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('211','1394963109','1','admin','78','4','HEADER','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('212','1394963131','1','admin','79','4','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('213','1394963131','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('214','1394963135','1','admin','16','5','Window','Editing template');
INSERT INTO `modx_manager_log` VALUES ('215','1394963193','1','admin','20','5','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('216','1394963193','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('217','1394963263','1','admin','16','5','Window','Editing template');
INSERT INTO `modx_manager_log` VALUES ('218','1394964414','1','admin','20','5','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('219','1394964414','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('220','1394964419','1','admin','77','-','New Chunk','Creating a new Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('221','1394964498','1','admin','79','-','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('222','1394964499','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('223','1394964515','1','admin','16','5','Window','Editing template');
INSERT INTO `modx_manager_log` VALUES ('224','1394980212','1','admin','20','5','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('225','1394980213','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('226','1394980217','1','admin','78','4','HEADER','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('227','1394980232','1','admin','79','4','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('228','1394980233','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('229','1394980311','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('230','1394987639','1','admin','3','3','Проекты','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('231','1394987644','1','admin','4','-','-','Creating a resource');
INSERT INTO `modx_manager_log` VALUES ('232','1394987820','1','admin','4','-','-','Creating a resource');
INSERT INTO `modx_manager_log` VALUES ('233','1394987831','1','admin','5','-','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('234','1394987833','1','admin','3','6','Авиа Плаза','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('235','1394987837','1','admin','4','-','-','Creating a resource');
INSERT INTO `modx_manager_log` VALUES ('236','1394987891','1','admin','5','-','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('237','1394987893','1','admin','3','7','Виктория Плаза','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('238','1394987897','1','admin','4','-','-','Creating a resource');
INSERT INTO `modx_manager_log` VALUES ('239','1394988009','1','admin','4','-','-','Creating a resource');
INSERT INTO `modx_manager_log` VALUES ('240','1394988018','1','admin','3','3','Проекты','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('241','1394988034','1','admin','4','-','-','Creating a resource');
INSERT INTO `modx_manager_log` VALUES ('242','1394988067','1','admin','5','-','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('243','1394988068','1','admin','3','8','Торговый комплекс','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('244','1394988076','1','admin','3','8','Торговый комплекс','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('245','1394988083','1','admin','3','8','Торговый комплекс','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('246','1394988088','1','admin','27','8','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('247','1394988092','1','admin','27','8','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('248','1394988100','1','admin','4','-','-','Creating a resource');
INSERT INTO `modx_manager_log` VALUES ('249','1394988226','1','admin','4','-','-','Creating a resource');
INSERT INTO `modx_manager_log` VALUES ('250','1394988238','1','admin','3','3','Проекты','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('251','1394988262','1','admin','3','3','Проекты','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('252','1394988264','1','admin','3','8','Торговый комплекс','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('253','1394988267','1','admin','3','8','Торговый комплекс','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('254','1394988267','1','admin','3','8','Торговый комплекс','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('255','1394988272','1','admin','27','8','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('256','1394988279','1','admin','3','3','Проекты','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('257','1394988283','1','admin','4','-','-','Creating a resource');
INSERT INTO `modx_manager_log` VALUES ('258','1394988331','1','admin','4','-','-','Creating a resource');
INSERT INTO `modx_manager_log` VALUES ('259','1394988336','1','admin','5','-','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('260','1394988337','1','admin','3','9','Горная резиденция','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('261','1394988348','1','admin','3','3','Проекты','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('262','1394988353','1','admin','27','3','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('263','1394988362','1','admin','3','3','Проекты','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('264','1394988365','1','admin','4','-','-','Creating a resource');
INSERT INTO `modx_manager_log` VALUES ('265','1394988451','1','admin','5','-','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('266','1394988453','1','admin','3','10','Калининградская \"Рублевка\"','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('267','1394988458','1','admin','3','3','Проекты','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('268','1394988466','1','admin','4','-','-','Creating a resource');
INSERT INTO `modx_manager_log` VALUES ('269','1394988484','1','admin','4','-','-','Creating a resource');
INSERT INTO `modx_manager_log` VALUES ('270','1394988488','1','admin','5','-','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('271','1394988490','1','admin','3','11','Барвиха Хиллс','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('272','1394988534','1','admin','4','-','-','Creating a resource');
INSERT INTO `modx_manager_log` VALUES ('273','1394988609','1','admin','4','-','-','Creating a resource');
INSERT INTO `modx_manager_log` VALUES ('274','1394988656','1','admin','5','-','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('275','1394988658','1','admin','3','12','Закрытие Олимпиады','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('276','1394988665','1','admin','4','-','-','Creating a resource');
INSERT INTO `modx_manager_log` VALUES ('277','1394988716','1','admin','5','-','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('278','1394988718','1','admin','3','13','Премьер-министр Крыма признал референдум состоявшимся','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('279','1394988731','1','admin','4','-','-','Creating a resource');
INSERT INTO `modx_manager_log` VALUES ('280','1394988756','1','admin','5','-','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('281','1394988757','1','admin','3','14','Украина решила заняться переделом советского имущества','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('282','1394988852','1','admin','3','6','Авиа Плаза','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('283','1394988879','1','admin','27','6','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('284','1394988961','1','admin','3','7','Виктория Плаза','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('285','1394988964','1','admin','27','7','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('286','1394988977','1','admin','27','7','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('287','1394989005','1','admin','3','8','Торговый комплекс','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('288','1394989007','1','admin','27','8','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('289','1394989012','1','admin','27','8','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('290','1394989047','1','admin','3','9','Горная резиденция','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('291','1394989053','1','admin','4','-','-','Creating a resource');
INSERT INTO `modx_manager_log` VALUES ('292','1394989059','1','admin','3','9','Горная резиденция','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('293','1394989063','1','admin','27','9','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('294','1394989091','1','admin','3','10','Калининградская \"Рублевка\"','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('295','1394989094','1','admin','27','10','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('296','1394989099','1','admin','27','10','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('297','1394989171','1','admin','3','11','Барвиха Хиллс','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('298','1394989176','1','admin','3','10','Калининградская \"Рублевка\"','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('299','1394989180','1','admin','27','10','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('300','1394989186','1','admin','27','10','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('301','1394989195','1','admin','5','10','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('302','1394989197','1','admin','3','10','Калининградская \"Рублевка\"','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('303','1394989199','1','admin','3','11','Барвиха Хиллс','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('304','1394989204','1','admin','27','11','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('305','1394989239','1','admin','5','11','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('306','1394989241','1','admin','3','11','Барвиха Хиллс','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('307','1394989243','1','admin','3','9','Горная резиденция','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('308','1394989245','1','admin','27','9','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('309','1394989252','1','admin','5','9','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('310','1394989254','1','admin','3','8','Торговый комплекс','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('311','1394989254','1','admin','3','9','Горная резиденция','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('312','1394989256','1','admin','27','9','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('313','1394989266','1','admin','5','9','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('314','1394989268','1','admin','3','9','Горная резиденция','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('315','1394989270','1','admin','3','8','Торговый комплекс','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('316','1394989276','1','admin','27','8','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('317','1394989288','1','admin','27','8','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('318','1394989296','1','admin','5','8','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('319','1394989298','1','admin','3','8','Торговый комплекс','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('320','1394989301','1','admin','3','7','Виктория Плаза','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('321','1394989305','1','admin','27','7','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('322','1394989309','1','admin','27','7','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('323','1394989314','1','admin','5','7','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('324','1394989316','1','admin','3','7','Виктория Плаза','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('325','1394989319','1','admin','3','6','Авиа Плаза','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('326','1394989322','1','admin','27','6','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('327','1394989395','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('328','1394989402','1','admin','16','5','Window','Editing template');
INSERT INTO `modx_manager_log` VALUES ('329','1394989422','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('330','1394989427','1','admin','78','11','ASIDE','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('331','1394989587','1','admin','79','11','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('332','1394989587','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('333','1394989591','1','admin','77','-','New Chunk','Creating a new Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('334','1394989647','1','admin','79','-','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('335','1394989647','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('336','1394989652','1','admin','78','12','tpl-projectItem','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('337','1394989657','1','admin','97','12','-','Duplicate Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('338','1394989657','1','admin','78','13','Duplicate of tpl-projectItem','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('339','1394989747','1','admin','79','13','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('340','1394989747','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('341','1394989754','1','admin','78','7','TOPMENU','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('342','1394989773','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('343','1394989777','1','admin','78','11','ASIDE','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('344','1394989814','1','admin','79','11','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('345','1394989814','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('346','1394989868','1','admin','78','7','TOPMENU','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('347','1394989932','1','admin','79','7','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('348','1394989932','1','admin','78','7','TOPMENU','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('349','1394989969','1','admin','79','7','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('350','1394989969','1','admin','78','7','TOPMENU','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('351','1394989993','1','admin','79','7','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('352','1394989994','1','admin','78','7','TOPMENU','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('353','1394990022','1','admin','3','6','Авиа Плаза','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('354','1394990025','1','admin','27','6','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('355','1394990111','1','admin','3','3','Проекты','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('356','1394990114','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('357','1394990119','1','admin','78','11','ASIDE','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('358','1394990191','1','admin','79','11','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('359','1394990192','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('360','1394990195','1','admin','78','11','ASIDE','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('361','1394990347','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('362','1394990353','1','admin','16','5','Window','Editing template');
INSERT INTO `modx_manager_log` VALUES ('363','1394990359','1','admin','96','5','-','Duplicate Template');
INSERT INTO `modx_manager_log` VALUES ('364','1394990359','1','admin','16','6','Duplicate of Window','Editing template');
INSERT INTO `modx_manager_log` VALUES ('365','1394990368','1','admin','20','6','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('366','1394990369','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('367','1394990372','1','admin','16','5','Window','Editing template');
INSERT INTO `modx_manager_log` VALUES ('368','1394990852','1','admin','20','5','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('369','1394990853','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('370','1394990854','1','admin','3','1','Главная','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('371','1394990858','1','admin','27','1','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('372','1394991036','1','admin','5','1','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('373','1394991038','1','admin','3','1','Главная','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('374','1394991049','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('375','1394991054','1','admin','16','5','Window','Editing template');
INSERT INTO `modx_manager_log` VALUES ('376','1394991103','1','admin','20','5','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('377','1394991103','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('378','1394991107','1','admin','77','-','New Chunk','Creating a new Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('379','1394991254','1','admin','79','-','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('380','1394991254','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('381','1394991260','1','admin','77','-','New Chunk','Creating a new Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('382','1394991900','1','admin','79','-','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('383','1394991900','1','admin','78','15','tpl-newsItem','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('384','1394992190','1','admin','79','15','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('385','1394992190','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('386','1394992203','1','admin','78','15','tpl-newsItem','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('387','1394992231','1','admin','79','15','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('388','1394992231','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('389','1394992237','1','admin','78','14','LAST_NEWS','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('390','1394992255','1','admin','79','14','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('391','1394992256','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('392','1394992368','1','admin','78','14','LAST_NEWS','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('393','1394992384','1','admin','79','14','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('394','1394992384','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('395','1394992389','1','admin','3','2','Новости','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('396','1394992392','1','admin','3','12','Закрытие Олимпиады','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('397','1394992396','1','admin','27','12','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('398','1394992451','1','admin','5','12','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('399','1394992453','1','admin','3','12','Закрытие Олимпиады','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('400','1394992454','1','admin','3','13','Премьер-министр Крыма признал референдум состоявшимся','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('401','1394992456','1','admin','27','13','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('402','1394992496','1','admin','5','13','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('403','1394992498','1','admin','3','13','Референдум в Крыму','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('404','1394992498','1','admin','3','14','Украина решила заняться переделом советского имущества','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('405','1394992506','1','admin','27','14','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('406','1394992537','1','admin','5','14','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('407','1394992538','1','admin','3','14','Распределение имущества','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('408','1394993073','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('409','1394993087','1','admin','78','15','tpl-cutNewsItem','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('410','1394993092','1','admin','97','15','-','Duplicate Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('411','1394993092','1','admin','78','16','Duplicate of tpl-cutNewsItem','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('412','1394993136','1','admin','79','16','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('413','1394993136','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('414','1394993142','1','admin','78','14','LAST_NEWS','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('415','1394993151','1','admin','79','14','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('416','1394993151','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('417','1394993654','1','admin','3','1','Главная','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('418','1394993659','1','admin','4','-','-','Creating a resource');
INSERT INTO `modx_manager_log` VALUES ('419','1394993665','1','admin','4','-','-','Creating a resource');
INSERT INTO `modx_manager_log` VALUES ('420','1394993781','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('421','1394993786','1','admin','77','-','New Chunk','Creating a new Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('422','1394994025','1','admin','79','-','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('423','1394994025','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('424','1394994038','1','admin','78','17','tpl-getOneThumb','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('425','1394994046','1','admin','79','17','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('426','1394994046','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('427','1394994053','1','admin','3','1','Главная','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('428','1394994058','1','admin','4','-','-','Creating a resource');
INSERT INTO `modx_manager_log` VALUES ('429','1394994172','1','admin','5','-','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('430','1394994174','1','admin','3','15','test','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('431','1394994177','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('432','1394994181','1','admin','77','-','New Chunk','Creating a new Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('433','1394994187','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('434','1394994190','1','admin','78','10','tpl-imageItem','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('435','1394994293','1','admin','79','10','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('436','1394994293','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('437','1394994308','1','admin','78','10','tpl-image','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('438','1394994324','1','admin','79','10','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('439','1394994325','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('440','1394994331','1','admin','78','17','tpl-getOneThumb','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('441','1394994340','1','admin','79','17','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('442','1394994340','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('443','1394994364','1','admin','78','17','tpl-getOneThumb','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('444','1394994383','1','admin','79','17','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('445','1394994383','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('446','1394994385','1','admin','3','15','test','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('447','1394994388','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('448','1394994436','1','admin','5','15','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('449','1394994436','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('450','1394994536','1','admin','5','15','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('451','1394994537','1','admin','3','15','test','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('452','1394994539','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('453','1394994543','1','admin','78','17','tpl-getOneThumb','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('454','1394994621','1','admin','79','17','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('455','1394994621','1','admin','78','17','tpl-getOneThumb','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('456','1394994667','1','admin','79','17','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('457','1394994667','1','admin','78','17','tpl-getOneThumb','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('458','1394994683','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('459','1394994690','1','admin','16','5','MainWin','Editing template');
INSERT INTO `modx_manager_log` VALUES ('460','1394994723','1','admin','3','15','test','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('461','1394994726','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('462','1394994745','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('463','1394994756','1','admin','78','17','tpl-getOneThumb','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('464','1394994768','1','admin','3','15','test','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('465','1394994770','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('466','1394994776','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('467','1394994812','1','admin','5','15','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('468','1394994814','1','admin','3','15','test','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('469','1394994815','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('470','1394994834','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('471','1394994879','1','admin','5','15','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('472','1394994880','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('473','1394994897','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('474','1394994920','1','admin','5','15','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('475','1394994921','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('476','1394994925','1','admin','5','15','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('477','1394994925','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('478','1394995004','1','admin','5','15','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('479','1394995004','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('480','1394995035','1','admin','5','15','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('481','1394995035','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('482','1394995068','1','admin','3','1','Главная','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('483','1394995071','1','admin','27','1','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('484','1394995109','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('485','1394995114','1','admin','16','5','MainWin','Editing template');
INSERT INTO `modx_manager_log` VALUES ('486','1394995137','1','admin','3','15','test','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('487','1394995139','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('488','1394995164','1','admin','5','15','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('489','1394995164','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('490','1394995284','1','admin','5','15','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('491','1394995285','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('492','1394995302','1','admin','5','15','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('493','1394995302','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('494','1394995869','1','admin','5','15','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('495','1394995869','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('496','1394997041','1','admin','5','15','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('497','1394997042','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('498','1394998061','1','admin','3','6','Авиа Плаза','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('499','1394998068','1','admin','27','6','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('500','1394998853','1','admin','3','15','test','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('501','1394998857','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('502','1394998869','1','admin','5','15','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('503','1394998871','1','admin','3','15','test','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('504','1394999123','1','admin','3','15','test','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('505','1394999128','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('506','1394999138','1','admin','5','15','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('507','1394999138','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('508','1394999283','1','admin','5','15','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('509','1394999283','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('510','1394999291','1','admin','5','15','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('511','1394999292','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('512','1394999354','1','admin','5','15','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('513','1394999356','1','admin','3','15','test','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('514','1394999361','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('515','1394999367','1','admin','78','17','tpl-getOneThumb','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('516','1394999407','1','admin','79','17','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('517','1394999407','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('518','1394999439','1','admin','78','17','tpl-getOneThumb','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('519','1394999464','1','admin','79','17','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('520','1394999464','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('521','1394999847','1','admin','78','17','tpl-getOneThumb','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('522','1394999856','1','admin','3','15','test','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('523','1394999858','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('524','1394999907','1','admin','5','15','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('525','1394999907','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('526','1394999972','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('527','1394999976','1','admin','78','17','tpl-getOneThumb','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('528','1394999987','1','admin','3','15','test','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('529','1394999990','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('530','1395000001','1','admin','5','15','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('531','1395000003','1','admin','3','15','test','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('532','1395000020','1','admin','3','15','test','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('533','1395000027','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('534','1395000036','1','admin','5','15','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('535','1395000038','1','admin','3','15','test','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('536','1395000041','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('537','1395000044','1','admin','78','17','tpl-getOneThumb','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('538','1395000063','1','admin','79','17','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('539','1395000064','1','admin','78','17','tpl-getOneThumb','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('540','1395000098','1','admin','79','17','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('541','1395000098','1','admin','78','17','tpl-getOneThumb','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('542','1395000126','1','admin','79','17','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('543','1395000127','1','admin','78','17','tpl-getOneThumb','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('544','1395000589','1','admin','79','17','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('545','1395000589','1','admin','78','17','tpl-getOneThumb','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('546','1395000774','1','admin','3','15','test','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('547','1395000777','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('548','1395000792','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('549','1395000801','1','admin','78','17','tpl-getOneThumb','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('550','1395000842','1','admin','79','17','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('551','1395000843','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('552','1395000858','1','admin','78','17','tpl-getOneThumb','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('553','1395000875','1','admin','79','17','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('554','1395000875','1','admin','78','17','tpl-getOneThumb','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('555','1395001103','1','admin','79','17','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('556','1395001103','1','admin','78','17','tpl-getOneThumb','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('557','1395001260','1','admin','79','17','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('558','1395001260','1','admin','78','17','tpl-getOneThumb','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('559','1395073989','1','admin','58','-','MODx','Logged in');
INSERT INTO `modx_manager_log` VALUES ('560','1395074004','1','admin','51','15','-','Moving resource');
INSERT INTO `modx_manager_log` VALUES ('561','1395074017','1','admin','52','15','-','Moved resource');
INSERT INTO `modx_manager_log` VALUES ('562','1395074028','1','admin','3','15','test','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('563','1395074032','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('564','1395082304','1','admin','58','-','MODx','Logged in');
INSERT INTO `modx_manager_log` VALUES ('565','1395082309','1','admin','3','15','test','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('566','1395082312','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('567','1395082463','1','admin','5','15','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('568','1395082464','1','admin','3','15','test','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('569','1395082466','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('570','1395082473','1','admin','3','15','test','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('571','1395082476','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('572','1395083312','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('573','1395083318','1','admin','22','6','PSSGallery','Editing Snippet');
INSERT INTO `modx_manager_log` VALUES ('574','1395084229','1','admin','3','15','test','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('575','1395084232','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('576','1395166114','1','admin','58','-','MODx','Logged in');
INSERT INTO `modx_manager_log` VALUES ('577','1395166117','1','admin','3','15','test','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('578','1395166119','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('579','1395171853','1','admin','3','6','Авиа Плаза','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('580','1395171863','1','admin','17','-','-','Editing settings');
INSERT INTO `modx_manager_log` VALUES ('581','1395171875','1','admin','30','-','-','Saving settings');
INSERT INTO `modx_manager_log` VALUES ('582','1395171879','1','admin','27','6','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('583','1395171934','1','admin','27','7','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('584','1395171950','1','admin','5','7','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('585','1395171952','1','admin','3','7','Виктория Плаза','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('586','1395171953','1','admin','27','8','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('587','1395171969','1','admin','5','8','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('588','1395171970','1','admin','3','8','Торговый комплекс','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('589','1395171972','1','admin','27','9','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('590','1395171988','1','admin','27','10','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('591','1395172005','1','admin','27','11','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('592','1395172021','1','admin','27','1','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('593','1395172055','1','admin','27','6','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('594','1395172093','1','admin','5','6','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('595','1395172094','1','admin','3','6','Авиа Плаза','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('596','1395172096','1','admin','27','7','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('597','1395172120','1','admin','5','7','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('598','1395172122','1','admin','3','7','Виктория Плаза','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('599','1395172125','1','admin','27','8','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('600','1395173594','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('601','1395173628','1','admin','5','15','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('602','1395173628','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('603','1395173798','1','admin','5','15','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('604','1395173799','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('605','1395250586','1','admin','58','-','MODx','Logged in');
INSERT INTO `modx_manager_log` VALUES ('606','1395250590','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('607','1395257716','1','admin','5','15','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('608','1395257717','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('609','1395257792','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('610','1395257799','1','admin','78','17','tpl-getOneThumb','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('611','1395257816','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('612','1395257820','1','admin','78','10','tpl-image','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('613','1395258106','1','admin','79','10','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('614','1395258107','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('615','1395258109','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('616','1395258122','1','admin','5','15','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('617','1395258122','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('618','1395258822','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('619','1395258827','1','admin','78','10','tpl-image','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('620','1395258830','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('621','1395258870','1','admin','5','15','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('622','1395258871','1','admin','3','15','test','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('623','1395258873','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('624','1395258877','1','admin','78','10','tpl-image','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('625','1395259130','1','admin','79','10','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('626','1395259131','1','admin','78','10','tpl-image','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('627','1395259251','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('628','1395259260','1','admin','27','1','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('629','1395259269','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('630','1395259276','1','admin','16','5','MainWin','Editing template');
INSERT INTO `modx_manager_log` VALUES ('631','1395259297','1','admin','20','5','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('632','1395259297','1','admin','16','5','MainWin','Editing template');
INSERT INTO `modx_manager_log` VALUES ('633','1395259378','1','admin','20','5','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('634','1395259378','1','admin','16','5','MainWin','Editing template');
INSERT INTO `modx_manager_log` VALUES ('635','1395259450','1','admin','20','5','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('636','1395259451','1','admin','16','5','MainWin','Editing template');
INSERT INTO `modx_manager_log` VALUES ('637','1395259951','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('638','1395259964','1','admin','78','10','tpl-image','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('639','1395260316','1','admin','79','10','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('640','1395260317','1','admin','78','10','tpl-image','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('641','1395260386','1','admin','79','10','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('642','1395260386','1','admin','78','10','tpl-image','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('643','1395260424','1','admin','27','9','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('644','1395260488','1','admin','5','9','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('645','1395260490','1','admin','3','9','Горная резиденция','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('646','1395261439','1','admin','27','15','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('647','1395261973','1','admin','27','10','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('648','1395262081','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('649','1395262084','1','admin','78','10','tpl-image','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('650','1395262106','1','admin','79','10','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('651','1395262106','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('652','1395339285','1','admin','27','1','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('653','1395339288','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('654','1395339293','1','admin','16','5','MainWin','Editing template');
INSERT INTO `modx_manager_log` VALUES ('655','1395339492','1','admin','20','5','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('656','1395339492','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('657','1395339581','1','admin','27','3','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('658','1395339605','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('659','1395339608','1','admin','16','5','MainWin','Editing template');
INSERT INTO `modx_manager_log` VALUES ('660','1395339615','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('661','1395339619','1','admin','16','5','MainWin','Editing template');
INSERT INTO `modx_manager_log` VALUES ('662','1395339622','1','admin','96','5','-','Duplicate Template');
INSERT INTO `modx_manager_log` VALUES ('663','1395339623','1','admin','16','7','Duplicate of MainWin','Editing template');
INSERT INTO `modx_manager_log` VALUES ('664','1395339655','1','admin','20','7','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('665','1395339656','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('666','1395339658','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('667','1395339672','1','admin','78','7','TOPMENU','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('668','1395339680','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('669','1395339684','1','admin','78','8','tpl-menuItem','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('670','1395339706','1','admin','79','8','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('671','1395339706','1','admin','78','8','tpl-menuItem','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('672','1395339738','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('673','1395339748','1','admin','78','9','tpl-menuItemCurrent','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('674','1395339766','1','admin','79','9','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('675','1395339766','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('676','1395339776','1','admin','27','6','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('677','1395339797','1','admin','27','6','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('678','1395341333','1','admin','5','6','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('679','1395341334','1','admin','3','6','Авиа Плаза','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('680','1395341337','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('681','1395341344','1','admin','77','-','New Chunk','Creating a new Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('682','1395341486','1','admin','79','-','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('683','1395341486','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('684','1395341489','1','admin','77','-','New Chunk','Creating a new Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('685','1395341779','1','admin','79','-','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('686','1395341779','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('687','1395341793','1','admin','16','7','Win','Editing template');
INSERT INTO `modx_manager_log` VALUES ('688','1395342142','1','admin','20','7','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('689','1395342142','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('690','1395342146','1','admin','16','7','Win','Editing template');
INSERT INTO `modx_manager_log` VALUES ('691','1395342170','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('692','1395342210','1','admin','16','7','Win','Editing template');
INSERT INTO `modx_manager_log` VALUES ('693','1395342422','1','admin','20','7','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('694','1395342422','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('695','1395342519','1','admin','27','3','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('696','1395342579','1','admin','5','3','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('697','1395342581','1','admin','3','3','Проекты','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('698','1395342592','1','admin','27','3','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('699','1395342716','1','admin','5','3','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('700','1395342718','1','admin','3','3','Проекты','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('701','1395342750','1','admin','27','3','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('702','1395342800','1','admin','5','3','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('703','1395342802','1','admin','3','3','Проекты','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('704','1395342804','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('705','1395342813','1','admin','16','7','Win','Editing template');
INSERT INTO `modx_manager_log` VALUES ('706','1395342817','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('707','1395342822','1','admin','78','2','HEAD','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('708','1395342835','1','admin','27','3','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('709','1395342865','1','admin','5','3','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('710','1395342867','1','admin','3','3','Проекты','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('711','1395342888','1','admin','27','6','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('712','1395342900','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('713','1395342906','1','admin','16','7','Win','Editing template');
INSERT INTO `modx_manager_log` VALUES ('714','1395342914','1','admin','26','-','-','Refreshing site');
INSERT INTO `modx_manager_log` VALUES ('715','1395342992','1','admin','27','6','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('716','1395343013','1','admin','27','3','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('717','1395343026','1','admin','5','3','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('718','1395343028','1','admin','3','3','Проекты','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('719','1395343034','1','admin','27','6','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('720','1395343049','1','admin','5','6','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('721','1395343050','1','admin','27','3','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('722','1395343058','1','admin','5','3','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('723','1395343060','1','admin','3','3','Проекты','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('724','1395343098','1','admin','27','6','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('725','1395343118','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('726','1395343121','1','admin','16','7','Win','Editing template');
INSERT INTO `modx_manager_log` VALUES ('727','1395343137','1','admin','27','1','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('728','1395343144','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('729','1395343146','1','admin','16','5','MainWin','Editing template');
INSERT INTO `modx_manager_log` VALUES ('730','1395343155','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('731','1395343158','1','admin','16','7','Win','Editing template');
INSERT INTO `modx_manager_log` VALUES ('732','1395343310','1','admin','20','7','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('733','1395343310','1','admin','16','7','Win','Editing template');
INSERT INTO `modx_manager_log` VALUES ('734','1395343337','1','admin','20','7','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('735','1395343337','1','admin','16','7','Win','Editing template');
INSERT INTO `modx_manager_log` VALUES ('736','1395343416','1','admin','20','7','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('737','1395343417','1','admin','16','7','Win','Editing template');
INSERT INTO `modx_manager_log` VALUES ('738','1395343422','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('739','1395343432','1','admin','78','19','tpl-galleryItem','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('740','1395343445','1','admin','79','19','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('741','1395343445','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('742','1395343482','1','admin','16','7','Win','Editing template');
INSERT INTO `modx_manager_log` VALUES ('743','1395343507','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('744','1395343512','1','admin','27','6','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('745','1395343595','1','admin','5','6','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('746','1395343596','1','admin','3','6','Авиа Плаза','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('747','1395343605','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('748','1395343608','1','admin','16','7','Win','Editing template');
INSERT INTO `modx_manager_log` VALUES ('749','1395343659','1','admin','20','7','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('750','1395343659','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('751','1395343670','1','admin','16','6','Duplicate of Window','Editing template');
INSERT INTO `modx_manager_log` VALUES ('752','1395343680','1','admin','21','6','-','Deleting template');
INSERT INTO `modx_manager_log` VALUES ('753','1395343681','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('754','1395343697','1','admin','27','6','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('755','1395343731','1','admin','5','6','-','Saving resource');
INSERT INTO `modx_manager_log` VALUES ('756','1395343733','1','admin','3','6','Авиа Плаза','Viewing data for resource');
INSERT INTO `modx_manager_log` VALUES ('757','1395344215','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('758','1395344218','1','admin','16','7','Win','Editing template');
INSERT INTO `modx_manager_log` VALUES ('759','1395344236','1','admin','20','7','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('760','1395344237','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('761','1395344380','1','admin','78','2','HEAD','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('762','1395344388','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('763','1395344392','1','admin','16','7','Win','Editing template');
INSERT INTO `modx_manager_log` VALUES ('764','1395344406','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('765','1395344412','1','admin','78','2','HEAD','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('766','1395344443','1','admin','79','2','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('767','1395344443','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('768','1395344498','1','admin','78','18','gallery','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('769','1395344569','1','admin','27','6','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('770','1395344581','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('771','1395344586','1','admin','16','7','Win','Editing template');
INSERT INTO `modx_manager_log` VALUES ('772','1395345086','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('773','1395345089','1','admin','16','7','Win','Editing template');
INSERT INTO `modx_manager_log` VALUES ('774','1395345095','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('775','1395345103','1','admin','78','2','HEAD','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('776','1395345129','1','admin','79','2','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('777','1395345129','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('778','1395345175','1','admin','78','2','HEAD','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('779','1395345304','1','admin','79','2','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('780','1395345304','1','admin','78','2','HEAD','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('781','1395345566','1','admin','79','2','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('782','1395345567','1','admin','78','2','HEAD','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('783','1395345579','1','admin','79','2','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('784','1395345580','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('785','1395345587','1','admin','78','18','gallery','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('786','1395345597','1','admin','79','18','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('787','1395345597','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('788','1395345615','1','admin','78','19','tpl-galleryItem','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('789','1395345647','1','admin','27','6','-','Editing resource');
INSERT INTO `modx_manager_log` VALUES ('790','1395345657','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('791','1395345661','1','admin','16','7','Win','Editing template');
INSERT INTO `modx_manager_log` VALUES ('792','1395345737','1','admin','20','7','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('793','1395345737','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('794','1395345748','1','admin','78','18','gallery','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('795','1395345762','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('796','1395345768','1','admin','16','7','Win','Editing template');
INSERT INTO `modx_manager_log` VALUES ('797','1395345786','1','admin','20','7','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('798','1395345786','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('799','1395346173','1','admin','78','18','gallery','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('800','1395346184','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('801','1395346188','1','admin','16','7','Win','Editing template');
INSERT INTO `modx_manager_log` VALUES ('802','1395346301','1','admin','20','7','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('803','1395346302','1','admin','16','7','Win','Editing template');
INSERT INTO `modx_manager_log` VALUES ('804','1395346508','1','admin','20','7','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('805','1395346508','1','admin','16','7','Win','Editing template');
INSERT INTO `modx_manager_log` VALUES ('806','1395346543','1','admin','20','7','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('807','1395346543','1','admin','16','7','Win','Editing template');
INSERT INTO `modx_manager_log` VALUES ('808','1395346671','1','admin','20','7','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('809','1395346671','1','admin','16','7','Win','Editing template');
INSERT INTO `modx_manager_log` VALUES ('810','1395346776','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('811','1395346781','1','admin','78','2','HEAD','Editing Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('812','1395346809','1','admin','79','2','-','Saving Chunk (HTML Snippet)');
INSERT INTO `modx_manager_log` VALUES ('813','1395346809','1','admin','76','-','-','Element management');
INSERT INTO `modx_manager_log` VALUES ('814','1395347018','1','admin','16','7','Win','Editing template');
INSERT INTO `modx_manager_log` VALUES ('815','1395347346','1','admin','20','7','-','Saving template');
INSERT INTO `modx_manager_log` VALUES ('816','1395347346','1','admin','16','7','Win','Editing template');
INSERT INTO `modx_manager_log` VALUES ('817','1395347864','1','admin','17','-','-','Editing settings');
INSERT INTO `modx_manager_log` VALUES ('818','1395347869','1','admin','83','-','-','Exporting a resource to HTML');
INSERT INTO `modx_manager_log` VALUES ('819','1395347875','1','admin','93','-','-','Backup Manager');

# --------------------------------------------------------

#
# Table structure for table `modx_manager_users`
#

DROP TABLE IF EXISTS `modx_manager_users`;
CREATE TABLE `modx_manager_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Contains login information for backend users.';

#
# Dumping data for table `modx_manager_users`
#

INSERT INTO `modx_manager_users` VALUES ('1','admin','uncrypt>79df4f50ce6e8955f16684c6e5b3c5cc04b33c3c');

# --------------------------------------------------------

#
# Table structure for table `modx_member_groups`
#

DROP TABLE IF EXISTS `modx_member_groups`;
CREATE TABLE `modx_member_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_group` int(10) NOT NULL DEFAULT '0',
  `member` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_group_member` (`user_group`,`member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';

#
# Dumping data for table `modx_member_groups`
#


# --------------------------------------------------------

#
# Table structure for table `modx_membergroup_access`
#

DROP TABLE IF EXISTS `modx_membergroup_access`;
CREATE TABLE `modx_membergroup_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `membergroup` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';

#
# Dumping data for table `modx_membergroup_access`
#


# --------------------------------------------------------

#
# Table structure for table `modx_membergroup_names`
#

DROP TABLE IF EXISTS `modx_membergroup_names`;
CREATE TABLE `modx_membergroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';

#
# Dumping data for table `modx_membergroup_names`
#


# --------------------------------------------------------

#
# Table structure for table `modx_pss_gallery`
#

DROP TABLE IF EXISTS `modx_pss_gallery`;
CREATE TABLE `modx_pss_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` int(11) DEFAULT NULL,
  `visible` int(3) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `url_original_image` varchar(255) DEFAULT NULL,
  `url_thumbnail_image` varchar(255) DEFAULT NULL,
  `url_gallery_image` varchar(255) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `url_min_image` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `options` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=230 DEFAULT CHARSET=utf8;

#
# Dumping data for table `modx_pss_gallery`
#

INSERT INTO `modx_pss_gallery` VALUES ('229','7','1','','','/assets/images/gallery/6/original_загруженное_(6).jpg','/assets/images/gallery/6/thumbnail_загруженное_(6).jpg','/assets/images/gallery/6/загруженное_(6).jpg','6','/assets/images/gallery/6/min_загруженное_(6).jpg','загруженное_(6).jpg','90--600-600');
INSERT INTO `modx_pss_gallery` VALUES ('228','6','1','','','/assets/images/gallery/6/original_загруженное_(5).jpg','/assets/images/gallery/6/thumbnail_загруженное_(5).jpg','/assets/images/gallery/6/загруженное_(5).jpg','6','/assets/images/gallery/6/min_загруженное_(5).jpg','загруженное_(5).jpg','90--600-600');
INSERT INTO `modx_pss_gallery` VALUES ('224','2','1','Центральный подъезд. ','','/assets/images/gallery/6/original_загруженное.jpg','/assets/images/gallery/6/thumbnail_загруженное.jpg','/assets/images/gallery/6/загруженное.jpg','6','/assets/images/gallery/6/min_загруженное.jpg','загруженное.jpg','90--600-600');
INSERT INTO `modx_pss_gallery` VALUES ('225','3','1','','','/assets/images/gallery/6/original_загруженное_(2).jpg','/assets/images/gallery/6/thumbnail_загруженное_(2).jpg','/assets/images/gallery/6/загруженное_(2).jpg','6','/assets/images/gallery/6/min_загруженное_(2).jpg','загруженное_(2).jpg','90--600-600');
INSERT INTO `modx_pss_gallery` VALUES ('213','1','1','','','/assets/images/gallery/7/original_3.jpg','/assets/images/gallery/7/thumbnail_3.jpg','/assets/images/gallery/7/3.jpg','7','/assets/images/gallery/7/min_3.jpg','3.jpg','215-315-800-600');
INSERT INTO `modx_pss_gallery` VALUES ('214','2','1','','','/assets/images/gallery/7/original_4.jpg','/assets/images/gallery/7/thumbnail_4.jpg','/assets/images/gallery/7/4.jpg','7','/assets/images/gallery/7/min_4.jpg','4.jpg','215-315-800-600');
INSERT INTO `modx_pss_gallery` VALUES ('215','1','1','','','/assets/images/gallery/8/original_5.jpg','/assets/images/gallery/8/thumbnail_5.jpg','/assets/images/gallery/8/5.jpg','8','/assets/images/gallery/8/min_5.jpg','5.jpg','215-315-800-600');
INSERT INTO `modx_pss_gallery` VALUES ('216','2','1','','','/assets/images/gallery/8/original_6.jpg','/assets/images/gallery/8/thumbnail_6.jpg','/assets/images/gallery/8/6.jpg','8','/assets/images/gallery/8/min_6.jpg','6.jpg','215-315-800-600');
INSERT INTO `modx_pss_gallery` VALUES ('217','1','1','','','/assets/images/gallery/9/original_7.jpg','','','9','/assets/images/gallery/9/min_7.jpg','7.jpg','');
INSERT INTO `modx_pss_gallery` VALUES ('218','2','1','','','/assets/images/gallery/9/original_10.jpg','','','9','/assets/images/gallery/9/min_10.jpg','10.jpg','');
INSERT INTO `modx_pss_gallery` VALUES ('219','3','1','','','/assets/images/gallery/9/original_8.jpg','','','9','/assets/images/gallery/9/min_8.jpg','8.jpg','');
INSERT INTO `modx_pss_gallery` VALUES ('223','1','1','Главный подъед. Вид со стороны суши-бара.','','/assets/images/gallery/6/original_pic1_26022013122547.jpg','/assets/images/gallery/6/thumbnail_pic1_26022013122547.jpg','/assets/images/gallery/6/pic1_26022013122547.jpg','6','/assets/images/gallery/6/min_pic1_26022013122547.jpg','pic1_26022013122547.jpg','90--600-600');
INSERT INTO `modx_pss_gallery` VALUES ('220','1','1','','','/assets/images/gallery/10/original_загруженное.jpg','','','10','/assets/images/gallery/10/min_загруженное.jpg','загруженное.jpg','');
INSERT INTO `modx_pss_gallery` VALUES ('221','2','1','','','/assets/images/gallery/10/original_загруженное_(1).jpg','','','10','/assets/images/gallery/10/min_загруженное_(1).jpg','загруженное_(1).jpg','');
INSERT INTO `modx_pss_gallery` VALUES ('222','3','1','','','/assets/images/gallery/10/original_загруженное_(4).jpg','','','10','/assets/images/gallery/10/min_загруженное_(4).jpg','загруженное_(4).jpg','');
INSERT INTO `modx_pss_gallery` VALUES ('226','4','1','25-ти метровый бассейн на крыше. 8 плавательных дорожек.','','/assets/images/gallery/6/original_загруженное_(3).jpg','/assets/images/gallery/6/thumbnail_загруженное_(3).jpg','/assets/images/gallery/6/загруженное_(3).jpg','6','/assets/images/gallery/6/min_загруженное_(3).jpg','загруженное_(3).jpg','90--600-600');
INSERT INTO `modx_pss_gallery` VALUES ('227','5','1','Лестница в небо - вид главного здания с торца.','','/assets/images/gallery/6/original_загруженное_(4).jpg','/assets/images/gallery/6/thumbnail_загруженное_(4).jpg','/assets/images/gallery/6/загруженное_(4).jpg','6','/assets/images/gallery/6/min_загруженное_(4).jpg','загруженное_(4).jpg','90--600-600');

# --------------------------------------------------------

#
# Table structure for table `modx_site_content`
#

DROP TABLE IF EXISTS `modx_site_content`;
CREATE TABLE `modx_site_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT 'document',
  `contentType` varchar(50) NOT NULL DEFAULT 'text/html',
  `pagetitle` varchar(255) NOT NULL DEFAULT '',
  `longtitle` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) DEFAULT '',
  `link_attributes` varchar(255) NOT NULL DEFAULT '' COMMENT 'Link attriubtes',
  `published` int(1) NOT NULL DEFAULT '0',
  `pub_date` int(20) NOT NULL DEFAULT '0',
  `unpub_date` int(20) NOT NULL DEFAULT '0',
  `parent` int(10) NOT NULL DEFAULT '0',
  `isfolder` int(1) NOT NULL DEFAULT '0',
  `introtext` text COMMENT 'Used to provide quick summary of the document',
  `content` mediumtext,
  `richtext` tinyint(1) NOT NULL DEFAULT '1',
  `template` int(10) NOT NULL DEFAULT '0',
  `menuindex` int(10) NOT NULL DEFAULT '0',
  `searchable` int(1) NOT NULL DEFAULT '1',
  `cacheable` int(1) NOT NULL DEFAULT '1',
  `createdby` int(10) NOT NULL DEFAULT '0',
  `createdon` int(20) NOT NULL DEFAULT '0',
  `editedby` int(10) NOT NULL DEFAULT '0',
  `editedon` int(20) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `deletedon` int(20) NOT NULL DEFAULT '0',
  `deletedby` int(10) NOT NULL DEFAULT '0',
  `publishedon` int(20) NOT NULL DEFAULT '0' COMMENT 'Date the document was published',
  `publishedby` int(10) NOT NULL DEFAULT '0' COMMENT 'ID of user who published the document',
  `menutitle` varchar(255) NOT NULL DEFAULT '' COMMENT 'Menu title',
  `donthit` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Disable page hit count',
  `haskeywords` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'has links to keywords',
  `hasmetatags` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'has links to meta tags',
  `privateweb` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private web document',
  `privatemgr` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private manager document',
  `content_dispo` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-inline, 1-attachment',
  `hidemenu` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Hide document from menu',
  `alias_visible` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `parent` (`parent`),
  KEY `aliasidx` (`alias`),
  KEY `typeidx` (`type`),
  FULLTEXT KEY `content_ft_idx` (`pagetitle`,`description`,`content`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Contains the site document tree.';

#
# Dumping data for table `modx_site_content`
#

INSERT INTO `modx_site_content` VALUES ('1','document','text/html','Главная','Welcome to Trust Invest Me','','main','','1','0','0','0','1','В мире современного бизнеса, как и в века леген-\nдарных мореходов выигрывает тот, кто имеет хо-\nрошие лоцманские карты\n','','1','5','0','1','1','1','1130304721','1','1394991036','0','0','0','1130304721','1','Base Install','0','0','0','0','0','0','0','1');
INSERT INTO `modx_site_content` VALUES ('2','document','text/html','Новости','','','news','','1','0','0','1','1','','','1','3','0','1','0','1','1394961135','1','1394961135','0','0','0','1394961135','1','','0','0','0','0','0','0','0','1');
INSERT INTO `modx_site_content` VALUES ('3','reference','text/html','Проекты','','','projects','','1','0','0','1','1','','/projects/6','0','3','0','0','0','1','1394961167','1','1395343058','0','0','0','1394961334','1','','1','0','0','0','0','0','0','0');
INSERT INTO `modx_site_content` VALUES ('4','document','text/html','Контакты','','','contacts','','1','0','0','1','0','','','1','3','0','1','0','1','1394961218','1','1394961355','0','0','0','1394961355','1','','0','0','0','0','0','0','0','1');
INSERT INTO `modx_site_content` VALUES ('5','document','text/html','Продажа-Аренда','','','arenda','','1','0','0','1','0','','','1','3','0','1','0','1','1394961278','1','1394961318','0','0','0','1394961318','1','','0','0','0','0','0','0','0','1');
INSERT INTO `modx_site_content` VALUES ('6','document','text/html','Авиа Плаза','','Достойное представление линейки  офисных центров класса А','avia','','1','0','0','3','0','','<p>Неоспоримыми преимуществами Бизнес-парка являются удачное месторасположение и транспортная доступность. В непосредственной близости пролегает шоссе Энтузиастов, расстояние до МКАД составляет 9 километров, до ТТК &ndash; 2,3 км., до Садового кольца &ndash; 3,5 км. Станция метро &laquo;Авиамоторная&raquo; расположена в шаговой доступности. Мы предлагаем самые лучшие верхние этажи, с евро-ремонтом высочайшего уровня, которые Вы можете использовать как для собственных нужд, так и для ведения арендного бизнеса, где Вашими партнерами-арендаторами станут крупнейшие компании России с мировыми именами. Минимальная площадь &ndash; 860 кв.м.<br /><br /></p>','1','7','0','1','0','1','1394987831','1','1395343731','0','0','0','1394987831','1','','0','0','0','0','0','0','0','1');
INSERT INTO `modx_site_content` VALUES ('7','document','text/html','Виктория Плаза','','Современный деловой комплекс класса В+','','','1','0','0','3','0','','','1','5','1','1','0','1','1394987891','1','1395172120','0','0','0','1394987891','1','','0','0','0','0','0','0','0','1');
INSERT INTO `modx_site_content` VALUES ('8','document','text/html','Торговый комплекс','','Торговый комплекс по вашему заказу','','','1','0','0','3','0','','','1','5','2','1','0','1','1394988067','1','1395171969','0','0','0','1394988067','1','','0','0','0','0','0','0','0','1');
INSERT INTO `modx_site_content` VALUES ('9','document','text/html','Горная резиденция','','Твой собственный мир','','','1','0','0','3','0','','','1','5','3','1','0','1','1394988336','1','1395260488','0','0','0','1394988336','1','','0','0','0','0','0','0','0','1');
INSERT INTO `modx_site_content` VALUES ('10','document','text/html','Калининградская \"Рублевка\"','','Здесь все в ваших рука - Россия, Европа.. весь мир!','','','1','0','0','3','0','','','1','5','4','1','0','1','1394988451','1','1394989195','0','0','0','1394988451','1','','0','0','0','0','0','0','0','1');
INSERT INTO `modx_site_content` VALUES ('11','document','text/html','Барвиха Хиллс','','Архитектурный ансамбль в современном стиле из 100 престижных коттеджей','','','1','0','0','3','0','','','1','5','5','1','0','1','1394988488','1','1394989239','0','0','0','1394988488','1','','0','0','0','0','0','0','0','1');
INSERT INTO `modx_site_content` VALUES ('12','document','text/html','Закрытие Олимпиады','','','','','1','0','0','2','0','В Сочи началась церемония закрытия Паралимпиады','<p><a href=\"http://parasochi.lenta.ru/news/2014/03/16/ceremony/\">В Сочи началась церемония закрытия Паралимпиады</a> В Сочи на стадионе &laquo;Фишт&raquo; началась торжественная церемония закрытия Паралимпийских игр. Соревнования проходили с 7 по 16 марта, в ходе них в пяти видах спорта были разыграны 72 комплекта наград. Сборная России с 30 золотыми, 28 серебряными и 22 бронзовыми медалями заняла первое место в командном зачете.</p>','1','3','0','1','0','1','1394988656','1','1394992451','0','0','0','1394988656','1','','0','0','0','0','0','0','0','1');
INSERT INTO `modx_site_content` VALUES ('13','document','text/html','Референдум в Крыму','','','','','1','0','0','2','0','Премьер-министр Крыма признал референдум состоявшимся','<p>Премьер-министр Крыма Сергей Аксенов признал &laquo;практически состоявшимся&raquo; референдум о присоединении автономной республики к России. Об этом сообщает <a href=\"http://www.interfax.ru\" target=\"_blank\" class=\"source\">&laquo;Интерфакс&raquo;</a>.</p>','1','3','1','1','0','1','1394988716','1','1394992496','0','0','0','1394988716','1','','0','0','0','0','0','0','0','1');
INSERT INTO `modx_site_content` VALUES ('14','document','text/html','Распределение имущества','','','','','1','0','0','2','0','Украина решила заняться переделом советского имущества','<p>Премьер-министр Украины Арсений Яценюк поручил временно исполняющему обязанности главы МИД Андрею Дещице принять меры по подготовке правовой позиции Украины по распределению имущества и средств СССР. Об этом 16 марта <a href=\"http://www.unn.com.ua/ru/news/1317300-a-yatsenyuk-doruchiv-mzs-pidgotuvati-pozitsiyu-po-zakhistu-natsinteresiv-ukrayini-pri-rozpodili-mayna-srsr-dopovneno\" target=\"_blank\">сообщает</a> УНН.</p>','1','3','2','1','0','1','1394988756','1','1394992537','0','0','0','1394988756','1','','0','0','0','0','0','0','0','1');
INSERT INTO `modx_site_content` VALUES ('15','document','text/html','test','','','','','1','0','0','0','0','','[! PSSGallery? &startID=`3` &itemTpl=`tpl-image` &limit=`4` &randPreview=`1` &type=`custom` &thumbnailHeight=`315` !] \n\n','0','3','4','1','0','1','1394994172','1','1395258870','0','0','0','1394994172','1','','0','0','0','0','0','0','1','1');

# --------------------------------------------------------

#
# Table structure for table `modx_site_content_metatags`
#

DROP TABLE IF EXISTS `modx_site_content_metatags`;
CREATE TABLE `modx_site_content_metatags` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `metatag_id` int(11) NOT NULL DEFAULT '0',
  KEY `content_id` (`content_id`),
  KEY `metatag_id` (`metatag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Reference table between meta tags and content';

#
# Dumping data for table `modx_site_content_metatags`
#


# --------------------------------------------------------

#
# Table structure for table `modx_site_htmlsnippets`
#

DROP TABLE IF EXISTS `modx_site_htmlsnippets`;
CREATE TABLE `modx_site_htmlsnippets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Chunk',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='Contains the site chunks.';

#
# Dumping data for table `modx_site_htmlsnippets`
#

INSERT INTO `modx_site_htmlsnippets` VALUES ('1','mm_rules','Default ManagerManager rules.','0','2','0','// more example rules are in assets/plugins/managermanager/example_mm_rules.inc.php\n\n// example of how PHP is allowed - check that a TV named documentTags exists before creating rule\nif($modx->db->getValue(\"SELECT COUNT(id) FROM \" . $modx->getFullTableName(\'site_tmplvars\') . \" WHERE name=\'documentTags\'\")) {\n    mm_widget_tags(\'documentTags\',\' \'); // Give blog tag editing capabilities to the \'documentTags (3)\' TV\n}\nmm_widget_showimagetvs(); // Always give a preview of Image TVs\n','0');
INSERT INTO `modx_site_htmlsnippets` VALUES ('2','HEAD','head','0','5','0','<head>\n<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\" />\n<base href=\"[(site_url)]\" />\n<title>[(page_title)]</title>\n<meta name=\"title\" content=\"Управлнеие активами\" />\n<meta name=\"keywords\" content=\"trust,invest\" />\n<meta name=\"description\" content=\"Инвестирование\" />\n<!-- styles -->\n <link rel=\"stylesheet\" href=\"/assets/snippets/pss_gallery/res/gallireis/ad-gallery/css/jquery.ad-gallery.css\">\n  <link rel=\"stylesheet\" href=\"/assets/site/styles/main.css\" type=\"text/css\">\n<!--[if lt IE 9]><script src=\"/assets/site/scripts/html5shiv.js\"></script><![endif]-->\n<!-- scripts -->\n</head>','0');
INSERT INTO `modx_site_htmlsnippets` VALUES ('3','rotator','jquery gallery','0','5','0','<script type=\"text/javascript\" src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js\"></script>\n<script type=\"text/javascript\" language=\"javascript\" src=\"scripts/jquery.ad-gallery.js\"></script>\n<script type=\"text/javascript\" language=\"javascript\" src=\"scripts/init.js\"></script>','0');
INSERT INTO `modx_site_htmlsnippets` VALUES ('4','HEADER','шапка','0','5','0','<header id=\"header\" class=\"clear\">\n   <hgroup>\n      <div id=\'trust\'><img src=\"/assets/site/images/trust-1.jpg\" alt=\"\"></div>\n      <div id=\'invest\'><span>ИНВЕСТИРУЕМ ГРАМОТНО</span></div>\n  </hgroup>\n  <div class=\'label\'><img src=\"/assets/site/images/label.png\" width=\"180\"  alt=\"\"></div>\n</header>\n<div class=\'string\'></div>','0');
INSERT INTO `modx_site_htmlsnippets` VALUES ('5','FOOTER','подвал','0','5','0','<div class=\'stringR\'></div>\n  <div class=\"bg\">\n  <footer id=\"footer\" class=\"clear\">\n           <p class=\"fl_left\">Copyright &copy; 2012 - All Rights Reserved - <a href=\"#\">Domain Name</a></p>\n           <p class=\"fl_right\">Template by <a href=\"http://www.os-templates.com/\" title=\"Free Website Templates\">OS Templates</a></p>\n  </footer>\n</div>','0');
INSERT INTO `modx_site_htmlsnippets` VALUES ('6','pageTile','заголовок страницы','0','5','0','<section id=\"shout\"  class=\'section\'>\n    <!-- Avia Plaza  -->\n<h2>[*description*]</h2>  \n    <!-- Достойное представление линейки офисных центров класса А -->\n<div>[*longtitle*]</div> \n</section>','0');
INSERT INTO `modx_site_htmlsnippets` VALUES ('7','TOPMENU','верхнее меню','0','5','0','<nav class=\'topmenu\'>\n<ul>\n[[Ditto? startID=`0` &showInMenuOnly=`1` &sortBy=`menuindex` &tpl=`tpl-menuItem` &tplCurrentDocument=`tpl-menuItemCurrent` &depth=`2` &sortBy=`menuIndex` &sortDir=`DESC`]]\n</ul>\n</nav>','0');
INSERT INTO `modx_site_htmlsnippets` VALUES ('8','tpl-menuItem','элемент верхнего меню','0','6','0','<li><a href=\"[+alias+]\">[+pagetitle+]</a></li>','0');
INSERT INTO `modx_site_htmlsnippets` VALUES ('9','tpl-menuItemCurrent','элемент верхнего меню - текущий','0','6','0','<li class=\'selected-item\'>[+pagetitle+]</li>','0');
INSERT INTO `modx_site_htmlsnippets` VALUES ('10','tpl-image','вывод картинок на главной','0','7','0','<article class=\"one_quarter [+lastClass+]\">\n  <figure >\n     <div class=\"preview\"><img src=\"[+url_thumbnail_image+]\" /></div>\n     <figcaption>[+title+]</figcaption>\n  </figure>\n</article>','0');
INSERT INTO `modx_site_htmlsnippets` VALUES ('11','ASIDE','правое меню','0','5','0','<aside id=\"right_column\">\n <h2 class=\"title\">Проекты</h2>\n      <nav>\n        <ul>\n[[Ditto? &startID=`3` &tpl=`tpl-projectItem`  &tplCurrentDocument=`tpl-projectItemCurrent` &sortBy=`menuindex` &sortDir=`ASC`]]\n        </ul>\n      </nav>\n</aside>','0');
INSERT INTO `modx_site_htmlsnippets` VALUES ('12','tpl-projectItem','Элемент правого меню','0','6','0','<li><a href=\"#\">[+pagetitle+]</a></li>','0');
INSERT INTO `modx_site_htmlsnippets` VALUES ('13','tpl-projectItemCurrent','Элемент правого меню - текущее','0','6','0','<li class=\'selected-item\'>[+pagetitle+]</li>','0');
INSERT INTO `modx_site_htmlsnippets` VALUES ('14','LAST_NEWS','выводит последине N новостей','0','0','0','[!Ditto? &startID=`2` &dateFormat=`%d.%m.%Y` &tpl=`tpl-newsItem` &display=`2` !]','0');
INSERT INTO `modx_site_htmlsnippets` VALUES ('15','tpl-cutNewsItem','элемент новости - обрезаный','0','6','0','<article class=\"clear\">\n  <div class=\'news\'><h2>[+date+]</h2></div>\n  <div class=\'text-news\'>\n     <h4 class=\'title\'>[+pagetitle+]</h4>\n     [+introtext+]\n     <div class=\"next\" ><a href=\"[~[+id+]~]\" title=\"Перейти к полному тексту новости\">Читать дальше →</a></div>\n  </div>\n</article>','0');
INSERT INTO `modx_site_htmlsnippets` VALUES ('16','tpl-newsItem','элемент новости - обрезаный','0','6','0','<article class=\"clear\">\n  <div class=\'news\'><h2>[+date+]</h2></div>\n  <div class=\'text-news\'>\n     <h4 class=\'title\'>[+pagetitle+]</h4>\n     [+content+]\n  </div>\n</article>','0');
INSERT INTO `modx_site_htmlsnippets` VALUES ('17','tpl-getOneThumb','взятие произвольной тумбы из галерей','0','7','0','[[PSSGallery? &type=`custom`  &thumbnailWidth=`215` &thumbnailHeight=`315`  &docId=`[+id+]` &imageTpl=`tpl-image` &countImages=`1` ]]\n','0');
INSERT INTO `modx_site_htmlsnippets` VALUES ('18','gallery','место галереи','0','5','0','<div id=\"gallery\" class=\"ad-gallery\">\n   <div class=\"ad-image-wrapper\"></div>\n   <div class=\"ad-controls\"></div>\n   <div class=\"ad-nav\">\n     <div class=\"ad-thumbs\">\n       <ul>\n       {{tpl-galleryItem}} \n       </ul>\n     </div>\n   </div>\n</div>','0');
INSERT INTO `modx_site_htmlsnippets` VALUES ('19','tpl-galleryItem','элемен галереи','0','7','0','<li>\n   <a href=\"[+url_gallery_image+]\">\n     <img src=\"[+url_thumbnail_image+]\" title=\"[+title+]\">\n   </a>\n</li>\n','0');

# --------------------------------------------------------

#
# Table structure for table `modx_site_keywords`
#

DROP TABLE IF EXISTS `modx_site_keywords`;
CREATE TABLE `modx_site_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyword` (`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site keyword list';

#
# Dumping data for table `modx_site_keywords`
#


# --------------------------------------------------------

#
# Table structure for table `modx_site_metatags`
#

DROP TABLE IF EXISTS `modx_site_metatags`;
CREATE TABLE `modx_site_metatags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `tag` varchar(50) NOT NULL DEFAULT '' COMMENT 'tag name',
  `tagvalue` varchar(255) NOT NULL DEFAULT '',
  `http_equiv` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1 - use http_equiv tag style, 0 - use name',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site meta tags';

#
# Dumping data for table `modx_site_metatags`
#


# --------------------------------------------------------

#
# Table structure for table `modx_site_module_access`
#

DROP TABLE IF EXISTS `modx_site_module_access`;
CREATE TABLE `modx_site_module_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` int(11) NOT NULL DEFAULT '0',
  `usergroup` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Module users group access permission';

#
# Dumping data for table `modx_site_module_access`
#


# --------------------------------------------------------

#
# Table structure for table `modx_site_module_depobj`
#

DROP TABLE IF EXISTS `modx_site_module_depobj`;
CREATE TABLE `modx_site_module_depobj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` int(11) NOT NULL DEFAULT '0',
  `resource` int(11) NOT NULL DEFAULT '0',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '10-chunks, 20-docs, 30-plugins, 40-snips, 50-tpls, 60-tvs',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Module Dependencies';

#
# Dumping data for table `modx_site_module_depobj`
#


# --------------------------------------------------------

#
# Table structure for table `modx_site_modules`
#

DROP TABLE IF EXISTS `modx_site_modules`;
CREATE TABLE `modx_site_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '0',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `disabled` tinyint(4) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `wrap` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to module icon',
  `enable_resource` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'enables the resource file feature',
  `resourcefile` varchar(255) NOT NULL DEFAULT '' COMMENT 'a physical link to a resource file',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `guid` varchar(32) NOT NULL DEFAULT '' COMMENT 'globally unique identifier',
  `enable_sharedparams` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text,
  `modulecode` mediumtext COMMENT 'module boot up code',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Site Modules';

#
# Dumping data for table `modx_site_modules`
#

INSERT INTO `modx_site_modules` VALUES ('1','Doc Manager','<strong>1.1</strong> Quickly perform bulk updates to the Documents in your site including templates, publishing details, and permissions','0','0','3','0','0','','0','','0','0','docman435243542tf542t5t','1','','include_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/docmanager.class.php\');\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/dm_frontend.class.php\');\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/dm_backend.class.php\');\n\n$dm = new DocManager($modx);\n$dmf = new DocManagerFrontend($dm, $modx);\n$dmb = new DocManagerBackend($dm, $modx);\n\n$dm->ph = $dm->getLang();\n$dm->ph[\'theme\'] = $dm->getTheme();\n$dm->ph[\'ajax.endpoint\'] = MODX_SITE_URL.\'assets/modules/docmanager/tv.ajax.php\';\n$dm->ph[\'datepicker.offset\'] = $modx->config[\'datepicker_offset\'];\n$dm->ph[\'datetime.format\'] = $modx->config[\'datetime_format\'];\n\nif (isset($_POST[\'tabAction\'])) {\n    $dmb->handlePostback();\n} else {\n    $dmf->getViews();\n    echo $dm->parseTemplate(\'main.tpl\', $dm->ph);\n}');

# --------------------------------------------------------

#
# Table structure for table `modx_site_plugin_events`
#

DROP TABLE IF EXISTS `modx_site_plugin_events`;
CREATE TABLE `modx_site_plugin_events` (
  `pluginid` int(10) NOT NULL,
  `evtid` int(10) NOT NULL DEFAULT '0',
  `priority` int(10) NOT NULL DEFAULT '0' COMMENT 'determines plugin run order',
  PRIMARY KEY (`pluginid`,`evtid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Links to system events';

#
# Dumping data for table `modx_site_plugin_events`
#

INSERT INTO `modx_site_plugin_events` VALUES ('1','85','0');
INSERT INTO `modx_site_plugin_events` VALUES ('1','87','0');
INSERT INTO `modx_site_plugin_events` VALUES ('1','88','0');
INSERT INTO `modx_site_plugin_events` VALUES ('2','28','0');
INSERT INTO `modx_site_plugin_events` VALUES ('2','29','0');
INSERT INTO `modx_site_plugin_events` VALUES ('2','53','0');
INSERT INTO `modx_site_plugin_events` VALUES ('3','97','1');

# --------------------------------------------------------

#
# Table structure for table `modx_site_plugins`
#

DROP TABLE IF EXISTS `modx_site_plugins`;
CREATE TABLE `modx_site_plugins` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Plugin',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `plugincode` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Disables the plugin',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Contains the site plugins.';

#
# Dumping data for table `modx_site_plugins`
#

INSERT INTO `modx_site_plugins` VALUES ('1','TinyMCE Rich Text Editor','<strong>3.5.8</strong> Javascript WYSIWYG Editor','0','3','0','require MODX_BASE_PATH.\'assets/plugins/tinymce/plugin.tinymce.php\';\n','0','&customparams=Custom Parameters;textarea;valid_elements : \"*[*]\", &mce_formats=Block Formats;text;p,h1,h2,h3,h4,h5,h6,div,blockquote,code,pre &entity_encoding=Entity Encoding;list;named,numeric,raw;named &entities=Entities;text; &mce_path_options=Path Options;list;Site config,Absolute path,Root relative,URL,No convert;Site config &mce_resizing=Advanced Resizing;list;true,false;true &disabledButtons=Disabled Buttons;text; &link_list=Link List;list;enabled,disabled;enabled &webtheme=Web Theme;list;simple,editor,creative,custom;simple &webPlugins=Web Plugins;text;style,advimage,advlink,searchreplace,contextmenu,paste,fullscreen,xhtmlxtras,media &webButtons1=Web Buttons 1;text;undo,redo,selectall,|,pastetext,pasteword,|,search,replace,|,hr,charmap,|,image,link,unlink,anchor,media,|,cleanup,removeformat,|,fullscreen,code,help &webButtons2=Web Buttons 2;text;bold,italic,underline,strikethrough,sub,sup,|,|,blockquote,bullist,numlist,outdent,indent,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,|,styleprops &webButtons3=Web Buttons 3;text; &webButtons4=Web Buttons 4;text; &webAlign=Web Toolbar Alignment;list;ltr,rtl;ltr &width=Width;text;95% &height=Height;text;500','0','');
INSERT INTO `modx_site_plugins` VALUES ('2','ManagerManager','<strong>0.3.11</strong> Customize the MODx Manager to offer bespoke admin functions for end users.','0','3','0','$js_default_url_local = $modx->config[\'site_url\']. \'/assets/js/jquery.min.js\';\n$js_default_url_remote = \'http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js\';\n$asset_path = $modx->config[\'base_path\'] . \'assets/plugins/managermanager/mm.inc.php\';\ninclude($asset_path);\n','0','&config_chunk=Configuration Chunk;text;mm_rules; &remove_deprecated_tv_types_pref=Remove deprecated TV types;list;yes,no;yes &which_jquery=jQuery source;list;local (assets/js),remote (google code),manual url (specify below);local (assets/js) &js_src_type=jQuery URL override;text;','0','');
INSERT INTO `modx_site_plugins` VALUES ('3','PSSGalleryPlugin','','0','0','0','include MODX_BASE_PATH.\"assets/plugins/pss_gallery/index.php\";','0','','0',' ');

# --------------------------------------------------------

#
# Table structure for table `modx_site_snippets`
#

DROP TABLE IF EXISTS `modx_site_snippets`;
CREATE TABLE `modx_site_snippets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Snippet',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Contains the site snippets.';

#
# Dumping data for table `modx_site_snippets`
#

INSERT INTO `modx_site_snippets` VALUES ('1','Wayfinder','<strong>2.0.1</strong> Completely template-driven and highly flexible menu builder','0','4','0','return require MODX_BASE_PATH.\'assets/snippets/wayfinder/snippet.wayfinder.php\';','0','','');
INSERT INTO `modx_site_snippets` VALUES ('2','if','<strong>1.2</strong> A simple conditional snippet. Allows for eq/neq/lt/gt/etc logic within templates, resources, chunks, etc.','0','4','0','return require MODX_BASE_PATH.\'assets/snippets/if/snippet.if.php\';','0','','');
INSERT INTO `modx_site_snippets` VALUES ('3','Ditto','<strong>2.1.1</strong> Summarizes and lists pages to create blogs, catalogs, PR archives, bio listings and more','0','5','0','return require MODX_BASE_PATH.\'assets/snippets/ditto/snippet.ditto.php\';','0','','');
INSERT INTO `modx_site_snippets` VALUES ('4','Breadcrumbs','<strong>1.0.3</strong> Configurable breadcrumb page-trail navigation','0','4','0','return require MODX_BASE_PATH.\'assets/snippets/breadcrumbs/snippet.breadcrumbs.php\';','0','','');
INSERT INTO `modx_site_snippets` VALUES ('5','multiTV','multi TV','0','0','0','\n/**\n * multiTV\n *\n * Custom Template Variabe containing a sortable multi item list or a datatable\n *\n * @category 	snippet, tv\n * @version 	1.8.1\n * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\n * @author      Jako\n * @internal	@modx_category Content\n * @internal    @installset base, sample\n */\nreturn require MODX_BASE_PATH . \'assets/tvs/multitv/multitv.snippet.php\';\n','0','',' ');
INSERT INTO `modx_site_snippets` VALUES ('6','PSSGallery','Галерея','0','0','0','\ninclude \'assets/snippets/pss_gallery/index.php\';\n','0','',' ');

# --------------------------------------------------------

#
# Table structure for table `modx_site_templates`
#

DROP TABLE IF EXISTS `modx_site_templates`;
CREATE TABLE `modx_site_templates` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `templatename` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Template',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to icon file',
  `template_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-page,1-content',
  `content` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Contains the site templates.';

#
# Dumping data for table `modx_site_templates`
#

INSERT INTO `modx_site_templates` VALUES ('3','Minimal Template','Default minimal empty template (content returned only)','0','0','','0','[*content*]','0');
INSERT INTO `modx_site_templates` VALUES ('4','MODxHost','<strong>1.0</strong> Legacy MODx Host template including dropdown menu','0','1','','0','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n\n<head>\n  <title>[(site_name)] | [*pagetitle*]</title>\n  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=[(modx_charset)]\" />\n  <base href=\"[(site_url)]\"></base>\n  <link rel=\"stylesheet\" href=\"assets/templates/modxhost/layout.css\" type=\"text/css\" media=\"screen\" />\n  <link rel=\"stylesheet\" href=\"assets/templates/modxhost/modxmenu.css\" type=\"text/css\" media=\"screen\" />\n  <link rel=\"stylesheet\" href=\"assets/templates/modxhost/form.css\" type=\"text/css\" media=\"screen\" />\n  <link rel=\"stylesheet\" href=\"assets/templates/modxhost/modx.css\" type=\"text/css\" media=\"screen\" />\n  <link rel=\"stylesheet\" href=\"assets/templates/modxhost/print.css\" type=\"text/css\" media=\"print\" />\n  <link rel=\"alternate\" type=\"application/rss+xml\" title=\"RSS 2.0\" href=\"[(site_url)][~11~]\" />\n  <script src=\"[(site_manager_url)]media/script/mootools/mootools.js\" type=\"text/javascript\"></script>\n  <script src=\"assets/templates/modxhost/drop_down_menu.js\" type=\"text/javascript\"></script>\n</head>\n<body>\n<div id=\"wrapper\">\n  <div id=\"minHeight\"></div>\n  <div id=\"outer\">\n    <div id=\"inner\">\n      <div id=\"right\">\n        <div id=\"right-inner\">\n          <h1 style=\"text-indent: -5000px;padding: 0px; margin:0px; font-size: 1px;\">[(site_name)]</h1>\n          <div id=\"sidebar\">\n            <h2>News:</h2>\n            [[Ditto? &parents=`2` &display=`2` &total=`20` &removeChunk=`Comments` &tpl=`nl_sidebar`]]\n            <div id=\"recentdocsctnr\">\n              <h2>Most Recent:</h2>\n				<a name=\"recentdocs\"></a><ul class=\"LIn_shortMode\">[[Ditto?parents=0&display=5&tpl=\'@CODE:<li><a href=\"[+url+]\" title=\"[+pagetitle+]\">[+pagetitle+]</a> <span class=\"LIn_date\">[+date+]</span> <span class=\"LIn_desc\"></span></li>\']]</ul> </div>\n            <h2>Login:</h2>\n            <div id=\"sidebarlogin\">[!WebLogin? &tpl=`WebLoginSideBar` &loginhomeid=`[(site_start)]`!]</div>\n            <h2>Meta:</h2>\n            <p><a href=\"http://validator.w3.org/check/referer\" title=\"This page validates as XHTML 1.0 Transitional\">Valid <abbr title=\"eXtensible HyperText Markup Language\">XHTML</abbr></a></p>\n            <p><a href=\"http://jigsaw.w3.org/css-validator/check/referer\" title=\"This page uses valid Cascading Stylesheets\" rel=\"external\">Valid <abbr title=\"W3C Cascading Stylesheets\">css</abbr></a></p>\n            <p><a href=\"http://modx.com\" title=\"Ajax CMS and PHP Application Framework\">MODX</a></p>\n          </div>\n          <!-- close #sidebar -->\n        </div>\n        <!-- end right inner-->\n      </div>\n      <!-- end right -->\n      <div id=\"left\">\n        <div id=\"left-inner\">\n          [[Breadcrumbs?]]\n          <div id=\"content\">\n            <div class=\"post\">\n              <h2>[*longtitle*]</h2>\n              [*#content*] </div>\n            <!-- close .post (main column content) -->\n          </div>\n          <!-- close #content -->\n        </div>\n        <!-- end left-inner -->\n      </div>\n      <!-- end left -->\n    </div>\n    <!-- end inner -->\n    <div id=\"clearfooter\"></div>\n    <div id=\"header\">\n      <h1><a id=\"logo\" href=\"[~[(site_start)]~]\" title=\"[(site_name)]\">[(site_name)]</a></h1>\n\n      <div id=\"search\"><!--search_terms--><span id=\"search-txt\">SEARCH</span><a name=\"search\"></a>[!AjaxSearch? &ajaxSearch=`1` &landingPage=`8` &moreResultsPage=`8` &addJscript=`0` &showIntro=`0` &ajaxMax=`5` &extract=`1`!]</div>\n      <div id=\"ajaxmenu\"> [[Wayfinder?startId=`0` &outerTpl=`mh.OuterTpl` &innerTpl=`mh.InnerTpl` &rowTpl=`mh.RowTpl` &innerRowTpl=`mh.InnerRowTpl` &firstClass=`first` &hereClass=``]] </div>\n      <!-- end topmenu -->\n    </div>\n    <!-- end header -->\n    <br style=\"clear:both;height:0;font-size: 1px\" />\n    <div id=\"footer\">\n      <p> <a href=\"http://modx.com\" title=\"Ajax CMS and PHP Application Framework\">Powered\n          by MODX</a> &nbsp;<a href=\"http://www.modx.com/\" title=\"Template Designed by modXhost.com\">Template &copy; 2006-2011\n          modXhost.com</a><br />\n        Memory: [^m^], MySQL: [^qt^], [^q^] request(s), PHP: [^p^], total: [^t^], document retrieved\n        from [^s^]. </p>\n    </div>\n    <!-- end footer -->\n  </div>\n  <!-- end outer div -->\n</div>\n<!-- end wrapper -->\n</body>\n</html>','0');
INSERT INTO `modx_site_templates` VALUES ('5','MainWin','Главная стр.','0','5','','0','<!DOCTYPE html>\n<html lang=\"ru\" dir=\"ltr\">\n{{HEAD}}\n<body>\n<div id=\"wrap\">\n<div class=\"wrapper row1 bg\"> {{HEADER}} </div>\n<div class=\"wrapper row2\"> \n   <div id=\"container\" class=\"clear\">\n    {{TOPMENU}}\n    <div id=\"homepage\">\n       <section id=\"latest\" class=\"clear\">\n       [[ PSSGallery? &startID=`3` &itemTpl=`tpl-image` &limit=`4` &randPreview=`1` &type=`custom` &thumbnailHeight=`315` ]] \n       </section>\n       <section id=\"shout\">[*introtext*]</section>\n       <div id=\"content\">\n           <section id=\"services\" class=\"last clear\">\n             <ul>\n       {{LAST_NEWS}}\n             </ul>\n           </section>\n       </div> <!-- end #content -->\n       {{ASIDE}}\n    </div> <!-- end #homepage -->\n   </div> <!-- end #container -->\n</div> <!-- end .row2 -->\n</div>\n<div class=\"wrapper row3\"> {{FOOTER}} </div>\n</body>\n</html>','0');
INSERT INTO `modx_site_templates` VALUES ('7','Win','Стандарт','0','5','','0','<!DOCTYPE html>\n<html lang=\"ru\" dir=\"ltr\">\n{{HEAD}}\n<body>\n<div id=\"wrap\">\n<div class=\"wrapper row1 bg\"> {{HEADER}} </div>\n<div class=\"wrapper row2\"> \n   <div id=\"container\" class=\"clear\">\n    {{TOPMENU}}\n    <div id=\"homepage\">\n      <section id=\"shout\" class=\"section\">\n        <h2>[*pagetitle*]</h2>\n        <div>[*introtext*]</div>\n      </section>\n      <div id=\"content\">\n<!-- share section -->\n         <section id=\"rotator\" class=\"last clear\">\n            <div id=\"gallery\" class=\"ad-gallery\">\n               <div class=\"ad-image-wrapper\"></div>\n               <div class=\"ad-controls\"></div>\n               <div class=\"ad-nav\">\n                  <div class=\"ad-thumbs\">\n                     <ul>\n       [[ PSSGallery? &type=`ad-gallery` &thumbnailWidth=`90` &galleryWidth=`600` &imgClass=`image[*id*]` ]]\n                     </ul>\n                  </div>\n               </div>\n           </div>\n        \n         </section>\n         <div>\n           [*content*]\n         </div>\n<!-- end share section -->\n      </div> <!-- end #content -->\n       {{ASIDE}}\n    </div> <!-- end #homepage -->\n   </div> <!-- end #container -->\n</div> <!-- end .row2 -->\n</div>\n<div class=\"wrapper row3\"> {{FOOTER}} </div>\n</body>\n</html>','0');

# --------------------------------------------------------

#
# Table structure for table `modx_site_tmplvar_access`
#

DROP TABLE IF EXISTS `modx_site_tmplvar_access`;
CREATE TABLE `modx_site_tmplvar_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tmplvarid` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for template variable access permissions.';

#
# Dumping data for table `modx_site_tmplvar_access`
#


# --------------------------------------------------------

#
# Table structure for table `modx_site_tmplvar_contentvalues`
#

DROP TABLE IF EXISTS `modx_site_tmplvar_contentvalues`;
CREATE TABLE `modx_site_tmplvar_contentvalues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tmplvarid` int(10) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `contentid` int(10) NOT NULL DEFAULT '0' COMMENT 'Site Content Id',
  `value` text,
  PRIMARY KEY (`id`),
  KEY `idx_tmplvarid` (`tmplvarid`),
  KEY `idx_id` (`contentid`),
  FULLTEXT KEY `value_ft_idx` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site Template Variables Content Values Link Table';

#
# Dumping data for table `modx_site_tmplvar_contentvalues`
#


# --------------------------------------------------------

#
# Table structure for table `modx_site_tmplvar_templates`
#

DROP TABLE IF EXISTS `modx_site_tmplvar_templates`;
CREATE TABLE `modx_site_tmplvar_templates` (
  `tmplvarid` int(10) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `templateid` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tmplvarid`,`templateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site Template Variables Templates Link Table';

#
# Dumping data for table `modx_site_tmplvar_templates`
#

INSERT INTO `modx_site_tmplvar_templates` VALUES ('1','4','0');
INSERT INTO `modx_site_tmplvar_templates` VALUES ('2','4','0');
INSERT INTO `modx_site_tmplvar_templates` VALUES ('3','5','0');
INSERT INTO `modx_site_tmplvar_templates` VALUES ('3','7','0');

# --------------------------------------------------------

#
# Table structure for table `modx_site_tmplvars`
#

DROP TABLE IF EXISTS `modx_site_tmplvars`;
CREATE TABLE `modx_site_tmplvars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `caption` varchar(80) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `elements` text,
  `rank` int(11) NOT NULL DEFAULT '0',
  `display` varchar(20) NOT NULL DEFAULT '' COMMENT 'Display Control',
  `display_params` text COMMENT 'Display Control Properties',
  `default_text` text,
  PRIMARY KEY (`id`),
  KEY `indx_rank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Site Template Variables';

#
# Dumping data for table `modx_site_tmplvars`
#

INSERT INTO `modx_site_tmplvars` VALUES ('1','text','documentTags','Tags','Space delimited tags for the current document','0','1','0','','0','','','');
INSERT INTO `modx_site_tmplvars` VALUES ('2','text','loginName','loginName','Conditional name for the Login menu item','0','1','0','','0','','','@EVAL if ($modx->getLoginUserID()) return \'Logout\'; else return \'Login\';');
INSERT INTO `modx_site_tmplvars` VALUES ('3','custom_tv','PSSGalleryTV','PSSGalleryTV','','0','0','0','@INCLUDE: assets/widgets/pss_gallery/index.php','0','','','');

# --------------------------------------------------------

#
# Table structure for table `modx_system_eventnames`
#

DROP TABLE IF EXISTS `modx_system_eventnames`;
CREATE TABLE `modx_system_eventnames` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `service` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'System Service number',
  `groupname` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 COMMENT='System Event Names.';

#
# Dumping data for table `modx_system_eventnames`
#

INSERT INTO `modx_system_eventnames` VALUES ('1','OnDocPublished','5','');
INSERT INTO `modx_system_eventnames` VALUES ('2','OnDocUnPublished','5','');
INSERT INTO `modx_system_eventnames` VALUES ('3','OnWebPagePrerender','5','');
INSERT INTO `modx_system_eventnames` VALUES ('4','OnWebLogin','3','');
INSERT INTO `modx_system_eventnames` VALUES ('5','OnBeforeWebLogout','3','');
INSERT INTO `modx_system_eventnames` VALUES ('6','OnWebLogout','3','');
INSERT INTO `modx_system_eventnames` VALUES ('7','OnWebSaveUser','3','');
INSERT INTO `modx_system_eventnames` VALUES ('8','OnWebDeleteUser','3','');
INSERT INTO `modx_system_eventnames` VALUES ('9','OnWebChangePassword','3','');
INSERT INTO `modx_system_eventnames` VALUES ('10','OnWebCreateGroup','3','');
INSERT INTO `modx_system_eventnames` VALUES ('11','OnManagerLogin','2','');
INSERT INTO `modx_system_eventnames` VALUES ('12','OnBeforeManagerLogout','2','');
INSERT INTO `modx_system_eventnames` VALUES ('13','OnManagerLogout','2','');
INSERT INTO `modx_system_eventnames` VALUES ('14','OnManagerSaveUser','2','');
INSERT INTO `modx_system_eventnames` VALUES ('15','OnManagerDeleteUser','2','');
INSERT INTO `modx_system_eventnames` VALUES ('16','OnManagerChangePassword','2','');
INSERT INTO `modx_system_eventnames` VALUES ('17','OnManagerCreateGroup','2','');
INSERT INTO `modx_system_eventnames` VALUES ('18','OnBeforeCacheUpdate','4','');
INSERT INTO `modx_system_eventnames` VALUES ('19','OnCacheUpdate','4','');
INSERT INTO `modx_system_eventnames` VALUES ('20','OnLoadWebPageCache','4','');
INSERT INTO `modx_system_eventnames` VALUES ('21','OnBeforeSaveWebPageCache','4','');
INSERT INTO `modx_system_eventnames` VALUES ('22','OnChunkFormPrerender','1','Chunks');
INSERT INTO `modx_system_eventnames` VALUES ('23','OnChunkFormRender','1','Chunks');
INSERT INTO `modx_system_eventnames` VALUES ('24','OnBeforeChunkFormSave','1','Chunks');
INSERT INTO `modx_system_eventnames` VALUES ('25','OnChunkFormSave','1','Chunks');
INSERT INTO `modx_system_eventnames` VALUES ('26','OnBeforeChunkFormDelete','1','Chunks');
INSERT INTO `modx_system_eventnames` VALUES ('27','OnChunkFormDelete','1','Chunks');
INSERT INTO `modx_system_eventnames` VALUES ('28','OnDocFormPrerender','1','Documents');
INSERT INTO `modx_system_eventnames` VALUES ('29','OnDocFormRender','1','Documents');
INSERT INTO `modx_system_eventnames` VALUES ('30','OnBeforeDocFormSave','1','Documents');
INSERT INTO `modx_system_eventnames` VALUES ('31','OnDocFormSave','1','Documents');
INSERT INTO `modx_system_eventnames` VALUES ('32','OnBeforeDocFormDelete','1','Documents');
INSERT INTO `modx_system_eventnames` VALUES ('33','OnDocFormDelete','1','Documents');
INSERT INTO `modx_system_eventnames` VALUES ('34','OnPluginFormPrerender','1','Plugins');
INSERT INTO `modx_system_eventnames` VALUES ('35','OnPluginFormRender','1','Plugins');
INSERT INTO `modx_system_eventnames` VALUES ('36','OnBeforePluginFormSave','1','Plugins');
INSERT INTO `modx_system_eventnames` VALUES ('37','OnPluginFormSave','1','Plugins');
INSERT INTO `modx_system_eventnames` VALUES ('38','OnBeforePluginFormDelete','1','Plugins');
INSERT INTO `modx_system_eventnames` VALUES ('39','OnPluginFormDelete','1','Plugins');
INSERT INTO `modx_system_eventnames` VALUES ('40','OnSnipFormPrerender','1','Snippets');
INSERT INTO `modx_system_eventnames` VALUES ('41','OnSnipFormRender','1','Snippets');
INSERT INTO `modx_system_eventnames` VALUES ('42','OnBeforeSnipFormSave','1','Snippets');
INSERT INTO `modx_system_eventnames` VALUES ('43','OnSnipFormSave','1','Snippets');
INSERT INTO `modx_system_eventnames` VALUES ('44','OnBeforeSnipFormDelete','1','Snippets');
INSERT INTO `modx_system_eventnames` VALUES ('45','OnSnipFormDelete','1','Snippets');
INSERT INTO `modx_system_eventnames` VALUES ('46','OnTempFormPrerender','1','Templates');
INSERT INTO `modx_system_eventnames` VALUES ('47','OnTempFormRender','1','Templates');
INSERT INTO `modx_system_eventnames` VALUES ('48','OnBeforeTempFormSave','1','Templates');
INSERT INTO `modx_system_eventnames` VALUES ('49','OnTempFormSave','1','Templates');
INSERT INTO `modx_system_eventnames` VALUES ('50','OnBeforeTempFormDelete','1','Templates');
INSERT INTO `modx_system_eventnames` VALUES ('51','OnTempFormDelete','1','Templates');
INSERT INTO `modx_system_eventnames` VALUES ('52','OnTVFormPrerender','1','Template Variables');
INSERT INTO `modx_system_eventnames` VALUES ('53','OnTVFormRender','1','Template Variables');
INSERT INTO `modx_system_eventnames` VALUES ('54','OnBeforeTVFormSave','1','Template Variables');
INSERT INTO `modx_system_eventnames` VALUES ('55','OnTVFormSave','1','Template Variables');
INSERT INTO `modx_system_eventnames` VALUES ('56','OnBeforeTVFormDelete','1','Template Variables');
INSERT INTO `modx_system_eventnames` VALUES ('57','OnTVFormDelete','1','Template Variables');
INSERT INTO `modx_system_eventnames` VALUES ('58','OnUserFormPrerender','1','Users');
INSERT INTO `modx_system_eventnames` VALUES ('59','OnUserFormRender','1','Users');
INSERT INTO `modx_system_eventnames` VALUES ('60','OnBeforeUserFormSave','1','Users');
INSERT INTO `modx_system_eventnames` VALUES ('61','OnUserFormSave','1','Users');
INSERT INTO `modx_system_eventnames` VALUES ('62','OnBeforeUserFormDelete','1','Users');
INSERT INTO `modx_system_eventnames` VALUES ('63','OnUserFormDelete','1','Users');
INSERT INTO `modx_system_eventnames` VALUES ('64','OnWUsrFormPrerender','1','Web Users');
INSERT INTO `modx_system_eventnames` VALUES ('65','OnWUsrFormRender','1','Web Users');
INSERT INTO `modx_system_eventnames` VALUES ('66','OnBeforeWUsrFormSave','1','Web Users');
INSERT INTO `modx_system_eventnames` VALUES ('67','OnWUsrFormSave','1','Web Users');
INSERT INTO `modx_system_eventnames` VALUES ('68','OnBeforeWUsrFormDelete','1','Web Users');
INSERT INTO `modx_system_eventnames` VALUES ('69','OnWUsrFormDelete','1','Web Users');
INSERT INTO `modx_system_eventnames` VALUES ('70','OnSiteRefresh','1','');
INSERT INTO `modx_system_eventnames` VALUES ('71','OnFileManagerUpload','1','');
INSERT INTO `modx_system_eventnames` VALUES ('72','OnModFormPrerender','1','Modules');
INSERT INTO `modx_system_eventnames` VALUES ('73','OnModFormRender','1','Modules');
INSERT INTO `modx_system_eventnames` VALUES ('74','OnBeforeModFormDelete','1','Modules');
INSERT INTO `modx_system_eventnames` VALUES ('75','OnModFormDelete','1','Modules');
INSERT INTO `modx_system_eventnames` VALUES ('76','OnBeforeModFormSave','1','Modules');
INSERT INTO `modx_system_eventnames` VALUES ('77','OnModFormSave','1','Modules');
INSERT INTO `modx_system_eventnames` VALUES ('78','OnBeforeWebLogin','3','');
INSERT INTO `modx_system_eventnames` VALUES ('79','OnWebAuthentication','3','');
INSERT INTO `modx_system_eventnames` VALUES ('80','OnBeforeManagerLogin','2','');
INSERT INTO `modx_system_eventnames` VALUES ('81','OnManagerAuthentication','2','');
INSERT INTO `modx_system_eventnames` VALUES ('82','OnSiteSettingsRender','1','System Settings');
INSERT INTO `modx_system_eventnames` VALUES ('83','OnFriendlyURLSettingsRender','1','System Settings');
INSERT INTO `modx_system_eventnames` VALUES ('84','OnUserSettingsRender','1','System Settings');
INSERT INTO `modx_system_eventnames` VALUES ('85','OnInterfaceSettingsRender','1','System Settings');
INSERT INTO `modx_system_eventnames` VALUES ('86','OnMiscSettingsRender','1','System Settings');
INSERT INTO `modx_system_eventnames` VALUES ('87','OnRichTextEditorRegister','1','RichText Editor');
INSERT INTO `modx_system_eventnames` VALUES ('88','OnRichTextEditorInit','1','RichText Editor');
INSERT INTO `modx_system_eventnames` VALUES ('89','OnManagerPageInit','2','');
INSERT INTO `modx_system_eventnames` VALUES ('90','OnWebPageInit','5','');
INSERT INTO `modx_system_eventnames` VALUES ('101','OnLoadDocumentObject','5','');
INSERT INTO `modx_system_eventnames` VALUES ('91','OnLoadWebDocument','5','');
INSERT INTO `modx_system_eventnames` VALUES ('92','OnParseDocument','5','');
INSERT INTO `modx_system_eventnames` VALUES ('93','OnManagerLoginFormRender','2','');
INSERT INTO `modx_system_eventnames` VALUES ('94','OnWebPageComplete','5','');
INSERT INTO `modx_system_eventnames` VALUES ('95','OnLogPageHit','5','');
INSERT INTO `modx_system_eventnames` VALUES ('96','OnBeforeManagerPageInit','2','');
INSERT INTO `modx_system_eventnames` VALUES ('97','OnBeforeEmptyTrash','1','Documents');
INSERT INTO `modx_system_eventnames` VALUES ('98','OnEmptyTrash','1','Documents');
INSERT INTO `modx_system_eventnames` VALUES ('99','OnManagerLoginFormPrerender','2','');
INSERT INTO `modx_system_eventnames` VALUES ('100','OnStripAlias','1','Documents');
INSERT INTO `modx_system_eventnames` VALUES ('200','OnCreateDocGroup','1','Documents');
INSERT INTO `modx_system_eventnames` VALUES ('201','OnManagerWelcomePrerender','2','');
INSERT INTO `modx_system_eventnames` VALUES ('202','OnManagerWelcomeHome','2','');
INSERT INTO `modx_system_eventnames` VALUES ('203','OnManagerWelcomeRender','2','');
INSERT INTO `modx_system_eventnames` VALUES ('204','OnBeforeDocDuplicate','1','Documents');
INSERT INTO `modx_system_eventnames` VALUES ('205','OnDocDuplicate','1','Documents');
INSERT INTO `modx_system_eventnames` VALUES ('206','OnManagerMainFrameHeaderHTMLBlock','2','');
INSERT INTO `modx_system_eventnames` VALUES ('207','OnManagerPreFrameLoader','2','');
INSERT INTO `modx_system_eventnames` VALUES ('208','OnManagerFrameLoader','2','');
INSERT INTO `modx_system_eventnames` VALUES ('209','OnManagerTreeInit','2','');
INSERT INTO `modx_system_eventnames` VALUES ('210','OnManagerTreePrerender','2','');
INSERT INTO `modx_system_eventnames` VALUES ('211','OnManagerTreeRender','2','');
INSERT INTO `modx_system_eventnames` VALUES ('212','OnManagerNodePrerender','2','');
INSERT INTO `modx_system_eventnames` VALUES ('213','OnManagerNodeRender','2','');
INSERT INTO `modx_system_eventnames` VALUES ('999','OnPageUnauthorized','1','');
INSERT INTO `modx_system_eventnames` VALUES ('1000','OnPageNotFound','1','');

# --------------------------------------------------------

#
# Table structure for table `modx_system_settings`
#

DROP TABLE IF EXISTS `modx_system_settings`;
CREATE TABLE `modx_system_settings` (
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`setting_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains Content Manager settings.';

#
# Dumping data for table `modx_system_settings`
#

INSERT INTO `modx_system_settings` VALUES ('manager_theme','MODxRE');
INSERT INTO `modx_system_settings` VALUES ('settings_version','1.0.12');
INSERT INTO `modx_system_settings` VALUES ('show_meta','0');
INSERT INTO `modx_system_settings` VALUES ('server_offset_time','0');
INSERT INTO `modx_system_settings` VALUES ('server_protocol','http');
INSERT INTO `modx_system_settings` VALUES ('manager_language','russian-UTF8');
INSERT INTO `modx_system_settings` VALUES ('modx_charset','UTF-8');
INSERT INTO `modx_system_settings` VALUES ('site_name','Управление Активами');
INSERT INTO `modx_system_settings` VALUES ('site_start','1');
INSERT INTO `modx_system_settings` VALUES ('error_page','1');
INSERT INTO `modx_system_settings` VALUES ('unauthorized_page','1');
INSERT INTO `modx_system_settings` VALUES ('site_status','1');
INSERT INTO `modx_system_settings` VALUES ('site_unavailable_message','The site is currently unavailable');
INSERT INTO `modx_system_settings` VALUES ('track_visitors','0');
INSERT INTO `modx_system_settings` VALUES ('top_howmany','10');
INSERT INTO `modx_system_settings` VALUES ('auto_template_logic','system');
INSERT INTO `modx_system_settings` VALUES ('default_template','3');
INSERT INTO `modx_system_settings` VALUES ('old_template','3');
INSERT INTO `modx_system_settings` VALUES ('publish_default','1');
INSERT INTO `modx_system_settings` VALUES ('cache_default','0');
INSERT INTO `modx_system_settings` VALUES ('search_default','1');
INSERT INTO `modx_system_settings` VALUES ('friendly_urls','0');
INSERT INTO `modx_system_settings` VALUES ('friendly_url_prefix','');
INSERT INTO `modx_system_settings` VALUES ('friendly_url_suffix','.html');
INSERT INTO `modx_system_settings` VALUES ('friendly_alias_urls','1');
INSERT INTO `modx_system_settings` VALUES ('use_alias_path','1');
INSERT INTO `modx_system_settings` VALUES ('use_udperms','1');
INSERT INTO `modx_system_settings` VALUES ('udperms_allowroot','0');
INSERT INTO `modx_system_settings` VALUES ('failed_login_attempts','3');
INSERT INTO `modx_system_settings` VALUES ('blocked_minutes','60');
INSERT INTO `modx_system_settings` VALUES ('use_captcha','0');
INSERT INTO `modx_system_settings` VALUES ('captcha_words','MODX,Access,Better,BitCode,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Tattoo,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote');
INSERT INTO `modx_system_settings` VALUES ('emailsender','tarkvsg@gmail.com');
INSERT INTO `modx_system_settings` VALUES ('email_method','mail');
INSERT INTO `modx_system_settings` VALUES ('smtp_auth','0');
INSERT INTO `modx_system_settings` VALUES ('smtp_host','');
INSERT INTO `modx_system_settings` VALUES ('smtp_port','25');
INSERT INTO `modx_system_settings` VALUES ('smtp_username','');
INSERT INTO `modx_system_settings` VALUES ('emailsubject','Your login details');
INSERT INTO `modx_system_settings` VALUES ('number_of_logs','100');
INSERT INTO `modx_system_settings` VALUES ('number_of_messages','30');
INSERT INTO `modx_system_settings` VALUES ('number_of_results','20');
INSERT INTO `modx_system_settings` VALUES ('use_editor','1');
INSERT INTO `modx_system_settings` VALUES ('use_browser','1');
INSERT INTO `modx_system_settings` VALUES ('rb_base_dir','/var/www/gorod/assets/');
INSERT INTO `modx_system_settings` VALUES ('rb_base_url','assets/');
INSERT INTO `modx_system_settings` VALUES ('which_editor','TinyMCE');
INSERT INTO `modx_system_settings` VALUES ('fe_editor_lang','russian-UTF8');
INSERT INTO `modx_system_settings` VALUES ('fck_editor_toolbar','standard');
INSERT INTO `modx_system_settings` VALUES ('fck_editor_autolang','0');
INSERT INTO `modx_system_settings` VALUES ('editor_css_path','');
INSERT INTO `modx_system_settings` VALUES ('editor_css_selectors','');
INSERT INTO `modx_system_settings` VALUES ('strip_image_paths','1');
INSERT INTO `modx_system_settings` VALUES ('upload_images','bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff');
INSERT INTO `modx_system_settings` VALUES ('upload_media','au,avi,mp3,mp4,mpeg,mpg,wav,wmv');
INSERT INTO `modx_system_settings` VALUES ('upload_flash','fla,flv,swf');
INSERT INTO `modx_system_settings` VALUES ('upload_files','aac,au,avi,css,cache,doc,docx,gz,gzip,htaccess,htm,html,js,mp3,mp4,mpeg,mpg,ods,odp,odt,pdf,ppt,pptx,rar,tar,tgz,txt,wav,wmv,xls,xlsx,xml,z,zip');
INSERT INTO `modx_system_settings` VALUES ('upload_maxsize','1048576');
INSERT INTO `modx_system_settings` VALUES ('new_file_permissions','0644');
INSERT INTO `modx_system_settings` VALUES ('new_folder_permissions','0755');
INSERT INTO `modx_system_settings` VALUES ('filemanager_path','/var/www/gorod/');
INSERT INTO `modx_system_settings` VALUES ('theme_refresher','');
INSERT INTO `modx_system_settings` VALUES ('manager_layout','4');
INSERT INTO `modx_system_settings` VALUES ('custom_contenttype','application/rss+xml,application/pdf,application/vnd.ms-word,application/vnd.ms-excel,text/html,text/css,text/xml,text/javascript,text/plain,application/json');
INSERT INTO `modx_system_settings` VALUES ('auto_menuindex','1');
INSERT INTO `modx_system_settings` VALUES ('session.cookie.lifetime','604800');
INSERT INTO `modx_system_settings` VALUES ('mail_check_timeperiod','3660');
INSERT INTO `modx_system_settings` VALUES ('manager_direction','ltr');
INSERT INTO `modx_system_settings` VALUES ('tinymce_editor_theme','editor');
INSERT INTO `modx_system_settings` VALUES ('tinymce_custom_plugins','style,advimage,advlink,searchreplace,print,contextmenu,paste,fullscreen,nonbreaking,xhtmlxtras,visualchars,media');
INSERT INTO `modx_system_settings` VALUES ('tinymce_custom_buttons1','undo,redo,selectall,separator,pastetext,pasteword,separator,search,replace,separator,nonbreaking,hr,charmap,separator,image,link,unlink,anchor,media,separator,cleanup,removeformat,separator,fullscreen,print,code,help');
INSERT INTO `modx_system_settings` VALUES ('tinymce_custom_buttons2','bold,italic,underline,strikethrough,sub,sup,separator,bullist,numlist,outdent,indent,separator,justifyleft,justifycenter,justifyright,justifyfull,separator,styleselect,formatselect,separator,styleprops');
INSERT INTO `modx_system_settings` VALUES ('tree_show_protected','0');
INSERT INTO `modx_system_settings` VALUES ('rss_url_news','http://feeds.feedburner.com/modx-announce');
INSERT INTO `modx_system_settings` VALUES ('rss_url_security','http://feeds.feedburner.com/modxsecurity');
INSERT INTO `modx_system_settings` VALUES ('validate_referer','1');
INSERT INTO `modx_system_settings` VALUES ('datepicker_offset','-10');
INSERT INTO `modx_system_settings` VALUES ('xhtml_urls','1');
INSERT INTO `modx_system_settings` VALUES ('allow_duplicate_alias','0');
INSERT INTO `modx_system_settings` VALUES ('automatic_alias','1');
INSERT INTO `modx_system_settings` VALUES ('datetime_format','dd-mm-YYYY');
INSERT INTO `modx_system_settings` VALUES ('warning_visibility','1');
INSERT INTO `modx_system_settings` VALUES ('remember_last_tab','0');
INSERT INTO `modx_system_settings` VALUES ('enable_bindings','1');
INSERT INTO `modx_system_settings` VALUES ('seostrict','0');
INSERT INTO `modx_system_settings` VALUES ('cache_type','1');
INSERT INTO `modx_system_settings` VALUES ('maxImageWidth','1600');
INSERT INTO `modx_system_settings` VALUES ('maxImageHeight','1200');
INSERT INTO `modx_system_settings` VALUES ('thumbWidth','150');
INSERT INTO `modx_system_settings` VALUES ('thumbHeight','150');
INSERT INTO `modx_system_settings` VALUES ('thumbsDir','.thumbs');
INSERT INTO `modx_system_settings` VALUES ('jpegQuality','90');
INSERT INTO `modx_system_settings` VALUES ('denyZipDownload','0');
INSERT INTO `modx_system_settings` VALUES ('denyExtensionRename','0');
INSERT INTO `modx_system_settings` VALUES ('showHiddenFiles','0');
INSERT INTO `modx_system_settings` VALUES ('docid_incrmnt_method','0');
INSERT INTO `modx_system_settings` VALUES ('make_folders','0');
INSERT INTO `modx_system_settings` VALUES ('site_id','5310d21e4b9cd');
INSERT INTO `modx_system_settings` VALUES ('site_unavailable_page','');
INSERT INTO `modx_system_settings` VALUES ('reload_site_unavailable','');
INSERT INTO `modx_system_settings` VALUES ('siteunavailable_message_default','В настоящее время сайт недоступен.');
INSERT INTO `modx_system_settings` VALUES ('check_files_onlogin','index.php\n.htaccess\nmanager/index.php\nmanager/includes/config.inc.php');
INSERT INTO `modx_system_settings` VALUES ('error_reporting','1');
INSERT INTO `modx_system_settings` VALUES ('send_errormail','3');
INSERT INTO `modx_system_settings` VALUES ('pwd_hash_algo','UNCRYPT');
INSERT INTO `modx_system_settings` VALUES ('reload_captcha_words','');
INSERT INTO `modx_system_settings` VALUES ('captcha_words_default','MODX,Access,Better,BitCode,Chunk,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Oscope,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Tattoo,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote');
INSERT INTO `modx_system_settings` VALUES ('reload_emailsubject','');
INSERT INTO `modx_system_settings` VALUES ('emailsubject_default','Данные для авторизации');
INSERT INTO `modx_system_settings` VALUES ('reload_signupemail_message','');
INSERT INTO `modx_system_settings` VALUES ('signupemail_message','Здравствуйте, [+uid+]!\n\nВаши данные для авторизации в системе управления сайтом [+sname+]:\n\nИмя пользователя: [+uid+]\nПароль: [+pwd+]\n\nПосле успешной авторизации в системе управления сайтом ([+surl+]), вы сможете изменить свой пароль.\n\nС уважением, Администрация');
INSERT INTO `modx_system_settings` VALUES ('system_email_signup_default','Здравствуйте, [+uid+]!\n\nВаши данные для авторизации в системе управления сайтом [+sname+]:\n\nИмя пользователя: [+uid+]\nПароль: [+pwd+]\n\nПосле успешной авторизации в системе управления сайтом ([+surl+]), вы сможете изменить свой пароль.\n\nС уважением, Администрация');
INSERT INTO `modx_system_settings` VALUES ('reload_websignupemail_message','');
INSERT INTO `modx_system_settings` VALUES ('websignupemail_message','Здравствуйте, [+uid+]!\n\nВаши данные для авторизации на [+sname+]:\n\nИмя пользователя: [+uid+]\nПароль: [+pwd+]\n\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\n\nС уважением, Администрация');
INSERT INTO `modx_system_settings` VALUES ('system_email_websignup_default','Здравствуйте, [+uid+]!\n\nВаши данные для авторизации на [+sname+]:\n\nИмя пользователя: [+uid+]\nПароль: [+pwd+]\n\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\n\nС уважением, Администрация');
INSERT INTO `modx_system_settings` VALUES ('reload_system_email_webreminder_message','');
INSERT INTO `modx_system_settings` VALUES ('webpwdreminder_message','Здравствуйте, [+uid+]!\n\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\n\n[+surl+]\n\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\n\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\n\nС уважением, Администрация');
INSERT INTO `modx_system_settings` VALUES ('system_email_webreminder_default','Здравствуйте, [+uid+]!\n\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\n\n[+surl+]\n\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\n\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\n\nС уважением, Администрация');
INSERT INTO `modx_system_settings` VALUES ('tree_page_click','27');
INSERT INTO `modx_system_settings` VALUES ('resource_tree_node_name','pagetitle');
INSERT INTO `modx_system_settings` VALUES ('rb_webuser','0');
INSERT INTO `modx_system_settings` VALUES ('clean_uploaded_filename','1');
INSERT INTO `modx_system_settings` VALUES ('mce_editor_skin','default');
INSERT INTO `modx_system_settings` VALUES ('mce_template_docs','');
INSERT INTO `modx_system_settings` VALUES ('mce_template_chunks','');
INSERT INTO `modx_system_settings` VALUES ('mce_entermode','p');
INSERT INTO `modx_system_settings` VALUES ('mce_element_format','xhtml');
INSERT INTO `modx_system_settings` VALUES ('mce_schema','html4');
INSERT INTO `modx_system_settings` VALUES ('tinymce_custom_buttons3','');
INSERT INTO `modx_system_settings` VALUES ('tinymce_custom_buttons4','');
INSERT INTO `modx_system_settings` VALUES ('tinymce_css_selectors','left=justifyleft;right=justifyright');
INSERT INTO `modx_system_settings` VALUES ('sys_files_checksum','a:3:{s:24:\"/var/www/gorod/index.php\";s:32:\"cd008df3faa7d7ecbce5b05480fa8c34\";s:32:\"/var/www/gorod/manager/index.php\";s:32:\"ef228d1a7e707d376ab4e2ec314c7f6c\";s:46:\"/var/www/gorod/manager/includes/config.inc.php\";s:32:\"d069929adb89a20d62db1c011b6c31f9\";}');

# --------------------------------------------------------

#
# Table structure for table `modx_user_attributes`
#

DROP TABLE IF EXISTS `modx_user_attributes`;
CREATE TABLE `modx_user_attributes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(5) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `userid` (`internalKey`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Contains information about the backend users.';

#
# Dumping data for table `modx_user_attributes`
#

INSERT INTO `modx_user_attributes` VALUES ('1','1','Default admin account','1','tarkvsg@gmail.com','','','0','0','0','8','1395166114','1395250586','0','knn6io8mrrb0tattl4qle8c0h1','0','0','','','','','','','','');

# --------------------------------------------------------

#
# Table structure for table `modx_user_messages`
#

DROP TABLE IF EXISTS `modx_user_messages`;
CREATE TABLE `modx_user_messages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(15) NOT NULL DEFAULT '',
  `subject` varchar(60) NOT NULL DEFAULT '',
  `message` text,
  `sender` int(10) NOT NULL DEFAULT '0',
  `recipient` int(10) NOT NULL DEFAULT '0',
  `private` tinyint(4) NOT NULL DEFAULT '0',
  `postdate` int(20) NOT NULL DEFAULT '0',
  `messageread` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains messages for the Content Manager messaging system.';

#
# Dumping data for table `modx_user_messages`
#


# --------------------------------------------------------

#
# Table structure for table `modx_user_roles`
#

DROP TABLE IF EXISTS `modx_user_roles`;
CREATE TABLE `modx_user_roles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `frames` int(1) NOT NULL DEFAULT '0',
  `home` int(1) NOT NULL DEFAULT '0',
  `view_document` int(1) NOT NULL DEFAULT '0',
  `new_document` int(1) NOT NULL DEFAULT '0',
  `save_document` int(1) NOT NULL DEFAULT '0',
  `publish_document` int(1) NOT NULL DEFAULT '0',
  `delete_document` int(1) NOT NULL DEFAULT '0',
  `empty_trash` int(1) NOT NULL DEFAULT '0',
  `action_ok` int(1) NOT NULL DEFAULT '0',
  `logout` int(1) NOT NULL DEFAULT '0',
  `help` int(1) NOT NULL DEFAULT '0',
  `messages` int(1) NOT NULL DEFAULT '0',
  `new_user` int(1) NOT NULL DEFAULT '0',
  `edit_user` int(1) NOT NULL DEFAULT '0',
  `logs` int(1) NOT NULL DEFAULT '0',
  `edit_parser` int(1) NOT NULL DEFAULT '0',
  `save_parser` int(1) NOT NULL DEFAULT '0',
  `edit_template` int(1) NOT NULL DEFAULT '0',
  `settings` int(1) NOT NULL DEFAULT '0',
  `credits` int(1) NOT NULL DEFAULT '0',
  `new_template` int(1) NOT NULL DEFAULT '0',
  `save_template` int(1) NOT NULL DEFAULT '0',
  `delete_template` int(1) NOT NULL DEFAULT '0',
  `edit_snippet` int(1) NOT NULL DEFAULT '0',
  `new_snippet` int(1) NOT NULL DEFAULT '0',
  `save_snippet` int(1) NOT NULL DEFAULT '0',
  `delete_snippet` int(1) NOT NULL DEFAULT '0',
  `edit_chunk` int(1) NOT NULL DEFAULT '0',
  `new_chunk` int(1) NOT NULL DEFAULT '0',
  `save_chunk` int(1) NOT NULL DEFAULT '0',
  `delete_chunk` int(1) NOT NULL DEFAULT '0',
  `empty_cache` int(1) NOT NULL DEFAULT '0',
  `edit_document` int(1) NOT NULL DEFAULT '0',
  `change_password` int(1) NOT NULL DEFAULT '0',
  `error_dialog` int(1) NOT NULL DEFAULT '0',
  `about` int(1) NOT NULL DEFAULT '0',
  `file_manager` int(1) NOT NULL DEFAULT '0',
  `save_user` int(1) NOT NULL DEFAULT '0',
  `delete_user` int(1) NOT NULL DEFAULT '0',
  `save_password` int(11) NOT NULL DEFAULT '0',
  `edit_role` int(1) NOT NULL DEFAULT '0',
  `save_role` int(1) NOT NULL DEFAULT '0',
  `delete_role` int(1) NOT NULL DEFAULT '0',
  `new_role` int(1) NOT NULL DEFAULT '0',
  `access_permissions` int(1) NOT NULL DEFAULT '0',
  `bk_manager` int(1) NOT NULL DEFAULT '0',
  `new_plugin` int(1) NOT NULL DEFAULT '0',
  `edit_plugin` int(1) NOT NULL DEFAULT '0',
  `save_plugin` int(1) NOT NULL DEFAULT '0',
  `delete_plugin` int(1) NOT NULL DEFAULT '0',
  `new_module` int(1) NOT NULL DEFAULT '0',
  `edit_module` int(1) NOT NULL DEFAULT '0',
  `save_module` int(1) NOT NULL DEFAULT '0',
  `delete_module` int(1) NOT NULL DEFAULT '0',
  `exec_module` int(1) NOT NULL DEFAULT '0',
  `view_eventlog` int(1) NOT NULL DEFAULT '0',
  `delete_eventlog` int(1) NOT NULL DEFAULT '0',
  `manage_metatags` int(1) NOT NULL DEFAULT '0' COMMENT 'manage site meta tags and keywords',
  `edit_doc_metatags` int(1) NOT NULL DEFAULT '0' COMMENT 'edit document meta tags and keywords',
  `new_web_user` int(1) NOT NULL DEFAULT '0',
  `edit_web_user` int(1) NOT NULL DEFAULT '0',
  `save_web_user` int(1) NOT NULL DEFAULT '0',
  `delete_web_user` int(1) NOT NULL DEFAULT '0',
  `web_access_permissions` int(1) NOT NULL DEFAULT '0',
  `view_unpublished` int(1) NOT NULL DEFAULT '0',
  `import_static` int(1) NOT NULL DEFAULT '0',
  `export_static` int(1) NOT NULL DEFAULT '0',
  `remove_locks` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Contains information describing the user roles.';

#
# Dumping data for table `modx_user_roles`
#

INSERT INTO `modx_user_roles` VALUES ('2','Editor','Limited to managing content','1','1','1','1','1','1','1','0','1','1','1','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','1','0','1','0','1','1','1','1','1','1','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','1','0','0','1');
INSERT INTO `modx_user_roles` VALUES ('3','Publisher','Editor with expanded permissions including manage users, update Elements and site settings','1','1','1','1','1','1','1','1','1','1','1','0','1','1','1','0','0','1','1','1','1','1','1','0','0','0','0','1','1','1','1','1','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','0','0','0','0','0','0','1','0','0','0','0','1','1','1','1','0','1','0','0','1');
INSERT INTO `modx_user_roles` VALUES ('1','Administrator','Site administrators have full access to all functions','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1');

# --------------------------------------------------------

#
# Table structure for table `modx_user_settings`
#

DROP TABLE IF EXISTS `modx_user_settings`;
CREATE TABLE `modx_user_settings` (
  `user` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`user`,`setting_name`),
  KEY `setting_name` (`setting_name`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains backend user settings.';

#
# Dumping data for table `modx_user_settings`
#


# --------------------------------------------------------

#
# Table structure for table `modx_web_groups`
#

DROP TABLE IF EXISTS `modx_web_groups`;
CREATE TABLE `modx_web_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `webgroup` int(10) NOT NULL DEFAULT '0',
  `webuser` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_group_user` (`webgroup`,`webuser`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.';

#
# Dumping data for table `modx_web_groups`
#


# --------------------------------------------------------

#
# Table structure for table `modx_web_user_attributes`
#

DROP TABLE IF EXISTS `modx_web_user_attributes`;
CREATE TABLE `modx_web_user_attributes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(25) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `userid` (`internalKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains information for web users.';

#
# Dumping data for table `modx_web_user_attributes`
#


# --------------------------------------------------------

#
# Table structure for table `modx_web_user_settings`
#

DROP TABLE IF EXISTS `modx_web_user_settings`;
CREATE TABLE `modx_web_user_settings` (
  `webuser` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`webuser`,`setting_name`),
  KEY `setting_name` (`setting_name`),
  KEY `webuserid` (`webuser`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains web user settings.';

#
# Dumping data for table `modx_web_user_settings`
#


# --------------------------------------------------------

#
# Table structure for table `modx_web_users`
#

DROP TABLE IF EXISTS `modx_web_users`;
CREATE TABLE `modx_web_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `cachepwd` varchar(100) NOT NULL DEFAULT '' COMMENT 'Store new unconfirmed password',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table `modx_web_users`
#


# --------------------------------------------------------

#
# Table structure for table `modx_webgroup_access`
#

DROP TABLE IF EXISTS `modx_webgroup_access`;
CREATE TABLE `modx_webgroup_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `webgroup` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.';

#
# Dumping data for table `modx_webgroup_access`
#


# --------------------------------------------------------

#
# Table structure for table `modx_webgroup_names`
#

DROP TABLE IF EXISTS `modx_webgroup_names`;
CREATE TABLE `modx_webgroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.';

#
# Dumping data for table `modx_webgroup_names`
#
